// lib/graphql/objects/delete_spark_wallet_webhook_output.dart

class DeleteSparkWalletWebhookOutput {
  final bool success;

  DeleteSparkWalletWebhookOutput({required this.success});

  factory DeleteSparkWalletWebhookOutput.fromJson(Map<String, dynamic> json) {
    return DeleteSparkWalletWebhookOutput(success: json['success'] as bool);
  }

  Map<String, dynamic> toJson() {
    return {'success': success};
  }
}
