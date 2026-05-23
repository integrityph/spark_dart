import 'dart:math';
import 'dart:typed_data';

import 'package:secp256k1_ffi/secp256k1_ffi.dart';

import '../errors/spark_error.dart';

class SigningNonce {
  final Uint8List binding;
  final Uint8List hiding;

  SigningNonce({required this.binding, required this.hiding});
}

class SigningCommitment {
  final Uint8List binding;
  final Uint8List hiding;

  SigningCommitment({required this.binding, required this.hiding});
}

/// Generates cryptographically secure random bytes
Uint8List _generateRandomPrivateKey() {
  final random = Random.secure();
  return Uint8List.fromList(List<int>.generate(32, (_) => random.nextInt(256)));
}

SigningNonce getRandomSigningNonce() {
  final binding = _generateRandomPrivateKey();
  final hiding = _generateRandomPrivateKey();
  return createSigningNonce(binding, hiding);
}

SigningNonce createSigningNonce(Uint8List binding, Uint8List hiding) {
  if (binding.length != 32 || hiding.length != 32) {
    throw SparkValidationError(
      "Invalid nonce length",
      context: {
        "field": "nonce",
        "value": "binding: ${binding.length}, hiding: ${hiding.length}",
        "expected": "Both binding and hiding should be 32 bytes",
      },
    );
  }

  return SigningNonce(binding: binding, hiding: hiding);
}

SigningCommitment getSigningCommitmentFromNonce(SigningNonce nonce) {

  final bindingPubKey = secp256k1FFI.privateKey.createPubKey(nonce.binding)!;
  final hidingPubKey = secp256k1FFI.privateKey.createPubKey(nonce.hiding)!;

  return SigningCommitment(
    binding: bindingPubKey,
    hiding: hidingPubKey,
  );
}

Uint8List encodeSigningNonceToBytes(SigningNonce nonce) {
  final builder = BytesBuilder(copy: false);
  builder.add(nonce.binding);
  builder.add(nonce.hiding);
  return builder.toBytes();
}

SigningNonce decodeBytesToSigningNonce(Uint8List bytes) {
  if (bytes.length != 64) {
    throw SparkValidationError(
      "Invalid nonce length",
      context: {
        "field": "bytes",
        "value": bytes.length,
        "expected": "64 bytes (32 bytes for binding + 32 bytes for hiding)",
      },
    );
  }

  return SigningNonce(
    // Note: Fixed the TS bug here. Binding is first, hiding is second.
    binding: bytes.sublist(0, 32),
    hiding: bytes.sublist(32, 64),
  );
}

SigningCommitment createSigningCommitment(Uint8List binding, Uint8List hiding) {
  if (binding.length != 33 || hiding.length != 33) {
    throw SparkValidationError(
      "Invalid nonce commitment length",
      context: {
        "field": "commitment",
        "value": "binding: ${binding.length}, hiding: ${hiding.length}",
        "expected":
            "Both binding and hiding should be 33 bytes (compressed public keys)",
      },
    );
  }
  return SigningCommitment(binding: binding, hiding: hiding);
}

Uint8List encodeSigningCommitmentToBytes(SigningCommitment commitment) {
  if (commitment.binding.length != 33 || commitment.hiding.length != 33) {
    throw SparkValidationError(
      "Invalid nonce commitment length",
      context: {
        "field": "commitment",
        "value":
            "binding: ${commitment.binding.length}, hiding: ${commitment.hiding.length}",
        "expected":
            "Both binding and hiding should be 33 bytes (compressed public keys)",
      },
    );
  }

  final builder = BytesBuilder(copy: false);
  builder.add(commitment.binding);
  builder.add(commitment.hiding);
  return builder.toBytes();
}

SigningCommitment decodeBytesToSigningCommitment(Uint8List bytes) {
  if (bytes.length != 66) {
    throw SparkValidationError(
      "Invalid nonce commitment length",
      context: {
        "field": "bytes",
        "value": bytes.length,
        "expected": "66 bytes (33 bytes for binding + 33 bytes for hiding)",
      },
    );
  }

  return SigningCommitment(
    // Note: Fixed the TS bug here too.
    binding: bytes.sublist(0, 33),
    hiding: bytes.sublist(33, 66),
  );
}
