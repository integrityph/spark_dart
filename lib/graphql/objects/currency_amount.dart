// lib/graphql/objects/currency_amount.dart

import 'currency_unit.dart';

/// This object represents the value and unit for an amount of currency.
class CurrencyAmount {
  /// The original numeric value for this CurrencyAmount.
  final int originalValue;

  /// The original unit of currency for this CurrencyAmount.
  final CurrencyUnit originalUnit;

  CurrencyAmount({required this.originalValue, required this.originalUnit});

  factory CurrencyAmount.fromJson(Map<String, dynamic> json) {
    return CurrencyAmount(
      originalValue: json['currency_amount_original_value'] as int,
      originalUnit: CurrencyUnit.values.firstWhere(
        (e) => e.value == json['currency_amount_original_unit'],
        orElse: () => CurrencyUnit.futureValue,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currency_amount_original_value': originalValue,
      'currency_amount_original_unit': originalUnit.name,
    };
  }

  /// if the currency is not bitcoin related, this will return -1
  int getValueInSatoshi() {
    switch (originalUnit) {
      case CurrencyUnit.bitcoin:
        return originalValue * 1_0000_0000;
      case CurrencyUnit.microbitcoin:
        return originalValue * 1_00;
      case CurrencyUnit.millibitcoin:
        return originalValue * 1_0_0000;
      case CurrencyUnit.millisatoshi:
        return (originalValue / 1000).ceil();
      case CurrencyUnit.nanobitcoin:
        return (originalValue / 10).ceil();
      case CurrencyUnit.satoshi:
        return originalValue;
      default:
        return -1;
    }
  }
}

const String FRAGMENT = '''
fragment CurrencyAmountFragment on CurrencyAmount {
    __typename
    currency_amount_original_value: original_value
    currency_amount_original_unit: original_unit
}
''';
