// lib/utils/hash_utils.dart

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:convert/convert.dart' as convert;

/// Checks if something is a Uint8List.
bool isBytes(dynamic a) {
  return a is Uint8List;
}

/// Asserts something is a non-negative integer.
void anumber(num n, [String title = '']) {
  if (n < 0 || n.truncate() != n) {
    final prefix = title.isNotEmpty ? '"$title" ' : '';
    throw RangeError('${prefix}expected integer >= 0, got $n');
  }
}

/// Asserts something is a Uint8List, optionally with a specific length.
Uint8List abytes(dynamic value, {int? length, String title = ''}) {
  if (value is! Uint8List) {
    final prefix = title.isNotEmpty ? '"$title" ' : '';
    throw ArgumentError(
      '${prefix}expected Uint8List, got ${value.runtimeType}',
    );
  }
  if (length != null && value.length != length) {
    final prefix = title.isNotEmpty ? '"$title" ' : '';
    throw RangeError(
      '${prefix}expected Uint8List of length $length, got length=${value.length}',
    );
  }
  return value;
}

/// Copies bytes into a fresh Uint8List.
Uint8List copyBytes(Uint8List bytes) {
  return Uint8List.fromList(bytes);
}

/// Asserts a hash wrapper has the required properties.
void ahash(CHash h) {
  anumber(h.outputLen);
  anumber(h.blockLen);
  if (h.outputLen < 1) throw ArgumentError('"outputLen" must be >= 1');
  if (h.blockLen < 1) throw ArgumentError('"blockLen" must be >= 1');
}

/// Asserts output is a sufficiently-sized byte array.
void aoutput(Uint8List out, Hash instance) {
  final min = instance.outputLen;
  if (out.length < min) {
    throw RangeError('"digestInto() output" expected to be of length >= $min');
  }
}

/// Casts a typed array view to Uint8List.
Uint8List u8(TypedData arr) {
  return Uint8List.view(arr.buffer, arr.offsetInBytes, arr.lengthInBytes);
}

/// Casts a typed array view to Uint32List.
Uint32List u32(TypedData arr) {
  return Uint32List.view(arr.buffer, arr.offsetInBytes, arr.lengthInBytes ~/ 4);
}

/// Zeroizes typed arrays in place.
void clean(List<TypedData> arrays) {
  for (final arr in arrays) {
    if (arr is Uint8List) {
      arr.fillRange(0, arr.length, 0);
    } else if (arr is Uint32List)
      arr.fillRange(0, arr.length, 0);
    else if (arr is Int32List)
      arr.fillRange(0, arr.length, 0);
    // Add other types if needed
  }
}

/// Creates a ByteData for byte-level manipulation.
ByteData createView(TypedData arr) {
  return ByteData.view(arr.buffer, arr.offsetInBytes, arr.lengthInBytes);
}

/// Rotate-right operation for 32-bit values.
int rotr(int word, int shift) {
  return ((word >>> shift) | (word << (32 - shift))) & 0xFFFFFFFF;
}

/// Rotate-left operation for 32-bit values.
int rotl(int word, int shift) {
  return ((word << shift) | (word >>> (32 - shift))) & 0xFFFFFFFF;
}

/// Whether the current platform is little-endian.
final bool isLE = Endian.host == Endian.little;

/// Byte-swap operation for 32-bit values.
int byteSwap(int word) {
  return (((word << 24) & 0xFF000000) |
          ((word << 8) & 0x00FF0000) |
          ((word >>> 8) & 0x0000FF00) |
          ((word >>> 24) & 0x000000FF)) &
      0xFFFFFFFF;
}

/// Conditionally byte-swaps one 32-bit word on big-endian platforms.
int swap8IfBE(int n) => isLE ? n : byteSwap(n);

/// Byte-swaps every word of a Uint32List in place.
Uint32List byteSwap32(Uint32List arr) {
  for (var i = 0; i < arr.length; i++) {
    arr[i] = byteSwap(arr[i]);
  }
  return arr;
}

/// Conditionally byte-swaps a Uint32List on big-endian platforms.
Uint32List swap32IfBE(Uint32List u) => isLE ? u : byteSwap32(u);

/// Convert byte array to hex string using the convert package.
String bytesToHex(Uint8List bytes) {
  return convert.hex.encode(bytes);
}

/// Convert hex string to byte array using the convert package.
Uint8List hexToBytes(String hexString) {
  if (hexString.length % 2 != 0) {
    throw RangeError(
      'hex string expected, got unpadded hex of length ${hexString.length}',
    );
  }
  return Uint8List.fromList(convert.hex.decode(hexString));
}

/// Yields to the Promise/microtask scheduler queue.
Future<void> nextTick() async {
  await Future.delayed(Duration.zero);
}

/// Returns control to the event loop every `tick` milliseconds to avoid blocking.
Future<void> asyncLoop(int iters, int tick, void Function(int) cb) async {
  final stopwatch = Stopwatch()..start();
  for (var i = 0; i < iters; i++) {
    cb(i);
    if (stopwatch.elapsedMilliseconds < tick) continue;
    await nextTick();
    stopwatch.reset();
  }
}

/// Converts string to bytes using UTF8 encoding.
Uint8List utf8ToBytes(String str) {
  return Uint8List.fromList(utf8.encode(str));
}

/// Helper for KDFs: consumes Uint8List or String.
Uint8List kdfInputToBytes(dynamic data, [String errorTitle = '']) {
  if (data is String) return utf8ToBytes(data);
  return abytes(data, title: errorTitle);
}

/// Copies several Uint8Lists into one.
Uint8List concatBytes(List<Uint8List> arrays) {
  final builder = BytesBuilder(copy: false);
  for (final arr in arrays) {
    builder.add(arr);
  }
  return builder.toBytes();
}

/// Dart doesn't have an exact equivalent to JS `Object.assign` for generic empty objects.
/// For config merging, returning a unified Map is usually the safest equivalent pattern.
Map<String, dynamic> checkOpts(
  Map<String, dynamic> defaults, [
  Map<String, dynamic>? opts,
]) {
  final merged = Map<String, dynamic>.from(defaults);
  if (opts != null) {
    merged.addAll(opts);
  }
  return merged;
}

// ============================================================================
// Hash Interfaces
// ============================================================================

/// Common interface for all hash instances.
abstract class Hash {
  int get blockLen;
  int get outputLen;
  bool get canXOF;

  Hash update(Uint8List buf);
  void digestInto(Uint8List buf);
  Uint8List digest();
  void destroy();
  Hash cloneInto([Hash? to]);
  Hash clone();
}

/// Pseudorandom generator interface.
abstract class PRG {
  void addEntropy(Uint8List seed);
  Uint8List randomBytes(int length);
  void clean();
}

/// XOF: streaming API to read digest in chunks.
abstract class HashXOF extends Hash {
  Uint8List xof(int bytes);
  Uint8List xofInto(Uint8List buf);
}

/// In Dart, a callable class replaces the TypeScript callable object `CHash`.
/// This acts as both the function `hash(msg)` and the factory `hash.create()`.
class CHash {
  final int outputLen;
  final int blockLen;
  final bool canXOF;
  final Hash Function() create;
  final Uint8List? oid;

  CHash({
    required this.outputLen,
    required this.blockLen,
    required this.canXOF,
    required this.create,
    this.oid,
  });

  /// Allows the class instance to be called like a function: `final digest = myHash(msg);`
  Uint8List call(Uint8List msg) {
    return create().update(msg).digest();
  }
}

/// Creates a callable hash function from a stateful class constructor.
CHash createHasher(Hash Function() hashCons, {Uint8List? oid}) {
  final tmp = hashCons();
  return CHash(
    outputLen: tmp.outputLen,
    blockLen: tmp.blockLen,
    canXOF: tmp.canXOF,
    create: hashCons,
    oid: oid,
  );
}

/// Cryptographically secure PRNG backed by `dart:math` SecureRandom.
Uint8List randomBytes([int bytesLength = 32]) {
  anumber(bytesLength, 'bytesLength');
  if (bytesLength > 65536) {
    throw RangeError('"bytesLength" expected <= 65536, got $bytesLength');
  }
  final random = Random.secure();
  final values = List<int>.generate(bytesLength, (i) => random.nextInt(256));
  return Uint8List.fromList(values);
}

/// Creates OID metadata for NIST hashes with prefix `06 09 60 86 48 01 65 03 04 02`.
Map<String, Uint8List> oidNist(int suffix) {
  return {
    'oid': Uint8List.fromList([
      0x06,
      0x09,
      0x60,
      0x86,
      0x48,
      0x01,
      0x65,
      0x03,
      0x04,
      0x02,
      suffix,
    ]),
  };
}

BigInt bytesToBigIntBE(List<int> val) {
  BigInt result = BigInt.zero;

  for (final byte in val) {
    // Shift the accumulated result left by 1 byte (8 bits)
    // and combine it with the new byte using bitwise OR.
    //
    // We use & 0xff as a safety net to ensure we are strictly
    // grabbing 8 unsigned bits, just in case a standard List<int>
    // sneaks in a negative value or something larger than 255.
    result = (result << 8) | BigInt.from(byte & 0xff);
  }

  return result;
}

Uint8List bigIntToBytesBE(BigInt val, [int length = 32]) {
  // Create an array of the exact requested length (defaults to all 0s)
  final result = Uint8List(length);
  var currentVal = val;

  // Populate backwards from the end of the array to index 0.
  // If the BigInt runs out of bytes (currentVal becomes 0), the remaining
  // indices at the start of the array simply remain 0, giving us perfect padding!
  for (var i = length - 1; i >= 0; i--) {
    result[i] = (currentVal & BigInt.from(0xff)).toInt();
    currentVal = currentVal >> 8;
  }

  return result;
}
