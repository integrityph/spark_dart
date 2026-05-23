// lib/graphql/objects/spark_coop_exit_request_status.dart

enum SparkCoopExitRequestStatus {
  /// This is an enum value that represents values that could be added in the future.
  /// Clients should support unknown values as more of them could be added without notice.
  futureValue('FUTURE_VALUE'),

  initiated('INITIATED'),

  inboundTransferChecked('INBOUND_TRANSFER_CHECKED'),

  txSigned('TX_SIGNED'),

  txBroadcasted('TX_BROADCASTED'),

  waitingOnTxConfirmations('WAITING_ON_TX_CONFIRMATIONS'),

  succeeded('SUCCEEDED'),

  expired('EXPIRED'),

  failed('FAILED');

  final String value;
  const SparkCoopExitRequestStatus(this.value);
}
