// lib/graphql/objects/spark_wallet_webhook_entry.dart

import 'spark_wallet_webhook_event_type.dart';

class SparkWalletWebhookEntry {
  final String webhookId;
  final String url;
  final List<SparkWalletWebhookEventType> eventTypes;

  SparkWalletWebhookEntry({
    required this.webhookId,
    required this.url,
    required this.eventTypes,
  });

  factory SparkWalletWebhookEntry.fromJson(Map<String, dynamic> json) {
    return SparkWalletWebhookEntry(
      webhookId: json['webhook_id'] as String,
      url: json['url'] as String,
      eventTypes: (json['event_types'] as List<dynamic>)
          .map(
            (e) => SparkWalletWebhookEventType.values.firstWhere(
              (type) => type.value == e,
              orElse: () => SparkWalletWebhookEventType.futureValue,
            ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'webhook_id': webhookId,
      'url': url,
      'event_types': eventTypes.map((e) => e.value).toList(),
    };
  }
}
