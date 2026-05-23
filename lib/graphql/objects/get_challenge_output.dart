// lib/graphql/objects/get_challenge_output.dart

class GetChallengeOutput {
  final String protectedChallenge;

  GetChallengeOutput({required this.protectedChallenge});

  factory GetChallengeOutput.fromJson(Map<String, dynamic> json) {
    return GetChallengeOutput(
      protectedChallenge:
          json['get_challenge_output_protected_challenge'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'get_challenge_output_protected_challenge': protectedChallenge};
  }
}

const String FRAGMENT = '''
fragment GetChallengeOutputFragment on GetChallengeOutput {
    __typename
    get_challenge_output_protected_challenge: protected_challenge
}
''';
