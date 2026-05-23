// lib/graphql/queries/get_claim_deposit_quote.dart

import '../objects/static_deposit_quote_output.dart'
    as static_deposit_quote_output;

const String getClaimDepositQuoteQuery =
    '''
  query StaticDepositQuote(
    \$transaction_id: String!
    \$output_index: Int!
    \$network: BitcoinNetwork!
  ) {
    static_deposit_quote(
      input: {
        transaction_id: \$transaction_id,
        output_index: \$output_index,
        network: \$network
      }
    ) {
      ...StaticDepositQuoteOutputFragment
    }
  }
  ${static_deposit_quote_output.FRAGMENT}
''';
