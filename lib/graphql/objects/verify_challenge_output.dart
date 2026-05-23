// lib/graphql/objects/verify_challenge_output.dart

class VerifyChallengeOutput {
  final String validUntil;
  final String sessionToken;

  VerifyChallengeOutput({required this.validUntil, required this.sessionToken});

  factory VerifyChallengeOutput.fromJson(Map<String, dynamic> json) {
    return VerifyChallengeOutput(
      validUntil: json['verify_challenge_output_valid_until'] as String,
      sessionToken: json['verify_challenge_output_session_token'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'verify_challenge_output_valid_until': validUntil,
      'verify_challenge_output_session_token': sessionToken,
    };
  }
}

const String FRAGMENT = '''
fragment VerifyChallengeOutputFragment on VerifyChallengeOutput {
    __typename
    verify_challenge_output_valid_until: valid_until
    verify_challenge_output_session_token: session_token
}
''';
