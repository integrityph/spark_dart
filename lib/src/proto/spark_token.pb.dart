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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $1;

import 'multisig.pb.dart' as $2;
import 'spark.pb.dart' as $3;
import 'spark_token.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'spark_token.pbenum.dart';

/// This proto is constructed by the wallet to specify leaves it wants to spend
/// as part of the token transaction.
class TokenOutputToSpend extends $pb.GeneratedMessage {
  factory TokenOutputToSpend({
    $core.List<$core.int>? prevTokenTransactionHash,
    $core.int? prevTokenTransactionVout,
  }) {
    final result = create();
    if (prevTokenTransactionHash != null)
      result.prevTokenTransactionHash = prevTokenTransactionHash;
    if (prevTokenTransactionVout != null)
      result.prevTokenTransactionVout = prevTokenTransactionVout;
    return result;
  }

  TokenOutputToSpend._();

  factory TokenOutputToSpend.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenOutputToSpend.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenOutputToSpend',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1,
        _omitFieldNames ? '' : 'prevTokenTransactionHash', $pb.PbFieldType.OY)
    ..aI(2, _omitFieldNames ? '' : 'prevTokenTransactionVout',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenOutputToSpend clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenOutputToSpend copyWith(void Function(TokenOutputToSpend) updates) =>
      super.copyWith((message) => updates(message as TokenOutputToSpend))
          as TokenOutputToSpend;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenOutputToSpend create() => TokenOutputToSpend._();
  @$core.override
  TokenOutputToSpend createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenOutputToSpend getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenOutputToSpend>(create);
  static TokenOutputToSpend? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get prevTokenTransactionHash => $_getN(0);
  @$pb.TagNumber(1)
  set prevTokenTransactionHash($core.List<$core.int> value) =>
      $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPrevTokenTransactionHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrevTokenTransactionHash() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get prevTokenTransactionVout => $_getIZ(1);
  @$pb.TagNumber(2)
  set prevTokenTransactionVout($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPrevTokenTransactionVout() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrevTokenTransactionVout() => $_clearField(2);
}

class TokenTransferInput extends $pb.GeneratedMessage {
  factory TokenTransferInput({
    $core.Iterable<TokenOutputToSpend>? outputsToSpend,
  }) {
    final result = create();
    if (outputsToSpend != null) result.outputsToSpend.addAll(outputsToSpend);
    return result;
  }

  TokenTransferInput._();

  factory TokenTransferInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenTransferInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenTransferInput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..pPM<TokenOutputToSpend>(1, _omitFieldNames ? '' : 'outputsToSpend',
        subBuilder: TokenOutputToSpend.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenTransferInput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenTransferInput copyWith(void Function(TokenTransferInput) updates) =>
      super.copyWith((message) => updates(message as TokenTransferInput))
          as TokenTransferInput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenTransferInput create() => TokenTransferInput._();
  @$core.override
  TokenTransferInput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenTransferInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenTransferInput>(create);
  static TokenTransferInput? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TokenOutputToSpend> get outputsToSpend => $_getList(0);
}

class TokenMintInput extends $pb.GeneratedMessage {
  factory TokenMintInput({
    $core.List<$core.int>? issuerPublicKey,
    $core.List<$core.int>? tokenIdentifier,
  }) {
    final result = create();
    if (issuerPublicKey != null) result.issuerPublicKey = issuerPublicKey;
    if (tokenIdentifier != null) result.tokenIdentifier = tokenIdentifier;
    return result;
  }

  TokenMintInput._();

  factory TokenMintInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenMintInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenMintInput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'issuerPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'tokenIdentifier', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenMintInput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenMintInput copyWith(void Function(TokenMintInput) updates) =>
      super.copyWith((message) => updates(message as TokenMintInput))
          as TokenMintInput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenMintInput create() => TokenMintInput._();
  @$core.override
  TokenMintInput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenMintInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenMintInput>(create);
  static TokenMintInput? _defaultInstance;

  /// Deprecated: The SO now uses token_identifier to look up the issuer public key
  /// from the TokenCreate record. This field is still included in the transaction hash,
  /// so it must be set correctly, but will be removed in a future version bump.
  @$pb.TagNumber(1)
  $core.List<$core.int> get issuerPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set issuerPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIssuerPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearIssuerPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get tokenIdentifier => $_getN(1);
  @$pb.TagNumber(2)
  set tokenIdentifier($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTokenIdentifier() => $_has(1);
  @$pb.TagNumber(2)
  void clearTokenIdentifier() => $_clearField(2);
}

class TokenCreateInput extends $pb.GeneratedMessage {
  factory TokenCreateInput({
    $core.List<$core.int>? issuerPublicKey,
    $core.String? tokenName,
    $core.String? tokenTicker,
    $core.int? decimals,
    $core.List<$core.int>? maxSupply,
    $core.bool? isFreezable,
    $core.List<$core.int>? creationEntityPublicKey,
    $core.List<$core.int>? extraMetadata,
  }) {
    final result = create();
    if (issuerPublicKey != null) result.issuerPublicKey = issuerPublicKey;
    if (tokenName != null) result.tokenName = tokenName;
    if (tokenTicker != null) result.tokenTicker = tokenTicker;
    if (decimals != null) result.decimals = decimals;
    if (maxSupply != null) result.maxSupply = maxSupply;
    if (isFreezable != null) result.isFreezable = isFreezable;
    if (creationEntityPublicKey != null)
      result.creationEntityPublicKey = creationEntityPublicKey;
    if (extraMetadata != null) result.extraMetadata = extraMetadata;
    return result;
  }

  TokenCreateInput._();

  factory TokenCreateInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenCreateInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenCreateInput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'issuerPublicKey', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'tokenName')
    ..aOS(3, _omitFieldNames ? '' : 'tokenTicker')
    ..aI(4, _omitFieldNames ? '' : 'decimals', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'maxSupply', $pb.PbFieldType.OY)
    ..aOB(6, _omitFieldNames ? '' : 'isFreezable')
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'creationEntityPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        8, _omitFieldNames ? '' : 'extraMetadata', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenCreateInput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenCreateInput copyWith(void Function(TokenCreateInput) updates) =>
      super.copyWith((message) => updates(message as TokenCreateInput))
          as TokenCreateInput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenCreateInput create() => TokenCreateInput._();
  @$core.override
  TokenCreateInput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenCreateInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenCreateInput>(create);
  static TokenCreateInput? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get issuerPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set issuerPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIssuerPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearIssuerPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tokenName => $_getSZ(1);
  @$pb.TagNumber(2)
  set tokenName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTokenName() => $_has(1);
  @$pb.TagNumber(2)
  void clearTokenName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get tokenTicker => $_getSZ(2);
  @$pb.TagNumber(3)
  set tokenTicker($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTokenTicker() => $_has(2);
  @$pb.TagNumber(3)
  void clearTokenTicker() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get decimals => $_getIZ(3);
  @$pb.TagNumber(4)
  set decimals($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDecimals() => $_has(3);
  @$pb.TagNumber(4)
  void clearDecimals() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get maxSupply => $_getN(4);
  @$pb.TagNumber(5)
  set maxSupply($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMaxSupply() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxSupply() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isFreezable => $_getBF(5);
  @$pb.TagNumber(6)
  set isFreezable($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIsFreezable() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsFreezable() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get creationEntityPublicKey => $_getN(6);
  @$pb.TagNumber(7)
  set creationEntityPublicKey($core.List<$core.int> value) =>
      $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCreationEntityPublicKey() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreationEntityPublicKey() => $_clearField(7);

  /// If any of the fields below are provided, use protohash to generate the token_identifier
  @$pb.TagNumber(8)
  $core.List<$core.int> get extraMetadata => $_getN(7);
  @$pb.TagNumber(8)
  set extraMetadata($core.List<$core.int> value) => $_setBytes(7, value);
  @$pb.TagNumber(8)
  $core.bool hasExtraMetadata() => $_has(7);
  @$pb.TagNumber(8)
  void clearExtraMetadata() => $_clearField(8);
}

/// This proto is constructed by the wallet to specify outputs it wants to create
/// as part of a token transaction. Output id and revocation public key should
/// remain unfilled so that the SE can fill them as part of the
/// StartTokenTransaction() call.
class TokenOutput extends $pb.GeneratedMessage {
  factory TokenOutput({
    $core.String? id,
    $core.List<$core.int>? ownerPublicKey,
    $core.List<$core.int>? revocationCommitment,
    $fixnum.Int64? withdrawBondSats,
    $fixnum.Int64? withdrawRelativeBlockLocktime,
    $core.List<$core.int>? tokenPublicKey,
    $core.List<$core.int>? tokenAmount,
    $core.List<$core.int>? tokenIdentifier,
    $core.List<$core.int>? seWithdrawalSignature,
    TokenOutputStatus? status,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (ownerPublicKey != null) result.ownerPublicKey = ownerPublicKey;
    if (revocationCommitment != null)
      result.revocationCommitment = revocationCommitment;
    if (withdrawBondSats != null) result.withdrawBondSats = withdrawBondSats;
    if (withdrawRelativeBlockLocktime != null)
      result.withdrawRelativeBlockLocktime = withdrawRelativeBlockLocktime;
    if (tokenPublicKey != null) result.tokenPublicKey = tokenPublicKey;
    if (tokenAmount != null) result.tokenAmount = tokenAmount;
    if (tokenIdentifier != null) result.tokenIdentifier = tokenIdentifier;
    if (seWithdrawalSignature != null)
      result.seWithdrawalSignature = seWithdrawalSignature;
    if (status != null) result.status = status;
    return result;
  }

  TokenOutput._();

  factory TokenOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenOutput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'ownerPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'revocationCommitment', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'withdrawBondSats', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        5,
        _omitFieldNames ? '' : 'withdrawRelativeBlockLocktime',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'tokenPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'tokenAmount', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        8, _omitFieldNames ? '' : 'tokenIdentifier', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        9, _omitFieldNames ? '' : 'seWithdrawalSignature', $pb.PbFieldType.OY)
    ..aE<TokenOutputStatus>(10, _omitFieldNames ? '' : 'status',
        enumValues: TokenOutputStatus.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenOutput copyWith(void Function(TokenOutput) updates) =>
      super.copyWith((message) => updates(message as TokenOutput))
          as TokenOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenOutput create() => TokenOutput._();
  @$core.override
  TokenOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenOutput>(create);
  static TokenOutput? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get ownerPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set ownerPublicKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOwnerPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get revocationCommitment => $_getN(2);
  @$pb.TagNumber(3)
  set revocationCommitment($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRevocationCommitment() => $_has(2);
  @$pb.TagNumber(3)
  void clearRevocationCommitment() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get withdrawBondSats => $_getI64(3);
  @$pb.TagNumber(4)
  set withdrawBondSats($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasWithdrawBondSats() => $_has(3);
  @$pb.TagNumber(4)
  void clearWithdrawBondSats() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get withdrawRelativeBlockLocktime => $_getI64(4);
  @$pb.TagNumber(5)
  set withdrawRelativeBlockLocktime($fixnum.Int64 value) =>
      $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasWithdrawRelativeBlockLocktime() => $_has(4);
  @$pb.TagNumber(5)
  void clearWithdrawRelativeBlockLocktime() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get tokenPublicKey => $_getN(5);
  @$pb.TagNumber(6)
  set tokenPublicKey($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTokenPublicKey() => $_has(5);
  @$pb.TagNumber(6)
  void clearTokenPublicKey() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get tokenAmount => $_getN(6);
  @$pb.TagNumber(7)
  set tokenAmount($core.List<$core.int> value) => $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTokenAmount() => $_has(6);
  @$pb.TagNumber(7)
  void clearTokenAmount() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.int> get tokenIdentifier => $_getN(7);
  @$pb.TagNumber(8)
  set tokenIdentifier($core.List<$core.int> value) => $_setBytes(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTokenIdentifier() => $_has(7);
  @$pb.TagNumber(8)
  void clearTokenIdentifier() => $_clearField(8);

  /// SE Schnorr signature enabling offline L1 withdrawal.
  /// Only present in query responses; empty until SE signing is implemented.
  @$pb.TagNumber(9)
  $core.List<$core.int> get seWithdrawalSignature => $_getN(8);
  @$pb.TagNumber(9)
  set seWithdrawalSignature($core.List<$core.int> value) =>
      $_setBytes(8, value);
  @$pb.TagNumber(9)
  $core.bool hasSeWithdrawalSignature() => $_has(8);
  @$pb.TagNumber(9)
  void clearSeWithdrawalSignature() => $_clearField(9);

  @$pb.TagNumber(10)
  TokenOutputStatus get status => $_getN(9);
  @$pb.TagNumber(10)
  set status(TokenOutputStatus value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasStatus() => $_has(9);
  @$pb.TagNumber(10)
  void clearStatus() => $_clearField(10);
}

class PartialTokenOutput extends $pb.GeneratedMessage {
  factory PartialTokenOutput({
    $core.List<$core.int>? ownerPublicKey,
    $fixnum.Int64? withdrawBondSats,
    $fixnum.Int64? withdrawRelativeBlockLocktime,
    $core.List<$core.int>? tokenIdentifier,
    $core.List<$core.int>? tokenAmount,
  }) {
    final result = create();
    if (ownerPublicKey != null) result.ownerPublicKey = ownerPublicKey;
    if (withdrawBondSats != null) result.withdrawBondSats = withdrawBondSats;
    if (withdrawRelativeBlockLocktime != null)
      result.withdrawRelativeBlockLocktime = withdrawRelativeBlockLocktime;
    if (tokenIdentifier != null) result.tokenIdentifier = tokenIdentifier;
    if (tokenAmount != null) result.tokenAmount = tokenAmount;
    return result;
  }

  PartialTokenOutput._();

  factory PartialTokenOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PartialTokenOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PartialTokenOutput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'ownerPublicKey', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'withdrawBondSats', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        3,
        _omitFieldNames ? '' : 'withdrawRelativeBlockLocktime',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'tokenIdentifier', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'tokenAmount', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartialTokenOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartialTokenOutput copyWith(void Function(PartialTokenOutput) updates) =>
      super.copyWith((message) => updates(message as PartialTokenOutput))
          as PartialTokenOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PartialTokenOutput create() => PartialTokenOutput._();
  @$core.override
  PartialTokenOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PartialTokenOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartialTokenOutput>(create);
  static PartialTokenOutput? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set ownerPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get withdrawBondSats => $_getI64(1);
  @$pb.TagNumber(2)
  set withdrawBondSats($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWithdrawBondSats() => $_has(1);
  @$pb.TagNumber(2)
  void clearWithdrawBondSats() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get withdrawRelativeBlockLocktime => $_getI64(2);
  @$pb.TagNumber(3)
  set withdrawRelativeBlockLocktime($fixnum.Int64 value) =>
      $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWithdrawRelativeBlockLocktime() => $_has(2);
  @$pb.TagNumber(3)
  void clearWithdrawRelativeBlockLocktime() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get tokenIdentifier => $_getN(3);
  @$pb.TagNumber(4)
  set tokenIdentifier($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTokenIdentifier() => $_has(3);
  @$pb.TagNumber(4)
  void clearTokenIdentifier() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get tokenAmount => $_getN(4);
  @$pb.TagNumber(5)
  set tokenAmount($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTokenAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearTokenAmount() => $_clearField(5);
}

class FinalTokenOutput extends $pb.GeneratedMessage {
  factory FinalTokenOutput({
    PartialTokenOutput? partialTokenOutput,
    $core.List<$core.int>? revocationCommitment,
  }) {
    final result = create();
    if (partialTokenOutput != null)
      result.partialTokenOutput = partialTokenOutput;
    if (revocationCommitment != null)
      result.revocationCommitment = revocationCommitment;
    return result;
  }

  FinalTokenOutput._();

  factory FinalTokenOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinalTokenOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinalTokenOutput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..aOM<PartialTokenOutput>(1, _omitFieldNames ? '' : 'partialTokenOutput',
        subBuilder: PartialTokenOutput.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'revocationCommitment', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalTokenOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalTokenOutput copyWith(void Function(FinalTokenOutput) updates) =>
      super.copyWith((message) => updates(message as FinalTokenOutput))
          as FinalTokenOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinalTokenOutput create() => FinalTokenOutput._();
  @$core.override
  FinalTokenOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FinalTokenOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinalTokenOutput>(create);
  static FinalTokenOutput? _defaultInstance;

  @$pb.TagNumber(1)
  PartialTokenOutput get partialTokenOutput => $_getN(0);
  @$pb.TagNumber(1)
  set partialTokenOutput(PartialTokenOutput value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPartialTokenOutput() => $_has(0);
  @$pb.TagNumber(1)
  void clearPartialTokenOutput() => $_clearField(1);
  @$pb.TagNumber(1)
  PartialTokenOutput ensurePartialTokenOutput() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get revocationCommitment => $_getN(1);
  @$pb.TagNumber(2)
  set revocationCommitment($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRevocationCommitment() => $_has(1);
  @$pb.TagNumber(2)
  void clearRevocationCommitment() => $_clearField(2);
}

enum TokenTransaction_TokenInputs {
  mintInput,
  transferInput,
  createInput,
  notSet
}

/// This proto is constructed by the wallet and is the core transaction data
/// structure. This proto is deterministically hashed to generate the
/// token_transaction_hash that is cooperatively signed by the SO group to
/// confirm a token transaction.
class TokenTransaction extends $pb.GeneratedMessage {
  factory TokenTransaction({
    $core.int? version,
    TokenMintInput? mintInput,
    TokenTransferInput? transferInput,
    $core.Iterable<TokenOutput>? tokenOutputs,
    $core.Iterable<$core.List<$core.int>>? sparkOperatorIdentityPublicKeys,
    $1.Timestamp? expiryTime,
    $3.Network? network,
    TokenCreateInput? createInput,
    $1.Timestamp? clientCreatedTimestamp,
    $core.Iterable<InvoiceAttachment>? invoiceAttachments,
    $fixnum.Int64? validityDurationSeconds,
    $1.Timestamp? executeBefore,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (mintInput != null) result.mintInput = mintInput;
    if (transferInput != null) result.transferInput = transferInput;
    if (tokenOutputs != null) result.tokenOutputs.addAll(tokenOutputs);
    if (sparkOperatorIdentityPublicKeys != null)
      result.sparkOperatorIdentityPublicKeys
          .addAll(sparkOperatorIdentityPublicKeys);
    if (expiryTime != null) result.expiryTime = expiryTime;
    if (network != null) result.network = network;
    if (createInput != null) result.createInput = createInput;
    if (clientCreatedTimestamp != null)
      result.clientCreatedTimestamp = clientCreatedTimestamp;
    if (invoiceAttachments != null)
      result.invoiceAttachments.addAll(invoiceAttachments);
    if (validityDurationSeconds != null)
      result.validityDurationSeconds = validityDurationSeconds;
    if (executeBefore != null) result.executeBefore = executeBefore;
    return result;
  }

  TokenTransaction._();

  factory TokenTransaction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenTransaction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, TokenTransaction_TokenInputs>
      _TokenTransaction_TokenInputsByTag = {
    2: TokenTransaction_TokenInputs.mintInput,
    3: TokenTransaction_TokenInputs.transferInput,
    8: TokenTransaction_TokenInputs.createInput,
    0: TokenTransaction_TokenInputs.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenTransaction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 8])
    ..aI(1, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..aOM<TokenMintInput>(2, _omitFieldNames ? '' : 'mintInput',
        subBuilder: TokenMintInput.create)
    ..aOM<TokenTransferInput>(3, _omitFieldNames ? '' : 'transferInput',
        subBuilder: TokenTransferInput.create)
    ..pPM<TokenOutput>(4, _omitFieldNames ? '' : 'tokenOutputs',
        subBuilder: TokenOutput.create)
    ..p<$core.List<$core.int>>(
        5,
        _omitFieldNames ? '' : 'sparkOperatorIdentityPublicKeys',
        $pb.PbFieldType.PY)
    ..aOM<$1.Timestamp>(6, _omitFieldNames ? '' : 'expiryTime',
        subBuilder: $1.Timestamp.create)
    ..aE<$3.Network>(7, _omitFieldNames ? '' : 'network',
        enumValues: $3.Network.values)
    ..aOM<TokenCreateInput>(8, _omitFieldNames ? '' : 'createInput',
        subBuilder: TokenCreateInput.create)
    ..aOM<$1.Timestamp>(9, _omitFieldNames ? '' : 'clientCreatedTimestamp',
        subBuilder: $1.Timestamp.create)
    ..pPM<InvoiceAttachment>(10, _omitFieldNames ? '' : 'invoiceAttachments',
        subBuilder: InvoiceAttachment.create)
    ..a<$fixnum.Int64>(11, _omitFieldNames ? '' : 'validityDurationSeconds',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$1.Timestamp>(12, _omitFieldNames ? '' : 'executeBefore',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenTransaction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenTransaction copyWith(void Function(TokenTransaction) updates) =>
      super.copyWith((message) => updates(message as TokenTransaction))
          as TokenTransaction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenTransaction create() => TokenTransaction._();
  @$core.override
  TokenTransaction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenTransaction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenTransaction>(create);
  static TokenTransaction? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(8)
  TokenTransaction_TokenInputs whichTokenInputs() =>
      _TokenTransaction_TokenInputsByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(8)
  void clearTokenInputs() => $_clearField($_whichOneof(0));

  /// For mint transactions issuer_public_key will be specified without any
  /// outputs_to_spend. For transfer transactions the token amount in the input
  /// leaves must match the token amount in the output leaves.
  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  TokenMintInput get mintInput => $_getN(1);
  @$pb.TagNumber(2)
  set mintInput(TokenMintInput value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMintInput() => $_has(1);
  @$pb.TagNumber(2)
  void clearMintInput() => $_clearField(2);
  @$pb.TagNumber(2)
  TokenMintInput ensureMintInput() => $_ensure(1);

  @$pb.TagNumber(3)
  TokenTransferInput get transferInput => $_getN(2);
  @$pb.TagNumber(3)
  set transferInput(TokenTransferInput value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTransferInput() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransferInput() => $_clearField(3);
  @$pb.TagNumber(3)
  TokenTransferInput ensureTransferInput() => $_ensure(2);

  @$pb.TagNumber(4)
  $pb.PbList<TokenOutput> get tokenOutputs => $_getList(3);

  @$pb.TagNumber(5)
  $pb.PbList<$core.List<$core.int>> get sparkOperatorIdentityPublicKeys =>
      $_getList(4);

  /// Server-set expiry time. The server calculates this by adding the client's
  /// requested validity_duration_seconds to the server's current time when
  /// creating the final transaction.
  @$pb.TagNumber(6)
  $1.Timestamp get expiryTime => $_getN(5);
  @$pb.TagNumber(6)
  set expiryTime($1.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasExpiryTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearExpiryTime() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureExpiryTime() => $_ensure(5);

  @$pb.TagNumber(7)
  $3.Network get network => $_getN(6);
  @$pb.TagNumber(7)
  set network($3.Network value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasNetwork() => $_has(6);
  @$pb.TagNumber(7)
  void clearNetwork() => $_clearField(7);

  @$pb.TagNumber(8)
  TokenCreateInput get createInput => $_getN(7);
  @$pb.TagNumber(8)
  set createInput(TokenCreateInput value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasCreateInput() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreateInput() => $_clearField(8);
  @$pb.TagNumber(8)
  TokenCreateInput ensureCreateInput() => $_ensure(7);

  /// The timestamp of when the client created the transaction. This is used to
  /// determine which transaction should win in a race condition. Earlier
  /// timestamps win over later ones.
  @$pb.TagNumber(9)
  $1.Timestamp get clientCreatedTimestamp => $_getN(8);
  @$pb.TagNumber(9)
  set clientCreatedTimestamp($1.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasClientCreatedTimestamp() => $_has(8);
  @$pb.TagNumber(9)
  void clearClientCreatedTimestamp() => $_clearField(9);
  @$pb.TagNumber(9)
  $1.Timestamp ensureClientCreatedTimestamp() => $_ensure(8);

  /// The spark invoices this transaction fulfills.
  @$pb.TagNumber(10)
  $pb.PbList<InvoiceAttachment> get invoiceAttachments => $_getList(9);

  /// Should NOT be set explicitly on V2 transactions (protected with validation).
  /// Provided here to enable cross-conversion between v3 token transaction protos during migration.
  @$pb.TagNumber(11)
  $fixnum.Int64 get validityDurationSeconds => $_getI64(10);
  @$pb.TagNumber(11)
  set validityDurationSeconds($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasValidityDurationSeconds() => $_has(10);
  @$pb.TagNumber(11)
  void clearValidityDurationSeconds() => $_clearField(11);

  /// Optional client-specified deadline for transaction execution.
  /// Carried through from PartialTokenTransaction.execute_before during conversion.
  @$pb.TagNumber(12)
  $1.Timestamp get executeBefore => $_getN(11);
  @$pb.TagNumber(12)
  set executeBefore($1.Timestamp value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasExecuteBefore() => $_has(11);
  @$pb.TagNumber(12)
  void clearExecuteBefore() => $_clearField(12);
  @$pb.TagNumber(12)
  $1.Timestamp ensureExecuteBefore() => $_ensure(11);
}

class TokenTransactionMetadata extends $pb.GeneratedMessage {
  factory TokenTransactionMetadata({
    $core.Iterable<$core.List<$core.int>>? sparkOperatorIdentityPublicKeys,
    $3.Network? network,
    $1.Timestamp? clientCreatedTimestamp,
    $fixnum.Int64? validityDurationSeconds,
    $core.Iterable<InvoiceAttachment>? invoiceAttachments,
  }) {
    final result = create();
    if (sparkOperatorIdentityPublicKeys != null)
      result.sparkOperatorIdentityPublicKeys
          .addAll(sparkOperatorIdentityPublicKeys);
    if (network != null) result.network = network;
    if (clientCreatedTimestamp != null)
      result.clientCreatedTimestamp = clientCreatedTimestamp;
    if (validityDurationSeconds != null)
      result.validityDurationSeconds = validityDurationSeconds;
    if (invoiceAttachments != null)
      result.invoiceAttachments.addAll(invoiceAttachments);
    return result;
  }

  TokenTransactionMetadata._();

  factory TokenTransactionMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenTransactionMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenTransactionMetadata',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..p<$core.List<$core.int>>(
        2,
        _omitFieldNames ? '' : 'sparkOperatorIdentityPublicKeys',
        $pb.PbFieldType.PY)
    ..aE<$3.Network>(3, _omitFieldNames ? '' : 'network',
        enumValues: $3.Network.values)
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'clientCreatedTimestamp',
        subBuilder: $1.Timestamp.create)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'validityDurationSeconds',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPM<InvoiceAttachment>(6, _omitFieldNames ? '' : 'invoiceAttachments',
        subBuilder: InvoiceAttachment.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenTransactionMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenTransactionMetadata copyWith(
          void Function(TokenTransactionMetadata) updates) =>
      super.copyWith((message) => updates(message as TokenTransactionMetadata))
          as TokenTransactionMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenTransactionMetadata create() => TokenTransactionMetadata._();
  @$core.override
  TokenTransactionMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenTransactionMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenTransactionMetadata>(create);
  static TokenTransactionMetadata? _defaultInstance;

  @$pb.TagNumber(2)
  $pb.PbList<$core.List<$core.int>> get sparkOperatorIdentityPublicKeys =>
      $_getList(0);

  @$pb.TagNumber(3)
  $3.Network get network => $_getN(1);
  @$pb.TagNumber(3)
  set network($3.Network value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasNetwork() => $_has(1);
  @$pb.TagNumber(3)
  void clearNetwork() => $_clearField(3);

  /// The timestamp of when the client created the transaction. This is used to
  /// determine which transaction should win in a race condition. Earlier
  /// timestamps win over later ones.
  @$pb.TagNumber(4)
  $1.Timestamp get clientCreatedTimestamp => $_getN(2);
  @$pb.TagNumber(4)
  set clientCreatedTimestamp($1.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasClientCreatedTimestamp() => $_has(2);
  @$pb.TagNumber(4)
  void clearClientCreatedTimestamp() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureClientCreatedTimestamp() => $_ensure(2);

  /// How long the transaction should be valid for, in seconds.
  /// The server will set the actual expiry_time in the final transaction based
  /// on this duration. Must be within [1, 300] seconds.
  @$pb.TagNumber(5)
  $fixnum.Int64 get validityDurationSeconds => $_getI64(3);
  @$pb.TagNumber(5)
  set validityDurationSeconds($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(5)
  $core.bool hasValidityDurationSeconds() => $_has(3);
  @$pb.TagNumber(5)
  void clearValidityDurationSeconds() => $_clearField(5);

  /// The spark invoices this transaction fulfills.
  @$pb.TagNumber(6)
  $pb.PbList<InvoiceAttachment> get invoiceAttachments => $_getList(4);
}

enum PartialTokenTransaction_TokenInputs {
  mintInput,
  transferInput,
  createInput,
  notSet
}

class PartialTokenTransaction extends $pb.GeneratedMessage {
  factory PartialTokenTransaction({
    $core.int? version,
    TokenTransactionMetadata? tokenTransactionMetadata,
    TokenMintInput? mintInput,
    TokenTransferInput? transferInput,
    TokenCreateInput? createInput,
    $core.Iterable<PartialTokenOutput>? partialTokenOutputs,
    $1.Timestamp? executeBefore,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (tokenTransactionMetadata != null)
      result.tokenTransactionMetadata = tokenTransactionMetadata;
    if (mintInput != null) result.mintInput = mintInput;
    if (transferInput != null) result.transferInput = transferInput;
    if (createInput != null) result.createInput = createInput;
    if (partialTokenOutputs != null)
      result.partialTokenOutputs.addAll(partialTokenOutputs);
    if (executeBefore != null) result.executeBefore = executeBefore;
    return result;
  }

  PartialTokenTransaction._();

  factory PartialTokenTransaction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PartialTokenTransaction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, PartialTokenTransaction_TokenInputs>
      _PartialTokenTransaction_TokenInputsByTag = {
    3: PartialTokenTransaction_TokenInputs.mintInput,
    4: PartialTokenTransaction_TokenInputs.transferInput,
    5: PartialTokenTransaction_TokenInputs.createInput,
    0: PartialTokenTransaction_TokenInputs.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PartialTokenTransaction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..oo(0, [3, 4, 5])
    ..aI(1, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..aOM<TokenTransactionMetadata>(
        2, _omitFieldNames ? '' : 'tokenTransactionMetadata',
        subBuilder: TokenTransactionMetadata.create)
    ..aOM<TokenMintInput>(3, _omitFieldNames ? '' : 'mintInput',
        subBuilder: TokenMintInput.create)
    ..aOM<TokenTransferInput>(4, _omitFieldNames ? '' : 'transferInput',
        subBuilder: TokenTransferInput.create)
    ..aOM<TokenCreateInput>(5, _omitFieldNames ? '' : 'createInput',
        subBuilder: TokenCreateInput.create)
    ..pPM<PartialTokenOutput>(6, _omitFieldNames ? '' : 'partialTokenOutputs',
        subBuilder: PartialTokenOutput.create)
    ..aOM<$1.Timestamp>(7, _omitFieldNames ? '' : 'executeBefore',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartialTokenTransaction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartialTokenTransaction copyWith(
          void Function(PartialTokenTransaction) updates) =>
      super.copyWith((message) => updates(message as PartialTokenTransaction))
          as PartialTokenTransaction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PartialTokenTransaction create() => PartialTokenTransaction._();
  @$core.override
  PartialTokenTransaction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PartialTokenTransaction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartialTokenTransaction>(create);
  static PartialTokenTransaction? _defaultInstance;

  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  PartialTokenTransaction_TokenInputs whichTokenInputs() =>
      _PartialTokenTransaction_TokenInputsByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  void clearTokenInputs() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  TokenTransactionMetadata get tokenTransactionMetadata => $_getN(1);
  @$pb.TagNumber(2)
  set tokenTransactionMetadata(TokenTransactionMetadata value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTokenTransactionMetadata() => $_has(1);
  @$pb.TagNumber(2)
  void clearTokenTransactionMetadata() => $_clearField(2);
  @$pb.TagNumber(2)
  TokenTransactionMetadata ensureTokenTransactionMetadata() => $_ensure(1);

  @$pb.TagNumber(3)
  TokenMintInput get mintInput => $_getN(2);
  @$pb.TagNumber(3)
  set mintInput(TokenMintInput value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasMintInput() => $_has(2);
  @$pb.TagNumber(3)
  void clearMintInput() => $_clearField(3);
  @$pb.TagNumber(3)
  TokenMintInput ensureMintInput() => $_ensure(2);

  @$pb.TagNumber(4)
  TokenTransferInput get transferInput => $_getN(3);
  @$pb.TagNumber(4)
  set transferInput(TokenTransferInput value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasTransferInput() => $_has(3);
  @$pb.TagNumber(4)
  void clearTransferInput() => $_clearField(4);
  @$pb.TagNumber(4)
  TokenTransferInput ensureTransferInput() => $_ensure(3);

  @$pb.TagNumber(5)
  TokenCreateInput get createInput => $_getN(4);
  @$pb.TagNumber(5)
  set createInput(TokenCreateInput value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasCreateInput() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreateInput() => $_clearField(5);
  @$pb.TagNumber(5)
  TokenCreateInput ensureCreateInput() => $_ensure(4);

  @$pb.TagNumber(6)
  $pb.PbList<PartialTokenOutput> get partialTokenOutputs => $_getList(5);

  /// Optional client-specified deadline for transaction execution.
  /// If set, the server must reject the transaction if current time > execute_before.
  /// Must be after client_created_timestamp, within a configurable max window,
  /// and truncated to microsecond precision.
  @$pb.TagNumber(7)
  $1.Timestamp get executeBefore => $_getN(6);
  @$pb.TagNumber(7)
  set executeBefore($1.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasExecuteBefore() => $_has(6);
  @$pb.TagNumber(7)
  void clearExecuteBefore() => $_clearField(7);
  @$pb.TagNumber(7)
  $1.Timestamp ensureExecuteBefore() => $_ensure(6);
}

enum FinalTokenTransaction_TokenInputs {
  mintInput,
  transferInput,
  createInput,
  notSet
}

class FinalTokenTransaction extends $pb.GeneratedMessage {
  factory FinalTokenTransaction({
    $core.int? version,
    TokenTransactionMetadata? tokenTransactionMetadata,
    TokenMintInput? mintInput,
    TokenTransferInput? transferInput,
    TokenCreateInput? createInput,
    $core.Iterable<FinalTokenOutput>? finalTokenOutputs,
    $1.Timestamp? executeBefore,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (tokenTransactionMetadata != null)
      result.tokenTransactionMetadata = tokenTransactionMetadata;
    if (mintInput != null) result.mintInput = mintInput;
    if (transferInput != null) result.transferInput = transferInput;
    if (createInput != null) result.createInput = createInput;
    if (finalTokenOutputs != null)
      result.finalTokenOutputs.addAll(finalTokenOutputs);
    if (executeBefore != null) result.executeBefore = executeBefore;
    return result;
  }

  FinalTokenTransaction._();

  factory FinalTokenTransaction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinalTokenTransaction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, FinalTokenTransaction_TokenInputs>
      _FinalTokenTransaction_TokenInputsByTag = {
    3: FinalTokenTransaction_TokenInputs.mintInput,
    4: FinalTokenTransaction_TokenInputs.transferInput,
    5: FinalTokenTransaction_TokenInputs.createInput,
    0: FinalTokenTransaction_TokenInputs.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinalTokenTransaction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..oo(0, [3, 4, 5])
    ..aI(1, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..aOM<TokenTransactionMetadata>(
        2, _omitFieldNames ? '' : 'tokenTransactionMetadata',
        subBuilder: TokenTransactionMetadata.create)
    ..aOM<TokenMintInput>(3, _omitFieldNames ? '' : 'mintInput',
        subBuilder: TokenMintInput.create)
    ..aOM<TokenTransferInput>(4, _omitFieldNames ? '' : 'transferInput',
        subBuilder: TokenTransferInput.create)
    ..aOM<TokenCreateInput>(5, _omitFieldNames ? '' : 'createInput',
        subBuilder: TokenCreateInput.create)
    ..pPM<FinalTokenOutput>(6, _omitFieldNames ? '' : 'finalTokenOutputs',
        subBuilder: FinalTokenOutput.create)
    ..aOM<$1.Timestamp>(7, _omitFieldNames ? '' : 'executeBefore',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalTokenTransaction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalTokenTransaction copyWith(
          void Function(FinalTokenTransaction) updates) =>
      super.copyWith((message) => updates(message as FinalTokenTransaction))
          as FinalTokenTransaction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinalTokenTransaction create() => FinalTokenTransaction._();
  @$core.override
  FinalTokenTransaction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FinalTokenTransaction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinalTokenTransaction>(create);
  static FinalTokenTransaction? _defaultInstance;

  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  FinalTokenTransaction_TokenInputs whichTokenInputs() =>
      _FinalTokenTransaction_TokenInputsByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  void clearTokenInputs() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  TokenTransactionMetadata get tokenTransactionMetadata => $_getN(1);
  @$pb.TagNumber(2)
  set tokenTransactionMetadata(TokenTransactionMetadata value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTokenTransactionMetadata() => $_has(1);
  @$pb.TagNumber(2)
  void clearTokenTransactionMetadata() => $_clearField(2);
  @$pb.TagNumber(2)
  TokenTransactionMetadata ensureTokenTransactionMetadata() => $_ensure(1);

  @$pb.TagNumber(3)
  TokenMintInput get mintInput => $_getN(2);
  @$pb.TagNumber(3)
  set mintInput(TokenMintInput value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasMintInput() => $_has(2);
  @$pb.TagNumber(3)
  void clearMintInput() => $_clearField(3);
  @$pb.TagNumber(3)
  TokenMintInput ensureMintInput() => $_ensure(2);

  @$pb.TagNumber(4)
  TokenTransferInput get transferInput => $_getN(3);
  @$pb.TagNumber(4)
  set transferInput(TokenTransferInput value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasTransferInput() => $_has(3);
  @$pb.TagNumber(4)
  void clearTransferInput() => $_clearField(4);
  @$pb.TagNumber(4)
  TokenTransferInput ensureTransferInput() => $_ensure(3);

  @$pb.TagNumber(5)
  TokenCreateInput get createInput => $_getN(4);
  @$pb.TagNumber(5)
  set createInput(TokenCreateInput value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasCreateInput() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreateInput() => $_clearField(5);
  @$pb.TagNumber(5)
  TokenCreateInput ensureCreateInput() => $_ensure(4);

  @$pb.TagNumber(6)
  $pb.PbList<FinalTokenOutput> get finalTokenOutputs => $_getList(5);

  /// Optional client-specified deadline for transaction execution.
  /// Included in the final hash to prevent malleability — an attacker cannot
  /// change the deadline without invalidating operator signatures.
  @$pb.TagNumber(7)
  $1.Timestamp get executeBefore => $_getN(6);
  @$pb.TagNumber(7)
  set executeBefore($1.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasExecuteBefore() => $_has(6);
  @$pb.TagNumber(7)
  void clearExecuteBefore() => $_clearField(7);
  @$pb.TagNumber(7)
  $1.Timestamp ensureExecuteBefore() => $_ensure(6);
}

class InvoiceAttachment extends $pb.GeneratedMessage {
  factory InvoiceAttachment({
    $core.String? sparkInvoice,
  }) {
    final result = create();
    if (sparkInvoice != null) result.sparkInvoice = sparkInvoice;
    return result;
  }

  InvoiceAttachment._();

  factory InvoiceAttachment.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InvoiceAttachment.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InvoiceAttachment',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sparkInvoice')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InvoiceAttachment clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InvoiceAttachment copyWith(void Function(InvoiceAttachment) updates) =>
      super.copyWith((message) => updates(message as InvoiceAttachment))
          as InvoiceAttachment;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InvoiceAttachment create() => InvoiceAttachment._();
  @$core.override
  InvoiceAttachment createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InvoiceAttachment getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InvoiceAttachment>(create);
  static InvoiceAttachment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sparkInvoice => $_getSZ(0);
  @$pb.TagNumber(1)
  set sparkInvoice($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSparkInvoice() => $_has(0);
  @$pb.TagNumber(1)
  void clearSparkInvoice() => $_clearField(1);
}

enum SignatureWithIndex_AuthoritySignatures {
  singleSignature,
  multisigSignatures,
  notSet
}

class SignatureWithIndex extends $pb.GeneratedMessage {
  factory SignatureWithIndex({
    $core.List<$core.int>? signature,
    $core.int? inputIndex,
    $2.KeyedSignature? singleSignature,
    $2.MultisigSignatureSet? multisigSignatures,
  }) {
    final result = create();
    if (signature != null) result.signature = signature;
    if (inputIndex != null) result.inputIndex = inputIndex;
    if (singleSignature != null) result.singleSignature = singleSignature;
    if (multisigSignatures != null)
      result.multisigSignatures = multisigSignatures;
    return result;
  }

  SignatureWithIndex._();

  factory SignatureWithIndex.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SignatureWithIndex.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SignatureWithIndex_AuthoritySignatures>
      _SignatureWithIndex_AuthoritySignaturesByTag = {
    3: SignatureWithIndex_AuthoritySignatures.singleSignature,
    4: SignatureWithIndex_AuthoritySignatures.multisigSignatures,
    0: SignatureWithIndex_AuthoritySignatures.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignatureWithIndex',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..aI(2, _omitFieldNames ? '' : 'inputIndex', fieldType: $pb.PbFieldType.OU3)
    ..aOM<$2.KeyedSignature>(3, _omitFieldNames ? '' : 'singleSignature',
        subBuilder: $2.KeyedSignature.create)
    ..aOM<$2.MultisigSignatureSet>(
        4, _omitFieldNames ? '' : 'multisigSignatures',
        subBuilder: $2.MultisigSignatureSet.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignatureWithIndex clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignatureWithIndex copyWith(void Function(SignatureWithIndex) updates) =>
      super.copyWith((message) => updates(message as SignatureWithIndex))
          as SignatureWithIndex;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignatureWithIndex create() => SignatureWithIndex._();
  @$core.override
  SignatureWithIndex createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SignatureWithIndex getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignatureWithIndex>(create);
  static SignatureWithIndex? _defaultInstance;

  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  SignatureWithIndex_AuthoritySignatures whichAuthoritySignatures() =>
      _SignatureWithIndex_AuthoritySignaturesByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearAuthoritySignatures() => $_clearField($_whichOneof(0));

  /// Deprecated: use authority_signatures instead.
  @$pb.TagNumber(1)
  $core.List<$core.int> get signature => $_getN(0);
  @$pb.TagNumber(1)
  set signature($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignature() => $_clearField(1);

  /// The index of the TTXO associated with this signature.
  @$pb.TagNumber(2)
  $core.int get inputIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set inputIndex($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasInputIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearInputIndex() => $_clearField(2);

  @$pb.TagNumber(3)
  $2.KeyedSignature get singleSignature => $_getN(2);
  @$pb.TagNumber(3)
  set singleSignature($2.KeyedSignature value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSingleSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearSingleSignature() => $_clearField(3);
  @$pb.TagNumber(3)
  $2.KeyedSignature ensureSingleSignature() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.MultisigSignatureSet get multisigSignatures => $_getN(3);
  @$pb.TagNumber(4)
  set multisigSignatures($2.MultisigSignatureSet value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasMultisigSignatures() => $_has(3);
  @$pb.TagNumber(4)
  void clearMultisigSignatures() => $_clearField(4);
  @$pb.TagNumber(4)
  $2.MultisigSignatureSet ensureMultisigSignatures() => $_ensure(3);
}

/// A group of signatures for the input TTXOs binding them to the final token
/// transaction hash. This bundle of signatures is specific to a given operator.
class InputTtxoSignaturesPerOperator extends $pb.GeneratedMessage {
  factory InputTtxoSignaturesPerOperator({
    $core.Iterable<SignatureWithIndex>? ttxoSignatures,
    $core.List<$core.int>? operatorIdentityPublicKey,
  }) {
    final result = create();
    if (ttxoSignatures != null) result.ttxoSignatures.addAll(ttxoSignatures);
    if (operatorIdentityPublicKey != null)
      result.operatorIdentityPublicKey = operatorIdentityPublicKey;
    return result;
  }

  InputTtxoSignaturesPerOperator._();

  factory InputTtxoSignaturesPerOperator.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InputTtxoSignaturesPerOperator.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InputTtxoSignaturesPerOperator',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..pPM<SignatureWithIndex>(1, _omitFieldNames ? '' : 'ttxoSignatures',
        subBuilder: SignatureWithIndex.create)
    ..a<$core.List<$core.int>>(2,
        _omitFieldNames ? '' : 'operatorIdentityPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputTtxoSignaturesPerOperator clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputTtxoSignaturesPerOperator copyWith(
          void Function(InputTtxoSignaturesPerOperator) updates) =>
      super.copyWith(
              (message) => updates(message as InputTtxoSignaturesPerOperator))
          as InputTtxoSignaturesPerOperator;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InputTtxoSignaturesPerOperator create() =>
      InputTtxoSignaturesPerOperator._();
  @$core.override
  InputTtxoSignaturesPerOperator createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InputTtxoSignaturesPerOperator getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InputTtxoSignaturesPerOperator>(create);
  static InputTtxoSignaturesPerOperator? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SignatureWithIndex> get ttxoSignatures => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get operatorIdentityPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set operatorIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOperatorIdentityPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperatorIdentityPublicKey() => $_clearField(2);
}

/// === Start Transaction ===
class StartTransactionRequest extends $pb.GeneratedMessage {
  factory StartTransactionRequest({
    $core.List<$core.int>? identityPublicKey,
    TokenTransaction? partialTokenTransaction,
    $core.Iterable<SignatureWithIndex>? partialTokenTransactionOwnerSignatures,
    $fixnum.Int64? validityDurationSeconds,
  }) {
    final result = create();
    if (identityPublicKey != null) result.identityPublicKey = identityPublicKey;
    if (partialTokenTransaction != null)
      result.partialTokenTransaction = partialTokenTransaction;
    if (partialTokenTransactionOwnerSignatures != null)
      result.partialTokenTransactionOwnerSignatures
          .addAll(partialTokenTransactionOwnerSignatures);
    if (validityDurationSeconds != null)
      result.validityDurationSeconds = validityDurationSeconds;
    return result;
  }

  StartTransactionRequest._();

  factory StartTransactionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartTransactionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartTransactionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'identityPublicKey', $pb.PbFieldType.OY)
    ..aOM<TokenTransaction>(2, _omitFieldNames ? '' : 'partialTokenTransaction',
        subBuilder: TokenTransaction.create)
    ..pPM<SignatureWithIndex>(
        3, _omitFieldNames ? '' : 'partialTokenTransactionOwnerSignatures',
        subBuilder: SignatureWithIndex.create)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'validityDurationSeconds',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartTransactionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartTransactionRequest copyWith(
          void Function(StartTransactionRequest) updates) =>
      super.copyWith((message) => updates(message as StartTransactionRequest))
          as StartTransactionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartTransactionRequest create() => StartTransactionRequest._();
  @$core.override
  StartTransactionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartTransactionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartTransactionRequest>(create);
  static StartTransactionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get identityPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set identityPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentityPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentityPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  TokenTransaction get partialTokenTransaction => $_getN(1);
  @$pb.TagNumber(2)
  set partialTokenTransaction(TokenTransaction value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPartialTokenTransaction() => $_has(1);
  @$pb.TagNumber(2)
  void clearPartialTokenTransaction() => $_clearField(2);
  @$pb.TagNumber(2)
  TokenTransaction ensurePartialTokenTransaction() => $_ensure(1);

  /// Filled by signing the partial token transaction hash with the
  /// owner/issuer private key. For mint transactions this will be one
  /// signature for the input issuer_public_key. For transfer transactions this
  /// will be one signature for each input to be sepnt.
  @$pb.TagNumber(3)
  $pb.PbList<SignatureWithIndex> get partialTokenTransactionOwnerSignatures =>
      $_getList(2);

  /// How long the transaction should be valid for, in seconds.
  /// The server will set the actual expiry_time in the final transaction based
  /// on this duration. Must be within [1, 300] seconds.
  @$pb.TagNumber(4)
  $fixnum.Int64 get validityDurationSeconds => $_getI64(3);
  @$pb.TagNumber(4)
  set validityDurationSeconds($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasValidityDurationSeconds() => $_has(3);
  @$pb.TagNumber(4)
  void clearValidityDurationSeconds() => $_clearField(4);
}

class StartTransactionResponse extends $pb.GeneratedMessage {
  factory StartTransactionResponse({
    TokenTransaction? finalTokenTransaction,
    $3.SigningKeyshare? keyshareInfo,
  }) {
    final result = create();
    if (finalTokenTransaction != null)
      result.finalTokenTransaction = finalTokenTransaction;
    if (keyshareInfo != null) result.keyshareInfo = keyshareInfo;
    return result;
  }

  StartTransactionResponse._();

  factory StartTransactionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartTransactionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartTransactionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..aOM<TokenTransaction>(1, _omitFieldNames ? '' : 'finalTokenTransaction',
        subBuilder: TokenTransaction.create)
    ..aOM<$3.SigningKeyshare>(2, _omitFieldNames ? '' : 'keyshareInfo',
        subBuilder: $3.SigningKeyshare.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartTransactionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartTransactionResponse copyWith(
          void Function(StartTransactionResponse) updates) =>
      super.copyWith((message) => updates(message as StartTransactionResponse))
          as StartTransactionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartTransactionResponse create() => StartTransactionResponse._();
  @$core.override
  StartTransactionResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartTransactionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartTransactionResponse>(create);
  static StartTransactionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  TokenTransaction get finalTokenTransaction => $_getN(0);
  @$pb.TagNumber(1)
  set finalTokenTransaction(TokenTransaction value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFinalTokenTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearFinalTokenTransaction() => $_clearField(1);
  @$pb.TagNumber(1)
  TokenTransaction ensureFinalTokenTransaction() => $_ensure(0);

  @$pb.TagNumber(2)
  $3.SigningKeyshare get keyshareInfo => $_getN(1);
  @$pb.TagNumber(2)
  set keyshareInfo($3.SigningKeyshare value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasKeyshareInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearKeyshareInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  $3.SigningKeyshare ensureKeyshareInfo() => $_ensure(1);
}

class CommitTransactionRequest extends $pb.GeneratedMessage {
  factory CommitTransactionRequest({
    TokenTransaction? finalTokenTransaction,
    $core.List<$core.int>? finalTokenTransactionHash,
    $core.Iterable<InputTtxoSignaturesPerOperator>?
        inputTtxoSignaturesPerOperator,
    $core.List<$core.int>? ownerIdentityPublicKey,
  }) {
    final result = create();
    if (finalTokenTransaction != null)
      result.finalTokenTransaction = finalTokenTransaction;
    if (finalTokenTransactionHash != null)
      result.finalTokenTransactionHash = finalTokenTransactionHash;
    if (inputTtxoSignaturesPerOperator != null)
      result.inputTtxoSignaturesPerOperator
          .addAll(inputTtxoSignaturesPerOperator);
    if (ownerIdentityPublicKey != null)
      result.ownerIdentityPublicKey = ownerIdentityPublicKey;
    return result;
  }

  CommitTransactionRequest._();

  factory CommitTransactionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CommitTransactionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CommitTransactionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..aOM<TokenTransaction>(1, _omitFieldNames ? '' : 'finalTokenTransaction',
        subBuilder: TokenTransaction.create)
    ..a<$core.List<$core.int>>(2,
        _omitFieldNames ? '' : 'finalTokenTransactionHash', $pb.PbFieldType.OY)
    ..pPM<InputTtxoSignaturesPerOperator>(
        3, _omitFieldNames ? '' : 'inputTtxoSignaturesPerOperator',
        subBuilder: InputTtxoSignaturesPerOperator.create)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'ownerIdentityPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommitTransactionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommitTransactionRequest copyWith(
          void Function(CommitTransactionRequest) updates) =>
      super.copyWith((message) => updates(message as CommitTransactionRequest))
          as CommitTransactionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommitTransactionRequest create() => CommitTransactionRequest._();
  @$core.override
  CommitTransactionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CommitTransactionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommitTransactionRequest>(create);
  static CommitTransactionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  TokenTransaction get finalTokenTransaction => $_getN(0);
  @$pb.TagNumber(1)
  set finalTokenTransaction(TokenTransaction value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFinalTokenTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearFinalTokenTransaction() => $_clearField(1);
  @$pb.TagNumber(1)
  TokenTransaction ensureFinalTokenTransaction() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get finalTokenTransactionHash => $_getN(1);
  @$pb.TagNumber(2)
  set finalTokenTransactionHash($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFinalTokenTransactionHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearFinalTokenTransactionHash() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<InputTtxoSignaturesPerOperator>
      get inputTtxoSignaturesPerOperator => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get ownerIdentityPublicKey => $_getN(3);
  @$pb.TagNumber(4)
  set ownerIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOwnerIdentityPublicKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearOwnerIdentityPublicKey() => $_clearField(4);
}

class CommitProgress extends $pb.GeneratedMessage {
  factory CommitProgress({
    $core.Iterable<$core.List<$core.int>>? committedOperatorPublicKeys,
    $core.Iterable<$core.List<$core.int>>? uncommittedOperatorPublicKeys,
  }) {
    final result = create();
    if (committedOperatorPublicKeys != null)
      result.committedOperatorPublicKeys.addAll(committedOperatorPublicKeys);
    if (uncommittedOperatorPublicKeys != null)
      result.uncommittedOperatorPublicKeys
          .addAll(uncommittedOperatorPublicKeys);
    return result;
  }

  CommitProgress._();

  factory CommitProgress.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CommitProgress.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CommitProgress',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..p<$core.List<$core.int>>(
        1,
        _omitFieldNames ? '' : 'committedOperatorPublicKeys',
        $pb.PbFieldType.PY)
    ..p<$core.List<$core.int>>(
        2,
        _omitFieldNames ? '' : 'uncommittedOperatorPublicKeys',
        $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommitProgress clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommitProgress copyWith(void Function(CommitProgress) updates) =>
      super.copyWith((message) => updates(message as CommitProgress))
          as CommitProgress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommitProgress create() => CommitProgress._();
  @$core.override
  CommitProgress createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CommitProgress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommitProgress>(create);
  static CommitProgress? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.List<$core.int>> get committedOperatorPublicKeys =>
      $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$core.List<$core.int>> get uncommittedOperatorPublicKeys =>
      $_getList(1);
}

class CommitTransactionResponse extends $pb.GeneratedMessage {
  factory CommitTransactionResponse({
    CommitStatus? commitStatus,
    CommitProgress? commitProgress,
    $core.List<$core.int>? tokenIdentifier,
  }) {
    final result = create();
    if (commitStatus != null) result.commitStatus = commitStatus;
    if (commitProgress != null) result.commitProgress = commitProgress;
    if (tokenIdentifier != null) result.tokenIdentifier = tokenIdentifier;
    return result;
  }

  CommitTransactionResponse._();

  factory CommitTransactionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CommitTransactionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CommitTransactionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..aE<CommitStatus>(1, _omitFieldNames ? '' : 'commitStatus',
        enumValues: CommitStatus.values)
    ..aOM<CommitProgress>(2, _omitFieldNames ? '' : 'commitProgress',
        subBuilder: CommitProgress.create)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'tokenIdentifier', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommitTransactionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommitTransactionResponse copyWith(
          void Function(CommitTransactionResponse) updates) =>
      super.copyWith((message) => updates(message as CommitTransactionResponse))
          as CommitTransactionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommitTransactionResponse create() => CommitTransactionResponse._();
  @$core.override
  CommitTransactionResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CommitTransactionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommitTransactionResponse>(create);
  static CommitTransactionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  CommitStatus get commitStatus => $_getN(0);
  @$pb.TagNumber(1)
  set commitStatus(CommitStatus value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCommitStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommitStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  CommitProgress get commitProgress => $_getN(1);
  @$pb.TagNumber(2)
  set commitProgress(CommitProgress value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCommitProgress() => $_has(1);
  @$pb.TagNumber(2)
  void clearCommitProgress() => $_clearField(2);
  @$pb.TagNumber(2)
  CommitProgress ensureCommitProgress() => $_ensure(1);

  /// The raw token identifier is returned on create transactions
  @$pb.TagNumber(3)
  $core.List<$core.int> get tokenIdentifier => $_getN(2);
  @$pb.TagNumber(3)
  set tokenIdentifier($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTokenIdentifier() => $_has(2);
  @$pb.TagNumber(3)
  void clearTokenIdentifier() => $_clearField(3);
}

class BroadcastTransactionRequest extends $pb.GeneratedMessage {
  factory BroadcastTransactionRequest({
    $core.List<$core.int>? identityPublicKey,
    PartialTokenTransaction? partialTokenTransaction,
    $core.Iterable<SignatureWithIndex>? tokenTransactionOwnerSignatures,
  }) {
    final result = create();
    if (identityPublicKey != null) result.identityPublicKey = identityPublicKey;
    if (partialTokenTransaction != null)
      result.partialTokenTransaction = partialTokenTransaction;
    if (tokenTransactionOwnerSignatures != null)
      result.tokenTransactionOwnerSignatures
          .addAll(tokenTransactionOwnerSignatures);
    return result;
  }

  BroadcastTransactionRequest._();

  factory BroadcastTransactionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BroadcastTransactionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BroadcastTransactionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'identityPublicKey', $pb.PbFieldType.OY)
    ..aOM<PartialTokenTransaction>(
        2, _omitFieldNames ? '' : 'partialTokenTransaction',
        subBuilder: PartialTokenTransaction.create)
    ..pPM<SignatureWithIndex>(
        3, _omitFieldNames ? '' : 'tokenTransactionOwnerSignatures',
        subBuilder: SignatureWithIndex.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastTransactionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastTransactionRequest copyWith(
          void Function(BroadcastTransactionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as BroadcastTransactionRequest))
          as BroadcastTransactionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BroadcastTransactionRequest create() =>
      BroadcastTransactionRequest._();
  @$core.override
  BroadcastTransactionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BroadcastTransactionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcastTransactionRequest>(create);
  static BroadcastTransactionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get identityPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set identityPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentityPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentityPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  PartialTokenTransaction get partialTokenTransaction => $_getN(1);
  @$pb.TagNumber(2)
  set partialTokenTransaction(PartialTokenTransaction value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPartialTokenTransaction() => $_has(1);
  @$pb.TagNumber(2)
  void clearPartialTokenTransaction() => $_clearField(2);
  @$pb.TagNumber(2)
  PartialTokenTransaction ensurePartialTokenTransaction() => $_ensure(1);

  /// Filled by signing the partial token transaction hash with the
  /// owner/issuer private key. For mint transactions this will be one
  /// signature for the input issuer_public_key. For transfer transactions this
  /// will be one signature for each input to be spent.
  @$pb.TagNumber(3)
  $pb.PbList<SignatureWithIndex> get tokenTransactionOwnerSignatures =>
      $_getList(2);
}

class BroadcastTransactionResponse extends $pb.GeneratedMessage {
  factory BroadcastTransactionResponse({
    FinalTokenTransaction? finalTokenTransaction,
    CommitStatus? commitStatus,
    CommitProgress? commitProgress,
    $core.List<$core.int>? tokenIdentifier,
  }) {
    final result = create();
    if (finalTokenTransaction != null)
      result.finalTokenTransaction = finalTokenTransaction;
    if (commitStatus != null) result.commitStatus = commitStatus;
    if (commitProgress != null) result.commitProgress = commitProgress;
    if (tokenIdentifier != null) result.tokenIdentifier = tokenIdentifier;
    return result;
  }

  BroadcastTransactionResponse._();

  factory BroadcastTransactionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BroadcastTransactionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BroadcastTransactionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..aOM<FinalTokenTransaction>(
        1, _omitFieldNames ? '' : 'finalTokenTransaction',
        subBuilder: FinalTokenTransaction.create)
    ..aE<CommitStatus>(2, _omitFieldNames ? '' : 'commitStatus',
        enumValues: CommitStatus.values)
    ..aOM<CommitProgress>(3, _omitFieldNames ? '' : 'commitProgress',
        subBuilder: CommitProgress.create)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'tokenIdentifier', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastTransactionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastTransactionResponse copyWith(
          void Function(BroadcastTransactionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as BroadcastTransactionResponse))
          as BroadcastTransactionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BroadcastTransactionResponse create() =>
      BroadcastTransactionResponse._();
  @$core.override
  BroadcastTransactionResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BroadcastTransactionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcastTransactionResponse>(create);
  static BroadcastTransactionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  FinalTokenTransaction get finalTokenTransaction => $_getN(0);
  @$pb.TagNumber(1)
  set finalTokenTransaction(FinalTokenTransaction value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFinalTokenTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearFinalTokenTransaction() => $_clearField(1);
  @$pb.TagNumber(1)
  FinalTokenTransaction ensureFinalTokenTransaction() => $_ensure(0);

  @$pb.TagNumber(2)
  CommitStatus get commitStatus => $_getN(1);
  @$pb.TagNumber(2)
  set commitStatus(CommitStatus value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCommitStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearCommitStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  CommitProgress get commitProgress => $_getN(2);
  @$pb.TagNumber(3)
  set commitProgress(CommitProgress value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCommitProgress() => $_has(2);
  @$pb.TagNumber(3)
  void clearCommitProgress() => $_clearField(3);
  @$pb.TagNumber(3)
  CommitProgress ensureCommitProgress() => $_ensure(2);

  /// The raw token identifier is returned on create transactions
  @$pb.TagNumber(4)
  $core.List<$core.int> get tokenIdentifier => $_getN(3);
  @$pb.TagNumber(4)
  set tokenIdentifier($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTokenIdentifier() => $_has(3);
  @$pb.TagNumber(4)
  void clearTokenIdentifier() => $_clearField(4);
}

class QueryTokenMetadataRequest extends $pb.GeneratedMessage {
  factory QueryTokenMetadataRequest({
    $core.Iterable<$core.List<$core.int>>? tokenIdentifiers,
    $core.Iterable<$core.List<$core.int>>? issuerPublicKeys,
  }) {
    final result = create();
    if (tokenIdentifiers != null)
      result.tokenIdentifiers.addAll(tokenIdentifiers);
    if (issuerPublicKeys != null)
      result.issuerPublicKeys.addAll(issuerPublicKeys);
    return result;
  }

  QueryTokenMetadataRequest._();

  factory QueryTokenMetadataRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryTokenMetadataRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryTokenMetadataRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..p<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'tokenIdentifiers', $pb.PbFieldType.PY)
    ..p<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'issuerPublicKeys', $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryTokenMetadataRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryTokenMetadataRequest copyWith(
          void Function(QueryTokenMetadataRequest) updates) =>
      super.copyWith((message) => updates(message as QueryTokenMetadataRequest))
          as QueryTokenMetadataRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryTokenMetadataRequest create() => QueryTokenMetadataRequest._();
  @$core.override
  QueryTokenMetadataRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryTokenMetadataRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryTokenMetadataRequest>(create);
  static QueryTokenMetadataRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.List<$core.int>> get tokenIdentifiers => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$core.List<$core.int>> get issuerPublicKeys => $_getList(1);
}

class TokenMetadata extends $pb.GeneratedMessage {
  factory TokenMetadata({
    $core.List<$core.int>? issuerPublicKey,
    $core.String? tokenName,
    $core.String? tokenTicker,
    $core.int? decimals,
    $core.List<$core.int>? maxSupply,
    $core.bool? isFreezable,
    $core.List<$core.int>? creationEntityPublicKey,
    $core.List<$core.int>? tokenIdentifier,
    $core.List<$core.int>? extraMetadata,
  }) {
    final result = create();
    if (issuerPublicKey != null) result.issuerPublicKey = issuerPublicKey;
    if (tokenName != null) result.tokenName = tokenName;
    if (tokenTicker != null) result.tokenTicker = tokenTicker;
    if (decimals != null) result.decimals = decimals;
    if (maxSupply != null) result.maxSupply = maxSupply;
    if (isFreezable != null) result.isFreezable = isFreezable;
    if (creationEntityPublicKey != null)
      result.creationEntityPublicKey = creationEntityPublicKey;
    if (tokenIdentifier != null) result.tokenIdentifier = tokenIdentifier;
    if (extraMetadata != null) result.extraMetadata = extraMetadata;
    return result;
  }

  TokenMetadata._();

  factory TokenMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenMetadata',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'issuerPublicKey', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'tokenName')
    ..aOS(3, _omitFieldNames ? '' : 'tokenTicker')
    ..aI(4, _omitFieldNames ? '' : 'decimals', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'maxSupply', $pb.PbFieldType.OY)
    ..aOB(6, _omitFieldNames ? '' : 'isFreezable')
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'creationEntityPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        8, _omitFieldNames ? '' : 'tokenIdentifier', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        9, _omitFieldNames ? '' : 'extraMetadata', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenMetadata copyWith(void Function(TokenMetadata) updates) =>
      super.copyWith((message) => updates(message as TokenMetadata))
          as TokenMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenMetadata create() => TokenMetadata._();
  @$core.override
  TokenMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenMetadata>(create);
  static TokenMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get issuerPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set issuerPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIssuerPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearIssuerPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tokenName => $_getSZ(1);
  @$pb.TagNumber(2)
  set tokenName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTokenName() => $_has(1);
  @$pb.TagNumber(2)
  void clearTokenName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get tokenTicker => $_getSZ(2);
  @$pb.TagNumber(3)
  set tokenTicker($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTokenTicker() => $_has(2);
  @$pb.TagNumber(3)
  void clearTokenTicker() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get decimals => $_getIZ(3);
  @$pb.TagNumber(4)
  set decimals($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDecimals() => $_has(3);
  @$pb.TagNumber(4)
  void clearDecimals() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get maxSupply => $_getN(4);
  @$pb.TagNumber(5)
  set maxSupply($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMaxSupply() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxSupply() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isFreezable => $_getBF(5);
  @$pb.TagNumber(6)
  set isFreezable($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIsFreezable() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsFreezable() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get creationEntityPublicKey => $_getN(6);
  @$pb.TagNumber(7)
  set creationEntityPublicKey($core.List<$core.int> value) =>
      $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCreationEntityPublicKey() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreationEntityPublicKey() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.int> get tokenIdentifier => $_getN(7);
  @$pb.TagNumber(8)
  set tokenIdentifier($core.List<$core.int> value) => $_setBytes(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTokenIdentifier() => $_has(7);
  @$pb.TagNumber(8)
  void clearTokenIdentifier() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.int> get extraMetadata => $_getN(8);
  @$pb.TagNumber(9)
  set extraMetadata($core.List<$core.int> value) => $_setBytes(8, value);
  @$pb.TagNumber(9)
  $core.bool hasExtraMetadata() => $_has(8);
  @$pb.TagNumber(9)
  void clearExtraMetadata() => $_clearField(9);
}

class QueryTokenMetadataResponse extends $pb.GeneratedMessage {
  factory QueryTokenMetadataResponse({
    $core.Iterable<TokenMetadata>? tokenMetadata,
  }) {
    final result = create();
    if (tokenMetadata != null) result.tokenMetadata.addAll(tokenMetadata);
    return result;
  }

  QueryTokenMetadataResponse._();

  factory QueryTokenMetadataResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryTokenMetadataResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryTokenMetadataResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..pPM<TokenMetadata>(1, _omitFieldNames ? '' : 'tokenMetadata',
        subBuilder: TokenMetadata.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryTokenMetadataResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryTokenMetadataResponse copyWith(
          void Function(QueryTokenMetadataResponse) updates) =>
      super.copyWith(
              (message) => updates(message as QueryTokenMetadataResponse))
          as QueryTokenMetadataResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryTokenMetadataResponse create() => QueryTokenMetadataResponse._();
  @$core.override
  QueryTokenMetadataResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryTokenMetadataResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryTokenMetadataResponse>(create);
  static QueryTokenMetadataResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TokenMetadata> get tokenMetadata => $_getList(0);
}

class QueryTokenOutputsRequest extends $pb.GeneratedMessage {
  factory QueryTokenOutputsRequest({
    $core.Iterable<$core.List<$core.int>>? ownerPublicKeys,
    $core.Iterable<$core.List<$core.int>>? issuerPublicKeys,
    $3.Network? network,
    $core.Iterable<$core.List<$core.int>>? tokenIdentifiers,
    $3.PageRequest? pageRequest,
  }) {
    final result = create();
    if (ownerPublicKeys != null) result.ownerPublicKeys.addAll(ownerPublicKeys);
    if (issuerPublicKeys != null)
      result.issuerPublicKeys.addAll(issuerPublicKeys);
    if (network != null) result.network = network;
    if (tokenIdentifiers != null)
      result.tokenIdentifiers.addAll(tokenIdentifiers);
    if (pageRequest != null) result.pageRequest = pageRequest;
    return result;
  }

  QueryTokenOutputsRequest._();

  factory QueryTokenOutputsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryTokenOutputsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryTokenOutputsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..p<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'ownerPublicKeys', $pb.PbFieldType.PY)
    ..p<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'issuerPublicKeys', $pb.PbFieldType.PY)
    ..aE<$3.Network>(3, _omitFieldNames ? '' : 'network',
        enumValues: $3.Network.values)
    ..p<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'tokenIdentifiers', $pb.PbFieldType.PY)
    ..aOM<$3.PageRequest>(5, _omitFieldNames ? '' : 'pageRequest',
        subBuilder: $3.PageRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryTokenOutputsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryTokenOutputsRequest copyWith(
          void Function(QueryTokenOutputsRequest) updates) =>
      super.copyWith((message) => updates(message as QueryTokenOutputsRequest))
          as QueryTokenOutputsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryTokenOutputsRequest create() => QueryTokenOutputsRequest._();
  @$core.override
  QueryTokenOutputsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryTokenOutputsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryTokenOutputsRequest>(create);
  static QueryTokenOutputsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.List<$core.int>> get ownerPublicKeys => $_getList(0);

  /// Optionally provide issuer public keys or token identifiers. If both are not set return outputs for all tokens.
  @$pb.TagNumber(2)
  $pb.PbList<$core.List<$core.int>> get issuerPublicKeys => $_getList(1);

  @$pb.TagNumber(3)
  $3.Network get network => $_getN(2);
  @$pb.TagNumber(3)
  set network($3.Network value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasNetwork() => $_has(2);
  @$pb.TagNumber(3)
  void clearNetwork() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.List<$core.int>> get tokenIdentifiers => $_getList(3);

  /// For pagination
  @$pb.TagNumber(5)
  $3.PageRequest get pageRequest => $_getN(4);
  @$pb.TagNumber(5)
  set pageRequest($3.PageRequest value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPageRequest() => $_has(4);
  @$pb.TagNumber(5)
  void clearPageRequest() => $_clearField(5);
  @$pb.TagNumber(5)
  $3.PageRequest ensurePageRequest() => $_ensure(4);
}

enum QueryTokenTransactionsRequest_QueryType { byTxHash, byFilters, notSet }

/// Request constraints are combined using an AND relation.
class QueryTokenTransactionsRequest extends $pb.GeneratedMessage {
  factory QueryTokenTransactionsRequest({
    $core.Iterable<$core.String>? outputIds,
    $core.Iterable<$core.List<$core.int>>? ownerPublicKeys,
    $core.Iterable<$core.List<$core.int>>? issuerPublicKeys,
    $core.Iterable<$core.List<$core.int>>? tokenTransactionHashes,
    $fixnum.Int64? limit,
    $fixnum.Int64? offset,
    $core.Iterable<$core.List<$core.int>>? tokenIdentifiers,
    $3.Order? order,
    QueryTokenTransactionsByTxHash? byTxHash,
    QueryTokenTransactionsByFilters? byFilters,
  }) {
    final result = create();
    if (outputIds != null) result.outputIds.addAll(outputIds);
    if (ownerPublicKeys != null) result.ownerPublicKeys.addAll(ownerPublicKeys);
    if (issuerPublicKeys != null)
      result.issuerPublicKeys.addAll(issuerPublicKeys);
    if (tokenTransactionHashes != null)
      result.tokenTransactionHashes.addAll(tokenTransactionHashes);
    if (limit != null) result.limit = limit;
    if (offset != null) result.offset = offset;
    if (tokenIdentifiers != null)
      result.tokenIdentifiers.addAll(tokenIdentifiers);
    if (order != null) result.order = order;
    if (byTxHash != null) result.byTxHash = byTxHash;
    if (byFilters != null) result.byFilters = byFilters;
    return result;
  }

  QueryTokenTransactionsRequest._();

  factory QueryTokenTransactionsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryTokenTransactionsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, QueryTokenTransactionsRequest_QueryType>
      _QueryTokenTransactionsRequest_QueryTypeByTag = {
    9: QueryTokenTransactionsRequest_QueryType.byTxHash,
    10: QueryTokenTransactionsRequest_QueryType.byFilters,
    0: QueryTokenTransactionsRequest_QueryType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryTokenTransactionsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..oo(0, [9, 10])
    ..pPS(1, _omitFieldNames ? '' : 'outputIds')
    ..p<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'ownerPublicKeys', $pb.PbFieldType.PY)
    ..p<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'issuerPublicKeys', $pb.PbFieldType.PY)
    ..p<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'tokenTransactionHashes', $pb.PbFieldType.PY)
    ..aInt64(5, _omitFieldNames ? '' : 'limit')
    ..aInt64(6, _omitFieldNames ? '' : 'offset')
    ..p<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'tokenIdentifiers', $pb.PbFieldType.PY)
    ..aE<$3.Order>(8, _omitFieldNames ? '' : 'order',
        enumValues: $3.Order.values)
    ..aOM<QueryTokenTransactionsByTxHash>(9, _omitFieldNames ? '' : 'byTxHash',
        subBuilder: QueryTokenTransactionsByTxHash.create)
    ..aOM<QueryTokenTransactionsByFilters>(
        10, _omitFieldNames ? '' : 'byFilters',
        subBuilder: QueryTokenTransactionsByFilters.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryTokenTransactionsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryTokenTransactionsRequest copyWith(
          void Function(QueryTokenTransactionsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as QueryTokenTransactionsRequest))
          as QueryTokenTransactionsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryTokenTransactionsRequest create() =>
      QueryTokenTransactionsRequest._();
  @$core.override
  QueryTokenTransactionsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryTokenTransactionsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryTokenTransactionsRequest>(create);
  static QueryTokenTransactionsRequest? _defaultInstance;

  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  QueryTokenTransactionsRequest_QueryType whichQueryType() =>
      _QueryTokenTransactionsRequest_QueryTypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  void clearQueryType() => $_clearField($_whichOneof(0));

  /// Returns transactions that have one of these output ids in the input or output.
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get outputIds => $_getList(0);

  /// Returns transactions that have this owner public key as the sender or receiver in one or more of the outputs.
  @$pb.TagNumber(2)
  $pb.PbList<$core.List<$core.int>> get ownerPublicKeys => $_getList(1);

  /// Returns transactions that are related to this token public key.
  @$pb.TagNumber(3)
  $pb.PbList<$core.List<$core.int>> get issuerPublicKeys => $_getList(2);

  /// Returns transactions that match the provided transaction hashes.
  @$pb.TagNumber(4)
  $pb.PbList<$core.List<$core.int>> get tokenTransactionHashes => $_getList(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get limit => $_getI64(4);
  @$pb.TagNumber(5)
  set limit($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLimit() => $_has(4);
  @$pb.TagNumber(5)
  void clearLimit() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get offset => $_getI64(5);
  @$pb.TagNumber(6)
  set offset($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasOffset() => $_has(5);
  @$pb.TagNumber(6)
  void clearOffset() => $_clearField(6);

  /// Returns transactions that are related to this token identifier.
  @$pb.TagNumber(7)
  $pb.PbList<$core.List<$core.int>> get tokenIdentifiers => $_getList(6);

  @$pb.TagNumber(8)
  $3.Order get order => $_getN(7);
  @$pb.TagNumber(8)
  set order($3.Order value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasOrder() => $_has(7);
  @$pb.TagNumber(8)
  void clearOrder() => $_clearField(8);

  @$pb.TagNumber(9)
  QueryTokenTransactionsByTxHash get byTxHash => $_getN(8);
  @$pb.TagNumber(9)
  set byTxHash(QueryTokenTransactionsByTxHash value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasByTxHash() => $_has(8);
  @$pb.TagNumber(9)
  void clearByTxHash() => $_clearField(9);
  @$pb.TagNumber(9)
  QueryTokenTransactionsByTxHash ensureByTxHash() => $_ensure(8);

  @$pb.TagNumber(10)
  QueryTokenTransactionsByFilters get byFilters => $_getN(9);
  @$pb.TagNumber(10)
  set byFilters(QueryTokenTransactionsByFilters value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasByFilters() => $_has(9);
  @$pb.TagNumber(10)
  void clearByFilters() => $_clearField(10);
  @$pb.TagNumber(10)
  QueryTokenTransactionsByFilters ensureByFilters() => $_ensure(9);
}

class QueryTokenTransactionsByTxHash extends $pb.GeneratedMessage {
  factory QueryTokenTransactionsByTxHash({
    $core.Iterable<$core.List<$core.int>>? tokenTransactionHashes,
  }) {
    final result = create();
    if (tokenTransactionHashes != null)
      result.tokenTransactionHashes.addAll(tokenTransactionHashes);
    return result;
  }

  QueryTokenTransactionsByTxHash._();

  factory QueryTokenTransactionsByTxHash.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryTokenTransactionsByTxHash.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryTokenTransactionsByTxHash',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..p<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'tokenTransactionHashes', $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryTokenTransactionsByTxHash clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryTokenTransactionsByTxHash copyWith(
          void Function(QueryTokenTransactionsByTxHash) updates) =>
      super.copyWith(
              (message) => updates(message as QueryTokenTransactionsByTxHash))
          as QueryTokenTransactionsByTxHash;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryTokenTransactionsByTxHash create() =>
      QueryTokenTransactionsByTxHash._();
  @$core.override
  QueryTokenTransactionsByTxHash createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryTokenTransactionsByTxHash getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryTokenTransactionsByTxHash>(create);
  static QueryTokenTransactionsByTxHash? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.List<$core.int>> get tokenTransactionHashes => $_getList(0);
}

class QueryTokenTransactionsByFilters extends $pb.GeneratedMessage {
  factory QueryTokenTransactionsByFilters({
    $core.Iterable<$core.String>? outputIds,
    $core.Iterable<$core.List<$core.int>>? ownerPublicKeys,
    $core.Iterable<$core.List<$core.int>>? issuerPublicKeys,
    $core.Iterable<$core.List<$core.int>>? tokenIdentifiers,
    $3.PageRequest? pageRequest,
  }) {
    final result = create();
    if (outputIds != null) result.outputIds.addAll(outputIds);
    if (ownerPublicKeys != null) result.ownerPublicKeys.addAll(ownerPublicKeys);
    if (issuerPublicKeys != null)
      result.issuerPublicKeys.addAll(issuerPublicKeys);
    if (tokenIdentifiers != null)
      result.tokenIdentifiers.addAll(tokenIdentifiers);
    if (pageRequest != null) result.pageRequest = pageRequest;
    return result;
  }

  QueryTokenTransactionsByFilters._();

  factory QueryTokenTransactionsByFilters.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryTokenTransactionsByFilters.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryTokenTransactionsByFilters',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'outputIds')
    ..p<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'ownerPublicKeys', $pb.PbFieldType.PY)
    ..p<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'issuerPublicKeys', $pb.PbFieldType.PY)
    ..p<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'tokenIdentifiers', $pb.PbFieldType.PY)
    ..aOM<$3.PageRequest>(5, _omitFieldNames ? '' : 'pageRequest',
        subBuilder: $3.PageRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryTokenTransactionsByFilters clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryTokenTransactionsByFilters copyWith(
          void Function(QueryTokenTransactionsByFilters) updates) =>
      super.copyWith(
              (message) => updates(message as QueryTokenTransactionsByFilters))
          as QueryTokenTransactionsByFilters;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryTokenTransactionsByFilters create() =>
      QueryTokenTransactionsByFilters._();
  @$core.override
  QueryTokenTransactionsByFilters createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryTokenTransactionsByFilters getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryTokenTransactionsByFilters>(
          create);
  static QueryTokenTransactionsByFilters? _defaultInstance;

  /// Returns transactions that have one of these output ids in the input or output.
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get outputIds => $_getList(0);

  /// Returns transactions that have this owner public key as the sender or receiver in one or more of the output leaves.
  @$pb.TagNumber(2)
  $pb.PbList<$core.List<$core.int>> get ownerPublicKeys => $_getList(1);

  /// Returns transactions that are related to this token public key.
  @$pb.TagNumber(3)
  $pb.PbList<$core.List<$core.int>> get issuerPublicKeys => $_getList(2);

  /// Returns transactions that are related to this token identifier.
  @$pb.TagNumber(4)
  $pb.PbList<$core.List<$core.int>> get tokenIdentifiers => $_getList(3);

  /// For cursor-based pagination
  @$pb.TagNumber(5)
  $3.PageRequest get pageRequest => $_getN(4);
  @$pb.TagNumber(5)
  set pageRequest($3.PageRequest value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPageRequest() => $_has(4);
  @$pb.TagNumber(5)
  void clearPageRequest() => $_clearField(5);
  @$pb.TagNumber(5)
  $3.PageRequest ensurePageRequest() => $_ensure(4);
}

class QueryTokenTransactionsResponse extends $pb.GeneratedMessage {
  factory QueryTokenTransactionsResponse({
    $core.Iterable<TokenTransactionWithStatus>? tokenTransactionsWithStatus,
    $fixnum.Int64? offset,
    $3.PageResponse? pageResponse,
  }) {
    final result = create();
    if (tokenTransactionsWithStatus != null)
      result.tokenTransactionsWithStatus.addAll(tokenTransactionsWithStatus);
    if (offset != null) result.offset = offset;
    if (pageResponse != null) result.pageResponse = pageResponse;
    return result;
  }

  QueryTokenTransactionsResponse._();

  factory QueryTokenTransactionsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryTokenTransactionsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryTokenTransactionsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..pPM<TokenTransactionWithStatus>(
        1, _omitFieldNames ? '' : 'tokenTransactionsWithStatus',
        subBuilder: TokenTransactionWithStatus.create)
    ..aInt64(2, _omitFieldNames ? '' : 'offset')
    ..aOM<$3.PageResponse>(3, _omitFieldNames ? '' : 'pageResponse',
        subBuilder: $3.PageResponse.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryTokenTransactionsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryTokenTransactionsResponse copyWith(
          void Function(QueryTokenTransactionsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as QueryTokenTransactionsResponse))
          as QueryTokenTransactionsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryTokenTransactionsResponse create() =>
      QueryTokenTransactionsResponse._();
  @$core.override
  QueryTokenTransactionsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryTokenTransactionsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryTokenTransactionsResponse>(create);
  static QueryTokenTransactionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TokenTransactionWithStatus> get tokenTransactionsWithStatus =>
      $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get offset => $_getI64(1);
  @$pb.TagNumber(2)
  set offset($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => $_clearField(2);

  @$pb.TagNumber(3)
  $3.PageResponse get pageResponse => $_getN(2);
  @$pb.TagNumber(3)
  set pageResponse($3.PageResponse value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPageResponse() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageResponse() => $_clearField(3);
  @$pb.TagNumber(3)
  $3.PageResponse ensurePageResponse() => $_ensure(2);
}

class OutputWithPreviousTransactionData extends $pb.GeneratedMessage {
  factory OutputWithPreviousTransactionData({
    TokenOutput? output,
    $core.List<$core.int>? previousTransactionHash,
    $core.int? previousTransactionVout,
  }) {
    final result = create();
    if (output != null) result.output = output;
    if (previousTransactionHash != null)
      result.previousTransactionHash = previousTransactionHash;
    if (previousTransactionVout != null)
      result.previousTransactionVout = previousTransactionVout;
    return result;
  }

  OutputWithPreviousTransactionData._();

  factory OutputWithPreviousTransactionData.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OutputWithPreviousTransactionData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OutputWithPreviousTransactionData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..aOM<TokenOutput>(1, _omitFieldNames ? '' : 'output',
        subBuilder: TokenOutput.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'previousTransactionHash', $pb.PbFieldType.OY)
    ..aI(3, _omitFieldNames ? '' : 'previousTransactionVout',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutputWithPreviousTransactionData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutputWithPreviousTransactionData copyWith(
          void Function(OutputWithPreviousTransactionData) updates) =>
      super.copyWith((message) =>
              updates(message as OutputWithPreviousTransactionData))
          as OutputWithPreviousTransactionData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OutputWithPreviousTransactionData create() =>
      OutputWithPreviousTransactionData._();
  @$core.override
  OutputWithPreviousTransactionData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OutputWithPreviousTransactionData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OutputWithPreviousTransactionData>(
          create);
  static OutputWithPreviousTransactionData? _defaultInstance;

  @$pb.TagNumber(1)
  TokenOutput get output => $_getN(0);
  @$pb.TagNumber(1)
  set output(TokenOutput value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOutput() => $_has(0);
  @$pb.TagNumber(1)
  void clearOutput() => $_clearField(1);
  @$pb.TagNumber(1)
  TokenOutput ensureOutput() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get previousTransactionHash => $_getN(1);
  @$pb.TagNumber(2)
  set previousTransactionHash($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPreviousTransactionHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreviousTransactionHash() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get previousTransactionVout => $_getIZ(2);
  @$pb.TagNumber(3)
  set previousTransactionVout($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPreviousTransactionVout() => $_has(2);
  @$pb.TagNumber(3)
  void clearPreviousTransactionVout() => $_clearField(3);
}

class QueryTokenOutputsResponse extends $pb.GeneratedMessage {
  factory QueryTokenOutputsResponse({
    $core.Iterable<OutputWithPreviousTransactionData>?
        outputsWithPreviousTransactionData,
    $3.PageResponse? pageResponse,
  }) {
    final result = create();
    if (outputsWithPreviousTransactionData != null)
      result.outputsWithPreviousTransactionData
          .addAll(outputsWithPreviousTransactionData);
    if (pageResponse != null) result.pageResponse = pageResponse;
    return result;
  }

  QueryTokenOutputsResponse._();

  factory QueryTokenOutputsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryTokenOutputsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryTokenOutputsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..pPM<OutputWithPreviousTransactionData>(
        1, _omitFieldNames ? '' : 'outputsWithPreviousTransactionData',
        subBuilder: OutputWithPreviousTransactionData.create)
    ..aOM<$3.PageResponse>(2, _omitFieldNames ? '' : 'pageResponse',
        subBuilder: $3.PageResponse.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryTokenOutputsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryTokenOutputsResponse copyWith(
          void Function(QueryTokenOutputsResponse) updates) =>
      super.copyWith((message) => updates(message as QueryTokenOutputsResponse))
          as QueryTokenOutputsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryTokenOutputsResponse create() => QueryTokenOutputsResponse._();
  @$core.override
  QueryTokenOutputsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryTokenOutputsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryTokenOutputsResponse>(create);
  static QueryTokenOutputsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<OutputWithPreviousTransactionData>
      get outputsWithPreviousTransactionData => $_getList(0);

  @$pb.TagNumber(2)
  $3.PageResponse get pageResponse => $_getN(1);
  @$pb.TagNumber(2)
  set pageResponse($3.PageResponse value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPageResponse() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageResponse() => $_clearField(2);
  @$pb.TagNumber(2)
  $3.PageResponse ensurePageResponse() => $_ensure(1);
}

class SpentTokenOutputMetadata extends $pb.GeneratedMessage {
  factory SpentTokenOutputMetadata({
    $core.String? outputId,
    $core.List<$core.int>? revocationSecret,
  }) {
    final result = create();
    if (outputId != null) result.outputId = outputId;
    if (revocationSecret != null) result.revocationSecret = revocationSecret;
    return result;
  }

  SpentTokenOutputMetadata._();

  factory SpentTokenOutputMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SpentTokenOutputMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SpentTokenOutputMetadata',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'outputId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'revocationSecret', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpentTokenOutputMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpentTokenOutputMetadata copyWith(
          void Function(SpentTokenOutputMetadata) updates) =>
      super.copyWith((message) => updates(message as SpentTokenOutputMetadata))
          as SpentTokenOutputMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpentTokenOutputMetadata create() => SpentTokenOutputMetadata._();
  @$core.override
  SpentTokenOutputMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SpentTokenOutputMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpentTokenOutputMetadata>(create);
  static SpentTokenOutputMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get outputId => $_getSZ(0);
  @$pb.TagNumber(1)
  set outputId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOutputId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOutputId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get revocationSecret => $_getN(1);
  @$pb.TagNumber(2)
  set revocationSecret($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRevocationSecret() => $_has(1);
  @$pb.TagNumber(2)
  void clearRevocationSecret() => $_clearField(2);
}

class TokenTransactionConfirmationMetadata extends $pb.GeneratedMessage {
  factory TokenTransactionConfirmationMetadata({
    $core.Iterable<SpentTokenOutputMetadata>? spentTokenOutputsMetadata,
  }) {
    final result = create();
    if (spentTokenOutputsMetadata != null)
      result.spentTokenOutputsMetadata.addAll(spentTokenOutputsMetadata);
    return result;
  }

  TokenTransactionConfirmationMetadata._();

  factory TokenTransactionConfirmationMetadata.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenTransactionConfirmationMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenTransactionConfirmationMetadata',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..pPM<SpentTokenOutputMetadata>(
        1, _omitFieldNames ? '' : 'spentTokenOutputsMetadata',
        subBuilder: SpentTokenOutputMetadata.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenTransactionConfirmationMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenTransactionConfirmationMetadata copyWith(
          void Function(TokenTransactionConfirmationMetadata) updates) =>
      super.copyWith((message) =>
              updates(message as TokenTransactionConfirmationMetadata))
          as TokenTransactionConfirmationMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenTransactionConfirmationMetadata create() =>
      TokenTransactionConfirmationMetadata._();
  @$core.override
  TokenTransactionConfirmationMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenTransactionConfirmationMetadata getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          TokenTransactionConfirmationMetadata>(create);
  static TokenTransactionConfirmationMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SpentTokenOutputMetadata> get spentTokenOutputsMetadata =>
      $_getList(0);
}

class TokenTransactionWithStatus extends $pb.GeneratedMessage {
  factory TokenTransactionWithStatus({
    TokenTransaction? tokenTransaction,
    TokenTransactionStatus? status,
    TokenTransactionConfirmationMetadata? confirmationMetadata,
    $core.List<$core.int>? tokenTransactionHash,
  }) {
    final result = create();
    if (tokenTransaction != null) result.tokenTransaction = tokenTransaction;
    if (status != null) result.status = status;
    if (confirmationMetadata != null)
      result.confirmationMetadata = confirmationMetadata;
    if (tokenTransactionHash != null)
      result.tokenTransactionHash = tokenTransactionHash;
    return result;
  }

  TokenTransactionWithStatus._();

  factory TokenTransactionWithStatus.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenTransactionWithStatus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenTransactionWithStatus',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..aOM<TokenTransaction>(1, _omitFieldNames ? '' : 'tokenTransaction',
        subBuilder: TokenTransaction.create)
    ..aE<TokenTransactionStatus>(2, _omitFieldNames ? '' : 'status',
        enumValues: TokenTransactionStatus.values)
    ..aOM<TokenTransactionConfirmationMetadata>(
        3, _omitFieldNames ? '' : 'confirmationMetadata',
        subBuilder: TokenTransactionConfirmationMetadata.create)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'tokenTransactionHash', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenTransactionWithStatus clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenTransactionWithStatus copyWith(
          void Function(TokenTransactionWithStatus) updates) =>
      super.copyWith(
              (message) => updates(message as TokenTransactionWithStatus))
          as TokenTransactionWithStatus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenTransactionWithStatus create() => TokenTransactionWithStatus._();
  @$core.override
  TokenTransactionWithStatus createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenTransactionWithStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenTransactionWithStatus>(create);
  static TokenTransactionWithStatus? _defaultInstance;

  @$pb.TagNumber(1)
  TokenTransaction get tokenTransaction => $_getN(0);
  @$pb.TagNumber(1)
  set tokenTransaction(TokenTransaction value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTokenTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearTokenTransaction() => $_clearField(1);
  @$pb.TagNumber(1)
  TokenTransaction ensureTokenTransaction() => $_ensure(0);

  @$pb.TagNumber(2)
  TokenTransactionStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(TokenTransactionStatus value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  TokenTransactionConfirmationMetadata get confirmationMetadata => $_getN(2);
  @$pb.TagNumber(3)
  set confirmationMetadata(TokenTransactionConfirmationMetadata value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasConfirmationMetadata() => $_has(2);
  @$pb.TagNumber(3)
  void clearConfirmationMetadata() => $_clearField(3);
  @$pb.TagNumber(3)
  TokenTransactionConfirmationMetadata ensureConfirmationMetadata() =>
      $_ensure(2);

  /// In rare cases the above reconstructed token transaction may not match the original token transaction due to:
  /// a) a pre-empted transfer transaction having its input TTXOs remapped to the newer transaction
  /// b) proto migrations or field deprecations resulting in missing/swapped fields (eg. token public key -> token identifier)
  /// Include the original hash to ensure clients can reconcile this transaction with the original if needed.
  @$pb.TagNumber(4)
  $core.List<$core.int> get tokenTransactionHash => $_getN(3);
  @$pb.TagNumber(4)
  set tokenTransactionHash($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTokenTransactionHash() => $_has(3);
  @$pb.TagNumber(4)
  void clearTokenTransactionHash() => $_clearField(4);
}

class FreezeTokensPayload extends $pb.GeneratedMessage {
  factory FreezeTokensPayload({
    $core.int? version,
    $core.List<$core.int>? ownerPublicKey,
    $core.List<$core.int>? tokenPublicKey,
    $core.List<$core.int>? tokenIdentifier,
    $fixnum.Int64? issuerProvidedTimestamp,
    $core.List<$core.int>? operatorIdentityPublicKey,
    $core.bool? shouldUnfreeze,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (ownerPublicKey != null) result.ownerPublicKey = ownerPublicKey;
    if (tokenPublicKey != null) result.tokenPublicKey = tokenPublicKey;
    if (tokenIdentifier != null) result.tokenIdentifier = tokenIdentifier;
    if (issuerProvidedTimestamp != null)
      result.issuerProvidedTimestamp = issuerProvidedTimestamp;
    if (operatorIdentityPublicKey != null)
      result.operatorIdentityPublicKey = operatorIdentityPublicKey;
    if (shouldUnfreeze != null) result.shouldUnfreeze = shouldUnfreeze;
    return result;
  }

  FreezeTokensPayload._();

  factory FreezeTokensPayload.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FreezeTokensPayload.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FreezeTokensPayload',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'ownerPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'tokenPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'tokenIdentifier', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'issuerProvidedTimestamp',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(6,
        _omitFieldNames ? '' : 'operatorIdentityPublicKey', $pb.PbFieldType.OY)
    ..aOB(7, _omitFieldNames ? '' : 'shouldUnfreeze')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FreezeTokensPayload clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FreezeTokensPayload copyWith(void Function(FreezeTokensPayload) updates) =>
      super.copyWith((message) => updates(message as FreezeTokensPayload))
          as FreezeTokensPayload;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FreezeTokensPayload create() => FreezeTokensPayload._();
  @$core.override
  FreezeTokensPayload createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FreezeTokensPayload getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FreezeTokensPayload>(create);
  static FreezeTokensPayload? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get ownerPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set ownerPublicKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOwnerPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get tokenPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set tokenPublicKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTokenPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearTokenPublicKey() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get tokenIdentifier => $_getN(3);
  @$pb.TagNumber(4)
  set tokenIdentifier($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTokenIdentifier() => $_has(3);
  @$pb.TagNumber(4)
  void clearTokenIdentifier() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get issuerProvidedTimestamp => $_getI64(4);
  @$pb.TagNumber(5)
  set issuerProvidedTimestamp($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIssuerProvidedTimestamp() => $_has(4);
  @$pb.TagNumber(5)
  void clearIssuerProvidedTimestamp() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get operatorIdentityPublicKey => $_getN(5);
  @$pb.TagNumber(6)
  set operatorIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasOperatorIdentityPublicKey() => $_has(5);
  @$pb.TagNumber(6)
  void clearOperatorIdentityPublicKey() => $_clearField(6);

  /// Set to false when requesting a freeze.
  @$pb.TagNumber(7)
  $core.bool get shouldUnfreeze => $_getBF(6);
  @$pb.TagNumber(7)
  set shouldUnfreeze($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasShouldUnfreeze() => $_has(6);
  @$pb.TagNumber(7)
  void clearShouldUnfreeze() => $_clearField(7);
}

class FreezeTokensRequest extends $pb.GeneratedMessage {
  factory FreezeTokensRequest({
    FreezeTokensPayload? freezeTokensPayload,
    $core.List<$core.int>? issuerSignature,
  }) {
    final result = create();
    if (freezeTokensPayload != null)
      result.freezeTokensPayload = freezeTokensPayload;
    if (issuerSignature != null) result.issuerSignature = issuerSignature;
    return result;
  }

  FreezeTokensRequest._();

  factory FreezeTokensRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FreezeTokensRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FreezeTokensRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..aOM<FreezeTokensPayload>(1, _omitFieldNames ? '' : 'freezeTokensPayload',
        subBuilder: FreezeTokensPayload.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'issuerSignature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FreezeTokensRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FreezeTokensRequest copyWith(void Function(FreezeTokensRequest) updates) =>
      super.copyWith((message) => updates(message as FreezeTokensRequest))
          as FreezeTokensRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FreezeTokensRequest create() => FreezeTokensRequest._();
  @$core.override
  FreezeTokensRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FreezeTokensRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FreezeTokensRequest>(create);
  static FreezeTokensRequest? _defaultInstance;

  @$pb.TagNumber(1)
  FreezeTokensPayload get freezeTokensPayload => $_getN(0);
  @$pb.TagNumber(1)
  set freezeTokensPayload(FreezeTokensPayload value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFreezeTokensPayload() => $_has(0);
  @$pb.TagNumber(1)
  void clearFreezeTokensPayload() => $_clearField(1);
  @$pb.TagNumber(1)
  FreezeTokensPayload ensureFreezeTokensPayload() => $_ensure(0);

  /// This is a Schnorr or ECDSA DER signature which can be between 64 and 73 bytes.
  @$pb.TagNumber(2)
  $core.List<$core.int> get issuerSignature => $_getN(1);
  @$pb.TagNumber(2)
  set issuerSignature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIssuerSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearIssuerSignature() => $_clearField(2);
}

/// Reference to a token output by its outpoint (transaction hash + vout).
class TokenOutputRef extends $pb.GeneratedMessage {
  factory TokenOutputRef({
    $core.List<$core.int>? transactionHash,
    $core.int? vout,
  }) {
    final result = create();
    if (transactionHash != null) result.transactionHash = transactionHash;
    if (vout != null) result.vout = vout;
    return result;
  }

  TokenOutputRef._();

  factory TokenOutputRef.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenOutputRef.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenOutputRef',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'transactionHash', $pb.PbFieldType.OY)
    ..aI(2, _omitFieldNames ? '' : 'vout', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenOutputRef clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenOutputRef copyWith(void Function(TokenOutputRef) updates) =>
      super.copyWith((message) => updates(message as TokenOutputRef))
          as TokenOutputRef;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenOutputRef create() => TokenOutputRef._();
  @$core.override
  TokenOutputRef createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenOutputRef getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenOutputRef>(create);
  static TokenOutputRef? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get transactionHash => $_getN(0);
  @$pb.TagNumber(1)
  set transactionHash($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransactionHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionHash() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get vout => $_getIZ(1);
  @$pb.TagNumber(2)
  set vout($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVout() => $_has(1);
  @$pb.TagNumber(2)
  void clearVout() => $_clearField(2);
}

/// FreezeProgress tracks the coordinated freeze status across operators.
class FreezeProgress extends $pb.GeneratedMessage {
  factory FreezeProgress({
    $core.Iterable<$core.List<$core.int>>? appliedOperatorPublicKeys,
  }) {
    final result = create();
    if (appliedOperatorPublicKeys != null)
      result.appliedOperatorPublicKeys.addAll(appliedOperatorPublicKeys);
    return result;
  }

  FreezeProgress._();

  factory FreezeProgress.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FreezeProgress.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FreezeProgress',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..p<$core.List<$core.int>>(1,
        _omitFieldNames ? '' : 'appliedOperatorPublicKeys', $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FreezeProgress clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FreezeProgress copyWith(void Function(FreezeProgress) updates) =>
      super.copyWith((message) => updates(message as FreezeProgress))
          as FreezeProgress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FreezeProgress create() => FreezeProgress._();
  @$core.override
  FreezeProgress createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FreezeProgress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FreezeProgress>(create);
  static FreezeProgress? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.List<$core.int>> get appliedOperatorPublicKeys =>
      $_getList(0);
}

class FreezeTokensResponse extends $pb.GeneratedMessage {
  factory FreezeTokensResponse({
    @$core.Deprecated('This field is deprecated.')
    $core.Iterable<$core.String>? impactedOutputIds,
    $core.List<$core.int>? impactedTokenAmount,
    $core.Iterable<TokenOutputRef>? impactedTokenOutputs,
    FreezeProgress? freezeProgress,
  }) {
    final result = create();
    if (impactedOutputIds != null)
      result.impactedOutputIds.addAll(impactedOutputIds);
    if (impactedTokenAmount != null)
      result.impactedTokenAmount = impactedTokenAmount;
    if (impactedTokenOutputs != null)
      result.impactedTokenOutputs.addAll(impactedTokenOutputs);
    if (freezeProgress != null) result.freezeProgress = freezeProgress;
    return result;
  }

  FreezeTokensResponse._();

  factory FreezeTokensResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FreezeTokensResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FreezeTokensResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'impactedOutputIds')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'impactedTokenAmount', $pb.PbFieldType.OY)
    ..pPM<TokenOutputRef>(3, _omitFieldNames ? '' : 'impactedTokenOutputs',
        subBuilder: TokenOutputRef.create)
    ..aOM<FreezeProgress>(4, _omitFieldNames ? '' : 'freezeProgress',
        subBuilder: FreezeProgress.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FreezeTokensResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FreezeTokensResponse copyWith(void Function(FreezeTokensResponse) updates) =>
      super.copyWith((message) => updates(message as FreezeTokensResponse))
          as FreezeTokensResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FreezeTokensResponse create() => FreezeTokensResponse._();
  @$core.override
  FreezeTokensResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FreezeTokensResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FreezeTokensResponse>(create);
  static FreezeTokensResponse? _defaultInstance;

  /// Deprecated: Use impacted_token_outputs instead. UUIDs are SO-local and differ across SOs.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get impactedOutputIds => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get impactedTokenAmount => $_getN(1);
  @$pb.TagNumber(2)
  set impactedTokenAmount($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasImpactedTokenAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearImpactedTokenAmount() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<TokenOutputRef> get impactedTokenOutputs => $_getList(2);

  @$pb.TagNumber(4)
  FreezeProgress get freezeProgress => $_getN(3);
  @$pb.TagNumber(4)
  set freezeProgress(FreezeProgress value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasFreezeProgress() => $_has(3);
  @$pb.TagNumber(4)
  void clearFreezeProgress() => $_clearField(4);
  @$pb.TagNumber(4)
  FreezeProgress ensureFreezeProgress() => $_ensure(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
