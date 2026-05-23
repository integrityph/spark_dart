// lib/graphql/objects/coop_exit_fee_quote_input.dart

class CoopExitFeeQuoteInput {
  final List<String> leafExternalIds;
  final String withdrawalAddress;

  CoopExitFeeQuoteInput({
    required this.leafExternalIds,
    required this.withdrawalAddress,
  });

  factory CoopExitFeeQuoteInput.fromJson(Map<String, dynamic> json) {
    return CoopExitFeeQuoteInput(
      leafExternalIds:
          (json['coop_exit_fee_quote_input_leaf_external_ids'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      withdrawalAddress:
          json['coop_exit_fee_quote_input_withdrawal_address'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coop_exit_fee_quote_input_leaf_external_ids': leafExternalIds,
      'coop_exit_fee_quote_input_withdrawal_address': withdrawalAddress,
    };
  }
}
