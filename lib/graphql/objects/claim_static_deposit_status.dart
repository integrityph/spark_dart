// lib/graphql/objects/claim_static_deposit_status.dart

enum ClaimStaticDepositStatus {
  /// This is an enum value that represents values that could be added in the future.
  /// Clients should support unknown values as more of them could be added without notice.
  futureValue('FUTURE_VALUE'),

  created('CREATED'),

  transferCreated('TRANSFER_CREATED'),

  transferCreationFailed('TRANSFER_CREATION_FAILED'),

  refundSigningCommitmentsQueryingFailed(
    'REFUND_SIGNING_COMMITMENTS_QUERYING_FAILED',
  ),

  refundSigningFailed('REFUND_SIGNING_FAILED'),

  utxoSwappingFailed('UTXO_SWAPPING_FAILED'),

  transferCompleted('TRANSFER_COMPLETED'),

  spendTxCreated('SPEND_TX_CREATED'),

  spendTxBroadcast('SPEND_TX_BROADCAST');

  final String value;
  const ClaimStaticDepositStatus(this.value);
}
