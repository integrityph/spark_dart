// lib/graphql/objects/leaves_swap_fee_estimate_output.dart

import 'currency_amount.dart';

class LeavesSwapFeeEstimateOutput {
  final CurrencyAmount feeEstimate;

  LeavesSwapFeeEstimateOutput({required this.feeEstimate});

  factory LeavesSwapFeeEstimateOutput.fromJson(Map<String, dynamic> json) {
    return LeavesSwapFeeEstimateOutput(
      feeEstimate: CurrencyAmount.fromJson(
        json['leaves_swap_fee_estimate_output_fee_estimate']
            as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'leaves_swap_fee_estimate_output_fee_estimate': feeEstimate.toJson(),
    };
  }
}

const String FRAGMENT = '''
fragment LeavesSwapFeeEstimateOutputFragment on LeavesSwapFeeEstimateOutput {
    __typename
    leaves_swap_fee_estimate_output_fee_estimate: fee_estimate {
        __typename
        currency_amount_original_value: original_value
        currency_amount_original_unit: original_unit
    }
}
''';
