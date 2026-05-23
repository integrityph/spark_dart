// lib/graphql/mutations/delete_spark_wallet_webhook.dart

const String deleteSparkWalletWebhookMutation = '''
  mutation DeleteSparkWalletWebhook(\$input: DeleteSparkWalletWebhookInput!) {
    delete_wallet_webhook(input: \$input) {
      success
    }
  }
''';
