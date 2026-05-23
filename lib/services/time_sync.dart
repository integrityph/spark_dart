// lib/services/time_sync.dart

// A global stopwatch to provide a cross-platform monotonic clock.
// It starts automatically when this file is first loaded and runs continuously.
import 'dart:io';

final Stopwatch _monotonicClock = Stopwatch()..start();

/// Cross-platform monotonic clock.
/// Returns time in milliseconds with reliable monotonic progression.
int getMonotonicTime() {
  return _monotonicClock.elapsedMilliseconds;
}

class ServerTimeSync {
  int? _estimatedServerOffsetMs;

  /// Records a time synchronization sample from a gRPC response.
  ///
  /// [serverEndDateHeader] - Request end time header 'date'
  /// [serverProcessingTimeMs] - Time spent processing on the server
  /// [clientStartMonotonicMs] - Monotonic time when the request was sent
  /// [clientEndMonotonicMs] - Monotonic time when the response was received
  void recordSync(
    String serverEndDateHeader,
    int serverProcessingTimeMs,
    int clientStartMonotonicMs,
    int clientEndMonotonicMs,
  ) {
    DateTime serverEndTime;

    try {
      serverEndTime = HttpDate.parse(serverEndDateHeader);
    } catch (_) {
      print("Invalid or unsupported server date header: $serverEndDateHeader");
      return;
    }

    final serverEndTimeMs = serverEndTime.millisecondsSinceEpoch;

    // Using ~/ (integer division) ensures we keep precise millisecond ints
    final roundTripTimeMs =
        clientEndMonotonicMs - clientStartMonotonicMs - serverProcessingTimeMs;
    final estimatedServerEndTs = serverEndTimeMs + (roundTripTimeMs ~/ 2);

    _estimatedServerOffsetMs = estimatedServerEndTs - clientEndMonotonicMs;
  }

  /// Gets the current tamper-proof server time.
  /// This time is calculated based on the server offset and monotonic clock,
  /// making it resistant to local system time changes.
  DateTime? getCurrentServerTime() {
    final offset = _estimatedServerOffsetMs;

    if (offset == null) {
      return null;
    }

    final currentMonotonicMs = getMonotonicTime();
    final currentServerTimeMs = currentMonotonicMs + offset;

    return DateTime.fromMillisecondsSinceEpoch(currentServerTimeMs);
  }

  /// Gets the offset between server time and local monotonic time.
  /// This can be used to understand the time difference.
  int? getOffset() {
    return _estimatedServerOffsetMs;
  }

  /// Checks if the time sync has been initialized with at least one sample.
  bool isSynced() {
    return _estimatedServerOffsetMs != null;
  }

  /// Resets all time synchronization data.
  void reset() {
    _estimatedServerOffsetMs = null;
  }
}
