// lib/graphql/objects/spark_user_request_type.dart

enum SparkUserRequestType {
  /// This is an enum value that represents values that could be added in the future.
  /// Clients should support unknown values as more of them could be added without notice.
  futureValue('FUTURE_VALUE'),

  lightningSend('LIGHTNING_SEND'),

  lightningReceive('LIGHTNING_RECEIVE'),

  coopExit('COOP_EXIT'),

  leavesSwap('LEAVES_SWAP'),

  claimStaticDeposit('CLAIM_STATIC_DEPOSIT');

  final String value;
  const SparkUserRequestType(this.value);
}
