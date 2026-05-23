// This is a generated file - do not edit.
//
// Generated from frost.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

///
///  The role of the participant in the signing.
class SigningRole extends $pb.ProtobufEnum {
  static const SigningRole STATECHAIN =
      SigningRole._(0, _omitEnumNames ? '' : 'STATECHAIN');
  static const SigningRole USER =
      SigningRole._(1, _omitEnumNames ? '' : 'USER');

  static const $core.List<SigningRole> values = <SigningRole>[
    STATECHAIN,
    USER,
  ];

  static final $core.List<SigningRole?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static SigningRole? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SigningRole._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
