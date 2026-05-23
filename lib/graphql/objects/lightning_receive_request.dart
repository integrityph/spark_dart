// lib/graphql/objects/lightning_receive_request.dart

import '../../lightspark_core/lightspark_core.dart';
import '../../types/sdk_types.dart';
import 'bitcoin_network.dart';
import 'invoice.dart';
import 'lightning_receive_request_status.dart';
import 'transfer.dart';

class LightningReceiveRequest implements UserRequestType {
  /// The unique identifier of this entity across all Lightspark systems.
  @override
  final String id;

  /// The date and time when the entity was first created.
  @override
  final String createdAt;

  /// The date and time when the entity was last updated.
  @override
  final String updatedAt;

  /// The network the lightning send request is on.
  @override
  final BitcoinNetwork network;

  /// The lightning invoice generated to receive lightning payment.
  final Invoice invoice;

  /// The status of the request.
  final LightningReceiveRequestStatus status;

  /// The typename of the object
  @override
  final String typename;

  /// The leaves transfer after lightning payment was received.
  final Transfer? transfer;

  /// The payment preimage of the invoice if retrieved from SE.
  final String? paymentPreimage;

  /// The receiver's identity public key if different from owner of the request.
  final String? receiverIdentityPublicKey;

  /// The spark invoice of the lightning receive request.
  final String? sparkInvoice;

  LightningReceiveRequest({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.network,
    required this.invoice,
    required this.status,
    this.typename = 'LightningReceiveRequest',
    this.transfer,
    this.paymentPreimage,
    this.receiverIdentityPublicKey,
    this.sparkInvoice,
  });

  factory LightningReceiveRequest.fromJson(Map<String, dynamic> json) {
    return LightningReceiveRequest(
      id: json['lightning_receive_request_id'] as String,
      createdAt: json['lightning_receive_request_created_at'] as String,
      updatedAt: json['lightning_receive_request_updated_at'] as String,
      network: BitcoinNetwork.values.firstWhere(
        (e) => e.name == json['lightning_receive_request_network'],
        orElse: () => BitcoinNetwork.futureValue,
      ),
      invoice: Invoice.fromJson(
        json['lightning_receive_request_invoice'] as Map<String, dynamic>,
      ),
      status: LightningReceiveRequestStatus.values.firstWhere(
        (e) => e.name == json['lightning_receive_request_status'],
        orElse: () => LightningReceiveRequestStatus.futureValue,
      ),
      typename: 'LightningReceiveRequest',
      transfer: json['lightning_receive_request_transfer'] != null
          ? Transfer.fromJson(
              json['lightning_receive_request_transfer']
                  as Map<String, dynamic>,
            )
          : null,
      paymentPreimage:
          json['lightning_receive_request_payment_preimage'] as String?,
      receiverIdentityPublicKey:
          json['lightning_receive_request_receiver_identity_public_key']
              as String?,
      sparkInvoice: json['lightning_receive_request_spark_invoice'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      '__typename': 'LightningReceiveRequest',
      'lightning_receive_request_id': id,
      'lightning_receive_request_created_at': createdAt,
      'lightning_receive_request_updated_at': updatedAt,
      'lightning_receive_request_network': network.name,
      'lightning_receive_request_invoice': invoice.toJson(),
      'lightning_receive_request_status': status.name,
      'lightning_receive_request_transfer': transfer?.toJson(),
      'lightning_receive_request_payment_preimage': paymentPreimage,
      'lightning_receive_request_receiver_identity_public_key':
          receiverIdentityPublicKey,
      'lightning_receive_request_spark_invoice': sparkInvoice,
    };
  }
}

const String FRAGMENT = '''
fragment LightningReceiveRequestFragment on LightningReceiveRequest {
    __typename
    lightning_receive_request_id: id
    lightning_receive_request_created_at: created_at
    lightning_receive_request_updated_at: updated_at
    lightning_receive_request_network: network
    lightning_receive_request_invoice: invoice {
        __typename
        invoice_encoded_invoice: encoded_invoice
        invoice_bitcoin_network: bitcoin_network
        invoice_payment_hash: payment_hash
        invoice_amount: amount {
            __typename
            currency_amount_original_value: original_value
            currency_amount_original_unit: original_unit
        }
        invoice_created_at: created_at
        invoice_expires_at: expires_at
        invoice_memo: memo
    }
    lightning_receive_request_status: status
    lightning_receive_request_transfer: transfer {
        __typename
        transfer_total_amount: total_amount {
            __typename
            currency_amount_original_value: original_value
            currency_amount_original_unit: original_unit
        }
        transfer_spark_id: spark_id
        transfer_user_request: user_request {
            id
        }
    }
    lightning_receive_request_payment_preimage: payment_preimage
    lightning_receive_request_receiver_identity_public_key: receiver_identity_public_key
    lightning_receive_request_spark_invoice: spark_invoice
}
''';

Query<LightningReceiveRequest> getLightningReceiveRequestQuery(String id) {
  return Query<LightningReceiveRequest>(
    queryPayload:
        '''
query GetLightningReceiveRequest(\$id: ID!) {
    entity(id: \$id) {
        ... on LightningReceiveRequest {
            ...LightningReceiveRequestFragment
        }
    }
}

$FRAGMENT    
''',
    variables: {'id': id},
    constructObject: (dynamic data) {
      if (data is Map<String, dynamic> &&
          data.containsKey('entity') &&
          data['entity'] is Map<String, dynamic>) {
        return LightningReceiveRequest.fromJson(
          data['entity'] as Map<String, dynamic>,
        );
      }
      return null;
    },
  );
}
