// lib/graphql/objects/lightning_send_request.dart

import '../../lightspark_core/lightspark_core.dart';
import '../../types/sdk_types.dart';
import 'bitcoin_network.dart';
import 'currency_amount.dart';
import 'lightning_send_request_status.dart';
import 'transfer.dart';

class LightningSendRequest implements UserRequestType {
  /// The unique identifier of this entity across all Lightspark systems.
  /// Should be treated as an opaque string.
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

  /// The lightning invoice user requested to pay.
  final String encodedInvoice;

  /// The fee charged for paying the lightning invoice.
  final CurrencyAmount fee;

  /// The idempotency key of the request.
  final String idempotencyKey;

  /// The status of the request.
  final LightningSendRequestStatus status;

  /// The typename of the object
  @override
  final String typename;

  /// The leaves transfer after lightning payment was sent.
  final Transfer? transfer;

  /// The preimage of the payment.
  final String? paymentPreimage;

  LightningSendRequest({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.network,
    required this.encodedInvoice,
    required this.fee,
    required this.idempotencyKey,
    required this.status,
    this.typename = 'LightningSendRequest',
    this.transfer,
    this.paymentPreimage,
  });

  factory LightningSendRequest.fromJson(Map<String, dynamic> json) {
    return LightningSendRequest(
      id: json['lightning_send_request_id'] as String,
      createdAt: json['lightning_send_request_created_at'] as String,
      updatedAt: json['lightning_send_request_updated_at'] as String,
      network: BitcoinNetwork.values.firstWhere(
        (e) => e.name == json['lightning_send_request_network'],
        orElse: () => BitcoinNetwork.futureValue,
      ),
      encodedInvoice: json['lightning_send_request_encoded_invoice'] as String,
      fee: CurrencyAmount.fromJson(
        json['lightning_send_request_fee'] as Map<String, dynamic>,
      ),
      idempotencyKey: json['lightning_send_request_idempotency_key'] as String,
      status: LightningSendRequestStatus.values.firstWhere(
        (e) => e.name == json['lightning_send_request_status'],
        orElse: () => LightningSendRequestStatus.futureValue,
      ),
      typename: 'LightningSendRequest',
      transfer: json['lightning_send_request_transfer'] != null
          ? Transfer.fromJson(
              json['lightning_send_request_transfer'] as Map<String, dynamic>,
            )
          : null,
      paymentPreimage:
          json['lightning_send_request_payment_preimage'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      '__typename': 'LightningSendRequest',
      'lightning_send_request_id': id,
      'lightning_send_request_created_at': createdAt,
      'lightning_send_request_updated_at': updatedAt,
      'lightning_send_request_network': network.name,
      'lightning_send_request_encoded_invoice': encodedInvoice,
      'lightning_send_request_fee': fee.toJson(),
      'lightning_send_request_idempotency_key': idempotencyKey,
      'lightning_send_request_status': status.name,
      'lightning_send_request_transfer': transfer?.toJson(),
      'lightning_send_request_payment_preimage': paymentPreimage,
    };
  }
}

const String FRAGMENT = '''
fragment LightningSendRequestFragment on LightningSendRequest {
    __typename
    lightning_send_request_id: id
    lightning_send_request_created_at: created_at
    lightning_send_request_updated_at: updated_at
    lightning_send_request_network: network
    lightning_send_request_encoded_invoice: encoded_invoice
    lightning_send_request_fee: fee {
        __typename
        currency_amount_original_value: original_value
        currency_amount_original_unit: original_unit
    }
    lightning_send_request_idempotency_key: idempotency_key
    lightning_send_request_status: status
    lightning_send_request_transfer: transfer {
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
    lightning_send_request_payment_preimage: payment_preimage
}
''';

Query<LightningSendRequest> getLightningSendRequestQuery(String id) {
  return Query<LightningSendRequest>(
    queryPayload:
        '''
query GetLightningSendRequest(\$id: ID!) {
    entity(id: \$id) {
        ... on LightningSendRequest {
            ...LightningSendRequestFragment
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
        return LightningSendRequest.fromJson(
          data['entity'] as Map<String, dynamic>,
        );
      }
      return null;
    },
  );
}
