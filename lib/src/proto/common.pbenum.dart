// This is a generated file - do not edit.
//
// Generated from common.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SignatureIntent extends $pb.ProtobufEnum {
  static const SignatureIntent CREATION =
      SignatureIntent._(0, _omitEnumNames ? '' : 'CREATION');
  static const SignatureIntent TRANSFER =
      SignatureIntent._(1, _omitEnumNames ? '' : 'TRANSFER');
  static const SignatureIntent AGGREGATE =
      SignatureIntent._(2, _omitEnumNames ? '' : 'AGGREGATE');
  @$core.Deprecated('This enum value is deprecated')
  static const SignatureIntent REFRESH =
      SignatureIntent._(3, _omitEnumNames ? '' : 'REFRESH');
  @$core.Deprecated('This enum value is deprecated')
  static const SignatureIntent EXTEND =
      SignatureIntent._(4, _omitEnumNames ? '' : 'EXTEND');

  static const $core.List<SignatureIntent> values = <SignatureIntent>[
    CREATION,
    TRANSFER,
    AGGREGATE,
    REFRESH,
    EXTEND,
  ];

  static final $core.List<SignatureIntent?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static SignatureIntent? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SignatureIntent._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
