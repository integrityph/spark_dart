// lib/graphql/objects/instant_static_deposit_plan.dart

import 'currency_amount.dart';

class InstantStaticDepositPlan {
  final String id;
  final CurrencyAmount amount;
  final int confirmations;
  final String status;
  final String? transferSparkId;

  InstantStaticDepositPlan({
    required this.id,
    required this.amount,
    required this.confirmations,
    required this.status,
    this.transferSparkId,
  });

  factory InstantStaticDepositPlan.fromJson(Map<String, dynamic> json) {
    return InstantStaticDepositPlan(
      id: json['static_deposit_plan_id'] as String,
      amount: CurrencyAmount.fromJson(
        json['static_deposit_plan_amount'] as Map<String, dynamic>,
      ),
      confirmations: json['static_deposit_plan_confirmations'] as int,
      status: json['static_deposit_plan_status'] as String,
      transferSparkId: json['static_deposit_plan_transfer_spark_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'static_deposit_plan_id': id,
      'static_deposit_plan_amount': amount.toJson(),
      'static_deposit_plan_confirmations': confirmations,
      'static_deposit_plan_status': status,
      'static_deposit_plan_transfer_spark_id': transferSparkId,
    };
  }
}

const String FRAGMENT = '''
fragment InstantStaticDepositPlanFragment on StaticDepositPlan {
    __typename
    static_deposit_plan_id: id
    static_deposit_plan_amount: amount {
        ...CurrencyAmountFragment
    }
    static_deposit_plan_confirmations: confirmations
    static_deposit_plan_status: status
    static_deposit_plan_transfer_spark_id: transfer_spark_id
}
''';
