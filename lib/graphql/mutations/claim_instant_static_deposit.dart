// lib/graphql/mutations/claim_instant_static_deposit.dart

import '../objects/instant_static_deposit_claim_output.dart'
    as instant_static_deposit_claim;

const String claimInstantStaticDepositMutation =
    '''
  mutation ClaimInstantStaticDeposit(
    \$static_deposit_quote_id: ID!
    \$static_deposit_address_private_key_share: String!
    \$signature: String!
  ) {
    create_claim_instant_static_deposit(input: {
      static_deposit_quote_id: \$static_deposit_quote_id,
      static_deposit_address_private_key_share: \$static_deposit_address_private_key_share,
      signature: \$signature
    }) {
      ...InstantStaticDepositClaimOutputFragment
    }
  }
  ${instant_static_deposit_claim.FRAGMENT}
''';
