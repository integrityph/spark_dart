// lib/graphql/objects/claim_static_deposit_request_type.dart

enum ClaimStaticDepositRequestType {
  /// This is an enum value that represents values that could be added in the future.
  /// Clients should support unknown values as more of them could be added without notice.
  futureValue('FUTURE_VALUE'),

  fixedAmount('FIXED_AMOUNT'),

  maxFee('MAX_FEE');

  final String value;
  const ClaimStaticDepositRequestType(this.value);
}
