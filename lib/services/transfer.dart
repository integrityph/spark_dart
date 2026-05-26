import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:bitcoin_base/bitcoin_base.dart';
import 'package:convert/convert.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:grpc/grpc.dart';
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart';
import 'package:secp256k1_ffi/secp256k1_ffi.dart';
import 'package:uuid/uuid.dart';
import 'package:boringssl_ffi/boringssl_ffi.dart' as bsll;

import '../errors/spark_error.dart'; // SparkError, SparkRequestError, SparkValidationError
import '../src/proto/spark.pbgrpc.dart'; // TransferStatus, TransferType, TreeNode, TransferPackage, SigningJob, ClaimTransferResponse, ClaimTransferSignRefundsResponse, CounterLeafSwapResponse, HashVariant, InitiateSwapPrimaryTransferResponse, LeafRefundTxSigningJob, LeafRefundTxSigningResult, NodeSignatures, QueryTransfersResponse, RenewNodeZeroTimelockSigningJob, RenewRefundTimelockSigningJob, SendLeafKeyTweak, SendLeafKeyTweaks, StartTransferRequest, StartTransferResponse, Transfer
import '../signer/types.dart'; // KeyDerivation, KeyDerivationType, SigningCommitmentWithOptionalNonce
// import '../utils/address.dart'; // SparkAddressFormat
import '../utils/idempotency.dart'; // optionsWithIdempotencyKey
// import '../utils/network.dart' hide Network; // NetworkToProto
import '../utils/retry.dart'; // RetryContext, withRetry
import '../utils/secret_sharing.dart'; // VerifiableSecretShare
import '../utils/transaction.dart';
import '../utils/transfer_package.dart';
import '../utils/bitcoin.dart';
import '../utils/hex.dart';

import '../spark_bindings/spark_bindings.dart';
import '../spark_bindings/types.dart';

import 'config.dart'; // WalletConfigService
import 'connection/connection.dart'; // ConnectionManager
import 'signing.dart'; // SigningService, UserSignedTxSigningJobWithSelfCommitment

// Transfer statuses before the sender key tweak is applied — the sender
// still owns the leaves in these states.
const List<TransferStatus> senderPendingStatuses = [
  TransferStatus.TRANSFER_STATUS_SENDER_INITIATED,
  TransferStatus.TRANSFER_STATUS_SENDER_INITIATED_COORDINATOR,
  TransferStatus.TRANSFER_STATUS_APPLYING_SENDER_KEY_TWEAK,
  TransferStatus.TRANSFER_STATUS_SENDER_KEY_TWEAK_PENDING,
];

// Counter-swap statuses covering the full lifecycle until completion.
const List<TransferStatus> activeCounterSwapStatuses = [
  ...senderPendingStatuses,
  TransferStatus.TRANSFER_STATUS_SENDER_KEY_TWEAKED,
  TransferStatus.TRANSFER_STATUS_RECEIVER_KEY_TWEAK_LOCKED,
  TransferStatus.TRANSFER_STATUS_RECEIVER_KEY_TWEAK_APPLIED,
  TransferStatus.TRANSFER_STATUS_RECEIVER_KEY_TWEAKED,
  TransferStatus.TRANSFER_STATUS_RECEIVER_REFUND_SIGNED,
];

const List<TransferType> primarySwapTypes = [
  TransferType.PRIMARY_SWAP_V3,
  TransferType.SWAP,
];

const List<TransferType> counterSwapTypes = [
  TransferType.COUNTER_SWAP_V3,
  TransferType.COUNTER_SWAP,
];

const List<TransferType> outgoingTransferTypes = [
  TransferType.COOPERATIVE_EXIT,
  TransferType.UTXO_SWAP,
  TransferType.PREIMAGE_SWAP,
  TransferType.TRANSFER,
];

// --- helper method ---
// Drop this anywhere in your utils or at the top/bottom of transfer.dart
extension MapConversionExt<K, V> on Map<K, V> {
  /// Converts the values of a map to a new type [U] using the provided [converter] function,
  /// while keeping the original keys.
  Map<K, U> mapValues<U>(U Function(V value) converter) {
    return map((key, value) => MapEntry(key, converter(value)));
  }
}

class TransferQueryOptions {
  final int limit;
  final int offset;
  final DateTime? createdAfter;
  final DateTime? createdBefore;

  TransferQueryOptions({
    required this.limit,
    required this.offset,
    this.createdAfter,
    this.createdBefore,
  });
}

/// Dart composition representation of TransferPackageWithSelfCommitments.
/// Holds the generated TransferPackage along with local overrides.
class TransferPackageWithSelfCommitments {
  final TransferPackage package;
  final List<UserSignedTxSigningJobWithSelfCommitment> leavesToSend;
  final List<UserSignedTxSigningJobWithSelfCommitment> directLeavesToSend;
  final List<UserSignedTxSigningJobWithSelfCommitment>
  directFromCpfpLeavesToSend;

  TransferPackageWithSelfCommitments({
    required this.package,
    required this.leavesToSend,
    required this.directLeavesToSend,
    required this.directFromCpfpLeavesToSend,
  });
}

class LeafKeyTweak {
  final TreeNode leaf;
  final KeyDerivation keyDerivation;
  final KeyDerivation newKeyDerivation;
  final Uint8List receiverIdentityPublicKey;

  LeafKeyTweak({
    required this.leaf,
    required this.keyDerivation,
    required this.newKeyDerivation,
    required this.receiverIdentityPublicKey,
  });
}

class ClaimLeafData {
  final KeyDerivation keyDerivation;
  final dynamic
  tx; // Assuming dynamic or a mapped Transaction class for @scure/btc-signer
  final dynamic refundTx;
  final SigningCommitmentWithOptionalNonce signingNonceCommitment;
  final int? vout;

  ClaimLeafData({
    required this.keyDerivation,
    this.tx,
    this.refundTx,
    required this.signingNonceCommitment,
    this.vout,
  });
}

class LeafRefundSigningData {
  final KeyDerivation keyDerivation;
  final Uint8List receivingPubkey;
  final SigningCommitmentWithOptionalNonce signingNonceCommitment;
  final SigningCommitmentWithOptionalNonce directSigningNonceCommitment;
  BtcTransaction? tx;
  BtcTransaction? directTx;
  BtcTransaction? refundTx;
  BtcTransaction? directRefundTx;
  BtcTransaction? directFromCpfpRefundTx;
  final SigningCommitmentWithOptionalNonce
  directFromCpfpRefundSigningNonceCommitment;
  final int vout;
  final TxOutput? connectorPrevOutput; // Assumed TransactionOutput equivalent

  LeafRefundSigningData({
    required this.keyDerivation,
    required this.receivingPubkey,
    required this.signingNonceCommitment,
    required this.directSigningNonceCommitment,
    required this.tx,
    this.directTx,
    this.refundTx,
    this.directRefundTx,
    this.directFromCpfpRefundTx,
    required this.directFromCpfpRefundSigningNonceCommitment,
    required this.vout,
    this.connectorPrevOutput,
  });
}

enum SigningJobType {
  split,
  directSplit,
  node,
  directNode,
  cpfp,
  direct,
  directFromCpfp,
}

class SigningJobWithOptionalNonce {
  final Uint8List signingPublicKey;
  final Uint8List rawTx;
  final SigningCommitmentWithOptionalNonce signingNonceCommitment;
  final SigningJobType type;
  final TxOutput? parentTxOut;
  final String leafId;
  final KeyDerivation keyDerivation;
  final Uint8List verifyingKey;

  SigningJobWithOptionalNonce({
    required this.signingPublicKey,
    required this.rawTx,
    required this.signingNonceCommitment,
    required this.type,
    required this.parentTxOut,
    required this.leafId,
    required this.keyDerivation,
    required this.verifyingKey,
  });
}

SigningJob getSigningJobProto(SigningJobWithOptionalNonce signingJob) {
  return SigningJob(
    signingPublicKey: signingJob.signingPublicKey,
    rawTx: signingJob.rawTx,
    signingNonceCommitment: signingJob.signingNonceCommitment.commitment
        .toProto(),
  );
}

class BaseTransferService {
  final WalletConfigService config;
  final ConnectionManager connectionManager;
  final SigningService signingService;

  BaseTransferService(this.config, this.connectionManager, this.signingService);

  // ===========================================================================
  // CHUNK: BaseTransferService (Transfer Initiation & Swap)
  // (Continuing inside the BaseTransferService class...)
  // ===========================================================================

  Future<Transfer> deliverTransferPackage(
    Transfer transfer,
    List<LeafKeyTweak> leaves,
    Map<String, Uint8List> cpfpRefundSignatureMap,
    Map<String, Uint8List> directRefundSignatureMap,
    Map<String, Uint8List> directFromCpfpRefundSignatureMap,
  ) async {
    final keyTweakInputMap = await prepareSendTransferKeyTweaks(
      transfer.id,
      leaves,
      cpfpRefundSignatureMap,
      directRefundSignatureMap,
      directFromCpfpRefundSignatureMap,
    );

    for (final key in config.getSigningOperators().keys) {
      final tweaks = keyTweakInputMap[key];
      if (tweaks == null) {
        throw SparkValidationError(
          "No tweaks for operator",
          context: {'field': "operator", 'value': key},
        );
      }
    }

    final transferPackage = await _prepareTransferPackage(
      transfer.id,
      keyTweakInputMap,
      leaves,
    );

    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    final response = await sparkClient.finalize_transfer_with_transfer_package(
      FinalizeTransferWithTransferPackageRequest(
        // Assuming typical proto request wrapper
        transferId: transfer.id,
        ownerIdentityPublicKey: await config.signer.getIdentityPublicKey(),
        transferPackage: transferPackage
            .package, // Extracting raw proto from the local wrapper
      ),
    );

    if (!response.hasTransfer()) {
      throw SparkValidationError("No transfer response from operator");
    }

    return response.transfer;
  }

  Future<StartTransferRequest> prepareTransferForLightning(
    List<LeafKeyTweak> leaves,
    Uint8List paymentHash,
    DateTime expiryTime,
    String transferID,
  ) async {
    if (leaves.isEmpty) {
      throw SparkValidationError("leaves must not be empty");
    }

    final keyTweakInputMap = await prepareSendTransferKeyTweaks(
      transferID,
      leaves,
    );

    final transferPackage = await _prepareTransferPackageForLightning(
      transferID,
      keyTweakInputMap,
      leaves,
      paymentHash,
    );

    return StartTransferRequest(
      transferId: transferID,
      ownerIdentityPublicKey: await config.signer.getIdentityPublicKey(),
      receiverIdentityPublicKey: Uint8List.fromList(
        leaves[0].receiverIdentityPublicKey,
      ),
      transferPackage: transferPackage.package,
      sparkInvoice: "",
      leavesToSend: [],
      expiryTime: Timestamp.fromDateTime(expiryTime),
    );
  }

  Future<Transfer> sendTransferWithKeyTweaks(
    List<LeafKeyTweak> leaves, [
    String? sparkInvoice,
  ]) async {
    if (leaves.isEmpty) {
      throw SparkValidationError("leaves must not be empty");
    }

    // You will need to ensure a Uuid instance is available in the class or file scope
    final transferID = Uuid().v7();

    final keyTweakInputMap = await prepareSendTransferKeyTweaks(
      transferID,
      leaves,
    );

    final transferPackage = await _prepareTransferPackage(
      transferID,
      keyTweakInputMap,
      leaves,
    );

    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    StartTransferResponse response;

    try {
      response = await sparkClient.start_transfer_v2(
        StartTransferRequest(
          transferId: transferID,
          ownerIdentityPublicKey: await config.signer.getIdentityPublicKey(),
          receiverIdentityPublicKey: Uint8List.fromList(
            leaves[0].receiverIdentityPublicKey,
          ),
          transferPackage: transferPackage.package,
          sparkInvoice: sparkInvoice ?? "",
        ),
      );
    } catch (error) {
      throw SparkRequestError(
        "Failed to start transfer",
        context: {'method': "POST", 'error': error},
      );
    }

    if (!response.hasTransfer()) {
      throw SparkValidationError("No transfer response from operator");
    }

    return response.transfer;
  }

  Future<
    ({
      InitiateSwapPrimaryTransferResponse swapTransfer,
      Uint8List adaptorPubkey,
      Map<String, Uint8List> adaptorAddedSignatureMap,
    })
  >
  sendSwapTransfer(List<LeafKeyTweak> leaves, [String? transferId]) async {
    if (leaves.isEmpty) {
      throw SparkValidationError("leaves must not be empty");
    }

    final transferID = transferId ?? Uuid().v7();

    final keyTweakInputMap = await prepareSendTransferKeyTweaks(
      transferID,
      leaves,
    );

    final adaptorPrivKey = secp256k1FFI.privateKey.generate();
    final adaptorPubkey = secp256k1FFI.privateKey.createPubKey(adaptorPrivKey)!;
    final transferPackage = await _prepareTransferPackage(
      transferID,
      keyTweakInputMap,
      leaves,
      adaptorPubkey,
    );

    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    transferPackage.directFromCpfpLeavesToSend.clear();
    transferPackage.directLeavesToSend.clear();
    // Also clear the underlying proto package arrays just to be safe
    transferPackage.package.directFromCpfpLeavesToSend.clear();
    transferPackage.package.directLeavesToSend.clear();

    try {
      final response = await sparkClient.initiate_swap_primary_transfer(
        InitiateSwapPrimaryTransferRequest(
          transfer: StartTransferRequest(
            // Adjust if the proto field expects a different wrapper message
            transferId: transferID,
            ownerIdentityPublicKey: await config.signer.getIdentityPublicKey(),
            receiverIdentityPublicKey: Uint8List.fromList(
              leaves[0].receiverIdentityPublicKey,
            ),
            transferPackage: transferPackage.package,
          ),
          adaptorPublicKeys: AdaptorPublicKeyPackage(
            adaptorPublicKey: adaptorPubkey,
          ),
        ),
      );

      if (!response.hasTransfer()) {
        throw SparkValidationError("No transfer response from operator");
      }

      final adaptorAddedSignatureMap = <String, Uint8List>{};

      for (final signingResult in response.signingResults) {
        final leaf = transferPackage.leavesToSend.firstWhere(
          (l) =>
              l.job.leafId ==
              signingResult.leafId, // Assuming '.job' holds the proto
        );
        final leafOriginal = leaves.firstWhere(
          (l) => l.leaf.id == signingResult.leafId,
        );

        final rawTx = getTxFromRawTxBytes(Uint8List.fromList(leaf.job.rawTx));
        final nodeTx = getTxFromRawTxBytes(
          Uint8List.fromList(leafOriginal.leaf.nodeTx),
        );

        final message = getSigHashFromTx(rawTx, 0, [nodeTx.outputs[0]]);

        final adaptorAddedSignature = await config.signer.aggregateFrost(
          AggregateFrostParams(
            message: message,
            publicKey: Uint8List.fromList(leaf.job.signingPublicKey),
            verifyingKey: Uint8List.fromList(signingResult.verifyingKey),
            selfCommitment: leaf.selfCommitment,
            statechainCommitments: signingResult
                .refundTxSigningResult
                .signingNonceCommitments
                .mapValues<ISigningCommitment>(
                  (v) => ISigningCommitment(
                    binding: Uint8List.fromList(v.binding),
                    hiding: Uint8List.fromList(v.hiding),
                  ),
                ),
            statechainSignatures: signingResult
                .refundTxSigningResult
                .signatureShares
                .mapValues<Uint8List>((v) => Uint8List.fromList(v)),
            statechainPublicKeys: signingResult.refundTxSigningResult.publicKeys
                .mapValues<Uint8List>((v) => Uint8List.fromList(v)),
            selfSignature: Uint8List.fromList(leaf.job.userSignature),
            adaptorPubKey: adaptorPubkey,
          ),
        );

        adaptorAddedSignatureMap[signingResult.leafId] = adaptorAddedSignature;
      }

      return (
        swapTransfer: response,
        adaptorPubkey: adaptorPubkey,
        adaptorAddedSignatureMap: adaptorAddedSignatureMap,
      );
    } catch (error) {
      throw SparkRequestError(
        "Failed to initiate swap primary transfer",
        context: {'method': "POST", 'error': error},
      );
    }
  }

  // ===========================================================================
  // CHUNK: Package Prep, Key Tweaks, and Claim Transfers
  // (Completing BaseTransferService and starting TransferService...)
  // ===========================================================================

  Future<Map<String, List<SendLeafKeyTweak>>> prepareSendTransferKeyTweaks(
    String transferID,
    List<LeafKeyTweak> leaves, [
    Map<String, Uint8List>? cpfpRefundSignatureMap,
    Map<String, Uint8List>? directRefundSignatureMap,
    Map<String, Uint8List>? directFromCpfpRefundSignatureMap,
  ]) async {
    final leavesTweaksMap = <String, List<SendLeafKeyTweak>>{};

    final futures = leaves.map((leaf) async {
      return await _prepareSingleSendTransferKeyTweak(
        transferID,
        leaf,
        leaf.receiverIdentityPublicKey,
        cpfpRefundSignatureMap?[leaf.leaf.id],
        directRefundSignatureMap?[leaf.leaf.id],
        directFromCpfpRefundSignatureMap?[leaf.leaf.id],
      );
    }).toList();

    final results = await Future.wait(futures);

    for (final result in results) {
      for (final entry in result.entries) {
        final identifier = entry.key;
        final leafTweak = entry.value;
        leavesTweaksMap.putIfAbsent(identifier, () => []).add(leafTweak);
      }
    }

    return leavesTweaksMap;
  }

  Future<Map<String, SendLeafKeyTweak>> _prepareSingleSendTransferKeyTweak(
    String transferID,
    LeafKeyTweak leaf,
    Uint8List receiverPubkey, [
    Uint8List? cpfpRefundSignature,
    Uint8List? directRefundSignature,
    Uint8List? directFromCpfpRefundSignature,
  ]) async {
    final signingOperators = config.getSigningOperators();

    final curveOrder = secp256k1FFI.constants.nBE;

    final subtractResult = await config.signer.subtractSplitAndEncrypt(
      SubtractSplitAndEncryptParams(
        first: leaf.keyDerivation,
        second: leaf.newKeyDerivation,
        receiverPublicKey: receiverPubkey,
        curveOrder: curveOrder,
        threshold: config.getThreshold(),
        numShares: signingOperators.length,
      ),
    );
    final shares = subtractResult.shares;
    final secretCipher = subtractResult.secretCipher;

    final pubkeySharesTweak = <String, Uint8List>{};
    for (final entry in signingOperators.entries) {
      final identifier = entry.key;
      final operator = entry.value;

      final share = _findShare(
        shares,
        operator.id,
      );
      if (share == null) {
        throw Exception("Share not found for operator ${operator.id}");
      }

      // 1. Load the private key scalar from the Uint8List
      final privateKey = share.share;

      // 2. Derive the public key and explicitly grab the compressed bytes
      final pubkeyTweak = secp256k1FFI.privateKey.createPubKey(privateKey)!;
      pubkeySharesTweak[identifier] = pubkeyTweak;
    }

    // Prepare payload for signing
    // Dart String encoding: Uint8List.fromList(utf8.encode(string))
    final leafIdBytes = utf8.encode(leaf.leaf.id);
    final transferIdBytes = utf8.encode(transferID);

    final payloadBuilder = BytesBuilder()
      ..add(leafIdBytes)
      ..add(transferIdBytes)
      ..add(secretCipher);

    final payload = payloadBuilder.toBytes();

    // sha256 function assumed from earlier crypto utils
    final payloadHash = bsll.sha256.hash(payload)!;

    final signature = await config.signer.signMessageWithIdentityKey(
      payloadHash,
      compact: true,
    );

    final leafTweaksMap = <String, SendLeafKeyTweak>{};
    for (final entry in signingOperators.entries) {
      final identifier = entry.key;
      final operator = entry.value;

      final share = _findShare(shares, operator.id);
      if (share == null) {
        throw Exception("Share not found for operator ${operator.id}");
      }

      leafTweaksMap[identifier] = SendLeafKeyTweak(
        leafId: leaf.leaf.id,
        secretShareTweak: SecretShare(
          secretShare: share.share,
          proofs: share.proofs,
        ),
        pubkeySharesTweak: pubkeySharesTweak.entries,
        secretCipher: secretCipher,
        signature: signature,
        refundSignature: cpfpRefundSignature ?? Uint8List(0),
        directRefundSignature: directRefundSignature ?? Uint8List(0),
        directFromCpfpRefundSignature:
            directFromCpfpRefundSignature ?? Uint8List(0),
      );
    }

    return leafTweaksMap;
  }

  VerifiableSecretShare? _findShare(
    List<VerifiableSecretShare> shares,
    int operatorID,
  ) {
    final targetShareIndex = operatorID + 1;
    for (final s in shares) {
      if (s.index == targetShareIndex) {
        return s;
      }
    }
    return null;
  }

  Future<TransferPackageWithSelfCommitments> _prepareTransferPackage(
    String transferID,
    Map<String, List<SendLeafKeyTweak>> keyTweakInputMap,
    List<LeafKeyTweak> leaves, [
    Uint8List? adaptorPubKey,
  ]) async {
    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    final nodes = leaves.map((leaf) => leaf.leaf.id).toList();

    final signingCommitments = await sparkClient.get_signing_commitments(
      GetSigningCommitmentsRequest(nodeIds: nodes, count: 3),
    );

    final signRefundsResult = await signingService.signRefunds(
      leaves,
      signingCommitments.signingCommitments.sublist(0, leaves.length),
      signingCommitments.signingCommitments.sublist(
        leaves.length,
        2 * leaves.length,
      ),
      signingCommitments.signingCommitments.sublist(
        2 * leaves.length,
        3 * leaves.length,
      ),
      adaptorPubKey,
    );

    final cpfpLeafSigningJobs = signRefundsResult.cpfpLeafSigningJobs;
    final directLeafSigningJobs = signRefundsResult.directLeafSigningJobs;
    final directFromCpfpLeafSigningJobs =
        signRefundsResult.directFromCpfpLeafSigningJobs;

    final sparkFrost = getSparkFrost();

    final encryptedKeyTweaksEntries = await Future.wait(
      keyTweakInputMap.entries.map((entry) async {
        final key = entry.key;
        final value = entry.value;

        final protoToEncrypt = SendLeafKeyTweaks(leavesToSend: value);

        final protoToEncryptBinary = protoToEncrypt.writeToBuffer();

        final operator = config.getSigningOperators()[key];
        if (operator == null) {
          throw SparkValidationError("Operator not found");
        }

        final encryptedProto = await sparkFrost.encryptEcies(
          protoToEncryptBinary,
          hexToBytes(operator.identityPublicKey),
        );

        return MapEntry(key, Uint8List.fromList(encryptedProto));
      }),
    );

    final encryptedKeyTweaks = Map.fromEntries(encryptedKeyTweaksEntries);

    final transferPackageProto = TransferPackage(
      leavesToSend: cpfpLeafSigningJobs
          .map((j) => j.job)
          .toList(), // Map wrapper to raw proto
      keyTweakPackage: encryptedKeyTweaks.entries,
      userSignature: Uint8List(0),
      directLeavesToSend: directLeafSigningJobs.map((j) => j.job).toList(),
      directFromCpfpLeavesToSend: directFromCpfpLeafSigningJobs
          .map((j) => j.job)
          .toList(),
      hashVariant: HashVariant.HASH_VARIANT_V2,
    );

    final transferPackage = TransferPackageWithSelfCommitments(
      package: transferPackageProto,
      leavesToSend: cpfpLeafSigningJobs,
      directLeavesToSend: directLeafSigningJobs,
      directFromCpfpLeavesToSend: directFromCpfpLeafSigningJobs,
    );

    final transferPackageSigningPayload = getTransferPackageSigningPayload(
      transferID,
      transferPackage
          .package, // Ensure your util accepts the Dart wrapper or `.package`
    );

    final signature = await config.signer.signMessageWithIdentityKey(
      transferPackageSigningPayload,
    );

    transferPackage.package.userSignature = signature;

    return transferPackage;
  }

  Future<TransferPackageWithSelfCommitments>
  _prepareTransferPackageForLightning(
    String transferID,
    Map<String, List<SendLeafKeyTweak>> keyTweakInputMap,
    List<LeafKeyTweak> leaves,
    Uint8List paymentHash,
  ) async {
    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    final nodes = leaves.map((leaf) => leaf.leaf.id).toList();

    final signingCommitments = await sparkClient.get_signing_commitments(
      GetSigningCommitmentsRequest(nodeIds: nodes, count: 3),
    );

    final signRefundsResult = await signingService.signRefundsForLightning(
      leaves,
      signingCommitments.signingCommitments.sublist(0, leaves.length),
      signingCommitments.signingCommitments.sublist(
        leaves.length,
        2 * leaves.length,
      ),
      signingCommitments.signingCommitments.sublist(
        2 * leaves.length,
        3 * leaves.length,
      ),
      paymentHash,
    );

    // Note: signRefundsForLightning returned raw protobuf jobs directly
    final cpfpLeafSigningJobs = signRefundsResult.cpfpLeafSigningJobs;
    final directLeafSigningJobs = signRefundsResult.directLeafSigningJobs;
    final directFromCpfpLeafSigningJobs =
        signRefundsResult.directFromCpfpLeafSigningJobs;

    final sparkFrost = getSparkFrost();

    final encryptedKeyTweaksEntries = await Future.wait(
      keyTweakInputMap.entries.map((entry) async {
        final key = entry.key;
        final value = entry.value;

        final protoToEncrypt = SendLeafKeyTweaks(leavesToSend: value);

        final protoToEncryptBinary = protoToEncrypt.writeToBuffer();

        final operator = config.getSigningOperators()[key];
        if (operator == null) {
          throw SparkValidationError("Operator not found");
        }

        final encryptedProto = await sparkFrost.encryptEcies(
          protoToEncryptBinary,
          hexToBytes(operator.identityPublicKey),
        );

        return MapEntry(key, encryptedProto);
      }),
    );

    final encryptedKeyTweaks = Map.fromEntries(encryptedKeyTweaksEntries);

    final transferPackageProto = TransferPackage(
      leavesToSend: cpfpLeafSigningJobs,
      keyTweakPackage: encryptedKeyTweaks.entries,
      userSignature: Uint8List(0),
      directLeavesToSend: directLeafSigningJobs,
      directFromCpfpLeavesToSend: directFromCpfpLeafSigningJobs,
      hashVariant: HashVariant.HASH_VARIANT_V2,
    );

    final transferPackage = TransferPackageWithSelfCommitments(
      package: transferPackageProto,
      // Since Lightning returned raw jobs, we can't fully populate the wrapper with self-commitments easily.
      // Assuming empty lists here if the wrapper isn't strictly used post-lightning-prep,
      // or you will need to map them back to the wrapper type if required downstream.
      leavesToSend: [],
      directLeavesToSend: [],
      directFromCpfpLeavesToSend: [],
    );

    final transferPackageSigningPayload = getTransferPackageSigningPayload(
      transferID,
      transferPackage.package,
    );

    final signature = await config.signer.signMessageWithIdentityKey(
      transferPackageSigningPayload,
    );

    transferPackage.package.userSignature = signature;

    return transferPackage;
  }

  /// V3 transfer: supports per-leaf receiver routing and will eventually
  /// support multi-sender collaboration (e.g. atomic swaps). Each leaf
  /// must have receiverIdentityPublicKey set.
  Future<Transfer> sendTransferV3(List<LeafKeyTweak> leaves) async {
    final transferID = Uuid().v7();

    final keyTweakInputMap = await prepareSendTransferKeyTweaks(
      transferID,
      leaves,
    );

    final transferPackage = await _prepareTransferPackage(
      transferID,
      keyTweakInputMap,
      leaves,
    );

    final receiverIdentityPublicKeys = <String, Uint8List>{};
    for (final leaf in leaves) {
      receiverIdentityPublicKeys[leaf.leaf.id] = leaf.receiverIdentityPublicKey;
    }

    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    StartTransferResponse response;
    try {
      response = await sparkClient.start_transfer_v3(
        StartTransferV3Request(
          // Adjust if proto wrapper name differs
          transferId: transferID,
          senderPackages: [
            SenderTransferPackage(
              // Adjust if proto wrapper name differs
              ownerIdentityPublicKey: await config.signer
                  .getIdentityPublicKey(),
              transferPackage: transferPackage.package, // Pass raw proto
              receiverIdentityPublicKeys: receiverIdentityPublicKeys.entries,
            ),
          ],
          // expiryTime: undefined, (Usually represented by not setting it in Dart)
        ),
      );
    } catch (error) {
      throw SparkRequestError(
        "Failed to start V3 transfer",
        context: {'method': "POST", 'error': error},
      );
    }

    if (!response.hasTransfer()) {
      throw SparkValidationError("No transfer response from operator");
    }

    return response.transfer;
  }

  // bool _compareTransfers(Transfer transfer1, Transfer transfer2) {
  //   // Requires equalBytes util matching noble/curves
  //   return transfer1.id == transfer2.id &&
  //          equalBytes(
  //            Uint8List.fromList(transfer1.senderIdentityPublicKey),
  //            Uint8List.fromList(transfer2.senderIdentityPublicKey),
  //          ) &&
  //          transfer1.status == transfer2.status &&
  //          transfer1.totalValue == transfer2.totalValue &&
  //          // Note: Protobuf Timestamps don't have .getTime() directly in Dart.
  //          // You usually convert to DateTime then to millisecondsSinceEpoch.
  //          transfer1.expiryTime.toDateTime().millisecondsSinceEpoch == transfer2.expiryTime.toDateTime().millisecondsSinceEpoch &&
  //          transfer1.leaves.length == transfer2.leaves.length;
  // }

  // ===========================================================================
  // CHUNK: signRefunds
  // (Continuing inside the BaseTransferService class...)
  // ===========================================================================

  Future<List<NodeSignatures>> signRefunds(
    Map<String, LeafRefundSigningData> leafDataMap,
    List<LeafRefundTxSigningResult> operatorSigningResults,
  ) async {
    final nodeSignatures = <NodeSignatures>[];
    for (final operatorSigningResult in operatorSigningResults) {
      final leafData = leafDataMap[operatorSigningResult.leafId];
      if (leafData == null ||
          leafData.tx == null ||
          leafData.refundTx == null) {
        throw Exception(
          "Leaf data not found for leaf ${operatorSigningResult.leafId}",
        );
      }

      final txOutput = leafData.tx?.outputs.elementAtOrNull(0);
      if (txOutput == null) {
        throw Exception(
          "Output not found for leaf ${operatorSigningResult.leafId}",
        );
      }

      // Sign CPFP refund transaction
      // Use multi-input sighash for coop exit (2-input transactions with connector)
      Uint8List cpfpRefundTxSighash;
      if ((leafData.refundTx?.inputs.length ?? 0) > 1 &&
          leafData.connectorPrevOutput != null) {
        cpfpRefundTxSighash = getSigHashFromMultiInputTx(
          leafData.refundTx!,
          0,
          [txOutput, leafData.connectorPrevOutput!],
        );
      } else {
        cpfpRefundTxSighash = getSigHashFromTx(leafData.refundTx!, 0, [txOutput]);
      }

      final publicKey = await config.signer.getPublicKeyFromDerivation(
        keyDerivation: leafData.keyDerivation,
      );

      final cpfpUserSignature = await config.signer.signFrost(
        SignFrostParams(
          message: cpfpRefundTxSighash,
          publicKey: publicKey,
          keyDerivation: leafData.keyDerivation,
          selfCommitment: leafData.signingNonceCommitment,
          statechainCommitments: operatorSigningResult
              .refundTxSigningResult
              .signingNonceCommitments
              .mapValues<ISigningCommitment>(
                (v) => ISigningCommitment(
                  binding: Uint8List.fromList(v.binding),
                  hiding: Uint8List.fromList(v.hiding),
                ),
              ),
          verifyingKey: Uint8List.fromList(operatorSigningResult.verifyingKey),
          adaptorPubKey: Uint8List(
            0,
          ), // Ensuring strict frost signing requirements based on previous context
        ),
      );

      final cpfpRefundAggregate = await config.signer.aggregateFrost(
        AggregateFrostParams(
          message: cpfpRefundTxSighash,
          statechainSignatures: operatorSigningResult
              .refundTxSigningResult
              .signatureShares
              .mapValues<Uint8List>((v) => Uint8List.fromList(v)),
          statechainPublicKeys: operatorSigningResult
              .refundTxSigningResult
              .publicKeys
              .mapValues<Uint8List>((v) => Uint8List.fromList(v)),
          verifyingKey: Uint8List.fromList(operatorSigningResult.verifyingKey),
          statechainCommitments: operatorSigningResult
              .refundTxSigningResult
              .signingNonceCommitments
              .mapValues<ISigningCommitment>(
                (v) => ISigningCommitment(
                  binding: Uint8List.fromList(v.binding),
                  hiding: Uint8List.fromList(v.hiding),
                ),
              ),
          selfCommitment: leafData.signingNonceCommitment,
          publicKey: publicKey,
          selfSignature: cpfpUserSignature,
          adaptorPubKey: Uint8List(0),
        ),
      );

      // Sign direct refund transaction (spends direct tx output).
      Uint8List? directRefundAggregate;
      if (leafData.directTx != null && leafData.directRefundTx != null) {
        final directTxOutput = leafData.directTx?.outputs.elementAtOrNull(0);

        // Use multi-input sighash for coop exit (2-input transactions with connector)
        Uint8List directRefundTxSighash;
        if ((leafData.directRefundTx?.inputs.length ?? 0) > 1 &&
            leafData.connectorPrevOutput != null) {
          directRefundTxSighash = getSigHashFromMultiInputTx(
            leafData.directRefundTx!,
            0,
            [directTxOutput!, leafData.connectorPrevOutput!],
          );
        } else {
          directRefundTxSighash = getSigHashFromTx(
            leafData.directRefundTx!,
            0,
            [directTxOutput!],
          );
        }

        final directUserSignature = await config.signer.signFrost(
          SignFrostParams(
            message: directRefundTxSighash,
            publicKey: publicKey,
            keyDerivation: leafData.keyDerivation,
            selfCommitment: leafData.directSigningNonceCommitment,
            statechainCommitments: operatorSigningResult
                .directRefundTxSigningResult
                .signingNonceCommitments
                .mapValues<ISigningCommitment>(
                  (v) => ISigningCommitment(
                    binding: Uint8List.fromList(v.binding),
                    hiding: Uint8List.fromList(v.hiding),
                  ),
                ),
            verifyingKey: Uint8List.fromList(
              operatorSigningResult.verifyingKey,
            ),
            adaptorPubKey: Uint8List(0),
          ),
        );

        directRefundAggregate = await config.signer.aggregateFrost(
          AggregateFrostParams(
            message: directRefundTxSighash,
            statechainSignatures: operatorSigningResult
                .directRefundTxSigningResult
                .signatureShares
                .mapValues<Uint8List>((v) => Uint8List.fromList(v)),
            statechainPublicKeys: operatorSigningResult
                .directRefundTxSigningResult
                .publicKeys
                .mapValues<Uint8List>((v) => Uint8List.fromList(v)),
            verifyingKey: Uint8List.fromList(
              operatorSigningResult.verifyingKey,
            ),
            statechainCommitments: operatorSigningResult
                .directRefundTxSigningResult
                .signingNonceCommitments
                .mapValues<ISigningCommitment>(
                  (v) => ISigningCommitment(
                    binding: Uint8List.fromList(v.binding),
                    hiding: Uint8List.fromList(v.hiding),
                  ),
                ),
            selfCommitment: leafData.directSigningNonceCommitment,
            publicKey: publicKey,
            selfSignature: directUserSignature,
            adaptorPubKey: Uint8List(0),
          ),
        );
      }

      // Sign direct-from-CPFP refund transaction (spends CPFP tx output).
      Uint8List? directFromCpfpRefundAggregate;
      if (leafData.directFromCpfpRefundTx != null) {
        // Use multi-input sighash for coop exit (2-input transactions with connector)
        Uint8List directFromCpfpRefundTxSighash;
        if ((leafData.directFromCpfpRefundTx?.inputs.length ?? 0) > 1 &&
            leafData.connectorPrevOutput != null) {
          directFromCpfpRefundTxSighash = getSigHashFromMultiInputTx(
            leafData.directFromCpfpRefundTx!,
            0,
            [txOutput, leafData.connectorPrevOutput!],
          );
        } else {
          directFromCpfpRefundTxSighash = getSigHashFromTx(
            leafData.directFromCpfpRefundTx!,
            0,
            [txOutput],
          );
        }

        final directFromCpfpUserSignature = await config.signer.signFrost(
          SignFrostParams(
            message: directFromCpfpRefundTxSighash,
            publicKey: publicKey,
            keyDerivation: leafData.keyDerivation,
            selfCommitment: leafData.directFromCpfpRefundSigningNonceCommitment,
            statechainCommitments: operatorSigningResult
                .directFromCpfpRefundTxSigningResult
                .signingNonceCommitments
                .mapValues<ISigningCommitment>(
                  (v) => ISigningCommitment(
                    binding: Uint8List.fromList(v.binding),
                    hiding: Uint8List.fromList(v.hiding),
                  ),
                ),
            verifyingKey: Uint8List.fromList(
              operatorSigningResult.verifyingKey,
            ),
            adaptorPubKey: Uint8List(0),
          ),
        );

        directFromCpfpRefundAggregate = await config.signer.aggregateFrost(
          AggregateFrostParams(
            message: directFromCpfpRefundTxSighash,
            statechainSignatures: operatorSigningResult
                .directFromCpfpRefundTxSigningResult
                .signatureShares
                .mapValues<Uint8List>((v) => Uint8List.fromList(v)),
            statechainPublicKeys: operatorSigningResult
                .directFromCpfpRefundTxSigningResult
                .publicKeys
                .mapValues<Uint8List>((v) => Uint8List.fromList(v)),
            verifyingKey: Uint8List.fromList(
              operatorSigningResult.verifyingKey,
            ),
            statechainCommitments: operatorSigningResult
                .directFromCpfpRefundTxSigningResult
                .signingNonceCommitments
                .mapValues<ISigningCommitment>(
                  (v) => ISigningCommitment(
                    binding: Uint8List.fromList(v.binding),
                    hiding: Uint8List.fromList(v.hiding),
                  ),
                ),
            selfCommitment: leafData.directFromCpfpRefundSigningNonceCommitment,
            publicKey: publicKey,
            selfSignature: directFromCpfpUserSignature,
            adaptorPubKey: Uint8List(0),
          ),
        );
      }

      nodeSignatures.add(
        NodeSignatures(
          nodeId: operatorSigningResult.leafId,
          nodeTxSignature: Uint8List(0),
          directNodeTxSignature: Uint8List(0),
          refundTxSignature: cpfpRefundAggregate,
          directRefundTxSignature: directRefundAggregate ?? Uint8List(0),
          directFromCpfpRefundTxSignature:
              directFromCpfpRefundAggregate ?? Uint8List(0),
        ),
      );
    }
    return nodeSignatures;
  }
}

// ===========================================================================
// CHUNK: TransferService (Extension of Base)
// ===========================================================================

class TransferService extends BaseTransferService {
  TransferService(super.config, super.connectionManager, super.signingService);

  Future<List<TreeNode>> claimTransferCore(Transfer transfer) async {
    final leafPubKeyMap = await _verifyPendingTransfer(transfer);
    final selfIdentityPubkey = await config.signer.getIdentityPublicKey();

    final leaves = <LeafKeyTweak>[];

    for (final leaf in transfer.leaves) {
      if (leaf.hasLeaf()) {
        final leafPubKey = leafPubKeyMap[leaf.leaf.id];
        if (leafPubKey != null) {
          final reconstructedLeaf = TreeNode()
            ..mergeFromMessage(leaf.leaf)
            ..refundTx = leaf.intermediateRefundTx
            ..directRefundTx = leaf.intermediateDirectRefundTx
            ..directFromCpfpRefundTx = leaf.intermediateDirectFromCpfpRefundTx;

          leaves.add(
            LeafKeyTweak(
              leaf: reconstructedLeaf,
              keyDerivation: EciesKeyDerivation(
                path: Uint8List.fromList(leaf.secretCipher),
              ),
              newKeyDerivation: LeafKeyDerivation(path: leaf.leaf.id),
              receiverIdentityPublicKey: selfIdentityPubkey,
            ),
          );
        }
      }
    }
    final claimPackage = await _prepareClaimPackage(transfer.id, leaves);
    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    ClaimTransferResponse response;
    try {
      response = await sparkClient.claim_transfer(
        ClaimTransferRequest(
          // Adjust if proto wrapper name differs
          transferId: transfer.id,
          ownerIdentityPublicKey: await config.signer.getIdentityPublicKey(),
          claimPackage: claimPackage,
        ),
      );
    } catch (error) {
      throw SparkRequestError(
        "Failed to claim transfer",
        context: {'method': "POST", 'error': error},
      );
    }

    if (!response.hasTransfer()) {
      throw SparkValidationError("No transfer response from claim_transfer");
    }

    final nodes = <TreeNode>[];
    for (final leaf in response.transfer.leaves) {
      if (leaf.hasLeaf()) {
        nodes.add(leaf.leaf);
      }
    }
    return nodes;
  }

  // ===========================================================================
  // CHUNK: Querying and Transfer Verification
  // (Continuing inside the TransferService class...)
  // ===========================================================================

  /// When transferIds is not provided, all pending transfers for the receiver will be returned.
  Future<QueryTransfersResponse> queryPendingTransfers([
    List<String>? transferIds,
  ]) async {
    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    try {
      return await sparkClient.query_pending_transfers(
        TransferFilter(
          receiverIdentityPublicKey: await config.signer.getIdentityPublicKey(),
          transferIds: transferIds ?? [],
          network: Network.valueOf(config.getNetworkProto()),
        ),
      );
    } catch (error) {
      throw Exception("Error querying pending transfers: $error");
    }
  }

  Future<QueryTransfersResponse> queryPrimarySwapTransfers(
    TransferQueryOptions options,
  ) async {
    return await queryAllTransfers(
      limit: options.limit,
      offset: options.offset,
      createdAfter: options.createdAfter,
      createdBefore: options.createdBefore,
      types: primarySwapTypes,
      statuses: senderPendingStatuses,
      senderOnly: true,
    );
  }

  Future<QueryTransfersResponse> queryCounterSwapTransfers(
    TransferQueryOptions options,
  ) async {
    return await queryAllTransfers(
      limit: options.limit,
      offset: options.offset,
      createdAfter: options.createdAfter,
      createdBefore: options.createdBefore,
      types: counterSwapTypes,
      statuses: activeCounterSwapStatuses,
      senderOnly: false,
    );
  }

  Future<QueryTransfersResponse> queryPendingOutgoingTransfers(
    TransferQueryOptions options,
  ) async {
    return await queryAllTransfers(
      limit: options.limit,
      offset: options.offset,
      createdAfter: options.createdAfter,
      createdBefore: options.createdBefore,
      types: outgoingTransferTypes,
      statuses: senderPendingStatuses,
      senderOnly: true,
    );
  }

  /// Queries all transfers for the authenticated user with optional time filtering.
  ///
  /// @param limit - Maximum number of transfers to return
  /// @param offset - Pagination offset
  /// @param createdAfter - Optional: Return transfers created strictly after this time (exclusive). Mutually exclusive with createdBefore.
  /// @param createdBefore - Optional: Return transfers created strictly before this time (exclusive). Mutually exclusive with createdAfter.
  /// @returns Future containing the query response with transfers
  Future<QueryTransfersResponse> queryAllTransfers({
    required int limit,
    required int offset,
    DateTime? createdAfter,
    DateTime? createdBefore,
    required List<TransferType> types,
    List<TransferStatus>? statuses,
    bool senderOnly = false,
  }) async {
    // Validate that only one time filter is provided (mutually exclusive)
    if (createdAfter != null && createdBefore != null) {
      throw Exception(
        "createdAfter and createdBefore are mutually exclusive - only one can be specified",
      );
    }

    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    final identityPublicKey = await config.signer.getIdentityPublicKey();

    final request = TransferFilter(
      limit: $fixnum.Int64(limit),
      offset: $fixnum.Int64(offset),
      types: types,
      statuses: statuses ?? [],
      network: Network.valueOf(config.getNetworkProto()),
    );

    if (senderOnly) {
      request.senderIdentityPublicKey = identityPublicKey;
    } else {
      request.senderOrReceiverIdentityPublicKey = identityPublicKey;
    }

    // Add optional time filter (mutually exclusive - only one can be set)
    if (createdAfter != null) {
      request.createdAfter = Timestamp.fromDateTime(createdAfter);
    } else if (createdBefore != null) {
      request.createdBefore = Timestamp.fromDateTime(createdBefore);
    }

    try {
      return await sparkClient.query_all_transfers(request);
    } catch (error) {
      throw Exception("Error querying all transfers: $error");
    }
  }

  Future<Map<String, Uint8List>> _verifyPendingTransfer(
    Transfer transfer,
  ) async {
    final leafPubKeyMap = <String, Uint8List>{};

    // Future.wait to execute verification and decryption in parallel
    final futures = transfer.leaves.map((leaf) async {
      if (!leaf.hasLeaf()) {
        throw Exception("Leaf is undefined");
      }

      final leafIdBytes = Uint8List.fromList(leaf.leaf.id.codeUnits);
      final transferIdBytes = Uint8List.fromList(transfer.id.codeUnits);

      final payloadBuilder = BytesBuilder()
        ..add(leafIdBytes)
        ..add(transferIdBytes)
        ..add(leaf.secretCipher);

      final payload = payloadBuilder.toBytes();

      // Assuming sha256Bytes utility matches noble/hashes output
      final payloadHash = bsll.sha256.hash(payload)!;

      // Assuming a secp256k1 utility wrapper matches noble/curves verify mapping

      // 2. Parse the sender's public key
      final pubKey = transfer.senderIdentityPublicKey;

      // 3. Parse the signature safely
      // (@noble/curves uses 64 bytes natively, but we include a fallback for standard DER)
      final sigBytes = Uint8List.fromList(leaf.signature);

      // 4. Verify the ECDSA signature against the hash
      final isValidSignature = secp256k1FFI.ecdsa.verify(pubKey, payloadHash, sigBytes);

      if (!isValidSignature) {
        throw Exception("Signature verification failed");
      }

      final leafSecret = await config.signer.decryptEcies(
        Uint8List.fromList(leaf.secretCipher),
      );

      return MapEntry(leaf.leaf.id, leafSecret);
    }).toList();

    final results = await Future.wait(futures);

    for (final result in results) {
      leafPubKeyMap[result.key] = result.value;
    }

    return leafPubKeyMap;
  }

  // ===========================================================================
  // CHUNK: Querying Single Transfer and Signing Refunds
  // (Continuing inside the TransferService class...)
  // ===========================================================================

  Future<Transfer?> queryTransfer(String transferId) async {
    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    final transferResp = await sparkClient.query_all_transfers(
      TransferFilter(
        // Adjust if proto wrapper name differs
        senderOrReceiverIdentityPublicKey: await config.signer
            .getIdentityPublicKey(),
        transferIds: [transferId],
        network: Network.valueOf(config.getNetworkProto()),
      ),
    );

    if (transferResp.transfers.isNotEmpty) {
      return transferResp.transfers[0];
    }
    return null;
  }

  Future<
    ({
      Transfer transfer,
      Map<String, Uint8List> signatureMap,
      Map<String, Uint8List> directSignatureMap,
      Map<String, Uint8List> directFromCpfpSignatureMap,
      Map<String, LeafRefundSigningData> leafDataMap,
    })
  >
  sendTransferSignRefund(List<LeafKeyTweak> leaves, DateTime expiryTime) async {
    final result = await sendTransferSignRefundInternal(leaves, expiryTime);

    return (
      transfer: result.transfer,
      signatureMap: result.signatureMap,
      directSignatureMap: result.directSignatureMap,
      directFromCpfpSignatureMap: result.directFromCpfpSignatureMap,
      leafDataMap: result.leafDataMap,
    );
  }

  Future<
    ({
      Transfer transfer,
      Map<String, Uint8List> signatureMap,
      Map<String, Uint8List> directSignatureMap,
      Map<String, Uint8List> directFromCpfpSignatureMap,
      Map<String, LeafRefundSigningData> leafDataMap,
      List<LeafRefundTxSigningResult> signingResults,
    })
  >
  sendTransferSignRefundInternal(
    List<LeafKeyTweak> leaves,
    DateTime expiryTime,
  ) async {
    if (leaves.isEmpty) {
      throw SparkValidationError("leaves must not be empty");
    }

    final transferId = Uuid().v7();
    final leafDataMap = <String, LeafRefundSigningData>{};

    final futures = leaves.map((leaf) async {
      final signingNonceCommitment = await config.signer
          .getRandomSigningCommitment();
      final directSigningNonceCommitment = await config.signer
          .getRandomSigningCommitment();
      final directFromCpfpRefundSigningNonceCommitment = await config.signer
          .getRandomSigningCommitment();

      final tx = getTxFromRawTxBytes(Uint8List.fromList(leaf.leaf.nodeTx));
      final refundTx = getTxFromRawTxBytes(
        Uint8List.fromList(leaf.leaf.refundTx),
      );

      final directTx = leaf.leaf.directTx.isNotEmpty
          ? getTxFromRawTxBytes(Uint8List.fromList(leaf.leaf.directTx))
          : null;

      final directRefundTx = leaf.leaf.directRefundTx.isNotEmpty
          ? getTxFromRawTxBytes(Uint8List.fromList(leaf.leaf.directRefundTx))
          : null;

      final directFromCpfpRefundTx = leaf.leaf.directFromCpfpRefundTx.isNotEmpty
          ? getTxFromRawTxBytes(
              Uint8List.fromList(leaf.leaf.directFromCpfpRefundTx),
            )
          : null;

      leafDataMap[leaf.leaf.id] = LeafRefundSigningData(
        keyDerivation: leaf.keyDerivation,
        receivingPubkey: Uint8List.fromList(leaf.receiverIdentityPublicKey),
        signingNonceCommitment: signingNonceCommitment,
        directSigningNonceCommitment: directSigningNonceCommitment,
        tx: tx,
        directTx: directTx,
        refundTx: refundTx,
        directRefundTx: directRefundTx,
        directFromCpfpRefundTx: directFromCpfpRefundTx,
        directFromCpfpRefundSigningNonceCommitment:
            directFromCpfpRefundSigningNonceCommitment,
        vout: leaf.leaf.vout,
      );
    }).toList();

    await Future.wait(futures);

    final signingJobs = await _prepareRefundSoSigningJobs(leaves, leafDataMap);

    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    StartTransferResponse
    response; // Adjusted to match JS if this is the start_transfer_v2 return type
    try {
      response = await sparkClient.start_transfer_v2(
        StartTransferRequest(
          transferId: transferId,
          leavesToSend: signingJobs,
          ownerIdentityPublicKey: await config.signer.getIdentityPublicKey(),
          receiverIdentityPublicKey: Uint8List.fromList(
            leaves[0].receiverIdentityPublicKey,
          ),
          expiryTime: Timestamp.fromDateTime(expiryTime),
        ),
      );
    } catch (error) {
      throw Exception("Error starting send transfer: $error");
    }

    if (!response.hasTransfer()) {
      throw Exception("No transfer response from coordinator");
    }

    final signatures = await signRefunds(leafDataMap, response.signingResults);

    final cpfpSignatureMap = <String, Uint8List>{};
    final directSignatureMap = <String, Uint8List>{};
    final directFromCpfpSignatureMap = <String, Uint8List>{};

    for (final signature in signatures) {
      cpfpSignatureMap[signature.nodeId] = Uint8List.fromList(
        signature.refundTxSignature,
      );
      directSignatureMap[signature.nodeId] = Uint8List.fromList(
        signature.directRefundTxSignature,
      );
      directFromCpfpSignatureMap[signature.nodeId] = Uint8List.fromList(
        signature.directFromCpfpRefundTxSignature,
      );
    }

    return (
      transfer: response.transfer,
      signatureMap: cpfpSignatureMap,
      directSignatureMap: directSignatureMap,
      directFromCpfpSignatureMap: directFromCpfpSignatureMap,
      leafDataMap: leafDataMap,
      signingResults: response.signingResults,
    );
  }

  Future<List<LeafRefundTxSigningJob>> _prepareRefundSoSigningJobs(
    List<LeafKeyTweak> leaves,
    Map<String, LeafRefundSigningData> leafDataMap, [
    bool isForClaim = false,
  ]) async {
    final signingJobs = <LeafRefundTxSigningJob>[];

    final futures = leaves.map((leaf) async {
      final refundSigningData = leafDataMap[leaf.leaf.id];
      if (refundSigningData == null) {
        throw Exception("Leaf data not found for leaf ${leaf.leaf.id}");
      }

      final nodeTx = getTxFromRawTxBytes(Uint8List.fromList(leaf.leaf.nodeTx));

      dynamic directNodeTx;
      if (leaf.leaf.directTx.isNotEmpty) {
        directNodeTx = getTxFromRawTxBytes(
          Uint8List.fromList(leaf.leaf.directTx),
        );
      }

      final currRefundTx = getTxFromRawTxBytes(
        Uint8List.fromList(leaf.leaf.refundTx),
      );

      final currentSequence = currRefundTx.inputs.firstOrNull?.sequence;
      if (currentSequence == null) {
        throw SparkValidationError(
          "Invalid refund transaction",
          context: {
            'field': "sequence",
            'value': currRefundTx,
            'expected': "Non-null sequence",
          },
        );
      }

      final network = config.getNetwork();

      RefundTxs refundTxsResult;
      final currentSequenceInt = Uint8List.fromList(
        currentSequence,
      ).buffer.asByteData(0).getUint32(0, Endian.little);
      if (isForClaim) {
        refundTxsResult = await createCurrentTimelockRefundTxs(
          RefundTxWithSequenceParams(
            nodeTx: nodeTx,
            directNodeTx: directNodeTx,
            sequence: currentSequenceInt,
            receivingPubkey: refundSigningData.receivingPubkey,
            network: network,
          ),
        );
      } else {
        refundTxsResult = await createDecrementedTimelockRefundTxs(
          RefundTxWithSequenceParams(
            nodeTx: nodeTx,
            directNodeTx: directNodeTx,
            sequence: currentSequenceInt,
            receivingPubkey: refundSigningData.receivingPubkey,
            network: network,
          ),
        );
      }

      final cpfpRefundTx = refundTxsResult.cpfpRefundTx;
      final directRefundTx = refundTxsResult.directRefundTx;
      final directFromCpfpRefundTx = refundTxsResult.directFromCpfpRefundTx;

      final sequenceBytes = nodeTx.inputs.firstOrNull?.sequence;
      final sequenceInt = (sequenceBytes != null && sequenceBytes.length >= 4)
          ? ByteData.sublistView(
              Uint8List.fromList(sequenceBytes),
            ).getUint32(0, Endian.little)
          : null;
      final isZeroNode = getCurrentTimelock(sequenceInt) == 0;
      refundSigningData.refundTx = cpfpRefundTx;
      refundSigningData.directRefundTx = (directRefundTx != null && !isZeroNode)
          ? directRefundTx
          : null;
      refundSigningData.directFromCpfpRefundTx = directFromCpfpRefundTx;

      final cpfpRefundNonceCommitmentProto =
          refundSigningData.signingNonceCommitment;
      final directRefundNonceCommitmentProto =
          refundSigningData.directSigningNonceCommitment;
      final directFromCpfpRefundNonceCommitmentProto =
          refundSigningData.directFromCpfpRefundSigningNonceCommitment;

      final signingPublicKey = await config.signer.getPublicKeyFromDerivation(
        keyDerivation: refundSigningData.keyDerivation,
      );

      final job = LeafRefundTxSigningJob(
        leafId: leaf.leaf.id,
        refundTxSigningJob: SigningJob(
          signingPublicKey: signingPublicKey,
          rawTx: cpfpRefundTx
              .toBytes(), // Assuming Dart Transaction toBytes exists
          signingNonceCommitment: cpfpRefundNonceCommitmentProto.commitment
              .toProto(),
        ),
      );

      if (directRefundTx != null && !isZeroNode) {
        job.directRefundTxSigningJob = SigningJob(
          signingPublicKey: signingPublicKey,
          rawTx: directRefundTx.toBytes(),
          signingNonceCommitment: directRefundNonceCommitmentProto.commitment
              .toProto(),
        );
      }

      if (directFromCpfpRefundTx != null) {
        job.directFromCpfpRefundTxSigningJob = SigningJob(
          signingPublicKey: signingPublicKey,
          rawTx: directFromCpfpRefundTx.toBytes(),
          signingNonceCommitment: directFromCpfpRefundNonceCommitmentProto
              .commitment
              .toProto(),
        );
      }

      return job;
    }).toList();

    final results = await Future.wait(futures);

    for (final result in results) {
      signingJobs.add(result);
    }

    return signingJobs;
  }

  // ===========================================================================
  // CHUNK: Claim Package & Key Tweaks
  // (Continuing inside the TransferService class...)
  // ===========================================================================

  Future<void> claimTransferTweakKeys(
    Transfer transfer,
    List<LeafKeyTweak> leaves,
  ) async {
    final leavesTweaksMap = await _prepareClaimLeavesKeyTweaks(leaves);

    final errors = <Exception>[];

    final futures = config.getSigningOperators().entries.map((entry) async {
      final identifier = entry.key;
      final operator = entry.value;

      final sparkClient = await connectionManager.createSparkClient(
        operator.address,
      );

      final leavesToReceive = leavesTweaksMap[identifier];
      if (leavesToReceive == null) {
        errors.add(
          SparkValidationError(
            "No leaves to receive for operator",
            context: {'field': "operator", 'value': identifier},
          ),
        );
        return;
      }

      try {
        // Assuming ClaimTransferTweakKeysRequest matches the generated proto wrapper
        await sparkClient.claim_transfer_tweak_keys(
          ClaimTransferTweakKeysRequest(
            transferId: transfer.id,
            ownerIdentityPublicKey: await config.signer.getIdentityPublicKey(),
            leavesToReceive: leavesToReceive,
          ),
        );
      } catch (error) {
        errors.add(
          SparkRequestError(
            "Failed to claim transfer tweak keys",
            context: {'method': "POST", 'error': error},
          ),
        );
        return;
      }
    }).toList();

    await Future.wait(futures);

    if (errors.isNotEmpty) {
      throw errors.first;
    }
  }

  Future<ClaimPackage> _prepareClaimPackage(
    String transferId,
    List<LeafKeyTweak> leaves,
  ) async {
    final leavesTweaksMap = await _prepareClaimLeavesKeyTweaks(leaves);

    final sparkFrost = getSparkFrost();
    final encryptedKeyTweaksEntries = await Future.wait(
      leavesTweaksMap.entries.map((entry) async {
        final key = entry.key;
        final value = entry.value;
        final protoToEncrypt = ClaimLeafKeyTweaks(leavesToReceive: value);
        final protoToEncryptBinary = protoToEncrypt.writeToBuffer();
        final operator = config.getSigningOperators()[key];
        if (operator == null) {
          throw SparkValidationError("Operator not found");
        }
        final encryptedProto = await sparkFrost.encryptEcies(
          protoToEncryptBinary,
          hexToBytes(operator.identityPublicKey),
        );

        return MapEntry(key, Uint8List.fromList(encryptedProto));
      }),
    );

    final keyTweakPackage = Map.fromEntries(encryptedKeyTweaksEntries);

    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    final signingCommitments = await sparkClient.get_signing_commitments(
      GetSigningCommitmentsRequest(nodeIdCount: leaves.length, count: 3),
    );

    final expectedCommitments = 3 * leaves.length;
    if (signingCommitments.signingCommitments.length != expectedCommitments) {
      throw SparkValidationError(
        "Expected $expectedCommitments signing commitments, got ${signingCommitments.signingCommitments.length}",
      );
    }

    final claimLeavesFutures = leaves.map((leaf) async {
      return LeafKeyTweak(
        leaf: leaf.leaf,
        keyDerivation: leaf.newKeyDerivation,
        newKeyDerivation: leaf.newKeyDerivation,
        receiverIdentityPublicKey: await config.signer
            .getPublicKeyFromDerivation(keyDerivation: leaf.newKeyDerivation),
      );
    }).toList();

    final claimLeaves = await Future.wait(claimLeavesFutures);

    final signRefundsResult = await signingService.signRefundsForClaim(
      claimLeaves,
      signingCommitments.signingCommitments.sublist(0, leaves.length),
      signingCommitments.signingCommitments.sublist(
        leaves.length,
        2 * leaves.length,
      ),
      signingCommitments.signingCommitments.sublist(
        2 * leaves.length,
        3 * leaves.length,
      ),
    );

    final cpfpLeafSigningJobs = signRefundsResult.cpfpLeafSigningJobs;
    final directLeafSigningJobs = signRefundsResult.directLeafSigningJobs;
    final directFromCpfpLeafSigningJobs =
        signRefundsResult.directFromCpfpLeafSigningJobs;

    final claimPackage = ClaimPackage(
      leavesToClaim: cpfpLeafSigningJobs
          .map((j) => j.job)
          .toList(), // Map wrapper to raw proto
      keyTweakPackage: keyTweakPackage.entries,
      userSignature: Uint8List(0),
      directLeavesToClaim: directLeafSigningJobs.map((j) => j.job).toList(),
      directFromCpfpLeavesToClaim: directFromCpfpLeafSigningJobs
          .map((j) => j.job)
          .toList(),
      hashVariant: HashVariant.HASH_VARIANT_V2,
    );

    final signingPayload = getClaimPackageSigningPayload(
      transferId,
      keyTweakPackage,
    );

    final signature = await config.signer.signMessageWithIdentityKey(
      signingPayload,
    );
    claimPackage.userSignature = Uint8List.fromList(signature);

    return claimPackage;
  }

  Future<Map<String, List<ClaimLeafKeyTweak>>> _prepareClaimLeavesKeyTweaks(
    List<LeafKeyTweak> leaves,
  ) async {
    final leafDataMap = <String, List<ClaimLeafKeyTweak>>{};

    final futures = leaves
        .map((leaf) => _prepareClaimLeafKeyTweaks(leaf))
        .toList();
    final results = await Future.wait(futures);

    for (final result in results) {
      final leafData = result.leafKeyTweaks;
      for (final entry in leafData.entries) {
        final identifier = entry.key;
        final leafTweak = entry.value;
        leafDataMap.putIfAbsent(identifier, () => []).add(leafTweak);
      }
    }

    return leafDataMap;
  }

  Future<
    ({Map<String, ClaimLeafKeyTweak> leafKeyTweaks, List<Uint8List> proofs})
  >
  _prepareClaimLeafKeyTweaks(LeafKeyTweak leaf) async {
    final signingOperators = config.getSigningOperators();

    // Constant mapped for @noble/curves secp256k1.CURVE.n
    final curveOrder = secp256k1FFI.constants.nBE;

    final subtractResult = await config.signer
        .subtractAndSplitSecretWithProofsGivenDerivations(
          first: leaf.keyDerivation,
          second: leaf.newKeyDerivation,
          curveOrder: curveOrder,
          threshold: config.getThreshold(),
          numShares: signingOperators.length,
        );

    final shares =
        subtractResult; //.shares; // Expected to be List<VerifiableSecretShare>

    final pubkeySharesTweak = <String, Uint8List>{};

    for (final entry in signingOperators.entries) {
      final identifier = entry.key;
      final operator = entry.value;

      // _findShare comes from BaseTransferService
      final share = _findShare(shares, operator.id);
      if (share == null) {
        throw Exception("Share not found for operator ${operator.id}");
      }

      // Using assumed secp256k1 wrapper
      // 1. Load the private key scalar from the Uint8List
      final privateKey = share.share;

      // 2. Derive the public key and explicitly grab the compressed bytes
      final pubkeyTweak = secp256k1FFI.privateKey.createPubKey(privateKey);

      pubkeySharesTweak[identifier] = pubkeyTweak!;
    }

    final leafTweaksMap = <String, ClaimLeafKeyTweak>{};
    for (final entry in signingOperators.entries) {
      final identifier = entry.key;
      final operator = entry.value;

      final share = _findShare(shares, operator.id);
      if (share == null) {
        throw Exception("Share not found for operator ${operator.id}");
      }

      leafTweaksMap[identifier] = ClaimLeafKeyTweak(
        leafId: leaf.leaf.id,
        secretShareTweak: SecretShare(
          secretShare: share.share,
          proofs: share.proofs, // Assuming List<Uint8List> maps correctly
        ),
        pubkeySharesTweak: pubkeySharesTweak.entries,
      );
    }

    if (shares.isEmpty || shares[0].proofs.isEmpty) {
      throw SparkValidationError(
        "Proofs not found",
        context: {
          'field': "proofs",
          'value': shares.isEmpty ? null : shares[0].proofs,
        },
      );
    }

    return (leafKeyTweaks: leafTweaksMap, proofs: shares[0].proofs);
  }

  // ===========================================================================
  // CHUNK: Claim Signatures & Timelock Renewals
  // (Completing the TransferService class...)
  // ===========================================================================

  Future<List<NodeSignatures>> claimTransferSignRefunds(
    Transfer transfer,
    List<LeafKeyTweak> leafKeys,
  ) async {
    final leafDataMap = <String, LeafRefundSigningData>{};

    final futures = leafKeys.map((leafKey) async {
      final tx = getTxFromRawTxBytes(Uint8List.fromList(leafKey.leaf.nodeTx));
      final directTx = leafKey.leaf.directTx.isNotEmpty
          ? getTxFromRawTxBytes(Uint8List.fromList(leafKey.leaf.directTx))
          : null;

      leafDataMap[leafKey.leaf.id] = LeafRefundSigningData(
        keyDerivation: leafKey.newKeyDerivation,
        receivingPubkey: await config.signer.getPublicKeyFromDerivation(
          keyDerivation: leafKey.newKeyDerivation,
        ),
        signingNonceCommitment: await config.signer
            .getRandomSigningCommitment(),
        directSigningNonceCommitment: await config.signer
            .getRandomSigningCommitment(),
        directFromCpfpRefundSigningNonceCommitment: await config.signer
            .getRandomSigningCommitment(),
        tx: tx,
        directTx: directTx,
        vout: leafKey.leaf.vout,
      );
    }).toList();

    await Future.wait(futures);

    final signingJobs = await _prepareRefundSoSigningJobs(
      leafKeys,
      leafDataMap,
      true, // isForClaim
    );

    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    ClaimTransferSignRefundsResponse resp;

    try {
      resp = await sparkClient.claim_transfer_sign_refunds_v2(
        ClaimTransferSignRefundsRequest(
          transferId: transfer.id,
          ownerIdentityPublicKey: await config.signer.getIdentityPublicKey(),
          signingJobs: signingJobs,
        ),
      );
    } catch (error) {
      throw SparkRequestError(
        "Failed to claim transfer sign refunds",
        context: {'method': "POST", 'error': error},
      );
    }

    return signRefunds(leafDataMap, resp.signingResults);
  }

  // // unused, but also unused in the SDK
  // Future<dynamic> _finalizeNodeSignatures(
  //   List<NodeSignatures> nodeSignatures,
  // ) async {
  //   final sparkClient = await connectionManager.createSparkClient(
  //     config.getCoordinatorAddress(),
  //   );
  //   try {
  //     return await sparkClient.finalize_node_signatures_v2(
  //       FinalizeNodeSignaturesRequest(
  //         intent: SignatureIntent.TRANSFER,
  //         nodeSignatures: nodeSignatures,
  //       ),
  //     );
  //   } catch (error) {
  //     throw Exception("Error finalizing node signatures in transfer: $error");
  //   }
  // }

  Future<QueryTransfersResponse> queryPendingTransfersBySender(
    String operatorAddress,
  ) async {
    final sparkClient = await connectionManager.createSparkClient(
      operatorAddress,
    );
    try {
      return await sparkClient.query_pending_transfers(
        TransferFilter(
          senderIdentityPublicKey: await config.signer.getIdentityPublicKey(),
        ),
      );
    } catch (error) {
      throw Exception("Error querying pending transfers by sender: $error");
    }
  }

  Future<TreeNode> renewRefundTxn(TreeNode node, TreeNode parentNode) async {
    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    // Intentionally allowing compiler error for missing method per instructions
    final signingJobs = await _createRenewRefundSigningJobs(node, parentNode);

    final statechainCommitments = await sparkClient.get_signing_commitments(
      GetSigningCommitmentsRequest(
        nodeIds: [node.id],
        count: signingJobs.length,
      ),
    );

    final mappedSigningJobs = <FullSigningJobRequest>[];

    for (int i = 0; i < signingJobs.length; i++) {
      final signingJob = signingJobs[i];
      final signingNonceCommitments =
          statechainCommitments.signingCommitments.length > i
          ? statechainCommitments.signingCommitments[i].signingNonceCommitments
          : null;

      if (signingNonceCommitments == null) {
        throw Exception("Signing nonce commitments not found");
      }

      // Reusing the FullSigningJobRequest structure established in signing logic
      mappedSigningJobs.add(
        FullSigningJobRequest(
          leafId: signingJob.leafId,
          type: signingJob.type,
          keyDerivation: signingJob.keyDerivation,
          signingPublicKey: signingJob.signingPublicKey,
          verifyingKey: signingJob.verifyingKey,
          rawTx: signingJob.rawTx,
          parentTxOut: signingJob.parentTxOut!,
          signingNonceCommitment: signingJob.signingNonceCommitment,
          signingNonceCommitments: signingNonceCommitments.map(
            (k, v) => MapEntry(
              k,
              SigningCommitment(
                hiding: Uint8List.fromList(v.hiding),
                binding: Uint8List.fromList(v.binding),
              ),
            ),
          ),
        ),
      );
    }

    final userSignedTxSigningJobs = await signingService.signSigningJobs(
      mappedSigningJobs,
    );

    final renewRefundTimelockSigningJob = RenewRefundTimelockSigningJob(
      nodeTxSigningJob: userSignedTxSigningJobs[SigningJobType.node],
      refundTxSigningJob: userSignedTxSigningJobs[SigningJobType.cpfp],
      directNodeTxSigningJob:
          userSignedTxSigningJobs[SigningJobType.directNode],
      directRefundTxSigningJob: userSignedTxSigningJobs[SigningJobType.direct],
      directFromCpfpRefundTxSigningJob:
          userSignedTxSigningJobs[SigningJobType.directFromCpfp],
    );

    final response = await sparkClient.renew_leaf(
      RenewLeafRequest(
        leafId: node.id,
        renewRefundTimelockSigningJob: renewRefundTimelockSigningJob,
      ),
      options: optionsWithIdempotencyKey(
        getTxFromRawTxBytes(Uint8List.fromList(node.refundTx)).txId(),
      ),
    );

    if (!response.hasRenewRefundTimelockResult() ||
        !response.renewRefundTimelockResult.hasNode()) {
      throw SparkValidationError(
        "Unexpected renew result",
        context: {'field': "renewResult", 'value': response},
      );
    }

    return response.renewRefundTimelockResult.node;
  }

  Future<TreeNode> renewNodeTxn(TreeNode node, TreeNode parentNode) async {
    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    // Intentionally allowing compiler error for missing method per instructions
    final signingJobs = await _createRenewNodeSigningJobs(node, parentNode);

    final statechainCommitments = await sparkClient.get_signing_commitments(
      GetSigningCommitmentsRequest(
        nodeIds: [node.id],
        count: signingJobs.length,
      ),
    );

    final mappedSigningJobs = <FullSigningJobRequest>[];

    for (int i = 0; i < signingJobs.length; i++) {
      final signingJob = signingJobs[i];
      final signingNonceCommitments =
          statechainCommitments.signingCommitments.length > i
          ? statechainCommitments.signingCommitments[i].signingNonceCommitments
          : null;

      if (signingNonceCommitments == null) {
        throw Exception("Signing nonce commitments not found");
      }

      mappedSigningJobs.add(
        FullSigningJobRequest(
          leafId: signingJob.leafId,
          type: signingJob.type,
          keyDerivation: signingJob.keyDerivation,
          signingPublicKey: signingJob.signingPublicKey,
          verifyingKey: signingJob.verifyingKey,
          rawTx: signingJob.rawTx,
          parentTxOut: signingJob.parentTxOut!,
          signingNonceCommitment: signingJob.signingNonceCommitment,
          signingNonceCommitments: signingNonceCommitments.map(
            (k, v) => MapEntry(
              k,
              SigningCommitment(
                hiding: Uint8List.fromList(v.hiding),
                binding: Uint8List.fromList(v.binding),
              ),
            ),
          ),
        ),
      );
    }

    final userSignedTxSigningJobs = await signingService.signSigningJobs(
      mappedSigningJobs,
    );

    final response = await sparkClient.renew_leaf(
      RenewLeafRequest(
        leafId: node.id,
        renewNodeTimelockSigningJob: RenewNodeTimelockSigningJob(
          splitNodeTxSigningJob: userSignedTxSigningJobs[SigningJobType.split],
          splitNodeDirectTxSigningJob:
              userSignedTxSigningJobs[SigningJobType.directSplit],
          nodeTxSigningJob: userSignedTxSigningJobs[SigningJobType.node],
          directNodeTxSigningJob:
              userSignedTxSigningJobs[SigningJobType.directNode],
          refundTxSigningJob: userSignedTxSigningJobs[SigningJobType.cpfp],
          directRefundTxSigningJob:
              userSignedTxSigningJobs[SigningJobType.direct],
          directFromCpfpRefundTxSigningJob:
              userSignedTxSigningJobs[SigningJobType.directFromCpfp],
        ),
      ),
      options: optionsWithIdempotencyKey(
        getTxFromRawTxBytes(Uint8List.fromList(node.refundTx)).txId(),
      ),
    );

    if (!response.hasRenewNodeTimelockResult() ||
        !response.renewNodeTimelockResult.hasNode()) {
      throw SparkValidationError(
        "Unexpected renew result",
        context: {'field': "renewResult", 'value': response},
      );
    }

    return response.renewNodeTimelockResult.node;
  }

  // ===========================================================================
  // CHUNK: Renew Signing Jobs
  // (Completing the TransferService class...)
  // ===========================================================================

  Future<List<SigningJobWithOptionalNonce>> _createRenewRefundSigningJobs(
    TreeNode node,
    TreeNode parentNode,
  ) async {
    final signingJobs = <SigningJobWithOptionalNonce>[];

    final parentTx = getTxFromRawTxBytes(Uint8List.fromList(parentNode.nodeTx));

    final parentNodeOutput = parentTx.outputs.elementAtOrNull(0);
    if (parentNodeOutput == null) {
      throw Exception("Parent node output not found");
    }

    // Assuming a local data class or map representing TransactionOutput properties
    final unsignedParentNodeOutput = parentNodeOutput;

    final keyDerivation = LeafKeyDerivation(path: node.id);
    final signingPublicKey = await config.signer.getPublicKeyFromDerivation(
      keyDerivation: keyDerivation,
    );

    final nodeTx = getTxFromRawTxBytes(Uint8List.fromList(node.nodeTx));
    final refundTx = getTxFromRawTxBytes(Uint8List.fromList(node.refundTx));

    final createDecrementedResult = await createDecrementedTimelockNodeTx(
      parentTx,
      nodeTx,
      config.getNetwork(),
    );

    final newNodeTx = createDecrementedResult.nodeTx;
    final newDirectNodeTx = createDecrementedResult.directNodeTx;

    signingJobs.add(
      SigningJobWithOptionalNonce(
        signingPublicKey: signingPublicKey,
        rawTx: Uint8List.fromList(newNodeTx.toBytes()),
        signingNonceCommitment: await config.signer
            .getRandomSigningCommitment(),
        type: SigningJobType.node,
        parentTxOut: unsignedParentNodeOutput,
        leafId: node.id,
        keyDerivation: LeafKeyDerivation(path: node.id),
        verifyingKey: Uint8List.fromList(node.verifyingPublicKey),
      ),
    );

    if (newDirectNodeTx != null) {
      signingJobs.add(
        SigningJobWithOptionalNonce(
          signingPublicKey: signingPublicKey,
          rawTx: Uint8List.fromList(newDirectNodeTx.toBytes()),
          signingNonceCommitment: await config.signer
              .getRandomSigningCommitment(),
          type: SigningJobType.directNode,
          parentTxOut: unsignedParentNodeOutput,
          leafId: node.id,
          keyDerivation: LeafKeyDerivation(path: node.id),
          verifyingKey: Uint8List.fromList(node.verifyingPublicKey),
        ),
      );
    }

    final newCpfpNodeOutput = newNodeTx.outputs.elementAtOrNull(0);
    if (newCpfpNodeOutput == null) {
      throw Exception("Could not get new cpfp node output");
    }

    final newDirectNodeOutput = newDirectNodeTx?.outputs.elementAtOrNull(0);

    final amountSats = refundTx.outputs.elementAtOrNull(0)?.amount;
    if (amountSats == null) {
      throw Exception("Amount not found in extendTimelock");
    }

    final directAmountSats = newDirectNodeOutput?.amount;
    if (directAmountSats == null) {
      throw Exception("Amount not found in extendTimelock");
    }

    final createInitialRefundTxsResult = await createInitialTimelockRefundTxs(
      RefundTxParams(
        nodeTx: newNodeTx,
        directNodeTx: newDirectNodeTx,
        receivingPubkey: signingPublicKey,
        network: config.getNetwork(),
      ),
    );

    final newRefundTx = createInitialRefundTxsResult.cpfpRefundTx;
    final newDirectRefundTx = createInitialRefundTxsResult.directRefundTx;
    final newDirectFromCpfpRefundTx =
        createInitialRefundTxsResult.directFromCpfpRefundTx;

    signingJobs.add(
      SigningJobWithOptionalNonce(
        signingPublicKey: signingPublicKey,
        rawTx: Uint8List.fromList(newRefundTx.toBytes()),
        signingNonceCommitment: await config.signer
            .getRandomSigningCommitment(),
        type: SigningJobType.cpfp,
        parentTxOut: newCpfpNodeOutput,
        leafId: node.id,
        keyDerivation: keyDerivation,
        verifyingKey: Uint8List.fromList(node.verifyingPublicKey),
      ),
    );

    if (newDirectRefundTx != null && newDirectNodeOutput != null) {
      signingJobs.add(
        SigningJobWithOptionalNonce(
          signingPublicKey: signingPublicKey,
          rawTx: Uint8List.fromList(newDirectRefundTx.toBytes()),
          signingNonceCommitment: await config.signer
              .getRandomSigningCommitment(),
          type: SigningJobType.direct,
          parentTxOut: newDirectNodeOutput,
          leafId: node.id,
          keyDerivation: keyDerivation,
          verifyingKey: Uint8List.fromList(node.verifyingPublicKey),
        ),
      );
    }

    if (newDirectFromCpfpRefundTx != null && newDirectNodeOutput != null) {
      signingJobs.add(
        SigningJobWithOptionalNonce(
          signingPublicKey: signingPublicKey,
          rawTx: Uint8List.fromList(newDirectFromCpfpRefundTx.toBytes()),
          signingNonceCommitment: await config.signer
              .getRandomSigningCommitment(),
          type: SigningJobType.directFromCpfp,
          parentTxOut: newCpfpNodeOutput,
          leafId: node.id,
          keyDerivation: keyDerivation,
          verifyingKey: Uint8List.fromList(node.verifyingPublicKey),
        ),
      );
    }

    return signingJobs;
  }

  Future<List<SigningJobWithOptionalNonce>> _createRenewNodeSigningJobs(
    TreeNode node,
    TreeNode parentNode,
  ) async {
    final signingJobs = <SigningJobWithOptionalNonce>[];

    final parentTx = getTxFromRawTxBytes(Uint8List.fromList(parentNode.nodeTx));
    final parentNodeOutput = parentTx.outputs.elementAtOrNull(0);

    final unsignedParentNodeOutput = parentNodeOutput;

    final keyDerivation = LeafKeyDerivation(path: node.id);
    final signingPublicKey = await config.signer.getPublicKeyFromDerivation(
      keyDerivation: keyDerivation,
    );

    final createZeroNodeResult = await createZeroTimelockNodeTx(
      parentTx,
      config.getNetwork(),
    );

    final splitNodeTx = createZeroNodeResult.nodeTx;
    final splitNodeDirectTx = createZeroNodeResult.directNodeTx;

    signingJobs.add(
      SigningJobWithOptionalNonce(
        signingPublicKey: signingPublicKey,
        rawTx: Uint8List.fromList(splitNodeTx.toBytes()),
        signingNonceCommitment: await config.signer
            .getRandomSigningCommitment(),
        type: SigningJobType.split,
        parentTxOut: unsignedParentNodeOutput,
        leafId: node.id,
        keyDerivation: keyDerivation,
        verifyingKey: Uint8List.fromList(node.verifyingPublicKey),
      ),
    );

    if (splitNodeDirectTx != null) {
      signingJobs.add(
        SigningJobWithOptionalNonce(
          signingPublicKey: signingPublicKey,
          rawTx: Uint8List.fromList(splitNodeDirectTx.toBytes()),
          signingNonceCommitment: await config.signer
              .getRandomSigningCommitment(),
          type: SigningJobType.directSplit,
          parentTxOut: unsignedParentNodeOutput,
          leafId: node.id,
          keyDerivation: keyDerivation,
          verifyingKey: Uint8List.fromList(node.verifyingPublicKey),
        ),
      );
    }

    final splitNodeOutput = splitNodeTx.outputs.elementAtOrNull(0);
    final splitNodeDirectOutput = splitNodeDirectTx?.outputs.elementAtOrNull(0);

    if (splitNodeDirectOutput?.amount == null ||
        splitNodeDirectOutput?.scriptPubKey == null) {
      throw Exception("Could not get split node output");
    }

    // final unsignedSplitNodeOutput =
    //     splitNodeDirectOutput; // just added because it's in the SDK, but not used

    final createInitialNodeResult = await createInitialTimelockNodeTx(
      splitNodeTx,
      config.getNetwork(),
    );

    final newNodeTx = createInitialNodeResult.nodeTx;
    final newDirectNodeTx = createInitialNodeResult.directNodeTx;

    signingJobs.add(
      SigningJobWithOptionalNonce(
        signingPublicKey: signingPublicKey,
        rawTx: Uint8List.fromList(newNodeTx.toBytes()),
        signingNonceCommitment: await config.signer
            .getRandomSigningCommitment(),
        type: SigningJobType.node,
        parentTxOut: splitNodeOutput,
        leafId: node.id,
        keyDerivation: keyDerivation,
        verifyingKey: Uint8List.fromList(node.verifyingPublicKey),
      ),
    );

    if (newDirectNodeTx != null) {
      signingJobs.add(
        SigningJobWithOptionalNonce(
          signingPublicKey: signingPublicKey,
          rawTx: Uint8List.fromList(newDirectNodeTx.toBytes()),
          signingNonceCommitment: await config.signer
              .getRandomSigningCommitment(),
          type: SigningJobType.directNode,
          parentTxOut: splitNodeOutput,
          leafId: node.id,
          keyDerivation: keyDerivation,
          verifyingKey: Uint8List.fromList(node.verifyingPublicKey),
        ),
      );
    }

    final newCpfpNodeOutput = newNodeTx.outputs.elementAtOrNull(0);
    if (newCpfpNodeOutput == null) {
      throw Exception("Could not get new cpfp node output");
    }

    final newDirectNodeOutput = newDirectNodeTx?.outputs.elementAtOrNull(0);

    final createInitialRefundTxsResult = await createInitialTimelockRefundTxs(
      RefundTxParams(
        nodeTx: newNodeTx,
        directNodeTx: newDirectNodeTx,
        receivingPubkey: signingPublicKey,
        network: config.getNetwork(),
      ),
    );

    final newRefundTx = createInitialRefundTxsResult.cpfpRefundTx;
    final newDirectRefundTx = createInitialRefundTxsResult.directRefundTx;
    final newDirectFromCpfpRefundTx =
        createInitialRefundTxsResult.directFromCpfpRefundTx;

    signingJobs.add(
      SigningJobWithOptionalNonce(
        signingPublicKey: signingPublicKey,
        rawTx: Uint8List.fromList(newRefundTx.toBytes()),
        signingNonceCommitment: await config.signer
            .getRandomSigningCommitment(),
        type: SigningJobType.cpfp,
        parentTxOut: newCpfpNodeOutput,
        leafId: node.id,
        keyDerivation: keyDerivation,
        verifyingKey: Uint8List.fromList(node.verifyingPublicKey),
      ),
    );

    if (newDirectRefundTx != null && newDirectNodeOutput != null) {
      signingJobs.add(
        SigningJobWithOptionalNonce(
          signingPublicKey: signingPublicKey,
          rawTx: Uint8List.fromList(newDirectRefundTx.toBytes()),
          signingNonceCommitment: await config.signer
              .getRandomSigningCommitment(),
          type: SigningJobType.direct,
          parentTxOut: newDirectNodeOutput,
          leafId: node.id,
          keyDerivation: keyDerivation,
          verifyingKey: Uint8List.fromList(node.verifyingPublicKey),
        ),
      );
    }

    if (newDirectFromCpfpRefundTx != null && newDirectNodeOutput != null) {
      signingJobs.add(
        SigningJobWithOptionalNonce(
          signingPublicKey: signingPublicKey,
          rawTx: Uint8List.fromList(newDirectFromCpfpRefundTx.toBytes()),
          signingNonceCommitment: await config.signer
              .getRandomSigningCommitment(),
          type: SigningJobType.directFromCpfp,
          parentTxOut: newCpfpNodeOutput,
          leafId: node.id,
          keyDerivation: keyDerivation,
          verifyingKey: Uint8List.fromList(node.verifyingPublicKey),
        ),
      );
    }

    return signingJobs;
  }

  // ===========================================================================
  // CHUNK: Renew Zero Timelock and Final Claim Transfer
  // (Completing the TransferService class...)
  // ===========================================================================

  Future<TreeNode> renewZeroTimelockNodeTxn(TreeNode node) async {
    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    final signingJobs = await _createRenewZeroTimelockNodeSigningJobs(node);

    final statechainCommitments = await sparkClient.get_signing_commitments(
      GetSigningCommitmentsRequest(
        nodeIds: [node.id],
        count: signingJobs.length,
      ),
    );

    final mappedSigningJobs = <FullSigningJobRequest>[];

    for (int i = 0; i < signingJobs.length; i++) {
      final signingJob = signingJobs[i];
      final signingNonceCommitments =
          statechainCommitments.signingCommitments.length > i
          ? statechainCommitments.signingCommitments[i].signingNonceCommitments
          : null;

      if (signingNonceCommitments == null) {
        throw SparkValidationError(
          "Signing nonce commitments not found",
          context: {
            'field': "signingNonceCommitments",
            'value': signingNonceCommitments,
          },
        );
      }

      mappedSigningJobs.add(
        FullSigningJobRequest(
          leafId: signingJob.leafId,
          type: signingJob.type,
          keyDerivation: signingJob.keyDerivation,
          signingPublicKey: signingJob.signingPublicKey,
          verifyingKey: signingJob.verifyingKey,
          rawTx: signingJob.rawTx,
          parentTxOut: signingJob.parentTxOut!,
          signingNonceCommitment: signingJob.signingNonceCommitment,
          signingNonceCommitments: signingNonceCommitments.map(
            (k, v) => MapEntry(
              k,
              SigningCommitment(
                hiding: Uint8List.fromList(v.hiding),
                binding: Uint8List.fromList(v.binding),
              ),
            ),
          ),
        ),
      );
    }

    final userSignedTxSigningJobs = await signingService.signSigningJobs(
      mappedSigningJobs,
    );

    final renewZeroTimelockNodeSigningJob = RenewNodeZeroTimelockSigningJob(
      nodeTxSigningJob: userSignedTxSigningJobs[SigningJobType.node],
      refundTxSigningJob: userSignedTxSigningJobs[SigningJobType.cpfp],
      directNodeTxSigningJob:
          userSignedTxSigningJobs[SigningJobType.directNode],
      directFromCpfpRefundTxSigningJob:
          userSignedTxSigningJobs[SigningJobType.directFromCpfp],
    );

    final response = await sparkClient.renew_leaf(
      RenewLeafRequest(
        leafId: node.id,
        renewNodeZeroTimelockSigningJob: renewZeroTimelockNodeSigningJob,
      ),
      options: optionsWithIdempotencyKey(
        getTxFromRawTxBytes(Uint8List.fromList(node.refundTx)).txId(),
      ),
    );

    if (!response.hasRenewNodeZeroTimelockResult() ||
        !response.renewNodeZeroTimelockResult.hasNode()) {
      throw SparkValidationError(
        "Unexpected renew result",
        context: {'field': "renewResult", 'value': response},
      );
    }

    return response.renewNodeZeroTimelockResult.node;
  }

  Future<List<SigningJobWithOptionalNonce>>
  _createRenewZeroTimelockNodeSigningJobs(TreeNode node) async {
    final signingJobs = <SigningJobWithOptionalNonce>[];

    final keyDerivation = LeafKeyDerivation(path: node.id);
    final signingPublicKey = await config.signer.getPublicKeyFromDerivation(
      keyDerivation: keyDerivation,
    );

    final nodeTx = getTxFromRawTxBytes(Uint8List.fromList(node.nodeTx));

    final createZeroNodeResult = await createZeroTimelockNodeTx(
      nodeTx,
      config.getNetwork(),
    );

    final newNodeTx = createZeroNodeResult.nodeTx;
    final newDirectNodeTx = createZeroNodeResult.directNodeTx;

    final parentTxOut = nodeTx.outputs.elementAtOrNull(0);
    if (parentTxOut == null) {
      throw Exception("Could not get parent tx output");
    }

    signingJobs.add(
      SigningJobWithOptionalNonce(
        signingPublicKey: signingPublicKey,
        rawTx: Uint8List.fromList(newNodeTx.toBytes()),
        signingNonceCommitment: await config.signer
            .getRandomSigningCommitment(),
        type: SigningJobType.node,
        parentTxOut: parentTxOut,
        leafId: node.id,
        keyDerivation: keyDerivation,
        verifyingKey: Uint8List.fromList(node.verifyingPublicKey),
      ),
    );

    if (newDirectNodeTx != null) {
      signingJobs.add(
        SigningJobWithOptionalNonce(
          signingPublicKey: signingPublicKey,
          rawTx: Uint8List.fromList(newDirectNodeTx.toBytes()),
          signingNonceCommitment: await config.signer
              .getRandomSigningCommitment(),
          type: SigningJobType.directNode,
          parentTxOut: parentTxOut,
          leafId: node.id,
          keyDerivation: keyDerivation,
          verifyingKey: Uint8List.fromList(node.verifyingPublicKey),
        ),
      );
    }

    final newCpfpNodeOutput = newNodeTx.outputs.elementAtOrNull(0);
    if (newCpfpNodeOutput == null) {
      throw Exception("Could not get new cpfp node output");
    }

    // direct refund spending direct node tx
    final createInitialRefundTxsResult = await createInitialTimelockRefundTxs(
      RefundTxParams(
        nodeTx: newNodeTx,
        directNodeTx: newDirectNodeTx,
        receivingPubkey: signingPublicKey,
        network: config.getNetwork(),
      ),
    );

    final cpfpRefundTx = createInitialRefundTxsResult.cpfpRefundTx;
    final directFromCpfpRefundTx =
        createInitialRefundTxsResult.directFromCpfpRefundTx;

    signingJobs.add(
      SigningJobWithOptionalNonce(
        signingPublicKey: signingPublicKey,
        rawTx: Uint8List.fromList(cpfpRefundTx.toBytes()),
        signingNonceCommitment: await config.signer
            .getRandomSigningCommitment(),
        type: SigningJobType.cpfp,
        parentTxOut: newCpfpNodeOutput,
        leafId: node.id,
        keyDerivation: keyDerivation,
        verifyingKey: Uint8List.fromList(node.verifyingPublicKey),
      ),
    );

    if (directFromCpfpRefundTx == null) {
      throw Exception("Could not create direct refund transactions");
    }

    signingJobs.add(
      SigningJobWithOptionalNonce(
        signingPublicKey: signingPublicKey,
        rawTx: Uint8List.fromList(directFromCpfpRefundTx.toBytes()),
        signingNonceCommitment: await config.signer
            .getRandomSigningCommitment(),
        type: SigningJobType.directFromCpfp,
        parentTxOut: newCpfpNodeOutput,
        leafId: node.id,
        keyDerivation: keyDerivation,
        verifyingKey: Uint8List.fromList(node.verifyingPublicKey),
      ),
    );

    return signingJobs;
  }

  Future<List<TreeNode>> claimTransfer(Transfer transfer) async {
    Future<List<TreeNode>?> onError(
      RetryContext<List<TreeNode>, Transfer> context,
    ) async {
      final error = context.error;

      // 1. Check if it's a SparkRequestError
      if (error is SparkRequestError) {
        final origError = error.originalError;

        // 2. Check if the original error is a GrpcError with the ALREADY_EXISTS status
        if (origError is GrpcError &&
            origError.code == StatusCode.alreadyExists) {
          final transferToUse = context.data ?? transfer;
          final updatedTransfer = await queryTransfer(transferToUse.id);

          if (updatedTransfer == null ||
              updatedTransfer.status !=
                  TransferStatus.TRANSFER_STATUS_COMPLETED) {
            return null;
          }

          final leaves = <TreeNode>[];
          for (final leaf in updatedTransfer.leaves) {
            if (leaf.hasLeaf()) {
              leaves.add(leaf.leaf);
            }
          }

          return leaves;
        }
      }
      return null;
    }

    Future<Transfer?> fetchData(
      RetryContext<List<TreeNode>, Transfer> context,
    ) async {
      final transferToUse = context.data ?? transfer;
      final updatedTransfer = await queryPendingTransfers([transferToUse.id]);

      if (updatedTransfer.transfers.isEmpty) {
        return null;
      }
      return updatedTransfer.transfers.first;
    }

    try {
      final result = await withRetry<List<TreeNode>, Transfer>(
        (Transfer? updatedTransfer) async {
          final transferToUse = updatedTransfer ?? transfer;
          return await claimTransferCore(transferToUse);
        },
        options: WithRetryOptions(
          callbacks: RetryCallbacks<List<TreeNode>, Transfer>(
            onError: onError,
            fetchData: fetchData,
          ),
        ),
      );

      if (result.isEmpty) {
        return <TreeNode>[];
      }

      return result;
    } catch (error) {
      print(
        "Failed to claim transfer after all retries. Please try reinitializing your wallet in a few minutes. Transfer ID: ${transfer.id}. Error: $error",
      );

      throw SparkError("Failed to claim transfer", {'error': error});
    }
  }
}
