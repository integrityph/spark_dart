// lib/graphql/objects/claim_static_deposit_output.dart

class ClaimStaticDepositOutput {
  final String transferId;

  ClaimStaticDepositOutput({required this.transferId});

  factory ClaimStaticDepositOutput.fromJson(Map<String, dynamic> json) {
    return ClaimStaticDepositOutput(
      transferId: json['claim_static_deposit_output_transfer_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'claim_static_deposit_output_transfer_id': transferId};
  }
}

const String FRAGMENT = '''
fragment ClaimStaticDepositOutputFragment on ClaimStaticDepositOutput {
    __typename
    claim_static_deposit_output_transfer_id: transfer_id
}
''';
