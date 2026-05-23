// lib/graphql/objects/delete_spark_wallet_webhook_input.dart

class DeleteSparkWalletWebhookInput {
  final String webhookId;

  DeleteSparkWalletWebhookInput({required this.webhookId});

  factory DeleteSparkWalletWebhookInput.fromJson(Map<String, dynamic> json) {
    return DeleteSparkWalletWebhookInput(
      webhookId: json['webhook_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'webhook_id': webhookId};
  }
}
