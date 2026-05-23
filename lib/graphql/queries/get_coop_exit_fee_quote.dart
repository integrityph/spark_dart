// lib/graphql/queries/get_coop_exit_fee_quote.dart

import '../objects/coop_exit_fee_quote.dart' as coop_exit_fee_quote;

const String getCoopExitFeeQuoteQuery =
    '''
  query CoopExitFeeQuote(
    \$leaf_external_ids: [UUID!]!
    \$withdrawal_address: String!
  ) {
    coop_exit_fee_quote(
      input: {
        leaf_external_ids: \$leaf_external_ids,
        withdrawal_address: \$withdrawal_address
      }
    ) {
      quote {
        ...CoopExitFeeQuoteFragment
      }
    }
  }
  ${coop_exit_fee_quote.FRAGMENT}
''';
