// lib/graphql/objects/request_lightning_receive_input.dart

import 'bitcoin_network.dart';

class RequestLightningReceiveInput {
  /// The bitcoin network the lightning invoice is created on.
  final BitcoinNetwork network;

  /// The amount for which the lightning invoice should be created in satoshis.
  final int amountSats;

  /// The 32-byte hash of the payment preimage to use when generating the lightning invoice.
  final String paymentHash;

  /// Whether to embed the spark address in the fallback address field of the Bolt 11 lightning invoice.
  /// Spark-aware wallets can use this field to preferentially pay over spark if they find a spark
  /// address in the fallback address field.
  final bool includeSparkAddress;

  /// The expiry of the lightning invoice in seconds. Default value is 86400 (1 day).
  final int? expirySecs;

  /// The memo to include in the lightning invoice. Should not be provided if the description_hash is
  /// provided.
  final String? memo;

  /// The public key of the user receiving the lightning invoice. If not present, the receiver will be
  /// the creator of this request.
  final String? receiverIdentityPubkey;

  /// The h tag of the invoice. This is the hash of a longer description to include in the lightning
  /// invoice. It is used in LNURL and UMA as the hash of the metadata. This field is mutually exclusive
  /// with the memo field. Only one or the other should be provided.
  final String? descriptionHash;

  /// The spark invoice to embed in the routing hints of the Bolt 11 lightning invoice.
  /// This is mutually exclusive with includeSparkAddress.
  final String? sparkInvoice;

  RequestLightningReceiveInput({
    required this.network,
    required this.amountSats,
    required this.paymentHash,
    required this.includeSparkAddress,
    this.expirySecs,
    this.memo,
    this.receiverIdentityPubkey,
    this.descriptionHash,
    this.sparkInvoice,
  });

  factory RequestLightningReceiveInput.fromJson(Map<String, dynamic> json) {
    return RequestLightningReceiveInput(
      network: BitcoinNetwork.values.firstWhere(
        (e) => e.name == json['request_lightning_receive_input_network'],
        orElse: () => BitcoinNetwork.futureValue,
      ),
      amountSats: json['request_lightning_receive_input_amount_sats'] as int,
      paymentHash:
          json['request_lightning_receive_input_payment_hash'] as String,
      includeSparkAddress:
          json['request_lightning_receive_input_include_spark_address'] as bool,
      expirySecs: json['request_lightning_receive_input_expiry_secs'] as int?,
      memo: json['request_lightning_receive_input_memo'] as String?,
      receiverIdentityPubkey:
          json['request_lightning_receive_input_receiver_identity_pubkey']
              as String?,
      descriptionHash:
          json['request_lightning_receive_input_description_hash'] as String?,
      sparkInvoice:
          json['request_lightning_receive_input_spark_invoice'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'request_lightning_receive_input_network': network.name,
      'request_lightning_receive_input_amount_sats': amountSats,
      'request_lightning_receive_input_payment_hash': paymentHash,
      'request_lightning_receive_input_expiry_secs': expirySecs,
      'request_lightning_receive_input_memo': memo,
      'request_lightning_receive_input_receiver_identity_pubkey':
          receiverIdentityPubkey,
      'request_lightning_receive_input_include_spark_address':
          includeSparkAddress,
      'request_lightning_receive_input_description_hash': descriptionHash,
      'request_lightning_receive_input_spark_invoice': sparkInvoice,
    };
  }
}
