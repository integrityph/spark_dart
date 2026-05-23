// lib/graphql/objects/exit_speed.dart

enum ExitSpeed {
  /// This is an enum value that represents values that could be added in the future.
  /// Clients should support unknown values as more of them could be added without notice.
  futureValue('FUTURE_VALUE'),

  fast('FAST'),

  medium('MEDIUM'),

  slow('SLOW');

  final String value;
  const ExitSpeed(this.value);
}
