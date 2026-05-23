import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:pointycastle/export.dart' hide PrivateKey;
import 'package:pointycastle/pointycastle.dart' hide PrivateKey;
import 'dart:async';
import 'dart:io'; // For zlib compression
import 'package:http/http.dart' as http;
import 'package:graphql/client.dart';
import 'package:boringssl_ffi/boringssl_ffi.dart' as bssl;
import 'package:secp256k1_ffi/secp256k1_ffi.dart';

export '../utils/hex.dart' show bytesToHex, hexToBytes;

/// Always false in Flutter/Dart natively
const bool isNode = false;

/// Always false in Flutter/Dart natively
const bool isBare = false;

bool isError(dynamic e) {
  return e is Error || e is Exception;
}

// lib/utils/logger.dart

enum LoggingLevel { trace, debug, info, warn, error }

LoggingLevel getLoggingLevelFromName(String name) {
  final upper = name.toUpperCase();
  final lower = name.toLowerCase();
  final title = name.isEmpty
      ? ""
      : "${lower[0].toUpperCase()}${lower.substring(1)}";

  // Runtime guard to match the exported type: support UPPER, lower, and Title case.
  if (name != upper && name != lower && name != title) {
    throw ArgumentError(
      "Invalid LoggingLevelName casing (expected UPPER, lower, or Title): $name",
    );
  }

  switch (upper) {
    case "TRACE":
      return LoggingLevel.trace;
    case "DEBUG":
      return LoggingLevel.debug;
    case "INFO":
      return LoggingLevel.info;
    case "WARN":
      return LoggingLevel.warn;
    case "ERROR":
      return LoggingLevel.error;
    default:
      // Should be unreachable when callers use correct strings, but keep a guard.
      throw ArgumentError("Invalid LoggingLevelName: $name");
  }
}

class LoggerOptions {
  bool enabled;
  bool timestamps;
  LoggingLevel level;

  LoggerOptions({
    required this.enabled,
    required this.timestamps,
    required this.level,
  });
}

class LoggerOptionsArg {
  final bool? enabled;
  final bool? timestamps;

  /// Accepts either [LoggingLevel] or [String].
  final dynamic level;

  LoggerOptionsArg({this.enabled, this.timestamps, this.level});
}

// Environmental flags that would normally be set via --dart-define
const bool isTest = bool.fromEnvironment('IS_TEST', defaultValue: false);
const bool isBrowser = bool.fromEnvironment(
  'dart.library.html',
  defaultValue: false,
);

class Logger {
  String context;
  LoggerOptions options = LoggerOptions(
    enabled: false,
    timestamps: true,
    level: LoggingLevel.info,
  );

  Logger(this.context, [LoggerOptionsArg? loggerOptions]) {
    final opts = loggerOptions ?? LoggerOptionsArg();
    setOptions(opts);
    updateLoggingEnabled(opts);
  }

  void setLevel(LoggingLevel level) {
    options.level = level;
  }

  void setEnabled(bool enabled, [LoggingLevel level = LoggingLevel.info]) {
    options.enabled = enabled;
    options.level = level;
  }

  void setOptions(LoggerOptionsArg opts) {
    if (opts.enabled != null) {
      options.enabled = opts.enabled!;
    }
    if (opts.timestamps != null) {
      options.timestamps = opts.timestamps!;
    }
    if (opts.level != null) {
      options.level = opts.level is String
          ? getLoggingLevelFromName(opts.level as String)
          : opts.level as LoggingLevel;
    }
  }

  void updateLoggingEnabled(LoggerOptionsArg loggerOptions) {
    if (loggerOptions.enabled != null) {
      options.enabled = loggerOptions.enabled!;
    } else if (isTest) {
      options.enabled = true;
    } else if (isBrowser) {
      try {
        // Stubbed: Flutter Web uses shared_preferences rather than direct local storage.
        // options.enabled = getLocalStorageConfigItem(ConfigKeys.LoggingEnabled);
      } catch (_) {
        /* ignore */
      }
    }

    if (options.enabled) {
      print(formatMessage("Logging enabled"));
    }
  }

  String getTimestamp() {
    if (options.timestamps) {
      return "${DateTime.now().toUtc().toIso8601String()} ";
    }
    return "";
  }

  String formatMessage(String message) {
    return "${getTimestamp()}[$context] $message";
  }

  void _logOut(String message, List<dynamic> rest) {
    final restStr = rest.isEmpty
        ? ""
        : " ${rest.map((e) => e.toString()).join(" ")}";
    print(formatMessage(message) + restStr);
  }

  void trace(String message, [List<dynamic> rest = const []]) {
    if (options.enabled && options.level.index <= LoggingLevel.trace.index) {
      _logOut(message, rest);
    }
  }

  void debug(String message, [List<dynamic> rest = const []]) {
    if (options.enabled && options.level.index <= LoggingLevel.debug.index) {
      _logOut(message, rest);
    }
  }

  void info(String message, [List<dynamic> rest = const []]) {
    if (options.enabled && options.level.index <= LoggingLevel.info.index) {
      _logOut(message, rest);
    }
  }

  void warn(String message, [List<dynamic> rest = const []]) {
    if (options.enabled && options.level.index <= LoggingLevel.warn.index) {
      _logOut(
        "[WARN] $message",
        rest,
      ); // Prefixed since Dart print() is uniform
    }
  }

  void error(String message, [List<dynamic> rest = const []]) {
    if (options.enabled && options.level.index <= LoggingLevel.error.index) {
      _logOut(
        "[ERROR] $message",
        rest,
      ); // Prefixed since Dart print() is uniform
    }
  }
}

class LightsparkException implements Exception {
  final String code;
  final String message;
  final Map<String, dynamic>? extraInfo;

  LightsparkException(this.code, this.message, [this.extraInfo]);

  @override
  String toString() {
    if (extraInfo != null && extraInfo!.isNotEmpty) {
      return 'LightsparkException($code): $message, extraInfo: $extraInfo';
    }
    return 'LightsparkException($code): $message';
  }
}

typedef Headers = Map<String, String>;
typedef WsConnectionParams = Map<String, dynamic>;

abstract class AuthProvider {
  Future<Headers> addAuthHeaders(Headers headers);

  Future<bool> isAuthorized();

  Future<WsConnectionParams> addWsConnectionParams(WsConnectionParams params);
}

// Assuming LightsparkException is in the same file or imported
// import 'lightspark_exception.dart';

class LightsparkSigningException extends LightsparkException {
  LightsparkSigningException(String message, [Map<String, dynamic>? extraInfo])
    : super('LightsparkSigningException', message, extraInfo);
}

class GeneratedKeyPair {
  // Using dynamic to represent the platform-specific CryptoKey or a String alias
  final dynamic publicKey;
  final dynamic privateKey;
  final String? keyAlias;

  GeneratedKeyPair({
    required this.publicKey,
    required this.privateKey,
    this.keyAlias,
  });
}

abstract class CryptoInterface {
  Future<Uint8List?> decryptSecretWithNodePassword(
    String cipher,
    String encryptedSecret,
    String nodePassword,
  );

  Future<GeneratedKeyPair> generateSigningKeyPair();

  // Future<Uint8List> serializeSigningKey(
  //   dynamic key,
  //   String format, // "pkcs8" | "spki"
  // );

  Future<BigInt> getNonce();

  Future<Uint8List> sign(dynamic keyOrAlias, Uint8List data);

  Future<dynamic> importPrivateSigningKey(Uint8List keyData);
}

/// A stubbed implementation of Lightspark's DefaultCrypto.
///
/// The heavy cryptographic methods (RSA-PSS, AES-GCM, PBKDF2) are stubbed
/// to avoid bringing in the `pointycastle` package for proprietary Lightspark
/// backend logic that isn't needed for the core Spark protocol.
class DefaultCrypto implements CryptoInterface {
  /// Secure Random Generator Helper for PointyCastle
  // Random _getSecureRandom() {
  //   final random = Random.secure();
  //   return random;
  // }

  @override
  Future<Uint8List?> decryptSecretWithNodePassword(
    String cipherConfig,
    String encryptedSecret,
    String nodePassword,
  ) async {
    try {
      Uint8List decoded = base64.decode(encryptedSecret);
      int version;
      int iterations;
      int? lsv;

      if (cipherConfig == "AES_256_CBC_PBKDF2_5000_SHA256") {
        version = 0;
        iterations = 5000;
        decoded = decoded.sublist(8); // Strip "Salted__" prefix
      } else {
        final header = jsonDecode(cipherConfig);
        version = header['v'] as int;
        iterations = header['i'] as int;
        lsv = header['lsv'] as int?;
      }

      if (version < 0 || version > 4) {
        throw LightsparkException(
          "DecryptionError",
          "Unknown version $version",
        );
      }

      final isCBC = version < 2;
      final bitLen = version < 4 ? 384 : 352;
      final saltLen = version < 4 ? 8 : 16;
      final desiredKeyLength =
          bitLen ~/ 8; // 48 bytes (32 key + 16 IV) or 44 bytes

      // PBKDF2 Key Derivation
      
      // final derivator = PBKDF2KeyDerivator(HMac(SHA256Digest(), 64));

      Uint8List salt;
      Uint8List nonceOrIv;
      Uint8List cipherText;

      if (lsv == 2 || version == 3) {
        salt = decoded.sublist(decoded.length - 8);
        nonceOrIv = decoded.sublist(0, 12);
        cipherText = decoded.sublist(12, decoded.length - 8);

        // derivator.init(
        //   Pbkdf2Parameters(salt, iterations, 32),
        // ); // Only need 32 bytes for key
        // final key = derivator.process(utf8.encode(nodePassword));
        final key = bssl.pbkdf2HMAC.deriveKeySHA256(utf8.encode(nodePassword), salt, iterations, 32);

        // AES-GCM Decrypt
        // final cipher = GCMBlockCipher(AESEngine());
        // cipher.init(
        //   false,
        //   AEADParameters(KeyParameter(key), 128, nonceOrIv, Uint8List(0)),
        // );
        // return cipher.process(cipherText);
        return bssl.aead.openAES_GCM(cipherText, Uint8List(0), key!, nonceOrIv)!;
      } else {
        salt = decoded.sublist(0, saltLen);
        final encrypted = decoded.sublist(saltLen);

        // derivator.init(Pbkdf2Parameters(salt, iterations, desiredKeyLength));
        // final derived = derivator.process(utf8.encode(nodePassword));
        final derived = bssl.pbkdf2HMAC.deriveKeySHA256(utf8.encode(nodePassword), salt, iterations, desiredKeyLength)!;

        final key = derived.sublist(0, 32);
        nonceOrIv = derived.sublist(32); // IV

        if (isCBC) {
          // AES-CBC Decrypt with PKCS7 Padding
          // final cipher = PaddedBlockCipherImpl(
          //   PKCS7Padding(),
          //   CBCBlockCipher(AESEngine()),
          // );
          // cipher.init(
          //   false,
          //   PaddedBlockCipherParameters(
          //     ParametersWithIV(KeyParameter(key), nonceOrIv),
          //     null,
          //   ),
          // );
          // return cipher.process(encrypted);
          return bssl.aes.cbc.decrypt(encrypted, key, nonceOrIv, enablePadding:true);
        } else {
          // AES-GCM Decrypt
          // final cipher = GCMBlockCipher(AESEngine());
          // cipher.init(
          //   false,
          //   AEADParameters(KeyParameter(key), 128, nonceOrIv, Uint8List(0)),
          // );
          // return cipher.process(encrypted);
          return bssl.aead.openAES_GCM(encrypted, Uint8List(0), key, nonceOrIv)!;
        }
      }
    } catch (ex) {
      print("Decryption failed: $ex");
      return null;
    }
  }

  @override
  Future<GeneratedKeyPair> generateSigningKeyPair() async {
    // final keyGen = RSAKeyGenerator()
    //   ..init(
    //     ParametersWithRandom(
    //       RSAKeyGeneratorParameters(BigInt.parse('65537'), 4096, 64),
    //       _getSecureRandom(),
    //     ),
    //   );

    // final pair = keyGen.generateKeyPair();
    final pair = bssl.rsa.generateKeySet(4096)!;

    return GeneratedKeyPair(
      publicKey: pair.publicKey,
      privateKey: pair.privateKey,
    );
  }

  @override
  Future<Uint8List> sign(dynamic keyOrAlias, Uint8List data) async {
    if (keyOrAlias is String) {
      throw LightsparkSigningException(
        "Key alias not supported for default crypto.",
      );
    }

    if (keyOrAlias is! Uint8List) {
      throw LightsparkSigningException(
        "Invalid private key format. Expected RSAPrivateKey.",
      );
    }

    // RSA-PSS with SHA-256 and salt length 32
    // final signer = PSSSigner(RSAEngine(), SHA256Digest(), SHA256Digest());

    // // In PointyCastle, PSS init takes a ParametersWithRandom
    // signer.init(
    //   true,
    //   ParametersWithRandom(
    //     PrivateKeyParameter<RSAPrivateKey>(keyOrAlias),
    //     _getSecureRandom(),
    //   ),
    // );

    // final signature = signer.generateSignature(data);
    // return signature.bytes;
    final digest = bssl.sha256.hash(data)!;
    return bssl.rsa.signSHA256DigestPKCS1_PSS(keyOrAlias, digest)!;
  }

  // @override
  // Future<Uint8List> serializeSigningKey(dynamic key, String format) async {
  //   // Note: To keep this compact, we use PointyCastle's ASN1 encoders.
  //   // If you need strict PKCS8/SPKI PEM headers, you can wrap the resulting bytes in Base64
  //   // with "-----BEGIN PRIVATE KEY-----" etc.
  //   if (format == "pkcs8" && key is Uint8List) {
  //     final topLevelSeq = ASN1Sequence();
  //     topLevelSeq.add(ASN1Integer(BigInt.zero)); // Version 0

  //     final algorithmSeq = ASN1Sequence();
  //     algorithmSeq.add(
  //       ASN1ObjectIdentifier([1, 2, 840, 113549, 1, 1, 1]),
  //     ); // rsaEncryption OID
  //     algorithmSeq.add(ASN1Null());
  //     topLevelSeq.add(algorithmSeq);

  //     final privateKeySeq = ASN1Sequence();
  //     privateKeySeq.add(ASN1Integer(BigInt.zero)); // Version 0
  //     privateKeySeq.add(ASN1Integer(key.modulus!));
  //     privateKeySeq.add(ASN1Integer(key.publicExponent!));
  //     privateKeySeq.add(ASN1Integer(key.privateExponent!));
  //     privateKeySeq.add(ASN1Integer(key.p!));
  //     privateKeySeq.add(ASN1Integer(key.q!));

  //     // Calculate D mod (P-1) and D mod (Q-1) and Q^-1 mod P
  //     final dP = key.privateExponent! % (key.p! - BigInt.one);
  //     final dQ = key.privateExponent! % (key.q! - BigInt.one);
  //     final qInv = key.q!.modInverse(key.p!);

  //     privateKeySeq.add(ASN1Integer(dP));
  //     privateKeySeq.add(ASN1Integer(dQ));
  //     privateKeySeq.add(ASN1Integer(qInv));

  //     topLevelSeq.add(ASN1OctetString(octets: privateKeySeq.encode()));
  //     return topLevelSeq.encode();
  //   } else if (format == "spki" && key is RSAPublicKey) {
  //     final topLevelSeq = ASN1Sequence();

  //     final algorithmSeq = ASN1Sequence();
  //     algorithmSeq.add(
  //       ASN1ObjectIdentifier([1, 2, 840, 113549, 1, 1, 1]),
  //     ); // rsaEncryption OID
  //     algorithmSeq.add(ASN1Null());
  //     topLevelSeq.add(algorithmSeq);

  //     final publicKeySeq = ASN1Sequence();
  //     publicKeySeq.add(ASN1Integer(key.modulus!));
  //     publicKeySeq.add(ASN1Integer(key.exponent!));

  //     topLevelSeq.add(ASN1BitString(stringValues: publicKeySeq.encode()));
  //     return topLevelSeq.encode();
  //   }
  //   throw UnimplementedError(
  //     "Unsupported format or key type for serialization",
  //   );
  // }

  @override
  Future<BigInt> getNonce() async {
    final random = Random.secure();
    // Generate a secure 64-bit nonce
    final upper = BigInt.from(random.nextInt(0xFFFFFFFF));
    final lower = BigInt.from(random.nextInt(0xFFFFFFFF));
    return (upper << 32) | lower;
  }

  @override
  Future<dynamic> importPrivateSigningKey(Uint8List keyData) async {
    // Basic PKCS8 ASN.1 Parser
    final parser = ASN1Parser(keyData);
    final topLevelSeq = parser.nextObject() as ASN1Sequence;

    // index 0: version
    // index 1: algorithm
    // index 2: private key (octet string)
    final privateKeyOctet = topLevelSeq.elements![2] as ASN1OctetString;

    final innerParser = ASN1Parser(privateKeyOctet.valueBytes!);
    final privateKeySeq = innerParser.nextObject() as ASN1Sequence;

    // elements[0] is version
    final modulus = (privateKeySeq.elements![1] as ASN1Integer).integer;
    // final publicExponent = (privateKeySeq.elements![2] as ASN1Integer).integer;
    final privateExponent = (privateKeySeq.elements![3] as ASN1Integer).integer;
    final p = (privateKeySeq.elements![4] as ASN1Integer).integer;
    final q = (privateKeySeq.elements![5] as ASN1Integer).integer;

    final result = RSAPrivateKey(modulus!, privateExponent!, p, q);
    return result;
  }
}

enum SigningKeyType {
  rsaSigningKey("RSASigningKey"),
  secp256k1SigningKey("Secp256k1SigningKey");

  final String value;
  const SigningKeyType(this.value);
}

abstract class SigningKey {
  final SigningKeyType type;

  SigningKey(this.type);

  Future<Uint8List> sign(Uint8List data);
}

class RSASigningKey extends SigningKey {
  final dynamic key;
  final String? alias;
  final CryptoInterface cryptoImpl;

  RSASigningKey({this.key, this.alias, required this.cryptoImpl})
    : super(SigningKeyType.rsaSigningKey);

  @override
  Future<Uint8List> sign(Uint8List data) async {
    // If an alias was provided, pass the alias string, otherwise pass the key object
    final keyToUse = alias ?? key;
    return await cryptoImpl.sign(keyToUse, data);
  }
}

class Secp256k1SigningKey extends SigningKey {
  final String privateKeyHex;

  Secp256k1SigningKey(this.privateKeyHex)
    : super(SigningKeyType.secp256k1SigningKey);

  @override
  Future<Uint8List> sign(Uint8List data) async {
    final hash = bssl.sha256.hash(data)!;
    final priv = hex.decode(privateKeyHex);

    // 3. Sign the hash (this automatically uses deterministic ECDSA / RFC6979)
    // final sig = signature(priv, hash);
    final sig = secp256k1FFI.ecdsa.sign(priv, hash);

    // 4. Return the DER-encoded signature as a Uint8List
    return sig!;
  }
}

class KeyOrAliasType {
  final String? key;
  final String? alias;

  // Private constructor with an assertion to ensure mutually exclusive properties
  const KeyOrAliasType._({this.key, this.alias})
    : assert(
        (key != null) ^ (alias != null),
        'Must provide exactly one of key or alias.',
      );
}

/// Factory class to match the TypeScript `KeyOrAlias.key()` and `KeyOrAlias.alias()` usage
class KeyOrAlias {
  static KeyOrAliasType key(String key) {
    return KeyOrAliasType._(key: key);
  }

  static KeyOrAliasType alias(String alias) {
    return KeyOrAliasType._(alias: alias);
  }
}

class NodeKeyCache {
  final Map<String, SigningKey> _idToKey = {};
  final CryptoInterface cryptoImpl;

  NodeKeyCache([CryptoInterface? cryptoImpl])
    : cryptoImpl = cryptoImpl ?? DefaultCrypto();

  Future<SigningKey?> loadKey(
    String id,
    KeyOrAliasType keyOrAlias,
    SigningKeyType signingKeyType,
  ) async {
    SigningKey signingKey;

    if (keyOrAlias.alias != null) {
      switch (signingKeyType) {
        case SigningKeyType.rsaSigningKey: // Assuming camelCase for Dart enums
          signingKey = RSASigningKey(
            alias: keyOrAlias.alias,
            cryptoImpl: cryptoImpl,
          );
          break;
        default:
          throw LightsparkSigningException(
            'Aliases are not supported for signing key type $signingKeyType',
          );
      }

      _idToKey[id] = signingKey;
      return signingKey;
    }

    try {
      if (signingKeyType == SigningKeyType.secp256k1SigningKey) {
        signingKey = Secp256k1SigningKey(keyOrAlias.key!);
      } else {
        final cleanedPem = _stripPemTags(keyOrAlias.key!);
        // Dart's base64 decoder requires stripping whitespace/newlines from PEMs
        final base64String = cleanedPem.replaceAll(RegExp(r'\s+'), '');
        final decoded = base64.decode(base64String);

        final cryptoKeyOrAlias = await cryptoImpl.importPrivateSigningKey(
          decoded,
        );

        if (cryptoKeyOrAlias is String) {
          signingKey = RSASigningKey(
            alias: cryptoKeyOrAlias,
            cryptoImpl: cryptoImpl,
          );
        } else {
          signingKey = RSASigningKey(
            key: cryptoKeyOrAlias,
            cryptoImpl: cryptoImpl,
          );
        }
      }

      _idToKey[id] = signingKey;
      return signingKey;
    } catch (e) {
      print('Error importing key: $e');
    }
    return null;
  }

  SigningKey? getKey(String id) {
    return _idToKey[id];
  }

  bool hasKey(String id) {
    return _idToKey.containsKey(id);
  }

  String _stripPemTags(String pem) {
    return pem
        .replaceAll(RegExp(r'-----BEGIN (.*)-----'), '')
        // Note: The TS regex had a typo: -----END (.*)---- (missing the 5th dash).
        // Added the 5th dash below for proper PEM parsing in Dart.
        .replaceAll(RegExp(r'-----END (.*)-----'), '');
  }
}

class Query<T> {
  /// The string representation of the query payload for graphQL.
  final String queryPayload;

  /// The variables that will be passed to the query.
  final Map<String, dynamic>? variables;

  /// The function that will be called to construct the object from the response.
  final T? Function(dynamic rawData) constructObject;

  /// The id of the node that will be used to sign the query.
  final String? signingNodeId;

  /// True if auth headers should be omitted for this query.
  final bool? skipAuth;

  Query({
    required this.queryPayload,
    required this.constructObject,
    this.variables,
    this.signingNodeId,
    this.skipAuth,
  });
}

const _defaultBaseUrl = "api.lightspark.com";

class Requester {
  final NodeKeyCache nodeKeyCache;
  final String schemaEndpoint;
  final String sdkUserAgent;
  final AuthProvider authProvider;
  final String baseUrl;
  final CryptoInterface cryptoImpl;
  final SigningKey? signingKey;
  final http.Client httpClient;
  Completer<WebSocketLink>? _wsClientCompleter = Completer<WebSocketLink>();
  WebSocketLink? _wsClient;

  Requester({
    required this.nodeKeyCache,
    required this.schemaEndpoint,
    required this.sdkUserAgent,
    required this.authProvider,
    this.baseUrl = _defaultBaseUrl,
    required this.cryptoImpl,
    this.signingKey,
    http.Client? httpClient,
  }) : httpClient = httpClient ?? http.Client() {
    _initWsClient();
  }

  Future<WebSocketLink> _initWsClient() async {
    // If already fully initialized, return it
    if (_wsClient != null) {
      return _wsClient!;
    }

    // If another call triggered the init but it's still connecting, wait for it
    if (_wsClientCompleter != null) {
      return _wsClientCompleter!.future;
    }

    _wsClientCompleter = Completer<WebSocketLink>();

    try {
      final baseUri = Uri.parse(baseUrl);
      final wsScheme = baseUri.isScheme('http') ? 'ws' : 'wss';

      final wsUri = baseUri.replace(
        scheme: wsScheme,
        path: '${baseUri.path}/$schemaEndpoint'.replaceAll(RegExp(r'//+'), '/'),
      );

      // Using the official GraphQL package's WebSocketLink
      final link = WebSocketLink(
        wsUri.toString(),
        // This strictly enforces the modern graphql-ws protocol
        subProtocol: GraphQLProtocol.graphqlTransportWs,
        config: SocketClientConfig(
          autoReconnect: true,
          inactivityTimeout: const Duration(seconds: 30),
          initialPayload: () async {
            // Pass your auth tokens as the connection_init payload
            return await authProvider.addWsConnectionParams({});
          },
        ),
      );

      _wsClient = link;
      _wsClientCompleter!.complete(link);
      return link;
    } catch (e, st) {
      _wsClientCompleter!.completeError(e, st);
      _wsClientCompleter = null;
      rethrow;
    }
  }

  Future<T?> executeQuery<T>(Query<T> query) async {
    final data = await makeRawRequest(
      query.queryPayload,
      variables: query.variables,
      signingNodeId: query.signingNodeId,
      skipAuth: query.skipAuth ?? false,
    );
    return query.constructObject(data);
  }

  /// Returns a Stream (equivalent to Observable) for GraphQL subscriptions
  Stream<Map<String, dynamic>> subscribe(
    String queryPayload, [
    Map<String, dynamic>? variables,
  ]) {
    final vars = variables ?? {};

    final operationNameRegex = RegExp(
      r'^\s*(query|mutation|subscription)\s+(\w+)',
      caseSensitive: false,
    );
    final match = operationNameRegex.firstMatch(queryPayload);

    if (match == null || match.groupCount < 2) {
      throw LightsparkException("InvalidQuery", "Invalid query payload");
    }

    final operationType = match.group(1)!.toLowerCase();
    if (operationType == "mutation") {
      throw LightsparkException(
        "InvalidQuery",
        "Mutation queries should call makeRawRequest instead",
      );
    }

    final cleanVars = Map<String, dynamic>.from(vars)
      ..removeWhere((key, value) => value == null);

    final operationName = match.group(2)!;

    late StreamController<Map<String, dynamic>> controller;
    StreamSubscription<Response>? subscription;

    controller = StreamController<Map<String, dynamic>>(
      onListen: () async {
        try {
          // Wait for the WebSocketLink to be ready
          final wsLink = await _initWsClient();

          // Parse the raw string query into a GraphQL AST Document
          final request = Request(
            operation: Operation(
              document: gql(queryPayload),
              operationName: operationName,
            ),
            variables: cleanVars,
          );

          // wsLink.request() automatically handles the subId and envelope,
          // and returns a native Dart Stream!
          subscription = wsLink
              .request(request)
              .listen(
                (Response response) {
                  if (response.errors != null && response.errors!.isNotEmpty) {
                    // If the server returned an error during execution
                    controller.addError(response.errors!);
                  } else if (response.data != null) {
                    // Mimicking the exact `{ data: T }` envelope expected by the original code
                    controller.add({'data': response.data});
                  }
                },
                onError: (err) => controller.addError(err),
                onDone: () => controller.close(),
              );
        } catch (err, stackTrace) {
          controller.addError(err, stackTrace);
        }
      },
      onCancel: () {
        // Cleanly unsubscribes from the specific operation without killing the socket
        subscription?.cancel();
      },
    );

    return controller.stream;
  }

  Future<dynamic> makeRawRequest(
    String queryPayload, {
    Map<String, dynamic>? variables,
    String? signingNodeId,
    bool skipAuth = false,
  }) async {
    final vars = variables ?? {};

    final operationNameRegex = RegExp(
      r'^\s*(query|mutation|subscription)\s+(\w+)',
      caseSensitive: false,
    );
    final match = operationNameRegex.firstMatch(queryPayload);

    if (match == null || match.groupCount < 2) {
      throw LightsparkException("InvalidQuery", "Invalid query payload");
    }

    final operationType = match.group(1)!.toLowerCase();
    if (operationType == "subscription") {
      throw LightsparkException(
        "InvalidQuery",
        "Subscription queries should call subscribe instead",
      );
    }

    final operation = match.group(2)!;

    final payload = {
      'query': queryPayload,
      'variables': vars,
      'operationName': operation,
    };

    final sdkUa = _getSdkUserAgent();
    final baseHeaders = {
      "Content-Type": "application/json",
      "X-Lightspark-SDK": sdkUa,
      "User-Agent": sdkUa,
      "X-GraphQL-Operation": operation,
    };

    final headers = skipAuth
        ? baseHeaders
        : await authProvider.addAuthHeaders(baseHeaders);

    List<int> bodyData = await _addSigningDataIfNeeded(
      payload,
      headers,
      signingNodeId,
    );

    // Compress using ZLib (deflate) if over 1024 bytes
    if (bodyData.length > 1024) {
      try {
        bodyData = zlib.encode(bodyData);
        headers["Content-Encoding"] = "deflate";
      } catch (_) {
        // Fallback to uncompressed if zlib encoding fails
      }
    }

    String urlWithProtocol = baseUrl;
    if (!urlWithProtocol.startsWith("https://") &&
        !urlWithProtocol.startsWith("http://")) {
      urlWithProtocol = "https://$urlWithProtocol";
    }

    final url = "$urlWithProtocol/$schemaEndpoint";

    final response = await httpClient.post(
      Uri.parse(url),
      headers: headers,
      body: bodyData,
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw LightsparkException(
        "RequestFailed",
        "Request $operation failed. HTTP ${response.statusCode} ${response.reasonPhrase}",
      );
    }

    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
    print("SparkSDK GraphQL responseJson: ${responseJson}");
    final data = responseJson['data'];

    if (data == null) {
      String? firstErrorName;
      final errors = responseJson['errors'];

      if (errors != null && errors is List && errors.isNotEmpty) {
        final firstError = errors[0];
        if (firstError is Map && firstError['extensions'] is Map) {
          firstErrorName = firstError['extensions']['error_name']?.toString();
        }
      }

      throw LightsparkException(
        "RequestFailed",
        "Request $operation failed. ${jsonEncode(errors)}",
        firstErrorName != null ? {'errorName': firstErrorName} : null,
      );
    }

    return data;
  }

  String _getSdkUserAgent() {
    // Dart Platform logic to replace `isNode`
    final isWeb = identical(0, 0.0); // Quick check if compiling to JS/Web
    final platform = isWeb ? "Browser" : "DartNative";
    final platformVersion = Platform.version.split(' ').first; // e.g. "3.3.0"
    return "$sdkUserAgent $platform/$platformVersion";
  }

  Future<Uint8List> _addSigningDataIfNeeded(
    Map<String, dynamic> queryPayload,
    Map<String, String> headers,
    String? signingNodeId,
  ) async {
    if (signingNodeId == null) {
      return Uint8List.fromList(utf8.encode(jsonEncode(queryPayload)));
    }

    final nonce = await cryptoImpl.getNonce();

    // Equivalent to dayjs.utc().add(1, "hour").format()
    final expiration = DateTime.now()
        .toUtc()
        .add(const Duration(hours: 1))
        .toIso8601String();

    // Reconstruct payload with nonce and expiration
    final payload = {
      'query': queryPayload['query'],
      'variables': queryPayload['variables'],
      'operationName': queryPayload['operationName'],
      'nonce': nonce.toString(),
      'expires_at': expiration,
    };

    final key = signingKey ?? nodeKeyCache.getKey(signingNodeId);
    if (key == null) {
      throw LightsparkSigningException(
        "Missing node of encrypted_signing_private_key",
      );
    }

    final encodedPayload = Uint8List.fromList(utf8.encode(jsonEncode(payload)));
    final signedPayload = await key.sign(encodedPayload);
    final encodedSignedPayload = base64.normalize(base64.encode(signedPayload));

    headers["X-Lightspark-Signing"] = jsonEncode({
      "v": "1",
      "signature": encodedSignedPayload,
    });

    return encodedPayload;
  }
}
