// lib/graphql/objects/register_spark_wallet_webhook_output.dart

class RegisterSparkWalletWebhookOutput {
  final String webhookId;

  RegisterSparkWalletWebhookOutput({required this.webhookId});

  factory RegisterSparkWalletWebhookOutput.fromJson(Map<String, dynamic> json) {
    return RegisterSparkWalletWebhookOutput(
      webhookId: json['webhook_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'webhook_id': webhookId};
  }
}
