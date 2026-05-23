// lib/graphql/queries/list_spark_wallet_webhooks.dart

const String listSparkWalletWebhooksQuery = '''
  query ListSparkWalletWebhooks {
    wallet_webhooks {
      webhooks {
        webhook_id
        url
        event_types
      }
    }
  }
''';
