// lib/graphql/queries/lightning_send_fee_estimate.dart

import '../objects/lightning_send_fee_estimate_output.dart'
    as lightning_send_fee_estimate_output;

const String lightningSendFeeEstimateQuery =
    '''
  query LightningSendFeeEstimate(
    \$encoded_invoice: String!
    \$amount_sats: Long
  ) {
    lightning_send_fee_estimate(
      input: {
        encoded_invoice: \$encoded_invoice
        amount_sats: \$amount_sats
      }
    ) {
      ...LightningSendFeeEstimateOutputFragment
    }
  }
  ${lightning_send_fee_estimate_output.FRAGMENT}
''';
