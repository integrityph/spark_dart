// lib/graphql/objects/lightning_receive_request_status.dart

enum LightningReceiveRequestStatus {
  /// This is an enum value that represents values that could be added in the future.
  /// Clients should support unknown values as more of them could be added without notice.
  futureValue('FUTURE_VALUE'),

  invoiceCreated('INVOICE_CREATED'),

  transferCreated('TRANSFER_CREATED'),

  transferCreationFailed('TRANSFER_CREATION_FAILED'),

  refundSigningCommitmentsQueryingFailed(
    'REFUND_SIGNING_COMMITMENTS_QUERYING_FAILED',
  ),

  refundSigningFailed('REFUND_SIGNING_FAILED'),

  paymentPreimageRecovered('PAYMENT_PREIMAGE_RECOVERED'),

  paymentPreimageRecoveringFailed('PAYMENT_PREIMAGE_RECOVERING_FAILED'),

  lightningPaymentReceived('LIGHTNING_PAYMENT_RECEIVED'),

  transferFailed('TRANSFER_FAILED'),

  transferCompleted('TRANSFER_COMPLETED');

  final String value;
  const LightningReceiveRequestStatus(this.value);
}
