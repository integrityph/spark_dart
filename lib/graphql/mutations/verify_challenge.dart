// lib/graphql/mutations/verify_challenge.dart

import '../objects/verify_challenge_output.dart' as verify_challenge_output;

const String verifyChallengeMutation =
    '''
  mutation VerifyChallenge(
    \$protected_challenge: String!
    \$signature: String!
    \$identity_public_key: PublicKey!
    \$provider: Provider
  ) {
    verify_challenge(input: {
      protected_challenge: \$protected_challenge
      signature: \$signature
      identity_public_key: \$identity_public_key
      provider: \$provider
    }) {
      ...VerifyChallengeOutputFragment
    }
  }
    
  ${verify_challenge_output.FRAGMENT}
''';
