// This is a generated file - do not edit.
//
// Generated from spark_token.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TokenOutputStatus extends $pb.ProtobufEnum {
  static const TokenOutputStatus TOKEN_OUTPUT_STATUS_UNSPECIFIED =
      TokenOutputStatus._(
          0, _omitEnumNames ? '' : 'TOKEN_OUTPUT_STATUS_UNSPECIFIED');
  static const TokenOutputStatus TOKEN_OUTPUT_STATUS_AVAILABLE =
      TokenOutputStatus._(
          1, _omitEnumNames ? '' : 'TOKEN_OUTPUT_STATUS_AVAILABLE');
  static const TokenOutputStatus TOKEN_OUTPUT_STATUS_PENDING_OUTBOUND =
      TokenOutputStatus._(
          2, _omitEnumNames ? '' : 'TOKEN_OUTPUT_STATUS_PENDING_OUTBOUND');

  static const $core.List<TokenOutputStatus> values = <TokenOutputStatus>[
    TOKEN_OUTPUT_STATUS_UNSPECIFIED,
    TOKEN_OUTPUT_STATUS_AVAILABLE,
    TOKEN_OUTPUT_STATUS_PENDING_OUTBOUND,
  ];

  static final $core.List<TokenOutputStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static TokenOutputStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TokenOutputStatus._(super.value, super.name);
}

class TokenTransactionType extends $pb.ProtobufEnum {
  static const TokenTransactionType TOKEN_TRANSACTION_TYPE_UNSPECIFIED =
      TokenTransactionType._(
          0, _omitEnumNames ? '' : 'TOKEN_TRANSACTION_TYPE_UNSPECIFIED');
  static const TokenTransactionType TOKEN_TRANSACTION_TYPE_CREATE =
      TokenTransactionType._(
          1, _omitEnumNames ? '' : 'TOKEN_TRANSACTION_TYPE_CREATE');
  static const TokenTransactionType TOKEN_TRANSACTION_TYPE_MINT =
      TokenTransactionType._(
          2, _omitEnumNames ? '' : 'TOKEN_TRANSACTION_TYPE_MINT');
  static const TokenTransactionType TOKEN_TRANSACTION_TYPE_TRANSFER =
      TokenTransactionType._(
          3, _omitEnumNames ? '' : 'TOKEN_TRANSACTION_TYPE_TRANSFER');

  static const $core.List<TokenTransactionType> values = <TokenTransactionType>[
    TOKEN_TRANSACTION_TYPE_UNSPECIFIED,
    TOKEN_TRANSACTION_TYPE_CREATE,
    TOKEN_TRANSACTION_TYPE_MINT,
    TOKEN_TRANSACTION_TYPE_TRANSFER,
  ];

  static final $core.List<TokenTransactionType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static TokenTransactionType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TokenTransactionType._(super.value, super.name);
}

class CommitStatus extends $pb.ProtobufEnum {
  static const CommitStatus COMMIT_UNSPECIFIED =
      CommitStatus._(0, _omitEnumNames ? '' : 'COMMIT_UNSPECIFIED');
  static const CommitStatus COMMIT_PROCESSING =
      CommitStatus._(1, _omitEnumNames ? '' : 'COMMIT_PROCESSING');
  static const CommitStatus COMMIT_FINALIZED =
      CommitStatus._(2, _omitEnumNames ? '' : 'COMMIT_FINALIZED');

  static const $core.List<CommitStatus> values = <CommitStatus>[
    COMMIT_UNSPECIFIED,
    COMMIT_PROCESSING,
    COMMIT_FINALIZED,
  ];

  static final $core.List<CommitStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static CommitStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CommitStatus._(super.value, super.name);
}

class TokenTransactionStatus extends $pb.ProtobufEnum {
  static const TokenTransactionStatus TOKEN_TRANSACTION_STARTED =
      TokenTransactionStatus._(
          0, _omitEnumNames ? '' : 'TOKEN_TRANSACTION_STARTED');
  static const TokenTransactionStatus TOKEN_TRANSACTION_SIGNED =
      TokenTransactionStatus._(
          1, _omitEnumNames ? '' : 'TOKEN_TRANSACTION_SIGNED');
  static const TokenTransactionStatus TOKEN_TRANSACTION_REVEALED =
      TokenTransactionStatus._(
          5, _omitEnumNames ? '' : 'TOKEN_TRANSACTION_REVEALED');
  static const TokenTransactionStatus TOKEN_TRANSACTION_FINALIZED =
      TokenTransactionStatus._(
          2, _omitEnumNames ? '' : 'TOKEN_TRANSACTION_FINALIZED');
  static const TokenTransactionStatus TOKEN_TRANSACTION_STARTED_CANCELLED =
      TokenTransactionStatus._(
          3, _omitEnumNames ? '' : 'TOKEN_TRANSACTION_STARTED_CANCELLED');
  static const TokenTransactionStatus TOKEN_TRANSACTION_SIGNED_CANCELLED =
      TokenTransactionStatus._(
          4, _omitEnumNames ? '' : 'TOKEN_TRANSACTION_SIGNED_CANCELLED');
  static const TokenTransactionStatus TOKEN_TRANSACTION_UNKNOWN =
      TokenTransactionStatus._(
          10, _omitEnumNames ? '' : 'TOKEN_TRANSACTION_UNKNOWN');

  static const $core.List<TokenTransactionStatus> values =
      <TokenTransactionStatus>[
    TOKEN_TRANSACTION_STARTED,
    TOKEN_TRANSACTION_SIGNED,
    TOKEN_TRANSACTION_REVEALED,
    TOKEN_TRANSACTION_FINALIZED,
    TOKEN_TRANSACTION_STARTED_CANCELLED,
    TOKEN_TRANSACTION_SIGNED_CANCELLED,
    TOKEN_TRANSACTION_UNKNOWN,
  ];

  static final $core.Map<$core.int, TokenTransactionStatus> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static TokenTransactionStatus? valueOf($core.int value) => _byValue[value];

  const TokenTransactionStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
