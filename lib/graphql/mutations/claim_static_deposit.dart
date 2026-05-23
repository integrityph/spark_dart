// lib/graphql/mutations/claim_static_deposit.dart

import '../objects/claim_static_deposit_output.dart'
    as claim_static_deposit_output;

const String claimStaticDepositMutation =
    '''
  mutation ClaimStaticDeposit(
    \$transaction_id: String!
    \$output_index: Int!
    \$network: BitcoinNetwork!
    \$request_type: ClaimStaticDepositRequestType!
    \$credit_amount_sats: Long
    \$deposit_secret_key: String!
    \$signature: String!
    \$quote_signature: String!
  ) {
    claim_static_deposit(input: {
      transaction_id: \$transaction_id
      output_index: \$output_index
      network: \$network
      request_type: \$request_type
      credit_amount_sats: \$credit_amount_sats
      max_fee_sats: null
      deposit_secret_key: \$deposit_secret_key
      signature: \$signature
      quote_signature: \$quote_signature
    }) {
      ...ClaimStaticDepositOutputFragment
    }
  }
    
  ${claim_static_deposit_output.FRAGMENT}
''';
