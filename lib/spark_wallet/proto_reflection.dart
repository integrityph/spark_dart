// lib/spark_wallet/proto_reflection.dart

import 'dart:typed_data';

// Import your compiled Spark descriptors and Google's descriptor protos.
// Adjust these import paths to match your actual structure!
import '../src/proto/google/protobuf/descriptor.pb.dart';
import 'proto_descriptors.dart'; // getSparkDescriptorBytes()

class _ProtoRegistry {
  final FileDescriptorSet descriptorSet;
  final Map<String, FileDescriptorProto> fileMap;
  final Map<String, DescriptorProto> messageMap;

  _ProtoRegistry({
    required this.descriptorSet,
    required this.fileMap,
    required this.messageMap,
  });
}

class FieldMeta {
  final int number;
  final int? oneofIndex;
  final String? typeName;
  final bool? repeated;
  final int? type;

  const FieldMeta({
    required this.number,
    this.oneofIndex,
    this.typeName,
    this.repeated,
    this.type,
  });
}

// Cache for the registry to avoid reloading descriptors
_ProtoRegistry? _registry;

/// Helper function to process nested messages recursively
void _processNestedMessages(
  DescriptorProto messageDescriptor,
  String parentFullName,
  Map<String, DescriptorProto> messageMap,
) {
  if (messageDescriptor.nestedType.isNotEmpty) {
    for (final nestedMessage in messageDescriptor.nestedType) {
      final nestedFullName = "$parentFullName.${nestedMessage.name}";
      messageMap[nestedFullName] = nestedMessage;

      // Recursively process nested messages
      _processNestedMessages(nestedMessage, nestedFullName, messageMap);
    }
  }
}

/// Get or create the protobuf registry with our descriptors loaded
_ProtoRegistry _getRegistry() {
  if (_registry != null) {
    return _registry!;
  }

  try {
    // Load the embedded descriptors
    final Uint8List descriptorBytes = getSparkDescriptorBytes();

    // Decode the FileDescriptorSet
    final descriptorSet = FileDescriptorSet.fromBuffer(descriptorBytes);

    final registry = _ProtoRegistry(
      descriptorSet: descriptorSet,
      fileMap: <String, FileDescriptorProto>{},
      messageMap: <String, DescriptorProto>{},
    );

    // Build lookup maps from the descriptor set
    for (final fileDescriptor in descriptorSet.file) {
      registry.fileMap[fileDescriptor.name] = fileDescriptor;

      // Process messages in this file
      if (fileDescriptor.messageType.isNotEmpty) {
        for (final messageDescriptor in fileDescriptor.messageType) {
          final pkg = fileDescriptor.hasPackage() ? fileDescriptor.package : "";
          final fullName = pkg.isNotEmpty
              ? "$pkg.${messageDescriptor.name}"
              : messageDescriptor.name;

          registry.messageMap[fullName] = messageDescriptor;

          // Process nested messages
          _processNestedMessages(
            messageDescriptor,
            fullName,
            registry.messageMap,
          );
        }
      }
    }

    _registry = registry;
    return registry;
  } catch (error) {
    print("Failed to load protobuf descriptors: $error");
    rethrow;
  }
}

/// Get field numbers for a specific message type
/// [messageTypeName] - Full message type name (e.g. "spark.SparkInvoiceFields")
/// Returns Map of field names to field numbers
Map<String, int> getFieldNumbers(String messageTypeName) {
  try {
    final registry = _getRegistry();

    // Get the message descriptor from our custom registry
    final messageDescriptor = registry.messageMap[messageTypeName];

    if (messageDescriptor == null) {
      print("Message type not found: $messageTypeName");
      print("Available message types: ${registry.messageMap.keys.toList()}");
      return {};
    }

    final fieldNumbers = <String, int>{};

    // Extract field numbers from the descriptor
    if (messageDescriptor.field.isNotEmpty) {
      for (final field in messageDescriptor.field) {
        fieldNumbers[field.name] = field.number;
      }
    }

    return fieldNumbers;
  } catch (error) {
    print("Failed to get field numbers for $messageTypeName: $error");
    return {};
  }
}

/// List all available message types in the registry
List<String> listMessageTypes() {
  try {
    final registry = _getRegistry();
    final types = registry.messageMap.keys.toList();
    types.sort();
    return types;
  } catch (error) {
    print("Failed to list message types: $error");
    return [];
  }
}

/// Return per-field metadata for a message type.
/// - Keys are snake_case field names as present in the proto descriptor
/// - Values include field number, oneof index if applicable, nested type name for message fields,
///   whether the field is repeated, and the element type
Map<String, FieldMeta> getFieldMeta(String messageTypeName) {
  try {
    final registry = _getRegistry();
    final descriptor = registry.messageMap[messageTypeName];

    if (descriptor == null) {
      return {};
    }

    final meta = <String, FieldMeta>{};
    final fields = descriptor.field;

    const int labelRepeated =
        3; // google.protobuf.FieldDescriptorProto.Label.LABEL_REPEATED
    const int typeMessage =
        11; // google.protobuf.FieldDescriptorProto.Type.TYPE_MESSAGE

    for (final f in fields) {
      int? oneofIndex;
      if (f.hasOneofIndex()) {
        oneofIndex = f.oneofIndex;
      }

      bool? repeated;
      if (f.hasLabel()) {
        // Dart Protobuf enums expose their integer equivalent via `.value`
        if (f.label.value == labelRepeated) {
          repeated = true;
        }
      }

      int? type;
      String? typeName;

      // Record the field type
      if (f.hasType()) {
        type = f.type.value;

        // If this is a message-typed field, record fully qualified nested type name
        // f.typeName may be like ".spark.TokensPayment"; normalize by trimming leading dot
        if (type == typeMessage && f.hasTypeName() && f.typeName.isNotEmpty) {
          final String fTypeName = f.typeName;
          typeName = fTypeName.startsWith(".")
              ? fTypeName.substring(1)
              : fTypeName;
        }
      }

      meta[f.name] = FieldMeta(
        number: f.number,
        oneofIndex: oneofIndex,
        typeName: typeName,
        repeated: repeated,
        type: type,
      );
    }

    return meta;
  } catch (_) {
    return {};
  }
}
