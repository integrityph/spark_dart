// This is a generated file - do not edit.
//
// Generated from spark_internal.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/any.pb.dart' as $5;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $4;

import 'common.pb.dart' as $3;
import 'spark.pb.dart' as $2;
import 'spark_internal.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'spark_internal.pbenum.dart';

class MarkKeysharesAsUsedRequest extends $pb.GeneratedMessage {
  factory MarkKeysharesAsUsedRequest({
    $core.Iterable<$core.String>? keyshareId,
  }) {
    final result = create();
    if (keyshareId != null) result.keyshareId.addAll(keyshareId);
    return result;
  }

  MarkKeysharesAsUsedRequest._();

  factory MarkKeysharesAsUsedRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MarkKeysharesAsUsedRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MarkKeysharesAsUsedRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'keyshareId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarkKeysharesAsUsedRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarkKeysharesAsUsedRequest copyWith(
          void Function(MarkKeysharesAsUsedRequest) updates) =>
      super.copyWith(
              (message) => updates(message as MarkKeysharesAsUsedRequest))
          as MarkKeysharesAsUsedRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkKeysharesAsUsedRequest create() => MarkKeysharesAsUsedRequest._();
  @$core.override
  MarkKeysharesAsUsedRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MarkKeysharesAsUsedRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MarkKeysharesAsUsedRequest>(create);
  static MarkKeysharesAsUsedRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get keyshareId => $_getList(0);
}

class MarkKeyshareForDepositAddressRequest extends $pb.GeneratedMessage {
  factory MarkKeyshareForDepositAddressRequest({
    $core.String? keyshareId,
    $core.String? address,
    $core.List<$core.int>? ownerIdentityPublicKey,
    $core.List<$core.int>? ownerSigningPublicKey,
    $core.bool? isStatic,
  }) {
    final result = create();
    if (keyshareId != null) result.keyshareId = keyshareId;
    if (address != null) result.address = address;
    if (ownerIdentityPublicKey != null)
      result.ownerIdentityPublicKey = ownerIdentityPublicKey;
    if (ownerSigningPublicKey != null)
      result.ownerSigningPublicKey = ownerSigningPublicKey;
    if (isStatic != null) result.isStatic = isStatic;
    return result;
  }

  MarkKeyshareForDepositAddressRequest._();

  factory MarkKeyshareForDepositAddressRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MarkKeyshareForDepositAddressRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MarkKeyshareForDepositAddressRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'keyshareId')
    ..aOS(2, _omitFieldNames ? '' : 'address')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'ownerIdentityPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'ownerSigningPublicKey', $pb.PbFieldType.OY)
    ..aOB(5, _omitFieldNames ? '' : 'isStatic')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarkKeyshareForDepositAddressRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarkKeyshareForDepositAddressRequest copyWith(
          void Function(MarkKeyshareForDepositAddressRequest) updates) =>
      super.copyWith((message) =>
              updates(message as MarkKeyshareForDepositAddressRequest))
          as MarkKeyshareForDepositAddressRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkKeyshareForDepositAddressRequest create() =>
      MarkKeyshareForDepositAddressRequest._();
  @$core.override
  MarkKeyshareForDepositAddressRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MarkKeyshareForDepositAddressRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          MarkKeyshareForDepositAddressRequest>(create);
  static MarkKeyshareForDepositAddressRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get keyshareId => $_getSZ(0);
  @$pb.TagNumber(1)
  set keyshareId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasKeyshareId() => $_has(0);
  @$pb.TagNumber(1)
  void clearKeyshareId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get ownerIdentityPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set ownerIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOwnerIdentityPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearOwnerIdentityPublicKey() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get ownerSigningPublicKey => $_getN(3);
  @$pb.TagNumber(4)
  set ownerSigningPublicKey($core.List<$core.int> value) =>
      $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOwnerSigningPublicKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearOwnerSigningPublicKey() => $_clearField(4);

  /// Static deposit address flag
  @$pb.TagNumber(5)
  $core.bool get isStatic => $_getBF(4);
  @$pb.TagNumber(5)
  set isStatic($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIsStatic() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsStatic() => $_clearField(5);
}

class MarkKeyshareForDepositAddressResponse extends $pb.GeneratedMessage {
  factory MarkKeyshareForDepositAddressResponse({
    $core.List<$core.int>? addressSignature,
  }) {
    final result = create();
    if (addressSignature != null) result.addressSignature = addressSignature;
    return result;
  }

  MarkKeyshareForDepositAddressResponse._();

  factory MarkKeyshareForDepositAddressResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MarkKeyshareForDepositAddressResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MarkKeyshareForDepositAddressResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'addressSignature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarkKeyshareForDepositAddressResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MarkKeyshareForDepositAddressResponse copyWith(
          void Function(MarkKeyshareForDepositAddressResponse) updates) =>
      super.copyWith((message) =>
              updates(message as MarkKeyshareForDepositAddressResponse))
          as MarkKeyshareForDepositAddressResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkKeyshareForDepositAddressResponse create() =>
      MarkKeyshareForDepositAddressResponse._();
  @$core.override
  MarkKeyshareForDepositAddressResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MarkKeyshareForDepositAddressResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          MarkKeyshareForDepositAddressResponse>(create);
  static MarkKeyshareForDepositAddressResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get addressSignature => $_getN(0);
  @$pb.TagNumber(1)
  set addressSignature($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAddressSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddressSignature() => $_clearField(1);
}

class FrostRound1Request extends $pb.GeneratedMessage {
  factory FrostRound1Request({
    @$core.Deprecated('This field is deprecated.')
    $core.Iterable<$core.String>? keyshareIds,
    @$core.Deprecated('This field is deprecated.')
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        publicKeys,
    @$core.Deprecated('This field is deprecated.') $core.int? count,
    $core.int? randomNonceCount,
  }) {
    final result = create();
    if (keyshareIds != null) result.keyshareIds.addAll(keyshareIds);
    if (publicKeys != null) result.publicKeys.addEntries(publicKeys);
    if (count != null) result.count = count;
    if (randomNonceCount != null) result.randomNonceCount = randomNonceCount;
    return result;
  }

  FrostRound1Request._();

  factory FrostRound1Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FrostRound1Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FrostRound1Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'keyshareIds')
    ..m<$core.String, $core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'publicKeys',
        entryClassName: 'FrostRound1Request.PublicKeysEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark_internal'))
    ..aI(3, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..aI(4, _omitFieldNames ? '' : 'randomNonceCount',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrostRound1Request clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrostRound1Request copyWith(void Function(FrostRound1Request) updates) =>
      super.copyWith((message) => updates(message as FrostRound1Request))
          as FrostRound1Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FrostRound1Request create() => FrostRound1Request._();
  @$core.override
  FrostRound1Request createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FrostRound1Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FrostRound1Request>(create);
  static FrostRound1Request? _defaultInstance;

  /// DEPRECATED: This field is ignored when random_nonce_count is set.
  /// Prefer setting random_nonce_count directly.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get keyshareIds => $_getList(0);

  /// DEPRECATED: Not used by the handler. Commitments are independent of long-term public keys.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $core.List<$core.int>> get publicKeys => $_getMap(1);

  /// DEPRECATED: This field is ignored when random_nonce_count is set. Prefer random_nonce_count.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.int get count => $_getIZ(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  set count($core.int value) => $_setUnsignedInt32(2, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.bool hasCount() => $_has(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  void clearCount() => $_clearField(3);

  /// If this is set to non-zero, the keyshare_ids will be ignored and the random keys will be used.
  @$pb.TagNumber(4)
  $core.int get randomNonceCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set randomNonceCount($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRandomNonceCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearRandomNonceCount() => $_clearField(4);
}

class FrostRound1Response extends $pb.GeneratedMessage {
  factory FrostRound1Response({
    $core.Iterable<$3.SigningCommitment>? signingCommitments,
  }) {
    final result = create();
    if (signingCommitments != null)
      result.signingCommitments.addAll(signingCommitments);
    return result;
  }

  FrostRound1Response._();

  factory FrostRound1Response.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FrostRound1Response.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FrostRound1Response',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..pPM<$3.SigningCommitment>(1, _omitFieldNames ? '' : 'signingCommitments',
        subBuilder: $3.SigningCommitment.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrostRound1Response clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrostRound1Response copyWith(void Function(FrostRound1Response) updates) =>
      super.copyWith((message) => updates(message as FrostRound1Response))
          as FrostRound1Response;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FrostRound1Response create() => FrostRound1Response._();
  @$core.override
  FrostRound1Response createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FrostRound1Response getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FrostRound1Response>(create);
  static FrostRound1Response? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$3.SigningCommitment> get signingCommitments => $_getList(0);
}

class SigningJob extends $pb.GeneratedMessage {
  factory SigningJob({
    $core.String? jobId,
    $core.List<$core.int>? message,
    $core.String? keyshareId,
    $core.List<$core.int>? verifyingKey,
    $core.Iterable<$core.MapEntry<$core.String, $3.SigningCommitment>>?
        commitments,
    $3.SigningCommitment? userCommitments,
    $core.List<$core.int>? adaptorPublicKey,
  }) {
    final result = create();
    if (jobId != null) result.jobId = jobId;
    if (message != null) result.message = message;
    if (keyshareId != null) result.keyshareId = keyshareId;
    if (verifyingKey != null) result.verifyingKey = verifyingKey;
    if (commitments != null) result.commitments.addEntries(commitments);
    if (userCommitments != null) result.userCommitments = userCommitments;
    if (adaptorPublicKey != null) result.adaptorPublicKey = adaptorPublicKey;
    return result;
  }

  SigningJob._();

  factory SigningJob.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningJob.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningJob',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'message', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'keyshareId')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'verifyingKey', $pb.PbFieldType.OY)
    ..m<$core.String, $3.SigningCommitment>(
        5, _omitFieldNames ? '' : 'commitments',
        entryClassName: 'SigningJob.CommitmentsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $3.SigningCommitment.create,
        valueDefaultOrMaker: $3.SigningCommitment.getDefault,
        packageName: const $pb.PackageName('spark_internal'))
    ..aOM<$3.SigningCommitment>(6, _omitFieldNames ? '' : 'userCommitments',
        subBuilder: $3.SigningCommitment.create)
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'adaptorPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningJob clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningJob copyWith(void Function(SigningJob) updates) =>
      super.copyWith((message) => updates(message as SigningJob)) as SigningJob;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SigningJob create() => SigningJob._();
  @$core.override
  SigningJob createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SigningJob getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SigningJob>(create);
  static SigningJob? _defaultInstance;

  /// The unique identifier for the signing job.
  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => $_clearField(1);

  /// The message to sign.
  @$pb.TagNumber(2)
  $core.List<$core.int> get message => $_getN(1);
  @$pb.TagNumber(2)
  set message($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  /// The secret package from DKG round 3.
  @$pb.TagNumber(3)
  $core.String get keyshareId => $_getSZ(2);
  @$pb.TagNumber(3)
  set keyshareId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasKeyshareId() => $_has(2);
  @$pb.TagNumber(3)
  void clearKeyshareId() => $_clearField(3);

  /// The verifying key. This should be the total public key for both user and StatechainEntity.
  @$pb.TagNumber(4)
  $core.List<$core.int> get verifyingKey => $_getN(3);
  @$pb.TagNumber(4)
  set verifyingKey($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVerifyingKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearVerifyingKey() => $_clearField(4);

  /// The commitments for all participants of the statechain.
  @$pb.TagNumber(5)
  $pb.PbMap<$core.String, $3.SigningCommitment> get commitments => $_getMap(4);

  /// The commitments for all participants of the user.
  @$pb.TagNumber(6)
  $3.SigningCommitment get userCommitments => $_getN(5);
  @$pb.TagNumber(6)
  set userCommitments($3.SigningCommitment value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasUserCommitments() => $_has(5);
  @$pb.TagNumber(6)
  void clearUserCommitments() => $_clearField(6);
  @$pb.TagNumber(6)
  $3.SigningCommitment ensureUserCommitments() => $_ensure(5);

  /// The adaptor for the message.
  @$pb.TagNumber(7)
  $core.List<$core.int> get adaptorPublicKey => $_getN(6);
  @$pb.TagNumber(7)
  set adaptorPublicKey($core.List<$core.int> value) => $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAdaptorPublicKey() => $_has(6);
  @$pb.TagNumber(7)
  void clearAdaptorPublicKey() => $_clearField(7);
}

class FrostRound2Request extends $pb.GeneratedMessage {
  factory FrostRound2Request({
    $core.Iterable<SigningJob>? signingJobs,
  }) {
    final result = create();
    if (signingJobs != null) result.signingJobs.addAll(signingJobs);
    return result;
  }

  FrostRound2Request._();

  factory FrostRound2Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FrostRound2Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FrostRound2Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..pPM<SigningJob>(1, _omitFieldNames ? '' : 'signingJobs',
        subBuilder: SigningJob.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrostRound2Request clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrostRound2Request copyWith(void Function(FrostRound2Request) updates) =>
      super.copyWith((message) => updates(message as FrostRound2Request))
          as FrostRound2Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FrostRound2Request create() => FrostRound2Request._();
  @$core.override
  FrostRound2Request createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FrostRound2Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FrostRound2Request>(create);
  static FrostRound2Request? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SigningJob> get signingJobs => $_getList(0);
}

class FrostRound2Response extends $pb.GeneratedMessage {
  factory FrostRound2Response({
    $core.Iterable<$core.MapEntry<$core.String, $3.SigningResult>>? results,
  }) {
    final result = create();
    if (results != null) result.results.addEntries(results);
    return result;
  }

  FrostRound2Response._();

  factory FrostRound2Response.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FrostRound2Response.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FrostRound2Response',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..m<$core.String, $3.SigningResult>(1, _omitFieldNames ? '' : 'results',
        entryClassName: 'FrostRound2Response.ResultsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $3.SigningResult.create,
        valueDefaultOrMaker: $3.SigningResult.getDefault,
        packageName: const $pb.PackageName('spark_internal'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrostRound2Response clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrostRound2Response copyWith(void Function(FrostRound2Response) updates) =>
      super.copyWith((message) => updates(message as FrostRound2Response))
          as FrostRound2Response;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FrostRound2Response create() => FrostRound2Response._();
  @$core.override
  FrostRound2Response createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FrostRound2Response getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FrostRound2Response>(create);
  static FrostRound2Response? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $3.SigningResult> get results => $_getMap(0);
}

class FinalizeTreeCreationRequest extends $pb.GeneratedMessage {
  factory FinalizeTreeCreationRequest({
    $core.Iterable<TreeNode>? nodes,
    $2.Network? network,
  }) {
    final result = create();
    if (nodes != null) result.nodes.addAll(nodes);
    if (network != null) result.network = network;
    return result;
  }

  FinalizeTreeCreationRequest._();

  factory FinalizeTreeCreationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinalizeTreeCreationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinalizeTreeCreationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..pPM<TreeNode>(1, _omitFieldNames ? '' : 'nodes',
        subBuilder: TreeNode.create)
    ..aE<$2.Network>(2, _omitFieldNames ? '' : 'network',
        enumValues: $2.Network.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeTreeCreationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeTreeCreationRequest copyWith(
          void Function(FinalizeTreeCreationRequest) updates) =>
      super.copyWith(
              (message) => updates(message as FinalizeTreeCreationRequest))
          as FinalizeTreeCreationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinalizeTreeCreationRequest create() =>
      FinalizeTreeCreationRequest._();
  @$core.override
  FinalizeTreeCreationRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FinalizeTreeCreationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinalizeTreeCreationRequest>(create);
  static FinalizeTreeCreationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TreeNode> get nodes => $_getList(0);

  @$pb.TagNumber(2)
  $2.Network get network => $_getN(1);
  @$pb.TagNumber(2)
  set network($2.Network value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNetwork() => $_has(1);
  @$pb.TagNumber(2)
  void clearNetwork() => $_clearField(2);
}

class FinalizeTransferRequest extends $pb.GeneratedMessage {
  factory FinalizeTransferRequest({
    $core.String? transferId,
    $core.Iterable<TreeNode>? nodes,
    $4.Timestamp? timestamp,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (nodes != null) result.nodes.addAll(nodes);
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  FinalizeTransferRequest._();

  factory FinalizeTransferRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinalizeTransferRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinalizeTransferRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..pPM<TreeNode>(2, _omitFieldNames ? '' : 'nodes',
        subBuilder: TreeNode.create)
    ..aOM<$4.Timestamp>(3, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $4.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeTransferRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeTransferRequest copyWith(
          void Function(FinalizeTransferRequest) updates) =>
      super.copyWith((message) => updates(message as FinalizeTransferRequest))
          as FinalizeTransferRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinalizeTransferRequest create() => FinalizeTransferRequest._();
  @$core.override
  FinalizeTransferRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FinalizeTransferRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinalizeTransferRequest>(create);
  static FinalizeTransferRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<TreeNode> get nodes => $_getList(1);

  @$pb.TagNumber(3)
  $4.Timestamp get timestamp => $_getN(2);
  @$pb.TagNumber(3)
  set timestamp($4.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => $_clearField(3);
  @$pb.TagNumber(3)
  $4.Timestamp ensureTimestamp() => $_ensure(2);
}

class FinalizeRefreshTimelockRequest extends $pb.GeneratedMessage {
  factory FinalizeRefreshTimelockRequest({
    $core.Iterable<TreeNode>? nodes,
  }) {
    final result = create();
    if (nodes != null) result.nodes.addAll(nodes);
    return result;
  }

  FinalizeRefreshTimelockRequest._();

  factory FinalizeRefreshTimelockRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinalizeRefreshTimelockRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinalizeRefreshTimelockRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..pPM<TreeNode>(1, _omitFieldNames ? '' : 'nodes',
        subBuilder: TreeNode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeRefreshTimelockRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeRefreshTimelockRequest copyWith(
          void Function(FinalizeRefreshTimelockRequest) updates) =>
      super.copyWith(
              (message) => updates(message as FinalizeRefreshTimelockRequest))
          as FinalizeRefreshTimelockRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinalizeRefreshTimelockRequest create() =>
      FinalizeRefreshTimelockRequest._();
  @$core.override
  FinalizeRefreshTimelockRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FinalizeRefreshTimelockRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinalizeRefreshTimelockRequest>(create);
  static FinalizeRefreshTimelockRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TreeNode> get nodes => $_getList(0);
}

class FinalizeExtendLeafRequest extends $pb.GeneratedMessage {
  factory FinalizeExtendLeafRequest({
    TreeNode? node,
  }) {
    final result = create();
    if (node != null) result.node = node;
    return result;
  }

  FinalizeExtendLeafRequest._();

  factory FinalizeExtendLeafRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinalizeExtendLeafRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinalizeExtendLeafRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOM<TreeNode>(1, _omitFieldNames ? '' : 'node',
        subBuilder: TreeNode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeExtendLeafRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeExtendLeafRequest copyWith(
          void Function(FinalizeExtendLeafRequest) updates) =>
      super.copyWith((message) => updates(message as FinalizeExtendLeafRequest))
          as FinalizeExtendLeafRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinalizeExtendLeafRequest create() => FinalizeExtendLeafRequest._();
  @$core.override
  FinalizeExtendLeafRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FinalizeExtendLeafRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinalizeExtendLeafRequest>(create);
  static FinalizeExtendLeafRequest? _defaultInstance;

  @$pb.TagNumber(1)
  TreeNode get node => $_getN(0);
  @$pb.TagNumber(1)
  set node(TreeNode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasNode() => $_has(0);
  @$pb.TagNumber(1)
  void clearNode() => $_clearField(1);
  @$pb.TagNumber(1)
  TreeNode ensureNode() => $_ensure(0);
}

class FinalizeRenewRefundTimelockRequest extends $pb.GeneratedMessage {
  factory FinalizeRenewRefundTimelockRequest({
    TreeNode? node,
  }) {
    final result = create();
    if (node != null) result.node = node;
    return result;
  }

  FinalizeRenewRefundTimelockRequest._();

  factory FinalizeRenewRefundTimelockRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinalizeRenewRefundTimelockRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinalizeRenewRefundTimelockRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOM<TreeNode>(1, _omitFieldNames ? '' : 'node',
        subBuilder: TreeNode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeRenewRefundTimelockRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeRenewRefundTimelockRequest copyWith(
          void Function(FinalizeRenewRefundTimelockRequest) updates) =>
      super.copyWith((message) =>
              updates(message as FinalizeRenewRefundTimelockRequest))
          as FinalizeRenewRefundTimelockRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinalizeRenewRefundTimelockRequest create() =>
      FinalizeRenewRefundTimelockRequest._();
  @$core.override
  FinalizeRenewRefundTimelockRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FinalizeRenewRefundTimelockRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinalizeRenewRefundTimelockRequest>(
          create);
  static FinalizeRenewRefundTimelockRequest? _defaultInstance;

  @$pb.TagNumber(1)
  TreeNode get node => $_getN(0);
  @$pb.TagNumber(1)
  set node(TreeNode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasNode() => $_has(0);
  @$pb.TagNumber(1)
  void clearNode() => $_clearField(1);
  @$pb.TagNumber(1)
  TreeNode ensureNode() => $_ensure(0);
}

class FinalizeRenewNodeTimelockRequest extends $pb.GeneratedMessage {
  factory FinalizeRenewNodeTimelockRequest({
    TreeNode? splitNode,
    TreeNode? node,
  }) {
    final result = create();
    if (splitNode != null) result.splitNode = splitNode;
    if (node != null) result.node = node;
    return result;
  }

  FinalizeRenewNodeTimelockRequest._();

  factory FinalizeRenewNodeTimelockRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinalizeRenewNodeTimelockRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinalizeRenewNodeTimelockRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOM<TreeNode>(1, _omitFieldNames ? '' : 'splitNode',
        subBuilder: TreeNode.create)
    ..aOM<TreeNode>(2, _omitFieldNames ? '' : 'node',
        subBuilder: TreeNode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeRenewNodeTimelockRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeRenewNodeTimelockRequest copyWith(
          void Function(FinalizeRenewNodeTimelockRequest) updates) =>
      super.copyWith(
              (message) => updates(message as FinalizeRenewNodeTimelockRequest))
          as FinalizeRenewNodeTimelockRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinalizeRenewNodeTimelockRequest create() =>
      FinalizeRenewNodeTimelockRequest._();
  @$core.override
  FinalizeRenewNodeTimelockRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FinalizeRenewNodeTimelockRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinalizeRenewNodeTimelockRequest>(
          create);
  static FinalizeRenewNodeTimelockRequest? _defaultInstance;

  @$pb.TagNumber(1)
  TreeNode get splitNode => $_getN(0);
  @$pb.TagNumber(1)
  set splitNode(TreeNode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSplitNode() => $_has(0);
  @$pb.TagNumber(1)
  void clearSplitNode() => $_clearField(1);
  @$pb.TagNumber(1)
  TreeNode ensureSplitNode() => $_ensure(0);

  @$pb.TagNumber(2)
  TreeNode get node => $_getN(1);
  @$pb.TagNumber(2)
  set node(TreeNode value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNode() => $_has(1);
  @$pb.TagNumber(2)
  void clearNode() => $_clearField(2);
  @$pb.TagNumber(2)
  TreeNode ensureNode() => $_ensure(1);
}

class NodeAvailableForRenewRequest extends $pb.GeneratedMessage {
  factory NodeAvailableForRenewRequest({
    $core.String? nodeId,
  }) {
    final result = create();
    if (nodeId != null) result.nodeId = nodeId;
    return result;
  }

  NodeAvailableForRenewRequest._();

  factory NodeAvailableForRenewRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NodeAvailableForRenewRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NodeAvailableForRenewRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nodeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NodeAvailableForRenewRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NodeAvailableForRenewRequest copyWith(
          void Function(NodeAvailableForRenewRequest) updates) =>
      super.copyWith(
              (message) => updates(message as NodeAvailableForRenewRequest))
          as NodeAvailableForRenewRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NodeAvailableForRenewRequest create() =>
      NodeAvailableForRenewRequest._();
  @$core.override
  NodeAvailableForRenewRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NodeAvailableForRenewRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NodeAvailableForRenewRequest>(create);
  static NodeAvailableForRenewRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nodeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set nodeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNodeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNodeId() => $_clearField(1);
}

class TreeNode extends $pb.GeneratedMessage {
  factory TreeNode({
    $core.String? id,
    $fixnum.Int64? value,
    $core.List<$core.int>? verifyingPubkey,
    $core.List<$core.int>? ownerIdentityPubkey,
    $core.List<$core.int>? ownerSigningPubkey,
    $core.List<$core.int>? rawTx,
    $core.List<$core.int>? rawRefundTx,
    $core.String? treeId,
    $core.String? parentNodeId,
    $core.String? signingKeyshareId,
    $core.int? vout,
    $core.int? refundTimelock,
    $core.List<$core.int>? directTx,
    $core.List<$core.int>? directRefundTx,
    $core.List<$core.int>? directFromCpfpRefundTx,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (value != null) result.value = value;
    if (verifyingPubkey != null) result.verifyingPubkey = verifyingPubkey;
    if (ownerIdentityPubkey != null)
      result.ownerIdentityPubkey = ownerIdentityPubkey;
    if (ownerSigningPubkey != null)
      result.ownerSigningPubkey = ownerSigningPubkey;
    if (rawTx != null) result.rawTx = rawTx;
    if (rawRefundTx != null) result.rawRefundTx = rawRefundTx;
    if (treeId != null) result.treeId = treeId;
    if (parentNodeId != null) result.parentNodeId = parentNodeId;
    if (signingKeyshareId != null) result.signingKeyshareId = signingKeyshareId;
    if (vout != null) result.vout = vout;
    if (refundTimelock != null) result.refundTimelock = refundTimelock;
    if (directTx != null) result.directTx = directTx;
    if (directRefundTx != null) result.directRefundTx = directRefundTx;
    if (directFromCpfpRefundTx != null)
      result.directFromCpfpRefundTx = directFromCpfpRefundTx;
    return result;
  }

  TreeNode._();

  factory TreeNode.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TreeNode.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TreeNode',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'verifyingPubkey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'ownerIdentityPubkey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'ownerSigningPubkey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'rawTx', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'rawRefundTx', $pb.PbFieldType.OY)
    ..aOS(8, _omitFieldNames ? '' : 'treeId')
    ..aOS(9, _omitFieldNames ? '' : 'parentNodeId')
    ..aOS(10, _omitFieldNames ? '' : 'signingKeyshareId')
    ..aI(11, _omitFieldNames ? '' : 'vout', fieldType: $pb.PbFieldType.OU3)
    ..aI(12, _omitFieldNames ? '' : 'refundTimelock',
        fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        13, _omitFieldNames ? '' : 'directTx', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        14, _omitFieldNames ? '' : 'directRefundTx', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        15, _omitFieldNames ? '' : 'directFromCpfpRefundTx', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TreeNode clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TreeNode copyWith(void Function(TreeNode) updates) =>
      super.copyWith((message) => updates(message as TreeNode)) as TreeNode;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TreeNode create() => TreeNode._();
  @$core.override
  TreeNode createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TreeNode getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TreeNode>(create);
  static TreeNode? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get value => $_getI64(1);
  @$pb.TagNumber(2)
  set value($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get verifyingPubkey => $_getN(2);
  @$pb.TagNumber(3)
  set verifyingPubkey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVerifyingPubkey() => $_has(2);
  @$pb.TagNumber(3)
  void clearVerifyingPubkey() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get ownerIdentityPubkey => $_getN(3);
  @$pb.TagNumber(4)
  set ownerIdentityPubkey($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOwnerIdentityPubkey() => $_has(3);
  @$pb.TagNumber(4)
  void clearOwnerIdentityPubkey() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get ownerSigningPubkey => $_getN(4);
  @$pb.TagNumber(5)
  set ownerSigningPubkey($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOwnerSigningPubkey() => $_has(4);
  @$pb.TagNumber(5)
  void clearOwnerSigningPubkey() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get rawTx => $_getN(5);
  @$pb.TagNumber(6)
  set rawTx($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRawTx() => $_has(5);
  @$pb.TagNumber(6)
  void clearRawTx() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get rawRefundTx => $_getN(6);
  @$pb.TagNumber(7)
  set rawRefundTx($core.List<$core.int> value) => $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRawRefundTx() => $_has(6);
  @$pb.TagNumber(7)
  void clearRawRefundTx() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get treeId => $_getSZ(7);
  @$pb.TagNumber(8)
  set treeId($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTreeId() => $_has(7);
  @$pb.TagNumber(8)
  void clearTreeId() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get parentNodeId => $_getSZ(8);
  @$pb.TagNumber(9)
  set parentNodeId($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasParentNodeId() => $_has(8);
  @$pb.TagNumber(9)
  void clearParentNodeId() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get signingKeyshareId => $_getSZ(9);
  @$pb.TagNumber(10)
  set signingKeyshareId($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasSigningKeyshareId() => $_has(9);
  @$pb.TagNumber(10)
  void clearSigningKeyshareId() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get vout => $_getIZ(10);
  @$pb.TagNumber(11)
  set vout($core.int value) => $_setUnsignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasVout() => $_has(10);
  @$pb.TagNumber(11)
  void clearVout() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.int get refundTimelock => $_getIZ(11);
  @$pb.TagNumber(12)
  set refundTimelock($core.int value) => $_setUnsignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasRefundTimelock() => $_has(11);
  @$pb.TagNumber(12)
  void clearRefundTimelock() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.List<$core.int> get directTx => $_getN(12);
  @$pb.TagNumber(13)
  set directTx($core.List<$core.int> value) => $_setBytes(12, value);
  @$pb.TagNumber(13)
  $core.bool hasDirectTx() => $_has(12);
  @$pb.TagNumber(13)
  void clearDirectTx() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.List<$core.int> get directRefundTx => $_getN(13);
  @$pb.TagNumber(14)
  set directRefundTx($core.List<$core.int> value) => $_setBytes(13, value);
  @$pb.TagNumber(14)
  $core.bool hasDirectRefundTx() => $_has(13);
  @$pb.TagNumber(14)
  void clearDirectRefundTx() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.List<$core.int> get directFromCpfpRefundTx => $_getN(14);
  @$pb.TagNumber(15)
  set directFromCpfpRefundTx($core.List<$core.int> value) =>
      $_setBytes(14, value);
  @$pb.TagNumber(15)
  $core.bool hasDirectFromCpfpRefundTx() => $_has(14);
  @$pb.TagNumber(15)
  void clearDirectFromCpfpRefundTx() => $_clearField(15);
}

class InitiatePreimageSwapRequest extends $pb.GeneratedMessage {
  factory InitiatePreimageSwapRequest({
    $2.InitiatePreimageSwapRequest? request,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        cpfpRefundSignatures,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        directRefundSignatures,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        directFromCpfpRefundSignatures,
  }) {
    final result = create();
    if (request != null) result.request = request;
    if (cpfpRefundSignatures != null)
      result.cpfpRefundSignatures.addEntries(cpfpRefundSignatures);
    if (directRefundSignatures != null)
      result.directRefundSignatures.addEntries(directRefundSignatures);
    if (directFromCpfpRefundSignatures != null)
      result.directFromCpfpRefundSignatures
          .addEntries(directFromCpfpRefundSignatures);
    return result;
  }

  InitiatePreimageSwapRequest._();

  factory InitiatePreimageSwapRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitiatePreimageSwapRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitiatePreimageSwapRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOM<$2.InitiatePreimageSwapRequest>(1, _omitFieldNames ? '' : 'request',
        subBuilder: $2.InitiatePreimageSwapRequest.create)
    ..m<$core.String, $core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'cpfpRefundSignatures',
        entryClassName: 'InitiatePreimageSwapRequest.CpfpRefundSignaturesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark_internal'))
    ..m<$core.String, $core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'directRefundSignatures',
        entryClassName:
            'InitiatePreimageSwapRequest.DirectRefundSignaturesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark_internal'))
    ..m<$core.String, $core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'directFromCpfpRefundSignatures',
        entryClassName:
            'InitiatePreimageSwapRequest.DirectFromCpfpRefundSignaturesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark_internal'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiatePreimageSwapRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiatePreimageSwapRequest copyWith(
          void Function(InitiatePreimageSwapRequest) updates) =>
      super.copyWith(
              (message) => updates(message as InitiatePreimageSwapRequest))
          as InitiatePreimageSwapRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitiatePreimageSwapRequest create() =>
      InitiatePreimageSwapRequest._();
  @$core.override
  InitiatePreimageSwapRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InitiatePreimageSwapRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InitiatePreimageSwapRequest>(create);
  static InitiatePreimageSwapRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $2.InitiatePreimageSwapRequest get request => $_getN(0);
  @$pb.TagNumber(1)
  set request($2.InitiatePreimageSwapRequest value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequest() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.InitiatePreimageSwapRequest ensureRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $core.List<$core.int>> get cpfpRefundSignatures =>
      $_getMap(1);

  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.List<$core.int>> get directRefundSignatures =>
      $_getMap(2);

  @$pb.TagNumber(4)
  $pb.PbMap<$core.String, $core.List<$core.int>>
      get directFromCpfpRefundSignatures => $_getMap(3);
}

class InitiatePreimageSwapResponse extends $pb.GeneratedMessage {
  factory InitiatePreimageSwapResponse({
    $core.List<$core.int>? preimageShare,
  }) {
    final result = create();
    if (preimageShare != null) result.preimageShare = preimageShare;
    return result;
  }

  InitiatePreimageSwapResponse._();

  factory InitiatePreimageSwapResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitiatePreimageSwapResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitiatePreimageSwapResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'preimageShare', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiatePreimageSwapResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiatePreimageSwapResponse copyWith(
          void Function(InitiatePreimageSwapResponse) updates) =>
      super.copyWith(
              (message) => updates(message as InitiatePreimageSwapResponse))
          as InitiatePreimageSwapResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitiatePreimageSwapResponse create() =>
      InitiatePreimageSwapResponse._();
  @$core.override
  InitiatePreimageSwapResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InitiatePreimageSwapResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InitiatePreimageSwapResponse>(create);
  static InitiatePreimageSwapResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get preimageShare => $_getN(0);
  @$pb.TagNumber(1)
  set preimageShare($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPreimageShare() => $_has(0);
  @$pb.TagNumber(1)
  void clearPreimageShare() => $_clearField(1);
}

class PrepareTreeAddressNode extends $pb.GeneratedMessage {
  factory PrepareTreeAddressNode({
    $core.String? signingKeyshareId,
    $core.List<$core.int>? userPublicKey,
    $core.Iterable<PrepareTreeAddressNode>? children,
  }) {
    final result = create();
    if (signingKeyshareId != null) result.signingKeyshareId = signingKeyshareId;
    if (userPublicKey != null) result.userPublicKey = userPublicKey;
    if (children != null) result.children.addAll(children);
    return result;
  }

  PrepareTreeAddressNode._();

  factory PrepareTreeAddressNode.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PrepareTreeAddressNode.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrepareTreeAddressNode',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'signingKeyshareId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'userPublicKey', $pb.PbFieldType.OY)
    ..pPM<PrepareTreeAddressNode>(3, _omitFieldNames ? '' : 'children',
        subBuilder: PrepareTreeAddressNode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareTreeAddressNode clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareTreeAddressNode copyWith(
          void Function(PrepareTreeAddressNode) updates) =>
      super.copyWith((message) => updates(message as PrepareTreeAddressNode))
          as PrepareTreeAddressNode;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrepareTreeAddressNode create() => PrepareTreeAddressNode._();
  @$core.override
  PrepareTreeAddressNode createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PrepareTreeAddressNode getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrepareTreeAddressNode>(create);
  static PrepareTreeAddressNode? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get signingKeyshareId => $_getSZ(0);
  @$pb.TagNumber(1)
  set signingKeyshareId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSigningKeyshareId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSigningKeyshareId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get userPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set userPublicKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<PrepareTreeAddressNode> get children => $_getList(2);
}

class PrepareTreeAddressRequest extends $pb.GeneratedMessage {
  factory PrepareTreeAddressRequest({
    $core.String? targetKeyshareId,
    PrepareTreeAddressNode? node,
    $core.List<$core.int>? userIdentityPublicKey,
    $2.Network? network,
  }) {
    final result = create();
    if (targetKeyshareId != null) result.targetKeyshareId = targetKeyshareId;
    if (node != null) result.node = node;
    if (userIdentityPublicKey != null)
      result.userIdentityPublicKey = userIdentityPublicKey;
    if (network != null) result.network = network;
    return result;
  }

  PrepareTreeAddressRequest._();

  factory PrepareTreeAddressRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PrepareTreeAddressRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrepareTreeAddressRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'targetKeyshareId')
    ..aOM<PrepareTreeAddressNode>(2, _omitFieldNames ? '' : 'node',
        subBuilder: PrepareTreeAddressNode.create)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'userIdentityPublicKey', $pb.PbFieldType.OY)
    ..aE<$2.Network>(4, _omitFieldNames ? '' : 'network',
        enumValues: $2.Network.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareTreeAddressRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareTreeAddressRequest copyWith(
          void Function(PrepareTreeAddressRequest) updates) =>
      super.copyWith((message) => updates(message as PrepareTreeAddressRequest))
          as PrepareTreeAddressRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrepareTreeAddressRequest create() => PrepareTreeAddressRequest._();
  @$core.override
  PrepareTreeAddressRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PrepareTreeAddressRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrepareTreeAddressRequest>(create);
  static PrepareTreeAddressRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get targetKeyshareId => $_getSZ(0);
  @$pb.TagNumber(1)
  set targetKeyshareId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTargetKeyshareId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetKeyshareId() => $_clearField(1);

  @$pb.TagNumber(2)
  PrepareTreeAddressNode get node => $_getN(1);
  @$pb.TagNumber(2)
  set node(PrepareTreeAddressNode value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNode() => $_has(1);
  @$pb.TagNumber(2)
  void clearNode() => $_clearField(2);
  @$pb.TagNumber(2)
  PrepareTreeAddressNode ensureNode() => $_ensure(1);

  /// TODO: This should be removed once we have a proper auth process.
  @$pb.TagNumber(3)
  $core.List<$core.int> get userIdentityPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set userIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserIdentityPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserIdentityPublicKey() => $_clearField(3);

  @$pb.TagNumber(4)
  $2.Network get network => $_getN(3);
  @$pb.TagNumber(4)
  set network($2.Network value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasNetwork() => $_has(3);
  @$pb.TagNumber(4)
  void clearNetwork() => $_clearField(4);
}

class PrepareTreeAddressResponse extends $pb.GeneratedMessage {
  factory PrepareTreeAddressResponse({
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        signatures,
  }) {
    final result = create();
    if (signatures != null) result.signatures.addEntries(signatures);
    return result;
  }

  PrepareTreeAddressResponse._();

  factory PrepareTreeAddressResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PrepareTreeAddressResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrepareTreeAddressResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..m<$core.String, $core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'signatures',
        entryClassName: 'PrepareTreeAddressResponse.SignaturesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark_internal'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareTreeAddressResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareTreeAddressResponse copyWith(
          void Function(PrepareTreeAddressResponse) updates) =>
      super.copyWith(
              (message) => updates(message as PrepareTreeAddressResponse))
          as PrepareTreeAddressResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrepareTreeAddressResponse create() => PrepareTreeAddressResponse._();
  @$core.override
  PrepareTreeAddressResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PrepareTreeAddressResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrepareTreeAddressResponse>(create);
  static PrepareTreeAddressResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $core.List<$core.int>> get signatures => $_getMap(0);
}

class InitiateTransferLeaf extends $pb.GeneratedMessage {
  factory InitiateTransferLeaf({
    $core.String? leafId,
    $core.List<$core.int>? rawRefundTx,
    $core.List<$core.int>? directRefundTx,
    $core.List<$core.int>? directFromCpfpRefundTx,
  }) {
    final result = create();
    if (leafId != null) result.leafId = leafId;
    if (rawRefundTx != null) result.rawRefundTx = rawRefundTx;
    if (directRefundTx != null) result.directRefundTx = directRefundTx;
    if (directFromCpfpRefundTx != null)
      result.directFromCpfpRefundTx = directFromCpfpRefundTx;
    return result;
  }

  InitiateTransferLeaf._();

  factory InitiateTransferLeaf.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitiateTransferLeaf.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitiateTransferLeaf',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'leafId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'rawRefundTx', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'directRefundTx', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'directFromCpfpRefundTx', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateTransferLeaf clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateTransferLeaf copyWith(void Function(InitiateTransferLeaf) updates) =>
      super.copyWith((message) => updates(message as InitiateTransferLeaf))
          as InitiateTransferLeaf;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitiateTransferLeaf create() => InitiateTransferLeaf._();
  @$core.override
  InitiateTransferLeaf createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InitiateTransferLeaf getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InitiateTransferLeaf>(create);
  static InitiateTransferLeaf? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get leafId => $_getSZ(0);
  @$pb.TagNumber(1)
  set leafId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLeafId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeafId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get rawRefundTx => $_getN(1);
  @$pb.TagNumber(2)
  set rawRefundTx($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRawRefundTx() => $_has(1);
  @$pb.TagNumber(2)
  void clearRawRefundTx() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get directRefundTx => $_getN(2);
  @$pb.TagNumber(3)
  set directRefundTx($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDirectRefundTx() => $_has(2);
  @$pb.TagNumber(3)
  void clearDirectRefundTx() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get directFromCpfpRefundTx => $_getN(3);
  @$pb.TagNumber(4)
  set directFromCpfpRefundTx($core.List<$core.int> value) =>
      $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDirectFromCpfpRefundTx() => $_has(3);
  @$pb.TagNumber(4)
  void clearDirectFromCpfpRefundTx() => $_clearField(4);
}

class InitiateTransferRequest extends $pb.GeneratedMessage {
  factory InitiateTransferRequest({
    $core.String? transferId,
    $core.List<$core.int>? senderIdentityPublicKey,
    $core.List<$core.int>? receiverIdentityPublicKey,
    $4.Timestamp? expiryTime,
    $core.Iterable<InitiateTransferLeaf>? leaves,
    $core.Iterable<$core.MapEntry<$core.String, $2.SecretProof>>?
        senderKeyTweakProofs,
    $2.TransferType? type,
    $2.TransferPackage? transferPackage,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        refundSignatures,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        directRefundSignatures,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        directFromCpfpRefundSignatures,
    $core.String? sparkInvoice,
    $2.AdaptorPublicKeyPackage? adaptorPublicKeys,
    $core.String? primaryTransferId,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (senderIdentityPublicKey != null)
      result.senderIdentityPublicKey = senderIdentityPublicKey;
    if (receiverIdentityPublicKey != null)
      result.receiverIdentityPublicKey = receiverIdentityPublicKey;
    if (expiryTime != null) result.expiryTime = expiryTime;
    if (leaves != null) result.leaves.addAll(leaves);
    if (senderKeyTweakProofs != null)
      result.senderKeyTweakProofs.addEntries(senderKeyTweakProofs);
    if (type != null) result.type = type;
    if (transferPackage != null) result.transferPackage = transferPackage;
    if (refundSignatures != null)
      result.refundSignatures.addEntries(refundSignatures);
    if (directRefundSignatures != null)
      result.directRefundSignatures.addEntries(directRefundSignatures);
    if (directFromCpfpRefundSignatures != null)
      result.directFromCpfpRefundSignatures
          .addEntries(directFromCpfpRefundSignatures);
    if (sparkInvoice != null) result.sparkInvoice = sparkInvoice;
    if (adaptorPublicKeys != null) result.adaptorPublicKeys = adaptorPublicKeys;
    if (primaryTransferId != null) result.primaryTransferId = primaryTransferId;
    return result;
  }

  InitiateTransferRequest._();

  factory InitiateTransferRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitiateTransferRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitiateTransferRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'senderIdentityPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3,
        _omitFieldNames ? '' : 'receiverIdentityPublicKey', $pb.PbFieldType.OY)
    ..aOM<$4.Timestamp>(4, _omitFieldNames ? '' : 'expiryTime',
        subBuilder: $4.Timestamp.create)
    ..pPM<InitiateTransferLeaf>(5, _omitFieldNames ? '' : 'leaves',
        subBuilder: InitiateTransferLeaf.create)
    ..m<$core.String, $2.SecretProof>(
        6, _omitFieldNames ? '' : 'senderKeyTweakProofs',
        entryClassName: 'InitiateTransferRequest.SenderKeyTweakProofsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $2.SecretProof.create,
        valueDefaultOrMaker: $2.SecretProof.getDefault,
        packageName: const $pb.PackageName('spark_internal'))
    ..aE<$2.TransferType>(7, _omitFieldNames ? '' : 'type',
        enumValues: $2.TransferType.values)
    ..aOM<$2.TransferPackage>(8, _omitFieldNames ? '' : 'transferPackage',
        subBuilder: $2.TransferPackage.create)
    ..m<$core.String, $core.List<$core.int>>(
        9, _omitFieldNames ? '' : 'refundSignatures',
        entryClassName: 'InitiateTransferRequest.RefundSignaturesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark_internal'))
    ..m<$core.String, $core.List<$core.int>>(
        10, _omitFieldNames ? '' : 'directRefundSignatures',
        entryClassName: 'InitiateTransferRequest.DirectRefundSignaturesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark_internal'))
    ..m<$core.String, $core.List<$core.int>>(
        11, _omitFieldNames ? '' : 'directFromCpfpRefundSignatures',
        entryClassName:
            'InitiateTransferRequest.DirectFromCpfpRefundSignaturesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark_internal'))
    ..aOS(12, _omitFieldNames ? '' : 'sparkInvoice')
    ..aOM<$2.AdaptorPublicKeyPackage>(
        13, _omitFieldNames ? '' : 'adaptorPublicKeys',
        subBuilder: $2.AdaptorPublicKeyPackage.create)
    ..aOS(14, _omitFieldNames ? '' : 'primaryTransferId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateTransferRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateTransferRequest copyWith(
          void Function(InitiateTransferRequest) updates) =>
      super.copyWith((message) => updates(message as InitiateTransferRequest))
          as InitiateTransferRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitiateTransferRequest create() => InitiateTransferRequest._();
  @$core.override
  InitiateTransferRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InitiateTransferRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InitiateTransferRequest>(create);
  static InitiateTransferRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get senderIdentityPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set senderIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSenderIdentityPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearSenderIdentityPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get receiverIdentityPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set receiverIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReceiverIdentityPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearReceiverIdentityPublicKey() => $_clearField(3);

  @$pb.TagNumber(4)
  $4.Timestamp get expiryTime => $_getN(3);
  @$pb.TagNumber(4)
  set expiryTime($4.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasExpiryTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpiryTime() => $_clearField(4);
  @$pb.TagNumber(4)
  $4.Timestamp ensureExpiryTime() => $_ensure(3);

  @$pb.TagNumber(5)
  $pb.PbList<InitiateTransferLeaf> get leaves => $_getList(4);

  @$pb.TagNumber(6)
  $pb.PbMap<$core.String, $2.SecretProof> get senderKeyTweakProofs =>
      $_getMap(5);

  @$pb.TagNumber(7)
  $2.TransferType get type => $_getN(6);
  @$pb.TagNumber(7)
  set type($2.TransferType value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasType() => $_has(6);
  @$pb.TagNumber(7)
  void clearType() => $_clearField(7);

  @$pb.TagNumber(8)
  $2.TransferPackage get transferPackage => $_getN(7);
  @$pb.TagNumber(8)
  set transferPackage($2.TransferPackage value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasTransferPackage() => $_has(7);
  @$pb.TagNumber(8)
  void clearTransferPackage() => $_clearField(8);
  @$pb.TagNumber(8)
  $2.TransferPackage ensureTransferPackage() => $_ensure(7);

  /// The finalized signatures for the cpfp refund transactions.
  @$pb.TagNumber(9)
  $pb.PbMap<$core.String, $core.List<$core.int>> get refundSignatures =>
      $_getMap(8);

  /// The finalized signatures for the direct refund transactions.
  @$pb.TagNumber(10)
  $pb.PbMap<$core.String, $core.List<$core.int>> get directRefundSignatures =>
      $_getMap(9);

  /// The finalized signatures for the direct from cpfp refund transactions.
  @$pb.TagNumber(11)
  $pb.PbMap<$core.String, $core.List<$core.int>>
      get directFromCpfpRefundSignatures => $_getMap(10);

  /// The invoice this transfer pays.
  @$pb.TagNumber(12)
  $core.String get sparkInvoice => $_getSZ(11);
  @$pb.TagNumber(12)
  set sparkInvoice($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasSparkInvoice() => $_has(11);
  @$pb.TagNumber(12)
  void clearSparkInvoice() => $_clearField(12);

  /// Adaptor public keys to verify adapted signatures for tree node refund transactions.
  @$pb.TagNumber(13)
  $2.AdaptorPublicKeyPackage get adaptorPublicKeys => $_getN(12);
  @$pb.TagNumber(13)
  set adaptorPublicKeys($2.AdaptorPublicKeyPackage value) =>
      $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasAdaptorPublicKeys() => $_has(12);
  @$pb.TagNumber(13)
  void clearAdaptorPublicKeys() => $_clearField(13);
  @$pb.TagNumber(13)
  $2.AdaptorPublicKeyPackage ensureAdaptorPublicKeys() => $_ensure(12);

  /// Primary transfer ID of a counter transfer in Swap V3 flow. Transfers are
  /// required to be connected so their keys can be tweaked at the same time.
  /// For non-SwapV3 flows this field will be an empty string.
  @$pb.TagNumber(14)
  $core.String get primaryTransferId => $_getSZ(13);
  @$pb.TagNumber(14)
  set primaryTransferId($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasPrimaryTransferId() => $_has(13);
  @$pb.TagNumber(14)
  void clearPrimaryTransferId() => $_clearField(14);
}

/// Per-sender data within an InitiateTransferV2Request.
class InitiateTransferSenderPackage extends $pb.GeneratedMessage {
  factory InitiateTransferSenderPackage({
    $core.List<$core.int>? senderIdentityPublicKey,
    $2.TransferPackage? transferPackage,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        receiverIdentityPublicKeys,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        refundSignatures,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        directRefundSignatures,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        directFromCpfpRefundSignatures,
  }) {
    final result = create();
    if (senderIdentityPublicKey != null)
      result.senderIdentityPublicKey = senderIdentityPublicKey;
    if (transferPackage != null) result.transferPackage = transferPackage;
    if (receiverIdentityPublicKeys != null)
      result.receiverIdentityPublicKeys.addEntries(receiverIdentityPublicKeys);
    if (refundSignatures != null)
      result.refundSignatures.addEntries(refundSignatures);
    if (directRefundSignatures != null)
      result.directRefundSignatures.addEntries(directRefundSignatures);
    if (directFromCpfpRefundSignatures != null)
      result.directFromCpfpRefundSignatures
          .addEntries(directFromCpfpRefundSignatures);
    return result;
  }

  InitiateTransferSenderPackage._();

  factory InitiateTransferSenderPackage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitiateTransferSenderPackage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitiateTransferSenderPackage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'senderIdentityPublicKey', $pb.PbFieldType.OY)
    ..aOM<$2.TransferPackage>(2, _omitFieldNames ? '' : 'transferPackage',
        subBuilder: $2.TransferPackage.create)
    ..m<$core.String, $core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'receiverIdentityPublicKeys',
        entryClassName:
            'InitiateTransferSenderPackage.ReceiverIdentityPublicKeysEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark_internal'))
    ..m<$core.String, $core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'refundSignatures',
        entryClassName: 'InitiateTransferSenderPackage.RefundSignaturesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark_internal'))
    ..m<$core.String, $core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'directRefundSignatures',
        entryClassName:
            'InitiateTransferSenderPackage.DirectRefundSignaturesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark_internal'))
    ..m<$core.String, $core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'directFromCpfpRefundSignatures',
        entryClassName:
            'InitiateTransferSenderPackage.DirectFromCpfpRefundSignaturesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark_internal'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateTransferSenderPackage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateTransferSenderPackage copyWith(
          void Function(InitiateTransferSenderPackage) updates) =>
      super.copyWith(
              (message) => updates(message as InitiateTransferSenderPackage))
          as InitiateTransferSenderPackage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitiateTransferSenderPackage create() =>
      InitiateTransferSenderPackage._();
  @$core.override
  InitiateTransferSenderPackage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InitiateTransferSenderPackage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InitiateTransferSenderPackage>(create);
  static InitiateTransferSenderPackage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get senderIdentityPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set senderIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSenderIdentityPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSenderIdentityPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $2.TransferPackage get transferPackage => $_getN(1);
  @$pb.TagNumber(2)
  set transferPackage($2.TransferPackage value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTransferPackage() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransferPackage() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.TransferPackage ensureTransferPackage() => $_ensure(1);

  /// leaf_id → receiver_identity_public_key for each leaf in this sender's package.
  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.List<$core.int>>
      get receiverIdentityPublicKeys => $_getMap(2);

  /// Finalized CPFP refund signatures (leaf_id → signature).
  @$pb.TagNumber(4)
  $pb.PbMap<$core.String, $core.List<$core.int>> get refundSignatures =>
      $_getMap(3);

  /// Finalized direct refund signatures (leaf_id → signature).
  @$pb.TagNumber(5)
  $pb.PbMap<$core.String, $core.List<$core.int>> get directRefundSignatures =>
      $_getMap(4);

  /// Finalized direct-from-CPFP refund signatures (leaf_id → signature).
  @$pb.TagNumber(6)
  $pb.PbMap<$core.String, $core.List<$core.int>>
      get directFromCpfpRefundSignatures => $_getMap(5);
}

/// Internal SO-to-SO request to create one Transfer with multiple senders and receivers.
/// Receiving SOs must accept all sender packages atomically (all or nothing).
class InitiateTransferV2Request extends $pb.GeneratedMessage {
  factory InitiateTransferV2Request({
    $core.String? transferId,
    $core.Iterable<InitiateTransferSenderPackage>? senderPackages,
    $core.Iterable<$core.MapEntry<$core.String, $2.SecretProof>>?
        senderKeyTweakProofs,
    $4.Timestamp? expiryTime,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (senderPackages != null) result.senderPackages.addAll(senderPackages);
    if (senderKeyTweakProofs != null)
      result.senderKeyTweakProofs.addEntries(senderKeyTweakProofs);
    if (expiryTime != null) result.expiryTime = expiryTime;
    return result;
  }

  InitiateTransferV2Request._();

  factory InitiateTransferV2Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitiateTransferV2Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitiateTransferV2Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..pPM<InitiateTransferSenderPackage>(
        2, _omitFieldNames ? '' : 'senderPackages',
        subBuilder: InitiateTransferSenderPackage.create)
    ..m<$core.String, $2.SecretProof>(
        3, _omitFieldNames ? '' : 'senderKeyTweakProofs',
        entryClassName: 'InitiateTransferV2Request.SenderKeyTweakProofsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $2.SecretProof.create,
        valueDefaultOrMaker: $2.SecretProof.getDefault,
        packageName: const $pb.PackageName('spark_internal'))
    ..aOM<$4.Timestamp>(4, _omitFieldNames ? '' : 'expiryTime',
        subBuilder: $4.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateTransferV2Request clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateTransferV2Request copyWith(
          void Function(InitiateTransferV2Request) updates) =>
      super.copyWith((message) => updates(message as InitiateTransferV2Request))
          as InitiateTransferV2Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitiateTransferV2Request create() => InitiateTransferV2Request._();
  @$core.override
  InitiateTransferV2Request createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InitiateTransferV2Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InitiateTransferV2Request>(create);
  static InitiateTransferV2Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  /// One entry per sender. Leaf IDs must be disjoint across entries.
  @$pb.TagNumber(2)
  $pb.PbList<InitiateTransferSenderPackage> get senderPackages => $_getList(1);

  /// FROST key-tweak proofs keyed by leaf_id (across all senders).
  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $2.SecretProof> get senderKeyTweakProofs =>
      $_getMap(2);

  @$pb.TagNumber(4)
  $4.Timestamp get expiryTime => $_getN(3);
  @$pb.TagNumber(4)
  set expiryTime($4.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasExpiryTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpiryTime() => $_clearField(4);
  @$pb.TagNumber(4)
  $4.Timestamp ensureExpiryTime() => $_ensure(3);
}

class DeliverSenderKeyTweakRequest extends $pb.GeneratedMessage {
  factory DeliverSenderKeyTweakRequest({
    $core.String? transferId,
    $core.List<$core.int>? senderIdentityPublicKey,
    $2.TransferPackage? transferPackage,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (senderIdentityPublicKey != null)
      result.senderIdentityPublicKey = senderIdentityPublicKey;
    if (transferPackage != null) result.transferPackage = transferPackage;
    return result;
  }

  DeliverSenderKeyTweakRequest._();

  factory DeliverSenderKeyTweakRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeliverSenderKeyTweakRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeliverSenderKeyTweakRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'senderIdentityPublicKey', $pb.PbFieldType.OY)
    ..aOM<$2.TransferPackage>(3, _omitFieldNames ? '' : 'transferPackage',
        subBuilder: $2.TransferPackage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeliverSenderKeyTweakRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeliverSenderKeyTweakRequest copyWith(
          void Function(DeliverSenderKeyTweakRequest) updates) =>
      super.copyWith(
              (message) => updates(message as DeliverSenderKeyTweakRequest))
          as DeliverSenderKeyTweakRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeliverSenderKeyTweakRequest create() =>
      DeliverSenderKeyTweakRequest._();
  @$core.override
  DeliverSenderKeyTweakRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeliverSenderKeyTweakRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeliverSenderKeyTweakRequest>(create);
  static DeliverSenderKeyTweakRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get senderIdentityPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set senderIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSenderIdentityPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearSenderIdentityPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $2.TransferPackage get transferPackage => $_getN(2);
  @$pb.TagNumber(3)
  set transferPackage($2.TransferPackage value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTransferPackage() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransferPackage() => $_clearField(3);
  @$pb.TagNumber(3)
  $2.TransferPackage ensureTransferPackage() => $_ensure(2);
}

class InitiateCooperativeExitRequest extends $pb.GeneratedMessage {
  factory InitiateCooperativeExitRequest({
    InitiateTransferRequest? transfer,
    $core.String? exitId,
    $core.List<$core.int>? exitTxid,
    $core.List<$core.int>? connectorTx,
  }) {
    final result = create();
    if (transfer != null) result.transfer = transfer;
    if (exitId != null) result.exitId = exitId;
    if (exitTxid != null) result.exitTxid = exitTxid;
    if (connectorTx != null) result.connectorTx = connectorTx;
    return result;
  }

  InitiateCooperativeExitRequest._();

  factory InitiateCooperativeExitRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitiateCooperativeExitRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitiateCooperativeExitRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOM<InitiateTransferRequest>(1, _omitFieldNames ? '' : 'transfer',
        subBuilder: InitiateTransferRequest.create)
    ..aOS(2, _omitFieldNames ? '' : 'exitId')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'exitTxid', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'connectorTx', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateCooperativeExitRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateCooperativeExitRequest copyWith(
          void Function(InitiateCooperativeExitRequest) updates) =>
      super.copyWith(
              (message) => updates(message as InitiateCooperativeExitRequest))
          as InitiateCooperativeExitRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitiateCooperativeExitRequest create() =>
      InitiateCooperativeExitRequest._();
  @$core.override
  InitiateCooperativeExitRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InitiateCooperativeExitRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InitiateCooperativeExitRequest>(create);
  static InitiateCooperativeExitRequest? _defaultInstance;

  @$pb.TagNumber(1)
  InitiateTransferRequest get transfer => $_getN(0);
  @$pb.TagNumber(1)
  set transfer(InitiateTransferRequest value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransfer() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransfer() => $_clearField(1);
  @$pb.TagNumber(1)
  InitiateTransferRequest ensureTransfer() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get exitId => $_getSZ(1);
  @$pb.TagNumber(2)
  set exitId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasExitId() => $_has(1);
  @$pb.TagNumber(2)
  void clearExitId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get exitTxid => $_getN(2);
  @$pb.TagNumber(3)
  set exitTxid($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExitTxid() => $_has(2);
  @$pb.TagNumber(3)
  void clearExitTxid() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get connectorTx => $_getN(3);
  @$pb.TagNumber(4)
  set connectorTx($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasConnectorTx() => $_has(3);
  @$pb.TagNumber(4)
  void clearConnectorTx() => $_clearField(4);
}

class UpdatePreimageRequestRequest extends $pb.GeneratedMessage {
  factory UpdatePreimageRequestRequest({
    $core.String? preimageRequestId,
    $core.List<$core.int>? preimage,
    $core.List<$core.int>? identityPublicKey,
  }) {
    final result = create();
    if (preimageRequestId != null) result.preimageRequestId = preimageRequestId;
    if (preimage != null) result.preimage = preimage;
    if (identityPublicKey != null) result.identityPublicKey = identityPublicKey;
    return result;
  }

  UpdatePreimageRequestRequest._();

  factory UpdatePreimageRequestRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdatePreimageRequestRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdatePreimageRequestRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'preimageRequestId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'preimage', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'identityPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePreimageRequestRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePreimageRequestRequest copyWith(
          void Function(UpdatePreimageRequestRequest) updates) =>
      super.copyWith(
              (message) => updates(message as UpdatePreimageRequestRequest))
          as UpdatePreimageRequestRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePreimageRequestRequest create() =>
      UpdatePreimageRequestRequest._();
  @$core.override
  UpdatePreimageRequestRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdatePreimageRequestRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdatePreimageRequestRequest>(create);
  static UpdatePreimageRequestRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get preimageRequestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set preimageRequestId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPreimageRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPreimageRequestId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get preimage => $_getN(1);
  @$pb.TagNumber(2)
  set preimage($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPreimage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreimage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get identityPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set identityPublicKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIdentityPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearIdentityPublicKey() => $_clearField(3);
}

class InitiateSettleReceiverKeyTweakRequest extends $pb.GeneratedMessage {
  factory InitiateSettleReceiverKeyTweakRequest({
    $core.String? transferId,
    $core.Iterable<$core.MapEntry<$core.String, $2.SecretProof>>?
        keyTweakProofs,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        userPublicKeys,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        encryptedClaimKeyTweakPackage,
    $core.List<$core.int>? claimSignature,
    $core.List<$core.int>? receiverIdentityPublicKey,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (keyTweakProofs != null)
      result.keyTweakProofs.addEntries(keyTweakProofs);
    if (userPublicKeys != null)
      result.userPublicKeys.addEntries(userPublicKeys);
    if (encryptedClaimKeyTweakPackage != null)
      result.encryptedClaimKeyTweakPackage
          .addEntries(encryptedClaimKeyTweakPackage);
    if (claimSignature != null) result.claimSignature = claimSignature;
    if (receiverIdentityPublicKey != null)
      result.receiverIdentityPublicKey = receiverIdentityPublicKey;
    return result;
  }

  InitiateSettleReceiverKeyTweakRequest._();

  factory InitiateSettleReceiverKeyTweakRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitiateSettleReceiverKeyTweakRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitiateSettleReceiverKeyTweakRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..m<$core.String, $2.SecretProof>(
        2, _omitFieldNames ? '' : 'keyTweakProofs',
        entryClassName:
            'InitiateSettleReceiverKeyTweakRequest.KeyTweakProofsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $2.SecretProof.create,
        valueDefaultOrMaker: $2.SecretProof.getDefault,
        packageName: const $pb.PackageName('spark_internal'))
    ..m<$core.String, $core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'userPublicKeys',
        entryClassName:
            'InitiateSettleReceiverKeyTweakRequest.UserPublicKeysEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark_internal'))
    ..m<$core.String, $core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'encryptedClaimKeyTweakPackage',
        entryClassName:
            'InitiateSettleReceiverKeyTweakRequest.EncryptedClaimKeyTweakPackageEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark_internal'))
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'claimSignature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(6,
        _omitFieldNames ? '' : 'receiverIdentityPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateSettleReceiverKeyTweakRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateSettleReceiverKeyTweakRequest copyWith(
          void Function(InitiateSettleReceiverKeyTweakRequest) updates) =>
      super.copyWith((message) =>
              updates(message as InitiateSettleReceiverKeyTweakRequest))
          as InitiateSettleReceiverKeyTweakRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitiateSettleReceiverKeyTweakRequest create() =>
      InitiateSettleReceiverKeyTweakRequest._();
  @$core.override
  InitiateSettleReceiverKeyTweakRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InitiateSettleReceiverKeyTweakRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          InitiateSettleReceiverKeyTweakRequest>(create);
  static InitiateSettleReceiverKeyTweakRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $2.SecretProof> get keyTweakProofs => $_getMap(1);

  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.List<$core.int>> get userPublicKeys =>
      $_getMap(2);

  /// Full ECIES-encrypted key tweak package (SO identifier -> ciphertext).
  /// Each SO verifies the user signature against this full map, then decrypts its own portion.
  @$pb.TagNumber(4)
  $pb.PbMap<$core.String, $core.List<$core.int>>
      get encryptedClaimKeyTweakPackage => $_getMap(3);

  /// User signature over the encrypted claim key tweak package.
  @$pb.TagNumber(5)
  $core.List<$core.int> get claimSignature => $_getN(4);
  @$pb.TagNumber(5)
  set claimSignature($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasClaimSignature() => $_has(4);
  @$pb.TagNumber(5)
  void clearClaimSignature() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get receiverIdentityPublicKey => $_getN(5);
  @$pb.TagNumber(6)
  set receiverIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasReceiverIdentityPublicKey() => $_has(5);
  @$pb.TagNumber(6)
  void clearReceiverIdentityPublicKey() => $_clearField(6);
}

class SettleReceiverKeyTweakRequest extends $pb.GeneratedMessage {
  factory SettleReceiverKeyTweakRequest({
    $core.String? transferId,
    SettleKeyTweakAction? action,
    $core.List<$core.int>? receiverIdentityPublicKey,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (action != null) result.action = action;
    if (receiverIdentityPublicKey != null)
      result.receiverIdentityPublicKey = receiverIdentityPublicKey;
    return result;
  }

  SettleReceiverKeyTweakRequest._();

  factory SettleReceiverKeyTweakRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SettleReceiverKeyTweakRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SettleReceiverKeyTweakRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..aE<SettleKeyTweakAction>(3, _omitFieldNames ? '' : 'action',
        enumValues: SettleKeyTweakAction.values)
    ..a<$core.List<$core.int>>(4,
        _omitFieldNames ? '' : 'receiverIdentityPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SettleReceiverKeyTweakRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SettleReceiverKeyTweakRequest copyWith(
          void Function(SettleReceiverKeyTweakRequest) updates) =>
      super.copyWith(
              (message) => updates(message as SettleReceiverKeyTweakRequest))
          as SettleReceiverKeyTweakRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SettleReceiverKeyTweakRequest create() =>
      SettleReceiverKeyTweakRequest._();
  @$core.override
  SettleReceiverKeyTweakRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SettleReceiverKeyTweakRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SettleReceiverKeyTweakRequest>(create);
  static SettleReceiverKeyTweakRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  @$pb.TagNumber(3)
  SettleKeyTweakAction get action => $_getN(1);
  @$pb.TagNumber(3)
  set action(SettleKeyTweakAction value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasAction() => $_has(1);
  @$pb.TagNumber(3)
  void clearAction() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get receiverIdentityPublicKey => $_getN(2);
  @$pb.TagNumber(4)
  set receiverIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(2, value);
  @$pb.TagNumber(4)
  $core.bool hasReceiverIdentityPublicKey() => $_has(2);
  @$pb.TagNumber(4)
  void clearReceiverIdentityPublicKey() => $_clearField(4);
}

class SettleSenderKeyTweakRequest extends $pb.GeneratedMessage {
  factory SettleSenderKeyTweakRequest({
    $core.String? transferId,
    SettleKeyTweakAction? action,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (action != null) result.action = action;
    return result;
  }

  SettleSenderKeyTweakRequest._();

  factory SettleSenderKeyTweakRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SettleSenderKeyTweakRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SettleSenderKeyTweakRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..aE<SettleKeyTweakAction>(2, _omitFieldNames ? '' : 'action',
        enumValues: SettleKeyTweakAction.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SettleSenderKeyTweakRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SettleSenderKeyTweakRequest copyWith(
          void Function(SettleSenderKeyTweakRequest) updates) =>
      super.copyWith(
              (message) => updates(message as SettleSenderKeyTweakRequest))
          as SettleSenderKeyTweakRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SettleSenderKeyTweakRequest create() =>
      SettleSenderKeyTweakRequest._();
  @$core.override
  SettleSenderKeyTweakRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SettleSenderKeyTweakRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SettleSenderKeyTweakRequest>(create);
  static SettleSenderKeyTweakRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  @$pb.TagNumber(2)
  SettleKeyTweakAction get action => $_getN(1);
  @$pb.TagNumber(2)
  set action(SettleKeyTweakAction value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasAction() => $_has(1);
  @$pb.TagNumber(2)
  void clearAction() => $_clearField(2);
}

class ReserveInstantStaticDepositUtxoSwapRequest extends $pb.GeneratedMessage {
  factory ReserveInstantStaticDepositUtxoSwapRequest({
    $2.UTXO? onChainUtxo,
    $core.List<$core.int>? sspSignature,
    $core.List<$core.int>? userSignature,
    $2.StartTransferRequest? transfer,
    $core.String? destinationAddress,
    $fixnum.Int64? valueSats,
    $fixnum.Int64? creditAmountSats,
    $fixnum.Int64? secondaryCreditAmountSats,
    $4.Timestamp? expiryTime,
    $core.String? requestedSecondaryTransferId,
  }) {
    final result = create();
    if (onChainUtxo != null) result.onChainUtxo = onChainUtxo;
    if (sspSignature != null) result.sspSignature = sspSignature;
    if (userSignature != null) result.userSignature = userSignature;
    if (transfer != null) result.transfer = transfer;
    if (destinationAddress != null)
      result.destinationAddress = destinationAddress;
    if (valueSats != null) result.valueSats = valueSats;
    if (creditAmountSats != null) result.creditAmountSats = creditAmountSats;
    if (secondaryCreditAmountSats != null)
      result.secondaryCreditAmountSats = secondaryCreditAmountSats;
    if (expiryTime != null) result.expiryTime = expiryTime;
    if (requestedSecondaryTransferId != null)
      result.requestedSecondaryTransferId = requestedSecondaryTransferId;
    return result;
  }

  ReserveInstantStaticDepositUtxoSwapRequest._();

  factory ReserveInstantStaticDepositUtxoSwapRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReserveInstantStaticDepositUtxoSwapRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReserveInstantStaticDepositUtxoSwapRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOM<$2.UTXO>(1, _omitFieldNames ? '' : 'onChainUtxo',
        subBuilder: $2.UTXO.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'sspSignature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'userSignature', $pb.PbFieldType.OY)
    ..aOM<$2.StartTransferRequest>(4, _omitFieldNames ? '' : 'transfer',
        subBuilder: $2.StartTransferRequest.create)
    ..aOS(5, _omitFieldNames ? '' : 'destinationAddress')
    ..aInt64(6, _omitFieldNames ? '' : 'valueSats')
    ..aInt64(7, _omitFieldNames ? '' : 'creditAmountSats')
    ..aInt64(8, _omitFieldNames ? '' : 'secondaryCreditAmountSats')
    ..aOM<$4.Timestamp>(9, _omitFieldNames ? '' : 'expiryTime',
        subBuilder: $4.Timestamp.create)
    ..aOS(10, _omitFieldNames ? '' : 'requestedSecondaryTransferId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReserveInstantStaticDepositUtxoSwapRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReserveInstantStaticDepositUtxoSwapRequest copyWith(
          void Function(ReserveInstantStaticDepositUtxoSwapRequest) updates) =>
      super.copyWith((message) =>
              updates(message as ReserveInstantStaticDepositUtxoSwapRequest))
          as ReserveInstantStaticDepositUtxoSwapRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReserveInstantStaticDepositUtxoSwapRequest create() =>
      ReserveInstantStaticDepositUtxoSwapRequest._();
  @$core.override
  ReserveInstantStaticDepositUtxoSwapRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReserveInstantStaticDepositUtxoSwapRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ReserveInstantStaticDepositUtxoSwapRequest>(create);
  static ReserveInstantStaticDepositUtxoSwapRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $2.UTXO get onChainUtxo => $_getN(0);
  @$pb.TagNumber(1)
  set onChainUtxo($2.UTXO value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOnChainUtxo() => $_has(0);
  @$pb.TagNumber(1)
  void clearOnChainUtxo() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.UTXO ensureOnChainUtxo() => $_ensure(0);

  /// SSP signature of a message consenting to transfer a specific amount of funds
  /// in exchange for a specific UTXO.
  @$pb.TagNumber(2)
  $core.List<$core.int> get sspSignature => $_getN(1);
  @$pb.TagNumber(2)
  set sspSignature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSspSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSspSignature() => $_clearField(2);

  /// User signature of a message consenting to exchange a specific UTXO for a fund
  /// transfer from a specific SSP.
  @$pb.TagNumber(3)
  $core.List<$core.int> get userSignature => $_getN(2);
  @$pb.TagNumber(3)
  set userSignature($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserSignature() => $_clearField(3);

  /// Transfer package to send from SSP to User.
  @$pb.TagNumber(4)
  $2.StartTransferRequest get transfer => $_getN(3);
  @$pb.TagNumber(4)
  set transfer($2.StartTransferRequest value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasTransfer() => $_has(3);
  @$pb.TagNumber(4)
  void clearTransfer() => $_clearField(4);
  @$pb.TagNumber(4)
  $2.StartTransferRequest ensureTransfer() => $_ensure(3);

  /// Destination address for the static deposit UTXO.
  @$pb.TagNumber(5)
  $core.String get destinationAddress => $_getSZ(4);
  @$pb.TagNumber(5)
  set destinationAddress($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDestinationAddress() => $_has(4);
  @$pb.TagNumber(5)
  void clearDestinationAddress() => $_clearField(5);

  /// UTXO output value in satoshis.
  @$pb.TagNumber(6)
  $fixnum.Int64 get valueSats => $_getI64(5);
  @$pb.TagNumber(6)
  set valueSats($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasValueSats() => $_has(5);
  @$pb.TagNumber(6)
  void clearValueSats() => $_clearField(6);

  /// credit amount in satoshis.
  @$pb.TagNumber(7)
  $fixnum.Int64 get creditAmountSats => $_getI64(6);
  @$pb.TagNumber(7)
  set creditAmountSats($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCreditAmountSats() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreditAmountSats() => $_clearField(7);

  /// secondary credit amount in satoshis.
  @$pb.TagNumber(8)
  $fixnum.Int64 get secondaryCreditAmountSats => $_getI64(7);
  @$pb.TagNumber(8)
  set secondaryCreditAmountSats($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasSecondaryCreditAmountSats() => $_has(7);
  @$pb.TagNumber(8)
  void clearSecondaryCreditAmountSats() => $_clearField(8);

  /// expiry time of the swap
  @$pb.TagNumber(9)
  $4.Timestamp get expiryTime => $_getN(8);
  @$pb.TagNumber(9)
  set expiryTime($4.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasExpiryTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearExpiryTime() => $_clearField(9);
  @$pb.TagNumber(9)
  $4.Timestamp ensureExpiryTime() => $_ensure(8);

  /// Optional: requested secondary transfer ID for secondary credit amount.
  @$pb.TagNumber(10)
  $core.String get requestedSecondaryTransferId => $_getSZ(9);
  @$pb.TagNumber(10)
  set requestedSecondaryTransferId($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasRequestedSecondaryTransferId() => $_has(9);
  @$pb.TagNumber(10)
  void clearRequestedSecondaryTransferId() => $_clearField(10);
}

class CreateInstantStaticDepositUtxoSwapRequest extends $pb.GeneratedMessage {
  factory CreateInstantStaticDepositUtxoSwapRequest({
    ReserveInstantStaticDepositUtxoSwapRequest? request,
    $core.List<$core.int>? signature,
    $core.List<$core.int>? coordinatorPublicKey,
  }) {
    final result = create();
    if (request != null) result.request = request;
    if (signature != null) result.signature = signature;
    if (coordinatorPublicKey != null)
      result.coordinatorPublicKey = coordinatorPublicKey;
    return result;
  }

  CreateInstantStaticDepositUtxoSwapRequest._();

  factory CreateInstantStaticDepositUtxoSwapRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateInstantStaticDepositUtxoSwapRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateInstantStaticDepositUtxoSwapRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOM<ReserveInstantStaticDepositUtxoSwapRequest>(
        1, _omitFieldNames ? '' : 'request',
        subBuilder: ReserveInstantStaticDepositUtxoSwapRequest.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'coordinatorPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateInstantStaticDepositUtxoSwapRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateInstantStaticDepositUtxoSwapRequest copyWith(
          void Function(CreateInstantStaticDepositUtxoSwapRequest) updates) =>
      super.copyWith((message) =>
              updates(message as CreateInstantStaticDepositUtxoSwapRequest))
          as CreateInstantStaticDepositUtxoSwapRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateInstantStaticDepositUtxoSwapRequest create() =>
      CreateInstantStaticDepositUtxoSwapRequest._();
  @$core.override
  CreateInstantStaticDepositUtxoSwapRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateInstantStaticDepositUtxoSwapRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CreateInstantStaticDepositUtxoSwapRequest>(create);
  static CreateInstantStaticDepositUtxoSwapRequest? _defaultInstance;

  @$pb.TagNumber(1)
  ReserveInstantStaticDepositUtxoSwapRequest get request => $_getN(0);
  @$pb.TagNumber(1)
  set request(ReserveInstantStaticDepositUtxoSwapRequest value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequest() => $_clearField(1);
  @$pb.TagNumber(1)
  ReserveInstantStaticDepositUtxoSwapRequest ensureRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get coordinatorPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set coordinatorPublicKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCoordinatorPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearCoordinatorPublicKey() => $_clearField(3);
}

class CreateInstantStaticDepositUtxoSwapResponse extends $pb.GeneratedMessage {
  factory CreateInstantStaticDepositUtxoSwapResponse({
    $core.String? swapId,
  }) {
    final result = create();
    if (swapId != null) result.swapId = swapId;
    return result;
  }

  CreateInstantStaticDepositUtxoSwapResponse._();

  factory CreateInstantStaticDepositUtxoSwapResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateInstantStaticDepositUtxoSwapResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateInstantStaticDepositUtxoSwapResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'swapId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateInstantStaticDepositUtxoSwapResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateInstantStaticDepositUtxoSwapResponse copyWith(
          void Function(CreateInstantStaticDepositUtxoSwapResponse) updates) =>
      super.copyWith((message) =>
              updates(message as CreateInstantStaticDepositUtxoSwapResponse))
          as CreateInstantStaticDepositUtxoSwapResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateInstantStaticDepositUtxoSwapResponse create() =>
      CreateInstantStaticDepositUtxoSwapResponse._();
  @$core.override
  CreateInstantStaticDepositUtxoSwapResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateInstantStaticDepositUtxoSwapResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CreateInstantStaticDepositUtxoSwapResponse>(create);
  static CreateInstantStaticDepositUtxoSwapResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get swapId => $_getSZ(0);
  @$pb.TagNumber(1)
  set swapId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSwapId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSwapId() => $_clearField(1);
}

class SaveUtxoForInstantStaticDepositRequest extends $pb.GeneratedMessage {
  factory SaveUtxoForInstantStaticDepositRequest({
    $2.UTXO? onChainUtxo,
    $core.String? utxoSwapId,
    $core.List<$core.int>? signature,
    $core.List<$core.int>? coordinatorPublicKey,
    $core.String? transferId,
  }) {
    final result = create();
    if (onChainUtxo != null) result.onChainUtxo = onChainUtxo;
    if (utxoSwapId != null) result.utxoSwapId = utxoSwapId;
    if (signature != null) result.signature = signature;
    if (coordinatorPublicKey != null)
      result.coordinatorPublicKey = coordinatorPublicKey;
    if (transferId != null) result.transferId = transferId;
    return result;
  }

  SaveUtxoForInstantStaticDepositRequest._();

  factory SaveUtxoForInstantStaticDepositRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SaveUtxoForInstantStaticDepositRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SaveUtxoForInstantStaticDepositRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOM<$2.UTXO>(1, _omitFieldNames ? '' : 'onChainUtxo',
        subBuilder: $2.UTXO.create)
    ..aOS(2, _omitFieldNames ? '' : 'utxoSwapId')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'coordinatorPublicKey', $pb.PbFieldType.OY)
    ..aOS(5, _omitFieldNames ? '' : 'transferId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SaveUtxoForInstantStaticDepositRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SaveUtxoForInstantStaticDepositRequest copyWith(
          void Function(SaveUtxoForInstantStaticDepositRequest) updates) =>
      super.copyWith((message) =>
              updates(message as SaveUtxoForInstantStaticDepositRequest))
          as SaveUtxoForInstantStaticDepositRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SaveUtxoForInstantStaticDepositRequest create() =>
      SaveUtxoForInstantStaticDepositRequest._();
  @$core.override
  SaveUtxoForInstantStaticDepositRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SaveUtxoForInstantStaticDepositRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          SaveUtxoForInstantStaticDepositRequest>(create);
  static SaveUtxoForInstantStaticDepositRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $2.UTXO get onChainUtxo => $_getN(0);
  @$pb.TagNumber(1)
  set onChainUtxo($2.UTXO value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOnChainUtxo() => $_has(0);
  @$pb.TagNumber(1)
  void clearOnChainUtxo() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.UTXO ensureOnChainUtxo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get utxoSwapId => $_getSZ(1);
  @$pb.TagNumber(2)
  set utxoSwapId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUtxoSwapId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUtxoSwapId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get signature => $_getN(2);
  @$pb.TagNumber(3)
  set signature($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearSignature() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get coordinatorPublicKey => $_getN(3);
  @$pb.TagNumber(4)
  set coordinatorPublicKey($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCoordinatorPublicKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearCoordinatorPublicKey() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get transferId => $_getSZ(4);
  @$pb.TagNumber(5)
  set transferId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTransferId() => $_has(4);
  @$pb.TagNumber(5)
  void clearTransferId() => $_clearField(5);
}

class SaveUtxoForInstantStaticDepositResponse extends $pb.GeneratedMessage {
  factory SaveUtxoForInstantStaticDepositResponse() => create();

  SaveUtxoForInstantStaticDepositResponse._();

  factory SaveUtxoForInstantStaticDepositResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SaveUtxoForInstantStaticDepositResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SaveUtxoForInstantStaticDepositResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SaveUtxoForInstantStaticDepositResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SaveUtxoForInstantStaticDepositResponse copyWith(
          void Function(SaveUtxoForInstantStaticDepositResponse) updates) =>
      super.copyWith((message) =>
              updates(message as SaveUtxoForInstantStaticDepositResponse))
          as SaveUtxoForInstantStaticDepositResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SaveUtxoForInstantStaticDepositResponse create() =>
      SaveUtxoForInstantStaticDepositResponse._();
  @$core.override
  SaveUtxoForInstantStaticDepositResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SaveUtxoForInstantStaticDepositResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          SaveUtxoForInstantStaticDepositResponse>(create);
  static SaveUtxoForInstantStaticDepositResponse? _defaultInstance;
}

class InitiateStaticDepositUtxoSwapRequest extends $pb.GeneratedMessage {
  factory InitiateStaticDepositUtxoSwapRequest({
    $2.UTXO? onChainUtxo,
    $core.List<$core.int>? sspSignature,
    $core.List<$core.int>? userSignature,
    $2.StartTransferRequest? transfer,
    $2.SigningJob? spendTxSigningJob,
    $2.HashVariant? hashVariant,
    $core.int? confirmationThreshold,
  }) {
    final result = create();
    if (onChainUtxo != null) result.onChainUtxo = onChainUtxo;
    if (sspSignature != null) result.sspSignature = sspSignature;
    if (userSignature != null) result.userSignature = userSignature;
    if (transfer != null) result.transfer = transfer;
    if (spendTxSigningJob != null) result.spendTxSigningJob = spendTxSigningJob;
    if (hashVariant != null) result.hashVariant = hashVariant;
    if (confirmationThreshold != null)
      result.confirmationThreshold = confirmationThreshold;
    return result;
  }

  InitiateStaticDepositUtxoSwapRequest._();

  factory InitiateStaticDepositUtxoSwapRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitiateStaticDepositUtxoSwapRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitiateStaticDepositUtxoSwapRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOM<$2.UTXO>(1, _omitFieldNames ? '' : 'onChainUtxo',
        subBuilder: $2.UTXO.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'sspSignature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'userSignature', $pb.PbFieldType.OY)
    ..aOM<$2.StartTransferRequest>(4, _omitFieldNames ? '' : 'transfer',
        subBuilder: $2.StartTransferRequest.create)
    ..aOM<$2.SigningJob>(5, _omitFieldNames ? '' : 'spendTxSigningJob',
        subBuilder: $2.SigningJob.create)
    ..aE<$2.HashVariant>(6, _omitFieldNames ? '' : 'hashVariant',
        enumValues: $2.HashVariant.values)
    ..aI(7, _omitFieldNames ? '' : 'confirmationThreshold',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateStaticDepositUtxoSwapRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateStaticDepositUtxoSwapRequest copyWith(
          void Function(InitiateStaticDepositUtxoSwapRequest) updates) =>
      super.copyWith((message) =>
              updates(message as InitiateStaticDepositUtxoSwapRequest))
          as InitiateStaticDepositUtxoSwapRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitiateStaticDepositUtxoSwapRequest create() =>
      InitiateStaticDepositUtxoSwapRequest._();
  @$core.override
  InitiateStaticDepositUtxoSwapRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InitiateStaticDepositUtxoSwapRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          InitiateStaticDepositUtxoSwapRequest>(create);
  static InitiateStaticDepositUtxoSwapRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $2.UTXO get onChainUtxo => $_getN(0);
  @$pb.TagNumber(1)
  set onChainUtxo($2.UTXO value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOnChainUtxo() => $_has(0);
  @$pb.TagNumber(1)
  void clearOnChainUtxo() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.UTXO ensureOnChainUtxo() => $_ensure(0);

  /// SSP signature of a message consenting to transfer a specific amount of funds
  /// in exchange for a specific UTXO.
  @$pb.TagNumber(2)
  $core.List<$core.int> get sspSignature => $_getN(1);
  @$pb.TagNumber(2)
  set sspSignature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSspSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSspSignature() => $_clearField(2);

  /// User signature of a message consenting to exchange a specific UTXO for a fund
  /// transfer from a specific SSP.
  @$pb.TagNumber(3)
  $core.List<$core.int> get userSignature => $_getN(2);
  @$pb.TagNumber(3)
  set userSignature($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserSignature() => $_clearField(3);

  /// Transfer package to send from SSP to User.
  @$pb.TagNumber(4)
  $2.StartTransferRequest get transfer => $_getN(3);
  @$pb.TagNumber(4)
  set transfer($2.StartTransferRequest value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasTransfer() => $_has(3);
  @$pb.TagNumber(4)
  void clearTransfer() => $_clearField(4);
  @$pb.TagNumber(4)
  $2.StartTransferRequest ensureTransfer() => $_ensure(3);

  /// Transaction constructed by the SSP spending the UTXO to an address it owns.
  @$pb.TagNumber(5)
  $2.SigningJob get spendTxSigningJob => $_getN(4);
  @$pb.TagNumber(5)
  set spendTxSigningJob($2.SigningJob value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasSpendTxSigningJob() => $_has(4);
  @$pb.TagNumber(5)
  void clearSpendTxSigningJob() => $_clearField(5);
  @$pb.TagNumber(5)
  $2.SigningJob ensureSpendTxSigningJob() => $_ensure(4);

  /// Optional: which hash variant was used to create user_signature.
  @$pb.TagNumber(6)
  $2.HashVariant get hashVariant => $_getN(5);
  @$pb.TagNumber(6)
  set hashVariant($2.HashVariant value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasHashVariant() => $_has(5);
  @$pb.TagNumber(6)
  void clearHashVariant() => $_clearField(6);

  /// Optional: minimum confirmations required. Defaults to 3 if unset/0. Min 1.
  @$pb.TagNumber(7)
  $core.int get confirmationThreshold => $_getIZ(6);
  @$pb.TagNumber(7)
  set confirmationThreshold($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasConfirmationThreshold() => $_has(6);
  @$pb.TagNumber(7)
  void clearConfirmationThreshold() => $_clearField(7);
}

class CreateStaticDepositUtxoSwapRequest extends $pb.GeneratedMessage {
  factory CreateStaticDepositUtxoSwapRequest({
    InitiateStaticDepositUtxoSwapRequest? request,
    $core.List<$core.int>? signature,
    $core.List<$core.int>? coordinatorPublicKey,
  }) {
    final result = create();
    if (request != null) result.request = request;
    if (signature != null) result.signature = signature;
    if (coordinatorPublicKey != null)
      result.coordinatorPublicKey = coordinatorPublicKey;
    return result;
  }

  CreateStaticDepositUtxoSwapRequest._();

  factory CreateStaticDepositUtxoSwapRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateStaticDepositUtxoSwapRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateStaticDepositUtxoSwapRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOM<InitiateStaticDepositUtxoSwapRequest>(
        1, _omitFieldNames ? '' : 'request',
        subBuilder: InitiateStaticDepositUtxoSwapRequest.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'coordinatorPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStaticDepositUtxoSwapRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStaticDepositUtxoSwapRequest copyWith(
          void Function(CreateStaticDepositUtxoSwapRequest) updates) =>
      super.copyWith((message) =>
              updates(message as CreateStaticDepositUtxoSwapRequest))
          as CreateStaticDepositUtxoSwapRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateStaticDepositUtxoSwapRequest create() =>
      CreateStaticDepositUtxoSwapRequest._();
  @$core.override
  CreateStaticDepositUtxoSwapRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateStaticDepositUtxoSwapRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateStaticDepositUtxoSwapRequest>(
          create);
  static CreateStaticDepositUtxoSwapRequest? _defaultInstance;

  @$pb.TagNumber(1)
  InitiateStaticDepositUtxoSwapRequest get request => $_getN(0);
  @$pb.TagNumber(1)
  set request(InitiateStaticDepositUtxoSwapRequest value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequest() => $_clearField(1);
  @$pb.TagNumber(1)
  InitiateStaticDepositUtxoSwapRequest ensureRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get coordinatorPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set coordinatorPublicKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCoordinatorPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearCoordinatorPublicKey() => $_clearField(3);
}

class CreateStaticDepositUtxoSwapResponse extends $pb.GeneratedMessage {
  factory CreateStaticDepositUtxoSwapResponse({
    $core.String? utxoDepositAddress,
  }) {
    final result = create();
    if (utxoDepositAddress != null)
      result.utxoDepositAddress = utxoDepositAddress;
    return result;
  }

  CreateStaticDepositUtxoSwapResponse._();

  factory CreateStaticDepositUtxoSwapResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateStaticDepositUtxoSwapResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateStaticDepositUtxoSwapResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'UtxoDepositAddress',
        protoName: 'UtxoDepositAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStaticDepositUtxoSwapResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStaticDepositUtxoSwapResponse copyWith(
          void Function(CreateStaticDepositUtxoSwapResponse) updates) =>
      super.copyWith((message) =>
              updates(message as CreateStaticDepositUtxoSwapResponse))
          as CreateStaticDepositUtxoSwapResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateStaticDepositUtxoSwapResponse create() =>
      CreateStaticDepositUtxoSwapResponse._();
  @$core.override
  CreateStaticDepositUtxoSwapResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateStaticDepositUtxoSwapResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CreateStaticDepositUtxoSwapResponse>(create);
  static CreateStaticDepositUtxoSwapResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get utxoDepositAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set utxoDepositAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUtxoDepositAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearUtxoDepositAddress() => $_clearField(1);
}

class CreateStaticDepositUtxoRefundRequest extends $pb.GeneratedMessage {
  factory CreateStaticDepositUtxoRefundRequest({
    $2.InitiateStaticDepositUtxoRefundRequest? request,
    $core.List<$core.int>? signature,
    $core.List<$core.int>? coordinatorPublicKey,
  }) {
    final result = create();
    if (request != null) result.request = request;
    if (signature != null) result.signature = signature;
    if (coordinatorPublicKey != null)
      result.coordinatorPublicKey = coordinatorPublicKey;
    return result;
  }

  CreateStaticDepositUtxoRefundRequest._();

  factory CreateStaticDepositUtxoRefundRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateStaticDepositUtxoRefundRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateStaticDepositUtxoRefundRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOM<$2.InitiateStaticDepositUtxoRefundRequest>(
        1, _omitFieldNames ? '' : 'request',
        subBuilder: $2.InitiateStaticDepositUtxoRefundRequest.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'coordinatorPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStaticDepositUtxoRefundRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStaticDepositUtxoRefundRequest copyWith(
          void Function(CreateStaticDepositUtxoRefundRequest) updates) =>
      super.copyWith((message) =>
              updates(message as CreateStaticDepositUtxoRefundRequest))
          as CreateStaticDepositUtxoRefundRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateStaticDepositUtxoRefundRequest create() =>
      CreateStaticDepositUtxoRefundRequest._();
  @$core.override
  CreateStaticDepositUtxoRefundRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateStaticDepositUtxoRefundRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CreateStaticDepositUtxoRefundRequest>(create);
  static CreateStaticDepositUtxoRefundRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $2.InitiateStaticDepositUtxoRefundRequest get request => $_getN(0);
  @$pb.TagNumber(1)
  set request($2.InitiateStaticDepositUtxoRefundRequest value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequest() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.InitiateStaticDepositUtxoRefundRequest ensureRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get coordinatorPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set coordinatorPublicKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCoordinatorPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearCoordinatorPublicKey() => $_clearField(3);
}

class CreateStaticDepositUtxoRefundResponse extends $pb.GeneratedMessage {
  factory CreateStaticDepositUtxoRefundResponse({
    $core.String? utxoDepositAddress,
  }) {
    final result = create();
    if (utxoDepositAddress != null)
      result.utxoDepositAddress = utxoDepositAddress;
    return result;
  }

  CreateStaticDepositUtxoRefundResponse._();

  factory CreateStaticDepositUtxoRefundResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateStaticDepositUtxoRefundResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateStaticDepositUtxoRefundResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'UtxoDepositAddress',
        protoName: 'UtxoDepositAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStaticDepositUtxoRefundResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStaticDepositUtxoRefundResponse copyWith(
          void Function(CreateStaticDepositUtxoRefundResponse) updates) =>
      super.copyWith((message) =>
              updates(message as CreateStaticDepositUtxoRefundResponse))
          as CreateStaticDepositUtxoRefundResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateStaticDepositUtxoRefundResponse create() =>
      CreateStaticDepositUtxoRefundResponse._();
  @$core.override
  CreateStaticDepositUtxoRefundResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateStaticDepositUtxoRefundResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CreateStaticDepositUtxoRefundResponse>(create);
  static CreateStaticDepositUtxoRefundResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get utxoDepositAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set utxoDepositAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUtxoDepositAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearUtxoDepositAddress() => $_clearField(1);
}

class RollbackUtxoSwapRequest extends $pb.GeneratedMessage {
  factory RollbackUtxoSwapRequest({
    $2.UTXO? onChainUtxo,
    $core.List<$core.int>? signature,
    $core.List<$core.int>? coordinatorPublicKey,
  }) {
    final result = create();
    if (onChainUtxo != null) result.onChainUtxo = onChainUtxo;
    if (signature != null) result.signature = signature;
    if (coordinatorPublicKey != null)
      result.coordinatorPublicKey = coordinatorPublicKey;
    return result;
  }

  RollbackUtxoSwapRequest._();

  factory RollbackUtxoSwapRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RollbackUtxoSwapRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RollbackUtxoSwapRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOM<$2.UTXO>(1, _omitFieldNames ? '' : 'onChainUtxo',
        subBuilder: $2.UTXO.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'coordinatorPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RollbackUtxoSwapRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RollbackUtxoSwapRequest copyWith(
          void Function(RollbackUtxoSwapRequest) updates) =>
      super.copyWith((message) => updates(message as RollbackUtxoSwapRequest))
          as RollbackUtxoSwapRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RollbackUtxoSwapRequest create() => RollbackUtxoSwapRequest._();
  @$core.override
  RollbackUtxoSwapRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RollbackUtxoSwapRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RollbackUtxoSwapRequest>(create);
  static RollbackUtxoSwapRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $2.UTXO get onChainUtxo => $_getN(0);
  @$pb.TagNumber(1)
  set onChainUtxo($2.UTXO value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOnChainUtxo() => $_has(0);
  @$pb.TagNumber(1)
  void clearOnChainUtxo() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.UTXO ensureOnChainUtxo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get coordinatorPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set coordinatorPublicKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCoordinatorPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearCoordinatorPublicKey() => $_clearField(3);
}

class RollbackUtxoSwapResponse extends $pb.GeneratedMessage {
  factory RollbackUtxoSwapResponse() => create();

  RollbackUtxoSwapResponse._();

  factory RollbackUtxoSwapResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RollbackUtxoSwapResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RollbackUtxoSwapResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RollbackUtxoSwapResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RollbackUtxoSwapResponse copyWith(
          void Function(RollbackUtxoSwapResponse) updates) =>
      super.copyWith((message) => updates(message as RollbackUtxoSwapResponse))
          as RollbackUtxoSwapResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RollbackUtxoSwapResponse create() => RollbackUtxoSwapResponse._();
  @$core.override
  RollbackUtxoSwapResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RollbackUtxoSwapResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RollbackUtxoSwapResponse>(create);
  static RollbackUtxoSwapResponse? _defaultInstance;
}

class RollbackInstantUtxoSwapRequest extends $pb.GeneratedMessage {
  factory RollbackInstantUtxoSwapRequest({
    $2.UTXO? onChainUtxo,
    $core.List<$core.int>? signature,
    $core.List<$core.int>? coordinatorPublicKey,
    $core.Iterable<$2.UtxoSwapStatus>? rollbackFromStatuses,
    $2.UtxoSwapStatus? rollbackToStatus,
  }) {
    final result = create();
    if (onChainUtxo != null) result.onChainUtxo = onChainUtxo;
    if (signature != null) result.signature = signature;
    if (coordinatorPublicKey != null)
      result.coordinatorPublicKey = coordinatorPublicKey;
    if (rollbackFromStatuses != null)
      result.rollbackFromStatuses.addAll(rollbackFromStatuses);
    if (rollbackToStatus != null) result.rollbackToStatus = rollbackToStatus;
    return result;
  }

  RollbackInstantUtxoSwapRequest._();

  factory RollbackInstantUtxoSwapRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RollbackInstantUtxoSwapRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RollbackInstantUtxoSwapRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOM<$2.UTXO>(1, _omitFieldNames ? '' : 'onChainUtxo',
        subBuilder: $2.UTXO.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'coordinatorPublicKey', $pb.PbFieldType.OY)
    ..pc<$2.UtxoSwapStatus>(
        4, _omitFieldNames ? '' : 'rollbackFromStatuses', $pb.PbFieldType.KE,
        valueOf: $2.UtxoSwapStatus.valueOf,
        enumValues: $2.UtxoSwapStatus.values,
        defaultEnumValue: $2.UtxoSwapStatus.UTXO_SWAP_STATUS_UNSPECIFIED)
    ..aE<$2.UtxoSwapStatus>(5, _omitFieldNames ? '' : 'rollbackToStatus',
        enumValues: $2.UtxoSwapStatus.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RollbackInstantUtxoSwapRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RollbackInstantUtxoSwapRequest copyWith(
          void Function(RollbackInstantUtxoSwapRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RollbackInstantUtxoSwapRequest))
          as RollbackInstantUtxoSwapRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RollbackInstantUtxoSwapRequest create() =>
      RollbackInstantUtxoSwapRequest._();
  @$core.override
  RollbackInstantUtxoSwapRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RollbackInstantUtxoSwapRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RollbackInstantUtxoSwapRequest>(create);
  static RollbackInstantUtxoSwapRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $2.UTXO get onChainUtxo => $_getN(0);
  @$pb.TagNumber(1)
  set onChainUtxo($2.UTXO value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOnChainUtxo() => $_has(0);
  @$pb.TagNumber(1)
  void clearOnChainUtxo() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.UTXO ensureOnChainUtxo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get coordinatorPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set coordinatorPublicKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCoordinatorPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearCoordinatorPublicKey() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$2.UtxoSwapStatus> get rollbackFromStatuses => $_getList(3);

  @$pb.TagNumber(5)
  $2.UtxoSwapStatus get rollbackToStatus => $_getN(4);
  @$pb.TagNumber(5)
  set rollbackToStatus($2.UtxoSwapStatus value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasRollbackToStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearRollbackToStatus() => $_clearField(5);
}

class RollbackInstantUtxoSwapResponse extends $pb.GeneratedMessage {
  factory RollbackInstantUtxoSwapResponse() => create();

  RollbackInstantUtxoSwapResponse._();

  factory RollbackInstantUtxoSwapResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RollbackInstantUtxoSwapResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RollbackInstantUtxoSwapResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RollbackInstantUtxoSwapResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RollbackInstantUtxoSwapResponse copyWith(
          void Function(RollbackInstantUtxoSwapResponse) updates) =>
      super.copyWith(
              (message) => updates(message as RollbackInstantUtxoSwapResponse))
          as RollbackInstantUtxoSwapResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RollbackInstantUtxoSwapResponse create() =>
      RollbackInstantUtxoSwapResponse._();
  @$core.override
  RollbackInstantUtxoSwapResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RollbackInstantUtxoSwapResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RollbackInstantUtxoSwapResponse>(
          create);
  static RollbackInstantUtxoSwapResponse? _defaultInstance;
}

class UtxoSwapCompletedRequest extends $pb.GeneratedMessage {
  factory UtxoSwapCompletedRequest({
    $2.UTXO? onChainUtxo,
    $core.List<$core.int>? signature,
    $core.List<$core.int>? coordinatorPublicKey,
  }) {
    final result = create();
    if (onChainUtxo != null) result.onChainUtxo = onChainUtxo;
    if (signature != null) result.signature = signature;
    if (coordinatorPublicKey != null)
      result.coordinatorPublicKey = coordinatorPublicKey;
    return result;
  }

  UtxoSwapCompletedRequest._();

  factory UtxoSwapCompletedRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UtxoSwapCompletedRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UtxoSwapCompletedRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOM<$2.UTXO>(1, _omitFieldNames ? '' : 'onChainUtxo',
        subBuilder: $2.UTXO.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'coordinatorPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UtxoSwapCompletedRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UtxoSwapCompletedRequest copyWith(
          void Function(UtxoSwapCompletedRequest) updates) =>
      super.copyWith((message) => updates(message as UtxoSwapCompletedRequest))
          as UtxoSwapCompletedRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UtxoSwapCompletedRequest create() => UtxoSwapCompletedRequest._();
  @$core.override
  UtxoSwapCompletedRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UtxoSwapCompletedRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UtxoSwapCompletedRequest>(create);
  static UtxoSwapCompletedRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $2.UTXO get onChainUtxo => $_getN(0);
  @$pb.TagNumber(1)
  set onChainUtxo($2.UTXO value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOnChainUtxo() => $_has(0);
  @$pb.TagNumber(1)
  void clearOnChainUtxo() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.UTXO ensureOnChainUtxo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get coordinatorPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set coordinatorPublicKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCoordinatorPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearCoordinatorPublicKey() => $_clearField(3);
}

class UtxoSwapCompletedResponse extends $pb.GeneratedMessage {
  factory UtxoSwapCompletedResponse() => create();

  UtxoSwapCompletedResponse._();

  factory UtxoSwapCompletedResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UtxoSwapCompletedResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UtxoSwapCompletedResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UtxoSwapCompletedResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UtxoSwapCompletedResponse copyWith(
          void Function(UtxoSwapCompletedResponse) updates) =>
      super.copyWith((message) => updates(message as UtxoSwapCompletedResponse))
          as UtxoSwapCompletedResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UtxoSwapCompletedResponse create() => UtxoSwapCompletedResponse._();
  @$core.override
  UtxoSwapCompletedResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UtxoSwapCompletedResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UtxoSwapCompletedResponse>(create);
  static UtxoSwapCompletedResponse? _defaultInstance;
}

class LinkUtxoSwapTransferRequest extends $pb.GeneratedMessage {
  factory LinkUtxoSwapTransferRequest({
    $core.String? transferId,
    $core.List<$core.int>? signature,
    $core.List<$core.int>? coordinatorPublicKey,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (signature != null) result.signature = signature;
    if (coordinatorPublicKey != null)
      result.coordinatorPublicKey = coordinatorPublicKey;
    return result;
  }

  LinkUtxoSwapTransferRequest._();

  factory LinkUtxoSwapTransferRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LinkUtxoSwapTransferRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LinkUtxoSwapTransferRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'coordinatorPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LinkUtxoSwapTransferRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LinkUtxoSwapTransferRequest copyWith(
          void Function(LinkUtxoSwapTransferRequest) updates) =>
      super.copyWith(
              (message) => updates(message as LinkUtxoSwapTransferRequest))
          as LinkUtxoSwapTransferRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LinkUtxoSwapTransferRequest create() =>
      LinkUtxoSwapTransferRequest._();
  @$core.override
  LinkUtxoSwapTransferRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LinkUtxoSwapTransferRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LinkUtxoSwapTransferRequest>(create);
  static LinkUtxoSwapTransferRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get coordinatorPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set coordinatorPublicKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCoordinatorPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearCoordinatorPublicKey() => $_clearField(3);
}

class LinkUtxoSwapTransferResponse extends $pb.GeneratedMessage {
  factory LinkUtxoSwapTransferResponse() => create();

  LinkUtxoSwapTransferResponse._();

  factory LinkUtxoSwapTransferResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LinkUtxoSwapTransferResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LinkUtxoSwapTransferResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LinkUtxoSwapTransferResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LinkUtxoSwapTransferResponse copyWith(
          void Function(LinkUtxoSwapTransferResponse) updates) =>
      super.copyWith(
              (message) => updates(message as LinkUtxoSwapTransferResponse))
          as LinkUtxoSwapTransferResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LinkUtxoSwapTransferResponse create() =>
      LinkUtxoSwapTransferResponse._();
  @$core.override
  LinkUtxoSwapTransferResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LinkUtxoSwapTransferResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LinkUtxoSwapTransferResponse>(create);
  static LinkUtxoSwapTransferResponse? _defaultInstance;
}

class QueryLeafSigningPubkeysRequest extends $pb.GeneratedMessage {
  factory QueryLeafSigningPubkeysRequest({
    $core.Iterable<$core.String>? leafIds,
  }) {
    final result = create();
    if (leafIds != null) result.leafIds.addAll(leafIds);
    return result;
  }

  QueryLeafSigningPubkeysRequest._();

  factory QueryLeafSigningPubkeysRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryLeafSigningPubkeysRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryLeafSigningPubkeysRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'leafIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryLeafSigningPubkeysRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryLeafSigningPubkeysRequest copyWith(
          void Function(QueryLeafSigningPubkeysRequest) updates) =>
      super.copyWith(
              (message) => updates(message as QueryLeafSigningPubkeysRequest))
          as QueryLeafSigningPubkeysRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryLeafSigningPubkeysRequest create() =>
      QueryLeafSigningPubkeysRequest._();
  @$core.override
  QueryLeafSigningPubkeysRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryLeafSigningPubkeysRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryLeafSigningPubkeysRequest>(create);
  static QueryLeafSigningPubkeysRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get leafIds => $_getList(0);
}

class QueryLeafSigningPubkeysResponse extends $pb.GeneratedMessage {
  factory QueryLeafSigningPubkeysResponse({
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        signingPubkeys,
  }) {
    final result = create();
    if (signingPubkeys != null)
      result.signingPubkeys.addEntries(signingPubkeys);
    return result;
  }

  QueryLeafSigningPubkeysResponse._();

  factory QueryLeafSigningPubkeysResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryLeafSigningPubkeysResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryLeafSigningPubkeysResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..m<$core.String, $core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'signingPubkeys',
        entryClassName: 'QueryLeafSigningPubkeysResponse.SigningPubkeysEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark_internal'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryLeafSigningPubkeysResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryLeafSigningPubkeysResponse copyWith(
          void Function(QueryLeafSigningPubkeysResponse) updates) =>
      super.copyWith(
              (message) => updates(message as QueryLeafSigningPubkeysResponse))
          as QueryLeafSigningPubkeysResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryLeafSigningPubkeysResponse create() =>
      QueryLeafSigningPubkeysResponse._();
  @$core.override
  QueryLeafSigningPubkeysResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryLeafSigningPubkeysResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryLeafSigningPubkeysResponse>(
          create);
  static QueryLeafSigningPubkeysResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $core.List<$core.int>> get signingPubkeys =>
      $_getMap(0);
}

class ResolveLeafInvestigationRequest extends $pb.GeneratedMessage {
  factory ResolveLeafInvestigationRequest({
    $core.Iterable<$core.String>? lostLeafIds,
    $core.Iterable<$core.String>? availableLeafIds,
  }) {
    final result = create();
    if (lostLeafIds != null) result.lostLeafIds.addAll(lostLeafIds);
    if (availableLeafIds != null)
      result.availableLeafIds.addAll(availableLeafIds);
    return result;
  }

  ResolveLeafInvestigationRequest._();

  factory ResolveLeafInvestigationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResolveLeafInvestigationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolveLeafInvestigationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'lostLeafIds')
    ..pPS(2, _omitFieldNames ? '' : 'availableLeafIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResolveLeafInvestigationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResolveLeafInvestigationRequest copyWith(
          void Function(ResolveLeafInvestigationRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ResolveLeafInvestigationRequest))
          as ResolveLeafInvestigationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolveLeafInvestigationRequest create() =>
      ResolveLeafInvestigationRequest._();
  @$core.override
  ResolveLeafInvestigationRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ResolveLeafInvestigationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolveLeafInvestigationRequest>(
          create);
  static ResolveLeafInvestigationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get lostLeafIds => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get availableLeafIds => $_getList(1);
}

class ProvidePreimageRequest extends $pb.GeneratedMessage {
  factory ProvidePreimageRequest({
    $core.List<$core.int>? paymentHash,
    $core.List<$core.int>? preimage,
    $core.List<$core.int>? identityPublicKey,
    $core.Iterable<$core.MapEntry<$core.String, $2.SecretProof>>?
        keyTweakProofs,
  }) {
    final result = create();
    if (paymentHash != null) result.paymentHash = paymentHash;
    if (preimage != null) result.preimage = preimage;
    if (identityPublicKey != null) result.identityPublicKey = identityPublicKey;
    if (keyTweakProofs != null)
      result.keyTweakProofs.addEntries(keyTweakProofs);
    return result;
  }

  ProvidePreimageRequest._();

  factory ProvidePreimageRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProvidePreimageRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProvidePreimageRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'paymentHash', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'preimage', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'identityPublicKey', $pb.PbFieldType.OY)
    ..m<$core.String, $2.SecretProof>(
        4, _omitFieldNames ? '' : 'keyTweakProofs',
        entryClassName: 'ProvidePreimageRequest.KeyTweakProofsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $2.SecretProof.create,
        valueDefaultOrMaker: $2.SecretProof.getDefault,
        packageName: const $pb.PackageName('spark_internal'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProvidePreimageRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProvidePreimageRequest copyWith(
          void Function(ProvidePreimageRequest) updates) =>
      super.copyWith((message) => updates(message as ProvidePreimageRequest))
          as ProvidePreimageRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProvidePreimageRequest create() => ProvidePreimageRequest._();
  @$core.override
  ProvidePreimageRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProvidePreimageRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProvidePreimageRequest>(create);
  static ProvidePreimageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get paymentHash => $_getN(0);
  @$pb.TagNumber(1)
  set paymentHash($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPaymentHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaymentHash() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get preimage => $_getN(1);
  @$pb.TagNumber(2)
  set preimage($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPreimage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreimage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get identityPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set identityPublicKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIdentityPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearIdentityPublicKey() => $_clearField(3);

  /// The key tweak proofs for the leaves, to validate that each SO holds the correct key tweak.
  @$pb.TagNumber(4)
  $pb.PbMap<$core.String, $2.SecretProof> get keyTweakProofs => $_getMap(3);
}

class ReserveEntityDkgKeyRequest extends $pb.GeneratedMessage {
  factory ReserveEntityDkgKeyRequest({
    $core.String? keyshareId,
  }) {
    final result = create();
    if (keyshareId != null) result.keyshareId = keyshareId;
    return result;
  }

  ReserveEntityDkgKeyRequest._();

  factory ReserveEntityDkgKeyRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReserveEntityDkgKeyRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReserveEntityDkgKeyRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'keyshareId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReserveEntityDkgKeyRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReserveEntityDkgKeyRequest copyWith(
          void Function(ReserveEntityDkgKeyRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ReserveEntityDkgKeyRequest))
          as ReserveEntityDkgKeyRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReserveEntityDkgKeyRequest create() => ReserveEntityDkgKeyRequest._();
  @$core.override
  ReserveEntityDkgKeyRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReserveEntityDkgKeyRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReserveEntityDkgKeyRequest>(create);
  static ReserveEntityDkgKeyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get keyshareId => $_getSZ(0);
  @$pb.TagNumber(1)
  set keyshareId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasKeyshareId() => $_has(0);
  @$pb.TagNumber(1)
  void clearKeyshareId() => $_clearField(1);
}

class FixKeyshareRequest extends $pb.GeneratedMessage {
  factory FixKeyshareRequest({
    $core.String? badKeyshareId,
    $core.String? badOperatorId,
    $core.Iterable<$core.String>? goodOperatorIds,
  }) {
    final result = create();
    if (badKeyshareId != null) result.badKeyshareId = badKeyshareId;
    if (badOperatorId != null) result.badOperatorId = badOperatorId;
    if (goodOperatorIds != null) result.goodOperatorIds.addAll(goodOperatorIds);
    return result;
  }

  FixKeyshareRequest._();

  factory FixKeyshareRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FixKeyshareRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FixKeyshareRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'badKeyshareId')
    ..aOS(2, _omitFieldNames ? '' : 'badOperatorId')
    ..pPS(3, _omitFieldNames ? '' : 'goodOperatorIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FixKeyshareRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FixKeyshareRequest copyWith(void Function(FixKeyshareRequest) updates) =>
      super.copyWith((message) => updates(message as FixKeyshareRequest))
          as FixKeyshareRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FixKeyshareRequest create() => FixKeyshareRequest._();
  @$core.override
  FixKeyshareRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FixKeyshareRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FixKeyshareRequest>(create);
  static FixKeyshareRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get badKeyshareId => $_getSZ(0);
  @$pb.TagNumber(1)
  set badKeyshareId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBadKeyshareId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBadKeyshareId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get badOperatorId => $_getSZ(1);
  @$pb.TagNumber(2)
  set badOperatorId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBadOperatorId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBadOperatorId() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get goodOperatorIds => $_getList(2);
}

class FixKeyshareRound1Request extends $pb.GeneratedMessage {
  factory FixKeyshareRound1Request({
    $core.String? badKeyshareId,
    $core.String? badOperatorId,
    $core.Iterable<$core.String>? goodOperatorIds,
  }) {
    final result = create();
    if (badKeyshareId != null) result.badKeyshareId = badKeyshareId;
    if (badOperatorId != null) result.badOperatorId = badOperatorId;
    if (goodOperatorIds != null) result.goodOperatorIds.addAll(goodOperatorIds);
    return result;
  }

  FixKeyshareRound1Request._();

  factory FixKeyshareRound1Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FixKeyshareRound1Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FixKeyshareRound1Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'badKeyshareId')
    ..aOS(2, _omitFieldNames ? '' : 'badOperatorId')
    ..pPS(3, _omitFieldNames ? '' : 'goodOperatorIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FixKeyshareRound1Request clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FixKeyshareRound1Request copyWith(
          void Function(FixKeyshareRound1Request) updates) =>
      super.copyWith((message) => updates(message as FixKeyshareRound1Request))
          as FixKeyshareRound1Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FixKeyshareRound1Request create() => FixKeyshareRound1Request._();
  @$core.override
  FixKeyshareRound1Request createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FixKeyshareRound1Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FixKeyshareRound1Request>(create);
  static FixKeyshareRound1Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get badKeyshareId => $_getSZ(0);
  @$pb.TagNumber(1)
  set badKeyshareId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBadKeyshareId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBadKeyshareId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get badOperatorId => $_getSZ(1);
  @$pb.TagNumber(2)
  set badOperatorId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBadOperatorId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBadOperatorId() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get goodOperatorIds => $_getList(2);
}

class FixKeyshareRound1Response extends $pb.GeneratedMessage {
  factory FixKeyshareRound1Response({
    $core.Iterable<$core.List<$core.int>>? message,
  }) {
    final result = create();
    if (message != null) result.message.addAll(message);
    return result;
  }

  FixKeyshareRound1Response._();

  factory FixKeyshareRound1Response.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FixKeyshareRound1Response.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FixKeyshareRound1Response',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..p<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'message', $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FixKeyshareRound1Response clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FixKeyshareRound1Response copyWith(
          void Function(FixKeyshareRound1Response) updates) =>
      super.copyWith((message) => updates(message as FixKeyshareRound1Response))
          as FixKeyshareRound1Response;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FixKeyshareRound1Response create() => FixKeyshareRound1Response._();
  @$core.override
  FixKeyshareRound1Response createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FixKeyshareRound1Response getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FixKeyshareRound1Response>(create);
  static FixKeyshareRound1Response? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.List<$core.int>> get message => $_getList(0);
}

class FixKeyshareRound2Request extends $pb.GeneratedMessage {
  factory FixKeyshareRound2Request({
    $core.String? badKeyshareId,
    $core.String? badOperatorId,
    $core.Iterable<$core.String>? goodOperatorIds,
    $core.Iterable<$core.List<$core.int>>? message,
  }) {
    final result = create();
    if (badKeyshareId != null) result.badKeyshareId = badKeyshareId;
    if (badOperatorId != null) result.badOperatorId = badOperatorId;
    if (goodOperatorIds != null) result.goodOperatorIds.addAll(goodOperatorIds);
    if (message != null) result.message.addAll(message);
    return result;
  }

  FixKeyshareRound2Request._();

  factory FixKeyshareRound2Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FixKeyshareRound2Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FixKeyshareRound2Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'badKeyshareId')
    ..aOS(2, _omitFieldNames ? '' : 'badOperatorId')
    ..pPS(3, _omitFieldNames ? '' : 'goodOperatorIds')
    ..p<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'message', $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FixKeyshareRound2Request clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FixKeyshareRound2Request copyWith(
          void Function(FixKeyshareRound2Request) updates) =>
      super.copyWith((message) => updates(message as FixKeyshareRound2Request))
          as FixKeyshareRound2Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FixKeyshareRound2Request create() => FixKeyshareRound2Request._();
  @$core.override
  FixKeyshareRound2Request createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FixKeyshareRound2Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FixKeyshareRound2Request>(create);
  static FixKeyshareRound2Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get badKeyshareId => $_getSZ(0);
  @$pb.TagNumber(1)
  set badKeyshareId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBadKeyshareId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBadKeyshareId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get badOperatorId => $_getSZ(1);
  @$pb.TagNumber(2)
  set badOperatorId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBadOperatorId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBadOperatorId() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get goodOperatorIds => $_getList(2);

  @$pb.TagNumber(4)
  $pb.PbList<$core.List<$core.int>> get message => $_getList(3);
}

class FixKeyshareRound2Response extends $pb.GeneratedMessage {
  factory FixKeyshareRound2Response({
    $core.List<$core.int>? message,
  }) {
    final result = create();
    if (message != null) result.message = message;
    return result;
  }

  FixKeyshareRound2Response._();

  factory FixKeyshareRound2Response.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FixKeyshareRound2Response.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FixKeyshareRound2Response',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'message', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FixKeyshareRound2Response clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FixKeyshareRound2Response copyWith(
          void Function(FixKeyshareRound2Response) updates) =>
      super.copyWith((message) => updates(message as FixKeyshareRound2Response))
          as FixKeyshareRound2Response;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FixKeyshareRound2Response create() => FixKeyshareRound2Response._();
  @$core.override
  FixKeyshareRound2Response createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FixKeyshareRound2Response getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FixKeyshareRound2Response>(create);
  static FixKeyshareRound2Response? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get message => $_getN(0);
  @$pb.TagNumber(1)
  set message($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField(1);
}

class GetTransfersRequest extends $pb.GeneratedMessage {
  factory GetTransfersRequest({
    $core.Iterable<$core.String>? transferIds,
  }) {
    final result = create();
    if (transferIds != null) result.transferIds.addAll(transferIds);
    return result;
  }

  GetTransfersRequest._();

  factory GetTransfersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTransfersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTransfersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'transferIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTransfersRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTransfersRequest copyWith(void Function(GetTransfersRequest) updates) =>
      super.copyWith((message) => updates(message as GetTransfersRequest))
          as GetTransfersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTransfersRequest create() => GetTransfersRequest._();
  @$core.override
  GetTransfersRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetTransfersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetTransfersRequest>(create);
  static GetTransfersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get transferIds => $_getList(0);
}

class GetTransfersResponse extends $pb.GeneratedMessage {
  factory GetTransfersResponse({
    $core.Iterable<$2.Transfer>? transfers,
  }) {
    final result = create();
    if (transfers != null) result.transfers.addAll(transfers);
    return result;
  }

  GetTransfersResponse._();

  factory GetTransfersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTransfersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTransfersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..pPM<$2.Transfer>(1, _omitFieldNames ? '' : 'transfers',
        subBuilder: $2.Transfer.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTransfersResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTransfersResponse copyWith(void Function(GetTransfersResponse) updates) =>
      super.copyWith((message) => updates(message as GetTransfersResponse))
          as GetTransfersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTransfersResponse create() => GetTransfersResponse._();
  @$core.override
  GetTransfersResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetTransfersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetTransfersResponse>(create);
  static GetTransfersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$2.Transfer> get transfers => $_getList(0);
}

class GenerateStaticDepositAddressProofsRequest extends $pb.GeneratedMessage {
  factory GenerateStaticDepositAddressProofsRequest({
    $core.String? keyshareId,
    $core.String? address,
    $core.List<$core.int>? ownerIdentityPublicKey,
  }) {
    final result = create();
    if (keyshareId != null) result.keyshareId = keyshareId;
    if (address != null) result.address = address;
    if (ownerIdentityPublicKey != null)
      result.ownerIdentityPublicKey = ownerIdentityPublicKey;
    return result;
  }

  GenerateStaticDepositAddressProofsRequest._();

  factory GenerateStaticDepositAddressProofsRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateStaticDepositAddressProofsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateStaticDepositAddressProofsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'keyshareId')
    ..aOS(2, _omitFieldNames ? '' : 'address')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'ownerIdentityPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateStaticDepositAddressProofsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateStaticDepositAddressProofsRequest copyWith(
          void Function(GenerateStaticDepositAddressProofsRequest) updates) =>
      super.copyWith((message) =>
              updates(message as GenerateStaticDepositAddressProofsRequest))
          as GenerateStaticDepositAddressProofsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateStaticDepositAddressProofsRequest create() =>
      GenerateStaticDepositAddressProofsRequest._();
  @$core.override
  GenerateStaticDepositAddressProofsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateStaticDepositAddressProofsRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GenerateStaticDepositAddressProofsRequest>(create);
  static GenerateStaticDepositAddressProofsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get keyshareId => $_getSZ(0);
  @$pb.TagNumber(1)
  set keyshareId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasKeyshareId() => $_has(0);
  @$pb.TagNumber(1)
  void clearKeyshareId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get ownerIdentityPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set ownerIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOwnerIdentityPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearOwnerIdentityPublicKey() => $_clearField(3);
}

class GenerateStaticDepositAddressProofsResponse extends $pb.GeneratedMessage {
  factory GenerateStaticDepositAddressProofsResponse({
    $core.List<$core.int>? addressSignature,
  }) {
    final result = create();
    if (addressSignature != null) result.addressSignature = addressSignature;
    return result;
  }

  GenerateStaticDepositAddressProofsResponse._();

  factory GenerateStaticDepositAddressProofsResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateStaticDepositAddressProofsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateStaticDepositAddressProofsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'addressSignature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateStaticDepositAddressProofsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateStaticDepositAddressProofsResponse copyWith(
          void Function(GenerateStaticDepositAddressProofsResponse) updates) =>
      super.copyWith((message) =>
              updates(message as GenerateStaticDepositAddressProofsResponse))
          as GenerateStaticDepositAddressProofsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateStaticDepositAddressProofsResponse create() =>
      GenerateStaticDepositAddressProofsResponse._();
  @$core.override
  GenerateStaticDepositAddressProofsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateStaticDepositAddressProofsResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GenerateStaticDepositAddressProofsResponse>(create);
  static GenerateStaticDepositAddressProofsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get addressSignature => $_getN(0);
  @$pb.TagNumber(1)
  set addressSignature($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAddressSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddressSignature() => $_clearField(1);
}

class SyncNodeRequest extends $pb.GeneratedMessage {
  factory SyncNodeRequest({
    $core.Iterable<$core.String>? nodeIds,
    $core.String? operatorId,
  }) {
    final result = create();
    if (nodeIds != null) result.nodeIds.addAll(nodeIds);
    if (operatorId != null) result.operatorId = operatorId;
    return result;
  }

  SyncNodeRequest._();

  factory SyncNodeRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SyncNodeRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SyncNodeRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'nodeIds')
    ..aOS(2, _omitFieldNames ? '' : 'operatorId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncNodeRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncNodeRequest copyWith(void Function(SyncNodeRequest) updates) =>
      super.copyWith((message) => updates(message as SyncNodeRequest))
          as SyncNodeRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncNodeRequest create() => SyncNodeRequest._();
  @$core.override
  SyncNodeRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SyncNodeRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SyncNodeRequest>(create);
  static SyncNodeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get nodeIds => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get operatorId => $_getSZ(1);
  @$pb.TagNumber(2)
  set operatorId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOperatorId() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperatorId() => $_clearField(2);
}

/// DepositTreePrepareRequest is the 2PC prepare payload for consensus deposit tree finalization.
/// Each SO independently validates the deposit address, constructs signing jobs,
/// and produces FROST signature shares.
class DepositTreePrepareRequest extends $pb.GeneratedMessage {
  factory DepositTreePrepareRequest({
    $2.FinalizeDepositTreeCreationRequest? originalRequest,
  }) {
    final result = create();
    if (originalRequest != null) result.originalRequest = originalRequest;
    return result;
  }

  DepositTreePrepareRequest._();

  factory DepositTreePrepareRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DepositTreePrepareRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DepositTreePrepareRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOM<$2.FinalizeDepositTreeCreationRequest>(
        1, _omitFieldNames ? '' : 'originalRequest',
        subBuilder: $2.FinalizeDepositTreeCreationRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DepositTreePrepareRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DepositTreePrepareRequest copyWith(
          void Function(DepositTreePrepareRequest) updates) =>
      super.copyWith((message) => updates(message as DepositTreePrepareRequest))
          as DepositTreePrepareRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DepositTreePrepareRequest create() => DepositTreePrepareRequest._();
  @$core.override
  DepositTreePrepareRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DepositTreePrepareRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DepositTreePrepareRequest>(create);
  static DepositTreePrepareRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $2.FinalizeDepositTreeCreationRequest get originalRequest => $_getN(0);
  @$pb.TagNumber(1)
  set originalRequest($2.FinalizeDepositTreeCreationRequest value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOriginalRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearOriginalRequest() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.FinalizeDepositTreeCreationRequest ensureOriginalRequest() => $_ensure(0);
}

/// StorePreimageSharePrepareRequest is the 2PC prepare payload for consensus
/// preimage share storage. Each SO validates, decrypts, and writes its share
/// during Prepare. Commit and Rollback are no-ops.
class StorePreimageSharePrepareRequest extends $pb.GeneratedMessage {
  factory StorePreimageSharePrepareRequest({
    $2.StorePreimageShareV2Request? originalRequest,
  }) {
    final result = create();
    if (originalRequest != null) result.originalRequest = originalRequest;
    return result;
  }

  StorePreimageSharePrepareRequest._();

  factory StorePreimageSharePrepareRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StorePreimageSharePrepareRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StorePreimageSharePrepareRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOM<$2.StorePreimageShareV2Request>(
        1, _omitFieldNames ? '' : 'originalRequest',
        subBuilder: $2.StorePreimageShareV2Request.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StorePreimageSharePrepareRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StorePreimageSharePrepareRequest copyWith(
          void Function(StorePreimageSharePrepareRequest) updates) =>
      super.copyWith(
              (message) => updates(message as StorePreimageSharePrepareRequest))
          as StorePreimageSharePrepareRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StorePreimageSharePrepareRequest create() =>
      StorePreimageSharePrepareRequest._();
  @$core.override
  StorePreimageSharePrepareRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StorePreimageSharePrepareRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StorePreimageSharePrepareRequest>(
          create);
  static StorePreimageSharePrepareRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $2.StorePreimageShareV2Request get originalRequest => $_getN(0);
  @$pb.TagNumber(1)
  set originalRequest($2.StorePreimageShareV2Request value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOriginalRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearOriginalRequest() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.StorePreimageShareV2Request ensureOriginalRequest() => $_ensure(0);
}

class ConsensusPrepareRequest extends $pb.GeneratedMessage {
  factory ConsensusPrepareRequest({
    $core.int? opType,
    $5.Any? operation,
  }) {
    final result = create();
    if (opType != null) result.opType = opType;
    if (operation != null) result.operation = operation;
    return result;
  }

  ConsensusPrepareRequest._();

  factory ConsensusPrepareRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConsensusPrepareRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConsensusPrepareRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'opType')
    ..aOM<$5.Any>(2, _omitFieldNames ? '' : 'operation',
        subBuilder: $5.Any.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConsensusPrepareRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConsensusPrepareRequest copyWith(
          void Function(ConsensusPrepareRequest) updates) =>
      super.copyWith((message) => updates(message as ConsensusPrepareRequest))
          as ConsensusPrepareRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConsensusPrepareRequest create() => ConsensusPrepareRequest._();
  @$core.override
  ConsensusPrepareRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConsensusPrepareRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConsensusPrepareRequest>(create);
  static ConsensusPrepareRequest? _defaultInstance;

  /// Corresponds to gossip.ConsensusOperationType. Defined as int32 to avoid
  /// a circular proto import (gossip.proto already imports spark_internal.proto).
  @$pb.TagNumber(1)
  $core.int get opType => $_getIZ(0);
  @$pb.TagNumber(1)
  set opType($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOpType() => $_has(0);
  @$pb.TagNumber(1)
  void clearOpType() => $_clearField(1);

  /// Domain-specific proto message passed to FlowHandler.Prepare.
  @$pb.TagNumber(2)
  $5.Any get operation => $_getN(1);
  @$pb.TagNumber(2)
  set operation($5.Any value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOperation() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperation() => $_clearField(2);
  @$pb.TagNumber(2)
  $5.Any ensureOperation() => $_ensure(1);
}

class ConsensusPrepareResponse extends $pb.GeneratedMessage {
  factory ConsensusPrepareResponse({
    $5.Any? result,
  }) {
    final result$ = create();
    if (result != null) result$.result = result;
    return result$;
  }

  ConsensusPrepareResponse._();

  factory ConsensusPrepareResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConsensusPrepareResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConsensusPrepareResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_internal'),
      createEmptyInstance: create)
    ..aOM<$5.Any>(1, _omitFieldNames ? '' : 'result', subBuilder: $5.Any.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConsensusPrepareResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConsensusPrepareResponse copyWith(
          void Function(ConsensusPrepareResponse) updates) =>
      super.copyWith((message) => updates(message as ConsensusPrepareResponse))
          as ConsensusPrepareResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConsensusPrepareResponse create() => ConsensusPrepareResponse._();
  @$core.override
  ConsensusPrepareResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConsensusPrepareResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConsensusPrepareResponse>(create);
  static ConsensusPrepareResponse? _defaultInstance;

  /// Domain-specific result from FlowHandler.Prepare (e.g., signature shares).
  @$pb.TagNumber(1)
  $5.Any get result => $_getN(0);
  @$pb.TagNumber(1)
  set result($5.Any value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => $_clearField(1);
  @$pb.TagNumber(1)
  $5.Any ensureResult() => $_ensure(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
