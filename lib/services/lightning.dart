import 'dart:math';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter/widgets.dart';
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart';
import 'package:boringssl_ffi/boringssl_ffi.dart' as bssl;
import 'package:secp256k1_ffi/secp256k1_ffi.dart';
import 'package:uuid/uuid.dart';

import '../signer/types.dart';
import '../src/proto/spark.pb.dart';

import '../errors/types.dart'; // SparkRequestError, SparkValidationError
import '../graphql/objects/lightning_receive_request.dart';
import '../src/proto/spark.pbgrpc.dart'; // InitiatePreimageSwapRequest_Reason, InitiatePreimageSwapResponse, ProvidePreimageResponse, QueryUserSignedRefundsResponse, SecretShare, Transfer, StartTransferRequest, UserSignedRefund
import '../spark_bindings/spark_bindings.dart'; // getSparkFrost
import '../utils/bitcoin.dart'; // getTxFromRawTxBytes
import '../utils/hex.dart'; // hexToBytes, bytesToNumberBE, numberToBytesBE
import '../utils/idempotency.dart'; // optionsWithIdempotencyKey, IdempotencyOptions
import 'bolt11_spark.dart'; // decodeInvoice
import 'config.dart';
import 'connection/connection.dart';
import 'signing.dart';
import 'transfer.dart'; // LeafKeyTweak

typedef InvoiceCreator =
    Future<LightningReceiveRequest?> Function(
      int amountSats,
      Uint8List paymentHash, {
      String? memo,
      String? receiverIdentityPubkey,
      String? descriptionHash,
    });

class CreateLightningInvoiceParams {
  final InvoiceCreator invoiceCreator;
  final int amountSats;
  final String? memo;
  final String? receiverIdentityPubkey;
  final String? descriptionHash;

  CreateLightningInvoiceParams({
    required this.invoiceCreator,
    required this.amountSats,
    this.memo,
    this.receiverIdentityPubkey,
    this.descriptionHash,
  });
}

class CreateLightningInvoiceWithPreimageParams
    extends CreateLightningInvoiceParams {
  final Uint8List preimage;

  CreateLightningInvoiceWithPreimageParams({
    required this.preimage,
    required super.invoiceCreator,
    required super.amountSats,
    super.memo,
    super.receiverIdentityPubkey,
    super.descriptionHash,
  });
}

class SwapNodesForPreimageParams implements IdempotencyOptions {
  final List<LeafKeyTweak> leaves;
  final Uint8List receiverIdentityPubkey;
  final Uint8List paymentHash;
  final String? invoiceString;
  final bool isInboundPayment;
  final BigInt? feeSats;
  final BigInt? amountSatsToSend;
  final StartTransferRequest? startTransferRequest;
  final DateTime? expiryTime;
  final String? transferID;

  @override
  final String? idempotencyKey;

  SwapNodesForPreimageParams({
    required this.leaves,
    required this.receiverIdentityPubkey,
    required this.paymentHash,
    this.invoiceString,
    required this.isInboundPayment,
    this.feeSats,
    this.amountSatsToSend,
    this.startTransferRequest,
    this.expiryTime,
    this.transferID,
    this.idempotencyKey,
  });
}

class LightningService {
  final WalletConfigService config;
  final ConnectionManager connectionManager;
  final SigningService signingService;

  // Reusable UUID generator for the service
  final Uuid _uuid = const Uuid();

  LightningService(this.config, this.connectionManager, this.signingService);

  Future<LightningReceiveRequest> createLightningInvoice(
    CreateLightningInvoiceParams params,
  ) async {
    // Generate 32 secure random bytes
    final rand = Random.secure();
    final randBytes = Uint8List.fromList(
      List.generate(32, (_) => rand.nextInt(256)),
    );

    final curveOrder = bytesToBigIntBE(secp256k1FFI.constants.n);

    // Assuming bytesToBigIntBE maps to your @noble/curves/utils bytesToNumberBE equivalent
    final randNum = bytesToBigIntBE(randBytes);
    final preimageNum = randNum % curveOrder;
    final preimage = bigIntToBytesBE(preimageNum, 32);

    return await createLightningInvoiceWithPreImage(
      CreateLightningInvoiceWithPreimageParams(
        invoiceCreator: params.invoiceCreator,
        amountSats: params.amountSats,
        memo: params.memo,
        preimage: preimage,
        receiverIdentityPubkey: params.receiverIdentityPubkey,
        descriptionHash: params.descriptionHash,
      ),
    );
  }

  Future<LightningReceiveRequest> createLightningInvoiceWithPreImage(
    CreateLightningInvoiceWithPreimageParams params,
  ) async {
    final paymentHash = bssl.sha256.hash(params.preimage)!;
    final invoice = await params.invoiceCreator(
      params.amountSats,
      Uint8List.fromList(paymentHash),
      memo: params.memo,
      receiverIdentityPubkey: params.receiverIdentityPubkey,
      descriptionHash: params.descriptionHash,
    );

    if (invoice == null) {
      throw SparkValidationError(
        "Failed to create lightning invoice",
        context: {
          'field': "invoice",
          'value': null,
          'expected': "Non-null invoice",
        },
      );
    }

    final curveOrder = bytesToBigIntBE(secp256k1FFI.constants.n);

    final signingOperators = config.getSigningOperators();
    final shares = await config.signer.splitSecretWithProofs(
      SplitSecretWithProofsParams(
        secret: params.preimage,
        curveOrder: curveOrder,
        threshold: config.getThreshold(),
        numShares: signingOperators.length,
      ),
    );

    final sparkFrost = getSparkFrost();
    final encryptedShares = <String, Uint8List>{};

    for (final entry in signingOperators.entries) {
      final identifier = entry.key;
      final operator = entry.value;
      final share = shares.elementAtOrNull(operator.id);

      if (share == null) {
        throw SparkValidationError(
          "Share not found for operator",
          context: {
            'field': "share",
            'value': operator.id,
            'expected': "Non-null share",
          },
        );
      }

      final shareProto = SecretShare(
        secretShare: share
            .share, // Ensure these map to your SecretShare class properties
        proofs: share.proofs,
      );
      final shareBytes = shareProto.writeToBuffer();

      final encrypted = await sparkFrost.encryptEcies(
        shareBytes,
        hexToBytes(operator.identityPublicKey),
      );
      encryptedShares[identifier] = Uint8List.fromList(encrypted);
    }

    final invoiceString = invoice.invoice.encodedInvoice;
    final threshold = config.getThreshold();

    final userIdentityPublicKey = params.receiverIdentityPubkey != null
        ? hexToBytes(params.receiverIdentityPubkey!)
        : await config.signer.getIdentityPublicKey();

    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    try {
      await sparkClient.store_preimage_share_v2(
        StorePreimageShareV2Request(
          // Maps to proto class
          paymentHash: paymentHash,
          encryptedPreimageShares: encryptedShares.entries,
          threshold: threshold,
          invoiceString: invoiceString,
          userIdentityPublicKey: userIdentityPublicKey,
        ),
      );
    } catch (error) {
      throw SparkRequestError(
        "Failed to store preimage shares",
        context: {'operation': "store_preimage_share_v2", 'error': error},
      );
    }

    return invoice;
  }

  Future<InitiatePreimageSwapResponse> swapNodesForPreimage(
    SwapNodesForPreimageParams params,
  ) async {
    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    // Get signing commitments for all transaction types in one coordinated call
    GetSigningCommitmentsResponse signingCommitments;
    try {
      signingCommitments = await sparkClient.get_signing_commitments(
        GetSigningCommitmentsRequest(
          nodeIds: params.leaves.map((leaf) => leaf.leaf.id).toList(),
          count: 3,
        ),
      );
    } catch (error) {
      throw SparkRequestError(
        "Failed to get signing commitments",
        context: {'operation': "get_signing_commitments", 'error': error},
      );
    }

    final signRefundsResult = await signingService.signRefunds(
      params.leaves,
      signingCommitments.signingCommitments.sublist(0, params.leaves.length),
      signingCommitments.signingCommitments.sublist(
        params.leaves.length,
        2 * params.leaves.length,
      ),
      signingCommitments.signingCommitments.sublist(2 * params.leaves.length),
    );

    final cpfpLeafSigningJobs = signRefundsResult.cpfpLeafSigningJobs;
    final directLeafSigningJobs = signRefundsResult.directLeafSigningJobs;
    final directFromCpfpLeafSigningJobs =
        signRefundsResult.directFromCpfpLeafSigningJobs;

    debugPrint("cpfpLeafSigningJobs list");
    for (final (index, v) in cpfpLeafSigningJobs.indexed) {
      debugPrint("$index: ${hex.encode(v.job.rawTx)}");
    }

    debugPrint("directLeafSigningJobs list");
    for (final (index, v) in directLeafSigningJobs.indexed) {
      debugPrint("$index: ${hex.encode(v.job.rawTx)}");
    }

    debugPrint("directFromCpfpLeafSigningJobs list");
    for (final (index, v) in directFromCpfpLeafSigningJobs.indexed) {
      debugPrint("$index: ${hex.encode(v.job.rawTx)}");
    }

    final transferId = params.transferID ?? _uuid.v7();
    String bolt11String = "";
    BigInt amountSats = BigInt.zero;

    if (params.invoiceString != null) {
      final decodedInvoice = decodeInvoice(params.invoiceString!);
      BigInt amountMsats = BigInt.zero;
      try {
        amountMsats = decodedInvoice.amountMSats ?? BigInt.zero;
      } catch (error) {
        print("Error decoding invoice: $error");
      }

      final isZeroAmountInvoice = amountMsats == 0;

      if (isZeroAmountInvoice && params.amountSatsToSend == null) {
        throw SparkValidationError(
          "Invalid amount. User must specify amountSatsToSend for 0 amount lightning invoice",
          context: {
            'field': "amountSatsToSend",
            'value': params.amountSatsToSend,
            'expected': "positive number",
          },
        );
      }

      amountSats = isZeroAmountInvoice
          ? params.amountSatsToSend!
          : ((amountMsats + BigInt.from(999)) ~/ BigInt.from(1000));

      if (amountSats <= BigInt.zero) {
        // Dart doesn't have an isNaN for ints
        throw SparkValidationError(
          "Invalid amount",
          context: {
            'field': "amountSats",
            'value': amountSats,
            'expected': "greater than 0",
          },
        );
      }

      bolt11String = params.invoiceString!;
    }

    final reason = params.isInboundPayment
        ? InitiatePreimageSwapRequest_Reason.REASON_RECEIVE
        : InitiatePreimageSwapRequest_Reason.REASON_SEND;

    InitiatePreimageSwapResponse response;

    // TODO(LIG-8126): Remove transfer inputs once SDK upgrade is complete
    try {
      // Build the TransferRequest to handle the complex optional logic
      final transferRequestObj = StartUserSignedTransferRequest(
        transferId: transferId,
        ownerIdentityPublicKey: await config.signer.getIdentityPublicKey(),
        leavesToSend: cpfpLeafSigningJobs.map<UserSignedTxSigningJob>(
          (v) => v.job,
        ).toList(),
        directLeavesToSend: params.startTransferRequest != null
            ? []
            : directLeafSigningJobs.map<UserSignedTxSigningJob>((v) => v.job).toList(),
        directFromCpfpLeavesToSend: params.startTransferRequest != null
            ? []
            : directFromCpfpLeafSigningJobs.map<UserSignedTxSigningJob>(
                (v) => v.job,
              ).toList(),
        receiverIdentityPublicKey: params.receiverIdentityPubkey,
        expiryTime: (params.expiryTime==null) ? null : Timestamp.fromDateTime(params.expiryTime!),
      );

      final req = InitiatePreimageSwapRequest(
        paymentHash: params.paymentHash,
        invoiceAmount: InvoiceAmount(
          invoiceAmountProof: InvoiceAmountProof(bolt11Invoice: bolt11String),
          valueSats: $fixnum.Int64.parseInt(amountSats.toString()),
        ),
        reason: reason,
        transfer: transferRequestObj,
        receiverIdentityPublicKey: params.receiverIdentityPubkey,
        feeSats: $fixnum.Int64.parseInt(params.feeSats?.toString() ?? "0"),
      );

      if (params.startTransferRequest != null) {
        req.transferRequest = params.startTransferRequest!;
      }

      response = await sparkClient.initiate_preimage_swap_v3(
        req,
        options: params.idempotencyKey != null
            ? optionsWithIdempotencyKey(params.idempotencyKey!)
            : null,
      );
    } catch (error) {
      throw SparkRequestError(
        "Failed to initiate preimage swap",
        context: {'operation': "initiate_preimage_swap_v3", 'error': error},
      );
    }

    return response;
  }

  Future<List<UserSignedRefund>> queryUserSignedRefunds(
    Uint8List paymentHash,
  ) async {
    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    QueryUserSignedRefundsResponse response;
    try {
      response = await sparkClient.query_user_signed_refunds(
        QueryUserSignedRefundsRequest(
          paymentHash: paymentHash,
          identityPublicKey: await config.signer.getIdentityPublicKey(),
        ),
      );
    } catch (error) {
      throw SparkRequestError(
        "Failed to query user signed refunds",
        context: {'operation': "query_user_signed_refunds", 'error': error},
      );
    }

    return response.userSignedRefunds;
  }

  BigInt validateUserSignedRefund(UserSignedRefund userSignedRefund) {
    final refundTx = getTxFromRawTxBytes(
      Uint8List.fromList(userSignedRefund.refundTx),
    );

    // In Dart, depending on your @scure/btc-signer port, amount could be an int or BigInt.
    // Coercing to BigInt to match the JS `bigint` return type.
    final amount = refundTx.outputs.elementAtOrNull(0)?.amount;
    if (amount != null) {
      return amount;
    }

    return BigInt.zero;
  }

  Future<Transfer> providePreimage(Uint8List preimage) async {
    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    final paymentHash = bssl.sha256.hash(preimage)!;
    ProvidePreimageResponse response;
    try {
      response = await sparkClient.provide_preimage(
        ProvidePreimageRequest(
          preimage: preimage,
          paymentHash: paymentHash,
          identityPublicKey: await config.signer.getIdentityPublicKey(),
        ),
      );
    } catch (error) {
      throw SparkRequestError(
        "Failed to provide preimage",
        context: {'operation': "provide_preimage", 'error': error},
      );
    }

    if (!response.hasTransfer()) {
      throw SparkValidationError(
        "No transfer returned from coordinator",
        context: {
          'field': "transfer",
          'value': response,
          'expected': "Non-null transfer",
        },
      );
    }

    return response.transfer;
  }
}

// -- helper function --
BigInt bytesToBigIntBE(List<int> val) {
  BigInt result = BigInt.zero;

  for (final byte in val) {
    // Shift the accumulated result left by 1 byte (8 bits)
    // and combine it with the new byte using bitwise OR.
    //
    // We use & 0xff as a safety net to ensure we are strictly
    // grabbing 8 unsigned bits, just in case a standard List<int>
    // sneaks in a negative value or something larger than 255.
    result = (result << 8) | BigInt.from(byte & 0xff);
  }

  return result;
}

Uint8List bigIntToBytesBE(BigInt val, [int length = 32]) {
  // Create an array of the exact requested length (defaults to all 0s)
  final result = Uint8List(length);
  var currentVal = val;

  // Populate backwards from the end of the array to index 0.
  // If the BigInt runs out of bytes (currentVal becomes 0), the remaining
  // indices at the start of the array simply remain 0, giving us perfect padding!
  for (var i = length - 1; i >= 0; i--) {
    result[i] = (currentVal & BigInt.from(0xff)).toInt();
    currentVal = currentVal >> 8;
  }

  return result;
}
