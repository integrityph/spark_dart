import 'dart:async';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter/foundation.dart';
import 'package:mutex/mutex.dart';

import '../errors/spark_error.dart'; // SparkValidationError
import '../src/proto/spark.pb.dart'; // QueryNodesRequest, QueryNodesResponse, Transfer, TransferStatus, TransferType, TreeNode, TreeNodeStatus
import '../signer/types.dart'; // KeyDerivation, KeyDerivationType
import '../utils/transaction.dart'; //doesTxnNeedRenewed, isZeroTimelock
import '../utils/bitcoin.dart'; // getTxFromRawTxBytes
import '../utils/keys.dart'; // addPublicKeys
import '../utils/optimize.dart'; // optimize, shouldOptimize
import 'config.dart'; // WalletConfigService
import 'connection/connection.dart'; // ConnectionManager
import 'swap.dart'; // SwapService
import 'transfer.dart'; // LeafKeyTweak, TransferService
import 'package:collection/collection.dart';

// Utilizing Dart 3 sealed classes to represent TS discriminated unions
sealed class LeafSource {
  const LeafSource();
}

class TransferSource extends LeafSource {
  final String transferId;
  const TransferSource(this.transferId);
}

class SwapSource extends LeafSource {
  final String swapId;
  const SwapSource(this.swapId);
}

class DepositSource extends LeafSource {
  final String depositId;
  const DepositSource(this.depositId);
}

class NoneSource extends LeafSource {
  const NoneSource();
}

enum LeafStatus {
  AVAILABLE,
  LOCAL_LOCKED,
  OUTGOING,
  SWAP_PENDING,
  INCOMING,
  SPENT,
}

class LeafRecord {
  TreeNode treeNode;
  LeafStatus status;
  LeafSource source;

  LeafRecord({
    required this.treeNode,
    required this.status,
    required this.source,
  });
}

const Map<LeafStatus, List<LeafStatus>> VALID_TRANSITIONS = {
  // AVAILABLE → OUTGOING/SWAP_PENDING/SPENT: concurrent wallet case only —
  // another instance sent a transfer or swap using this leaf, we receive the
  // stream event while the leaf is still AVAILABLE in our cache (we never
  // locked it locally).
  LeafStatus.AVAILABLE: [
    LeafStatus.LOCAL_LOCKED,
    LeafStatus.OUTGOING,
    LeafStatus.SWAP_PENDING,
    LeafStatus.SPENT,
  ],
  LeafStatus.LOCAL_LOCKED: [
    LeafStatus.AVAILABLE,
    LeafStatus.OUTGOING,
    LeafStatus.SWAP_PENDING,
    LeafStatus.SPENT,
  ],
  LeafStatus.OUTGOING: [LeafStatus.AVAILABLE, LeafStatus.SPENT],
  LeafStatus.SWAP_PENDING: [LeafStatus.AVAILABLE, LeafStatus.SPENT],
  LeafStatus.INCOMING: [LeafStatus.AVAILABLE],
  LeafStatus.SPENT: [],
};

// Only LOCAL_LOCKED is preserved across sync — it's the only status where the SO
// hasn't been contacted yet.
const Set<LeafStatus> SYNC_PRESERVED_STATUSES = {LeafStatus.LOCAL_LOCKED};

// Statuses where a local or remote operation is in progress — addLeaves must not
// overwrite these, as that would corrupt in-flight state.
const Set<LeafStatus> IN_FLIGHT_STATUSES = {
  LeafStatus.LOCAL_LOCKED,
  LeafStatus.OUTGOING,
  LeafStatus.SWAP_PENDING,
};

const Set<LeafStatus> OWNED_STATUSES = {
  LeafStatus.AVAILABLE,
  LeafStatus.LOCAL_LOCKED,
  LeafStatus.OUTGOING,
  LeafStatus.SWAP_PENDING,
};

class BalanceSnapshot {
  final BigInt available;
  final BigInt owned;
  final BigInt incoming;

  BalanceSnapshot({
    required this.available,
    required this.owned,
    required this.incoming,
  });
}

typedef OnBalanceUpdate = void Function(BalanceSnapshot balance);

class LeafManager {
  bool _optimizationInProgress = false;
  bool _hasSynced = false;
  final Map<String, LeafRecord> _leaves = {};

  // Mutex policy: acquire when transitioning AVAILABLE → LOCAL_LOCKED (prevents
  // double-selection) or when inserting/removing leaves from the map. Read-only
  // operations (balance getters, selectLeavesReadOnly) and error-path restores
  // (restoreLocalLockedToAvailable) do not acquire — Dart's single-threaded event loop
  // guarantees synchronous iterations can't be interleaved.
  final Mutex _leavesMutex = Mutex();
  Uint8List? _identityPublicKey;

  final WalletConfigService config;
  final SwapService swapService;
  final TransferService transferService;
  final ConnectionManager connectionManager;
  final OnBalanceUpdate? onBalanceUpdate;
  final Future<void> Function()? onAutoOptimize;

  LeafManager({
    required this.config,
    required this.swapService,
    required this.transferService,
    required this.connectionManager,
    this.onBalanceUpdate,
    this.onAutoOptimize,
  });

  void _log(String tag, String message) {
    if (!config.getLog()) return;
    print(
      "[${DateTime.now().toIso8601String()}][${connectionManager.getSessionId()}] [spark-sdk][$tag] $message",
    );
  }

  void _emitBalanceUpdate() {
    if (onBalanceUpdate != null) {
      onBalanceUpdate!(
        BalanceSnapshot(
          available: getAvailableBalance(),
          owned: getOwnedBalance(),
          incoming: getIncomingBalance(),
        ),
      );
    }
  }

  // ===========================================================================
  // CHUNK: Public API (Initialize, Sync, GetLeaves)
  // (Continuing inside the LeafManager class...)
  // ===========================================================================

  /// Must be called before stream events are processed. Sets the identity
  /// public key used by handleTransferEvent to filter sender events.
  Future<void> initialize() async {
    _identityPublicKey = await config.signer.getIdentityPublicKey();
  }

  Future<void> sync() async {
    _identityPublicKey = await config.signer.getIdentityPublicKey();

    final prevBalanceCount = _leaves.length;
    final prevAvailable = getAvailableBalance();
    final prevOwned = getOwnedBalance();
    final prevIncoming = getIncomingBalance();

    _log(
      "sync",
      "Starting sync. Pre-sync: $prevBalanceCount leaves, available=$prevAvailable owned=$prevOwned incoming=$prevIncoming",
    );

    // Run parallel queries
    final results = await Future.wait([
      getLeaves(),
      _getAllPendingSwaps(),
      _getAllPendingOutgoingTransfers(),
      transferService.queryPendingTransfers(),
    ]);

    final rawLeaves = results[0] as List<TreeNode>;
    final swaps =
        results[1]
            as List<
              Map<String, dynamic>
            >; // Expecting {leaf: TreeNode, transferId: String}
    final outgoingTransfers =
        results[2]
            as List<
              Map<String, dynamic>
            >; // Expecting {leaf: TreeNode, transferId: String}
    final incomingTransfers =
        results[3] as dynamic; // Assumed QueryTransfersResponse

    final incomingList = (incomingTransfers.transfers as List).cast<Transfer>();

    _log(
      "sync",
      "Fetched: ${rawLeaves.length} leaves, ${swaps.length} pending swaps, ${outgoingTransfers.length} outgoing, ${incomingList.length} incoming",
    );

    final leaves = await _checkRenewLeaves(rawLeaves);

    await _leavesMutex.protect(() async {
      final preserved = <String, LeafRecord>{};
      for (final entry in _leaves.entries) {
        if (SYNC_PRESERVED_STATUSES.contains(entry.value.status)) {
          preserved[entry.key] = entry.value;
        }
      }

      if (preserved.isNotEmpty) {
        final preservedStr = preserved.entries
            .map((e) => "${e.key}(${e.value.status.name})")
            .join(",");
        _log(
          "sync",
          "Preserving ${preserved.length} in-flight leaves: [$preservedStr]",
        );
      }

      _leaves.clear();

      for (final leaf in leaves) {
        if (leaf.status == "AVAILABLE") {
          _leaves[leaf.id] = LeafRecord(
            treeNode: leaf,
            status: LeafStatus.AVAILABLE,
            source: const NoneSource(),
          );
        }
      }

      for (final swap in swaps) {
        final leaf = swap['leaf'] as TreeNode;
        final transferId = swap['transferId'] as String;
        _leaves[leaf.id] = LeafRecord(
          treeNode: leaf,
          status: LeafStatus.SWAP_PENDING,
          source: SwapSource(transferId),
        );
      }

      for (final outgoing in outgoingTransfers) {
        final leaf = outgoing['leaf'] as TreeNode;
        final transferId = outgoing['transferId'] as String;
        _leaves[leaf.id] = LeafRecord(
          treeNode: leaf,
          status: LeafStatus.OUTGOING,
          source: TransferSource(transferId),
        );
      }

      for (final transfer in incomingList) {
        // Counter-swaps are the inbound side of a swap we initiated — they're
        // already accounted for in SWAP_PENDING (owned balance). Including them
        // as INCOMING would double-count the sats.
        if (transfer.type == TransferType.COUNTER_SWAP ||
            transfer.type == TransferType.COUNTER_SWAP_V3) {
          continue;
        }

        for (final leafWrapper in transfer.leaves) {
          if (!leafWrapper.hasLeaf()) continue;
          final leaf = leafWrapper.leaf;

          // Don't downgrade OUTGOING/SWAP_PENDING to INCOMING (e.g., self-transfers
          // appear in both outgoing and incoming queries).
          final existing = _leaves[leaf.id];
          if (existing != null &&
              (existing.status == LeafStatus.OUTGOING ||
                  existing.status == LeafStatus.SWAP_PENDING)) {
            continue;
          }

          _leaves[leaf.id] = LeafRecord(
            treeNode: leaf,
            status: LeafStatus.INCOMING,
            source: TransferSource(transfer.id),
          );
        }
      }

      // In-flight local state always wins over server state. If we have a leaf
      // as LOCAL_LOCKED, the SO hasn't been contacted yet. Restoring it
      // unconditionally ensures the leaf stays locked until explicitly transitioned.
      _leaves.addAll(preserved);

      _hasSynced = true;
    });

    _log(
      "sync",
      "Sync complete. Post-sync: ${_leaves.length} leaves, available=${getAvailableBalance()} owned=${getOwnedBalance()} incoming=${getIncomingBalance()}",
    );

    _autoOptimizeIfNeeded();
    _emitBalanceUpdate();
  }

  Future<List<TreeNode>> getLeaves([bool isBalanceCheck = false]) async {
    final ownerIdentityPubkey = await config.signer.getIdentityPublicKey();
    final coordinatorId = config.getCoordinatorIdentifier();
    final network = config.getNetworkProto();

    var operators = config.getSigningOperators().entries;
    if (isBalanceCheck) {
      operators = operators.where((entry) => entry.key == coordinatorId);
    }

    final operatorToLeaves = <String, QueryNodesResponse>{};

    final fetchFutures = operators.map((entry) async {
      final id = entry.key;

      final leaves = await _queryNodes(
        QueryNodesRequest(
          ownerIdentityPubkey: ownerIdentityPubkey,
          includeParents: false,
          network: Network.valueOf(network),
          statuses: [TreeNodeStatus.TREE_NODE_STATUS_AVAILABLE],
        ),
      );
      operatorToLeaves[id] = leaves;
    }).toList();

    await Future.wait(fetchFutures);

    final coordinatorLeaves = operatorToLeaves[coordinatorId];
    if (coordinatorLeaves == null) {
      throw SparkValidationError(
        "Coordinator leaves not found",
        context: {'field': "coordinatorLeaves"},
      );
    }

    final outOfSyncIds = <String>{};
    if (!isBalanceCheck) {
      for (final entry in operatorToLeaves.entries) {
        final opId = entry.key;
        final opLeaves = entry.value;
        if (opId == coordinatorId) continue;

        for (final nodeEntry in coordinatorLeaves.nodes.entries) {
          final nodeId = nodeEntry.key;
          final leaf = nodeEntry.value;
          final opLeaf = opLeaves.nodes[nodeId];

          if (!_isLeafConsistent(leaf, opLeaf)) {
            outOfSyncIds.add(nodeId);
          }
        }
      }
    }

    // Defensive: queryNodes filters for AVAILABLE, but double-check.
    // Out-of-sync leaves are excluded intentionally — their state is inconsistent.
    final candidates = coordinatorLeaves.nodes.values
        .where(
          (node) =>
              node.status == "AVAILABLE" && !outOfSyncIds.contains(node.id),
        )
        .toList();

    // Use Dart 3 Records to map the validation actions
    final actionFutures = candidates.map((leaf) async {
      if (leaf.parentNodeId.isNotEmpty) {
        final parentPubkey = await config.signer.getPublicKeyFromDerivation(
          keyDerivation: LeafKeyDerivation(path: leaf.parentNodeId),
        );

        if (_verifyKey(
          parentPubkey,
          leaf.hasSigningKeyshare()
              ? Uint8List.fromList(leaf.signingKeyshare.publicKey)
              : Uint8List(0),
          Uint8List.fromList(leaf.verifyingPublicKey),
        )) {
          return (type: "RECOVER", leaf: leaf, path: leaf.parentNodeId);
        }
      }

      final leafPubkey = await config.signer.getPublicKeyFromDerivation(
        keyDerivation: LeafKeyDerivation(path: leaf.id),
      );

      final isValid = _verifyKey(
        leafPubkey,
        leaf.hasSigningKeyshare()
            ? Uint8List.fromList(leaf.signingKeyshare.publicKey)
            : Uint8List(0),
        Uint8List.fromList(leaf.verifyingPublicKey),
      );

      return isValid
          ? (type: "VALID", leaf: leaf, path: null)
          : (type: "INVALID", leaf: null, path: null);
    }).toList();

    final actions = await Future.wait(actionFutures);

    final validLeaves = <TreeNode>[];
    final recoverByPath = <String, List<TreeNode>>{};

    for (final action in actions) {
      if (action.type == "VALID" && action.leaf != null) {
        validLeaves.add(action.leaf!);
      } else if (action.type == "RECOVER" &&
          action.leaf != null &&
          action.path != null) {
        recoverByPath.putIfAbsent(action.path!, () => []).add(action.leaf!);
      }
    }

    // Recovery is awaited so recovered leaves are included in results.
    // A failed recovery doesn't drop already-collected valid leaves.
    final finalLeaves = List<TreeNode>.from(validLeaves);

    for (final entry in recoverByPath.entries) {
      final path = entry.key;
      final leavesToRecover = entry.value;
      try {
        final recovered = await _recoverLeaves(
          leavesToRecover,
          LeafKeyDerivation(path: path),
        );
        finalLeaves.addAll(recovered);
      } catch (err) {
        // Recovery failed — skip these leaves rather than losing all valid leaves.
      }
    }

    return finalLeaves;
  }

  // ===========================================================================
  // CHUNK: selectLeavesAndExecute
  // (Continuing inside the LeafManager class...)
  // ===========================================================================

  /// Executes an operation on a selected set of leaves, managing their locking
  /// and automatically handling retries if a stale leaf error occurs.
  ///
  /// In Dart, the [selectedLeaves] passed to the executor will be a List of
  /// Lists of TreeNodes, where `selectedLeaves[i]` corresponds to the
  /// leaves selected for `targetAmounts[i]`.
  Future<R> selectLeavesAndExecute<R>(
    List<BigInt> targetAmounts,
    Future<R> Function(List<List<TreeNode>> selectedLeaves) executor,
  ) async {
    if (targetAmounts.any((amount) => amount <= BigInt.zero)) {
      throw SparkValidationError(
        "Target amount must be positive",
        context: {'field': "targetAmounts", 'value': targetAmounts},
      );
    }

    final totalTargetAmount = targetAmounts.fold<BigInt>(
      BigInt.zero,
      (acc, amount) => acc + amount,
    );

    // Fast-path check without mutex — the real selection happens under lock in
    // selectLeavesWithSwap, which will fail safely if balance changed.
    final availableBalance = getAvailableBalance();
    if (totalTargetAmount > availableBalance) {
      throw SparkValidationError(
        "Total target amount exceeds available balance",
        context: {
          'field': "targetAmounts",
          'value': totalTargetAmount,
          'expected': "less than or equal to $availableBalance",
        },
      );
    }

    // Local closure to encapsulate the execution and cleanup logic
    Future<R> executeWithCleanup() async {
      final selectedLeaves = await _selectLeavesWithSwap(targetAmounts);

      final allFlat = selectedLeaves.expand((l) => l).toList();
      final selectedIds = allFlat.map((l) => l.id).toList();

      // Renew any leaves whose timelocks are close to expiry before handing
      // them to the executor. This avoids an avoidable round-trip from the
      // stale-leaf retry path when a leaf expires between sync() calls.
      final renewed = await _checkRenewLeaves(allFlat);

      if (renewed.length < allFlat.length) {
        final renewedIds = renewed.map((l) => l.id).toSet();
        final dropped = allFlat
            .where((l) => !renewedIds.contains(l.id))
            .toList();
        print(
          "[LeafManager] ${dropped.length} leaf(es) dropped during renewal — will cause stale-leaf retry: ${dropped.map((l) => l.id).toList()}",
        );
      }

      if (renewed.isNotEmpty) {
        final renewedMap = {for (var l in renewed) l.id: l};

        for (int i = 0; i < selectedLeaves.length; i++) {
          final batch = selectedLeaves[i];
          for (int j = 0; j < batch.length; j++) {
            final fresh = renewedMap[batch[j].id];
            if (fresh != null) {
              batch[j] = fresh;
              // Keep cache consistent with what the executor receives
              final record = _leaves[fresh.id];
              if (record != null) {
                record.treeNode = fresh;
              }
            }
          }
        }
      }

      try {
        final result = await executor(selectedLeaves);

        // Executor succeeded — mark leaves still LOCAL_LOCKED as OUTGOING.
        // Only transition LOCAL_LOCKED leaves — leaves that have already been
        // advanced (OUTGOING/SPENT via handleTransferEvent) or re-claimed
        // (AVAILABLE via registerClaimedLeaves, e.g., self-transfers) must not
        // be touched.
        for (final id in selectedIds) {
          final record = _leaves[id];
          if (record?.status == LeafStatus.LOCAL_LOCKED) {
            record!.status = LeafStatus.OUTGOING;
          }
        }
        return result;
      } catch (error) {
        // On failure: restore leaves still LOCAL_LOCKED back to AVAILABLE.
        // If the executor contacted the SO, it should have already advanced
        // the state (e.g., to OUTGOING/SPENT via handleTransferEvent).
        // restoreLocalLockedToAvailable only touches LOCAL_LOCKED, so leaves
        // the executor already advanced are left alone.
        restoreLocalLockedToAvailable(selectedIds);
        rethrow;
      }
    }

    try {
      return await executeWithCleanup();
    } catch (error) {
      if (_isStaleLeafError(error)) {
        await sync();
        final refreshedBalance = getAvailableBalance();
        if (totalTargetAmount > refreshedBalance) {
          throw SparkValidationError(
            "Total target amount exceeds available balance",
            context: {
              'field': "targetAmounts",
              'value': totalTargetAmount,
              'expected': "less than or equal to $refreshedBalance",
            },
          );
        }
        return await executeWithCleanup();
      }
      rethrow;
    }
  }

  // ===========================================================================
  // CHUNK: Leaf State Management (add, remove, evict, executeWithAll)
  // (Continuing inside the LeafManager class...)
  // ===========================================================================

  Future<void> addLeaves(List<TreeNode> leaves) async {
    bool changed = false;
    await _leavesMutex.protect(() async {
      for (final leaf in leaves) {
        final existing = _leaves[leaf.id];

        if (existing != null && IN_FLIGHT_STATUSES.contains(existing.status)) {
          _log(
            "add-leaves",
            "Skipping leaf=${leaf.id} value=${leaf.value} — in-flight (${existing.status.name})",
          );
          continue;
        }

        // Skip if already AVAILABLE with same value — no change to emit
        if (existing?.status == LeafStatus.AVAILABLE &&
            existing?.treeNode.value == leaf.value) {
          continue;
        }

        _log(
          "add-leaves",
          "Adding leaf=${leaf.id} value=${leaf.value}${existing != null ? ' (was ${existing.status.name})' : ''}",
        );

        _leaves[leaf.id] = LeafRecord(
          treeNode: leaf,
          status: LeafStatus.AVAILABLE,
          source: const NoneSource(),
        );
        changed = true;
      }
    });

    if (changed) _emitBalanceUpdate();
  }

  /// Add leaves as INCOMING (unclaimed transfer or unconfirmed deposit).
  /// Does not overwrite leaves already in the cache with a non-INCOMING status.
  Future<void> addIncomingLeaves(
    List<TreeNode> leaves,
    String transferId,
  ) async {
    final sats = leaves.fold(0, (a, l) => a + l.value.toInt());
    final ids = leaves.map((l) => l.id).join(",");
    _log(
      "incoming",
      "Adding ${leaves.length} incoming leaves ($sats sats) transfer=$transferId ids=[$ids]",
    );

    bool changed = false;
    await _leavesMutex.protect(() async {
      for (final leaf in leaves) {
        final existing = _leaves[leaf.id];
        if (existing != null && existing.status != LeafStatus.INCOMING) {
          _log(
            "incoming",
            "Skipping leaf=${leaf.id} — already ${existing.status.name}",
          );
          continue;
        }

        _leaves[leaf.id] = LeafRecord(
          treeNode: leaf,
          status: LeafStatus.INCOMING,
          source: TransferSource(transferId),
        );
        changed = true;
      }
    });

    if (changed) _emitBalanceUpdate();
  }

  /// Remove stale AVAILABLE leaves not in the fresh coordinator set.
  /// Only evicts leaves with source "none" — freshly claimed leaves
  /// (source "transfer") are preserved since they may not yet appear
  /// in the coordinator response.
  Future<void> evictStaleAvailable(Set<String> freshIds) async {
    bool changed = false;
    final evicted = <String>[];

    await _leavesMutex.protect(() async {
      // In Dart, you cannot remove from a Map while iterating its keys/entries directly
      // unless you use removeWhere or collect keys first. We'll collect keys.
      final keysToRemove = <String>[];

      for (final entry in _leaves.entries) {
        final id = entry.key;
        final record = entry.value;

        if (record.status == LeafStatus.AVAILABLE &&
            record.source is NoneSource &&
            !freshIds.contains(id)) {
          evicted.add(id);
          keysToRemove.add(id);
          changed = true;
        }
      }

      for (final id in keysToRemove) {
        _leaves.remove(id);
      }
    });

    if (evicted.isNotEmpty) {
      _log(
        "evict",
        "Evicted ${evicted.length} stale leaves: [${evicted.join(",")}]",
      );
    }
    if (changed) _emitBalanceUpdate();
  }

  Future<void> removeLeaves(List<String> leafIds) async {
    _log(
      "remove-leaves",
      "Removing ${leafIds.length} leaves: [${leafIds.join(",")}]",
    );
    bool changed = false;
    await _leavesMutex.protect(() async {
      for (final id in leafIds) {
        if (_leaves.remove(id) != null) changed = true;
      }
    });
    if (changed) _emitBalanceUpdate();
  }

  /// Register newly claimed leaves — renews them and adds to cache.
  /// Unconditionally sets status to AVAILABLE, bypassing the IN_FLIGHT_STATUSES
  /// guard in addLeaves, since successfully claimed leaves are definitively ours.
  Future<List<TreeNode>> registerClaimedLeaves(
    List<TreeNode> leaves, [
    String? transferId,
  ]) async {
    final sats = leaves.fold(0, (a, l) => a + l.value.toInt());
    final ids = leaves.map((l) => l.id).join(",");
    _log(
      "claim",
      "Registering ${leaves.length} claimed leaves ($sats sats) transferId=${transferId ?? "none"} ids=[$ids]",
    );

    final renewed = await _checkRenewLeaves(leaves);

    await _leavesMutex.protect(() async {
      for (final leaf in renewed) {
        final existing = _leaves[leaf.id];
        if (existing != null) {
          _log(
            "claim",
            "Overwriting leaf ${leaf.id}: ${existing.status.name} → AVAILABLE",
          );
        }
        _leaves[leaf.id] = LeafRecord(
          treeNode: leaf,
          status: LeafStatus.AVAILABLE,
          // Tag with the transfer ID so handleTransferEvent can detect stale
          // stream events for self-transfers that reuse the same leaf ID.
          source: transferId != null
              ? TransferSource(transferId)
              : const NoneSource(),
        );
      }
    });

    _log(
      "claim",
      "Post-claim balance: available=${getAvailableBalance()} owned=${getOwnedBalance()} incoming=${getIncomingBalance()}",
    );

    _emitBalanceUpdate();
    _autoOptimizeIfNeeded();
    return renewed;
  }

  /// Select all available leaves and execute an operation with them.
  Future<R> executeWithAllLeaves<R>(
    Future<R> Function(List<TreeNode> leaves) executor,
  ) async {
    // Lock → capture → unlock → execute → update (same pattern as selectLeavesWithSwap)
    // to avoid holding the mutex during network I/O which could deadlock with
    // stream event handlers that also acquire the mutex.
    final state = await _leavesMutex.protect(() async {
      final available = _getAvailableLeaves();
      final lockedIds = available.map((l) => l.id).toList();
      _transition(lockedIds, LeafStatus.LOCAL_LOCKED);
      return (available: available, lockedIds: lockedIds);
    });

    final available = state.available;
    final lockedIds = state.lockedIds;

    // Renew leaves with expiring timelocks before passing to the executor.
    final renewed = await _checkRenewLeaves(available);
    final renewedIds = renewed.map((l) => l.id).toSet();

    if (renewed.length < available.length) {
      // Restore dropped leaves to AVAILABLE — they were never passed to the
      // executor so they must not be marked OUTGOING on success.
      final droppedIds = available
          .where((l) => !renewedIds.contains(l.id))
          .map((l) => l.id)
          .toList();

      print(
        "[LeafManager] ${droppedIds.length} leaf(es) dropped during renewal: $droppedIds",
      );
      restoreLocalLockedToAvailable(droppedIds);
    }

    // Update cache with renewed tree nodes
    for (final leaf in renewed) {
      final record = _leaves[leaf.id];
      if (record != null) {
        record.treeNode = leaf;
      }
    }

    try {
      final result = await executor(renewed);

      // Only transition leaves that were actually passed to the executor
      for (final id in lockedIds) {
        if (!renewedIds.contains(id)) continue;
        final record = _leaves[id];
        if (record?.status == LeafStatus.LOCAL_LOCKED) {
          record!.status = LeafStatus.OUTGOING;
        }
      }
      return result;
    } catch (error) {
      // Only restore leaves that were actually passed to the executor.
      // Dropped leaves were already restored before the executor ran.
      final renewedLockedIds = lockedIds
          .where((id) => renewedIds.contains(id))
          .toList();
      restoreLocalLockedToAvailable(renewedLockedIds);
      rethrow;
    }
  }

  // ===========================================================================
  // CHUNK: Stream Event Handlers (Deposits and Transfers)
  // (Continuing inside the LeafManager class...)
  // ===========================================================================

  /// Returns true if the deposit was added/updated in the cache.
  Future<bool> handleDepositEvent(TreeNode deposit) async {
    _log(
      "deposit-event",
      "deposit=${deposit.id} status=${deposit.status} value=${deposit.value}",
    );
    bool needsVerification = false;
    bool added = false;
    bool changed = false;

    await _leavesMutex.protect(() async {
      if (deposit.status == "CREATING") {
        final existing = _leaves[deposit.id];
        if (existing == null) {
          _log("deposit-event", "leaf=${deposit.id} CREATING → INCOMING");
          _leaves[deposit.id] = LeafRecord(
            treeNode: deposit,
            status: LeafStatus.INCOMING,
            source: DepositSource(deposit.id),
          );
          changed = true;
          added = true;
        } else {
          _log(
            "deposit-event",
            "leaf=${deposit.id} CREATING — already in cache (${existing.status.name}), skipped",
          );
        }
      } else if (deposit.status == "AVAILABLE") {
        final existing = _leaves[deposit.id];
        if (existing != null) {
          if (!IN_FLIGHT_STATUSES.contains(existing.status) &&
              existing.status != LeafStatus.AVAILABLE) {
            _log(
              "deposit-event",
              "leaf=${deposit.id} ${existing.status.name} → AVAILABLE",
            );
            existing.treeNode = deposit;
            _transition([deposit.id], LeafStatus.AVAILABLE);
            changed = true;
            added = true;
          } else {
            _log(
              "deposit-event",
              "leaf=${deposit.id} already ${existing.status.name}, skipped",
            );
          }
        } else if (!_hasSynced) {
          _log("deposit-event", "leaf=${deposit.id} pre-sync → AVAILABLE");
          _leaves[deposit.id] = LeafRecord(
            treeNode: deposit,
            status: LeafStatus.AVAILABLE,
            source: DepositSource(deposit.id),
          );
          changed = true;
          added = true;
        } else {
          needsVerification = true;
        }
      }
    });

    if (changed) _emitBalanceUpdate();

    if (needsVerification) {
      _log(
        "deposit-event",
        "Deposit ${deposit.id} needs verification (post-sync unknown leaf)",
      );
      added = await _verifyAndAddLeaf(deposit.id);
    }

    _log(
      "deposit-event",
      "Deposit ${deposit.id} result: added=$added balance: available=${getAvailableBalance()} owned=${getOwnedBalance()}",
    );
    return added;
  }

  /// Query the coordinator for a specific leaf and add it if it's AVAILABLE
  /// and owned by us. Used to validate stream events for unknown leaves.
  /// Returns true if the leaf was verified and added.
  Future<bool> _verifyAndAddLeaf(String leafId) async {
    try {
      final response = await _queryNodes(
        QueryNodesRequest(
          nodeIds: TreeNodeIds(nodeIds: [leafId]),
          network: Network.valueOf(config.getNetworkProto()),
          statuses: [],
          includeParents: false,
        ),
      );

      final node = response.nodes[leafId];
      if (node == null || node.status != "AVAILABLE") return false;

      bool wasAdded = false;
      await _leavesMutex.protect(() async {
        final existing = _leaves[leafId];
        // Already AVAILABLE — treat as successfully verified (may have been
        // added by a concurrent sync()), so DepositConfirmed still fires.
        if (existing?.status == LeafStatus.AVAILABLE) {
          wasAdded = true;
          return;
        }
        if (existing != null) return; // in-flight — don't overwrite

        _leaves[leafId] = LeafRecord(
          treeNode: node,
          status: LeafStatus.AVAILABLE,
          source: DepositSource(leafId),
        );
        wasAdded = true;
      });

      if (wasAdded) _emitBalanceUpdate();
      return wasAdded;
    } catch (_) {
      return false;
    }
  }

  Future<void> handleTransferEvent(Transfer transfer) async {
    if (_identityPublicKey == null ||
        !ListEquality().equals(
          Uint8List.fromList(transfer.senderIdentityPublicKey),
          _identityPublicKey!,
        )) {
      return;
    }

    final leafIds = transfer.leaves
        .where((leafWrapper) => leafWrapper.hasLeaf())
        .map((leafWrapper) => leafWrapper.leaf.id)
        .toList();

    _log(
      "transfer-event",
      "transfer=${transfer.id} type=${transfer.type} status=${transfer.status} leaves=[${leafIds.join(",")}]",
    );

    bool changed = false;
    await _leavesMutex.protect(() async {
      final source = TransferSource(transfer.id);

      // Skip leaves that were already reclaimed for this transfer (self-transfer).
      // These are AVAILABLE with source matching this transfer ID — stale stream
      // events must not re-transition them to OUTGOING/SPENT.
      final activeLeafIds = leafIds.where((id) {
        final record = _leaves[id];
        if (record == null) {
          return true; // not in cache — let transition handle it
        }
        if (record.status != LeafStatus.AVAILABLE) {
          return true; // in-flight — proceed
        }

        // AVAILABLE leaf: skip if its source is this same transfer (reclaimed)
        if (record.source is TransferSource) {
          return (record.source as TransferSource).transferId != transfer.id;
        }
        return true;
      }).toList();

      switch (transfer.status) {
        case TransferStatus.TRANSFER_STATUS_RETURNED:
        case TransferStatus.TRANSFER_STATUS_EXPIRED:
          _log(
            "transfer-event",
            "Returned/expired → restoring ${activeLeafIds.length} leaves to AVAILABLE",
          );
          _transition(activeLeafIds, LeafStatus.AVAILABLE, const NoneSource());
          changed = true;
          break;

        case TransferStatus.TRANSFER_STATUS_SENDER_KEY_TWEAK_PENDING:
        case TransferStatus.TRANSFER_STATUS_SENDER_INITIATED:
        case TransferStatus.TRANSFER_STATUS_SENDER_INITIATED_COORDINATOR:
        case TransferStatus.TRANSFER_STATUS_APPLYING_SENDER_KEY_TWEAK:
          final isSwap =
              transfer.type == TransferType.PRIMARY_SWAP_V3 ||
              transfer.type == TransferType.SWAP;
          final targetStatus = isSwap
              ? LeafStatus.SWAP_PENDING
              : LeafStatus.OUTGOING;

          final statusStr = activeLeafIds
              .map((id) {
                final r = _leaves[id];
                return r != null ? "$id(${r.status.name})" : "$id(missing)";
              })
              .join(",");

          _log(
            "transfer-event",
            "Sender initiated → ${targetStatus.name} for ${activeLeafIds.length} leaves (isSwap=$isSwap), current statuses: [$statusStr]",
          );

          _transition(activeLeafIds, targetStatus, source);
          changed = true;
          break;

        default:
          // no need to check this is Dart.
          // if (transfer.status != TransferStatus.UNRECOGNIZED) {
          // Skip SWAP_PENDING leaves — their lifecycle is managed by the
          // swap/optimization path which transitions them to SPENT and adds
          // replacement leaves atomically. Letting the stream pre-empt this
          // would delete the leaf before replacements are added, causing a
          // temporary balance drop.
          final nonSwapIds = activeLeafIds.where((id) {
            final record = _leaves[id];
            return record == null || record.source is! SwapSource;
          }).toList();

          final skippedSwapIds = activeLeafIds
              .where((id) => !nonSwapIds.contains(id))
              .toList();

          if (skippedSwapIds.isNotEmpty) {
            _log(
              "transfer-event",
              "Terminal status=${transfer.status} — skipping ${skippedSwapIds.length} SWAP_PENDING leaves: [${skippedSwapIds.join(",")}]",
            );
          }

          _log(
            "transfer-event",
            "Terminal status=${transfer.status} → SPENT for ${nonSwapIds.length} leaves: [${nonSwapIds.join(",")}]",
          );

          _transition(nonSwapIds, LeafStatus.SPENT, source);
          changed = true;
          // }
          break;
      }
    });

    if (changed) {
      _log(
        "transfer-event",
        "Post-event balance: available=${getAvailableBalance()} owned=${getOwnedBalance()} incoming=${getIncomingBalance()}",
      );
      _emitBalanceUpdate();
    }
  }

  BigInt getAvailableBalance() {
    BigInt total = BigInt.zero;
    for (final record in _leaves.values) {
      if (record.status == LeafStatus.AVAILABLE) {
        total += BigInt.parse(record.treeNode.value.toString());
      }
    }
    return total;
  }

  BigInt getOwnedBalance() {
    BigInt total = BigInt.zero;
    for (final record in _leaves.values) {
      if (OWNED_STATUSES.contains(record.status)) {
        total += BigInt.parse(record.treeNode.value.toString());
      }
    }
    return total;
  }

  BigInt getIncomingBalance() {
    BigInt total = BigInt.zero;
    for (final record in _leaves.values) {
      if (record.status == LeafStatus.INCOMING) {
        total += BigInt.parse(record.treeNode.value.toString());
      }
    }
    return total;
  }

  List<TreeNode> _getAvailableLeaves() {
    return _getLeavesByStatus(LeafStatus.AVAILABLE);
  }

  bool isOptimizing() {
    return _optimizationInProgress;
  }

  /// Read-only leaf selection for queries (fee quotes, etc). Does NOT lock leaves.
  List<TreeNode> selectLeavesReadOnly(int targetAmount) {
    final sorted = List<TreeNode>.from(_getAvailableLeaves())
      ..sort((a, b) => b.value.compareTo(a.value)); // Descending order

    final selected = <TreeNode>[];
    int amount = 0;

    for (final leaf in sorted) {
      if (amount >= targetAmount) break;
      amount += leaf.value.toInt();
      selected.add(leaf);
    }
    return selected;
  }

  // ---------------------------------------------------------------------------
  // Leaf Selection
  // ---------------------------------------------------------------------------

  Future<List<List<TreeNode>>> _selectLeavesWithSwap(
    List<BigInt> targetAmounts,
  ) async {
    List<TreeNode>? lockedForSwap;

    // Phase 1: Try exact selection under lock
    await _leavesMutex
        .acquire(); // Assuming your mutex has explicit acquire/release
    try {
      final selection = _selectLeaves(targetAmounts);
      final results = selection.results;
      final found = selection.found;

      if (found) {
        final allSelected = results.expand((l) => l).toList();
        _transition(
          allSelected.map((l) => l.id).toList(),
          LeafStatus.LOCAL_LOCKED,
        );
        return results;
      }

      // Phase 2: Need a swap — lock leaves, capture IDs, then release for the network call
      final totalTargetAmount = targetAmounts.fold<BigInt>(BigInt.zero, (acc, a) => acc + a);
      lockedForSwap = _determineLeavesToSwap(totalTargetAmount);

      _transition(
        lockedForSwap.map((l) => l.id).toList(),
        LeafStatus.LOCAL_LOCKED,
      );
    } finally {
      _leavesMutex.release();
    }

    // Phase 3: Execute swap outside lock — use captured leaves, NOT _getAvailableLeaves
    final swapLeafIds = lockedForSwap.map((l) => l.id).toList();
    late List<TreeNode> newLeaves;

    try {
      newLeaves = await swapService.requestLeavesSwap(
        RequestLeavesSwapParams(
          leaves: lockedForSwap,
          targetAmounts: targetAmounts,
          onSwapInitiated: (initiatedLeafIds) async {
            await _leavesMutex.protect(() async {
              _transition(initiatedLeafIds, LeafStatus.SWAP_PENDING);
            });
          },
          registerSwapTransferId: (String transferId) {
            _updateLeavesSource(swapLeafIds, SwapSource(transferId));
          },
        ),
      );
    } catch (error) {
      // Only restore LOCAL_LOCKED leaves — if onSwapInitiated fired, the leaves
      // are SWAP_PENDING and the SO has them locked. Those will be reconciled
      // on the next sync(). LOCAL_LOCKED means the SO was never contacted.
      restoreLocalLockedToAvailable(swapLeafIds);
      rethrow;
    }

    // Phase 4: Update state and re-select under lock
    return await _leavesMutex.protect(() async {
      _transition(swapLeafIds, LeafStatus.SPENT);

      for (final leaf in newLeaves) {
        _leaves[leaf.id] = LeafRecord(
          treeNode: leaf,
          status: LeafStatus.AVAILABLE,
          source: const NoneSource(),
        );
      }

      final newSelection = _selectLeaves(targetAmounts);
      final newResults = newSelection.results;
      final newFound = newSelection.found;

      if (!newFound) {
        // Cache was mutated (old leaves spent, new leaves added) — notify
        // subscribers even though re-selection failed.
        _emitBalanceUpdate();
        throw Exception(
          "Failed to select leaves for the target amounts after swap",
        );
      }

      final allSelected = newResults.expand((l) => l).toList();
      _transition(
        allSelected.map((l) => l.id).toList(),
        LeafStatus.LOCAL_LOCKED,
      );

      return newResults;
    });
  }

  /// Greedy exact-fit selection. Returns `({List<List<TreeNode>> results, bool found})`.
  /// Must be called while holding the mutex.
  ({List<List<TreeNode>> results, bool found}) _selectLeaves(
    List<BigInt> targetAmounts,
  ) {
    final availableLeaves = _getAvailableLeaves();
    debugPrint("Phase 0 _selectLeaves availableLeaves");
    for (final (index,v) in availableLeaves.indexed) {
      debugPrint("$index: ${v.id}");
      debugPrint("directFromCpfpRefundTx: ${hex.encode(v.directFromCpfpRefundTx)}");
      debugPrint("directRefundTx: ${hex.encode(v.directRefundTx)}");
      debugPrint("directTx: ${hex.encode(v.directTx)}");
      debugPrint("nodeTx: ${hex.encode(v.nodeTx)}");
      debugPrint("refundTx: ${hex.encode(v.refundTx)}");

    }
    final sorted = List<TreeNode>.from(availableLeaves)
      ..sort((a, b) => b.value.compareTo(a.value)); // Descending order

    // Process targets ascending — smaller targets have fewer valid leaf
    // combinations and should claim leaves first to avoid the greedy
    // algorithm missing valid exact-fit solutions.
    final indexed = List.generate(
      targetAmounts.length,
      (i) => (amount: targetAmounts[i], index: i),
    );
    indexed.sort((a, b) => a.amount.compareTo(b.amount));

    final usedIds = <String>{};
    final batches = List<List<TreeNode>>.filled(targetAmounts.length, []);
    BigInt totalAmount = BigInt.zero;

    for (final item in indexed) {
      final targetAmount = item.amount;
      final originalIndex = item.index;

      final nodes = <TreeNode>[];
      BigInt amount = BigInt.zero;

      for (final leaf in sorted) {
        if (usedIds.contains(leaf.id)) continue;
        if (targetAmount - amount >= BigInt.parse(leaf.value.toString())) {
          amount += BigInt.parse(leaf.value.toString());
          nodes.add(leaf);
          usedIds.add(leaf.id);
        }
      }

      totalAmount += amount;
      batches[originalIndex] = nodes;
    }

    final totalTargetAmount = targetAmounts.fold<BigInt>(BigInt.zero, (acc, a) => acc + a);
    return (results: batches, found: totalAmount == totalTargetAmount);
  }

  // ===========================================================================
  // CHUNK: Optimization and Swap Selection
  // (Continuing inside the LeafManager class...)
  // ===========================================================================

  /// Must be called while holding the mutex.
  List<TreeNode> _determineLeavesToSwap(BigInt targetAmount) {
    final availableLeaves = _getAvailableLeaves();
    final sorted = List<TreeNode>.from(availableLeaves)
      ..sort((a, b) => a.value.compareTo(b.value)); // Ascending order

    BigInt amount = BigInt.zero;
    final nodes = <TreeNode>[];

    for (final leaf in sorted) {
      if (amount >= targetAmount) break;
      amount += BigInt.parse(leaf.value.toString());
      nodes.add(leaf);
    }

    if (amount < targetAmount) {
      throw Exception("Not enough leaves to swap for the target amount");
    }
    return nodes;
  }

  // ---------------------------------------------------------------------------
  // Optimization
  // ---------------------------------------------------------------------------

  void _logOptimize(String message) {
    final loggingEnabled = config.getLog();
    if (!loggingEnabled) {
      return;
    }
    print(
      "[${DateTime.now().toIso8601String()}][${connectionManager.getSessionId()}] [spark-sdk][optimize] $message",
    );
  }

  Future<void> _autoOptimizeIfNeeded() async {
    try {
      if (config.getOptimizationOptions().auto != true) return;

      final available = _getLeavesByStatus(LeafStatus.AVAILABLE);

      if (!shouldOptimize(
        available.map((l) => l.value.toInt()).toList(),
        multiplicity: config.getOptimizationOptions().multiplicity ?? 0,
      )) {
        _logOptimize("No optimization needed for ${available.length} leaves");
        return;
      }

      if (onAutoOptimize == null) return;
      _logOptimize("Optimizing leaves for ${available.length} leaves");
      await onAutoOptimize!();
    } catch (_) {
      // Optimization is best-effort. If it fails (e.g., config error, another
      // instance already locked the leaf, or SSP is unavailable), the leaves
      // remain AVAILABLE.
    }
  }

  // Using Dart 3 Records to type the yielded events
  Stream<({int step, int total, StreamController controller})> optimizeLeaves([
    int? multiplicity,
  ]) async* {
    final multiplicityValue =
        multiplicity ?? config.getOptimizationOptions().multiplicity ?? 0;

    if (multiplicityValue < 0) {
      throw SparkValidationError("Multiplicity cannot be negative");
    } else if (multiplicityValue > 5) {
      throw SparkValidationError("Multiplicity cannot be greater than 5");
    }

    _logOptimize("Starting optimization with multiplicity $multiplicityValue");
    if (_optimizationInProgress) {
      _logOptimize("Optimization already in progress");
      return;
    }

    // In Dart, we use a StreamController or CancelToken to mimic AbortController
    final controller = StreamController<void>.broadcast();
    bool ownsFlag = false;
    List<Map<String, dynamic>> swapBatches =
        []; // {leavesToSend: List<TreeNode>, outLeaves: List<int>}

    bool mutexAcquired = false;
    await _leavesMutex.acquire();
    mutexAcquired = true;

    try {
      // Second check under lock — guards against TOCTOU where two callers
      // both pass the optimistic check before either acquires the mutex.
      if (_optimizationInProgress) {
        _logOptimize(
          "Second check under lock — Optimization already in progress",
        );
        return;
      }

      _optimizationInProgress = true;
      ownsFlag = true;

      final availableLeaves = _getAvailableLeaves();
      final swaps = optimize(
        availableLeaves.map((leaf) => leaf.value.toInt()).toList(),
        multiplicity: multiplicityValue,
      );

      if (swaps.isEmpty) {
        _logOptimize("No swaps needed for ${availableLeaves.length} leaves");
        return;
      }

      final mappedSwapsStr = swaps
          .map((s) => {'in': s.inLeaves, 'out': s.outLeaves})
          .toList()
          .toString();
      _logOptimize("Planned ${swaps.length} swap(s): $mappedSwapsStr");

      final valueToNodes = <int, List<TreeNode>>{};
      for (final leaf in availableLeaves) {
        valueToNodes.putIfAbsent(leaf.value.toInt(), () => []).add(leaf);
      }

      swapBatches = [];
      for (final swap in swaps) {
        final leavesToSend = <TreeNode>[];
        for (final leafValue in swap.inLeaves) {
          final nodes = valueToNodes[leafValue];
          if (nodes != null && nodes.isNotEmpty) {
            leavesToSend.add(nodes.removeAt(0)); // Equivalent to shift()
          }
        }

        swapBatches.add({
          'leavesToSend': leavesToSend,
          'outLeaves': swap.outLeaves,
        });

        final batchSum = leavesToSend.fold(
          0,
          (acc, leaf) => acc + leaf.value.toInt(),
        );
        final leafIdsStr = leavesToSend.map((l) => l.id).join(",");
        _logOptimize(
          "Batch ${swapBatches.length}: LOCAL_LOCKED ${leavesToSend.length} leaves ($batchSum sats) ids=[$leafIdsStr]",
        );

        _transition(
          leavesToSend.map((l) => l.id).toList(),
          LeafStatus.LOCAL_LOCKED,
        );
      }

      _leavesMutex.release();
      mutexAcquired = false;

      // Yield step 0 after releasing the mutex so consumers can do async work
      // (e.g., UI updates that call addLeaves/sync) without deadlocking.
      yield (step: 0, total: swapBatches.length, controller: controller);

      for (int i = 0; i < swapBatches.length; i++) {
        final swap = swapBatches[i];
        if (controller.isClosed) break; // Check mock AbortController state

        final leavesToSend = swap['leavesToSend'] as List<TreeNode>;
        final outLeaves = swap['outLeaves'] as List<BigInt>;

        final swapLeafIds = leavesToSend.map((l) => l.id).toList();
        final totalValue = leavesToSend.fold(
          BigInt.zero,
          (acc, leaf) => acc + BigInt.parse(leaf.value.toString()),
        );

        try {
          _logOptimize(
            "Requesting swap ${i + 1} of ${swapBatches.length}: $totalValue sats, ids=[${swapLeafIds.join(",")}] -> [${outLeaves.join(",")}]",
          );

          final newLeaves = await swapService.requestLeavesSwap(
            RequestLeavesSwapParams(
              leaves: leavesToSend,
              targetAmounts: outLeaves,
              onSwapInitiated: (initiatedLeafIds) async {
                _logOptimize(
                  "Swap ${i + 1} initiated. Transitioning leaves to SWAP_PENDING: $totalValue sats",
                );
                await _leavesMutex.protect(() async {
                  _transition(initiatedLeafIds, LeafStatus.SWAP_PENDING);
                });
              },
              registerSwapTransferId: (String transferId) {
                _updateLeavesSource(swapLeafIds, SwapSource(transferId));
              },
            ),
          );

          await _leavesMutex.protect(() async {
            final newLeavesSum = newLeaves.fold(
              0,
              (acc, leaf) => acc + leaf.value.toInt(),
            );
            _logOptimize(
              "Swap ${i + 1} completed. SPENT $totalValue sats ids=[${swapLeafIds.join(",")}], received ${newLeaves.length} leaves ($newLeavesSum sats) ids=[${newLeaves.map((l) => l.id).join(",")}]",
            );

            _transition(swapLeafIds, LeafStatus.SPENT);

            for (final leaf in newLeaves) {
              _leaves[leaf.id] = LeafRecord(
                treeNode: leaf,
                status: LeafStatus.AVAILABLE,
                source: const NoneSource(),
              );
            }

            _emitBalanceUpdate();
            _logOptimize(
              "Post-swap balance: available=${getAvailableBalance()} owned=${getOwnedBalance()}",
            );
          });
        } catch (error) {
          _logOptimize(
            "Error requesting swap ${i + 1} of ${swapBatches.length}: $error. Restoring ids=[${swapLeafIds.join(",")}]",
          );

          // Only restore LOCAL_LOCKED leaves — SWAP_PENDING means the SO was
          // contacted and has them locked; sync() will reconcile those.
          restoreLocalLockedToAvailable(swapLeafIds);

          // Restore all remaining unprocessed batches (always LOCAL_LOCKED)
          for (int j = i + 1; j < swapBatches.length; j++) {
            final remainingIds =
                (swapBatches[j]['leavesToSend'] as List<TreeNode>)
                    .map((l) => l.id)
                    .toList();
            _logOptimize(
              "Restoring remaining batch ${j + 1} ids=[${remainingIds.join(",")}]",
            );
            restoreLocalLockedToAvailable(remainingIds);
          }

          // emitBalanceUpdate deferred to finally block
          rethrow;
        }

        yield (step: i + 1, total: swapBatches.length, controller: controller);
      }
    } finally {
      if (ownsFlag) {
        _optimizationInProgress = false;
        // Restore any LOCAL_LOCKED leaves that were never processed — covers
        // abort, consumer break, and early return. restoreLocalLockedToAvailable
        // is idempotent (no-op for non-LOCAL_LOCKED leaves).
        if (swapBatches.isNotEmpty) {
          for (final swap in swapBatches) {
            final ids = (swap['leavesToSend'] as List<TreeNode>)
                .map((l) => l.id)
                .toList();
            _logOptimize("Cleanup: restoring batch ids=[${ids.join(",")}]");
            restoreLocalLockedToAvailable(ids);
          }
          _emitBalanceUpdate();
        }
        _logOptimize(
          "Optimization complete. Final balance: available=${getAvailableBalance()} owned=${getOwnedBalance()}",
        );
      }

      if (mutexAcquired) {
        _leavesMutex.release();
      }

      if (!controller.isClosed) {
        await controller.close(); // Clean up our mock AbortController
      }
    }
  }

  // ===========================================================================
  // CHUNK: State Machine and Leaf Renewal
  // (Continuing inside the LeafManager class...)
  // ===========================================================================

  // ---------------------------------------------------------------------------
  // State Machine
  // ---------------------------------------------------------------------------

  /// Transition one or more leaves to a new status.
  ///
  /// Resilient by design — this is a local cache, not the source of truth:
  /// - Unknown leaf ids are skipped (next sync() will pick them up).
  void _transition(
    List<String> leafIds,
    LeafStatus toStatus, [
    LeafSource? source,
  ]) {
    for (final leafId in leafIds) {
      final leaf = _leaves[leafId];
      if (leaf == null) {
        continue;
      }

      final allowed = VALID_TRANSITIONS[leaf.status] ?? [];
      if (!allowed.contains(toStatus)) {
        continue;
      }

      if (toStatus == LeafStatus.SPENT) {
        _leaves.remove(leafId);
        continue;
      }

      leaf.status = toStatus;
      if (source != null) {
        leaf.source = source;
      }
    }
  }

  void _updateLeavesSource(List<String> leafIds, LeafSource source) {
    for (final leafId in leafIds) {
      final leaf = _leaves[leafId];
      if (leaf == null || leaf.status == LeafStatus.AVAILABLE) {
        continue;
      }
      leaf.source = source;
    }
  }

  // ---------------------------------------------------------------------------
  // Leaf Renewal
  // ---------------------------------------------------------------------------

  Future<List<TreeNode>> _checkRenewLeaves(List<TreeNode> nodes) async {
    final nodesToRenewNodeTxn = <TreeNode>[];
    final nodesToRenewRefundTxn = <TreeNode>[];
    final nodesToRenewZeroTimelockTxn = <TreeNode>[];
    final nodeIds = <String>[];
    final validNodes = <TreeNode>[];

    for (final node in nodes) {
      try {
        final nodeTx = getTxFromRawTxBytes(Uint8List.fromList(node.nodeTx));
        final refundTx = getTxFromRawTxBytes(Uint8List.fromList(node.refundTx));

        if (nodeTx.inputs.isEmpty) {
          throw SparkValidationError(
            "Invalid node transaction",
            context: {
              'field': "inputsLength",
              'value': nodeTx,
              'expected': "Non-zero inputs length",
            },
          );
        }
        if (refundTx.inputs.isEmpty) {
          throw SparkValidationError(
            "Invalid refund transaction",
            context: {
              'field': "inputsLength",
              'value': refundTx,
              'expected': "Non-zero inputs length",
            },
          );
        }

        final nodeInput = nodeTx.inputs.elementAtOrNull(0);
        final refundInput = refundTx.inputs.elementAtOrNull(0);

        final nodeSequence = nodeInput?.sequence;
        final refundSequence = refundInput?.sequence;

        if (nodeSequence == null) {
          throw SparkValidationError(
            "Invalid node transaction",
            context: {
              'field': "sequence",
              'value': nodeInput,
              'expected': "Non-null sequence",
            },
          );
        }
        if (refundSequence == null) {
          throw SparkValidationError(
            "Invalid refund transaction",
            context: {
              'field': "sequence",
              'value': refundInput,
              'expected': "Non-null sequence",
            },
          );
        }

        final refundSequenceInt = Uint8List.fromList(
          refundSequence,
        ).buffer.asByteData(0).getUint32(0, Endian.little);
        final nodeSequenceInt = Uint8List.fromList(
          nodeSequence,
        ).buffer.asByteData(0).getUint32(0, Endian.little);
        if (doesTxnNeedRenewed(refundSequenceInt)) {
          if (isZeroTimelock(nodeSequenceInt)) {
            nodesToRenewZeroTimelockTxn.add(node);
          } else if (doesTxnNeedRenewed(nodeSequenceInt)) {
            nodesToRenewNodeTxn.add(node);
          } else {
            nodesToRenewRefundTxn.add(node);
          }
          nodeIds.add(node.id);
        } else {
          validNodes.add(node);
        }
      } catch (err) {
        // Skip this node — don't let one malformed leaf abort the entire batch.
        print(
          "[LeafManager] checkRenewLeaves validation failed for node ${node.id}: $err",
        );
      }
    }

    if (nodesToRenewNodeTxn.isEmpty &&
        nodesToRenewRefundTxn.isEmpty &&
        nodesToRenewZeroTimelockTxn.isEmpty) {
      return validNodes;
    }

    final nodesResp = await _queryNodes(
      QueryNodesRequest(
        nodeIds: TreeNodeIds(nodeIds: nodeIds),
        includeParents: true,
        network: Network.valueOf(config.getNetworkProto()),
        statuses: [],
      ),
    );

    final nodesMap = <String, TreeNode>{};
    for (final node in nodesResp.nodes.values) {
      nodesMap[node.id] = node;
    }

    final renewalFutures = <Future<void>>[];

    for (final node in nodesToRenewNodeTxn) {
      renewalFutures.add(() async {
        try {
          final parentNode = _requireParentNode(node, nodesMap);
          final renewedNode = await transferService.renewNodeTxn(
            node,
            parentNode,
          );
          validNodes.add(renewedNode);
        } catch (err) {
          // Skip — don't let one failed renewal discard the rest.
          print("[LeafManager] renewNodeTxn failed for node ${node.id}: $err");
        }
      }());
    }

    for (final node in nodesToRenewRefundTxn) {
      renewalFutures.add(() async {
        try {
          final parentNode = _requireParentNode(node, nodesMap);
          final renewedNode = await transferService.renewRefundTxn(
            node,
            parentNode,
          );
          validNodes.add(renewedNode);
        } catch (err) {
          // Skip — don't let one failed renewal discard the rest.
          print(
            "[LeafManager] renewRefundTxn failed for node ${node.id}: $err",
          );
        }
      }());
    }

    for (final node in nodesToRenewZeroTimelockTxn) {
      renewalFutures.add(() async {
        try {
          final renewedNode = await transferService.renewZeroTimelockNodeTxn(
            node,
          );
          validNodes.add(renewedNode);
        } catch (err) {
          // Skip — don't let one failed renewal discard the rest.
          print(
            "[LeafManager] renewZeroTimelockNodeTxn failed for node ${node.id}: $err",
          );
        }
      }());
    }

    await Future.wait(renewalFutures);

    return validNodes;
  }

  // ===========================================================================
  // CHUNK: Network Queries, Recovery, and Helpers
  // (Completing the LeafManager class)
  // ===========================================================================

  TreeNode _requireParentNode(TreeNode node, Map<String, TreeNode> nodesMap) {
    if (node.parentNodeId.isEmpty) {
      throw Exception("node ${node.id} has no parent");
    }
    final parentNode = nodesMap[node.parentNodeId];
    if (parentNode == null) {
      throw Exception("parent node ${node.parentNodeId} not found");
    }
    return parentNode;
  }

  // ---------------------------------------------------------------------------
  // Network Queries
  // ---------------------------------------------------------------------------

  Future<QueryNodesResponse> _queryNodes(
    QueryNodesRequest baseRequest, {
    String? sparkClientAddress,
    int pageSize = 100,
  }) async {
    final address = sparkClientAddress ?? config.getCoordinatorAddress();
    final aggregatedNodes = <String, TreeNode>{};
    int offset = 0;

    while (true) {
      final sparkClient = await connectionManager.createSparkClient(address);

      // 1. Deep copy the base request so we don't mutate the caller's object,
      // and use cascades to cleanly overwrite the pagination fields.
      final request = baseRequest.deepCopy()
        ..limit = $fixnum.Int64(pageSize)
        ..offset = $fixnum.Int64(offset);

      final response = await sparkClient.query_nodes(request);

      aggregatedNodes.addAll(response.nodes);

      final received = response.nodes.length;

      // 2. Handle the `oneof` field cleanly. Dart protobuf generates a `which[FieldName]()`
      // method to check which `oneof` option is currently set.
      // (Assuming the oneof field is named 'source' in your .proto file)
      final isNodeIds =
          baseRequest.whichSource() == QueryNodesRequest_Source.nodeIds;

      if (received < pageSize || isNodeIds) {
        // 3. Standard Dart protobuf quirk: You usually cannot pass map fields
        // directly into the constructor. You must instantiate and then addAll.
        final finalResponse = QueryNodesResponse(offset: response.offset);
        finalResponse.nodes.addAll(aggregatedNodes);

        return finalResponse;
      }

      offset += pageSize;
    }
  }

  Future<List<Map<String, dynamic>>> _getAllPendingSwaps() async {
    List<Map<String, dynamic>> extractLeaves(dynamic transfer) {
      final results = <Map<String, dynamic>>[];
      for (final leafWrapper in transfer.leaves) {
        if (leafWrapper.hasLeaf()) {
          results.add({'leaf': leafWrapper.leaf, 'transferId': transfer.id});
        }
      }
      return results;
    }

    // A swap has up to 2 transfers: the primary (outgoing) and the counter
    // (incoming replacement). The primary query filters for pre-SENDER_KEY_TWEAKED
    // statuses, so once the primary advances to SENDER_KEY_TWEAKED (which atomically
    // creates the counter swap), it drops out of the primary query. No overlap.
    final futures = await Future.wait([
      _paginateTransfers((params) async {
        // 1. Map the incoming Record to the expected Options object
        final response = await transferService.queryPrimarySwapTransfers(
          TransferQueryOptions(limit: params.limit, offset: params.offset),
        );

        // 2. Map the Protobuf response back to the expected Record
        return (
          // Note: If response.offset is an Int64 from Protobuf, add .toInt() here!
          offset: response.offset.toInt(),
          transfers: response.transfers,
        );
      }, extractLeaves),
      _paginateTransfers((params) async {
        final response = await transferService.queryCounterSwapTransfers(
          TransferQueryOptions(limit: params.limit, offset: params.offset),
        );

        return (offset: response.offset.toInt(), transfers: response.transfers);
      }, extractLeaves),
    ]);

    final primarySwaps = futures[0];
    final counterSwaps = futures[1];

    return [...primarySwaps, ...counterSwaps];
  }

  Future<List<Map<String, dynamic>>> _getAllPendingOutgoingTransfers() async {
    return _paginateTransfers(
      (params) async {
        final response = await transferService.queryCounterSwapTransfers(
          TransferQueryOptions(limit: params.limit, offset: params.offset),
        );

        return (offset: response.offset.toInt(), transfers: response.transfers);
      },
      (transfer) {
        final results = <Map<String, dynamic>>[];
        for (final leafWrapper in transfer.leaves) {
          if (leafWrapper.hasLeaf()) {
            results.add({'leaf': leafWrapper.leaf, 'transferId': transfer.id});
          }
        }
        return results;
      },
    );
  }

  Future<List<Map<String, dynamic>>> _paginateTransfers<T>(
    Future<({List<T> transfers, int offset})> Function(
      ({int limit, int offset}) params,
    )
    query,
    List<Map<String, dynamic>> Function(T transfer) extractLeaves,
  ) async {
    const pageSize = 100;
    final results = <Map<String, dynamic>>[];
    int offset = 0;
    int prevOffset = -1;

    do {
      final response = await query((limit: pageSize, offset: offset));

      for (final transfer in response.transfers) {
        results.addAll(extractLeaves(transfer));
      }

      if (response.transfers.length < pageSize) break;
      if (response.offset == prevOffset) break; // no forward progress

      prevOffset = response.offset;
      offset = response.offset;
    } while (offset >= 0);

    return results;
  }

  // ---------------------------------------------------------------------------
  // Recovery
  // ---------------------------------------------------------------------------

  Future<List<TreeNode>> _recoverLeaves(
    List<TreeNode> leaves,
    KeyDerivation keyDerivation,
  ) async {
    final selfIdentityPubkey = await config.signer.getIdentityPublicKey();

    final leafKeyTweaks = leaves
        .map(
          (leaf) => LeafKeyTweak(
            leaf: leaf,
            keyDerivation: keyDerivation,
            newKeyDerivation: RandomKeyDerivation(),
            receiverIdentityPublicKey: selfIdentityPubkey,
          ),
        )
        .toList();

    final transfer = await transferService.sendTransferWithKeyTweaks(
      leafKeyTweaks,
    );

    final pendingTransfer = await transferService.queryTransfer(transfer.id);

    return pendingTransfer != null
        ? await transferService.claimTransfer(pendingTransfer)
        : [];
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  bool _verifyKey(
    Uint8List pubkey1,
    Uint8List pubkey2,
    Uint8List verifyingKey,
  ) {
    // Requires equalBytes from your assumed crypto utility mappings
    return ListEquality().equals(addPublicKeys(pubkey1, pubkey2), verifyingKey);
  }

  bool _isLeafConsistent(TreeNode leaf, TreeNode? opLeaf) {
    if (opLeaf == null) return false;

    return leaf.status == opLeaf.status &&
        leaf.hasSigningKeyshare() &&
        opLeaf.hasSigningKeyshare() &&
        ListEquality().equals(
          Uint8List.fromList(leaf.signingKeyshare.publicKey),
          Uint8List.fromList(opLeaf.signingKeyshare.publicKey),
        ) &&
        ListEquality().equals(
          Uint8List.fromList(leaf.nodeTx),
          Uint8List.fromList(opLeaf.nodeTx),
        );
  }

  /// Restore leaves that are still LOCAL_LOCKED back to AVAILABLE.
  /// Safe to call after an executor returns — if the SO was successfully contacted,
  /// the status would have already changed to OUTGOING/SWAP_PENDING.
  ///
  /// Public so that batch-send callers can release leaves for failed jobs
  /// before the executor returns (preventing the post-executor transition
  /// from incorrectly marking them OUTGOING).
  void restoreLocalLockedToAvailable(List<String> leafIds) {
    bool changed = false;
    for (final id in leafIds) {
      final record = _leaves[id];
      if (record?.status == LeafStatus.LOCAL_LOCKED) {
        record!.status = LeafStatus.AVAILABLE;
        record.source = const NoneSource();
        changed = true;
      }
    }
    if (changed) _emitBalanceUpdate();
  }

  /// Detects SO errors that indicate our cached leaf state is stale.
  /// This covers: leaf locked by another instance, leaf ownership changed
  /// after a swap by another instance, or leaf otherwise unavailable.
  bool _isStaleLeafError(dynamic error) {
    if (error is! Exception && error is! Error) return false;

    final msg = error.toString().toLowerCase();
    return msg.contains("not available to transfer") ||
        msg.contains("not owned by") ||
        msg.contains("leaf is unavailable") ||
        msg.contains("leaf is not available");
  }

  List<TreeNode> _getLeavesByStatus(LeafStatus status) {
    final result = <TreeNode>[];
    for (final record in _leaves.values) {
      if (record.status == status) {
        result.add(record.treeNode);
      }
    }
    return result;
  }
}
