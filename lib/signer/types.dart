// lib/signer/types.dart

import 'dart:typed_data';
import 'package:blockchain_utils/blockchain_utils.dart';

// Make sure to import these from your other files
import '../spark_bindings/types.dart';
import '../utils/secret_sharing.dart';
import '../src/proto/common.pb.dart' as common_pb; // Import the proto

class SigningNonce {
  final Uint8List binding;
  final Uint8List hiding;

  SigningNonce({required this.binding, required this.hiding});
}

class SigningCommitment {
  final Uint8List binding;
  final Uint8List hiding;

  SigningCommitment({required this.binding, required this.hiding});

  common_pb.SigningCommitment toProto() {
    return common_pb.SigningCommitment(binding: binding, hiding: hiding);
  }

  factory SigningCommitment.fromProto(common_pb.SigningCommitment proto) {
    return SigningCommitment(
      binding: Uint8List.fromList(proto.binding),
      hiding: Uint8List.fromList(proto.hiding),
    );
  }
}

class SigningCommitmentWithOptionalNonce {
  final SigningCommitment commitment;
  final SigningNonce? nonce;

  SigningCommitmentWithOptionalNonce({required this.commitment, this.nonce});
}

enum KeyDerivationType { leaf, deposit, staticDeposit, ecies, random }

// --- Dart 3 Sealed Classes (Mimicking TS Discriminated Unions) ---

sealed class KeyDerivation {
  KeyDerivationType get type;
}

class LeafKeyDerivation extends KeyDerivation {
  @override
  KeyDerivationType get type => KeyDerivationType.leaf;
  final String path;

  LeafKeyDerivation({required this.path});
}

class DepositKeyDerivation extends KeyDerivation {
  @override
  KeyDerivationType get type => KeyDerivationType.deposit;
}

class RandomKeyDerivation extends KeyDerivation {
  @override
  KeyDerivationType get type => KeyDerivationType.random;
}

class StaticDepositKeyDerivation extends KeyDerivation {
  @override
  KeyDerivationType get type => KeyDerivationType.staticDeposit;
  final int path;

  StaticDepositKeyDerivation({required this.path});
}

class EciesKeyDerivation extends KeyDerivation {
  @override
  KeyDerivationType get type => KeyDerivationType.ecies;
  final Uint8List path;

  EciesKeyDerivation({required this.path});
}

// -----------------------------------------------------------------

class SignFrostParams {
  final Uint8List message;
  final KeyDerivation keyDerivation;
  final Uint8List publicKey;
  final Uint8List verifyingKey;
  final SigningCommitmentWithOptionalNonce selfCommitment;
  final Map<String, ISigningCommitment>? statechainCommitments;
  final Uint8List? adaptorPubKey;

  SignFrostParams({
    required this.message,
    required this.keyDerivation,
    required this.publicKey,
    required this.verifyingKey,
    required this.selfCommitment,
    this.statechainCommitments,
    this.adaptorPubKey,
  });
}

// Flattening TS `Omit<SignFrostParams, "keyDerivation">`
class AggregateFrostParams {
  final Uint8List message;
  final Uint8List publicKey;
  final Uint8List verifyingKey;
  final SigningCommitmentWithOptionalNonce selfCommitment;
  final Map<String, ISigningCommitment>? statechainCommitments;
  final Uint8List? adaptorPubKey;

  final Uint8List selfSignature;
  final Map<String, Uint8List>? statechainSignatures;
  final Map<String, Uint8List>? statechainPublicKeys;

  AggregateFrostParams({
    required this.message,
    required this.publicKey,
    required this.verifyingKey,
    required this.selfCommitment,
    this.statechainCommitments,
    this.adaptorPubKey,
    required this.selfSignature,
    this.statechainSignatures,
    this.statechainPublicKeys,
  });
}

class SplitSecretWithProofsParams {
  final Uint8List secret;
  final BigInt curveOrder;
  final int threshold;
  final int numShares;

  SplitSecretWithProofsParams({
    required this.secret,
    required this.curveOrder,
    required this.threshold,
    required this.numShares,
  });
}

class DerivedHDKey {
  final Bip32Slip10Secp256k1 hdKey;
  final Uint8List privateKey;
  final Uint8List publicKey;

  DerivedHDKey({
    required this.hdKey,
    required this.privateKey,
    required this.publicKey,
  });
}

class KeyPair {
  final Uint8List privateKey;
  final Uint8List publicKey;

  KeyPair({required this.privateKey, required this.publicKey});
}

// Flattening TS `Omit<SplitSecretWithProofsParams, "secret">`
class SubtractSplitAndEncryptParams {
  final BigInt curveOrder;
  final int threshold;
  final int numShares;

  final KeyDerivation first;
  final KeyDerivation second;
  final Uint8List receiverPublicKey;

  SubtractSplitAndEncryptParams({
    required this.curveOrder,
    required this.threshold,
    required this.numShares,
    required this.first,
    required this.second,
    required this.receiverPublicKey,
  });
}

class SubtractSplitAndEncryptResult {
  final List<VerifiableSecretShare> shares;
  final Uint8List secretCipher;

  SubtractSplitAndEncryptResult({
    required this.shares,
    required this.secretCipher,
  });
}
