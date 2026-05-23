// lib/graphql/mutations/get_instant_static_deposit_quote.dart

import '../objects/currency_amount.dart' as currency_amount;
import '../objects/instant_static_deposit_plan.dart'
    as instant_static_deposit_plan;
import '../objects/instant_static_deposit_quote_output.dart'
    as instant_static_deposit_quote_output;

const String getInstantStaticDepositQuoteMutation =
    '''
  mutation CreateInstantStaticDepositQuote(
    \$transaction_id: String!
    \$output_index: Int!
    \$network: BitcoinNetwork!
    \$partner_id: String
  ) {
    create_instant_static_deposit_quote(input: {
      transaction_id: \$transaction_id,
      output_index: \$output_index,
      network: \$network,
      partner_id: \$partner_id
    }) {
      ...InstantStaticDepositQuoteOutputFragment
    }
  }
  ${instant_static_deposit_quote_output.FRAGMENT}
  ${instant_static_deposit_quote_output.STATIC_DEPOSIT_QUOTE_FRAGMENT}
  ${instant_static_deposit_plan.FRAGMENT}
  ${currency_amount.FRAGMENT}
''';
