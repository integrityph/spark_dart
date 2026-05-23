// lib/graphql/objects/register_spark_wallet_webhook_input.dart

import 'spark_wallet_webhook_event_type.dart';

class RegisterSparkWalletWebhookInput {
  final String secret;
  final String url;
  final List<SparkWalletWebhookEventType> eventTypes;

  RegisterSparkWalletWebhookInput({
    required this.secret,
    required this.url,
    required this.eventTypes,
  });

  factory RegisterSparkWalletWebhookInput.fromJson(Map<String, dynamic> json) {
    return RegisterSparkWalletWebhookInput(
      secret: json['secret'] as String,
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
      'secret': secret,
      'url': url,
      'event_types': eventTypes.map((e) => e.value).toList(),
    };
  }
}
