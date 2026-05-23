// lib/graphql/objects/claim_static_deposit.dart

import '../../lightspark_core/lightspark_core.dart'; // Adjust for your Query<T> import
import '../../types/sdk_types.dart'; // To get UserRequestType
import 'bitcoin_network.dart';
import 'claim_static_deposit_status.dart';
import 'currency_amount.dart';

class ClaimStaticDeposit implements UserRequestType {
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

  /// The amount of credit to be added to the user's balance.
  final CurrencyAmount creditAmount;

  /// The maximum fee that the user is willing to pay.
  final CurrencyAmount maxFee;

  /// The status of the request.
  final ClaimStaticDepositStatus status;

  /// The transaction id of the deposit.
  final String transactionId;

  /// The output index of the deposit.
  final int outputIndex;

  /// The Bitcoin network of the deposit.
  final BitcoinNetwork bitcoinNetwork;

  /// The typename of the object
  @override
  final String typename;

  /// The id of the transfer.
  final String? transferSparkId;

  ClaimStaticDeposit({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.network,
    required this.creditAmount,
    required this.maxFee,
    required this.status,
    required this.transactionId,
    required this.outputIndex,
    required this.bitcoinNetwork,
    this.typename = 'ClaimStaticDeposit',
    this.transferSparkId,
  });

  factory ClaimStaticDeposit.fromJson(Map<String, dynamic> json) {
    return ClaimStaticDeposit(
      id: json['claim_static_deposit_id'] as String,
      createdAt: json['claim_static_deposit_created_at'] as String,
      updatedAt: json['claim_static_deposit_updated_at'] as String,
      network: BitcoinNetwork.values.firstWhere(
        (e) => e.name == json['claim_static_deposit_network'],
        orElse: () => BitcoinNetwork
            .futureValue, // Assuming standard TS/Dart fallback naming
      ),
      creditAmount: CurrencyAmount.fromJson(
        json['claim_static_deposit_credit_amount'] as Map<String, dynamic>,
      ),
      maxFee: CurrencyAmount.fromJson(
        json['claim_static_deposit_max_fee'] as Map<String, dynamic>,
      ),
      status: ClaimStaticDepositStatus.values.firstWhere(
        (e) => e.name == json['claim_static_deposit_status'],
        orElse: () => ClaimStaticDepositStatus.futureValue,
      ),
      transactionId: json['claim_static_deposit_transaction_id'] as String,
      outputIndex: json['claim_static_deposit_output_index'] as int,
      bitcoinNetwork: BitcoinNetwork.values.firstWhere(
        (e) => e.name == json['claim_static_deposit_bitcoin_network'],
        orElse: () => BitcoinNetwork.futureValue,
      ),
      typename: 'ClaimStaticDeposit',
      transferSparkId:
          json['claim_static_deposit_transfer_spark_id'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      '__typename': 'ClaimStaticDeposit',
      'claim_static_deposit_id': id,
      'claim_static_deposit_created_at': createdAt,
      'claim_static_deposit_updated_at': updatedAt,
      'claim_static_deposit_network': network.name,
      'claim_static_deposit_credit_amount': creditAmount.toJson(),
      'claim_static_deposit_max_fee': maxFee.toJson(),
      'claim_static_deposit_status': status.name,
      'claim_static_deposit_transaction_id': transactionId,
      'claim_static_deposit_output_index': outputIndex,
      'claim_static_deposit_bitcoin_network': bitcoinNetwork.name,
      'claim_static_deposit_transfer_spark_id': transferSparkId,
    };
  }
}

const String FRAGMENT = '''
fragment ClaimStaticDepositFragment on ClaimStaticDeposit {
    __typename
    claim_static_deposit_id: id
    claim_static_deposit_created_at: created_at
    claim_static_deposit_updated_at: updated_at
    claim_static_deposit_network: network
    claim_static_deposit_credit_amount: credit_amount {
        __typename
        currency_amount_original_value: original_value
        currency_amount_original_unit: original_unit
    }
    claim_static_deposit_max_fee: max_fee {
        __typename
        currency_amount_original_value: original_value
        currency_amount_original_unit: original_unit
    }
    claim_static_deposit_status: status
    claim_static_deposit_transaction_id: transaction_id
    claim_static_deposit_output_index: output_index
    claim_static_deposit_bitcoin_network: bitcoin_network
    claim_static_deposit_transfer_spark_id: transfer_spark_id
}
''';

Query<ClaimStaticDeposit> getClaimStaticDepositQuery(String id) {
  return Query<ClaimStaticDeposit>(
    queryPayload:
        '''
query GetClaimStaticDeposit(\$id: ID!) {
    entity(id: \$id) {
        ... on ClaimStaticDeposit {
            ...ClaimStaticDepositFragment
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
        return ClaimStaticDeposit.fromJson(
          data['entity'] as Map<String, dynamic>,
        );
      }
      return null;
    },
  );
}
