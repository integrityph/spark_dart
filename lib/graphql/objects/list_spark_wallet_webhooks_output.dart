// lib/graphql/objects/list_spark_wallet_webhooks_output.dart

import 'spark_wallet_webhook_entry.dart';

class ListSparkWalletWebhooksOutput {
  final List<SparkWalletWebhookEntry> webhooks;

  ListSparkWalletWebhooksOutput({required this.webhooks});

  factory ListSparkWalletWebhooksOutput.fromJson(Map<String, dynamic> json) {
    return ListSparkWalletWebhooksOutput(
      webhooks: (json['webhooks'] as List<dynamic>)
          .map(
            (e) => SparkWalletWebhookEntry.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'webhooks': webhooks.map((e) => e.toJson()).toList()};
  }
}
