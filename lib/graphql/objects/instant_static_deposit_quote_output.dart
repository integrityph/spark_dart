// lib/graphql/objects/instant_static_deposit_quote_output.dart

import 'bitcoin_network.dart';
import 'currency_amount.dart';
import 'instant_static_deposit_plan.dart';

class StaticDepositQuote {
  final String id;
  final BitcoinNetwork network;
  final String transactionId;
  final int outputIndex;
  final CurrencyAmount depositAmount;
  final CurrencyAmount creditAmount;
  final String quoteSignature;

  StaticDepositQuote({
    required this.id,
    required this.network,
    required this.transactionId,
    required this.outputIndex,
    required this.depositAmount,
    required this.creditAmount,
    required this.quoteSignature,
  });

  factory StaticDepositQuote.fromJson(Map<String, dynamic> json) {
    return StaticDepositQuote(
      id: json['static_deposit_quote_id'] as String,
      network: BitcoinNetwork.values.firstWhere(
        (e) => e.name == json['static_deposit_quote_network'],
        orElse: () => BitcoinNetwork.futureValue,
      ),
      transactionId: json['static_deposit_quote_transaction_id'] as String,
      outputIndex: json['static_deposit_quote_output_index'] as int,
      depositAmount: CurrencyAmount.fromJson(
        json['static_deposit_quote_deposit_amount'] as Map<String, dynamic>,
      ),
      creditAmount: CurrencyAmount.fromJson(
        json['static_deposit_quote_credit_amount'] as Map<String, dynamic>,
      ),
      quoteSignature: json['static_deposit_quote_quote_signature'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'static_deposit_quote_id': id,
      'static_deposit_quote_network': network.name,
      'static_deposit_quote_transaction_id': transactionId,
      'static_deposit_quote_output_index': outputIndex,
      'static_deposit_quote_deposit_amount': depositAmount.toJson(),
      'static_deposit_quote_credit_amount': creditAmount.toJson(),
      'static_deposit_quote_quote_signature': quoteSignature,
    };
  }
}

class InstantStaticDepositQuoteOutput {
  final StaticDepositQuote quote;
  final List<InstantStaticDepositPlan> fulfillmentPlans;

  InstantStaticDepositQuoteOutput({
    required this.quote,
    required this.fulfillmentPlans,
  });

  factory InstantStaticDepositQuoteOutput.fromJson(Map<String, dynamic> json) {
    return InstantStaticDepositQuoteOutput(
      quote: StaticDepositQuote.fromJson(
        json['instant_quote_output_quote'] as Map<String, dynamic>,
      ),
      fulfillmentPlans:
          (json['instant_quote_output_fulfillment_plans'] as List<dynamic>?)
              ?.map(
                (e) => InstantStaticDepositPlan.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instant_quote_output_quote': quote.toJson(),
      'instant_quote_output_fulfillment_plans': fulfillmentPlans
          .map((e) => e.toJson())
          .toList(),
    };
  }
}

const String STATIC_DEPOSIT_QUOTE_FRAGMENT = '''
fragment StaticDepositQuoteFragment on StaticDepositQuote {
    __typename
    static_deposit_quote_id: id
    static_deposit_quote_network: network
    static_deposit_quote_transaction_id: transaction_id
    static_deposit_quote_output_index: output_index
    static_deposit_quote_deposit_amount: deposit_amount {
        ...CurrencyAmountFragment
    }
    static_deposit_quote_credit_amount: credit_amount {
        ...CurrencyAmountFragment
    }
    static_deposit_quote_quote_signature: quote_signature
}
''';

const String FRAGMENT = '''
fragment InstantStaticDepositQuoteOutputFragment on CreateInstantStaticDepositQuoteOutput {
    __typename
    instant_quote_output_quote: quote {
        ...StaticDepositQuoteFragment
    }
    instant_quote_output_fulfillment_plans: fulfillment_plans {
        ...InstantStaticDepositPlanFragment
    }
}
''';
