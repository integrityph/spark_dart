// lib/graphql/objects/invoice.dart

import 'bitcoin_network.dart';
import 'currency_amount.dart';

class Invoice {
  final String encodedInvoice;
  final BitcoinNetwork bitcoinNetwork;
  final String paymentHash;
  final CurrencyAmount amount;
  final String createdAt;
  final String expiresAt;
  final String? memo;

  Invoice({
    required this.encodedInvoice,
    required this.bitcoinNetwork,
    required this.paymentHash,
    required this.amount,
    required this.createdAt,
    required this.expiresAt,
    this.memo,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      encodedInvoice: json['invoice_encoded_invoice'] as String,
      bitcoinNetwork: BitcoinNetwork.values.firstWhere(
        (e) => e.name == json['invoice_bitcoin_network'],
        orElse: () => BitcoinNetwork.futureValue,
      ),
      paymentHash: json['invoice_payment_hash'] as String,
      amount: CurrencyAmount.fromJson(
        json['invoice_amount'] as Map<String, dynamic>,
      ),
      createdAt: json['invoice_created_at'] as String,
      expiresAt: json['invoice_expires_at'] as String,
      memo: json['invoice_memo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'invoice_encoded_invoice': encodedInvoice,
      'invoice_bitcoin_network': bitcoinNetwork.name,
      'invoice_payment_hash': paymentHash,
      'invoice_amount': amount.toJson(),
      'invoice_created_at': createdAt,
      'invoice_expires_at': expiresAt,
      'invoice_memo': memo,
    };
  }
}

const String FRAGMENT = '''
fragment InvoiceFragment on Invoice {
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
''';
