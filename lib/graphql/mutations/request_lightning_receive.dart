// lib/graphql/mutations/request_lightning_receive.dart

import '../objects/lightning_receive_request.dart' as lightning_receive_request;

const String requestLightningReceiveMutation =
    '''
  mutation RequestLightningReceive(
    \$network: BitcoinNetwork!
    \$amount_sats: Long!
    \$payment_hash: Hash32!
    \$expiry_secs: Int
    \$memo: String
    \$include_spark_address: Boolean
    \$receiver_identity_pubkey: PublicKey
    \$description_hash: Hash32
    \$spark_invoice: String
  ) {
    request_lightning_receive(
      input: {
        network: \$network
        amount_sats: \$amount_sats
        payment_hash: \$payment_hash
        expiry_secs: \$expiry_secs
        memo: \$memo
        include_spark_address: \$include_spark_address
        receiver_identity_pubkey: \$receiver_identity_pubkey
        description_hash: \$description_hash
        spark_invoice: \$spark_invoice
      }
    ) {
      request {
        ...LightningReceiveRequestFragment
      }
    }
  }
  ${lightning_receive_request.FRAGMENT}
''';
