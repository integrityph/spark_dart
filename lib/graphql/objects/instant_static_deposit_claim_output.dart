// lib/graphql/objects/instant_static_deposit_claim_output.dart

class InstantStaticDepositClaimOutput {
  final String claimId;

  InstantStaticDepositClaimOutput({required this.claimId});

  factory InstantStaticDepositClaimOutput.fromJson(Map<String, dynamic> json) {
    return InstantStaticDepositClaimOutput(
      claimId: json['instant_claim_output_claim_id'] as String,
    );
  }
}

const String FRAGMENT = '''
fragment InstantStaticDepositClaimOutputFragment on CreateClaimInstantStaticDepositOutput {
  __typename
  instant_claim_output_claim_id: claim_id
}
''';
