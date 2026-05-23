// lib/graphql/objects/leaf.dart

import 'currency_amount.dart';

class Leaf {
  /// The amount of the leaf.
  final CurrencyAmount amount;

  /// The id of the leaf known at signing operators.
  final String sparkNodeId;

  Leaf({required this.amount, required this.sparkNodeId});

  factory Leaf.fromJson(Map<String, dynamic> json) {
    return Leaf(
      amount: CurrencyAmount.fromJson(
        json['leaf_amount'] as Map<String, dynamic>,
      ),
      sparkNodeId: json['leaf_spark_node_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'leaf_amount': amount.toJson(), 'leaf_spark_node_id': sparkNodeId};
  }
}

const String FRAGMENT = '''
fragment LeafFragment on Leaf {
    __typename
    leaf_amount: amount {
        __typename
        currency_amount_original_value: original_value
        currency_amount_original_unit: original_unit
    }
    leaf_spark_node_id: spark_node_id
}
''';
