// lib/graphql/objects/complete_coop_exit_input.dart

class CompleteCoopExitInput {
  final String userOutboundTransferExternalId;
  final String? coopExitRequestId;

  CompleteCoopExitInput({
    required this.userOutboundTransferExternalId,
    this.coopExitRequestId,
  });

  factory CompleteCoopExitInput.fromJson(Map<String, dynamic> json) {
    return CompleteCoopExitInput(
      userOutboundTransferExternalId:
          json['complete_coop_exit_input_user_outbound_transfer_external_id']
              as String,
      coopExitRequestId:
          json['complete_coop_exit_input_coop_exit_request_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'complete_coop_exit_input_user_outbound_transfer_external_id':
          userOutboundTransferExternalId,
      'complete_coop_exit_input_coop_exit_request_id': coopExitRequestId,
    };
  }
}
