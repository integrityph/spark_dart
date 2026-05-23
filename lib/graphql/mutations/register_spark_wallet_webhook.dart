// lib/graphql/mutations/register_spark_wallet_webhook.dart

const String registerSparkWalletWebhookMutation = '''
  mutation RegisterSparkWalletWebhook(\$input: RegisterSparkWalletWebhookInput!) {
    register_wallet_webhook(input: \$input) {
      webhook_id
    }
  }
''';
