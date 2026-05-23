import 'package:grpc/grpc.dart';

class SparkCallOptions {
  final bool retry;
  final List<String> retryableStatuses;
  final int retryMaxAttempts;
  final CallOptions? grpcOptions;

  const SparkCallOptions({
    this.retry = false,
    this.retryableStatuses = const [],
    this.retryMaxAttempts = 1,
    this.grpcOptions,
  });

  /// This extracts the standard gRPC options that the generated client expects.
  CallOptions? toGrpcCallOptions() => grpcOptions;
}
