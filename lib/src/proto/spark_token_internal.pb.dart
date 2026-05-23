// This is a generated file - do not edit.
//
// Generated from spark_token_internal.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $2;

import 'spark.pbenum.dart' as $3;
import 'spark_token.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class PrepareTransactionRequest extends $pb.GeneratedMessage {
  factory PrepareTransactionRequest({
    $1.TokenTransaction? finalTokenTransaction,
    $core.Iterable<$1.SignatureWithIndex>? tokenTransactionSignatures,
    $core.Iterable<$core.String>? keyshareIds,
    $core.List<$core.int>? coordinatorPublicKey,
    $2.Timestamp? executeBefore,
  }) {
    final result = create();
    if (finalTokenTransaction != null)
      result.finalTokenTransaction = finalTokenTransaction;
    if (tokenTransactionSignatures != null)
      result.tokenTransactionSignatures.addAll(tokenTransactionSignatures);
    if (keyshareIds != null) result.keyshareIds.addAll(keyshareIds);
    if (coordinatorPublicKey != null)
      result.coordinatorPublicKey = coordinatorPublicKey;
    if (executeBefore != null) result.executeBefore = executeBefore;
    return result;
  }

  PrepareTransactionRequest._();

  factory PrepareTransactionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PrepareTransactionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrepareTransactionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..aOM<$1.TokenTransaction>(
        1, _omitFieldNames ? '' : 'finalTokenTransaction',
        subBuilder: $1.TokenTransaction.create)
    ..pPM<$1.SignatureWithIndex>(
        2, _omitFieldNames ? '' : 'tokenTransactionSignatures',
        subBuilder: $1.SignatureWithIndex.create)
    ..pPS(3, _omitFieldNames ? '' : 'keyshareIds')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'coordinatorPublicKey', $pb.PbFieldType.OY)
    ..aOM<$2.Timestamp>(5, _omitFieldNames ? '' : 'executeBefore',
        subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareTransactionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareTransactionRequest copyWith(
          void Function(PrepareTransactionRequest) updates) =>
      super.copyWith((message) => updates(message as PrepareTransactionRequest))
          as PrepareTransactionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrepareTransactionRequest create() => PrepareTransactionRequest._();
  @$core.override
  PrepareTransactionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PrepareTransactionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrepareTransactionRequest>(create);
  static PrepareTransactionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.TokenTransaction get finalTokenTransaction => $_getN(0);
  @$pb.TagNumber(1)
  set finalTokenTransaction($1.TokenTransaction value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFinalTokenTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearFinalTokenTransaction() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.TokenTransaction ensureFinalTokenTransaction() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<$1.SignatureWithIndex> get tokenTransactionSignatures =>
      $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get keyshareIds => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get coordinatorPublicKey => $_getN(3);
  @$pb.TagNumber(4)
  set coordinatorPublicKey($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCoordinatorPublicKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearCoordinatorPublicKey() => $_clearField(4);

  /// Optional client-specified deadline, forwarded from PartialTokenTransaction.execute_before.
  /// When set, non-coordinator SOs use this to relax CCT freshness validation.
  @$pb.TagNumber(5)
  $2.Timestamp get executeBefore => $_getN(4);
  @$pb.TagNumber(5)
  set executeBefore($2.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasExecuteBefore() => $_has(4);
  @$pb.TagNumber(5)
  void clearExecuteBefore() => $_clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureExecuteBefore() => $_ensure(4);
}

class PrepareTransactionResponse extends $pb.GeneratedMessage {
  factory PrepareTransactionResponse() => create();

  PrepareTransactionResponse._();

  factory PrepareTransactionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PrepareTransactionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrepareTransactionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareTransactionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareTransactionResponse copyWith(
          void Function(PrepareTransactionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as PrepareTransactionResponse))
          as PrepareTransactionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrepareTransactionResponse create() => PrepareTransactionResponse._();
  @$core.override
  PrepareTransactionResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PrepareTransactionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrepareTransactionResponse>(create);
  static PrepareTransactionResponse? _defaultInstance;
}

/// === Coordination Signing ===
class SignTokenTransactionFromCoordinationRequest extends $pb.GeneratedMessage {
  factory SignTokenTransactionFromCoordinationRequest({
    $1.TokenTransaction? finalTokenTransaction,
    $core.List<$core.int>? finalTokenTransactionHash,
    $1.InputTtxoSignaturesPerOperator? inputTtxoSignaturesPerOperator,
    $core.List<$core.int>? ownerIdentityPublicKey,
  }) {
    final result = create();
    if (finalTokenTransaction != null)
      result.finalTokenTransaction = finalTokenTransaction;
    if (finalTokenTransactionHash != null)
      result.finalTokenTransactionHash = finalTokenTransactionHash;
    if (inputTtxoSignaturesPerOperator != null)
      result.inputTtxoSignaturesPerOperator = inputTtxoSignaturesPerOperator;
    if (ownerIdentityPublicKey != null)
      result.ownerIdentityPublicKey = ownerIdentityPublicKey;
    return result;
  }

  SignTokenTransactionFromCoordinationRequest._();

  factory SignTokenTransactionFromCoordinationRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SignTokenTransactionFromCoordinationRequest.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignTokenTransactionFromCoordinationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..aOM<$1.TokenTransaction>(
        1, _omitFieldNames ? '' : 'finalTokenTransaction',
        subBuilder: $1.TokenTransaction.create)
    ..a<$core.List<$core.int>>(2,
        _omitFieldNames ? '' : 'finalTokenTransactionHash', $pb.PbFieldType.OY)
    ..aOM<$1.InputTtxoSignaturesPerOperator>(
        3, _omitFieldNames ? '' : 'inputTtxoSignaturesPerOperator',
        subBuilder: $1.InputTtxoSignaturesPerOperator.create)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'ownerIdentityPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignTokenTransactionFromCoordinationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignTokenTransactionFromCoordinationRequest copyWith(
          void Function(SignTokenTransactionFromCoordinationRequest) updates) =>
      super.copyWith((message) =>
              updates(message as SignTokenTransactionFromCoordinationRequest))
          as SignTokenTransactionFromCoordinationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignTokenTransactionFromCoordinationRequest create() =>
      SignTokenTransactionFromCoordinationRequest._();
  @$core.override
  SignTokenTransactionFromCoordinationRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SignTokenTransactionFromCoordinationRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          SignTokenTransactionFromCoordinationRequest>(create);
  static SignTokenTransactionFromCoordinationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.TokenTransaction get finalTokenTransaction => $_getN(0);
  @$pb.TagNumber(1)
  set finalTokenTransaction($1.TokenTransaction value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFinalTokenTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearFinalTokenTransaction() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.TokenTransaction ensureFinalTokenTransaction() => $_ensure(0);

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
  $1.InputTtxoSignaturesPerOperator get inputTtxoSignaturesPerOperator =>
      $_getN(2);
  @$pb.TagNumber(3)
  set inputTtxoSignaturesPerOperator($1.InputTtxoSignaturesPerOperator value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasInputTtxoSignaturesPerOperator() => $_has(2);
  @$pb.TagNumber(3)
  void clearInputTtxoSignaturesPerOperator() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.InputTtxoSignaturesPerOperator ensureInputTtxoSignaturesPerOperator() =>
      $_ensure(2);

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

class SignTokenTransactionFromCoordinationResponse
    extends $pb.GeneratedMessage {
  factory SignTokenTransactionFromCoordinationResponse({
    $core.List<$core.int>? sparkOperatorSignature,
  }) {
    final result = create();
    if (sparkOperatorSignature != null)
      result.sparkOperatorSignature = sparkOperatorSignature;
    return result;
  }

  SignTokenTransactionFromCoordinationResponse._();

  factory SignTokenTransactionFromCoordinationResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SignTokenTransactionFromCoordinationResponse.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignTokenTransactionFromCoordinationResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'sparkOperatorSignature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignTokenTransactionFromCoordinationResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignTokenTransactionFromCoordinationResponse copyWith(
          void Function(SignTokenTransactionFromCoordinationResponse)
              updates) =>
      super.copyWith((message) =>
              updates(message as SignTokenTransactionFromCoordinationResponse))
          as SignTokenTransactionFromCoordinationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignTokenTransactionFromCoordinationResponse create() =>
      SignTokenTransactionFromCoordinationResponse._();
  @$core.override
  SignTokenTransactionFromCoordinationResponse createEmptyInstance() =>
      create();
  @$core.pragma('dart2js:noInline')
  static SignTokenTransactionFromCoordinationResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          SignTokenTransactionFromCoordinationResponse>(create);
  static SignTokenTransactionFromCoordinationResponse? _defaultInstance;

  /// The signature from this SO
  @$pb.TagNumber(1)
  $core.List<$core.int> get sparkOperatorSignature => $_getN(0);
  @$pb.TagNumber(1)
  set sparkOperatorSignature($core.List<$core.int> value) =>
      $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSparkOperatorSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSparkOperatorSignature() => $_clearField(1);
}

class OperatorTransactionSignature extends $pb.GeneratedMessage {
  factory OperatorTransactionSignature({
    $core.List<$core.int>? operatorIdentityPublicKey,
    $core.List<$core.int>? signature,
  }) {
    final result = create();
    if (operatorIdentityPublicKey != null)
      result.operatorIdentityPublicKey = operatorIdentityPublicKey;
    if (signature != null) result.signature = signature;
    return result;
  }

  OperatorTransactionSignature._();

  factory OperatorTransactionSignature.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OperatorTransactionSignature.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OperatorTransactionSignature',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1,
        _omitFieldNames ? '' : 'operatorIdentityPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperatorTransactionSignature clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperatorTransactionSignature copyWith(
          void Function(OperatorTransactionSignature) updates) =>
      super.copyWith(
              (message) => updates(message as OperatorTransactionSignature))
          as OperatorTransactionSignature;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OperatorTransactionSignature create() =>
      OperatorTransactionSignature._();
  @$core.override
  OperatorTransactionSignature createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OperatorTransactionSignature getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OperatorTransactionSignature>(create);
  static OperatorTransactionSignature? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get operatorIdentityPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set operatorIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOperatorIdentityPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearOperatorIdentityPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);
}

class RevocationSecretShare extends $pb.GeneratedMessage {
  factory RevocationSecretShare({
    @$core.Deprecated('This field is deprecated.') $core.String? inputTtxoId,
    $core.List<$core.int>? secretShare,
    $1.TokenOutputToSpend? inputTtxoRef,
  }) {
    final result = create();
    if (inputTtxoId != null) result.inputTtxoId = inputTtxoId;
    if (secretShare != null) result.secretShare = secretShare;
    if (inputTtxoRef != null) result.inputTtxoRef = inputTtxoRef;
    return result;
  }

  RevocationSecretShare._();

  factory RevocationSecretShare.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RevocationSecretShare.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RevocationSecretShare',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'inputTtxoId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'secretShare', $pb.PbFieldType.OY)
    ..aOM<$1.TokenOutputToSpend>(3, _omitFieldNames ? '' : 'inputTtxoRef',
        subBuilder: $1.TokenOutputToSpend.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RevocationSecretShare clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RevocationSecretShare copyWith(
          void Function(RevocationSecretShare) updates) =>
      super.copyWith((message) => updates(message as RevocationSecretShare))
          as RevocationSecretShare;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RevocationSecretShare create() => RevocationSecretShare._();
  @$core.override
  RevocationSecretShare createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RevocationSecretShare getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RevocationSecretShare>(create);
  static RevocationSecretShare? _defaultInstance;

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.String get inputTtxoId => $_getSZ(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  set inputTtxoId($core.String value) => $_setString(0, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool hasInputTtxoId() => $_has(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  void clearInputTtxoId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get secretShare => $_getN(1);
  @$pb.TagNumber(2)
  set secretShare($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSecretShare() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecretShare() => $_clearField(2);

  @$pb.TagNumber(3)
  $1.TokenOutputToSpend get inputTtxoRef => $_getN(2);
  @$pb.TagNumber(3)
  set inputTtxoRef($1.TokenOutputToSpend value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasInputTtxoRef() => $_has(2);
  @$pb.TagNumber(3)
  void clearInputTtxoRef() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.TokenOutputToSpend ensureInputTtxoRef() => $_ensure(2);
}

class OperatorRevocationShares extends $pb.GeneratedMessage {
  factory OperatorRevocationShares({
    $core.List<$core.int>? operatorIdentityPublicKey,
    $core.Iterable<RevocationSecretShare>? shares,
  }) {
    final result = create();
    if (operatorIdentityPublicKey != null)
      result.operatorIdentityPublicKey = operatorIdentityPublicKey;
    if (shares != null) result.shares.addAll(shares);
    return result;
  }

  OperatorRevocationShares._();

  factory OperatorRevocationShares.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OperatorRevocationShares.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OperatorRevocationShares',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1,
        _omitFieldNames ? '' : 'operatorIdentityPublicKey', $pb.PbFieldType.OY)
    ..pPM<RevocationSecretShare>(2, _omitFieldNames ? '' : 'shares',
        subBuilder: RevocationSecretShare.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperatorRevocationShares clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperatorRevocationShares copyWith(
          void Function(OperatorRevocationShares) updates) =>
      super.copyWith((message) => updates(message as OperatorRevocationShares))
          as OperatorRevocationShares;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OperatorRevocationShares create() => OperatorRevocationShares._();
  @$core.override
  OperatorRevocationShares createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OperatorRevocationShares getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OperatorRevocationShares>(create);
  static OperatorRevocationShares? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get operatorIdentityPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set operatorIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOperatorIdentityPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearOperatorIdentityPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<RevocationSecretShare> get shares => $_getList(1);
}

/// === Revocation Secret Exchange ===
class ExchangeRevocationSecretsSharesRequest extends $pb.GeneratedMessage {
  factory ExchangeRevocationSecretsSharesRequest({
    $1.TokenTransaction? finalTokenTransaction,
    $core.List<$core.int>? finalTokenTransactionHash,
    $core.Iterable<OperatorTransactionSignature>? operatorTransactionSignatures,
    $core.Iterable<OperatorRevocationShares>? operatorShares,
    $core.List<$core.int>? operatorIdentityPublicKey,
    $core.Iterable<OutputToSpend>? outputsToSpend,
  }) {
    final result = create();
    if (finalTokenTransaction != null)
      result.finalTokenTransaction = finalTokenTransaction;
    if (finalTokenTransactionHash != null)
      result.finalTokenTransactionHash = finalTokenTransactionHash;
    if (operatorTransactionSignatures != null)
      result.operatorTransactionSignatures
          .addAll(operatorTransactionSignatures);
    if (operatorShares != null) result.operatorShares.addAll(operatorShares);
    if (operatorIdentityPublicKey != null)
      result.operatorIdentityPublicKey = operatorIdentityPublicKey;
    if (outputsToSpend != null) result.outputsToSpend.addAll(outputsToSpend);
    return result;
  }

  ExchangeRevocationSecretsSharesRequest._();

  factory ExchangeRevocationSecretsSharesRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExchangeRevocationSecretsSharesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExchangeRevocationSecretsSharesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..aOM<$1.TokenTransaction>(
        1, _omitFieldNames ? '' : 'finalTokenTransaction',
        subBuilder: $1.TokenTransaction.create)
    ..a<$core.List<$core.int>>(2,
        _omitFieldNames ? '' : 'finalTokenTransactionHash', $pb.PbFieldType.OY)
    ..pPM<OperatorTransactionSignature>(
        3, _omitFieldNames ? '' : 'operatorTransactionSignatures',
        subBuilder: OperatorTransactionSignature.create)
    ..pPM<OperatorRevocationShares>(4, _omitFieldNames ? '' : 'operatorShares',
        subBuilder: OperatorRevocationShares.create)
    ..a<$core.List<$core.int>>(5,
        _omitFieldNames ? '' : 'operatorIdentityPublicKey', $pb.PbFieldType.OY)
    ..pPM<OutputToSpend>(6, _omitFieldNames ? '' : 'outputsToSpend',
        subBuilder: OutputToSpend.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExchangeRevocationSecretsSharesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExchangeRevocationSecretsSharesRequest copyWith(
          void Function(ExchangeRevocationSecretsSharesRequest) updates) =>
      super.copyWith((message) =>
              updates(message as ExchangeRevocationSecretsSharesRequest))
          as ExchangeRevocationSecretsSharesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExchangeRevocationSecretsSharesRequest create() =>
      ExchangeRevocationSecretsSharesRequest._();
  @$core.override
  ExchangeRevocationSecretsSharesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExchangeRevocationSecretsSharesRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ExchangeRevocationSecretsSharesRequest>(create);
  static ExchangeRevocationSecretsSharesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.TokenTransaction get finalTokenTransaction => $_getN(0);
  @$pb.TagNumber(1)
  set finalTokenTransaction($1.TokenTransaction value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFinalTokenTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearFinalTokenTransaction() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.TokenTransaction ensureFinalTokenTransaction() => $_ensure(0);

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
  $pb.PbList<OperatorTransactionSignature> get operatorTransactionSignatures =>
      $_getList(2);

  /// The revocation secret shares this SO is revealing, grouped by operator
  @$pb.TagNumber(4)
  $pb.PbList<OperatorRevocationShares> get operatorShares => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$core.int> get operatorIdentityPublicKey => $_getN(4);
  @$pb.TagNumber(5)
  set operatorIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOperatorIdentityPublicKey() => $_has(4);
  @$pb.TagNumber(5)
  void clearOperatorIdentityPublicKey() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<OutputToSpend> get outputsToSpend => $_getList(5);
}

class ExchangeRevocationSecretsSharesResponse extends $pb.GeneratedMessage {
  factory ExchangeRevocationSecretsSharesResponse({
    $core.Iterable<OperatorRevocationShares>? receivedOperatorShares,
  }) {
    final result = create();
    if (receivedOperatorShares != null)
      result.receivedOperatorShares.addAll(receivedOperatorShares);
    return result;
  }

  ExchangeRevocationSecretsSharesResponse._();

  factory ExchangeRevocationSecretsSharesResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExchangeRevocationSecretsSharesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExchangeRevocationSecretsSharesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..pPM<OperatorRevocationShares>(
        1, _omitFieldNames ? '' : 'receivedOperatorShares',
        subBuilder: OperatorRevocationShares.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExchangeRevocationSecretsSharesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExchangeRevocationSecretsSharesResponse copyWith(
          void Function(ExchangeRevocationSecretsSharesResponse) updates) =>
      super.copyWith((message) =>
              updates(message as ExchangeRevocationSecretsSharesResponse))
          as ExchangeRevocationSecretsSharesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExchangeRevocationSecretsSharesResponse create() =>
      ExchangeRevocationSecretsSharesResponse._();
  @$core.override
  ExchangeRevocationSecretsSharesResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExchangeRevocationSecretsSharesResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ExchangeRevocationSecretsSharesResponse>(create);
  static ExchangeRevocationSecretsSharesResponse? _defaultInstance;

  /// The revocation secret shares from other SOs, grouped by operator
  @$pb.TagNumber(1)
  $pb.PbList<OperatorRevocationShares> get receivedOperatorShares =>
      $_getList(0);
}

class OutputToSpend extends $pb.GeneratedMessage {
  factory OutputToSpend({
    $core.List<$core.int>? createdTokenTransactionHash,
    $core.int? createdTokenTransactionVout,
    $core.int? spentTokenTransactionVout,
    $core.List<$core.int>? spentOwnershipSignature,
  }) {
    final result = create();
    if (createdTokenTransactionHash != null)
      result.createdTokenTransactionHash = createdTokenTransactionHash;
    if (createdTokenTransactionVout != null)
      result.createdTokenTransactionVout = createdTokenTransactionVout;
    if (spentTokenTransactionVout != null)
      result.spentTokenTransactionVout = spentTokenTransactionVout;
    if (spentOwnershipSignature != null)
      result.spentOwnershipSignature = spentOwnershipSignature;
    return result;
  }

  OutputToSpend._();

  factory OutputToSpend.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OutputToSpend.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OutputToSpend',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        _omitFieldNames ? '' : 'createdTokenTransactionHash',
        $pb.PbFieldType.OY)
    ..aI(2, _omitFieldNames ? '' : 'createdTokenTransactionVout',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'spentTokenTransactionVout',
        fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'spentOwnershipSignature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutputToSpend clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutputToSpend copyWith(void Function(OutputToSpend) updates) =>
      super.copyWith((message) => updates(message as OutputToSpend))
          as OutputToSpend;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OutputToSpend create() => OutputToSpend._();
  @$core.override
  OutputToSpend createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OutputToSpend getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OutputToSpend>(create);
  static OutputToSpend? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get createdTokenTransactionHash => $_getN(0);
  @$pb.TagNumber(1)
  set createdTokenTransactionHash($core.List<$core.int> value) =>
      $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCreatedTokenTransactionHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreatedTokenTransactionHash() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get createdTokenTransactionVout => $_getIZ(1);
  @$pb.TagNumber(2)
  set createdTokenTransactionVout($core.int value) =>
      $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCreatedTokenTransactionVout() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedTokenTransactionVout() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get spentTokenTransactionVout => $_getIZ(2);
  @$pb.TagNumber(3)
  set spentTokenTransactionVout($core.int value) =>
      $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSpentTokenTransactionVout() => $_has(2);
  @$pb.TagNumber(3)
  void clearSpentTokenTransactionVout() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get spentOwnershipSignature => $_getN(3);
  @$pb.TagNumber(4)
  set spentOwnershipSignature($core.List<$core.int> value) =>
      $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSpentOwnershipSignature() => $_has(3);
  @$pb.TagNumber(4)
  void clearSpentOwnershipSignature() => $_clearField(4);
}

class UnencodedTokenIdentifier extends $pb.GeneratedMessage {
  factory UnencodedTokenIdentifier({
    $core.int? version,
    $core.List<$core.int>? issuerPublicKey,
    $core.String? tokenName,
    $core.String? tokenTicker,
    $core.int? decimals,
    $core.List<$core.int>? maxSupply,
    $core.bool? isFreezable,
    $3.Network? network,
    $core.List<$core.int>? creationEntityPublicKey,
    $core.List<$core.int>? extraMetadata,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (issuerPublicKey != null) result.issuerPublicKey = issuerPublicKey;
    if (tokenName != null) result.tokenName = tokenName;
    if (tokenTicker != null) result.tokenTicker = tokenTicker;
    if (decimals != null) result.decimals = decimals;
    if (maxSupply != null) result.maxSupply = maxSupply;
    if (isFreezable != null) result.isFreezable = isFreezable;
    if (network != null) result.network = network;
    if (creationEntityPublicKey != null)
      result.creationEntityPublicKey = creationEntityPublicKey;
    if (extraMetadata != null) result.extraMetadata = extraMetadata;
    return result;
  }

  UnencodedTokenIdentifier._();

  factory UnencodedTokenIdentifier.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UnencodedTokenIdentifier.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnencodedTokenIdentifier',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'issuerPublicKey', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'tokenName')
    ..aOS(4, _omitFieldNames ? '' : 'tokenTicker')
    ..aI(5, _omitFieldNames ? '' : 'decimals', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'maxSupply', $pb.PbFieldType.OY)
    ..aOB(7, _omitFieldNames ? '' : 'isFreezable')
    ..aE<$3.Network>(8, _omitFieldNames ? '' : 'network',
        enumValues: $3.Network.values)
    ..a<$core.List<$core.int>>(
        9, _omitFieldNames ? '' : 'creationEntityPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        10, _omitFieldNames ? '' : 'extraMetadata', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnencodedTokenIdentifier clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnencodedTokenIdentifier copyWith(
          void Function(UnencodedTokenIdentifier) updates) =>
      super.copyWith((message) => updates(message as UnencodedTokenIdentifier))
          as UnencodedTokenIdentifier;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnencodedTokenIdentifier create() => UnencodedTokenIdentifier._();
  @$core.override
  UnencodedTokenIdentifier createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UnencodedTokenIdentifier getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnencodedTokenIdentifier>(create);
  static UnencodedTokenIdentifier? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get issuerPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set issuerPublicKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIssuerPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearIssuerPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get tokenName => $_getSZ(2);
  @$pb.TagNumber(3)
  set tokenName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTokenName() => $_has(2);
  @$pb.TagNumber(3)
  void clearTokenName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get tokenTicker => $_getSZ(3);
  @$pb.TagNumber(4)
  set tokenTicker($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTokenTicker() => $_has(3);
  @$pb.TagNumber(4)
  void clearTokenTicker() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get decimals => $_getIZ(4);
  @$pb.TagNumber(5)
  set decimals($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDecimals() => $_has(4);
  @$pb.TagNumber(5)
  void clearDecimals() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get maxSupply => $_getN(5);
  @$pb.TagNumber(6)
  set maxSupply($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMaxSupply() => $_has(5);
  @$pb.TagNumber(6)
  void clearMaxSupply() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isFreezable => $_getBF(6);
  @$pb.TagNumber(7)
  set isFreezable($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasIsFreezable() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsFreezable() => $_clearField(7);

  @$pb.TagNumber(8)
  $3.Network get network => $_getN(7);
  @$pb.TagNumber(8)
  set network($3.Network value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasNetwork() => $_has(7);
  @$pb.TagNumber(8)
  void clearNetwork() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.int> get creationEntityPublicKey => $_getN(8);
  @$pb.TagNumber(9)
  set creationEntityPublicKey($core.List<$core.int> value) =>
      $_setBytes(8, value);
  @$pb.TagNumber(9)
  $core.bool hasCreationEntityPublicKey() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreationEntityPublicKey() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.int> get extraMetadata => $_getN(9);
  @$pb.TagNumber(10)
  set extraMetadata($core.List<$core.int> value) => $_setBytes(9, value);
  @$pb.TagNumber(10)
  $core.bool hasExtraMetadata() => $_has(9);
  @$pb.TagNumber(10)
  void clearExtraMetadata() => $_clearField(10);
}

class SignTokenTransactionRequest extends $pb.GeneratedMessage {
  factory SignTokenTransactionRequest({
    $1.TokenTransaction? finalTokenTransaction,
    $core.Iterable<$1.SignatureWithIndex>? tokenTransactionSignatures,
    $core.Iterable<$core.String>? keyshareIds,
    $core.List<$core.int>? coordinatorPublicKey,
    $2.Timestamp? executeBefore,
  }) {
    final result = create();
    if (finalTokenTransaction != null)
      result.finalTokenTransaction = finalTokenTransaction;
    if (tokenTransactionSignatures != null)
      result.tokenTransactionSignatures.addAll(tokenTransactionSignatures);
    if (keyshareIds != null) result.keyshareIds.addAll(keyshareIds);
    if (coordinatorPublicKey != null)
      result.coordinatorPublicKey = coordinatorPublicKey;
    if (executeBefore != null) result.executeBefore = executeBefore;
    return result;
  }

  SignTokenTransactionRequest._();

  factory SignTokenTransactionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SignTokenTransactionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignTokenTransactionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..aOM<$1.TokenTransaction>(
        1, _omitFieldNames ? '' : 'finalTokenTransaction',
        subBuilder: $1.TokenTransaction.create)
    ..pPM<$1.SignatureWithIndex>(
        2, _omitFieldNames ? '' : 'tokenTransactionSignatures',
        subBuilder: $1.SignatureWithIndex.create)
    ..pPS(3, _omitFieldNames ? '' : 'keyshareIds')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'coordinatorPublicKey', $pb.PbFieldType.OY)
    ..aOM<$2.Timestamp>(5, _omitFieldNames ? '' : 'executeBefore',
        subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignTokenTransactionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignTokenTransactionRequest copyWith(
          void Function(SignTokenTransactionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as SignTokenTransactionRequest))
          as SignTokenTransactionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignTokenTransactionRequest create() =>
      SignTokenTransactionRequest._();
  @$core.override
  SignTokenTransactionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SignTokenTransactionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignTokenTransactionRequest>(create);
  static SignTokenTransactionRequest? _defaultInstance;

  /// TODO: After the switch to require V3+ transactions, stop accepting the legacy tx shape in favor of the new Partial/Final shapes.
  @$pb.TagNumber(1)
  $1.TokenTransaction get finalTokenTransaction => $_getN(0);
  @$pb.TagNumber(1)
  set finalTokenTransaction($1.TokenTransaction value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFinalTokenTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearFinalTokenTransaction() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.TokenTransaction ensureFinalTokenTransaction() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<$1.SignatureWithIndex> get tokenTransactionSignatures =>
      $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get keyshareIds => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get coordinatorPublicKey => $_getN(3);
  @$pb.TagNumber(4)
  set coordinatorPublicKey($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCoordinatorPublicKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearCoordinatorPublicKey() => $_clearField(4);

  /// Optional client-specified deadline, forwarded from PartialTokenTransaction.execute_before.
  /// When set, non-coordinator SOs use this to relax CCT freshness validation.
  @$pb.TagNumber(5)
  $2.Timestamp get executeBefore => $_getN(4);
  @$pb.TagNumber(5)
  set executeBefore($2.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasExecuteBefore() => $_has(4);
  @$pb.TagNumber(5)
  void clearExecuteBefore() => $_clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureExecuteBefore() => $_ensure(4);
}

class SignTokenTransactionResponse extends $pb.GeneratedMessage {
  factory SignTokenTransactionResponse({
    $core.List<$core.int>? sparkOperatorSignature,
  }) {
    final result = create();
    if (sparkOperatorSignature != null)
      result.sparkOperatorSignature = sparkOperatorSignature;
    return result;
  }

  SignTokenTransactionResponse._();

  factory SignTokenTransactionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SignTokenTransactionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignTokenTransactionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'sparkOperatorSignature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignTokenTransactionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignTokenTransactionResponse copyWith(
          void Function(SignTokenTransactionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as SignTokenTransactionResponse))
          as SignTokenTransactionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignTokenTransactionResponse create() =>
      SignTokenTransactionResponse._();
  @$core.override
  SignTokenTransactionResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SignTokenTransactionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignTokenTransactionResponse>(create);
  static SignTokenTransactionResponse? _defaultInstance;

  /// The signature from this SO
  @$pb.TagNumber(1)
  $core.List<$core.int> get sparkOperatorSignature => $_getN(0);
  @$pb.TagNumber(1)
  set sparkOperatorSignature($core.List<$core.int> value) =>
      $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSparkOperatorSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSparkOperatorSignature() => $_clearField(1);
}

/// Internal freeze tokens request (SO-to-SO)
class InternalFreezeTokensRequest extends $pb.GeneratedMessage {
  factory InternalFreezeTokensRequest({
    $1.FreezeTokensPayload? freezeTokensPayload,
    $core.List<$core.int>? issuerSignature,
  }) {
    final result = create();
    if (freezeTokensPayload != null)
      result.freezeTokensPayload = freezeTokensPayload;
    if (issuerSignature != null) result.issuerSignature = issuerSignature;
    return result;
  }

  InternalFreezeTokensRequest._();

  factory InternalFreezeTokensRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InternalFreezeTokensRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InternalFreezeTokensRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..aOM<$1.FreezeTokensPayload>(
        1, _omitFieldNames ? '' : 'freezeTokensPayload',
        subBuilder: $1.FreezeTokensPayload.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'issuerSignature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InternalFreezeTokensRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InternalFreezeTokensRequest copyWith(
          void Function(InternalFreezeTokensRequest) updates) =>
      super.copyWith(
              (message) => updates(message as InternalFreezeTokensRequest))
          as InternalFreezeTokensRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InternalFreezeTokensRequest create() =>
      InternalFreezeTokensRequest._();
  @$core.override
  InternalFreezeTokensRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InternalFreezeTokensRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InternalFreezeTokensRequest>(create);
  static InternalFreezeTokensRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.FreezeTokensPayload get freezeTokensPayload => $_getN(0);
  @$pb.TagNumber(1)
  set freezeTokensPayload($1.FreezeTokensPayload value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFreezeTokensPayload() => $_has(0);
  @$pb.TagNumber(1)
  void clearFreezeTokensPayload() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.FreezeTokensPayload ensureFreezeTokensPayload() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get issuerSignature => $_getN(1);
  @$pb.TagNumber(2)
  set issuerSignature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIssuerSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearIssuerSignature() => $_clearField(2);
}

class InternalFreezeTokensResponse extends $pb.GeneratedMessage {
  factory InternalFreezeTokensResponse({
    $core.Iterable<$1.TokenOutputRef>? impactedTokenOutputs,
    $core.List<$core.int>? impactedTokenAmount,
  }) {
    final result = create();
    if (impactedTokenOutputs != null)
      result.impactedTokenOutputs.addAll(impactedTokenOutputs);
    if (impactedTokenAmount != null)
      result.impactedTokenAmount = impactedTokenAmount;
    return result;
  }

  InternalFreezeTokensResponse._();

  factory InternalFreezeTokensResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InternalFreezeTokensResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InternalFreezeTokensResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_token'),
      createEmptyInstance: create)
    ..pPM<$1.TokenOutputRef>(1, _omitFieldNames ? '' : 'impactedTokenOutputs',
        subBuilder: $1.TokenOutputRef.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'impactedTokenAmount', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InternalFreezeTokensResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InternalFreezeTokensResponse copyWith(
          void Function(InternalFreezeTokensResponse) updates) =>
      super.copyWith(
              (message) => updates(message as InternalFreezeTokensResponse))
          as InternalFreezeTokensResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InternalFreezeTokensResponse create() =>
      InternalFreezeTokensResponse._();
  @$core.override
  InternalFreezeTokensResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InternalFreezeTokensResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InternalFreezeTokensResponse>(create);
  static InternalFreezeTokensResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$1.TokenOutputRef> get impactedTokenOutputs => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get impactedTokenAmount => $_getN(1);
  @$pb.TagNumber(2)
  set impactedTokenAmount($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasImpactedTokenAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearImpactedTokenAmount() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
