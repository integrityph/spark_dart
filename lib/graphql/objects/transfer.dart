// lib/graphql/objects/transfer.dart

// Adjust these imports based on your project structure:
// import '../../client.dart';
// import '../../lightspark_core/lightspark_core.dart'; // For Query<T>
import '../../lightspark_core/lightspark_core.dart';

import 'currency_amount.dart';
import 'spark_transfer_to_leaves_connection.dart';

class Transfer {
  /// The total amount of the transfer.
  final CurrencyAmount totalAmount;

  /// The id of the transfer known at signing operators. If not set, the transfer hasn't been initialized.
  final String? sparkId;

  /// The user request this transfer belongs to, if there is any
  final String? userRequestId;

  Transfer({required this.totalAmount, this.sparkId, this.userRequestId});

  /// Fetches the leaves associated with this transfer.
  /// Note: Requires the main LightsparkClient instance to execute the query.
  Future<SparkTransferToLeavesConnection> getLeaves(
    dynamic
    client, { // Typed as dynamic here, replace with LightsparkClient type
    int? first,
    String? after,
  }) async {
    final query = Query<SparkTransferToLeavesConnection>(
      queryPayload: ''' 
query FetchSparkTransferToLeavesConnection(\$entity_id: ID!, \$first: Int, \$after: String) {
    entity(id: \$entity_id) {
        ... on Transfer {
            leaves(, first: \$first, after: \$after) {
                __typename
                spark_transfer_to_leaves_connection_count: count
                spark_transfer_to_leaves_connection_page_info: page_info {
                    __typename
                    page_info_has_next_page: has_next_page
                    page_info_has_previous_page: has_previous_page
                    page_info_start_cursor: start_cursor
                    page_info_end_cursor: end_cursor
                }
                spark_transfer_to_leaves_connection_entities: entities {
                    __typename
                    leaf_amount: amount {
                        __typename
                        currency_amount_original_value: original_value
                        currency_amount_original_unit: original_unit
                    }
                    leaf_spark_node_id: spark_node_id
                }
            }
        }
    }
}
''',
      variables: {'entity_id': sparkId, 'first': first, 'after': after},
      constructObject: (dynamic json) {
        if (json is Map<String, dynamic> &&
            json.containsKey('entity') &&
            json['entity'] is Map<String, dynamic> &&
            json['entity'].containsKey('leaves')) {
          return SparkTransferToLeavesConnection.fromJson(
            json['entity']['leaves'] as Map<String, dynamic>,
          );
        }
        throw Exception(
          'Failed to parse SparkTransferToLeavesConnection from response.',
        );
      },
    );

    // Using executeQuery based on the Requester class ported earlier.
    final result = await client.executeQuery(query);
    if (result == null) {
      throw Exception('Query returned null');
    }
    return result;
  }

  factory Transfer.fromJson(Map<String, dynamic> json) {
    return Transfer(
      totalAmount: CurrencyAmount.fromJson(
        json['transfer_total_amount'] as Map<String, dynamic>,
      ),
      sparkId: json['transfer_spark_id'] as String?,
      userRequestId: json['transfer_user_request']?['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transfer_total_amount': totalAmount.toJson(),
      'transfer_spark_id': sparkId,
      'transfer_user_request': userRequestId != null
          ? {'id': userRequestId}
          : null,
    };
  }
}

const String FRAGMENT = '''
fragment TransferFragment on Transfer {
    __typename
    transfer_total_amount: total_amount {
        __typename
        currency_amount_original_value: original_value
        currency_amount_original_unit: original_unit
    }
    transfer_spark_id: spark_id
    transfer_user_request: user_request {
        id
    }
}
''';
