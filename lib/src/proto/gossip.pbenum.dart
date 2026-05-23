// This is a generated file - do not edit.
//
// Generated from gossip.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// ConsensusOperationType identifies the domain flow for consensus operations.
/// Each value corresponds to a case in the gossip handler's dispatch switch.
class ConsensusOperationType extends $pb.ProtobufEnum {
  static const ConsensusOperationType CONSENSUS_OPERATION_TYPE_UNSPECIFIED =
      ConsensusOperationType._(
          0, _omitEnumNames ? '' : 'CONSENSUS_OPERATION_TYPE_UNSPECIFIED');
  static const ConsensusOperationType
      CONSENSUS_OPERATION_TYPE_FINALIZE_DEPOSIT_TREE = ConsensusOperationType._(
          1,
          _omitEnumNames
              ? ''
              : 'CONSENSUS_OPERATION_TYPE_FINALIZE_DEPOSIT_TREE');
  static const ConsensusOperationType
      CONSENSUS_OPERATION_TYPE_STORE_PREIMAGE_SHARE = ConsensusOperationType._(
          2,
          _omitEnumNames
              ? ''
              : 'CONSENSUS_OPERATION_TYPE_STORE_PREIMAGE_SHARE');

  static const $core.List<ConsensusOperationType> values =
      <ConsensusOperationType>[
    CONSENSUS_OPERATION_TYPE_UNSPECIFIED,
    CONSENSUS_OPERATION_TYPE_FINALIZE_DEPOSIT_TREE,
    CONSENSUS_OPERATION_TYPE_STORE_PREIMAGE_SHARE,
  ];

  static final $core.List<ConsensusOperationType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ConsensusOperationType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ConsensusOperationType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
