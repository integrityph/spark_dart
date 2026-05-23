// lib/graphql/objects/coop_exit_fee_estimates_input.dart

class CoopExitFeeEstimatesInput {
  final List<String> leafExternalIds;
  final String withdrawalAddress;

  CoopExitFeeEstimatesInput({
    required this.leafExternalIds,
    required this.withdrawalAddress,
  });

  factory CoopExitFeeEstimatesInput.fromJson(Map<String, dynamic> json) {
    return CoopExitFeeEstimatesInput(
      leafExternalIds:
          (json['coop_exit_fee_estimates_input_leaf_external_ids']
                  as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      withdrawalAddress:
          json['coop_exit_fee_estimates_input_withdrawal_address'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coop_exit_fee_estimates_input_leaf_external_ids': leafExternalIds,
      'coop_exit_fee_estimates_input_withdrawal_address': withdrawalAddress,
    };
  }
}
