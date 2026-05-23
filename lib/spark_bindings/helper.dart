import 'dart:convert';
import 'dart:ffi' as ffi;
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

import '../native/spark_frost_bindings.dart';
import 'types.dart';

String readRustError(RustCallStatus status) {
  final buf = status.errorBuf;
  if (buf.data == ffi.nullptr || buf.len == 0) return "Unknown Rust Error";

  // Defensive Segfault Prevention:
  // If the length is absurd, the struct is misaligned and the pointer is poison.
  if (buf.len > 1000) {
    return "CRITICAL FFI ERROR: Error buffer length is ${buf.len}. Possible struct misalignment could cause this.";
  }

  // Safe to read the exact length
  final bytes = buf.data.asTypedList(buf.len);
  return utf8.decode(bytes, allowMalformed: true);
}

RustBuffer toRustBuffer(
  SafeArena arena,
  Uint8List bytes,
  SparkFrostBindings dylib,
) {
  final totalLen = 4 + bytes.length;

  // 1. Allocate the STRUCT in Dart's Arena (Dart safely frees this 24-byte shell)
  final passBuf = arena.allocate<RustBuffer>(
    ffi.sizeOf<RustBuffer>(),
    isSensitive: false,
  );

  // 2. CRITICAL: Ask RUST to allocate the payload memory!
  // We use rustbuffer_alloc so Rust owns it and can safely drop it later.
  final statusPtr = arena.allocate<RustCallStatus>(
    ffi.sizeOf<RustCallStatus>(),
    isSensitive: false,
  );
  final rustAllocatedBuf = dylib.ffi_spark_frost_rustbuffer_alloc(
    totalLen,
    statusPtr,
  );

  if (statusPtr.ref.code != 0) {
    throw Exception("Failed to allocate RustBuffer natively!");
  }

  // 3. Write your custom 4-byte prefix and the payload into the Rust-allocated memory
  final payloadMemory = rustAllocatedBuf.data;
  final byteData = ByteData.view(payloadMemory.asTypedList(totalLen).buffer);
  byteData.setInt32(0, bytes.length, Endian.big);
  payloadMemory.asTypedList(totalLen).setAll(4, bytes);

  passBuf.ref.capacity = rustAllocatedBuf.capacity;
  passBuf.ref.len = totalLen;
  passBuf.ref.data = rustAllocatedBuf.data;

  // Notice we DO NOT add this to arena.manageRustBuffer or mark it as sensitive.
  // Rust owns this memory and will automatically free it when the FFI call finishes.
  return passBuf.ref;
}

/// Reads the Rust payload, skipping the 4-byte prefix, doing a deep copy.
Uint8List fromRustBuffer(RustBuffer buf) {
  if (buf.data == ffi.nullptr || buf.len < 4) return Uint8List(0);
  final payload = returnUint8List(buf.data, buf.len);

  // we remove the first 4 bytes as they are the length of the envelope in little endian
  return payload.sublist(4);
}

dynamic arenaWrapper(Function(SafeArena arena) fun) {
  final arena = SafeArena();
  try {
    return fun(arena);
  } catch (e) {
    // ignore: avoid_print
    print("_arenaWrapper: function call failed. $e");
    return null;
  } finally {
    arena.releaseAll();
  }
}

class SafeArena {
  final Arena _internalArena = Arena();
  final List<ffi.Pointer> _sensitivePointers = [];
  final List<int> _sensitivePointersLength = [];
  final List<void Function()> _rustCleanups = []; // <-- Holds Rust teardowns

  /// Allocates Dart memory
  ffi.Pointer<T> allocate<T extends ffi.NativeType>(
    int byteCount, {
    bool isSensitive = true,
  }) {
    final ptr = _internalArena.allocate<T>(byteCount);
    if (isSensitive) {
      _sensitivePointers.add(ptr);
      _sensitivePointersLength.add(byteCount);
    }
    return ptr;
  }

  /// NEW: Registers a RustBuffer to be freed by Rust during teardown.
  void manageRustBuffer(RustBuffer buf, SparkFrostBindings dylib) {
    _rustCleanups.add(() {
      // Use raw malloc here because the Arena is in the middle of tearing down
      final status = malloc.allocate<RustCallStatus>(
        ffi.sizeOf<RustCallStatus>(),
      );
      dylib.ffi_spark_frost_rustbuffer_free(buf, status);
      malloc.free(status);
    });
  }

  void releaseAll() {
    // 1. Zero out sensitive Dart memory
    for (int i = 0; i < _sensitivePointers.length; i++) {
      final prt = _sensitivePointers[i];
      final length = _sensitivePointersLength[i];
      prt.cast<ffi.Uint8>().asTypedList(length).fillRange(0, length, 0);
    }

    // 2. Trigger all Rust buffer cleanups
    for (final cleanup in _rustCleanups) {
      cleanup();
    }

    // 3. Free Dart memory
    _internalArena.releaseAll();
  }
}

Uint8List returnUint8List(ffi.Pointer<ffi.Uint8> pointer, int length) {
  return Uint8List.fromList(List<int>.from(pointer.asTypedList(length)));
}

Uint8List encodeStatechainCommitments(
  Map<String, ISigningCommitment>? commitments,
) {
  final map = commitments ?? {};
  final builder = BytesBuilder();

  // 1. Map Size (4-bytes)
  final sizeBuf = ByteData(4)..setUint32(0, map.length, Endian.big);
  builder.add(sizeBuf.buffer.asUint8List());

  for (final entry in map.entries) {
    // 2. String Key
    final keyBytes = utf8.encode(entry.key);
    final keyLenBuf = ByteData(4)..setUint32(0, keyBytes.length, Endian.big);
    builder.add(keyLenBuf.buffer.asUint8List());
    builder.add(keyBytes);

    // 3. Value: 'hiding' (4-byte len + bytes)
    final hidingLen = ByteData(4)
      ..setUint32(0, entry.value.hiding.length, Endian.big);
    builder.add(hidingLen.buffer.asUint8List());
    builder.add(entry.value.hiding);

    // 4. Value: 'binding' (4-byte len + bytes)
    final bindingLen = ByteData(4)
      ..setUint32(0, entry.value.binding.length, Endian.big);
    builder.add(bindingLen.buffer.asUint8List());
    builder.add(entry.value.binding);
  }

  return builder.toBytes();
}

Uint8List encodeOptionalBytes(Uint8List? bytes) {
  if (bytes == null) {
    return Uint8List.fromList([0]); // 0x00 = None
  } else {
    final builder = BytesBuilder();
    builder.addByte(1); // 0x01 = Some

    // Now the actual ByteArray encoding (Len + Data)
    final len = ByteData(4)..setUint32(0, bytes.length, Endian.big);
    builder.add(len.buffer.asUint8List());
    builder.add(bytes);

    return builder.toBytes();
  }
}
