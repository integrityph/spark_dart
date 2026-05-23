// lib/spark_wallet/proto_hash.dart

import 'dart:convert';
import 'dart:typed_data';

import 'package:boringssl_ffi/boringssl_ffi.dart' as bssl;
import 'package:collection/collection.dart';
import 'package:convert/convert.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter/rendering.dart';
import 'package:protobuf/protobuf.dart';
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart';
import 'package:protobuf/well_known_types/google/protobuf/wrappers.pb.dart';
// import 'package:spark_dart/src/proto/google/protobuf/timestamp.pb.dart';
import 'package:spark_dart/src/proto/spark.pbenum.dart';
import 'package:spark_dart/src/proto/spark_token.pb.dart';

import 'proto_reflection.dart';

// Assuming you'll import your reflection helpers and crypto here
// import 'proto_reflection.dart';
// // import 'package:crypto/crypto.dart';

// ObjectHash type identifiers - must match protoreflecthash constants
const String boolIdentifier = "b";
const String mapIdentifier = "d";
const String floatIdentifier = "f";
const String intIdentifier = "i";
const String listIdentifier = "l";
const String byteIdentifier = "r";
const String unicodeIdentifier = "u";

class SkipFieldError implements Exception {
  final String message;
  SkipFieldError([this.message = "skip field"]);

  @override
  String toString() => message;
}

bool isGoogleProtobufValueNull(dynamic value) {
  if (value == null) return true;

  // In TS, ts-proto uses the `$case` property for OneOfs.
  // If you are passing in raw Maps (e.g., from JSON), this works perfectly:
  if (value is Map && value.containsKey(r'$case')) {
    final c = value[r'$case'] as String?;
    return c == null || c == "nullValue";
  }

  // NOTE: If `value` is a standard Dart Protobuf `Value` object, it won't be a Map.
  // You may need to uncomment and use the strongly-typed check below depending on your setup:
  /*
  if (value is Value) {
    return value.hasNullValue();
  }
  */

  return false;
}

const Set<String> topLevelDisallowed = {
  "google.protobuf.Value",
  "google.protobuf.ListValue",
  "google.protobuf.BoolValue",
  "google.protobuf.Int32Value",
  "google.protobuf.Int64Value",
  "google.protobuf.UInt32Value",
  "google.protobuf.UInt64Value",
  "google.protobuf.FloatValue",
  "google.protobuf.DoubleValue",
  "google.protobuf.StringValue",
  "google.protobuf.BytesValue",
};

class FieldHashEntry {
  final int number;
  final Uint8List khash;
  final Uint8List vhash;

  const FieldHashEntry({
    required this.number,
    required this.khash,
    required this.vhash,
  });
}

class _MapEntryHash {
  final Uint8List khash;
  final Uint8List vhash;
  _MapEntryHash(this.khash, this.vhash);
}

// Assuming identifiers and FieldHashEntry are already defined above...

/// Dart implementation of protoreflecthash for cross-language compatibility
class ProtoHasher {
  ProtoHasher();

  Future<Uint8List> hashProto(GeneratedMessage message) async {
    // PartialTokenTransaction x = PartialTokenTransaction();
    // debugPrint("SERIALIZED 1:: ${hex.encode(x.writeToBuffer())}");
    // Uint8List xHash = await _hashMessage(x);
    // debugPrint("SERIALIZED 1 HASH: ${hex.encode(xHash)}");

    // x.version = 1;
    // debugPrint("SERIALIZED 2: ${hex.encode(x.writeToBuffer())}");
    // xHash = await _hashMessage(x);
    // debugPrint("SERIALIZED 2 HASH: ${hex.encode(xHash)}");

    // TokenTransactionMetadata t = TokenTransactionMetadata();
    // final opPubKey = Uint8List.fromList(hex.decode("03dfbdff4b6332c220f8fa2ba8ed496c698ceada563fa01b67d9983bfc5c95e763"));
    // t.sparkOperatorIdentityPublicKeys.add(opPubKey);
    // t.network = Network.MAINNET;
    // t.clientCreatedTimestamp = Timestamp.fromDateTime(DateTime.parse("2026-01-01T01:01:01Z"));
    // t.validityDurationSeconds = $fixnum.Int64(5);
    // x.version = 1;
    // x.tokenTransactionMetadata = t;
    // debugPrint("SERIALIZED 3: ${hex.encode(x.writeToBuffer())}");
    // xHash = await _hashMessage(x);
    // debugPrint("SERIALIZED 3 HASH: ${hex.encode(xHash)}");

    // InvoiceAttachment inv = InvoiceAttachment();
    // inv.sparkInvoice = "spark1pgssxln7e7sdfkpml5u5rj54m3m8ke929xkecrwz9fmm3wux8ua2t83p5wzw73";
    // t.invoiceAttachments.add(inv);
    // x.version = 1;
    // x.tokenTransactionMetadata = t;
    // TokenTransferInput txIn = TokenTransferInput();
    // txIn.outputsToSpend.add(
    //   TokenOutputToSpend(
    //     prevTokenTransactionHash: hex.decode("7e7ecfa0d4d83bfd3941ca95dc767b64aa29ad9c0dc22a77b8bb863f3aa59e21"),
    //     prevTokenTransactionVout: 0,
    //   ),
    // );
    // x.transferInput = txIn;
    // debugPrint("SERIALIZED 4: ${hex.encode(x.writeToBuffer())}");
    // xHash = await _hashMessage(x);
    // debugPrint("SERIALIZED 4 HASH: ${hex.encode(xHash)}");

    // PartialTokenOutput txOut0 = PartialTokenOutput();
    // txOut0.ownerPublicKey = hex.decode("037e7ecfa0d4d83bfd3941ca95dc767b64aa29ad9c0dc22a77b8bb863f3aa59e21");
    // txOut0.withdrawBondSats = $fixnum.Int64(100000);
    // txOut0.withdrawRelativeBlockLocktime = $fixnum.Int64(1000);
    // txOut0.tokenIdentifier = hex.decode("3206c93b24a4d18ea19d0a9a213204af2c7e74a6d16c7535cc5d33eca4ad1eca");
    // txOut0.tokenAmount = List.filled(16, 0)..[0]=15;
    // x.partialTokenOutputs.add(txOut0);
    // debugPrint("SERIALIZED 5: ${hex.encode(x.writeToBuffer())}");
    // xHash = await _hashMessage(x);
    // debugPrint("SERIALIZED 5 HASH: ${hex.encode(xHash)}");

    // x.executeBefore = Timestamp.fromDateTime(DateTime.parse("2026-01-01T02:02:02"));
    // debugPrint("SERIALIZED 6: ${hex.encode(x.writeToBuffer())}");
    // xHash = await _hashMessage(x);
    // debugPrint("SERIALIZED 6 HASH: ${hex.encode(xHash)}");


    // debugPrint("SERIALIZED: (${x.runtimeType}): ${hex.encode(message.writeToBuffer())}");
    final hash = await _hashMessage(message);
    // debugPrint("SERIALIZED HASH: ${hex.encode(hash)}");

    // throw Exception("STOP HERE");
    return hash;
  }

  Future<Uint8List> _hashMessage(
    dynamic message, 
    //[String? messageTypeName,]
  ) async {
    if (message is Timestamp) {
         
      // In the Timestamp proto definition:
      // Tag 1 is seconds (Int64)
      // Tag 2 is nanos (int32)
      final seconds = message.getField(1); 
      final nanos = message.getField(2);

      // Await them if your hashInt64 is async (like _hashFieldValue was)
      // Note: seconds is already an Int64. nanos is an int.
      final secHash = hashInt64(seconds);
      final nanoHash = hashInt64(nanos);

      final buffer = Uint8List(secHash.length + nanoHash.length);
      buffer.setAll(0, secHash);
      buffer.setAll(secHash.length, nanoHash);

      return hash(listIdentifier, buffer);
    }

    if (message == null) {
      throw Exception("cannot hash nil message");
    }

    final fieldHashes = <FieldHashEntry>[];

    // Hash each field that is present
    final protoMessage = message as GeneratedMessage;
    for (final f in protoMessage.info_.byIndex) {
      
      final int fieldNumber = f.tagNumber;

      final String fieldName = f.name;  // this is here for debugging purposes only
      final int fieldType = f.type;
      final dynamic fieldValue = protoMessage.getField(fieldNumber);
      final dynamic defaultFieldValue = protoMessage.getDefaultForField(fieldNumber);

      debugPrint("Pre-Processing field: fieldNumber:$fieldNumber, fieldName:$fieldName, fieldType:$fieldType, fieldValue:$fieldValue, defaultFieldValue:$defaultFieldValue");
    
      // Check if field is present (has a value)
      if (isDefault(fieldValue, fieldType, defaultFieldValue)) {
      // if (fieldValue == defaultFieldValue) {
        continue;
      }

      final khash = await _hashFieldKey(fieldNumber);

      Uint8List? vhash;
      try {
        vhash = await _hashFieldValue(f, fieldValue);
      } on SkipFieldError catch (_) {
        // Omit this field entirely
        continue;
      }

      debugPrint("Processing field: fieldNumber:$fieldNumber, fieldName:$fieldName, fieldType:$fieldType, fieldValue:$fieldValue");

      fieldHashes.add(
        FieldHashEntry(number: fieldNumber, khash: khash, vhash: vhash),
      );
    }

    debugPrint("FIEEELDS: ${fieldHashes.length}}");

    // Sort by field number for deterministic ordering
    fieldHashes.sort((a, b) => a.number.compareTo(b.number));

    // Concatenate all field hashes
    final totalLength = fieldHashes.fold<int>(
      0,
      (sum, fh) => sum + fh.khash.length + fh.vhash.length,
    );

    final buffer = Uint8List(totalLength);
    int offset = 0;

    for (final fh in fieldHashes) {
      buffer.setAll(offset, fh.khash);
      offset += fh.khash.length;
      buffer.setAll(offset, fh.vhash);
      offset += fh.vhash.length;
    }

    // Always use map identifier
    return hash(mapIdentifier, buffer);
  }

  Future<Uint8List> _hashFieldKey(int fieldNumber) async {
    return hashInt64(fieldNumber);
  }

  Future<Uint8List> _hashFieldValue(FieldInfo f, dynamic value) async {
    // 1. Handle Maps
    if (f.isMapField) {
      // Safely cast to MapFieldInfo to get the key and value types
      final mapInfo = f as MapFieldInfo;
      
      // We pass the raw integers to hashMap!
      return await hashMap(mapInfo.keyFieldType, mapInfo.valueFieldType, value as Map);
    }

    // 2. Handle Repeated Lists
    if (f.isRepeated) {
      // f.type is an int that contains the base type + the repeated flag.
      // Your _hashValue already safely masks out the flag, so we just pass f.type!
      return await hashList(f.type, value as List);
    }

    // 3. Handle Primitives and Messages
    return await _hashValue(f.type, value);
  }

  // Future<Uint8List> _hashFieldValue(int fieldType, dynamic value) async {
  //   // Handle repeated fields explicitly
  //   // Assumes fieldType is represented as a Map descriptor here
  //   if (fieldType is Map && fieldType['type'] == "repeated" && value is List) {
  //     final elementType = fieldType['elementType'] ?? fieldType;
  //     return await hashList(elementType, value);
  //   }

  //   if (isMapType(fieldType)) {
  //     return await hashMap(fieldType, value);
  //   }

  //   return await _hashValue(fieldType, value);
  // }

  /// Safely attempts to pull a field by name.
  /// Replaces the JS `message[fieldName]` dynamic lookup.
  dynamic _resolveDynamicField(dynamic message, String fieldName) {
    if (message is Map) {
      return message[fieldName];
    }
    // Note: If you are using standard Dart `GeneratedMessage` protobufs,
    // you might need to use reflection here, e.g., message.getField(...)
    // Currently throwing a polite reminder just in case!
    throw UnimplementedError(
      "Implement Protobuf reflection getter for: $fieldName",
    );
  }

  Future<Uint8List> _hashValue(int pbFieldType, dynamic value) async {
    // Strip REQUIRED (1), REPEATED (2), and PACKED (4) flags.
    // This leaves ONLY the pure type bit (e.g., 0x200000 for Message).
    final baseType = pbFieldType & ~0x7;

    switch (baseType) {
      case PbFieldType.OB: // bool (0x10)
        return hashBool(value as bool);
        
      case PbFieldType.OE: // enum (0x200)
        return hashInt64((value as ProtobufEnum).value);
        
      case PbFieldType.O3: // int32
      case PbFieldType.O6: // int64
      case PbFieldType.OS3: // sint32
      case PbFieldType.OS6: // sint64
      case PbFieldType.OSF3: // sfixed32
      case PbFieldType.OSF6: // sfixed64
        return hashInt64(value);
        
      case PbFieldType.OU3: // uint32
      case PbFieldType.OU6: // uint64
      case PbFieldType.OF3: // fixed32
      case PbFieldType.OF6: // fixed64
        return hashUint64(value);
        
      case PbFieldType.OF: // float
      case PbFieldType.OD: // double
        return hashFloat((value as num).toDouble());
        
      case PbFieldType.OS: // string
        return hashUnicode(value as String);
        
      case PbFieldType.OY: // bytes
        if (value is Uint8List) return hashBytes(value);
        return hashBytes(Uint8List.fromList(value as List<int>));
        
      case PbFieldType.OM: // message (0x200000)
        return await _hashMessage(value as GeneratedMessage);
        
      case PbFieldType.OG: // group
        throw Exception("Group fields not supported");
        
      default:
        debugPrint("Unknown PbFieldType constant $baseType value: ${value} and runtime type is: ${value.runtimeType}");
        throw Exception("Unknown base type: $baseType (from pbFieldType: $pbFieldType)");
    }
  }

  // Future<Uint8List> _hashValue(dynamic fieldType, dynamic value) async {
  //   final typeName = getTypeName(fieldType).toLowerCase();

  //   if (value is $fixnum.Int64) {
  //     return hashInt64(BigInt.parse(value.toString()));
  //   } else if (value is ProtobufEnum) {
  //     return hashInt64(value.value);
  //   }

  //   switch (typeName) {
  //     case "bool":
  //       return hashBool(value as bool);
  //     case "int32":
  //     case "int64":
  //     case "sint32":
  //     case "sint64":
  //     case "sfixed32":
  //     case "sfixed64":
  //       return hashInt64(value);
  //     case "uint32":
  //     case "uint64":
  //     case "fixed32":
  //     case "fixed64":
  //       return hashUint64(value);
  //     case "float":
  //     case "double":
  //       // Dart handles TS 'number' as int or double; cast to num to safely get double
  //       return hashFloat((value as num).toDouble());
  //     case "string":
  //       return hashUnicode(value as String);
  //     case "bytes":
  //       return hashBytes(Uint8List.fromList(value as List<int>));
  //     case "message":
  //       debugPrint("This is a message ($typeName): ${value}, ${value.runtimeType}");
  //       // Catch enums that were misclassified as messages because they possess a typeName
  //       if (fieldType is Map && fieldType['typeName'] != null) {
  //         return await _hashMessage(value, fieldType['typeName'] as String);
  //       }
  //       return await _hashMessage(value);
  //     case "oneof":
  //       return await _hashOneof(value);
  //     default:
  //       // Handle enums as integers
  //       if (value is ProtobufEnum) {
  //         return hashInt64(value.value); // .value gets the integer
  //       }
  //       if (value is int) { // Keep just in case you manually pass an int
  //         return hashInt64(value);
  //       }
  //       throw Exception("Unsupported field type: $typeName");
  //   }
  // }

  Future<Uint8List> _hashOneof(dynamic oneofValue) async {
    // For protoc-gen-ts_proto generated types (or JSON maps representing them),
    // oneof is represented as: { $case: "fieldName", fieldName: actualValue }
    if (oneofValue is Map && oneofValue.containsKey(r'$case')) {
      final activeCase = oneofValue[r'$case'];
      final activeValue = oneofValue[activeCase];

      if (activeValue != null) {
        // Hash the active field's value as a message field
        return await _hashMessage(activeValue);
      }
    }

    // If no active case, this oneof is effectively unset and should not be hashed here.
    // Callers shouldn't pass unpopulated oneofs to hashing; treat as invalid input.
    throw Exception("invalid oneof: no active value");
  }

  // Future<Uint8List> hashList(dynamic elementType, List<dynamic> list) async {
  //   // Empty list is default-equivalent: skip this field entirely
  //   if (list.isEmpty) {
  //     throw SkipFieldError();
  //   }

  //   final hashes = <Uint8List>[];

  //   // If element type is google.protobuf.Value, disallow null elements
  //   final isValueList =
  //       elementType is Map &&
  //       elementType['typeName'] == "google.protobuf.Value";

  //   for (final item in list) {
  //     if (isValueList && isGoogleProtobufValueNull(item)) {
  //       throw Exception("cannot hash nil value");
  //     }
  //     final itemHash = await _hashValue(elementType, item);
  //     hashes.add(itemHash);
  //   }

  //   // Concatenate all item hashes
  //   final totalLength = hashes.fold<int>(0, (sum, h) => sum + h.length);
  //   final buffer = Uint8List(totalLength);
  //   int offset = 0;

  //   for (final h in hashes) {
  //     buffer.setAll(offset, h);
  //     offset += h.length;
  //   }

  //   return hash(listIdentifier, buffer);
  // }

  Future<Uint8List> hashList(int elementType, List<dynamic> list) async {
    // Empty list is default-equivalent: skip this field entirely
    if (list.isEmpty) {
      throw SkipFieldError();
    }

    final hashes = <Uint8List>[];

    // Extract the base type just like we did in hashMap and isDefault
    final baseElementType = elementType & ~PbFieldType.PM;

    for (final item in list) {
      // Native check for google.protobuf.Value nulls
      // We perfectly mirror Go's error handling for nil list items
      if (baseElementType == PbFieldType.OM && item is GeneratedMessage) {
        if (item.info_.qualifiedMessageName == "google.protobuf.Value") {
          if (isGoogleProtobufValueNull(item)) {
            throw Exception("cannot hash nil value");
          }
        }
      }

      // Route the item directly to _hashValue using the native integer type!
      final itemHash = await _hashValue(elementType, item);
      hashes.add(itemHash);
    }

    // Concatenate all item hashes
    final totalLength = hashes.fold<int>(0, (sum, h) => sum + h.length);
    final buffer = Uint8List(totalLength);
    int offset = 0;

    for (final h in hashes) {
      buffer.setAll(offset, h);
      offset += h.length;
    }

    return hash(listIdentifier, buffer);
  }

  // Future<Uint8List> hashMap(dynamic fieldType, Map<String, dynamic> map) {
  //   final entries = <_MapEntryHash>[];

  //   final valueIsGoogleValue =
  //       fieldType is Map &&
  //       fieldType['valueType'] is Map &&
  //       fieldType['valueType']['typeName'] == "google.protobuf.Value";

  //   for (final entry in map.entries) {
  //     final key = entry.key;
  //     final value = entry.value;

  //     // Skip entries where the VALUE is google.protobuf.Value set to null
  //     if (valueIsGoogleValue && isGoogleProtobufValueNull(value)) {
  //       continue;
  //     }

  //     // Safe access assuming fieldType is a descriptor Map
  //     final khash = await _hashValue(fieldType['keyType'], key);

  //     Uint8List vhash;
  //     try {
  //       vhash = await _hashValue(fieldType['valueType'], value);
  //     } on SkipFieldError catch (_) {
  //       // If nested hashing signaled default-equivalence (e.g., empty list), skip this entry
  //       continue;
  //     }

  //     entries.add(_MapEntryHash(khash, vhash));
  //   }

  //   // If, after skipping, no effective entries remain, skip the map field entirely
  //   if (entries.isEmpty) {
  //     throw SkipFieldError();
  //   }

  //   // Sort by key hash for deterministic ordering
  //   entries.sort((a, b) => compareBytes(a.khash, b.khash));

  //   // Concatenate all entry hashes
  //   final totalLength = entries.fold<int>(
  //     0,
  //     (sum, e) => sum + e.khash.length + e.vhash.length,
  //   );
  //   final buffer = Uint8List(totalLength);
  //   int offset = 0;

  //   for (final entry in entries) {
  //     buffer.setAll(offset, entry.khash);
  //     offset += entry.khash.length;
  //     buffer.setAll(offset, entry.vhash);
  //     offset += entry.vhash.length;
  //   }

  //   return hash(mapIdentifier, buffer);
  // }

  Future<Uint8List> hashMap(int keyType, int valueType, Map<dynamic, dynamic> map) async {
    final entries = <_MapEntryHash>[];

    // Extract the base type for the value to check for message types
    final baseValueType = valueType & ~PbFieldType.PM;

    for (final entry in map.entries) {
      final key = entry.key;
      final value = entry.value;

      // Skip entries where the VALUE is google.protobuf.Value set to null
      // We perfectly mirror Go's fd.Kind() == MessageKind && fd.Message().FullName() ...
      if (baseValueType == PbFieldType.OM && value is GeneratedMessage) {
        if (value.info_.qualifiedMessageName == "google.protobuf.Value") {
          if (isGoogleProtobufValueNull(value)) {
            continue;
          }
        }
      }

      // Hash the key using its native integer type
      final khash = await _hashValue(keyType, key);

      Uint8List vhash;
      try {
        // Hash the value using its native integer type
        vhash = await _hashValue(valueType, value);
      } on SkipFieldError catch (_) {
        // If nested hashing signaled default-equivalence (e.g., empty list), skip this entry
        continue;
      }

      entries.add(_MapEntryHash(khash, vhash));
    }

    // If, after skipping, no effective entries remain, skip the map field entirely
    if (entries.isEmpty) {
      throw SkipFieldError();
    }

    // Sort by key hash for deterministic ordering
    entries.sort((a, b) => compareBytes(a.khash, b.khash));

    // Concatenate all entry hashes
    final totalLength = entries.fold<int>(
      0,
      (sum, e) => sum + e.khash.length + e.vhash.length,
    );
    final buffer = Uint8List(totalLength);
    int offset = 0;

    for (final entry in entries) {
      buffer.setAll(offset, entry.khash);
      offset += entry.khash.length;
      buffer.setAll(offset, entry.vhash);
      offset += entry.vhash.length;
    }

    return hash(mapIdentifier, buffer);
  }

  // Basic hash functions following objecthash spec
  Uint8List hashBool(bool value) {
    final bytes = Uint8List.fromList(value ? [49] : [48]); // "1" or "0"
    return hash(boolIdentifier, bytes);
  }

  Uint8List hashInt64(dynamic value) {
    final b = encodeInt64BigEndian(value);
    return hash(intIdentifier, b);
  }

  Uint8List hashUint64(dynamic value) {
    final b = encodeUint64BigEndian(value);
    return hash(intIdentifier, b);
  }

  Uint8List hashFloat(double value) {
    // Normalize -0.0 to +0.0
    double f = (value == 0.0 && value.isNegative) ? 0.0 : value;
    // Use a canonical NaN representation by forcing to NaN when NaN
    if (f.isNaN) {
      f = double.nan;
    }

    final bytes = ByteData(8)..setFloat64(0, f, Endian.big);
    return hash(floatIdentifier, bytes.buffer.asUint8List());
  }

  Uint8List hashUnicode(String value) {
    return hash(unicodeIdentifier, Uint8List.fromList(utf8.encode(value)));
  }

  Uint8List hashBytes(Uint8List value) {
    return hash(byteIdentifier, value);
  }

  // Note: No NIL hashing here. Nil/undefined should never be hashed and will error.

  Uint8List hash(String typeIdentifier, Uint8List data) {
    final typeIdentifierBytes = utf8.encode(typeIdentifier);
    final concatenatedData = <int>[...typeIdentifierBytes, ...data];
    return Uint8List.fromList(bssl.sha256.hash(concatenatedData)!);
  }

  // Generic protobuf field introspection using real protobuf field numbers
  // Map<int, dynamic> getMessageFields(
  //   GeneratedMessage message, [
  //   String? messageTypeName,
  // ]) {
  //   final fields = <int, dynamic>{};

  //   // Use descriptor-based numbers when a message type name is provided.
  //   // Assumes getFieldNumbers and getFieldMeta are defined elsewhere and return Map<String, dynamic>
  //   // final Map<String, int> reflectionNumbers = messageTypeName != null
  //   //     ? getFieldNumbers(messageTypeName)
  //   //     : {};
  //   // final Map<String, FieldMeta> fieldMeta = messageTypeName != null
  //   //     ? getFieldMeta(messageTypeName)
  //   //     : {};

  //   // print("reflectionNumbers ${reflectionNumbers}");

  //   String camelToSnake(String name) {
  //     return name
  //         .replaceAllMapped(RegExp(r'([A-Z])'), (m) => '_${m.group(1)}')
  //         .replaceFirst(RegExp(r'^_'), '')
  //         .toLowerCase();
  //   }

  //   // Track used field numbers to avoid conflicts
  //   final usedTags = <int>{};
  //   List<FieldInfo<dynamic>> fieldList = message.info_.byIndex.toList();

  //   for (final f in fieldList) {
  //     final fieldName = f.name;
  //     final tag = f.tagNumber;
  //     if (!message.hasField(tag)) {
  //       // Repeated fields return false for hasField, so we check if the list is empty
  //       if (f.isRepeated) {
  //         final list = message.getField(tag) as List;
  //         if (list.isEmpty) continue;
  //       } else {
  //         continue; // It's a standard scalar/message that is genuinely unset
  //       }
  //     }
  //     dynamic value = message.getFieldOrNull(tag);

  //     // Handle oneof fields specially
  //     if (isOneofField(value)) {
  //       final oneofInfo = extractOneofField(
  //         fieldName,
  //         value,
  //         reflectionNumbers,
  //       );
  //       if (oneofInfo != null) {
  //         final actualFieldNumber = oneofInfo['actualFieldNumber'] as int;
  //         final actualFieldName = oneofInfo['actualFieldName'] as String;
  //         final actualValue = oneofInfo['actualValue'];

  //         usedTags.add(actualFieldNumber);

  //         final snakeCase = camelToSnake(actualFieldName);
  //         final meta = fieldMeta[snakeCase];
  //         final nestedTypeName = meta?.typeName;
  //         final inferred = inferFieldType(actualValue);

  //         final typeWithHint = nestedTypeName != null
  //             ? {"type": "message", "typeName": nestedTypeName}
  //             : inferred;

  //         fields[actualFieldNumber] = {
  //           "name": actualFieldName,
  //           "type": typeWithHint,
  //           "protoType": null, // TODO !!!!!!!
  //           "value": actualValue,
  //         };
  //       }
  //       continue;
  //     }

  //     usedTags.add(tag);

  //     if (value != null) {
  //       // final snakeCase = camelToSnake(fieldName);
  //       // final meta = fieldMeta[snakeCase];
  //       final bool isRepeated = f.isRepeated; // meta?.repeated == true;
  //       final int fieldType = f.type; // meta?.type;
  //       final nestedTypeName = meta?.typeName;

  //       // Build the field type descriptor
  //       dynamic typeDescriptor;
  //       if (isRepeated && value is List) {
  //         // For repeated fields, create a descriptor with element type info
  //         final elementType = protoTypeToFieldType(fieldType, nestedTypeName);
  //         typeDescriptor = {"type": "repeated", "elementType": elementType};
  //       } else if (nestedTypeName != null) {
  //         typeDescriptor = {"type": "message", "typeName": nestedTypeName};
  //       } else {
  //         typeDescriptor = inferFieldType(value);
  //       }

  //       // if (value is ProtobufEnum) { // typeEnum = 14
  //       //   value = (value as ProtobufEnum).value;
  //       // }

  //       fields[tag] = {
  //         "name": fieldName,
  //         "type": typeDescriptor,
  //         "protoType": f.type,
  //         "value": value,
  //       };
  //     }
  //   }

  //   if (fields.isEmpty) {
  //     final dbgReflectionKeys = reflectionNumbers.keys.toList();
  //     print(
  //       "proto-hash: no fields found. "
  //       "messageTypeName: $messageTypeName, "
  //       "reflectionKeys: $dbgReflectionKeys, "
  //       "messageKeys: ${fieldList.map((v)=>v.name)}",
  //     );
  //     throw Exception(
  //       "No fields found in message (missing or invalid messageTypeName)",
  //     );
  //   }

  //   debugPrint("getFields.fields: ${fields.toString().replaceAll("\n", "")}");

  //   return fields;
  // }

  dynamic protoTypeToFieldType(int? protoType, [String? typeName]) {
    const typeDouble = 1;
    const typeFloat = 2;
    const typeInt64 = 3;
    const typeUint64 = 4;
    const typeInt32 = 5;
    const typeFixed64 = 6;
    const typeFixed32 = 7;
    const typeBool = 8;
    const typeString = 9;
    const typeMessage = 11;
    const typeBytes = 12;
    const typeUint32 = 13;
    const typeEnum = 14;
    const typeSfixed32 = 15;
    const typeSfixed64 = 16;
    const typeSint32 = 17;
    const typeSint64 = 18;

    switch (protoType) {
      case typeDouble:
        return "double";
      case typeFloat:
        return "float";
      case typeInt64:
        return "int64";
      case typeUint64:
        return "uint64";
      case typeInt32:
        return "int32";
      case typeFixed64:
        return "fixed64";
      case typeFixed32:
        return "fixed32";
      case typeBool:
        return "bool";
      case typeString:
        return "string";
      case typeMessage:
        return typeName != null
            ? {"type": "message", "typeName": typeName}
            : "message";
      case typeBytes:
        return "bytes";
      case typeUint32:
        return "uint32";
      case typeEnum:
        return "int32"; // Enums are handled as int32
      case typeSfixed32:
        return "sfixed32";
      case typeSfixed64:
        return "sfixed64";
      case typeSint32:
        return "sint32";
      case typeSint64:
        return "sint64";
      default:
        return "unknown";
    }
  }

  bool isOneofField(dynamic value) {
    return value != null &&
        value is Map &&
        value.containsKey(r'$case') &&
        value[r'$case'] is String;
  }

  Map<String, dynamic>? extractOneofField(
    String fieldName,
    dynamic value,
    Map<String, dynamic> reflectionNumbers,
  ) {
    if (value == null || value is! Map || !value.containsKey(r'$case')) {
      return null;
    }

    final actualFieldName = value[r'$case'] as String;
    final actualValue = value[actualFieldName];

    final snake = actualFieldName
        .replaceAllMapped(RegExp(r'([A-Z])'), (m) => '_${m.group(1)}')
        .replaceFirst(RegExp(r'^_'), '')
        .toLowerCase();

    final actualFieldNumber = reflectionNumbers[snake] as int?;
    if (actualFieldNumber == null) {
      return null;
    }

    return {
      'actualFieldNumber': actualFieldNumber,
      'actualFieldName': actualFieldName,
      'actualValue': actualValue,
    };
  }

  String inferFieldType(dynamic value) {
    if (value is bool) return "bool";

    if (value is $fixnum.Int64) {
      // If you don't know whether it's int64 or uint64 purely from the value,
      // this is a risk. This is why using the schema (fi.type) is safer.
      return "int64"; // Or you need a way to know it's a uint64!
    }

    if (value is ProtobufEnum) {
      return "int32"; 
    }

    if (value is num) {
      if (value is int && value >= 0) {
        if (value <= 0xffffffff) {
          return "uint32";
        } else {
          return "uint64";
        }
      }
      return "int64";
    }

    if (value is BigInt) return "uint64";
    if (value is String) return "string";
    if (value is Uint8List) return "bytes";
    if (value is List) return "list";
    if (value is Object) return "message";

    return "unknown";
  }

  // bool isDefault(dynamic value, int fieldType) {
  //   if (value == null) {
  //     return true;
  //   }

  //   if (getTypeName(fieldType) == "message" &&
  //       fieldType is Map &&
  //       fieldType['typeName'] == "google.protobuf.Value") {
  //     if (isGoogleProtobufValueNull(value)) return true;
  //   }

  //   if (value is List) {
  //     return value.isEmpty;
  //   }

  //   if (isMapType(fieldType) && value is Map) {
  //     return value.isEmpty;
  //   }

  //   switch (getTypeName(fieldType)) {
  //     case "bool":
  //       return value == false;
  //     case "int32":
  //     case "int64":
  //     case "sint32":
  //     case "sint64":
  //     case "sfixed32":
  //     case "sfixed64":
  //     case "uint32":
  //     case "uint64":
  //     case "fixed32":
  //     case "fixed64":
  //       return value == 0 || (value is BigInt && value == BigInt.zero);
  //     case "float":
  //     case "double":
  //       return value == 0 || value == 0.0;
  //     case "string":
  //       return (value as String).isEmpty;
  //     case "bytes":
  //       return (value as Uint8List).isEmpty;
  //     default:
  //       if (value is num) {
  //         return value == 0;
  //       }
  //   }
  //   return false;
  // }

  bool isDefault(dynamic value, int pbFieldType, dynamic defaultValue) {
    if (value == null) {
      return true;
    }

    // 1. Collections
    // In Dart, repeated fields and maps instantiate as empty Lists/Maps.
    if (value is List) {
      return value.isEmpty;
    }
    try {
      return value == defaultValue;
    } catch(_){}

    // Extract the base type just like we did in _hashValue
    final baseType = pbFieldType & ~PbFieldType.PM;

    // 2. Special case for google.protobuf.Value containing NULL
    if (baseType == PbFieldType.OM && value is GeneratedMessage) {
      if (value.info_.qualifiedMessageName == "google.protobuf.Value") {
        if (isGoogleProtobufValueNull(value)) return true;
      }
      // Standard Messages are never considered default when present
      final equal =  ListEquality().equals(value.writeToBuffer(), (defaultValue as GeneratedMessage).writeToBuffer());
      debugPrint("messages are equal: $equal, 1: ${hex.encode(value.writeToBuffer())} 2: ${hex.encode(defaultValue.writeToBuffer())}");
      return equal;
    }

    // Group fields are never considered default when present
    if (baseType == PbFieldType.OG) {
      return false;
    }

    if (value is Timestamp) {
      return !value.isInitialized();
    }

    // 3. Primitives
    switch (baseType) {
      case PbFieldType.OB: // bool
        return value == false;

      case PbFieldType.OE: // enum
        if (value is ProtobufEnum) {
          return value.value == 0;
        }
        if (value is int) {
          return value == 0;
        }
        return false;

      case PbFieldType.O3: // int32
      case PbFieldType.O6: // int64
      case PbFieldType.OS3: // sint32
      case PbFieldType.OS6: // sint64
      case PbFieldType.OSF3: // sfixed32
      case PbFieldType.OSF6: // sfixed64
      case PbFieldType.OU3: // uint32
      case PbFieldType.OU6: // uint64
      case PbFieldType.OF3: // fixed32
      case PbFieldType.OF6: // fixed64
        if (value is $fixnum.Int64) {
          return value == $fixnum.Int64.ZERO; // Catch fixnum 0
        }
        if (value is BigInt) {
          return value == BigInt.zero; // Catch BigInt 0
        }
        return value == 0; // Catch standard int 0

      case PbFieldType.OF: // float
      case PbFieldType.OD: // double
        return value == 0 || value == 0.0;

      case PbFieldType.OS: // string
        return (value as String).isEmpty;

      case PbFieldType.OY: // bytes
        if (value is Uint8List) {
          return value.isEmpty;
        } else if (value is List<int>) {
          return value.isEmpty;
        }
        return false;

      default:
        if (value is num) {
          return value == 0;
        }
        return false;
    }
  }

  String getTypeName(dynamic fieldType) {
    if (fieldType is String) {
      return fieldType;
    }
    if (fieldType is Map) {
      if (fieldType['type'] != null) {
        return fieldType['type'] as String;
      }
      if (fieldType['resolvedType'] != null) {
        return "message";
      }
    }
    return "unknown";
  }

  // String getMessageFullName(dynamic message) {
  //   if (message == null) return "protobuf.Message";

  //   // Mimics message?.constructor?.name
  //   final constructorName = message.runtimeType.toString();

  //   // Ignore internal map types or generic Objects to fallback gracefully
  //   if (constructorName != "Object" &&
  //       !constructorName.contains("Map<") &&
  //       !constructorName.startsWith("_")) {
  //     return constructorName;
  //   }
  //   return "protobuf.Message";
  // }

  // bool isMapType(dynamic fieldType) {
  //   if (fieldType is Map) {
  //     return fieldType['map'] == true ||
  //         (fieldType['keyType'] != null && fieldType['valueType'] != null);
  //   }
  //   return false;
  // }

  bool isProto3(GeneratedMessage message) {
    return true; // Assume proto3 for now
  }

  int compareBytes(Uint8List a, Uint8List b) {
    final minLength = a.length < b.length ? a.length : b.length;
    for (int i = 0; i < minLength; i++) {
      final aVal = a[i];
      final bVal = b[i];
      if (aVal != bVal) {
        return aVal - bVal;
      }
    }
    return a.length - b.length;
  }

  String floatNormalize(double originalFloat) {
    // In JS/Dart `0.0 == -0.0` evaluates to true, catching both here
    if (originalFloat == 0.0) {
      return "+0:";
    }

    double f = originalFloat;
    String s = "+";
    if (f < 0) {
      s = "-";
      f = -f;
    }

    int e = 0;
    while (f > 1) {
      f /= 2;
      e++;
    }
    while (f <= 0.5) {
      f *= 2;
      e--;
    }

    s += "$e:";
    if (f > 1 || f <= 0.5) {
      throw Exception("Could not normalize float: $originalFloat");
    }

    while (f != 0) {
      if (f >= 1) {
        s += "1";
        f--;
      } else {
        s += "0";
      }
      if (f >= 1) {
        throw Exception("Could not normalize float: $originalFloat");
      }
      if (s.length >= 1000) {
        throw Exception("Could not normalize float: $originalFloat");
      }
      f *= 2;
    }
    return s;
  }

  Uint8List encodeUint64BigEndian(dynamic value) {
    BigInt v;
    if (value is BigInt) {
      v = value;
    } else if (value is num) {
      // Dart int is effectively 64-bit on native, matching BigInt behavior closely.
      v = BigInt.from(value.truncate());
    } else if (value is $fixnum.Int64) {
      v = BigInt.parse(value.toString());
    } else {
      throw Exception("encodeUint64BigEndian unknown type ${value.runtimeType}");
      // v = BigInt.zero;
    }

    final out = Uint8List(8);
    final mask8Bit = BigInt.from(0xff);

    for (int i = 7; i >= 0; i--) {
      out[i] = (v & mask8Bit).toInt();
      v = v >> 8;
    }
    return out;
  }

  Uint8List encodeInt64BigEndian(dynamic value) {
    BigInt v;
    if (value is BigInt) {
      v = value;
    } else if (value is num) {
      v = BigInt.from(value.truncate());
    } else if (value is $fixnum.Int64) {
      v = BigInt.parse(value.toString());
    } else {
      throw Exception("encodeInt64BigEndian unknown type ${value.runtimeType}");
      // v = BigInt.zero;
    }

    final mask = (BigInt.one << 64) - BigInt.one;
    if (v < BigInt.zero) {
      v = v & mask;
    }

    final out = Uint8List(8);
    final mask8Bit = BigInt.from(0xff);

    for (int i = 7; i >= 0; i--) {
      out[i] = (v & mask8Bit).toInt();
      v = v >> 8;
    }
    return out;
  }
}

/// Create a new ProtoHasher instance
ProtoHasher createProtoHasher() {
  return ProtoHasher();
}

/// Hash a protobuf message with default options
Future<Uint8List> hashProto(GeneratedMessage message) async {
  final hasher = ProtoHasher();
  return await hasher.hashProto(message);
}