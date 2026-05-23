// lib/graphql/objects/spark_wallet_user_to_user_requests_connection.dart

import 'page_info.dart';
import 'user_request.dart';

class SparkWalletUserToUserRequestsConnection {
  /// The total count of objects in this connection, using the current filters. It is different from the
  /// number of objects returned in the current page (in the `entities` field).
  final int count;

  /// An object that holds pagination information about the objects in this connection.
  final PageInfo pageInfo;

  /// The Spark User Requests for the current page of this connection.
  final List<UserRequest> entities;

  /// The typename of the object
  final String typename;

  SparkWalletUserToUserRequestsConnection({
    required this.count,
    required this.pageInfo,
    required this.entities,
    this.typename = 'SparkWalletUserToUserRequestsConnection',
  });

  factory SparkWalletUserToUserRequestsConnection.fromJson(
    Map<String, dynamic> json,
  ) {
    return SparkWalletUserToUserRequestsConnection(
      count: json['spark_wallet_user_to_user_requests_connection_count'] as int,
      pageInfo: PageInfo.fromJson(
        json['spark_wallet_user_to_user_requests_connection_page_info']
            as Map<String, dynamic>,
      ),
      entities:
          (json['spark_wallet_user_to_user_requests_connection_entities']
                  as List<dynamic>)
              .map((e) => UserRequest.fromJson(e as Map<String, dynamic>))
              .toList(),
      typename: 'SparkWalletUserToUserRequestsConnection',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '__typename': typename,
      'spark_wallet_user_to_user_requests_connection_count': count,
      'spark_wallet_user_to_user_requests_connection_page_info': pageInfo
          .toJson(),
      'spark_wallet_user_to_user_requests_connection_entities': entities
          .map((e) => e.toJson())
          .toList(),
    };
  }
}

const String FRAGMENT = '''
fragment SparkWalletUserToUserRequestsConnectionFragment on SparkWalletUserToUserRequestsConnection {
    __typename
    spark_wallet_user_to_user_requests_connection_count: count
    spark_wallet_user_to_user_requests_connection_page_info: page_info {
        __typename
        page_info_has_next_page: has_next_page
        page_info_has_previous_page: has_previous_page
        page_info_start_cursor: start_cursor
        page_info_end_cursor: end_cursor
    }
    spark_wallet_user_to_user_requests_connection_entities: entities {
        id
    }
}
''';
