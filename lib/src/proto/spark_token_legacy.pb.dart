// This is a generated file - do not edit.
//
// Generated from spark_token_legacy.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'spark.pbenum.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// This proto is constructed by the wallet to specify leaves it wants to spend as
/// part of the token transaction.
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
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'spark_token_legacy'),
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
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'spark_token_legacy'),
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
    $fixnum.Int64? issuerProvidedTimestamp,
    $core.List<$core.int>? tokenIdentifier,
  }) {
    final result = create();
    if (issuerPublicKey != null) result.issuerPublicKey = issuerPublicKey;
    if (issuerProvidedTimestamp != null)
      result.issuerProvidedTimestamp = issuerProvidedTimestamp;
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
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'spark_token_legacy'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'issuerPublicKey', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'issuerProvidedTimestamp',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'tokenIdentifier', $pb.PbFieldType.OY)
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

  @$pb.TagNumber(1)
  $core.List<$core.int> get issuerPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set issuerPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIssuerPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearIssuerPublicKey() => $_clearField(1);

  /// Issuer provided timestamp of when the transaction was signed/constructed.
  /// Helps provide idempotency and ensures that each mint input signature is unique
  /// as long as multiple mint signatures are not happening at the same time. Also gives a
  /// potentially useful data point for when the issuer authorized from their
  /// perspective. Note that we have no way of proving this is accurate.
  @$pb.TagNumber(2)
  $fixnum.Int64 get issuerProvidedTimestamp => $_getI64(1);
  @$pb.TagNumber(2)
  set issuerProvidedTimestamp($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIssuerProvidedTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearIssuerProvidedTimestamp() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get tokenIdentifier => $_getN(2);
  @$pb.TagNumber(3)
  set tokenIdentifier($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTokenIdentifier() => $_has(2);
  @$pb.TagNumber(3)
  void clearTokenIdentifier() => $_clearField(3);
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
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'spark_token_legacy'),
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
}

/// This proto is constructed by the wallet to specify outputs it wants to create
/// as part of a token transaction. Output id and revocation public key should remain unfilled
/// so that the SE can fill them as part of the StartTokenTransaction() call.
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
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'spark_token_legacy'),
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
}

enum TokenTransaction_TokenInputs {
  mintInput,
  transferInput,
  createInput,
  notSet
}

/// This proto is constructed by the wallet and is the core transaction data structure.
/// This proto is deterministically hashed to generate the token_transaction_hash that
/// is cooperatively signed by the SO group to confirm a token transaction.
class TokenTransaction extends $pb.GeneratedMessage {
  factory TokenTransaction({
    TokenMintInput? mintInput,
    TokenTransferInput? transferInput,
    $core.Iterable<TokenOutput>? tokenOutputs,
    $core.Iterable<$core.List<$core.int>>? sparkOperatorIdentityPublicKeys,
    TokenCreateInput? createInput,
    $0.Network? network,
  }) {
    final result = create();
    if (mintInput != null) result.mintInput = mintInput;
    if (transferInput != null) result.transferInput = transferInput;
    if (tokenOutputs != null) result.tokenOutputs.addAll(tokenOutputs);
    if (sparkOperatorIdentityPublicKeys != null)
      result.sparkOperatorIdentityPublicKeys
          .addAll(sparkOperatorIdentityPublicKeys);
    if (createInput != null) result.createInput = createInput;
    if (network != null) result.network = network;
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
    1: TokenTransaction_TokenInputs.mintInput,
    2: TokenTransaction_TokenInputs.transferInput,
    5: TokenTransaction_TokenInputs.createInput,
    0: TokenTransaction_TokenInputs.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenTransaction',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'spark_token_legacy'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 5])
    ..aOM<TokenMintInput>(1, _omitFieldNames ? '' : 'mintInput',
        subBuilder: TokenMintInput.create)
    ..aOM<TokenTransferInput>(2, _omitFieldNames ? '' : 'transferInput',
        subBuilder: TokenTransferInput.create)
    ..pPM<TokenOutput>(3, _omitFieldNames ? '' : 'tokenOutputs',
        subBuilder: TokenOutput.create)
    ..p<$core.List<$core.int>>(
        4,
        _omitFieldNames ? '' : 'sparkOperatorIdentityPublicKeys',
        $pb.PbFieldType.PY)
    ..aOM<TokenCreateInput>(5, _omitFieldNames ? '' : 'createInput',
        subBuilder: TokenCreateInput.create)
    ..aE<$0.Network>(10, _omitFieldNames ? '' : 'network',
        enumValues: $0.Network.values)
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

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(5)
  TokenTransaction_TokenInputs whichTokenInputs() =>
      _TokenTransaction_TokenInputsByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(5)
  void clearTokenInputs() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  TokenMintInput get mintInput => $_getN(0);
  @$pb.TagNumber(1)
  set mintInput(TokenMintInput value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMintInput() => $_has(0);
  @$pb.TagNumber(1)
  void clearMintInput() => $_clearField(1);
  @$pb.TagNumber(1)
  TokenMintInput ensureMintInput() => $_ensure(0);

  @$pb.TagNumber(2)
  TokenTransferInput get transferInput => $_getN(1);
  @$pb.TagNumber(2)
  set transferInput(TokenTransferInput value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTransferInput() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransferInput() => $_clearField(2);
  @$pb.TagNumber(2)
  TokenTransferInput ensureTransferInput() => $_ensure(1);

  @$pb.TagNumber(3)
  $pb.PbList<TokenOutput> get tokenOutputs => $_getList(2);

  @$pb.TagNumber(4)
  $pb.PbList<$core.List<$core.int>> get sparkOperatorIdentityPublicKeys =>
      $_getList(3);

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

  @$pb.TagNumber(10)
  $0.Network get network => $_getN(5);
  @$pb.TagNumber(10)
  set network($0.Network value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasNetwork() => $_has(5);
  @$pb.TagNumber(10)
  void clearNetwork() => $_clearField(10);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
