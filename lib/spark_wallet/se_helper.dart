import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:biometric_signature/biometric_signature.dart';
import 'package:convert/convert.dart';
import 'package:pointycastle/asn1/asn1_parser.dart';
import 'package:pointycastle/asn1/primitives/asn1_bit_string.dart';
import 'package:pointycastle/asn1/primitives/asn1_sequence.dart';
import 'package:pointycastle/export.dart' hide Padding, State;

class SEHelper {
  static final BiometricSignature _biometricSignature = BiometricSignature();
  static String? publicKey;

  static final publicKeyLength = 65;
  static final publicKeyPrefix = 0x04;
  static final nonceLength = 16;
  static final privateKeyLength = 32;

  static bool isKeysetEncrypted(List<({Uint8List chainCode, String path, Uint8List privateKey})>? keyset) {
    if (keyset == null) {
      return false;
    }

    bool isEncrypted = false;
        // This is the key that has the public encryption key and the nonce
    if (keyset[0].privateKey.length > publicKeyLength + nonceLength && keyset[0].privateKey[0] == publicKeyPrefix) {
      isEncrypted = true;
    }

    return isEncrypted;
  }

  static Future<void> decryptKeyset(List<({Uint8List chainCode, String path, Uint8List privateKey})> keyset) async {
    List<int> payload = [];
    for (final v in keyset){
      payload.addAll(v.privateKey);
    }
    final encryptedBase64 = base64Encode(payload);

    final result = await _biometricSignature.decrypt(
      payload: encryptedBase64,
      payloadFormat: PayloadFormat.base64,
      promptMessage: 'Unlock Spark Keys',
      config: DecryptConfig(
        allowDeviceCredentials: false,
      ),
    );

    if (result.code != BiometricError.success) {
      throw Exception("Unable to decrypt keyset. ${result.code}: ${result.error}");
    }

    // put thigs back in keyset
    final decryptedBytes = base64Decode(result.decryptedData!);
    print("decryptedBytes: (${decryptedBytes.length}) ${hex.encode(decryptedBytes)}");
    for (int i=0; i<keyset.length; i++) {
      keyset[i] = (
        privateKey: decryptedBytes.sublist(i*privateKeyLength, (i+1)*privateKeyLength),
        path: keyset[i].path,
        chainCode: keyset[i].chainCode,
      );
    }
  }

  static Future<List<({Uint8List chainCode, String path, Uint8List privateKey})>?> encryptKeyset(List<({Uint8List chainCode, String path, Uint8List privateKey})> keyset) async {
    final rawBytes = keyset.expand((v) => v.privateKey).toList();

    // Parse recipient's public key (handling both PEM and raw Base64 if needed)
    final publicKeyStr = await _getPublicKey();
    if (publicKeyStr == null) {
      return null;
    }
    // Note: _parseEcPublicKeyFromPem handles stripping headers
    final ecPublicKey = _parseEcPublicKeyFromPem(publicKeyStr);

    // Generate ephemeral keypair
    final ephemeralKeyPair = _generateEphemeralKeyPair(ecPublicKey.parameters!);
    final ephemeralPublic = ephemeralKeyPair.publicKey as ECPublicKey;
    final ephemeralPrivate = ephemeralKeyPair.privateKey as ECPrivateKey;

    // ECDH key agreement
    final agreement = ECDHBasicAgreement()..init(ephemeralPrivate);
    final sharedSecret = agreement.calculateAgreement(ecPublicKey);
    // final ecPublicKeyBytes = ecPublicKey.Q!.getEncoded();
    // final ephemeralPrivateBytes =  _bigIntToBytes(ephemeralPrivate.d!, 32);
    // final sharedSecret = secp256k1FFI.ecdh.deriveKey(ecPublicKeyBytes, ephemeralPrivateBytes, useSHA256: false);

    // Output: [EphemeralPubKey (Uncompressed 65)] || [Ciphertext + Tag]
    final isApple = Platform.isIOS || Platform.isMacOS;
    final ephemeralPubBytes = ephemeralPublic.Q!.getEncoded(
      false,
    ); // Uncompressed required

    // ECIES Parameters
    // Hypothesis: Apple Standard Mode uses Static Zero IV and binds EphemKey in SharedInfo.
    final sharedInfo = isApple ? ephemeralPubBytes : Uint8List(0);

    Uint8List gcmIv;
    Uint8List aesKey;
    final Uint8List aad;

    if (isApple) {
      // iOS Standard Mode Hypothesis
      // 1. IV is Static Zeros (16 bytes).
      // 2. KDF derives ONLY Key (16 bytes).
      final keySize = 16;
      aesKey = _kdfX963(sharedSecret, keySize, sharedInfo);
      gcmIv = Uint8List(16); // Zero IV
    } else {
      // Android Standard Mode (Derived IV)
      final keySize = 16;
      final ivSize = 12;
      final derived = _kdfX963(sharedSecret, keySize + ivSize, sharedInfo);
      aesKey = derived.sublist(0, keySize);
      gcmIv = derived.sublist(keySize, keySize + ivSize);
    }

    aad = Uint8List(0);

    // AES-GCM encryption
    final cipher = GCMBlockCipher(AESEngine());
    cipher.init(true, AEADParameters(KeyParameter(aesKey), 128, gcmIv, aad));
    final ciphertext = cipher.process(
      utf8.encode(base64Encode(rawBytes)),
    );

    // Construct Payload: [EphemKey] [Ciphertext]
    // Note: Android uses same payload structure
    final payloadParts = [ephemeralPubBytes, ciphertext];
    
    final encryptedBytes = Uint8List.fromList(payloadParts.expand((x) => x).toList());
    final encryptedKeyset = keyset.toList();

    print("encryptedBytes: (${encryptedBytes.length})");

    final prefixLength = publicKeyLength + nonceLength;
    final privateKeyLengthHex = 44;
    for (final (index, v) in keyset.indexed) {
      final privateKey = (index == 0)
        ? encryptedBytes.sublist(
          0,
          prefixLength + privateKeyLengthHex
        )
        : encryptedBytes.sublist(
          prefixLength + (privateKeyLengthHex * index),
          (index == keyset.length -1) 
            ? prefixLength + (privateKeyLengthHex * (index+1)) - 4
            : prefixLength + (privateKeyLengthHex * (index+1))
        );
      encryptedKeyset[index] = (
        privateKey: privateKey,
        path: v.path,
        chainCode: v.chainCode,
      );
    }

    return encryptedKeyset;
  }

  static Future<String?> _getPublicKey([KeyFormat keyFormat=KeyFormat.pem]) async {
    try {
      final info = await _biometricSignature.getKeyInfo(
        checkValidity: true,
        keyFormat: keyFormat,
      );

      if ((info.exists ?? false) && (info.decryptingPublicKey != null)) {
        return info.decryptingPublicKey!;
      }
      
      // Create new key
      return await _createNewKey();
    } catch (e) {
      throw Exception("Unable to get Public Key. ${e.toString()}");
    }
  }

  static Future<String> _createNewKey([KeyFormat keyFormat=KeyFormat.pem]) async {
    try {
      final result = await _biometricSignature.createKeys(
        keyFormat: keyFormat,
        promptMessage: 'Authenticate to create keys',
        config: CreateKeysConfig(
          useDeviceCredentials: false,
          signatureType: SignatureType.ecdsa,
          setInvalidatedByBiometricEnrollment: true,
          enforceBiometric: true,
          enableDecryption: true,
        ),
      );

      if (result.code == BiometricError.success) {
        return result.decryptingPublicKey!;
      } else {
        throw Exception('Error: ${result.code} - ${result.error}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static ECPublicKey _parseEcPublicKeyFromPem(String pem) {
    // Strip headers if present
    final rows = pem
        .split('\n')
        .where((l) => !l.startsWith('-----') && l.trim().isNotEmpty)
        .join('');
    final bytes = base64Decode(rows);
    final params = ECDomainParameters('secp256r1');
    Uint8List pubBytes;

    try {
      final parser = ASN1Parser(bytes);
      final topLevel = parser.nextObject();

      if (topLevel is ASN1Sequence) {
        // SPKI format (Android)
        final bitString = topLevel.elements![1] as ASN1BitString;
        pubBytes = Uint8List.fromList(bitString.stringValues!);
      } else {
        // iOS returns raw bytes (often parses as OctetString due to 0x04 tag)
        pubBytes = bytes;
      }
    } catch (_) {
      // Fallback to raw bytes just in case
      pubBytes = bytes;
    }

    final q = params.curve.decodePoint(pubBytes)!;
    return ECPublicKey(q, params);
  }

  static AsymmetricKeyPair<PublicKey, PrivateKey> _generateEphemeralKeyPair(
    ECDomainParameters params,
  ) {
    final generator = ECKeyGenerator();
    generator.init(
      ParametersWithRandom(ECKeyGeneratorParameters(params), _secureRandom()),
    );
    return generator.generateKeyPair();
  }

  static SecureRandom _secureRandom() {
    final rng = FortunaRandom();
    final seed = Uint8List(32);
    final random = Random.secure();
    for (var i = 0; i < 32; i++) {
      seed[i] = random.nextInt(256);
    }
    rng.seed(KeyParameter(seed));
    return rng;
  }

  static Uint8List _kdfX963(BigInt sharedSecret, int length, Uint8List sharedInfo) {
    final digest = SHA256Digest();
    final secretBytes = _bigIntToBytes(sharedSecret, 32);
    final result = Uint8List(length);
    var offset = 0;
    var counter = 1;

    while (offset < length) {
      digest.reset();
      digest.update(secretBytes, 0, secretBytes.length);
      digest.updateByte((counter >> 24) & 0xff);
      digest.updateByte((counter >> 16) & 0xff);
      digest.updateByte((counter >> 8) & 0xff);
      digest.updateByte(counter & 0xff);
      digest.update(sharedInfo, 0, sharedInfo.length);

      final hash = Uint8List(digest.digestSize);
      digest.doFinal(hash, 0);

      final toCopy = (length - offset).clamp(0, hash.length);
      result.setRange(offset, offset + toCopy, hash);
      offset += toCopy;
      counter++;
    }
    return result;
  }

  static Uint8List _bigIntToBytes(BigInt number, int length) {
    var hex = number.toRadixString(16);
    if (hex.length % 2 != 0) hex = '0$hex';

    final bytes = Uint8List(hex.length ~/ 2);
    for (var i = 0; i < bytes.length; i++) {
      bytes[i] = int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16);
    }

    if (bytes.length >= length) return bytes.sublist(bytes.length - length);

    final padded = Uint8List(length);
    padded.setRange(length - bytes.length, length, bytes);
    return padded;
  }

  static BigInt _bytesToBigIntBE(List<int> val) {
    BigInt result = BigInt.zero;

    for (final byte in val) {
      result = (result << 8) | BigInt.from(byte & 0xff);
    }

    return result;
  }
}