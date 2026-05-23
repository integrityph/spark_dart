// lib/utils/address.dart

import 'dart:convert';
import 'dart:typed_data';

import 'package:bech32/bech32.dart';
import 'package:bech32m_i/bech32m_i.dart';
import 'package:convert/convert.dart';
import 'package:protobuf/protobuf.dart';
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart';
import 'package:uuid/uuid.dart';
import 'package:bitcoin_base/bitcoin_base.dart';

// Adjust these imports to point to your generated Dart protobufs
import '../src/proto/spark.pb.dart' hide Network;

import '../errors/spark_error.dart'; // Adjust path for SparkValidationError
import 'invoice_hashing.dart'; // Adjust path for HashSparkInvoice
import 'network.dart'; // Adjust path for Network enum

const int bech32mLimit = 1024;

const Map<Network, String> addressNetwork = {
  Network.mainnet: "spark",
  Network.testnet: "sparkt",
  Network.regtest: "sparkrt",
  Network.signet: "sparks",
  Network.local: "sparkl", // Assuming local maps here
};

const Map<Network, String> legacyAddressNetwork = {
  Network.mainnet: "sp",
  Network.testnet: "spt",
  Network.regtest: "sprt",
  Network.signet: "sps",
  Network.local: "spl",
};

extension type SparkAddressFormat(String value) implements String {
  // Optional: Add runtime validation if you want to be extra safe
  // factory SparkAddressFormat.validated(String value) {
  //   if (!value.contains('1')) throw ArgumentError('Invalid address');
  //   return SparkAddressFormat(value);
  // }
}

// --- Data Classes ---

class SparkAddressData {
  final String identityPublicKey;
  final Network network;
  final SparkInvoiceFields? sparkInvoiceFields;

  SparkAddressData({
    required this.identityPublicKey,
    required this.network,
    this.sparkInvoiceFields,
  });
}

class DecodedPaymentType {
  final String type; // "tokens" or "sats"
  final String? tokenIdentifier;
  final BigInt? amount;

  DecodedPaymentType({required this.type, this.tokenIdentifier, this.amount});
}

class DecodedInvoiceFields {
  final int version;
  final String id;
  final DecodedPaymentType? paymentType;
  final String? memo;
  final String? senderPublicKey;
  final DateTime? expiryTime;

  DecodedInvoiceFields({
    required this.version,
    required this.id,
    this.paymentType,
    this.memo,
    this.senderPublicKey,
    this.expiryTime,
  });
}

class DecodedSparkAddressData {
  final String identityPublicKey;
  final Network network;
  final DecodedInvoiceFields? sparkInvoiceFields;
  final String? signature;

  DecodedSparkAddressData({
    required this.identityPublicKey,
    required this.network,
    this.sparkInvoiceFields,
    this.signature,
  });
}

// --- Encoding / Decoding ---

String encodeSparkAddress(SparkAddressData payload) {
  return encodeSparkAddressWithSignature(payload);
}

String encodeSparkAddressWithSignature(
  SparkAddressData payload, [
  Uint8List? signature,
]) {
  try {
    isValidPublicKey(payload.identityPublicKey);
    final identityPublicKey = Uint8List.fromList(
      hex.decode(payload.identityPublicKey),
    );

    SparkInvoiceFields? sparkInvoiceFields;
    if (payload.sparkInvoiceFields != null) {
      validateSparkInvoiceFields(payload.sparkInvoiceFields!);
      sparkInvoiceFields = payload.sparkInvoiceFields;
    }

    final w = CodedBufferWriter();

    // SparkAddress.identity_public_key (1)
    // TS: w.uint32(10).bytes(identityPublicKey);
    w.writeInt32NoTag(10);
    w.writeInt32NoTag(identityPublicKey.length);
    w.writeRawBytes(identityPublicKey);

    // SparkAddress.spark_invoice_fields (2) with canonical inner order
    if (sparkInvoiceFields != null) {
      final inner = encodeSparkInvoiceFieldsV1Canonical(sparkInvoiceFields);
      // TS: w.uint32(18).bytes(inner);
      w.writeInt32NoTag(18);
      w.writeInt32NoTag(inner.length);
      w.writeRawBytes(inner);
    }

    // SparkAddress.signature (3)
    if (signature != null && signature.isNotEmpty) {
      // TS: w.uint32(26).bytes(signature);
      w.writeInt32NoTag(26);
      w.writeInt32NoTag(signature.length);
      w.writeRawBytes(signature);
    }

    final serializedPayload = w.toBuffer();

    // TS: bech32m.toWords(serializedPayload)
    // Converts 8-bit bytes to 5-bit words for Bech32 encoding
    final words = _convertBits(serializedPayload, 8, 5, true);

    return bech32mEncode(addressNetwork[payload.network]!, words);
  } catch (error) {
    throw SparkValidationError(
      "Failed to encode Spark address",
      context: {
        'field': "publicKey",
        'value': payload.identityPublicKey,
        'error': error.toString(),
      },
    );
  }
}

DecodedSparkAddressData decodeSparkAddress(String address, [Network network=Network.mainnet]) {
  try {
    if (network != getNetworkFromSparkAddress(address)) {
      throw SparkValidationError(
        "Invalid Spark address prefix",
        context: {
          'field': "address",
          'value': address,
          'expected':
              "prefix='${addressNetwork[network]}' or '${legacyAddressNetwork[network]}'",
        },
      );
    }

    final decoded = bech32mDecode(address);
    final payloadBytes = _convertBits(decoded.data, 5, 8, false);
    final payload = SparkAddress.fromBuffer(payloadBytes);

    final identityPubkeyHex = hex.encode(payload.identityPublicKey);
    final signatureHex = payload.hasSignature() && payload.signature.isNotEmpty
        ? hex.encode(payload.signature)
        : null;

    isValidPublicKey(identityPubkeyHex);

    DecodedInvoiceFields? decodedFields;
    if (payload.hasSparkInvoiceFields()) {
      final fields = payload.sparkInvoiceFields;

      DecodedPaymentType? paymentType;
      if (fields.hasTokensPayment()) {
        paymentType = DecodedPaymentType(
          type: "tokens",
          tokenIdentifier: fields.tokensPayment.tokenIdentifier.isNotEmpty
              ? hex.encode(fields.tokensPayment.tokenIdentifier)
              : null,
          amount: fields.tokensPayment.amount.isNotEmpty
              ? _bytesToBigIntBE(fields.tokensPayment.amount)
              : null,
        );
      } else if (fields.hasSatsPayment()) {
        paymentType = DecodedPaymentType(
          type: "sats",
          // Assuming Int64 in protobuf maps to toInt() or BigInt based on generation
          amount: BigInt.from(fields.satsPayment.amount.toInt()),
        );
      }

      decodedFields = DecodedInvoiceFields(
        version: fields.version,
        id: Uuid.unparse(fields.id), // Formats 16 bytes back to UUID string
        paymentType: paymentType,
        memo: fields.hasMemo() ? fields.memo : null,
        senderPublicKey: fields.senderPublicKey.isNotEmpty
            ? hex.encode(fields.senderPublicKey)
            : null,
        expiryTime: fields.hasExpiryTime()
            ? fields.expiryTime.toDateTime()
            : null,
      );
    }

    return DecodedSparkAddressData(
      identityPublicKey: identityPubkeyHex,
      network: network,
      sparkInvoiceFields: decodedFields,
      signature: signatureHex,
    );
  } catch (error) {
    throw SparkValidationError(
      "Failed to decode Spark address",
      context: {
        'field': "address",
        'value': address,
        'error': error.toString(),
      },
    );
  }
}

// --- Network & Address Helpers ---

final Map<String, Network> _prefixToNetwork = {
  for (var entry in addressNetwork.entries) entry.value: entry.key,
};

final Map<String, Network> _legacyPrefixToNetwork = {
  for (var entry in legacyAddressNetwork.entries) entry.value: entry.key,
};

Network getNetworkFromSparkAddress(String address) {
  final decoded = bech32mDecode(address);
  final network =
      _prefixToNetwork[decoded.hrp] ?? _legacyPrefixToNetwork[decoded.hrp];

  if (network == null) {
    throw SparkValidationError(
      "Invalid Spark address prefix",
      context: {
        'field': "network",
        'value': address,
        'expected':
            "prefix='spark1', 'sparkt1', 'sparkrt1', 'sparks1', 'sparkl1' or legacy ('sp1', 'spt1', 'sprt1', 'sps1', 'spl1')",
      },
    );
  }
  return network;
}

String normalizeSparkAddressToNetwork(String address, Network network) {
  final decoded = bech32mDecode(address);
  final currentNetwork =
      _prefixToNetwork[decoded.hrp] ?? _legacyPrefixToNetwork[decoded.hrp];

  if (currentNetwork == null) {
    throw SparkValidationError(
      "Invalid Spark address prefix",
      context: {'field': "network", 'value': address},
    );
  }

  if (currentNetwork == network) {
    return address;
  }

  final isLocalRegtestPair =
      (currentNetwork == Network.local || currentNetwork == Network.regtest) &&
      (network == Network.local || network == Network.regtest);

  if (!isLocalRegtestPair) {
    return address;
  }

  final isLegacy = _legacyPrefixToNetwork.containsKey(decoded.hrp);
  final targetPrefix = isLegacy
      ? legacyAddressNetwork[network]!
      : addressNetwork[network]!;

  return bech32mEncode(targetPrefix, decoded.data);
}

bool isLegacySparkAddress(String address) {
  try {
    final decoded = bech32mDecode(address);
    return _legacyPrefixToNetwork.containsKey(decoded.hrp);
  } catch (error) {
    return false;
  }
}

bool isValidSparkAddress(String address) {
  try {
    final network = getNetworkFromSparkAddress(address);
    decodeSparkAddress(address, network);
    return true;
  } catch (error) {
    if (error is SparkValidationError) {
      rethrow;
    }
    throw SparkValidationError(
      "Invalid Spark address",
      context: {
        'field': "address",
        'value': address,
        'error': error.toString(),
      },
    );
  }
}

// --- Validation ---

void isValidPublicKey(String publicKey) {
  try {
    // Relying on bitcoin_base for parsing and asserting curve point validity
    ECPublic.fromHex(publicKey);
  } catch (error) {
    throw SparkValidationError(
      "Invalid public key",
      context: {
        'field': "publicKey",
        'value': publicKey,
        'error': error.toString(),
      },
    );
  }
}

void validateSparkInvoiceFields(SparkInvoiceFields fields) {
  if (fields.version != 1) {
    throw SparkValidationError(
      "Version must be 1",
      context: {'field': "version", 'value': fields.version},
    );
  }

  try {
    // Verifies it is a valid UUID byte sequence
    Uuid.unparse(fields.id);
  } catch (error) {
    throw SparkValidationError(
      "Invalid id",
      context: {'field': "id", 'value': fields.id, 'error': error.toString()},
    );
  }

  if (fields.senderPublicKey.isNotEmpty) {
    try {
      isValidPublicKey(hex.encode(fields.senderPublicKey));
    } catch (error) {
      throw SparkValidationError(
        "Invalid sender public key",
        context: {
          'field': "senderPublicKey",
          'value': hex.encode(fields.senderPublicKey),
          'error': error.toString(),
        },
      );
    }
  }

  if (fields.hasMemo()) {
    final memoBytes = utf8.encode(fields.memo);
    if (memoBytes.length > 120) {
      throw SparkValidationError(
        "Memo exceeds the maximum allowed byte length of 120.",
        context: {
          'field': "memo",
          'value': fields.memo,
          'expected': "less than 120 bytes",
        },
      );
    }
  }

  if (fields.hasTokensPayment() || fields.hasSatsPayment()) {
    if (fields.hasTokensPayment()) {
      final maxUint128 = (BigInt.one << 128) - BigInt.one;
      final tokensPayment = fields.tokensPayment;

      if (tokensPayment.tokenIdentifier.isNotEmpty) {
        if (tokensPayment.tokenIdentifier.length != 32) {
          throw SparkValidationError(
            "Token identifier must be 32 bytes",
            context: {
              'field': "paymentType.tokensPayment.tokenIdentifier",
              'value': hex.encode(tokensPayment.tokenIdentifier),
            },
          );
        }
      }

      if (tokensPayment.amount.isNotEmpty) {
        if (tokensPayment.amount.length > 16) {
          throw SparkValidationError(
            "Amount must be less than 16 bytes",
            context: {
              'field': "paymentType.tokensPayment.amount",
              'value': hex.encode(tokensPayment.amount),
            },
          );
        }

        final tokensAmountBigInt = _bytesToBigIntBE(tokensPayment.amount);
        if (tokensAmountBigInt < BigInt.zero ||
            tokensAmountBigInt > maxUint128) {
          throw SparkValidationError(
            "Asset amount must be between 0 and MAX_UINT128",
            context: {
              'field': "amount",
              'value': hex.encode(tokensPayment.amount),
            },
          );
        }
      }
    } else if (fields.hasSatsPayment()) {
      final amount = fields.satsPayment.amount.toInt();
      const maxSatsAmount = 2100000000000000; // 21M BTC

      if (amount < 0) {
        throw SparkValidationError(
          "Amount must be greater than or equal to 0",
          context: {'field': "paymentType.satsPayment.amount", 'value': amount},
        );
      }
      if (amount > maxSatsAmount) {
        throw SparkValidationError(
          "Amount must be less than $maxSatsAmount sats",
        );
      }
    }
  }
}

void validateSparkInvoiceSignature(String invoice) {
  try {
    final decoded = bech32mDecode(invoice);
    final network = getNetworkFromSparkAddress(invoice);

    final payloadBytes = _convertBits(decoded.data, 5, 8, false);
    final payload = SparkAddress.fromBuffer(payloadBytes);

    if (!payload.hasSparkInvoiceFields()) {
      throw SparkValidationError(
        "Spark invoice fields are required",
        context: {'field': "sparkInvoiceFields"},
      );
    }
    if (!payload.hasSignature() || payload.signature.isEmpty) {
      throw SparkValidationError(
        "Signature is required",
        context: {'field': "signature"},
      );
    }
    if (payload.identityPublicKey.isEmpty) {
      throw SparkValidationError(
        "Identity public key is required",
        context: {'field': "identityPublicKey"},
      );
    }

    final hash = hashSparkInvoice(
      payload.sparkInvoiceFields,
      Uint8List.fromList(payload.identityPublicKey),
      network,
    );

    final ecPub = ECPublic.fromBytes(payload.identityPublicKey);
    final isValid = ecPub.verifySchnorrSignature(
      digest: hash,
      signature: payload.signature,
    );

    if (!isValid) {
      throw SparkValidationError(
        "Invalid signature",
        context: {'field': "signature", 'value': hex.encode(payload.signature)},
      );
    }
  } catch (error) {
    if (error is SparkValidationError) {
      rethrow;
    }
    throw SparkValidationError(
      "Failed to validate Spark invoice signature",
      context: {
        'field': "invoice",
        'value': invoice,
        'error': error.toString(),
      },
    );
  }
}

// --- Protobuf Writers & Utilities ---

Timestamp toProtoTimestamp(DateTime date) {
  return Timestamp.fromDateTime(date);
}

void assertBech32(String s) {
  final i = s.lastIndexOf("1");
  if (i <= 0 || i >= s.length - 1) throw Exception("invalid bech32 string");
}

Bech32m bech32mDecode(String address) {
  assertBech32(address);
  try {
    const codec = Bech32mCodec();
    return codec.decode(address, bech32mLimit);
  } catch (_) {
    const codec = Bech32Codec();
    final b32m = codec.decode(address, bech32mLimit);
    return Bech32m(b32m.hrp, b32m.data);
  }
}

String bech32mEncode(String prefix, List<int> words) {
  const codec = Bech32mCodec();
  final bech32Data = Bech32m(prefix, words);
  // Using Bech32m formatting specifically natively handled by package:bech32
  return codec.encode(bech32Data, bech32mLimit);
}

/// Matches the explicit serialization tags and order of the original TS builder
Uint8List encodeSparkInvoiceFieldsV1Canonical(SparkInvoiceFields f) {
  final w = CodedBufferWriter();

  // version (1)
  // TS: if (f.version !== 0) w.uint32(8).uint32(f.version);
  if (f.version != 0) {
    w.writeInt32NoTag(8);
    w.writeInt32NoTag(f.version);
  }

  // id (2)
  // TS: if (f.id && f.id.length) w.uint32(18).bytes(f.id);
  if (f.id.isNotEmpty) {
    w.writeInt32NoTag(18);
    w.writeInt32NoTag(f.id.length);
    w.writeRawBytes(f.id as Uint8List);
  }

  // memo (5)
  // TS: if (f.memo !== undefined) w.uint32(42).string(f.memo);
  if (f.hasMemo()) {
    final memoBytes = Uint8List.fromList(utf8.encode(f.memo));
    w.writeInt32NoTag(42);
    w.writeInt32NoTag(memoBytes.length);
    w.writeRawBytes(memoBytes);
  }

  // sender_public_key (6)
  // TS: if (f.senderPublicKey !== undefined) w.uint32(50).bytes(f.senderPublicKey);
  if (f.senderPublicKey.isNotEmpty) {
    w.writeInt32NoTag(50);
    w.writeInt32NoTag(f.senderPublicKey.length);
    w.writeRawBytes(f.senderPublicKey as Uint8List);
  }

  // expiry_time (7)
  // TS: if (f.expiryTime !== undefined) { Timestamp.encode(toProtoTimestamp(f.expiryTime), w.uint32(58).fork()).join(); }
  if (f.hasExpiryTime()) {
    // In Dart protobufs, f.expiryTime is already a Timestamp object,
    // so we can serialize it directly without needing to map a Date object.
    final inner = f.expiryTime.writeToBuffer();
    w.writeInt32NoTag(58);
    w.writeInt32NoTag(inner.length);
    w.writeRawBytes(inner);
  }

  // payment_type oneof last: tokens (3) or sats (4)
  if (f.hasTokensPayment()) {
    // TS: TokensPayment.encode(f.paymentType.tokensPayment, w.uint32(26).fork()).join();
    final inner = f.tokensPayment.writeToBuffer();
    w.writeInt32NoTag(26);
    w.writeInt32NoTag(inner.length);
    w.writeRawBytes(inner);
  } else if (f.hasSatsPayment()) {
    // TS: SatsPayment.encode(f.paymentType.satsPayment, w.uint32(34).fork()).join();
    final inner = f.satsPayment.writeToBuffer();
    w.writeInt32NoTag(34);
    w.writeInt32NoTag(inner.length);
    w.writeRawBytes(inner);
  }

  return w.toBuffer();
}

bool isSafeForNumber(BigInt bi) {
  // Dart's max safe int for web compilation matches JS max safe integer
  return bi >= BigInt.from(-9007199254740991) &&
      bi <= BigInt.from(9007199254740991);
}

BigInt _bytesToBigIntBE(List<int> bytes) {
  if (bytes.isEmpty) return BigInt.zero;
  return BigInt.parse(hex.encode(bytes), radix: 16);
}

/// Standard internal BIP-173 bit conversion for Bech32 encoding
List<int> _convertBits(List<int> data, int fromBits, int toBits, bool pad) {
  var acc = 0;
  var bits = 0;
  final result = <int>[];
  final maxv = (1 << toBits) - 1;

  for (var value in data) {
    if (value < 0 || (value >> fromBits) != 0) {
      throw Exception('Invalid value: $value');
    }
    acc = (acc << fromBits) | value;
    bits += fromBits;
    while (bits >= toBits) {
      bits -= toBits;
      result.add((acc >> bits) & maxv);
    }
  }

  if (pad) {
    if (bits > 0) {
      result.add((acc << (toBits - bits)) & maxv);
    }
  } else if (bits >= fromBits || ((acc << (toBits - bits)) & maxv) != 0) {
    throw Exception('Invalid padding');
  }
  return result;
}
