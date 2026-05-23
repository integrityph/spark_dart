// TODO: Replace with your actual project imports
import 'package:mutex/mutex.dart';

import '../../errors/types.dart'; // SparkValidationError
import '../../src/proto/spark_token.pb.dart'; // OutputWithPreviousTransactionData, TokenOutputStatus
// Assuming TokenOutputsMap is defined in types.dart as:
// typedef TokenOutputsMap = Map<String, List<OutputWithPreviousTransactionData>>;
import '../../spark_wallet/types.dart';
import '../../utils/token_identifier.dart'; // Bech32mTokenIdentifier

class TokenOutputLock {
  final int lockedAt;
  final String? operationId;

  TokenOutputLock({required this.lockedAt, this.operationId});
}

typedef OutputSelector =
    List<OutputWithPreviousTransactionData> Function(
      List<OutputWithPreviousTransactionData> outputs,
      int remainingCapacity,
    );

class TokenOutputAcquireRequest {
  final Bech32mTokenIdentifier tokenIdentifier;
  final OutputSelector selector;

  TokenOutputAcquireRequest({
    required this.tokenIdentifier,
    required this.selector,
  });
}

enum AcquireOutputsMode { single, batch }

class TokenOutputManager {
  final TokenOutputsMap _availableOutputs = {};

  // A local lock is created when a transaction is started from the wallet
  // It's purely meant to prevent concurrent transactions from spending the same outputs.
  // Local locks expire after a configurable time (default: 30 seconds), if they're not returned from the server (SO) as pending.
  // This is in the case where the transaction does not get broadcasted to the SO for whatever reason.
  final Map<String, TokenOutputLock> _localPendingMap = {};

  // A server lock is created when an output is fetched from the server as pending (query_token_outputs)
  // which removes the local lock.
  final TokenOutputsMap _serverPendingMap = {};

  final Mutex _mutex = Mutex();
  final int lockExpiryMs;

  TokenOutputManager({this.lockExpiryMs = 30000});

  // ===========================================================================
  // CHUNK: Output syncing and retrieval
  // (Continuing inside the TokenOutputManager class...)
  // ===========================================================================

  /// Sync all outputs from the server
  ///
  /// @param serverProvidedOutputs - All outputs from the server, grouped by token identifier
  /// @param tokenIdentifiers - If provided, only update these tokens (preserving others).
  ///                           If omitted or empty, replaces all outputs.
  Future<void> setOutputs(
    TokenOutputsMap serverProvidedOutputs, [
    List<Bech32mTokenIdentifier>? tokenIdentifiers,
  ]) async {
    await _mutex.protect(() async {
      final availableByToken =
          <String, List<OutputWithPreviousTransactionData>>{};
      final pendingByToken =
          <String, List<OutputWithPreviousTransactionData>>{};

      for (final entry in serverProvidedOutputs.entries) {
        final tokenId = entry.key;
        final outputs = entry.value;

        final available = <OutputWithPreviousTransactionData>[];
        final pending = <OutputWithPreviousTransactionData>[];

        for (final output in outputs) {
          if (output.hasOutput() &&
              output.output.status ==
                  TokenOutputStatus.TOKEN_OUTPUT_STATUS_PENDING_OUTBOUND) {
            pending.add(output);
            if (output.output.id.isNotEmpty) {
              // Remove the local lock as the output is now pending on the server
              _localPendingMap.remove(output.output.id);
            }
          } else if (output.hasOutput() &&
              output.output.status ==
                  TokenOutputStatus.TOKEN_OUTPUT_STATUS_AVAILABLE) {
            available.add(output);
          }
        }

        if (available.isNotEmpty) {
          availableByToken[tokenId] = available;
        }
        if (pending.isNotEmpty) {
          pendingByToken[tokenId] = pending;
        }
      }

      if (tokenIdentifiers != null && tokenIdentifiers.isNotEmpty) {
        for (final tokenId in tokenIdentifiers) {
          final available = availableByToken[tokenId];
          if (available != null && available.isNotEmpty) {
            _availableOutputs[tokenId] = List.from(available);
          } else {
            _availableOutputs.remove(tokenId);
          }

          final pending = pendingByToken[tokenId];
          if (pending != null && pending.isNotEmpty) {
            _serverPendingMap[tokenId] = List.from(pending);
          } else {
            _serverPendingMap.remove(tokenId);
          }
        }
      } else {
        _availableOutputs.clear();
        for (final entry in availableByToken.entries) {
          _availableOutputs[Bech32mTokenIdentifier(entry.key)] = List.from(
            entry.value,
          );
        }

        _serverPendingMap.clear();
        for (final entry in pendingByToken.entries) {
          _serverPendingMap[Bech32mTokenIdentifier(entry.key)] = List.from(
            entry.value,
          );
        }
      }
    });
  }

  /// Get pending outbound outputs for a token.
  Future<List<OutputWithPreviousTransactionData>> getPendingOutboundOutputs(
    Bech32mTokenIdentifier tokenIdentifier,
  ) async {
    return await _mutex.protect(() async {
      final serverPending = _serverPendingMap[tokenIdentifier] ?? [];
      final availableForToken = _availableOutputs[tokenIdentifier] ?? [];

      final localPendingIds = _localPendingMap.keys.toSet();
      final localPendingOutputs = availableForToken.where((output) {
        final id = output.hasOutput() ? output.output.id : null;
        return id != null && localPendingIds.contains(id);
      }).toList();

      return [...serverPending, ...localPendingOutputs];
    });
  }

  /// Get available outputs for a token (including client-locked pending ones)
  Future<List<OutputWithPreviousTransactionData>> getAvailableOutputs(
    Bech32mTokenIdentifier tokenIdentifier,
  ) async {
    return await _mutex.protect(() async {
      return List.from(_availableOutputs[tokenIdentifier] ?? []);
    });
  }

  /// Check if outputs map has a token identifier.
  Future<bool> hasTokenIdentifier(
    Bech32mTokenIdentifier tokenIdentifier,
  ) async {
    return await _mutex.protect(() async {
      return _availableOutputs.containsKey(tokenIdentifier) ||
          _serverPendingMap.containsKey(tokenIdentifier);
    });
  }

  /// Get all token identifiers in the map.
  Future<List<Bech32mTokenIdentifier>> getTokenIdentifiers() async {
    return await _mutex.protect(() async {
      return _getAllKeys();
    });
  }

  /// Iterate over entries (snapshot).
  Future<
    List<
      MapEntry<Bech32mTokenIdentifier, List<OutputWithPreviousTransactionData>>
    >
  >
  entries() async {
    return await _mutex.protect(() async {
      // Returns a snapshot of the available outputs map
      return _availableOutputs.entries.toList();
    });
  }

  /// Atomically select and lock outputs.
  /// Returns the selected outputs
  ///
  /// @param tokenIdentifier - The token to select from
  /// @param selector - Function to select outputs from available (unlocked) outputs
  /// @param operationId - name of the operation for debugging purposes
  /// @returns outputs that were selected and locked
  Future<List<OutputWithPreviousTransactionData>> acquireOutputs(
    Bech32mTokenIdentifier tokenIdentifier,
    List<OutputWithPreviousTransactionData> Function(
      List<OutputWithPreviousTransactionData> outputs,
    )
    selector, [
    String? operationId,
  ]) async {
    return await _mutex.protect(() async {
      _cleanupExpiredLocks();

      final selectedByToken = _acquireOutputsInternal(
        [
          TokenOutputAcquireRequest(
            tokenIdentifier: tokenIdentifier,
            selector: (outputs, remaining) => selector(outputs),
          ),
        ],
        // Represents Number.MAX_SAFE_INTEGER mapped to Dart's max 64 bit integer bounds.
        // It's technically 9007199254740991 in JS, but for capacity limits, max int is fine.
        9007199254740991,
        operationId,
        AcquireOutputsMode.single,
      );
      return selectedByToken[tokenIdentifier] ?? [];
    });
  }

  /// Atomically acquires and locks outputs across multiple token identifiers.
  ///
  /// @param requests - Per-token acquire requests in priority order
  /// @param maxTotalOutputs - Maximum number of outputs to acquire across all requests
  /// @param operationId - name of the operation for debugging purposes
  Future<TokenOutputsMap> acquireOutputsBatch(
    List<TokenOutputAcquireRequest> requests,
    int maxTotalOutputs, [
    String? operationId,
  ]) async {
    return await _mutex.protect(() async {
      _cleanupExpiredLocks();
      return _acquireOutputsInternal(
        requests,
        maxTotalOutputs,
        operationId,
        AcquireOutputsMode.batch,
      );
    });
  }

  // ===========================================================================
  // CHUNK: Locking, Selection, and Cleanup
  // (Continuing inside the TokenOutputManager class...)
  // ===========================================================================

  /// Lock outputs locally.
  Future<void> lockOutputs(
    List<OutputWithPreviousTransactionData> outputs, [
    String? operationId,
  ]) async {
    await _mutex.protect(() async {
      final now = DateTime.now().millisecondsSinceEpoch;
      for (final output in outputs) {
        if (output.hasOutput()) {
          final id = output.output.id;
          _localPendingMap[id] = TokenOutputLock(
            lockedAt: now,
            operationId: operationId,
          );
        }
      }
    });
  }

  /// Lock specific outputs by ID
  Future<void> lockOutputsByIds(
    List<String> outputIds, [
    String? operationId,
  ]) async {
    await _mutex.protect(() async {
      final now = DateTime.now().millisecondsSinceEpoch;
      for (final id in outputIds) {
        _localPendingMap[id] = TokenOutputLock(
          lockedAt: now,
          operationId: operationId,
        );
      }
    });
  }

  /// Check if an output is locked.
  Future<bool> isLocked(String outputId) async {
    return await _mutex.protect(() async {
      _cleanupExpiredLocks();
      return _localPendingMap.containsKey(outputId);
    });
  }

  /// Check if outputs map is empty.
  Future<bool> isEmpty() async {
    return await _mutex.protect(() async {
      return _availableOutputs.isEmpty && _serverPendingMap.isEmpty;
    });
  }

  /// Get size of outputs map (number of token identifiers).
  Future<int> size() async {
    return await _mutex.protect(() async {
      return _getAllKeys().length;
    });
  }

  /// Clear all outputs and locks.
  Future<void> clear() async {
    await _mutex.protect(() async {
      _availableOutputs.clear();
      _serverPendingMap.clear();
      _localPendingMap.clear();
    });
  }

  List<OutputWithPreviousTransactionData> _getUnlockedOutputsInternal(
    Bech32mTokenIdentifier tokenIdentifier,
  ) {
    final outputs = _availableOutputs[tokenIdentifier] ?? [];
    return outputs.where((o) {
      return o.hasOutput() && !_localPendingMap.containsKey(o.output.id);
    }).toList();
  }

  TokenOutputsMap _acquireOutputsInternal(
    List<TokenOutputAcquireRequest> requests,
    int maxTotalOutputs,
    String? operationId,
    AcquireOutputsMode mode,
  ) {
    if (maxTotalOutputs <= 0 || requests.isEmpty) {
      return {};
    }

    final selectedByToken = <String, List<OutputWithPreviousTransactionData>>{};
    final selectedIds = <String>{};
    int remainingCapacity = maxTotalOutputs;

    for (final request in requests) {
      if (remainingCapacity <= 0) {
        break;
      }

      final available = _getUnlockedOutputsInternal(request.tokenIdentifier);
      final selected = request.selector(available, remainingCapacity);

      if (selected.isEmpty) {
        continue;
      }

      if (mode == AcquireOutputsMode.batch &&
          selected.length > remainingCapacity) {
        _throwRemainingCapacityExceeded(
          request.tokenIdentifier,
          selected.length,
          remainingCapacity,
        );
      }

      final availableIds = available.map((o) => o.output.id).toSet();
      for (final output in selected) {
        final id = output.output.id;
        if (!availableIds.contains(id)) {
          _throwInvalidSelectedOutput(id, request.tokenIdentifier, mode);
        }
        if (mode == AcquireOutputsMode.batch && selectedIds.contains(id)) {
          _throwDuplicateSelectedOutput(id, request.tokenIdentifier);
        }
        selectedIds.add(id);
      }

      selectedByToken[request.tokenIdentifier] = selected;
      if (mode == AcquireOutputsMode.batch) {
        remainingCapacity -= selected.length;
      }
    }

    if (selectedIds.isEmpty) {
      return {};
    }

    final now = DateTime.now().millisecondsSinceEpoch;
    for (final id in selectedIds) {
      _localPendingMap[id] = TokenOutputLock(
        lockedAt: now,
        operationId: operationId,
      );
    }

    return selectedByToken
        .cast<
          Bech32mTokenIdentifier,
          List<OutputWithPreviousTransactionData>
        >();
  }

  Never _throwRemainingCapacityExceeded(
    Bech32mTokenIdentifier tokenIdentifier,
    int selectedLength,
    int remainingCapacity,
  ) {
    throw SparkValidationError(
      "Selector for token $tokenIdentifier exceeded remaining capacity",
      context: {
        'field': "selectedOutputs",
        'value': selectedLength,
        'expected':
            "Less than or equal to remaining capacity ($remainingCapacity)",
        'tokenIdentifier': tokenIdentifier,
      },
    );
  }

  Never _throwInvalidSelectedOutput(
    String id,
    Bech32mTokenIdentifier tokenIdentifier,
    AcquireOutputsMode mode,
  ) {
    if (mode == AcquireOutputsMode.single) {
      throw Exception("Selected output $id is not in the available set");
    }

    throw SparkValidationError(
      "Selected output $id is not in the available set for token $tokenIdentifier",
      context: {
        'field': "selectedOutputs",
        'value': id,
        'expected': "Output ID from the token's available unlocked set",
        'tokenIdentifier': tokenIdentifier,
      },
    );
  }

  Never _throwDuplicateSelectedOutput(
    String id,
    Bech32mTokenIdentifier tokenIdentifier,
  ) {
    throw SparkValidationError(
      "Selected output $id was selected more than once",
      context: {
        'field': "selectedOutputs",
        'value': id,
        'expected': "Each selected output ID must be unique in the batch",
        'tokenIdentifier': tokenIdentifier,
      },
    );
  }

  void _cleanupExpiredLocks() {
    final now = DateTime.now().millisecondsSinceEpoch;
    _localPendingMap.removeWhere(
      (id, lock) => (now - lock.lockedAt) > lockExpiryMs,
    );
  }

  List<Bech32mTokenIdentifier> _getAllKeys() {
    final keys = <Bech32mTokenIdentifier>{
      ..._availableOutputs.keys,
      ..._serverPendingMap.keys,
    };
    return keys.toList();
  }
}
