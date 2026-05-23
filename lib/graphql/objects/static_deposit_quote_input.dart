// lib/graphql/objects/static_deposit_quote_input.dart

import 'bitcoin_network.dart';

class StaticDepositQuoteInput {
  /// The transaction id of the deposit.
  final String transactionId;

  /// The output index of the deposit.
  final int outputIndex;

  /// The bitcoin network of the deposit.
  final BitcoinNetwork network;

  /// The partner id for the deposit.
  final String? partnerId;

  StaticDepositQuoteInput({
    required this.transactionId,
    required this.outputIndex,
    required this.network,
    this.partnerId,
  });

  factory StaticDepositQuoteInput.fromJson(Map<String, dynamic> json) {
    return StaticDepositQuoteInput(
      transactionId:
          json['static_deposit_quote_input_transaction_id'] as String,
      outputIndex: json['static_deposit_quote_input_output_index'] as int,
      network: BitcoinNetwork.values.firstWhere(
        (e) => e.name == json['static_deposit_quote_input_network'],
        orElse: () => BitcoinNetwork.futureValue,
      ),
      // Note: partnerId was missing from the TS fromJson/toJson payload,
      // but we include it safely here if it gets added to the GraphQL schema later.
      partnerId: json['static_deposit_quote_input_partner_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'static_deposit_quote_input_transaction_id': transactionId,
      'static_deposit_quote_input_output_index': outputIndex,
      'static_deposit_quote_input_network': network.name,
      if (partnerId != null) 'static_deposit_quote_input_partner_id': partnerId,
    };
  }
}
