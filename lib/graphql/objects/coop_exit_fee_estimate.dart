// lib/graphql/objects/coop_exit_fee_estimate.dart

import 'currency_amount.dart';

class CoopExitFeeEstimate {
  final CurrencyAmount userFee;
  final CurrencyAmount l1BroadcastFee;

  CoopExitFeeEstimate({required this.userFee, required this.l1BroadcastFee});

  factory CoopExitFeeEstimate.fromJson(Map<String, dynamic> json) {
    return CoopExitFeeEstimate(
      userFee: CurrencyAmount.fromJson(
        json['coop_exit_fee_estimate_user_fee'] as Map<String, dynamic>,
      ),
      l1BroadcastFee: CurrencyAmount.fromJson(
        json['coop_exit_fee_estimate_l1_broadcast_fee'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coop_exit_fee_estimate_user_fee': userFee.toJson(),
      'coop_exit_fee_estimate_l1_broadcast_fee': l1BroadcastFee.toJson(),
    };
  }
}

const String FRAGMENT = '''
fragment CoopExitFeeEstimateFragment on CoopExitFeeEstimate {
    __typename
    coop_exit_fee_estimate_user_fee: user_fee {
        __typename
        currency_amount_original_value: original_value
        currency_amount_original_unit: original_unit
    }
    coop_exit_fee_estimate_l1_broadcast_fee: l1_broadcast_fee {
        __typename
        currency_amount_original_value: original_value
        currency_amount_original_unit: original_unit
    }
}
''';
