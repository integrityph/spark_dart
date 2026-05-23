// lib/graphql/objects/spark_transfer_to_leaves_connection.dart

import 'leaf.dart';
import 'page_info.dart';

class SparkTransferToLeavesConnection {
  /// The total count of objects in this connection, using the current filters.
  /// It is different from the number of objects returned in the current page
  /// (in the `entities` field).
  final int count;

  /// An object that holds pagination information about the objects in this connection.
  final PageInfo pageInfo;

  /// The leaves for the current page of this connection.
  final List<Leaf> entities;

  /// The typename of the object
  final String typename;

  SparkTransferToLeavesConnection({
    required this.count,
    required this.pageInfo,
    required this.entities,
    this.typename = 'SparkTransferToLeavesConnection',
  });

  factory SparkTransferToLeavesConnection.fromJson(Map<String, dynamic> json) {
    return SparkTransferToLeavesConnection(
      count: json['spark_transfer_to_leaves_connection_count'] as int,
      pageInfo: PageInfo.fromJson(
        json['spark_transfer_to_leaves_connection_page_info']
            as Map<String, dynamic>,
      ),
      entities:
          (json['spark_transfer_to_leaves_connection_entities']
                  as List<dynamic>)
              .map((e) => Leaf.fromJson(e as Map<String, dynamic>))
              .toList(),
      typename: 'SparkTransferToLeavesConnection',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '__typename': typename,
      'spark_transfer_to_leaves_connection_count': count,
      'spark_transfer_to_leaves_connection_page_info': pageInfo.toJson(),
      'spark_transfer_to_leaves_connection_entities': entities
          .map((e) => e.toJson())
          .toList(),
    };
  }
}

const String FRAGMENT = '''
fragment SparkTransferToLeavesConnectionFragment on SparkTransferToLeavesConnection {
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
''';
