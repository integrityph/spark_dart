// lib/utils/invoice_hashing.dart

import 'dart:convert';
import 'dart:typed_data';

import 'package:boringssl_ffi/boringssl_ffi.dart' as bsll;

// Adjust these imports to point to your actual files
import '../src/proto/spark.pb.dart' hide Network;
import 'network.dart';

/// Helper to quickly hash a byte array
List<int> _sha256(List<int> data) => bsll.sha256.hash(data)!;

/// Big-endian uint32 bytes
Uint8List _uint32be(int n) {
  return (ByteData(4)..setUint32(0, n, Endian.big)).buffer.asUint8List();
}

/// Big-endian uint64 bytes from BigInt
/// Using bitwise operations to ensure safe 64-bit bounds regardless of platform
Uint8List _uint64be(BigInt value) {
  final bytes = Uint8List(8);
  var temp = value;
  for (var i = 7; i >= 0; i--) {
    bytes[i] = (temp & BigInt.from(0xff)).toInt();
    temp = temp >> 8;
  }
  return bytes;
}

int _bitcoinNetworkIdentifierFromNetwork(Network network) {
  switch (network) {
    case Network.mainnet:
      return 0xd9b4bef9;
    case Network.local:
    case Network.regtest:
      return 0xdab5bffa;
    case Network.testnet:
      return 0x0709110b;
    case Network.signet:
      return 0x40cf030a;
  }
}

// Kept the capitalized function name to match the TS export and previous file imports
Uint8List hashSparkInvoice(
  SparkInvoiceFields? sparkInvoiceFields,
  Uint8List? receiverPublicKey,
  Network? network,
) {
  if (sparkInvoiceFields == null) {
    throw ArgumentError("Missing sparkInvoiceFields");
  }
  if (receiverPublicKey == null) {
    throw ArgumentError("Receiver public key is required");
  }
  if (network == null) {
    throw ArgumentError("Network is required");
  }

  switch (sparkInvoiceFields.version) {
    case 1:
      return _hashSparkInvoiceV1(
        sparkInvoiceFields,
        receiverPublicKey,
        network,
      );
    default:
      throw ArgumentError(
        "Unsupported invoice version: ${sparkInvoiceFields.version}",
      );
  }
}

// HashSparkInvoiceV1 computes a deterministic hash of SparkInvoiceFields by:
// - Hashing each field (or group) separately using SHA-256, in a fixed order
// - Concatenating those field-level hashes
// - Hashing the concatenation once more with SHA-256
Uint8List _hashSparkInvoiceV1(
  SparkInvoiceFields fields,
  Uint8List receiverPublicKey,
  Network network,
) {
  // BytesBuilder acts as the 'allHashes' array, natively flattening the appended hashes
  final allHashes = BytesBuilder();

  // 1) version: uint32 big-endian
  allHashes.add(_sha256(_uint32be(fields.version)));

  // 2) id: 16 bytes
  final id = fields.id;
  if (id.length != 16) {
    throw ArgumentError("invoice id must be exactly 16 bytes");
  }
  allHashes.add(_sha256(id));

  // 3) network: 4 bytes
  final magic = _bitcoinNetworkIdentifierFromNetwork(network);
  final magicBE = _uint32be(magic);
  // The TS code updates the hasher with the hash of the magic bytes,
  // effectively double-hashing it.
  allHashes.add(_sha256(_sha256(magicBE)));

  // 4) receiver_public_key: 33 bytes
  if (receiverPublicKey.length != 33) {
    throw ArgumentError("receiver public key must be exactly 33 bytes");
  }
  allHashes.add(_sha256(receiverPublicKey));

  // 5) payment_type
  if (fields.hasTokensPayment()) {
    final tp = fields.tokensPayment;
    // discriminator {1}
    allHashes.add(_sha256([1]));

    // token_identifier: 32 bytes (0-filled if nil)
    final tokenId = tp.tokenIdentifier.isNotEmpty
        ? tp.tokenIdentifier
        : Uint8List(32);
    if (tokenId.length != 32) {
      throw ArgumentError("token identifier must be exactly 32 bytes");
    }
    allHashes.add(_sha256(tokenId));

    // amount: raw bytes (0..16 bytes) (empty if nil)
    final amount = tp.amount;
    if (amount.length > 16) {
      throw ArgumentError("token amount exceeds 16 bytes");
    }
    // _sha256 natively handles the empty array gracefully
    allHashes.add(_sha256(amount));
  } else if (fields.hasSatsPayment()) {
    final sp = fields.satsPayment;
    // discriminator {2}
    allHashes.add(_sha256([2]));

    // amount: uint64 big-endian (0 if nil)
    var sats = BigInt.zero;
    if (sp.amount > 0) {
      sats = BigInt.from(sp.amount.toInt());
    }
    allHashes.add(_sha256(_uint64be(sats)));
  } else {
    throw ArgumentError("unsupported or missing payment type");
  }

  // 6) memo: raw UTF-8 bytes (empty if nil)
  final memoBytes = fields.hasMemo() ? utf8.encode(fields.memo) : <int>[];
  allHashes.add(_sha256(memoBytes));

  // 7) sender_public_key: 33 bytes (0-filled if nil)
  final spk = fields.senderPublicKey.isNotEmpty
      ? fields.senderPublicKey
      : Uint8List(33);
  if (spk.length != 33) {
    throw ArgumentError("sender public key must be exactly 33 bytes");
  }
  allHashes.add(_sha256(spk));

  // 8) expiry_time (seconds): uint64 big-endian (0 if nil)
  var exp = BigInt.zero;
  if (fields.hasExpiryTime()) {
    // Protobuf Timestamps natively expose seconds as Int64
    final seconds = fields.expiryTime.seconds.toInt();
    if (seconds > 0) {
      exp = BigInt.from(seconds);
    }
  }
  allHashes.add(_sha256(_uint64be(exp)));

  // Final Hash: SHA256 across the concatenated byte string
  return Uint8List.fromList(_sha256(allHashes.toBytes()));
}
