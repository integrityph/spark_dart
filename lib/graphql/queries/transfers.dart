// lib/graphql/queries/transfers.dart

import '../objects/transfer.dart' as transfer;
import '../objects/user_request.dart' as user_request;

const String getTransfersQuery =
    '''
  query Transfers(\$transfer_spark_ids: [UUID!]!) {
    transfers(transfer_spark_ids: \$transfer_spark_ids) {
      ...TransferFragment
      transfer_user_request: user_request {
        ...UserRequestFragment
      }
    }
  }
  ${transfer.FRAGMENT}
  ${user_request.FRAGMENT}
''';
