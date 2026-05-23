// lib/graphql/objects/request_coop_exit_input.dart

import 'exit_speed.dart';

class RequestCoopExitInput {
  final List<String> leafExternalIds;
  final String withdrawalAddress;
  final String? idempotencyKey;
  final ExitSpeed exitSpeed;
  final bool withdrawAll;
  List<String>? feeLeafExternalIds;
  String? feeQuoteId;
  final String? userOutboundTransferExternalId;

  RequestCoopExitInput({
    required this.leafExternalIds,
    required this.withdrawalAddress,
    this.idempotencyKey,
    required this.exitSpeed,
    required this.withdrawAll,
    this.feeLeafExternalIds,
    this.feeQuoteId,
    this.userOutboundTransferExternalId,
  });

  factory RequestCoopExitInput.fromJson(Map<String, dynamic> json) {
    return RequestCoopExitInput(
      leafExternalIds:
          (json['request_coop_exit_input_leaf_external_ids'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      withdrawalAddress:
          json['request_coop_exit_input_withdrawal_address'] as String,
      idempotencyKey:
          json['request_coop_exit_input_idempotency_key'] as String?,
      exitSpeed: ExitSpeed.values.firstWhere(
        (e) => e.name == json['request_coop_exit_input_exit_speed'],
        orElse: () => ExitSpeed.futureValue,
      ),
      withdrawAll: json['request_coop_exit_input_withdraw_all'] as bool,
      feeLeafExternalIds:
          json['request_coop_exit_input_fee_leaf_external_ids'] != null
          ? (json['request_coop_exit_input_fee_leaf_external_ids']
                    as List<dynamic>)
                .map((e) => e as String)
                .toList()
          : null,
      feeQuoteId: json['request_coop_exit_input_fee_quote_id'] as String?,
      userOutboundTransferExternalId:
          json['request_coop_exit_input_user_outbound_transfer_external_id']
              as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'request_coop_exit_input_leaf_external_ids': leafExternalIds,
      'request_coop_exit_input_withdrawal_address': withdrawalAddress,
      'request_coop_exit_input_idempotency_key': idempotencyKey,
      'request_coop_exit_input_exit_speed': exitSpeed.name,
      'request_coop_exit_input_withdraw_all': withdrawAll,
      'request_coop_exit_input_fee_leaf_external_ids': feeLeafExternalIds,
      'request_coop_exit_input_fee_quote_id': feeQuoteId,
      'request_coop_exit_input_user_outbound_transfer_external_id':
          userOutboundTransferExternalId,
    };
  }
}
