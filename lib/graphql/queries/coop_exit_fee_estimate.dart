// lib/graphql/queries/coop_exit_fee_estimate.dart

import '../objects/coop_exit_fee_estimates_output.dart'
    as coop_exit_fee_estimates_output;

const String coopExitFeeEstimateQuery =
    '''
  query CoopExitFeeEstimate(
    \$leaf_external_ids: [UUID!]!
    \$withdrawal_address: String!
  ) {
    coop_exit_fee_estimates(
      input: {
        leaf_external_ids: \$leaf_external_ids
        withdrawal_address: \$withdrawal_address
      }
    ) {
      ...CoopExitFeeEstimatesOutputFragment
    }
  }
  ${coop_exit_fee_estimates_output.FRAGMENT}
''';
