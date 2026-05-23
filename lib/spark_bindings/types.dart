// lib/spark_bindings/types.dart

import 'dart:typed_data';

import '../src/proto/common.pb.dart';
import '../src/proto/frost.pb.dart';

class IKeyPackage {
  final Uint8List secretKey;
  final Uint8List publicKey;
  final Uint8List verifyingKey;

  IKeyPackage({
    required this.secretKey,
    required this.publicKey,
    required this.verifyingKey,
  });

  KeyPackage toProto() {
    final userFrostKey =
        "687da64d52a16c6fc792c6fc831ec1afa797a91f77549668a6b5421f12c1ac77";
    return KeyPackage(
      identifier: userFrostKey,
      secretShare: secretKey,
      publicShares: {userFrostKey: publicKey}.entries,
      publicKey: verifyingKey,
      minSigners: 1,
    );
  }
}

class ISigningNonce {
  final Uint8List hiding;
  final Uint8List binding;

  ISigningNonce({required this.hiding, required this.binding});

  SigningNonce toProto() {
    return SigningNonce(hiding: hiding, binding: binding);
  }
}

class ISigningCommitment {
  final Uint8List hiding;
  final Uint8List binding;

  ISigningCommitment({required this.hiding, required this.binding});

  SigningCommitment toProto() {
    return SigningCommitment(hiding: hiding, binding: binding);
  }
}

class DummyTx {
  final Uint8List tx;
  final String txid;

  DummyTx({required this.tx, required this.txid});
}

class SignFrostBindingParams {
  final Uint8List message;
  final IKeyPackage keyPackage;
  final ISigningNonce nonce;
  final ISigningCommitment selfCommitment;
  final Map<String, ISigningCommitment>? statechainCommitments;
  final Uint8List? adaptorPubKey;

  SignFrostBindingParams({
    required this.message,
    required this.keyPackage,
    required this.nonce,
    required this.selfCommitment,
    this.statechainCommitments,
    this.adaptorPubKey,
  });
}

class AggregateFrostBindingParams {
  final Uint8List message;
  final Map<String, Uint8List>? statechainSignatures;
  final Map<String, Uint8List>? statechainPublicKeys;
  final Uint8List verifyingKey;
  final Map<String, ISigningCommitment>? statechainCommitments;
  final ISigningCommitment selfCommitment;
  final Uint8List selfPublicKey;
  final Uint8List selfSignature;
  final Uint8List? adaptorPubKey;

  AggregateFrostBindingParams({
    required this.message,
    this.statechainSignatures,
    this.statechainPublicKeys,
    required this.verifyingKey,
    this.statechainCommitments,
    required this.selfCommitment,
    required this.selfPublicKey,
    required this.selfSignature,
    this.adaptorPubKey,
  });
}

class ConstructNodeTxParams {
  final Uint8List tx;
  final int vout;
  final String address;
  final int locktime;

  ConstructNodeTxParams({
    required this.tx,
    required this.vout,
    required this.address,
    required this.locktime,
  });
}
