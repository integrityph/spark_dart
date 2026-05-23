// lib/graphql/objects/coop_exit_fee_estimates_output.dart

import 'coop_exit_fee_estimate.dart';

class CoopExitFeeEstimatesOutput {
  final CoopExitFeeEstimate? speedFast;
  final CoopExitFeeEstimate? speedMedium;
  final CoopExitFeeEstimate? speedSlow;

  CoopExitFeeEstimatesOutput({
    this.speedFast,
    this.speedMedium,
    this.speedSlow,
  });

  factory CoopExitFeeEstimatesOutput.fromJson(Map<String, dynamic> json) {
    return CoopExitFeeEstimatesOutput(
      speedFast: json['coop_exit_fee_estimates_output_speed_fast'] != null
          ? CoopExitFeeEstimate.fromJson(
              json['coop_exit_fee_estimates_output_speed_fast']
                  as Map<String, dynamic>,
            )
          : null,
      speedMedium: json['coop_exit_fee_estimates_output_speed_medium'] != null
          ? CoopExitFeeEstimate.fromJson(
              json['coop_exit_fee_estimates_output_speed_medium']
                  as Map<String, dynamic>,
            )
          : null,
      speedSlow: json['coop_exit_fee_estimates_output_speed_slow'] != null
          ? CoopExitFeeEstimate.fromJson(
              json['coop_exit_fee_estimates_output_speed_slow']
                  as Map<String, dynamic>,
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coop_exit_fee_estimates_output_speed_fast': speedFast?.toJson(),
      'coop_exit_fee_estimates_output_speed_medium': speedMedium?.toJson(),
      'coop_exit_fee_estimates_output_speed_slow': speedSlow?.toJson(),
    };
  }
}

const String FRAGMENT = '''
fragment CoopExitFeeEstimatesOutputFragment on CoopExitFeeEstimatesOutput {
    __typename
    coop_exit_fee_estimates_output_speed_fast: speed_fast {
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
    coop_exit_fee_estimates_output_speed_medium: speed_medium {
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
    coop_exit_fee_estimates_output_speed_slow: speed_slow {
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
}
''';
