// lib/utils/hashstructure.dart

import 'dart:convert';
import 'dart:typed_data';
import 'package:boringssl_ffi/boringssl_ffi.dart' as bsll;

/// Compares two byte lists using byte-wise lexicographic comparison
/// for consistent cross-platform string ordering.
int compareBytes(List<int> a, List<int> b) {
  final minLength = a.length < b.length ? a.length : b.length;
  for (int i = 0; i < minLength; i++) {
    if (a[i] != b[i]) {
      return a[i] - b[i];
    }
  }
  return a.length - b.length;
}

/// Hasher provides a type-safe API for securely hashing a sequence of values with SHA-256.
/// It preserves collision resistance when tags differ.
class Hasher {
  final List<int> sink = [];

  /// Creates a new Hasher with the given hierarchical domain tag.
  /// The hash is computed using the BIP-340 tagged hash pattern.
  static Hasher newHasher(List<String> tag) {
    final tagHash = bsll.sha256.hash(_serializeTag(tag))!;

    // Write tagHash || tagHash as per BIP-340 tagged hash pattern
    final obj = Hasher();
    obj.sink.addAll(tagHash);
    obj.sink.addAll(tagHash);

    return obj;
  }

  /// Adds a Uint8List value to the hash computation.
  Hasher addBytes(Uint8List b) {
    _addValue(b);
    return this;
  }

  /// Adds a string value to the hash computation.
  Hasher addString(String s) {
    _addValue(Uint8List.fromList(utf8.encode(s)));
    return this;
  }

  /// Adds a uint64 value to the hash computation using BigInt to guarantee
  /// safety across both Dart Native and Dart Web (JavaScript limits).
  Hasher addUint64(BigInt v) {
    if (v < BigInt.zero) {
      throw ArgumentError('addUint64: bigint must be non-negative, got $v');
    }
    final maxUint64 = BigInt.parse('18446744073709551615'); // 2^64 - 1
    if (v > maxUint64) {
      throw ArgumentError(
        'addUint64: bigint must be within uint64 range (0 to 2^64-1), got $v',
      );
    }

    _addValue(_uint64ToBytes(v));
    return this;
  }

  /// Convenience method for Dart integers (auto-promotes to BigInt).
  Hasher addUint64Int(int v) {
    if (v < 0) {
      throw ArgumentError('addUint64Int: number must be non-negative, got $v');
    }
    return addUint64(BigInt.from(v));
  }

  /// Adds a uint32 value to the hash computation.
  Hasher addUint32(int v) {
    if (v < 0 || v > 0xffffffff) {
      throw ArgumentError('addUint32: value must be a valid uint32, got $v');
    }
    return addUint64Int(v);
  }

  /// Adds a uint16 value to the hash computation.
  Hasher addUint16(int v) {
    if (v < 0 || v > 0xffff) {
      throw ArgumentError('addUint16: value must be a valid uint16, got $v');
    }
    return addUint64Int(v);
  }

  /// Adds a uint8 value to the hash computation.
  Hasher addUint8(int v) {
    if (v < 0 || v > 0xff) {
      throw ArgumentError('addUint8: value must be a valid uint8, got $v');
    }
    return addUint64Int(v);
  }

  /// Adds a `map<string, Uint8Array>` to the hash computation.
  /// The map is hashed in a deterministic order.
  Hasher addMapStringToBytes(Map<String, Uint8List> m) {
    addUint64Int(m.length);

    // For determinism, convert map to list of entries and sort by UTF-8 keys
    final entries = m.entries.toList();
    entries.sort((a, b) {
      return compareBytes(utf8.encode(a.key), utf8.encode(b.key));
    });

    for (final entry in entries) {
      addString(entry.key);
      addBytes(entry.value);
    }

    return this;
  }

  /// Writes a value directly to the hash state.
  /// Format: [8-byte length (big-endian uint64)] [value bytes]
  void _addValue(Uint8List valueBytes) {
    sink.addAll(_uint64ToBytes(BigInt.from(valueBytes.length)));
    sink.addAll(valueBytes);
  }

  /// Computes and returns the final SHA256 hash.
  Uint8List hash() {
    return bsll.sha256.hash(sink)!;
  }
}

/// Creates a new Hasher with the given hierarchical domain tag.
Hasher newHasher(List<String> tag) {
  return Hasher.newHasher(tag);
}

/// Serializes a hierarchical tag into bytes.
Uint8List _serializeTag(List<String> tag) {
  final builder = BytesBuilder();

  for (final component in tag) {
    final componentBytes = utf8.encode(component);
    builder.add(_uint64ToBytes(BigInt.from(componentBytes.length)));
    builder.add(componentBytes);
  }

  return builder.toBytes();
}

/// Safely converts a BigInt into an 8-byte big-endian Uint8List.
/// This prevents any silent truncation or Web-specific integer precision loss.
Uint8List _uint64ToBytes(BigInt value) {
  final result = Uint8List(8);
  var temp = value;
  final byteMask = BigInt.from(0xff);

  for (int i = 7; i >= 0; i--) {
    result[i] = (temp & byteMask).toInt();
    temp = temp >> 8;
  }

  return result;
}
