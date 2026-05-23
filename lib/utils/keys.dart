import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:pointycastle/ecc/curves/secp256k1.dart';
import 'package:pointycastle/pointycastle.dart';

import '../errors/spark_error.dart'; // Adjust path to your SparkValidationError

// Initialize the secp256k1 curve parameters globally for the file
final ECDomainParameters _secp256k1 = ECCurve_secp256k1();
final BigInt _n = BigInt.parse('FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141', radix: 16);

/// Helper to decode a BigInt from 32 bytes (Little/Big endian handling)
BigInt _decodeBigInt(Uint8List bytes) {
  return BigInt.parse(hex.encode(bytes), radix: 16);
}

/// Helper to encode a BigInt to exactly [length] bytes (Big Endian)
Uint8List _encodeBigInt(BigInt number, int length) {
  final hexString = number.toRadixString(16).padLeft(length * 2, '0');
  return Uint8List.fromList(hex.decode(hexString));
}

/// Helper to safely decode a secp256k1 point
ECPoint _decodePoint(Uint8List bytes, String field) {
  try {
    return _secp256k1.curve.decodePoint(bytes)!;
  } catch (error) {
    throw SparkValidationError(
      "Public key must be a valid compressed secp256k1 public key",
      context: {'field': field, 'error': error},
    );
  }
}

Uint8List parseCompressedPublicKeyHex(
  String publicKeyHex, {
  String field = "publicKey",
}) {
  Uint8List publicKey;
  try {
    publicKey = Uint8List.fromList(hex.decode(publicKeyHex));
  } catch (error) {
    throw SparkValidationError(
      "Public key must be a valid hex-encoded compressed secp256k1 public key",
      context: {'field': field, 'error': error},
    );
  }

  if (publicKey.length != 33) {
    throw SparkValidationError(
      "Public key must be 33 bytes",
      context: {'field': field, 'value': publicKey.length, 'expected': 33},
    );
  }

  // Just decoding the point acts as the validation that it lies on the curve
  _decodePoint(publicKey, field);

  return publicKey;
}

Uint8List addPublicKeys(Uint8List a, Uint8List b) {
  if (a.length != 33 || b.length != 33) {
    throw SparkValidationError(
      "Public keys must be 33 bytes",
      context: {
        'field': "publicKeys",
        'value': "a: ${a.length}, b: ${b.length}",
        'expected': 33,
      },
    );
  }

  final pubkeyA = _decodePoint(a, "publicKeys");
  final pubkeyB = _decodePoint(b, "publicKeys");

  // Point addition on the curve
  final sum = (pubkeyA + pubkeyB)!;
  return sum.getEncoded(true); // true = compressed (33 bytes)
}

Uint8List applyAdditiveTweakToPublicKey(Uint8List pubkey, Uint8List tweak) {
  if (pubkey.length != 33) {
    throw SparkValidationError(
      "Public key must be 33 bytes",
      context: {'field': "pubkey", 'value': pubkey.length, 'expected': 33},
    );
  }
  if (tweak.length != 32) {
    throw SparkValidationError(
      "Tweak must be 32 bytes",
      context: {'field': "tweak", 'value': tweak.length, 'expected': 32},
    );
  }

  final pubkeyPoint = _decodePoint(pubkey, "pubkey");

  // Convert tweak to scalar (big integer)
  final tweakScalar = _decodeBigInt(tweak);

  // Get public point of the tweak: G * tweakScalar
  final tweakPoint = (_secp256k1.G * tweakScalar)!;

  // Add the points
  final sum = (pubkeyPoint + tweakPoint)!;
  return sum.getEncoded(true);
}

Uint8List subtractPublicKeys(Uint8List a, Uint8List b) {
  if (a.length != 33 || b.length != 33) {
    throw SparkValidationError(
      "Public keys must be 33 bytes",
      context: {
        'field': "publicKeys",
        'value': "a: ${a.length}, b: ${b.length}",
        'expected': 33,
      },
    );
  }

  final pubkeyA = _decodePoint(a, "publicKeys");
  final pubkeyB = _decodePoint(b, "publicKeys");

  // Point subtraction
  final difference = (pubkeyA - pubkeyB)!;
  return difference.getEncoded(true);
}

Uint8List addPrivateKeys(Uint8List a, Uint8List b) {
  if (a.length != 32 || b.length != 32) {
    throw SparkValidationError(
      "Private keys must be 32 bytes",
      context: {
        'field': "privateKeys",
        'value': "a: ${a.length}, b: ${b.length}",
        'expected': 32,
      },
    );
  }

  // Convert private keys to scalars
  final privA = _decodeBigInt(a);
  final privB = _decodeBigInt(b);

  // Add the scalars and reduce modulo the curve order
  final sum = (privA + privB) % _n;

  // Convert back to 32 bytes
  return _encodeBigInt(sum, 32);
}

Uint8List subtractPrivateKeys(Uint8List a, Uint8List b) {
  if (a.length != 32 || b.length != 32) {
    throw SparkValidationError(
      "Private keys must be 32 bytes",
      context: {
        'field': "privateKeys",
        'value': "a: ${a.length}, b: ${b.length}",
        'expected': 32,
      },
    );
  }

  final privA = _decodeBigInt(a);
  final privB = _decodeBigInt(b);

  // (n - b + a) % n securely wraps the subtraction around the curve order
  final sum = (_n - privB + privA) % _n;

  return _encodeBigInt(sum, 32);
}

Uint8List sumOfPrivateKeys(List<Uint8List> keys) {
  if (keys.isEmpty) {
    throw SparkValidationError("Keys list cannot be empty");
  }

  return keys.reduce((sum, key) {
    if (key.length != 32) {
      throw SparkValidationError(
        "Private keys must be 32 bytes",
        context: {'field': "privateKey", 'value': key.length, 'expected': 32},
      );
    }
    return addPrivateKeys(sum, key);
  });
}

Uint8List lastKeyWithTarget(Uint8List target, List<Uint8List> keys) {
  if (target.length != 32) {
    throw SparkValidationError(
      "Target must be 32 bytes",
      context: {'field': "target", 'value': target.length, 'expected': 32},
    );
  }

  final sum = sumOfPrivateKeys(keys);
  return subtractPrivateKeys(target, sum);
}
