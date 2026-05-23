// lib/graphql/queries/user_request.dart

import '../objects/user_request.dart' as user_request;

const String userRequestQuery =
    '''
  query UserRequest(\$request_id: ID!) {
    user_request(request_id: \$request_id) {
      ...UserRequestFragment
    }
  }
  ${user_request.FRAGMENT}
''';
