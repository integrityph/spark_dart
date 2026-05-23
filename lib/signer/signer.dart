import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:bip32_key_derivation/bip32_key_derivation.dart';
import 'package:bitcoin_base/bitcoin_base.dart';
import 'package:blockchain_utils/blockchain_utils.dart' hide hex;
import 'package:collection/collection.dart';
import 'package:convert/convert.dart';
import 'package:boringssl_ffi/boringssl_ffi.dart' as bsll;
import 'package:secp256k1_ffi/secp256k1_ffi.dart';

import '../errors/spark_error.dart'; // SparkError, SparkValidationError
// import '../services/lightning.dart';
import '../spark_bindings/spark_bindings.dart'; // getSparkFrost
import '../spark_bindings/types.dart'; // AggregateFrostBindingParams, IKeyPackage, SignFrostBindingParams
import '../utils/keys.dart'; // subtractPrivateKeys
import '../utils/secret_sharing.dart'; // VerifiableSecretShare
import '../utils/signing.dart'
    hide
        SigningNonce,
        SigningCommitment; // getRandomSigningNonce, getSigningCommitmentFromNonce
import 'types.dart'; // KeyDerivationType, SigningCommitmentWithOptionalNonce, AggregateFrostParams, etc.
import '../utils/hex.dart'; // bytesToHex, hexToBytes

abstract class SparkKeysGenerator {
  Future<DerivedKeysResult> deriveKeysFromSeed(
    Uint8List? seed,
    int accountNumber,
    List<({Uint8List chainCode, String path, Uint8List privateKey})>? keyset
  );
}

class DerivedKeysResult {
  final KeyPair identityKey;
  final BIP32DerivationKey signingHDKey;
  final KeyPair depositKey;
  final BIP32DerivationKey staticDepositHDKey;
  final BIP32DerivationKey htlcPreimageHDKey;

  DerivedKeysResult({
    required this.identityKey,
    required this.signingHDKey,
    required this.depositKey,
    required this.staticDepositHDKey,
    required this.htlcPreimageHDKey,
  });
}

const int hardenedOffset = 0x80000000; // 2^31

class DefaultSparkKeysGenerator implements SparkKeysGenerator {
  @override
  Future<DerivedKeysResult> deriveKeysFromSeed(
    Uint8List? seed,
    int accountNumber,
    List<({Uint8List chainCode, String path, Uint8List privateKey})>? keyset
  ) async {
    final hdkey = BIP32DerivationKey.fromSeed(seedBytes: seed!, keyNetVersions: BIP32DerivationKey.defaultKeyNetVersion);

    // BIP32 in Dart typically exposes privateKey and publicKey directly
    if (hdkey.privateKey!.isEmpty) {
      throw SparkValidationError(
        "Failed to derive keys from seed",
        context: {'field': "hdkey", 'value': bytesToHex(seed)},
      );
    }

    final identityKey = hdkey.derivePath("m/8797555'/$accountNumber'/0'");
    final signingKey = hdkey.derivePath("m/8797555'/$accountNumber'/1'");
    final depositKey = hdkey.derivePath("m/8797555'/$accountNumber'/2'");
    final staticDepositKey = hdkey.derivePath("m/8797555'/$accountNumber'/3'");
    final htlcPreimageKey = hdkey.derivePath("m/8797555'/$accountNumber'/4'");

    if (identityKey!.privateKey!.isEmpty ||
        depositKey!.privateKey!.isEmpty ||
        signingKey!.privateKey!.isEmpty ||
        staticDepositKey!.privateKey!.isEmpty ||
        htlcPreimageKey!.privateKey!.isEmpty) {
      throw SparkValidationError(
        "Failed to derive all required keys from seed",
        context: {'field': "derivedKeys"},
      );
    }

    return DerivedKeysResult(
      identityKey: KeyPair(
        privateKey: Uint8List.fromList(identityKey.privateKey!),
        publicKey: Uint8List.fromList(identityKey.publicKey),
      ),
      signingHDKey: signingKey,
      depositKey: KeyPair(
        privateKey: Uint8List.fromList(depositKey.privateKey!),
        publicKey: Uint8List.fromList(depositKey.publicKey),
      ),
      staticDepositHDKey: staticDepositKey,
      htlcPreimageHDKey: htlcPreimageKey,
    );
  }
}

class DerivationPathKeysGenerator implements SparkKeysGenerator {
  final String derivationPathTemplate;

  DerivationPathKeysGenerator(this.derivationPathTemplate);

  @override
  Future<DerivedKeysResult> deriveKeysFromSeed(
    Uint8List? seed,
    int accountNumber,
    List<({Uint8List chainCode, String path, Uint8List privateKey})>? keyset
  ) async {
    final hdkey = BIP32DerivationKey.fromSeed(seedBytes: seed!, keyNetVersions: BIP32DerivationKey.defaultKeyNetVersion);

    if (hdkey.privateKey!.isEmpty) {
      throw SparkValidationError(
        "Failed to derive keys from seed",
        context: {'field': "hdkey", 'value': bytesToHex(seed)},
      );
    }

    final derivationPath = derivationPathTemplate.replaceAll(
      "?",
      accountNumber.toString(),
    );

    final identityKey = hdkey.derivePath(derivationPath);
    final signingKey = hdkey.derivePath("$derivationPath/1'");
    final depositKey = hdkey.derivePath("$derivationPath/2'");
    final staticDepositKey = hdkey.derivePath("$derivationPath/3'");
    final htlcPreimageKey = hdkey.derivePath("$derivationPath/4'");

    if (identityKey!.privateKey!.isEmpty ||
        signingKey!.privateKey!.isEmpty ||
        depositKey!.privateKey!.isEmpty ||
        staticDepositKey!.privateKey!.isEmpty ||
        htlcPreimageKey!.privateKey!.isEmpty) {
      throw SparkValidationError(
        "Failed to derive all required keys from seed",
        context: {'field': "derivedKeys"},
      );
    }

    return DerivedKeysResult(
      identityKey: KeyPair(
        privateKey: Uint8List.fromList(identityKey.privateKey!),
        publicKey: Uint8List.fromList(identityKey.publicKey),
      ),
      signingHDKey: signingKey,
      depositKey: KeyPair(
        privateKey: Uint8List.fromList(depositKey.privateKey!),
        publicKey: Uint8List.fromList(depositKey.publicKey),
      ),
      staticDepositHDKey: staticDepositKey,
      htlcPreimageHDKey: htlcPreimageKey,
    );
  }
}

class KeySetGenerator implements SparkKeysGenerator {
  @override
  Future<DerivedKeysResult> deriveKeysFromSeed(
    Uint8List? seed,
    int accountNumber,
    List<({Uint8List chainCode, String path, Uint8List privateKey})>? keyset
  ) async {

    final identityKey = _getKeys(keyset, "m/8797555'/$accountNumber'/0'");
    final signingKey = _getKeys(keyset, "m/8797555'/$accountNumber'/1'");
    final depositKey = _getKeys(keyset, "m/8797555'/$accountNumber'/2'");
    final staticDepositKey = _getKeys(keyset, "m/8797555'/$accountNumber'/3'");
    final htlcPreimageKey = _getKeys(keyset, "m/8797555'/$accountNumber'/4'");

    if (identityKey == null ||
        depositKey == null ||
        signingKey == null ||
        staticDepositKey == null ||
        htlcPreimageKey == null) {
      throw SparkValidationError(
        "Failed to derive all required keys from keyset",
        context: {'field': "derivedKeys"},
      );
    }

    return DerivedKeysResult(
      identityKey: KeyPair(
        privateKey: Uint8List.fromList(identityKey.privateKey!),
        publicKey: Uint8List.fromList(identityKey.publicKey),
      ),
      signingHDKey: signingKey,
      depositKey: KeyPair(
        privateKey: Uint8List.fromList(depositKey.privateKey!),
        publicKey: Uint8List.fromList(depositKey.publicKey),
      ),
      staticDepositHDKey: staticDepositKey,
      htlcPreimageHDKey: htlcPreimageKey,
    );
  }

  BIP32DerivationKey? _getKeys(
      List<({Uint8List chainCode, String path, Uint8List privateKey})>? keyset, 
      String path,
  ) {
    // 1. Guard against null keyset right away
    if (keyset == null) return null;

    try {
      // 2. find the matching record
      final keys = keyset.firstWhere((v) => v.path == path);
      
      final pathSegments = path.split("/");
      final lastSegment = pathSegments.last;
      
      final index = int.parse(lastSegment.replaceAll("'", ""));
      final isHardened = lastSegment.contains("'");
      
      // 3. Return the reconstructed key
      return BIP32DerivationKey(
        privateKey: keys.privateKey,
        chainCode: Bip32ChainCode(keys.chainCode),
        depth: Bip32Depth(pathSegments.length - 1), // Master node 'm' is depth 0
        index: Bip32KeyIndex(index + (isHardened ? 0x80000000 : 0)), 
      );
    } catch (e) {
      // This will catch the StateError if firstWhere finds nothing,
      // or any integer parsing errors from weird paths.
      return null;
    }
  }
}

abstract class SparkSigner {
  Future<Uint8List> getIdentityPublicKey();
  Future<Uint8List> getDepositSigningKey();
  Future<Uint8List> getStaticDepositSigningKey(int idx);
  Future<Uint8List> getStaticDepositSecretKey(int idx);

  Future<String> generateMnemonic();
  Future<Uint8List> mnemonicToSeed(String mnemonic);
  Future<Uint8List> signSchnorrWithIdentityKey(Uint8List message);
  Future<Uint8List> signFrost(SignFrostParams params);
  Future<Uint8List> aggregateFrost(AggregateFrostParams params);
  Future<Uint8List> decryptEcies(Uint8List ciphertext);
  Future<SigningCommitmentWithOptionalNonce> getRandomSigningCommitment();

  SigningNonce? getNonceForSelfCommitment(
    SigningCommitmentWithOptionalNonce selfCommitment,
  );

  Future<String> createSparkWalletFromSeed(
    dynamic seed, { // Uint8List | String
    int? accountNumber,
    List<({Uint8List chainCode, String path, Uint8List privateKey})>? keyset,
  });

  Future<Uint8List> getPublicKeyFromDerivation({KeyDerivation? keyDerivation});

  Future<Uint8List> subtractPrivateKeysGivenDerivationPaths(
    String first,
    String second,
  );

  Future<List<VerifiableSecretShare>>
  subtractAndSplitSecretWithProofsGivenDerivations({
    required KeyDerivation first,
    KeyDerivation? second,
    required BigInt curveOrder,
    required int threshold,
    required int numShares,
  });

  Future<SubtractSplitAndEncryptResult> subtractSplitAndEncrypt(
    SubtractSplitAndEncryptParams params,
  );

  Future<List<VerifiableSecretShare>> splitSecretWithProofs(
    SplitSecretWithProofsParams params,
  );

  Future<Uint8List> signMessageWithIdentityKey(
    Uint8List message, {
    bool compact = false,
  });

  Future<bool> validateMessageWithIdentityKey(
    Uint8List message,
    Uint8List signature,
  );

  void signTransactionIndex(
    BtcTransaction tx,
    int index,
    Uint8List publicKey, {
    BigInt? utxoAmount,
    Script? utxoScript,
    List<TxOutput>? prevOuts,
    TaprootLeaf? tapleafScript,
  });

  Future<Uint8List> htlcHMAC(String transferID);
}

class SparkSignerConstructorParams {
  final SparkKeysGenerator? sparkKeysGenerator;

  SparkSignerConstructorParams({this.sparkKeysGenerator});
}

class DefaultSparkSigner implements SparkSigner {
  KeyPair? _identityKey;
  BIP32DerivationKey? _signingKey;
  KeyPair? _depositKey;
  BIP32DerivationKey? _staticDepositKey;
  BIP32DerivationKey? _htlcPreimageKey;
  final SparkKeysGenerator keysGenerator;

  final Map<SigningCommitment, SigningNonce> _commitmentToNonceMap = {};

  DefaultSparkSigner({
    SparkKeysGenerator? sparkKeysGenerator,

  })
    : keysGenerator = sparkKeysGenerator ?? DefaultSparkKeysGenerator();

  Uint8List _deriveSigningKey(Uint8List hash) {
    if (_signingKey == null) {
      throw SparkValidationError(
        "Private key not initialized",
        context: {'field': "signingKey"},
      );
    }

    final data = ByteData.sublistView(hash);
    // Equivalent to view.getUint32(0, false)
    final amount =
        (data.getUint32(0, Endian.big) % hardenedOffset) + hardenedOffset;

    final derived = _signingKey!.childKey(Bip32KeyIndex(amount))!;
    final newPrivateKey = Uint8List.fromList(derived.privateKey!);

    if (newPrivateKey.isEmpty) {
      throw SparkValidationError(
        "Failed to recover signing key",
        context: {'field': "privateKey"},
      );
    }

    return newPrivateKey;
  }

  Future<Uint8List> _decryptEciesToPrivateKey(Uint8List ciphertext) async {
    if (_identityKey?.privateKey == null) {
      throw SparkError("identityKey not initialized");
    }
    final sparkFrost = getSparkFrost();
    final privateKey = sparkFrost.decryptEcies(
      ciphertext,
      Uint8List.fromList(_identityKey!.privateKey),
    );

    return privateKey;
  }

  Future<Uint8List> _getSigningPrivateKeyFromDerivation(
    KeyDerivation keyDerivation,
  ) async {
    return switch (keyDerivation) {
      LeafKeyDerivation(:final path) => _deriveSigningKey(
        bsll.sha256.hash(utf8.encode(path))!,
      ),

      DepositKeyDerivation() => (_depositKey?.privateKey==null) ? Uint8List(0) : _depositKey!.privateKey,

      StaticDepositKeyDerivation(:final path) => getStaticDepositSecretKey(
        path,
      ),

      EciesKeyDerivation(:final path) => _decryptEciesToPrivateKey(path),

      RandomKeyDerivation() => _generateRandomPrivateKey(),

      // If KeyDerivation is a sealed class, no no need for a default case
    };
  }

  Uint8List _generateRandomPrivateKey() {
    final privateKey = secp256k1FFI.privateKey.generate();

    return privateKey;
  }

  @override
  Future<Uint8List> signSchnorrWithIdentityKey(Uint8List message) async {
    if (_identityKey?.privateKey == null) {
      throw SparkValidationError(
        "Private key not set",
        context: {'field': "identityKey"},
      );
    }

    return signSchnorr(message, Uint8List.fromList(_identityKey!.privateKey));
  }

  Uint8List signSchnorr(Uint8List message32Bytes, Uint8List privateKey) {
    if (message32Bytes.length != 32) {
      throw ArgumentError('BIP340 strictly requires a 32-byte message (hash).');
    }
    final sig = secp256k1FFI.schnorr.sign(privateKey, message32Bytes);
    if (sig == null) {
      return Uint8List(0);
    }
    return sig;
  }

  @override
  Future<Uint8List> getIdentityPublicKey() async {
    if (_identityKey?.publicKey == null) {
      throw SparkValidationError(
        "Private key is not set",
        context: {'field': "identityKey"},
      );
    }
    return Uint8List.fromList(_identityKey!.publicKey);
  }

  @override
  Future<Uint8List> getDepositSigningKey() async {
    if (_depositKey?.publicKey == null) {
      throw SparkValidationError(
        "Deposit key is not set",
        context: {'field': "depositKey"},
      );
    }
    return Uint8List.fromList(_depositKey!.publicKey);
  }

  @override
  Future<Uint8List> getStaticDepositSigningKey(int idx) async {
    final staticDepositKey = await getStaticDepositSecretKey(idx);

    // 1. Load the raw bytes into a secp256k1 private key object
    final privateKey = ECPrivate.fromBytes(staticDepositKey);

    // 2. Derive the public key
    final publicKey = privateKey.getPublic();

    // 3. .toCompressedBytes() explicitly returns the 33-byte compressed
    // public key, perfectly matching the TS @noble/curves default!
    return Uint8List.fromList(publicKey.toBytes(mode: PubKeyModes.compressed));
  }

  @override
  Future<Uint8List> getStaticDepositSecretKey(int idx) async {
    if (_staticDepositKey == null) {
      throw SparkValidationError(
        "Static deposit key is not set",
        context: {'field': "staticDepositKey"},
      );
    }

    final derived = _staticDepositKey!.childKey(
      Bip32KeyIndex(hardenedOffset + idx),
    );
    final privateKey = Uint8List.fromList(Uint8List.fromList(derived!.privateKey!));

    if (privateKey.isEmpty) {
      throw SparkValidationError(
        "Static deposit key is not set",
        context: {'field': "staticDepositKey"},
      );
    }

    return privateKey;
  }

  @override
  Future<String> generateMnemonic() async {
    final rng = Random.secure();
    final mnemonicsObj = Bip39MnemonicGenerator().fromEntropy(
      List.generate(32, (_) => rng.nextInt(256)),
    );
    return mnemonicsObj.toStr();
  }

  @override
  Future<Uint8List> mnemonicToSeed(String mnemonic) async {
    final mnemonicsObj = Bip39Mnemonic.fromString(mnemonic);
    final seedGenerator = Bip39SeedGenerator(mnemonicsObj);
    return Uint8List.fromList(seedGenerator.generate());
  }

  @override
  Future<Uint8List> getPublicKeyFromDerivation({
    KeyDerivation? keyDerivation,
  }) async {
    if (keyDerivation == null) throw ArgumentError("keyDerivation required");
    final privateKey = await _getSigningPrivateKeyFromDerivation(keyDerivation);
    final privateKeyObj = ECPrivate.fromBytes(privateKey);

    // 2. Derive the public key
    final publicKey = privateKeyObj.getPublic();

    // 3. .toCompressedBytes() explicitly returns the 33-byte compressed
    // public key, perfectly matching the TS @noble/curves default!
    return Uint8List.fromList(publicKey.toBytes(mode: PubKeyModes.compressed));
  }

  @override
  Future<Uint8List> subtractPrivateKeysGivenDerivationPaths(
    String first,
    String second,
  ) async {
    final firstPrivateKey = _deriveSigningKey(
      Uint8List.fromList(bsll.sha256.hash(first.codeUnits)!),
    );
    final secondPrivateKey = _deriveSigningKey(
      Uint8List.fromList(bsll.sha256.hash(second.codeUnits)!),
    );

    final resultPrivKey = subtractPrivateKeys(
      firstPrivateKey,
      secondPrivateKey,
    );
    final privateKeyObj = ECPrivate.fromBytes(resultPrivKey);

    // 2. Derive the public key
    final publicKey = privateKeyObj.getPublic();

    // 3. .toCompressedBytes() explicitly returns the 33-byte compressed
    // public key, perfectly matching the TS @noble/curves default!
    return Uint8List.fromList(publicKey.toBytes(mode: PubKeyModes.compressed));
  }

  @override
  Future<List<VerifiableSecretShare>>
  subtractAndSplitSecretWithProofsGivenDerivations({
    required KeyDerivation first,
    KeyDerivation? second,
    required BigInt curveOrder,
    required int threshold,
    required int numShares,
  }) async {
    final firstPrivateKey = await _getSigningPrivateKeyFromDerivation(first);
    final secondPrivateKey = second != null
        ? await _getSigningPrivateKeyFromDerivation(second)
        : Uint8List(32); // Zeroed private key if second is missing

    final resultPrivKey = subtractPrivateKeys(
      firstPrivateKey,
      secondPrivateKey,
    );

    return await splitSecretWithProofs(
      SplitSecretWithProofsParams(
        secret: resultPrivKey,
        curveOrder: curveOrder,
        threshold: threshold,
        numShares: numShares,
      ),
    );
  }

  @override
  Future<SubtractSplitAndEncryptResult> subtractSplitAndEncrypt(
    SubtractSplitAndEncryptParams params,
  ) async {
    final firstPrivateKey = await _getSigningPrivateKeyFromDerivation(
      params.first,
    );
    final secondPrivateKey = await _getSigningPrivateKeyFromDerivation(
      params.second,
    );

    final resultPrivKey = subtractPrivateKeys(
      firstPrivateKey,
      secondPrivateKey,
    );

    final sparkFrost = getSparkFrost();
    final shares = await splitSecretWithProofs(
      SplitSecretWithProofsParams(
        secret: resultPrivKey,
        curveOrder: params.curveOrder,
        threshold: params.threshold,
        numShares: params.numShares,
      ),
    );

    final secretCipher = await sparkFrost.encryptEcies(
      secondPrivateKey,
      params.receiverPublicKey,
    );

    return SubtractSplitAndEncryptResult(
      shares: shares,
      secretCipher: secretCipher,
    );
  }

  @override
  Future<List<VerifiableSecretShare>> splitSecretWithProofs(
    SplitSecretWithProofsParams params,
  ) async {
    final sparkFrost = getSparkFrost();
    return sparkFrost.splitSecretWithProofs(
      params.secret,
      params.threshold,
      params.numShares,
    );
  }

  @override
  SigningNonce? getNonceForSelfCommitment(
    SigningCommitmentWithOptionalNonce selfCommitment,
  ) {
    return _commitmentToNonceMap[selfCommitment.commitment];
  }

  Future<SignFrostBindingParams> _buildSignFrostParams(
    SignFrostParams params,
  ) async {
    final signingPrivateKey = await _getSigningPrivateKeyFromDerivation(
      params.keyDerivation,
    );

    final nonce = getNonceForSelfCommitment(params.selfCommitment);
    if (nonce == null) {
      throw SparkValidationError(
        "Nonce not found for commitment",
        context: {'field': "nonce"},
      );
    }

    final keyPackage = IKeyPackage(
      secretKey: signingPrivateKey,
      publicKey: params.publicKey,
      verifyingKey: params.verifyingKey,
    );

    return SignFrostBindingParams(
      message: params.message,
      keyPackage: keyPackage,
      nonce: ISigningNonce(hiding: nonce.hiding, binding: nonce.binding),
      selfCommitment: ISigningCommitment(
        hiding: params.selfCommitment.commitment.hiding,
        binding: params.selfCommitment.commitment.binding,
      ),
      statechainCommitments: params.statechainCommitments,
      adaptorPubKey: params.adaptorPubKey,
    );
  }

  Future<AggregateFrostBindingParams> _buildAggregateFrostParams(
    AggregateFrostParams params,
  ) async {
    return AggregateFrostBindingParams(
      message: params.message,
      statechainSignatures: params.statechainSignatures,
      statechainPublicKeys: params.statechainPublicKeys,
      verifyingKey: params.verifyingKey,
      statechainCommitments: params.statechainCommitments,
      selfCommitment: ISigningCommitment(
        hiding: params.selfCommitment.commitment.hiding,
        binding: params.selfCommitment.commitment.binding,
      ),
      selfPublicKey: params.publicKey,
      selfSignature: params.selfSignature,
      adaptorPubKey: params.adaptorPubKey,
    );
  }

  @override
  Future<Uint8List> signFrost(SignFrostParams params) async {
    final bindingParams = await _buildSignFrostParams(params);
    final sparkFrost = getSparkFrost();
    return sparkFrost.signFrost(bindingParams);
  }

  @override
  Future<Uint8List> aggregateFrost(AggregateFrostParams params) async {
    final bindingParams = await _buildAggregateFrostParams(params);
    final sparkFrost = getSparkFrost();
    return sparkFrost.aggregateFrost(bindingParams);
  }

  @override
  Future<String> createSparkWalletFromSeed(
    dynamic seed, {
    int? accountNumber,
    List<({Uint8List chainCode, String path, Uint8List privateKey})>? keyset,
  }) async {
    Uint8List seedBytes;
    if (seed is String) {
      seedBytes = hexToBytes(seed);
    } else {
      seedBytes = seed as Uint8List;
    }

    final derived = await keysGenerator.deriveKeysFromSeed(
      seedBytes,
      accountNumber ?? 0,
      keyset,
    );

    _identityKey = derived.identityKey;
    _depositKey = derived.depositKey;
    _signingKey = derived.signingHDKey;
    _staticDepositKey = derived.staticDepositHDKey;
    _htlcPreimageKey = derived.htlcPreimageHDKey;

    return bytesToHex(_identityKey!.publicKey);
  }

  @override
  Future<Uint8List> signMessageWithIdentityKey(
    Uint8List message, {
    bool compact = false,
  }) async {
    if (_identityKey?.privateKey == null) {
      throw SparkError("Identity key not initialized", {
        'configKey': "identityKey",
      });
    }

    final signature = signSecp256k1(
      message,
      _identityKey!.privateKey,
      sigFormat: compact ? "compressed" : "DER",
    );

    return signature;
  }

  @override
  Future<Uint8List> decryptEcies(Uint8List ciphertext) async {
    if (_identityKey?.privateKey == null) {
      throw SparkError("identityKey not initialized");
    }
    final sparkFrost = getSparkFrost();
    final privateKey = await sparkFrost.decryptEcies(
      ciphertext,
      _identityKey!.privateKey,
    );
    final privateKeyObj = ECPrivate.fromBytes(privateKey);

    // 2. Derive the public key
    final publicKey = privateKeyObj.getPublic();

    // 3. .toCompressedBytes() explicitly returns the 33-byte compressed
    // public key, perfectly matching the TS @noble/curves default!
    return Uint8List.fromList(publicKey.toBytes(mode: PubKeyModes.compressed));
  }

  @override
  Future<SigningCommitmentWithOptionalNonce>
  getRandomSigningCommitment() async {
    final nonce = getRandomSigningNonce();
    final commitment = getSigningCommitmentFromNonce(nonce);
    final commitmentKey = SigningCommitment(
      binding: commitment.binding,
      hiding: commitment.hiding,
    );
    final nonceValue = SigningNonce(
      binding: nonce.binding,
      hiding: nonce.hiding,
    );
    _commitmentToNonceMap[commitmentKey] = nonceValue;
    return SigningCommitmentWithOptionalNonce(commitment: commitmentKey);
  }

  @override
  Future<bool> validateMessageWithIdentityKey(
    Uint8List message,
    Uint8List signature,
  ) async {
    if (_identityKey?.publicKey == null) {
      throw SparkError("identityKey not initialized");
    }
    return verifySecp256k1(signature, message, _identityKey!.publicKey);
  }

  bool verifySecp256k1(
    Uint8List signatureBytes,
    Uint8List message32Bytes,
    Uint8List publicKeyBytes,
  ) {
    if (message32Bytes.length != 32) {
      throw ArgumentError('Message must be exactly 32 bytes.');
    }

    return secp256k1FFI.ecdsa.verify(publicKeyBytes, message32Bytes, signatureBytes);
  }

  @override
  void signTransactionIndex(
    BtcTransaction tx,
    int index,
    Uint8List publicKey, {
    BigInt? utxoAmount,
    Script? utxoScript,
    List<TxOutput>? prevOuts,
    TaprootLeaf? tapleafScript,
  }) {
    Uint8List? privateKeyBytes;

    if (ListEquality().equals(
      publicKey,
      _identityKey?.publicKey ?? Uint8List(0),
    )) {
      privateKeyBytes = _identityKey?.privateKey;
    } else if (ListEquality().equals(
      publicKey,
      _depositKey?.publicKey ?? Uint8List(0),
    )) {
      privateKeyBytes = _depositKey?.privateKey;
    }

    if (privateKeyBytes == null) {
      throw SparkValidationError(
        "Private key not found for public key",
        context: {'field': "privateKey", 'value': hex.encode(publicKey)},
      );
    }

    final privateKey = ECPrivate.fromBytes(privateKeyBytes);

    // 1. Resolve the script to determine the cryptographic path
    final resolvedScript = utxoScript ?? prevOuts?[index].scriptPubKey;
    if (resolvedScript == null) {
      throw StateError(
        "UTXO script is required to determine the signing method.",
      );
    }

    final scriptHex = resolvedScript.toHex();

    // Taproot scripts (P2TR) are exactly 34 bytes (68 hex chars) and start with OP_1 (5120)
    final isTaproot = scriptHex.length == 68 && scriptHex.startsWith('5120');

    // 2. Pad the witnesses array if it hasn't been initialized to match inputs
    if (tx.witnesses.length <= index) {
      tx.witnesses.length = tx.inputs.length;
    }

    // 3. Branch based on Script Type
    if (isTaproot) {
      // ==========================================
      // TAPROOT (P2TR) + SCHNORR
      // ==========================================
      if (prevOuts == null) {
        throw StateError(
          "Taproot signing requires 'prevOuts' to calculate the BIP-341 digest.",
        );
      }

      // Map the TxOutputs into the distinct lists the library expects
      final scriptPubKeys = prevOuts.map((out) => out.scriptPubKey).toList();
      final amounts = prevOuts.map((out) => out.amount).toList();

      final trDigest = tx.getTransactionTaprootDigset(
        // Using the exact library spelling
        txIndex: index,
        scriptPubKeys: scriptPubKeys,
        amounts: amounts,
      );

      final signature = privateKey.signBip340(trDigest);

      // Key-path spend witness stack is strictly the signature
      tx.witnesses[index] = TxWitnessInput(stack: [signature]);
    } else {
      // ==========================================
      // SEGWIT (P2WPKH / P2WSH) + ECDSA
      // ==========================================
      final resolvedAmount = utxoAmount ?? prevOuts?[index].amount;
      if (resolvedAmount == null) {
        throw StateError("UTXO amount is required for SegWit ECDSA signing.");
      }

      final trDigest = tx.getTransactionSegwitDigit(
        txInIndex: index,
        script: resolvedScript,
        amount: resolvedAmount,
      );

      final signature = privateKey.signECDSA(trDigest);

      // Segwit witness stack requires both the signature and the public key
      tx.witnesses[index] = TxWitnessInput(
        stack: [signature, hex.encode(publicKey)],
      );
    }
  }

  // sigFormat = compressed | DER
  Uint8List signSecp256k1(
    Uint8List message32Bytes,
    Uint8List privateKeyBytes, {
    String sigFormat = "compressed",
  }) {
    if (message32Bytes.length != 32) {
      throw ArgumentError('Message must be exactly 32 bytes.');
    }

    return secp256k1FFI.ecdsa.sign(privateKeyBytes, message32Bytes, isDER: sigFormat=="DER")!;

  }

  @override
  Future<Uint8List> htlcHMAC(String transferID) async {
    if (_htlcPreimageKey?.privateKey == null) {
      throw SparkError("HTLC preimage key not initialized", {
        'configKey': "htlcPreimageKey",
      });
    }

    final hmacKey = Uint8List.fromList(_htlcPreimageKey!.privateKey!);
    // final hmacObj = Hmac(sha256, hmacKey);
    final hmac = bsll.hmac.hmacSHA256(transferID.codeUnits, hmacKey)!;
    return hmac;
  }
}

/// UnsafeStatelessSparkSigner is different from DefaultSparkSigner in that it does not store
/// nonces in internal state. UnsafeStatelessSparkSigner should only be used in a secure environment.
///
/// @extends DefaultSparkSigner
class UnsafeStatelessSparkSigner extends DefaultSparkSigner {
  UnsafeStatelessSparkSigner({super.sparkKeysGenerator});

  @override
  SigningNonce? getNonceForSelfCommitment(
    SigningCommitmentWithOptionalNonce selfCommitment,
  ) {
    return selfCommitment.nonce;
  }

  @override
  Future<SigningCommitmentWithOptionalNonce>
  getRandomSigningCommitment() async {
    // Assuming these utilities are available via crypto dependencies or utils
    final nonce = getRandomSigningNonce();
    final commitment = getSigningCommitmentFromNonce(nonce);

    return SigningCommitmentWithOptionalNonce(
      commitment: SigningCommitment(
        binding: commitment.binding,
        hiding: commitment.hiding,
      ),
      nonce: SigningNonce(binding: nonce.binding, hiding: nonce.hiding),
    );
  }
}
