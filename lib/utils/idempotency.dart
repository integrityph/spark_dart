// lib/utils/idempotency.dart

import 'package:grpc/grpc.dart';

// You can alias CallOptions to SparkCallOptions if you want to keep the exact TS naming
typedef SparkCallOptions = CallOptions;

const String _idempotencyKeyHeader = "x-idempotency-key";

class IdempotencyOptions {
  /// Optional client-provided idempotency key for deduplication.
  /// If not provided, no idempotency key will be sent (null/undefined).
  ///
  /// Multiple requests with the same key will return the same result
  /// instead of creating duplicates or returning errors.
  final String? idempotencyKey;

  IdempotencyOptions({this.idempotencyKey});
}

/// Add idempotency key to call options metadata.
///
/// [idempotencyKey] - Idempotency key
/// [options] - Existing call options (optional)
/// Returns Call options with idempotency key in metadata
SparkCallOptions optionsWithIdempotencyKey(
  String idempotencyKey, [
  SparkCallOptions? options,
]) {
  // Extract existing metadata or default to an empty map
  final metadata = Map<String, String>.from(options?.metadata ?? {});

  // Inject the idempotency key
  metadata[_idempotencyKeyHeader] = idempotencyKey;

  // Create a new options object with the updated metadata
  final newOptions = CallOptions(metadata: metadata);

  // If previous options existed, merge them (preserves timeouts, providers, etc.)
  if (options != null) {
    return options.mergedWith(newOptions);
  }

  return newOptions;
}
