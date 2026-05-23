// lib/graphql/objects/spark_user_request_status.dart

enum SparkUserRequestStatus {
  /// This is an enum value that represents values that could be added in the future.
  /// Clients should support unknown values as more of them could be added without notice.
  futureValue('FUTURE_VALUE'),

  created('CREATED'),

  inProgress('IN_PROGRESS'),

  succeeded('SUCCEEDED'),

  failed('FAILED'),

  canceled('CANCELED'),

  unknown('UNKNOWN');

  final String value;
  const SparkUserRequestStatus(this.value);
}
