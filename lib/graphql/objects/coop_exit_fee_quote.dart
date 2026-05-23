// lib/graphql/objects/coop_exit_fee_quote.dart

import '../../lightspark_core/lightspark_core.dart';
import 'bitcoin_network.dart';
import 'currency_amount.dart';

class CoopExitFeeQuote {
  /// The unique identifier of this entity across all Lightspark systems.
  /// Should be treated as an opaque string.
  final String id;

  /// The date and time when the entity was first created.
  final String createdAt;

  /// The date and time when the entity was last updated.
  final String updatedAt;

  /// The network the coop exit fee quote is on.
  final BitcoinNetwork network;

  /// The total currency amount of all the nodes user swapped for the coop exit quote.
  final CurrencyAmount totalAmount;

  /// The fee user pays for the coop exit not including the L1 broadcast fee when exit speed is fast.
  final CurrencyAmount userFeeFast;

  /// The fee user pays for the coop exit not including the L1 broadcast fee when exit speed is medium.
  final CurrencyAmount userFeeMedium;

  /// The fee user pays for the coop exit not including the L1 broadcast fee when exit speed is slow.
  final CurrencyAmount userFeeSlow;

  /// The L1 broadcast fee user pays for the coop exit when exit speed is fast.
  final CurrencyAmount l1BroadcastFeeFast;

  /// The L1 broadcast fee user pays for the coop exit when exit speed is medium.
  final CurrencyAmount l1BroadcastFeeMedium;

  /// The L1 broadcast fee user pays for the coop exit when exit speed is slow.
  final CurrencyAmount l1BroadcastFeeSlow;

  /// The time when the coop exit fee quote expires.
  final String expiresAt;

  /// The typename of the object
  final String typename;

  CoopExitFeeQuote({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.network,
    required this.totalAmount,
    required this.userFeeFast,
    required this.userFeeMedium,
    required this.userFeeSlow,
    required this.l1BroadcastFeeFast,
    required this.l1BroadcastFeeMedium,
    required this.l1BroadcastFeeSlow,
    required this.expiresAt,
    this.typename = 'CoopExitFeeQuote',
  });

  factory CoopExitFeeQuote.fromJson(Map<String, dynamic> json) {
    return CoopExitFeeQuote(
      id: json['coop_exit_fee_quote_id'] as String,
      createdAt: json['coop_exit_fee_quote_created_at'] as String,
      updatedAt: json['coop_exit_fee_quote_updated_at'] as String,
      network: BitcoinNetwork.values.firstWhere(
        (e) => e.name == json['coop_exit_fee_quote_network'],
        orElse: () => BitcoinNetwork.futureValue,
      ),
      totalAmount: CurrencyAmount.fromJson(
        json['coop_exit_fee_quote_total_amount'] as Map<String, dynamic>,
      ),
      userFeeFast: CurrencyAmount.fromJson(
        json['coop_exit_fee_quote_user_fee_fast'] as Map<String, dynamic>,
      ),
      userFeeMedium: CurrencyAmount.fromJson(
        json['coop_exit_fee_quote_user_fee_medium'] as Map<String, dynamic>,
      ),
      userFeeSlow: CurrencyAmount.fromJson(
        json['coop_exit_fee_quote_user_fee_slow'] as Map<String, dynamic>,
      ),
      l1BroadcastFeeFast: CurrencyAmount.fromJson(
        json['coop_exit_fee_quote_l1_broadcast_fee_fast']
            as Map<String, dynamic>,
      ),
      l1BroadcastFeeMedium: CurrencyAmount.fromJson(
        json['coop_exit_fee_quote_l1_broadcast_fee_medium']
            as Map<String, dynamic>,
      ),
      l1BroadcastFeeSlow: CurrencyAmount.fromJson(
        json['coop_exit_fee_quote_l1_broadcast_fee_slow']
            as Map<String, dynamic>,
      ),
      expiresAt: json['coop_exit_fee_quote_expires_at'] as String,
      typename: 'CoopExitFeeQuote',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '__typename': typename,
      'coop_exit_fee_quote_id': id,
      'coop_exit_fee_quote_created_at': createdAt,
      'coop_exit_fee_quote_updated_at': updatedAt,
      'coop_exit_fee_quote_network': network.name,
      'coop_exit_fee_quote_total_amount': totalAmount.toJson(),
      'coop_exit_fee_quote_user_fee_fast': userFeeFast.toJson(),
      'coop_exit_fee_quote_user_fee_medium': userFeeMedium.toJson(),
      'coop_exit_fee_quote_user_fee_slow': userFeeSlow.toJson(),
      'coop_exit_fee_quote_l1_broadcast_fee_fast': l1BroadcastFeeFast.toJson(),
      'coop_exit_fee_quote_l1_broadcast_fee_medium': l1BroadcastFeeMedium
          .toJson(),
      'coop_exit_fee_quote_l1_broadcast_fee_slow': l1BroadcastFeeSlow.toJson(),
      'coop_exit_fee_quote_expires_at': expiresAt,
    };
  }
}

const String FRAGMENT = '''
fragment CoopExitFeeQuoteFragment on CoopExitFeeQuote {
    __typename
    coop_exit_fee_quote_id: id
    coop_exit_fee_quote_created_at: created_at
    coop_exit_fee_quote_updated_at: updated_at
    coop_exit_fee_quote_network: network
    coop_exit_fee_quote_total_amount: total_amount {
        __typename
        currency_amount_original_value: original_value
        currency_amount_original_unit: original_unit
    }
    coop_exit_fee_quote_user_fee_fast: user_fee_fast {
        __typename
        currency_amount_original_value: original_value
        currency_amount_original_unit: original_unit
    }
    coop_exit_fee_quote_user_fee_medium: user_fee_medium {
        __typename
        currency_amount_original_value: original_value
        currency_amount_original_unit: original_unit
    }
    coop_exit_fee_quote_user_fee_slow: user_fee_slow {
        __typename
        currency_amount_original_value: original_value
        currency_amount_original_unit: original_unit
    }
    coop_exit_fee_quote_l1_broadcast_fee_fast: l1_broadcast_fee_fast {
        __typename
        currency_amount_original_value: original_value
        currency_amount_original_unit: original_unit
    }
    coop_exit_fee_quote_l1_broadcast_fee_medium: l1_broadcast_fee_medium {
        __typename
        currency_amount_original_value: original_value
        currency_amount_original_unit: original_unit
    }
    coop_exit_fee_quote_l1_broadcast_fee_slow: l1_broadcast_fee_slow {
        __typename
        currency_amount_original_value: original_value
        currency_amount_original_unit: original_unit
    }
    coop_exit_fee_quote_expires_at: expires_at
}
''';

Query<CoopExitFeeQuote> getCoopExitFeeQuoteQuery(String id) {
  return Query<CoopExitFeeQuote>(
    queryPayload:
        '''
query GetCoopExitFeeQuote(\$id: ID!) {
    entity(id: \$id) {
        ... on CoopExitFeeQuote {
            ...CoopExitFeeQuoteFragment
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
        return CoopExitFeeQuote.fromJson(
          data['entity'] as Map<String, dynamic>,
        );
      }
      return null;
    },
  );
}
