// lib/graphql/objects/spark_leaves_swap_request_status.dart

enum SparkLeavesSwapRequestStatus {
  /// This is an enum value that represents values that could be added in the future.
  /// Clients should support unknown values as more of them could be added without notice.
  futureValue('FUTURE_VALUE'),

  created('CREATED'),

  initiated('INITIATED'),

  leavesLocked('LEAVES_LOCKED'),

  refundTxAdaptorSigned('REFUND_TX_ADAPTOR_SIGNED'),

  inboundTransferClaimed('INBOUND_TRANSFER_CLAIMED'),

  succeeded('SUCCEEDED'),

  expired('EXPIRED'),

  failed('FAILED');

  final String value;
  const SparkLeavesSwapRequestStatus(this.value);
}
