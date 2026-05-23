// lib/graphql/objects/spark_wallet_webhook_event_type.dart

enum SparkWalletWebhookEventType {
  /// This is an enum value that represents values that could be added in the future.
  /// Clients should support unknown values as more of them could be added without notice.
  futureValue('FUTURE_VALUE'),

  sparkLightningReceiveFinished('SPARK_LIGHTNING_RECEIVE_FINISHED'),

  sparkLightningSendFinished('SPARK_LIGHTNING_SEND_FINISHED'),

  sparkCoopExitFinished('SPARK_COOP_EXIT_FINISHED'),

  sparkStatic_depositFinished('SPARK_STATIC_DEPOSIT_FINISHED');

  final String value;
  const SparkWalletWebhookEventType(this.value);
}
