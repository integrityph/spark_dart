// lib/graphql/objects/static_deposit_quote_output.dart

import 'bitcoin_network.dart';

class StaticDepositQuoteOutput {
  /// The transaction id of the deposit.
  final String transactionId;

  /// The output index of the deposit.
  final int outputIndex;

  /// The bitcoin network of the deposit.
  final BitcoinNetwork network;

  /// The amount of sats that will be credited to the user's balance.
  final int creditAmountSats;

  /// The signature of the quote.
  final String signature;

  StaticDepositQuoteOutput({
    required this.transactionId,
    required this.outputIndex,
    required this.network,
    required this.creditAmountSats,
    required this.signature,
  });

  factory StaticDepositQuoteOutput.fromJson(Map<String, dynamic> json) {
    return StaticDepositQuoteOutput(
      transactionId:
          json['static_deposit_quote_output_transaction_id'] as String,
      outputIndex: json['static_deposit_quote_output_output_index'] as int,
      network: BitcoinNetwork.values.firstWhere(
        (e) => e.name == json['static_deposit_quote_output_network'],
        orElse: () => BitcoinNetwork.futureValue,
      ),
      creditAmountSats:
          json['static_deposit_quote_output_credit_amount_sats'] as int,
      signature: json['static_deposit_quote_output_signature'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'static_deposit_quote_output_transaction_id': transactionId,
      'static_deposit_quote_output_output_index': outputIndex,
      'static_deposit_quote_output_network': network.name,
      'static_deposit_quote_output_credit_amount_sats': creditAmountSats,
      'static_deposit_quote_output_signature': signature,
    };
  }
}

const String FRAGMENT = '''
fragment StaticDepositQuoteOutputFragment on StaticDepositQuoteOutput {
    __typename
    static_deposit_quote_output_transaction_id: transaction_id
    static_deposit_quote_output_output_index: output_index
    static_deposit_quote_output_network: network
    static_deposit_quote_output_credit_amount_sats: credit_amount_sats
    static_deposit_quote_output_signature: signature
}
''';
