import 'dart:typed_data';
import 'package:bitcoin_base/bitcoin_base.dart';
import 'package:uuid/uuid.dart';
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart';

import '../errors/types.dart'; // SparkRequestError, SparkValidationError
import '../src/proto/spark.pbgrpc.dart'
    hide
        Network; // CooperativeExitResponse, HashVariant, SendLeafKeyTweaks, Transfer
import '../spark_bindings/spark_bindings.dart'; // getSparkFrost
import '../utils/hex.dart'; // Assuming hexToBytes exists here
import '../utils/network.dart'; // Network
import '../utils/transfer_package.dart'; // getTransferPackageSigningPayload
// WalletConfigService
// ConnectionManager
// SigningService
import 'transfer.dart'; // BaseTransferService, LeafKeyTweak, TransferPackageWithSelfCommitments

class GetConnectorRefundSignaturesParams {
  final List<LeafKeyTweak> leaves;
  final Uint8List exitTxId;
  final List<TxInput> connectorOutputs;
  final Uint8List receiverPubKey;
  final String transferId;
  final Uint8List connectorTx;

  GetConnectorRefundSignaturesParams({
    required this.leaves,
    required this.exitTxId,
    required this.connectorOutputs,
    required this.receiverPubKey,
    required this.transferId,
    required this.connectorTx,
  });
}

class CoopExitService extends BaseTransferService {
  final uuid = Uuid();

  CoopExitService(super.config, super.connectionManager, super.signingService);

  Future<({Transfer transfer})> getConnectorRefundSignatures(
    GetConnectorRefundSignaturesParams params,
  ) async {
    final leaves = params.leaves;
    final exitTxId = params.exitTxId;
    final connectorOutputs = params.connectorOutputs;
    final receiverPubKey = params.receiverPubKey;
    final transferId = params.transferId;
    final connectorTx = params.connectorTx;

    if (leaves.length != connectorOutputs.length) {
      throw SparkValidationError(
        "Mismatch between leaves and connector outputs",
        context: {
          'field': "leaves/connectorOutputs",
          'value': {
            'leavesCount': leaves.length,
            'outputsCount': connectorOutputs.length,
          },
          'expected': "Equal length",
        },
      );
    }

    // 1. Prepare key tweaks (empty signature maps since SO hasn't signed yet)
    final keyTweakInputMap = await prepareSendTransferKeyTweaks(
      transferId,
      leaves,
    );

    // 2. Get SO signing commitments (3 per leaf: cpfp, direct, directFromCpfp)
    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    final nodeIds = leaves.map((leaf) => leaf.leaf.id).toList();
    // Map to the appropriate proto generated class
    final signingCommitmentsResp = await sparkClient.get_signing_commitments(
      GetSigningCommitmentsRequest(nodeIds: nodeIds, count: 3),
    );
    final signingCommitments = signingCommitmentsResp.signingCommitments;

    // 3. Sign refunds with connector inputs
    final signRefundsResult = await signingService.signRefundsForCoopExit(
      leaves,
      connectorOutputs,
      connectorTx,
      signingCommitments.sublist(0, leaves.length),
      signingCommitments.sublist(leaves.length, 2 * leaves.length),
      signingCommitments.sublist(2 * leaves.length),
    );

    final cpfpLeafSigningJobs = signRefundsResult.cpfpLeafSigningJobs;
    final directLeafSigningJobs = signRefundsResult.directLeafSigningJobs;
    final directFromCpfpLeafSigningJobs =
        signRefundsResult.directFromCpfpLeafSigningJobs;

    // 4. Build TransferPackage with encrypted key tweaks
    final sparkFrost = getSparkFrost();
    final encryptedKeyTweaks = <String, Uint8List>{};

    final futures = keyTweakInputMap.entries.map((entry) async {
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
    }).toList();

    final results = await Future.wait(futures);
    for (final res in results) {
      encryptedKeyTweaks[res.key] = res.value;
    }

    final basePackage = TransferPackage(
      userSignature: Uint8List(0),
      hashVariant:
          HashVariant.HASH_VARIANT_V2, // Verify your exact proto enum name here
    )..keyTweakPackage.addAll(encryptedKeyTweaks);

    // Step B: Wrap it in your custom Dart class alongside the overridden types
    final transferPackage = TransferPackageWithSelfCommitments(
      package: basePackage,
      leavesToSend: cpfpLeafSigningJobs,
      directLeavesToSend: directLeafSigningJobs,
      directFromCpfpLeavesToSend: directFromCpfpLeafSigningJobs,
    );

    final transferPackageSigningPayload = getTransferPackageSigningPayload(
      transferId,
      transferPackage.package,
    );

    final signature = await config.signer.signMessageWithIdentityKey(
      transferPackageSigningPayload,
    );
    transferPackage.package.userSignature = Uint8List.fromList(signature);

    // 5. Call cooperative_exit_v2 with TransferPackage
    CooperativeExitResponse response;
    try {
      final ownerIdentityPublicKey = await config.signer.getIdentityPublicKey();
      // Assumes UUID generation utility exists
      final exitId = uuid.v7();

      final expiryTime = config.getNetwork() == Network.mainnet
          ? DateTime.now().add(const Duration(days: 7, minutes: 5))
          : DateTime.now().add(const Duration(minutes: 35));

      // Map to the appropriate proto generated class
      response = await sparkClient.cooperative_exit_v2(
        CooperativeExitRequest(
          transfer: StartTransferRequest(
            transferId: transferId,
            ownerIdentityPublicKey: ownerIdentityPublicKey,
            receiverIdentityPublicKey: receiverPubKey,
            transferPackage: transferPackage.package,
            expiryTime: Timestamp.fromDateTime(expiryTime.toUtc()),
          ),
          exitId: exitId,
          exitTxid: exitTxId,
          connectorTx: connectorTx,
        ),
      );
    } catch (error) {
      throw SparkRequestError(
        "Failed to initiate cooperative exit",
        context: {'operation': "cooperative_exit_v2", 'error': error},
      );
    }

    if (!response.hasTransfer()) {
      throw SparkRequestError(
        "Failed to initiate cooperative exit",
        context: {
          'operation': "cooperative_exit_v2",
          'error': Exception("No transfer in response"),
        },
      );
    }

    return (transfer: response.transfer);
  }
}
