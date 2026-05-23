// lib/graphql/objects/request_lightning_send_input.dart

class RequestLightningSendInput {
  final String encodedInvoice;
  final String? idempotencyKey;

  /// The amount you will pay for this invoice in sats. It should ONLY be set when the invoice amount is
  /// zero.
  final int? amountSats;
  final String? userOutboundTransferExternalId;

  RequestLightningSendInput({
    required this.encodedInvoice,
    this.idempotencyKey,
    this.amountSats,
    this.userOutboundTransferExternalId,
  });

  factory RequestLightningSendInput.fromJson(Map<String, dynamic> json) {
    return RequestLightningSendInput(
      encodedInvoice:
          json['request_lightning_send_input_encoded_invoice'] as String,
      idempotencyKey:
          json['request_lightning_send_input_idempotency_key'] as String?,
      amountSats: json['request_lightning_send_input_amount_sats'] as int?,
      userOutboundTransferExternalId:
          json['request_lightning_send_input_user_outbound_transfer_external_id']
              as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'request_lightning_send_input_encoded_invoice': encodedInvoice,
      'request_lightning_send_input_idempotency_key': idempotencyKey,
      'request_lightning_send_input_amount_sats': amountSats,
      'request_lightning_send_input_user_outbound_transfer_external_id':
          userOutboundTransferExternalId,
    };
  }
}
