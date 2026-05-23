// lib/graphql/mutations/get_challenge.dart

import '../objects/get_challenge_output.dart' as get_challenge_output;

const String getChallengeMutation =
    '''
  mutation GetChallenge(
    \$public_key: PublicKey!
  ) {
    get_challenge(input: {
      public_key: \$public_key
    }) {
      ...GetChallengeOutputFragment
    }
  }
    
  ${get_challenge_output.FRAGMENT}
''';
