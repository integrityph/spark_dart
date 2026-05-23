// lib/graphql/queries/leaves_swap_fee_estimate.dart

import '../objects/leaves_swap_fee_estimate_output.dart'
    as leaves_swap_fee_estimate_output;

const String leavesSwapFeeEstimateQuery =
    '''
  query LeavesSwapFeeEstimate(
    \$total_amount_sats: Int!
  ) {
    leaves_swap_fee_estimate(
      input: {
        total_amount_sats: \$total_amount_sats
      }
    ) {
      ...LeavesSwapFeeEstimateOutputFragment
    }
  }
  ${leaves_swap_fee_estimate_output.FRAGMENT}
''';
