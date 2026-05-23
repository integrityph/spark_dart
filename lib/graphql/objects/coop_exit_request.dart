// lib/graphql/objects/coop_exit_request.dart

import '../../lightspark_core/lightspark_core.dart'; // Adjust for your Query<T> import
import '../../types/sdk_types.dart'; // To get UserRequestType
import 'bitcoin_network.dart';
import 'currency_amount.dart';
import 'exit_speed.dart';
import 'spark_coop_exit_request_status.dart';
import 'transfer.dart';

class CoopExitRequest implements UserRequestType {
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

  /// The fee user pays for the coop exit not including the L1 broadcast fee.
  final CurrencyAmount fee;

  /// The L1 broadcast fee user pays for the coop exit.
  final CurrencyAmount l1BroadcastFee;

  /// The status of this coop exit request.
  final SparkCoopExitRequestStatus status;

  /// The time when the coop exit request expires and the UTXOs are released.
  final String expiresAt;

  /// The raw connector transaction.
  final String rawConnectorTransaction;

  /// The raw coop exit L1 transaction.
  final String rawCoopExitTransaction;

  /// The transaction id of the coop exit transaction.
  final String coopExitTxid;

  /// The typename of the object
  @override
  final String typename;

  /// The fee quote user requested for this coop exit.
  final String? feeQuoteId;

  /// The exit speed user requested for this coop exit.
  final ExitSpeed? exitSpeed;

  /// The swap transfer.
  final Transfer? transfer;

  CoopExitRequest({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.network,
    required this.fee,
    required this.l1BroadcastFee,
    required this.status,
    required this.expiresAt,
    required this.rawConnectorTransaction,
    required this.rawCoopExitTransaction,
    required this.coopExitTxid,
    this.typename = 'CoopExitRequest',
    this.feeQuoteId,
    this.exitSpeed,
    this.transfer,
  });

  factory CoopExitRequest.fromJson(Map<String, dynamic> json) {
    return CoopExitRequest(
      id: json['coop_exit_request_id'] as String,
      createdAt: json['coop_exit_request_created_at'] as String,
      updatedAt: json['coop_exit_request_updated_at'] as String,
      network: BitcoinNetwork.values.firstWhere(
        (e) => e.name == json['coop_exit_request_network'],
        orElse: () => BitcoinNetwork.futureValue,
      ),
      fee: CurrencyAmount.fromJson(
        json['coop_exit_request_fee'] as Map<String, dynamic>,
      ),
      l1BroadcastFee: CurrencyAmount.fromJson(
        json['coop_exit_request_l1_broadcast_fee'] as Map<String, dynamic>,
      ),
      status: SparkCoopExitRequestStatus.values.firstWhere(
        (e) => e.name == json['coop_exit_request_status'],
        orElse: () => SparkCoopExitRequestStatus.futureValue,
      ),
      expiresAt: json['coop_exit_request_expires_at'] as String,
      rawConnectorTransaction:
          json['coop_exit_request_raw_connector_transaction'] as String,
      rawCoopExitTransaction:
          json['coop_exit_request_raw_coop_exit_transaction'] as String,
      coopExitTxid: json['coop_exit_request_coop_exit_txid'] as String,
      typename: 'CoopExitRequest',
      feeQuoteId: json['coop_exit_request_fee_quote']?['id'] as String?,
      exitSpeed: json['coop_exit_request_exit_speed'] != null
          ? ExitSpeed.values.firstWhere(
              (e) => e.name == json['coop_exit_request_exit_speed'],
              orElse: () => ExitSpeed.futureValue,
            )
          : null,
      transfer: json['coop_exit_request_transfer'] != null
          ? Transfer.fromJson(
              json['coop_exit_request_transfer'] as Map<String, dynamic>,
            )
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      '__typename': 'CoopExitRequest',
      'coop_exit_request_id': id,
      'coop_exit_request_created_at': createdAt,
      'coop_exit_request_updated_at': updatedAt,
      'coop_exit_request_network': network.name,
      'coop_exit_request_fee': fee.toJson(),
      'coop_exit_request_l1_broadcast_fee': l1BroadcastFee.toJson(),
      'coop_exit_request_fee_quote': feeQuoteId != null
          ? {'id': feeQuoteId}
          : null,
      'coop_exit_request_exit_speed': exitSpeed?.name,
      'coop_exit_request_status': status.name,
      'coop_exit_request_expires_at': expiresAt,
      'coop_exit_request_raw_connector_transaction': rawConnectorTransaction,
      'coop_exit_request_raw_coop_exit_transaction': rawCoopExitTransaction,
      'coop_exit_request_coop_exit_txid': coopExitTxid,
      'coop_exit_request_transfer': transfer?.toJson(),
    };
  }
}

const String FRAGMENT = '''
fragment CoopExitRequestFragment on CoopExitRequest {
    __typename
    coop_exit_request_id: id
    coop_exit_request_created_at: created_at
    coop_exit_request_updated_at: updated_at
    coop_exit_request_network: network
    coop_exit_request_fee: fee {
        __typename
        currency_amount_original_value: original_value
        currency_amount_original_unit: original_unit
    }
    coop_exit_request_l1_broadcast_fee: l1_broadcast_fee {
        __typename
        currency_amount_original_value: original_value
        currency_amount_original_unit: original_unit
    }
    coop_exit_request_fee_quote: fee_quote {
        id
    }
    coop_exit_request_exit_speed: exit_speed
    coop_exit_request_status: status
    coop_exit_request_expires_at: expires_at
    coop_exit_request_raw_connector_transaction: raw_connector_transaction
    coop_exit_request_raw_coop_exit_transaction: raw_coop_exit_transaction
    coop_exit_request_coop_exit_txid: coop_exit_txid
    coop_exit_request_transfer: transfer {
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
}
''';

Query<CoopExitRequest> getCoopExitRequestQuery(String id) {
  return Query<CoopExitRequest>(
    queryPayload:
        '''
query GetCoopExitRequest(\$id: ID!) {
    entity(id: \$id) {
        ... on CoopExitRequest {
            ...CoopExitRequestFragment
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
        return CoopExitRequest.fromJson(data['entity'] as Map<String, dynamic>);
      }
      return null;
    },
  );
}
