import '../errors/spark_error.dart'; // Adjust this import to your actual SparkError location

// 1 << i is the bitwise equivalent of 2^i for integers.
final List<int> _denominations = List.generate(28, (i) => 1 << i);

void _sparkAssert(bool condition, [String? message]) {
  if (!condition) {
    throw SparkError(message ?? "Assertion failed");
  }
}

int _sum(Iterable<int> arr) {
  return arr.fold(0, (a, b) => a + b);
}

List<int> _sorted(Iterable<int> arr) {
  final list = arr.toList();
  list.sort();
  return list;
}

bool _equals(List<int> a, List<int> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

Map<int, int> _countOccurrences(Iterable<int> arr) {
  final map = <int, int>{};
  for (final x in arr) {
    map[x] = (map[x] ?? 0) + 1;
  }
  return map;
}

Map<int, int> _subtractCounters(Map<int, int> a, Map<int, int> b) {
  final result = <int, int>{};
  for (final entry in a.entries) {
    final key = entry.key;
    final value = entry.value;
    final diff = value - (b[key] ?? 0);
    if (diff > 0) {
      result[key] = diff;
    }
  }
  return result;
}

List<int> _counterToFlatArray(Map<int, int> counter) {
  final arr = <int>[];
  final sortedEntries = counter.entries.toList()
    ..sort((a, b) => a.key.compareTo(b.key));

  for (final entry in sortedEntries) {
    for (var i = 0; i < entry.value; i++) {
      arr.add(entry.key);
    }
  }
  return arr;
}

List<int> greedyLeaves(int amount) {
  final leaves = <int>[];
  var remaining = amount;

  for (var i = _denominations.length - 1; i >= 0; i--) {
    final leaf = _denominations[i];
    if (leaf > 0) {
      while (remaining >= leaf) {
        remaining -= leaf;
        leaves.add(leaf);
      }
    }
  }

  _sparkAssert(_sum(leaves) == amount, "greedy_leaves: sum mismatch");
  return _sorted(leaves);
}

List<int> swapMinimizingLeaves(int amount, {int multiplicity = 1}) {
  final leaves = <int>[];
  var remaining = amount;

  _sparkAssert(multiplicity > 0, "multiplicity must be > 0");

  for (final leaf in _denominations) {
    if (leaf > 0) {
      for (var i = 0; i < multiplicity; i++) {
        if (remaining >= leaf) {
          remaining -= leaf;
          leaves.add(leaf);
        }
      }
    }
  }

  leaves.addAll(greedyLeaves(remaining));
  _sparkAssert(_sum(leaves) == amount, "swap_minimizing_leaves: sum mismatch");
  return _sorted(leaves);
}

class Swap {
  final List<int> inLeaves;
  final List<int> outLeaves;

  Swap(Iterable<int> inLeaves, Iterable<int> outLeaves)
    : inLeaves = List.from(inLeaves),
      outLeaves = List.from(outLeaves) {
    _sparkAssert(
      _sum(this.inLeaves) == _sum(this.outLeaves),
      "Swap in/out leaves must sum to same value for swap: $this",
    );
  }

  @override
  String toString() {
    return 'Swap(in=$inLeaves, out=$outLeaves)';
  }
}

/// Generates swaps that will result in the unilateral exit maximizing set of leaves. Multiple iterations
/// may be required to reach the optimal set.
///
/// [inputLeaves] - the leaves to optimize.
/// [maxLeavesPerSwap] - soft limit on the number of leaves per swap.
/// Returns the swaps that will result in the unilateral exit maximizing set of leaves.
List<Swap> maximizeUnilateralExit(
  List<int> inputLeaves, {
  int maxLeavesPerSwap = 64,
}) {
  final swaps = <Swap>[];

  var batch = <int>[];
  final leaves = _sorted(inputLeaves);

  // Process leaves in batches of up to approximately maxLeavesPerSwap.
  while (leaves.isNotEmpty) {
    batch.add(leaves.removeAt(0)); // Equivalent to TS Array.shift()
    final target = greedyLeaves(_sum(batch));

    if (batch.length >= maxLeavesPerSwap || target.length >= maxLeavesPerSwap) {
      if (!_equals(target, batch)) {
        swaps.add(Swap(List.from(batch), target));
      }
      batch = <int>[];
    }
  }

  // Process any remaining leaves.
  if (batch.isNotEmpty) {
    final target = greedyLeaves(_sum(batch));
    if (!_equals(target, batch)) {
      swaps.add(Swap(List.from(batch), target));
    }
  }

  return swaps;
}

/// Generates swaps that will minimize the probability of needing to swap during a transfer. Multiple iterations
/// may be required to reach the optimal set.
///
/// [inputLeaves] - the leaves to optimize.
/// [multiplicity] - roughly speaking, the higher the multiplicity, the more transfers can be sent
/// without needing to swap, but setting it too high will slow things down (recommended: 1 or 2)
/// [maxLeavesPerSwap] - soft limit on the number of leaves per swap.
/// Returns the swaps that will minimize the probability of needing to swap during a transfer.
List<Swap> minimizeTransferSwap(
  List<int> inputLeaves, {
  int multiplicity = 1,
  int maxLeavesPerSwap = 64,
}) {
  final balance = _sum(inputLeaves);
  final optimalLeaves = swapMinimizingLeaves(
    balance,
    multiplicity: multiplicity,
  );
  final walletCounter = _countOccurrences(inputLeaves);
  final optimalCounter = _countOccurrences(optimalLeaves);

  final leavesToGive = _subtractCounters(walletCounter, optimalCounter);
  final leavesToReceive = _subtractCounters(optimalCounter, walletCounter);

  final leavesToGiveFlat = _counterToFlatArray(leavesToGive);
  final leavesToReceiveFlat = _counterToFlatArray(leavesToReceive);

  final swaps = <Swap>[];
  var toGiveBatch = <int>[];
  var toReceiveBatch = <int>[];
  final give = List<int>.from(leavesToGiveFlat);
  final receive = List<int>.from(leavesToReceiveFlat);

  while (give.isNotEmpty || receive.isNotEmpty) {
    if (_sum(toGiveBatch) > _sum(toReceiveBatch)) {
      if (receive.isEmpty) break;
      toReceiveBatch.add(receive.removeAt(0));
    } else {
      if (give.isEmpty) break;
      toGiveBatch.add(give.removeAt(0));
    }

    if (toGiveBatch.isNotEmpty &&
        toReceiveBatch.isNotEmpty &&
        _sum(toGiveBatch) == _sum(toReceiveBatch)) {
      if (toGiveBatch.length > maxLeavesPerSwap) {
        for (var i = 0; i < toGiveBatch.length; i += maxLeavesPerSwap) {
          final endIndex = (i + maxLeavesPerSwap > toGiveBatch.length)
              ? toGiveBatch.length
              : i + maxLeavesPerSwap;
          final subset = toGiveBatch.sublist(i, endIndex);
          swaps.add(Swap(subset, greedyLeaves(_sum(subset))));
        }
      } else if (toReceiveBatch.length > maxLeavesPerSwap) {
        for (var cutoff = maxLeavesPerSwap; cutoff > 0; cutoff--) {
          final sumCut = _sum(toReceiveBatch.sublist(0, cutoff));
          final remainder = _sum(toGiveBatch) - sumCut;
          final alternateBatch = <int>[
            ...toReceiveBatch.sublist(0, cutoff),
            ...greedyLeaves(remainder),
          ];
          if (alternateBatch.length <= maxLeavesPerSwap) {
            swaps.add(Swap(List.from(toGiveBatch), alternateBatch));
            break;
          }
        }
      } else {
        swaps.add(Swap(List.from(toGiveBatch), List.from(toReceiveBatch)));
      }

      toGiveBatch = <int>[];
      toReceiveBatch = <int>[];
    }
  }

  return swaps;
}

bool shouldOptimize(
  List<int> inputLeaves, {
  int multiplicity = 1,
  int maxLeavesPerSwap = 64,
}) {
  if (multiplicity == 0) {
    // When optimizing for unilateral exits, we should only optimize if it reduces the
    // number of leaves by more than 5x.
    final swaps = maximizeUnilateralExit(
      inputLeaves,
      maxLeavesPerSwap: maxLeavesPerSwap,
    );
    final numInputs = _sum(swaps.map((swap) => swap.inLeaves.length));
    final numOutputs = _sum(swaps.map((swap) => swap.outLeaves.length));
    return numOutputs * 5 < numInputs;
  } else {
    // When optimizing for swap-minimization, we should only optimize if it changes the
    // number of active denominations by more than 2.
    final swaps = minimizeTransferSwap(
      inputLeaves,
      multiplicity: multiplicity,
      maxLeavesPerSwap: maxLeavesPerSwap,
    );
    // TypeScript's `flatMap` equivalent in Dart is `expand`
    final inputCounter = _countOccurrences(
      swaps.expand((swap) => swap.inLeaves),
    );
    final outputCounter = _countOccurrences(
      swaps.expand((swap) => swap.outLeaves),
    );

    return (inputCounter.length - outputCounter.length).abs() > 2;
  }
}

List<Swap> optimize(
  List<int> inputLeaves, {
  int multiplicity = 1,
  int maxLeavesPerSwap = 64,
}) {
  if (multiplicity == 0) {
    return maximizeUnilateralExit(
      inputLeaves,
      maxLeavesPerSwap: maxLeavesPerSwap,
    );
  } else {
    return minimizeTransferSwap(
      inputLeaves,
      multiplicity: multiplicity,
      maxLeavesPerSwap: maxLeavesPerSwap,
    );
  }
}
