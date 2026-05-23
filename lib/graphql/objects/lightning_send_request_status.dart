// lib/graphql/objects/lightning_send_request_status.dart

enum LightningSendRequestStatus {
  /// This is an enum value that represents values that could be added in the future.
  /// Clients should support unknown values as more of them could be added without notice.
  futureValue('FUTURE_VALUE'),

  created('CREATED'),

  userTransferValidationFailed('USER_TRANSFER_VALIDATION_FAILED'),

  lightningPaymentInitiated('LIGHTNING_PAYMENT_INITIATED'),

  lightningPaymentFailed('LIGHTNING_PAYMENT_FAILED'),

  lightningPaymentSucceeded('LIGHTNING_PAYMENT_SUCCEEDED'),

  preimageProvided('PREIMAGE_PROVIDED'),

  preimageProvidingFailed('PREIMAGE_PROVIDING_FAILED'),

  transferCompleted('TRANSFER_COMPLETED'),

  transferFailed('TRANSFER_FAILED'),

  pendingUserSwapReturn('PENDING_USER_SWAP_RETURN'),

  userSwapReturned('USER_SWAP_RETURNED'),

  userSwapReturnFailed('USER_SWAP_RETURN_FAILED'),

  requestValidated('REQUEST_VALIDATED');

  final String value;
  const LightningSendRequestStatus(this.value);
}
