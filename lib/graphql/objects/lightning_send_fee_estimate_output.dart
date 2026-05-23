// lib/graphql/objects/lightning_send_fee_estimate_output.dart

import 'currency_amount.dart';

class LightningSendFeeEstimateOutput {
  final CurrencyAmount feeEstimate;

  LightningSendFeeEstimateOutput({required this.feeEstimate});

  factory LightningSendFeeEstimateOutput.fromJson(Map<String, dynamic> json) {
    return LightningSendFeeEstimateOutput(
      feeEstimate: CurrencyAmount.fromJson(
        json['lightning_send_fee_estimate_output_fee_estimate']
            as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lightning_send_fee_estimate_output_fee_estimate': feeEstimate.toJson(),
    };
  }
}

const String FRAGMENT = '''
fragment LightningSendFeeEstimateOutputFragment on LightningSendFeeEstimateOutput {
    __typename
    lightning_send_fee_estimate_output_fee_estimate: fee_estimate {
        __typename
        currency_amount_original_value: original_value
        currency_amount_original_unit: original_unit
    }
}
''';
