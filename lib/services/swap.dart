import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

// TODO: Replace with your actual project imports
import '../errors/spark_error.dart'; // SparkValidationError
import '../graphql/client.dart'; // SspClient
import '../graphql/objects/spark_leaves_swap_request_status.dart';
import '../graphql/objects/user_leaf_input.dart';
import '../src/proto/spark.pb.dart'; // TreeNode
import '../signer/types.dart'; // KeyDerivationType, KeyDerivation
// import '../types/index.dart'; // SparkLeavesSwapRequestStatus, UserLeafInput
import '../utils/hex.dart'; // bytesToHex, hexToBytes
import 'config.dart'; // WalletConfigService
import 'transfer.dart'; // LeafKeyTweak, TransferService

const int _maxBatchSize = 64;
const int _maxSafeInteger = 9007199254740991; // 2^53 - 1

class RequestLeavesSwapParams {
  final List<TreeNode> leaves;
  final List<BigInt> targetAmounts;
  final FutureOr<void> Function(List<String> leafIds)? onSwapInitiated;
  final void Function(String transferId)? registerSwapTransferId;

  RequestLeavesSwapParams({
    required this.leaves,
    required this.targetAmounts,
    this.onSwapInitiated,
    this.registerSwapTransferId,
  });
}

class SwapService {
  final WalletConfigService config;
  final TransferService transferService;
  final SspClient sspClient;

  final Uuid _uuid = const Uuid();

  SwapService(this.config, this.transferService, this.sspClient);

  Future<List<TreeNode>> requestLeavesSwap(
    RequestLeavesSwapParams params,
  ) async {
    _validateSwapInputs(params.leaves, params.targetAmounts);

    if (params.leaves.length <= _maxBatchSize) {
      return await _executeSingleSwap(
        params.leaves,
        params.targetAmounts,
        params.onSwapInitiated,
        params.registerSwapTransferId,
      );
    }

    final sortedLeaves = List<TreeNode>.from(params.leaves)
      ..sort((a, b) => b.value.compareTo(a.value));

    final leafBatches = _chunkArray(sortedLeaves, _maxBatchSize);

    final targetAmountsByBatch = _distributeTargetAmounts(
      params.targetAmounts,
      leafBatches,
    );

    final results = <TreeNode>[];
    for (int i = 0; i < leafBatches.length; i++) {
      final batch = leafBatches[i];
      final batchTargetAmounts = targetAmountsByBatch[i];

      if (batch.isEmpty || batchTargetAmounts.isEmpty) {
        continue;
      }

      final result = await _executeSingleSwap(
        batch,
        batchTargetAmounts,
        params.onSwapInitiated,
        params.registerSwapTransferId,
      );
      results.addAll(result);
    }

    return results;
  }

  List<List<BigInt>> _distributeTargetAmounts(
    List<BigInt> targetAmounts,
    List<List<TreeNode>> leafBatches,
  ) {
    final targetAmountsByBatch = List.generate(
      leafBatches.length,
      (_) => <BigInt>[],
    );
    final remainingBatchAmounts = leafBatches.map((batch) {
      return batch.fold<BigInt>(BigInt.zero, (acc, leaf) => acc + BigInt.parse(leaf.value.toString()));
    }).toList();

    final remainingTargets = List<BigInt>.from(targetAmounts)
      ..sort((a, b) => b.compareTo(a));

    for (final target in remainingTargets) {
      bool assigned = false;
      for (int i = 0; i < leafBatches.length; i++) {
        final batchRemaining = remainingBatchAmounts[i];
        final batchTargets = targetAmountsByBatch[i];

        if (batchRemaining >= target) {
          batchTargets.add(target);
          remainingBatchAmounts[i] -= target;
          assigned = true;
          break;
        }
      }

      if (!assigned) {
        throw SparkValidationError(
          "Target amount $target could not be assigned to any batch",
          context: {
            'field': "targetAmounts",
            'value': targetAmounts,
            'expected': "a batch with at least $target remaining capacity",
          },
        );
      }
    }

    return targetAmountsByBatch;
  }

  Future<List<TreeNode>> _executeSingleSwap(
    List<TreeNode> leaves,
    List<BigInt> targetAmounts,
    FutureOr<void> Function(List<String> leafIds)? onSwapInitiated,
    void Function(String transferId)? registerSwapTransferId,
  ) async {
    _validateSwapInputs(leaves, targetAmounts);

    final sspIdentityPubkey = hexToBytes(config.getSspIdentityPublicKey());

    final leafKeyTweaks = leaves
        .map<LeafKeyTweak>(
          (leaf) => LeafKeyTweak(
            leaf: leaf,
            keyDerivation: LeafKeyDerivation(path: leaf.id),
            newKeyDerivation: RandomKeyDerivation(),
            receiverIdentityPublicKey: sspIdentityPubkey,
          ),
        )
        .toList();

    final transferId = _uuid.v7();

    if (registerSwapTransferId != null) {
      registerSwapTransferId(transferId);
    }

    final swapResult = await transferService.sendSwapTransfer(
      leafKeyTweaks,
      transferId,
    );
    final swapTransfer = swapResult.swapTransfer;
    final adaptorPubkey = swapResult.adaptorPubkey;
    final adaptorAddedSignatureMap = swapResult.adaptorAddedSignatureMap;

    if (onSwapInitiated != null) {
      await onSwapInitiated(leaves.map((leaf) => leaf.id).toList());
    }

    if (!swapTransfer.hasTransfer()) {
      throw SparkValidationError(
        "Transfer is missing in swap response",
        context: {
          'field': "transfer",
          'value': swapTransfer.transfer,
          'expected': "not null",
        },
      );
    }

    if (swapTransfer.transfer.leaves.any((leaf) => !leaf.hasLeaf())) {
      throw SparkValidationError(
        "Leaf is missing in swap response",
        context: {
          'field': "leaves",
          'value': swapTransfer.transfer.leaves,
          'expected': "not null",
        },
      );
    }

    final transfer = swapTransfer.transfer;

    try {
      final userLeaves = <UserLeafInput>[];
      for (int i = 0; i < transfer.leaves.length; i++) {
        final leaf = transfer.leaves[i];
        if (!leaf.hasLeaf()) {
          print("[processSwapBatch] Leaf ${i + 1} is missing");
          throw Exception("Failed to get leaf");
        }

        final adaptorAddedSignature = adaptorAddedSignatureMap[leaf.leaf.id];

        if (adaptorAddedSignature == null) {
          throw Exception("Adaptor added signature not found");
        }

        // Assuming your UserLeafInput maps these directly as named params
        userLeaves.add(
          UserLeafInput(
            leafId: leaf.leaf.id,
            rawUnsignedRefundTransaction: bytesToHex(
              Uint8List.fromList(leaf.intermediateRefundTx),
            ),
            directRawUnsignedRefundTransaction: bytesToHex(
              Uint8List.fromList(leaf.intermediateDirectRefundTx),
            ),
            directFromCpfpRawUnsignedRefundTransaction: bytesToHex(
              Uint8List.fromList(leaf.intermediateDirectFromCpfpRefundTx),
            ),
            adaptorAddedSignature: bytesToHex(adaptorAddedSignature),
            directAdaptorAddedSignature: bytesToHex(adaptorAddedSignature),
            directFromCpfpAdaptorAddedSignature: bytesToHex(
              adaptorAddedSignature,
            ),
          ),
        );
      }

      final request = await sspClient.requestLeavesSwap(
        userLeaves: userLeaves,
        adaptorPubkey: bytesToHex(adaptorPubkey),
        targetAmountSats: targetAmounts,
        totalAmountSats: leaves.fold<BigInt>(
          BigInt.zero,
          (acc, leaf) => acc + BigInt.parse(leaf.value.toString()),
        ),
        // TODO: Request fee from SSP
        feeSats: 0,
        userOutboundTransferExternalId: transfer.id,
      );

      if (request == null ||
          request.swapLeaves.isEmpty ||
          request.status ==
              SparkLeavesSwapRequestStatus.failed || // Assumed enum mapping
          request.inboundTransfer.sparkId == null) {
        print("[processSwapBatch] Leave swap request returned null");
        throw Exception("Failed to request leaves swap. Request failed.");
      }

      final incomingTransfer = await transferService.queryTransfer(
        request.inboundTransfer.sparkId!,
      );

      if (incomingTransfer == null) {
        print("[processSwapBatch] No incoming transfer found");
        throw Exception("Failed to get incoming transfer");
      }

      return await transferService.claimTransfer(incomingTransfer);
    } catch (e, stack) {
      debugPrint("[processSwapBatch] Error details: error=$e, stack=$stack");
      // Re-throw using Dart's Exception formatting
      throw Exception("Failed to request leaves swap: $e");
    }
  }

  void _validateSwapInputs(List<TreeNode> leaves, List<BigInt> targetAmounts) {
    if (targetAmounts.isEmpty) {
      throw SparkValidationError(
        "Target amounts must be non-empty",
        context: {'field': "targetAmounts", 'value': targetAmounts},
      );
    }

    final totalTargetAmount = targetAmounts.fold<BigInt>(
      BigInt.zero,
      (acc, amount) => acc + amount,
    );
    final totalLeavesValue = leaves.fold<BigInt>(
      BigInt.zero,
      (acc, leaf) => acc + BigInt.parse(leaf.value.toString()),
    );

    if (totalTargetAmount > totalLeavesValue) {
      throw SparkValidationError(
        "Total target amount exceeds leaves value",
        context: {
          'field': "targetAmounts",
          'value': totalTargetAmount,
          'expected': "less than or equal to $totalLeavesValue",
        },
      );
    }

    if (targetAmounts.any((amount) => amount <= BigInt.zero)) {
      throw SparkValidationError(
        "specified targetAmount must be positive",
        context: {
          'field': "targetAmounts",
          'value': targetAmounts,
          'expected': "positive",
        },
      );
    }

    if (targetAmounts.any((amount) => amount > BigInt.from(_maxSafeInteger))) {
      throw SparkValidationError(
        "targetAmount must be less than 2^53",
        context: {
          'field': "targetAmounts",
          'value': targetAmounts,
          'expected': "smaller or equal to $_maxSafeInteger",
        },
      );
    }

    if (leaves.length > _maxBatchSize) {
      final sortedLeaves = List<TreeNode>.from(leaves)
        ..sort((a, b) => b.value.compareTo(a.value));

      final maxBatchCapacity = sortedLeaves
          .take(_maxBatchSize)
          .fold<BigInt>(BigInt.zero, (acc, leaf) => acc + BigInt.parse(leaf.value.toString()));

      final maxTarget = targetAmounts.fold(BigInt.zero, (a,b)=>(a>b)?a:b);

      if (maxTarget > maxBatchCapacity) {
        throw SparkValidationError(
          "Target amount $maxTarget exceeds maximum batch capacity $maxBatchCapacity",
          context: {
            'field': "targetAmounts",
            'value': maxTarget,
            'expected': "less than or equal to $maxBatchCapacity",
          },
        );
      }
    }
  }

  // --- Helpers ---

  List<List<T>> _chunkArray<T>(List<T> array, int size) {
    final chunks = <List<T>>[];
    for (int i = 0; i < array.length; i += size) {
      chunks.add(array.sublist(i, min(i + size, array.length)));
    }
    return chunks;
  }
}
