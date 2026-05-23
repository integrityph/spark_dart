// lib/graphql/mutations/complete_coop_exit.dart

import '../objects/coop_exit_request.dart' as coop_exit_request;

const String completeCoopExitMutation =
    '''
  mutation CompleteCoopExit(
    \$user_outbound_transfer_external_id: UUID!
    \$coop_exit_request_id: ID
  ) {
    complete_coop_exit(input: {
      user_outbound_transfer_external_id: \$user_outbound_transfer_external_id
      coop_exit_request_id: \$coop_exit_request_id
    }) {
      request {
        ...CoopExitRequestFragment
      }
    }
  }
    
  ${coop_exit_request.FRAGMENT}
''';
