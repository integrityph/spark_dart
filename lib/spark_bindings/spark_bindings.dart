import 'dart:typed_data';

import 'package:blockchain_utils/hex/hex.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated_io.dart'
    as rust_io;
import 'package:secp256k1_ffi/secp256k1_ffi.dart';
import '../services/transfer.dart';
import '../spark_bindings/types.dart';
import '../src/rust/api/simple.dart' as rust_ffi;

// --- Type Definitions ---

class DummyTx {
  final Uint8List tx;
  final String txid;

  DummyTx({required this.tx, required this.txid});

  factory DummyTx.fromRust(rust_ffi.DummyTxResult rustResult) {
    return DummyTx(tx: rustResult.tx, txid: rustResult.txid);
  }
}

class WasmVerifiableSecretShare {
  final int threshold;
  final int index;
  final Uint8List share;
  final List<Uint8List> proofs;

  WasmVerifiableSecretShare({
    required this.threshold,
    required this.index,
    required this.share,
    required this.proofs,
  });
}

class AdaptorPair {
  final Uint8List adaptorSignature;
  final Uint8List adaptorPrivateKey;

  AdaptorPair({
    required this.adaptorSignature,
    required this.adaptorPrivateKey,
  });
}

class TransactionResult {
  final Uint8List tx;
  final Uint8List sighash;

  TransactionResult({required this.tx, required this.sighash});
}

class NodeTxPair {
  final TransactionResult cpfpTx;
  final TransactionResult directTx;

  NodeTxPair({required this.cpfpTx, required this.directTx});
}

class RefundTxTrio {
  final TransactionResult cpfpRefundTx;
  final TransactionResult? directRefundTx;
  final TransactionResult directFromCpfpRefundTx;

  RefundTxTrio({
    required this.cpfpRefundTx,
    this.directRefundTx,
    required this.directFromCpfpRefundTx,
  });
}

// --- The Abstract Base ---

abstract class SparkFrostBase {
  Future<Uint8List> signFrost(SignFrostBindingParams params);

  Future<Uint8List> aggregateFrost(AggregateFrostBindingParams params);

  Future<DummyTx> createDummyTx(String address, BigInt amountSats);

  Future<Uint8List> encryptEcies(Uint8List msg, Uint8List publicKey);

  Future<Uint8List> decryptEcies(Uint8List encryptedMsg, Uint8List privateKey);

  Future<AdaptorPair> generateAdaptorFromSignature(Uint8List signature);

  Future<Uint8List> generateSignatureFromExistingAdaptor(
    Uint8List signature,
    Uint8List adaptorPrivateKeyBytes,
  );

  Future<bool> validateAdaptorSignature(
    Uint8List pubkey,
    Uint8List hash,
    Uint8List signature,
    Uint8List adaptorPubkey,
  );

  Future<Uint8List> applyAdaptorToSignature(
    Uint8List pubkey,
    Uint8List hash,
    Uint8List signature,
    Uint8List adaptorPrivateKeyBytes,
  );

  Future<List<WasmVerifiableSecretShare>> splitSecretWithProofs(
    Uint8List secret,
    int threshold,
    int numShares,
  );

  Future<Uint8List> recoverSecret(List<WasmVerifiableSecretShare> shares);

  /// > **⚠️ IMPORTANT:** Index is not zero based. For index 0, use 1.
  Future<bool> validateShare(
    Uint8List share,
    int index,
    int threshold,
    List<Uint8List> proofs,
  );

  Future<NodeTxPair> constructNodeTxPair(
    Uint8List parentTx,
    int vout,
    String address,
    int sequence,
    int directSequence,
    BigInt feeSats,
  );

  Future<RefundTxTrio> constructRefundTxTrio(
    Uint8List cpfpNodeTx,
    Uint8List? directNodeTx,
    int vout,
    Uint8List receivingPubkey,
    String network,
    int sequence,
    int directSequence,
    BigInt feeSats,
  );

  Future<Uint8List> computeMultiInputSighash(
    Uint8List tx,
    int inputIndex,
    List<Uint8List> prevOutScripts,
    List<int> prevOutValues,
  );

  Future<Uint8List> getPublicKeyBytes(Uint8List privateKey);

  Future<List<Uint8List>> batchGetPublicKeyBytes(List<Uint8List> privateKeys);
}

// --- The Hollow Stub Implementation ---

class SparkFrostStub extends SparkFrostBase {
  SparkFrostStub();

  @override
  Future<Uint8List> signFrost(SignFrostBindingParams params) async {
    return await rust_ffi.signFrost(
      msg: params.message,
      keyPackageBytes: params.keyPackage.toProto().writeToBuffer(),
      nonceBytes: params.nonce.toProto().writeToBuffer(),
      selfCommitmentBytes: params.selfCommitment.toProto().writeToBuffer(),
      statechainCommitmentsBytes:
          params.statechainCommitments?.mapValues(
            (v) => v.toProto().writeToBuffer(),
          ) ??
          {},
      adaptorPublicKey: params.adaptorPubKey,
    );
  }

  @override
  Future<Uint8List> aggregateFrost(AggregateFrostBindingParams params) async {
    return await rust_ffi.aggregateFrost(
      msg: params.message,
      // Proto map -> map to buffers
      statechainCommitmentsBytes:
          params.statechainCommitments?.mapValues(
            (v) => v.toProto().writeToBuffer(),
          ) ??
          {},
      // Single proto -> buffer
      selfCommitmentBytes: params.selfCommitment.toProto().writeToBuffer(),

      // These four are already flat byte arrays or maps of byte arrays, pass them directly!
      statechainSignatures: params.statechainSignatures ?? {},
      selfSignature: params.selfSignature,
      statechainPublicKeys: params.statechainPublicKeys ?? {},
      selfPublicKey: params.selfPublicKey,
      verifyingKey: params.verifyingKey,
      adaptorPublicKey: params.adaptorPubKey,
    );
  }

  @override
  Future<DummyTx> createDummyTx(String address, BigInt amountSats) async {
    return DummyTx.fromRust(
      await rust_ffi.createDummyTx(address: address, amountSats: amountSats),
    );
  }

  @override
  Future<Uint8List> encryptEcies(Uint8List msg, Uint8List publicKey) async {
    return rust_ffi.encryptEcies(msg: msg, publicKeyBytes: publicKey);
  }

  @override
  Future<Uint8List> decryptEcies(
    Uint8List encryptedMsg,
    Uint8List privateKey,
  ) async {
    return rust_ffi.decryptEcies(
      encryptedMsg: encryptedMsg,
      privateKeyBytes: privateKey,
    );
  }

  @override
  Future<AdaptorPair> generateAdaptorFromSignature(Uint8List signature) async {
    final result = await rust_ffi.generateAdaptorFromSignature(
      signatureBytes: signature,
    );
    return AdaptorPair(
      adaptorSignature: result.part1,
      adaptorPrivateKey: result.part2,
    );
  }

  @override
  Future<Uint8List> generateSignatureFromExistingAdaptor(
    Uint8List signature,
    Uint8List adaptorPrivateKeyBytes,
  ) async {
    return await rust_ffi.generateSignatureFromExistingAdaptor(
      signatureBytes: signature,
      adaptorPrivateKeyBytes: adaptorPrivateKeyBytes,
    );
  }

  @override
  Future<bool> validateAdaptorSignature(
    Uint8List pubkey,
    Uint8List hash,
    Uint8List signature,
    Uint8List adaptorPubkey,
  ) async {
    try {
      await rust_ffi.validateAdaptorSignature(
        pubKey: pubkey,
        hash: hash,
        signature: signature,
        adaptorPubKey: adaptorPubkey,
      );
    } catch (e) {
      return false;
    }
    return true;
  }

  @override
  Future<Uint8List> applyAdaptorToSignature(
    Uint8List pubkey,
    Uint8List hash,
    Uint8List signature,
    Uint8List adaptorPrivateKeyBytes,
  ) {
    return rust_ffi.applyAdaptorToSignature(
      pubKey: pubkey,
      hash: hash,
      signature: signature,
      adaptorPrivateKey: adaptorPrivateKeyBytes,
    );
  }

  @override
  Future<List<WasmVerifiableSecretShare>> splitSecretWithProofs(
    Uint8List secret,
    int threshold,
    int numShares,
  ) async {
    final result = await rust_ffi.splitSecretWithProofs(
      secret: secret,
      threshold: BigInt.from(threshold),
      numShares: BigInt.from(numShares),
    );
    return result
        .map<WasmVerifiableSecretShare>(
          (v) => WasmVerifiableSecretShare(
            threshold: v.threshold.toInt(),
            index: v.index,
            share: v.share,
            proofs: v.proofs,
          ),
        )
        .toList();
  }

  @override
  Future<Uint8List> recoverSecret(List<WasmVerifiableSecretShare> shares) {
    final input = shares
        .map<rust_ffi.SecretShare>(
          (v) => rust_ffi.SecretShare(
            threshold: BigInt.from(v.threshold),
            index: v.index,
            share: v.share,
          ),
        )
        .toList();

    return rust_ffi.recoverSecret(shares: input);
  }

  @override
  Future<bool> validateShare(
    Uint8List share,
    int index,
    int threshold,
    List<Uint8List> proofs,
  ) async {
    try {
      await rust_ffi.validateShare(
        share: share,
        index: index,
        threshold: BigInt.from(threshold),
        proofs: proofs,
      );
    } catch (e) {
      return false;
    }
    return true;
  }

  @override
  Future<NodeTxPair> constructNodeTxPair(
    Uint8List parentTx,
    int vout,
    String address,
    int sequence,
    int directSequence,
    BigInt feeSats,
  ) async {
    final result = await rust_ffi.constructNodeTxPair(
      parentTxBytes: parentTx,
      vout: vout,
      address: address,
      sequence: sequence,
      directSequence: directSequence,
      feeSats: feeSats,
    );

    return NodeTxPair(
      cpfpTx: TransactionResult(
        tx: result.cpfp.txBytes,
        sighash: result.cpfp.sighash,
      ),
      directTx: TransactionResult(
        tx: result.direct.txBytes,
        sighash: result.direct.sighash,
      ),
    );
  }

  @override
  Future<RefundTxTrio> constructRefundTxTrio(
    Uint8List cpfpNodeTx,
    Uint8List? directNodeTx,
    int vout,
    Uint8List receivingPubkey,
    String network,
    int sequence,
    int directSequence,
    BigInt feeSats,
  ) async {
    final result = await rust_ffi.constructRefundTxTrio(
      cpfpNodeTxBytes: cpfpNodeTx,
      directNodeTxBytes: directNodeTx,
      vout: vout,
      receivingPubkey: receivingPubkey,
      network: network,
      sequence: sequence,
      directSequence: directSequence,
      feeSats: feeSats,
    );

    return RefundTxTrio(
      cpfpRefundTx: TransactionResult(
        tx: result.cpfpRefund.txBytes,
        sighash: result.cpfpRefund.sighash,
      ),
      directRefundTx: result.directRefund == null
          ? null
          : TransactionResult(
              tx: result.directRefund!.txBytes,
              sighash: result.directRefund!.sighash,
            ),
      directFromCpfpRefundTx: TransactionResult(
        tx: result.directFromCpfpRefund.txBytes,
        sighash: result.directFromCpfpRefund.sighash,
      ),
    );
  }

  @override
  Future<Uint8List> computeMultiInputSighash(
    Uint8List tx,
    int inputIndex,
    List<Uint8List> prevOutScripts,
    List<int> prevOutValues,
  ) async {
    return await rust_ffi.computeMultiInputSighash(
      txBytes: tx,
      inputIndex: inputIndex,
      prevOutScripts: prevOutScripts,
      prevOutValues: rust_io.Uint64List.fromList(prevOutValues),
    );
  }

  @override
  Future<Uint8List> getPublicKeyBytes(
    Uint8List privateKey, {
    bool compressed = true,
  }) async {
    return secp256k1FFI.privateKey.createPubKey(privateKey, isCompressed: compressed)!;
  }

  @override
  Future<List<Uint8List>> batchGetPublicKeyBytes(
    List<Uint8List> privateKeys, {
    bool compressed = true,
  }) async {
    return await Future.wait(
      privateKeys.map((v) => getPublicKeyBytes(v, compressed: compressed)),
    );
  }
}

// --- Singleton Manager ---

SparkFrostBase? _sparkFrost;

void setupSparkFrost() {
  // SparkFrost should only be set once from main entrypoints.
  if (_sparkFrost != null) return;
  _sparkFrost = SparkFrostStub();
}

SparkFrostBase getSparkFrost() {
  if (_sparkFrost == null) {
    throw Exception("sparkFrost is not set. Call setSparkFrostOnce() first.");
  }
  return _sparkFrost!;
}
