// lib/utils/secret_sharing.dart

import 'dart:typed_data';

// Update this import to wherever you saved the SparkFrostBase and getSparkFrost definitions
import '../spark_bindings/spark_bindings.dart';

/// Type alias mimicking the TS export type
typedef VerifiableSecretShare = WasmVerifiableSecretShare;

Future<List<VerifiableSecretShare>> splitSecretWithProofs(
  Uint8List secret,
  int threshold,
  int numberOfShares,
) async {
  final sparkFrost = getSparkFrost();
  return sparkFrost.splitSecretWithProofs(secret, threshold, numberOfShares);
}

Future<Uint8List> recoverSecret(List<VerifiableSecretShare> shares) async {
  final sparkFrost = getSparkFrost();
  return sparkFrost.recoverSecret(shares);
}

Future<bool> validateShare(VerifiableSecretShare share) async {
  final sparkFrost = getSparkFrost();
  return sparkFrost.validateShare(
    share.share,
    share.index,
    share.threshold,
    share.proofs,
  );
}
