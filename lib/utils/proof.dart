import 'dart:convert';
import 'dart:typed_data';

import 'hashstructure.dart'; // Adjust path to wherever you ported hashstructure.ts

Uint8List proofOfPossessionMessageHashForDepositAddress(
  Uint8List userPubkey,
  Uint8List operatorPubkey,
  String depositAddress,
) {
  // Dart's utf8.encode returns a List<int>, so we wrap it in Uint8List
  final depositAddressBytes = Uint8List.fromList(utf8.encode(depositAddress));

  return newHasher(['spark', 'deposit', 'proof_of_possession'])
      .addBytes(userPubkey)
      .addBytes(operatorPubkey)
      .addBytes(depositAddressBytes)
      .hash();
}
