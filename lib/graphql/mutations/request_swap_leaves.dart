// lib/graphql/mutations/request_swap_leaves.dart

import '../objects/leaves_swap_request.dart' as leaves_swap_request;

const String requestSwapLeavesMutation =
    '''
  mutation RequestSwap(
    \$adaptor_pubkey: PublicKey!
    \$total_amount_sats: Long!
    \$target_amount_sats: [Long!]!
    \$fee_sats: Long!
    \$user_leaves: [UserLeafInput!]!
    \$user_outbound_transfer_external_id: UUID!
  ) {
    request_swap(input: {
      adaptor_pubkey: \$adaptor_pubkey
      total_amount_sats: \$total_amount_sats
      target_amount_sats: \$target_amount_sats
      fee_sats: \$fee_sats
      user_leaves: \$user_leaves
      user_outbound_transfer_external_id: \$user_outbound_transfer_external_id
    }) {
      request {
        ...LeavesSwapRequestFragment
      }
    }
  }
  
  ${leaves_swap_request.FRAGMENT}
''';
