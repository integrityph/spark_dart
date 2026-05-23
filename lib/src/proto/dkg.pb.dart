// This is a generated file - do not edit.
//
// Generated from dkg.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'common.pb.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

///
///  Initiate Distributed Key Generation Request
class InitiateDkgRequest extends $pb.GeneratedMessage {
  factory InitiateDkgRequest({
    $core.String? requestId,
    $fixnum.Int64? keyCount,
    $fixnum.Int64? minSigners,
    $fixnum.Int64? maxSigners,
    $fixnum.Int64? coordinatorIndex,
  }) {
    final result = create();
    if (requestId != null) result.requestId = requestId;
    if (keyCount != null) result.keyCount = keyCount;
    if (minSigners != null) result.minSigners = minSigners;
    if (maxSigners != null) result.maxSigners = maxSigners;
    if (coordinatorIndex != null) result.coordinatorIndex = coordinatorIndex;
    return result;
  }

  InitiateDkgRequest._();

  factory InitiateDkgRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitiateDkgRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitiateDkgRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'dkg'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'keyCount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'minSigners', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'maxSigners', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'coordinatorIndex', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateDkgRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateDkgRequest copyWith(void Function(InitiateDkgRequest) updates) =>
      super.copyWith((message) => updates(message as InitiateDkgRequest))
          as InitiateDkgRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitiateDkgRequest create() => InitiateDkgRequest._();
  @$core.override
  InitiateDkgRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InitiateDkgRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InitiateDkgRequest>(create);
  static InitiateDkgRequest? _defaultInstance;

  /// An uuid to identify the request.
  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);

  /// The number of keys to generate.
  @$pb.TagNumber(2)
  $fixnum.Int64 get keyCount => $_getI64(1);
  @$pb.TagNumber(2)
  set keyCount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasKeyCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearKeyCount() => $_clearField(2);

  /// The minimum number of signers, this is the threshold for the threshold signature scheme.
  @$pb.TagNumber(3)
  $fixnum.Int64 get minSigners => $_getI64(2);
  @$pb.TagNumber(3)
  set minSigners($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMinSigners() => $_has(2);
  @$pb.TagNumber(3)
  void clearMinSigners() => $_clearField(3);

  /// The maximum number of signers, this is the size of the threshold signature scheme.
  @$pb.TagNumber(4)
  $fixnum.Int64 get maxSigners => $_getI64(3);
  @$pb.TagNumber(4)
  set maxSigners($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMaxSigners() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxSigners() => $_clearField(4);

  /// The coordinator index.
  @$pb.TagNumber(5)
  $fixnum.Int64 get coordinatorIndex => $_getI64(4);
  @$pb.TagNumber(5)
  set coordinatorIndex($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCoordinatorIndex() => $_has(4);
  @$pb.TagNumber(5)
  void clearCoordinatorIndex() => $_clearField(5);
}

///
///  Initiate Distributed Key Generation Response
class InitiateDkgResponse extends $pb.GeneratedMessage {
  factory InitiateDkgResponse({
    $core.String? identifier,
    $core.Iterable<$core.List<$core.int>>? round1Package,
  }) {
    final result = create();
    if (identifier != null) result.identifier = identifier;
    if (round1Package != null) result.round1Package.addAll(round1Package);
    return result;
  }

  InitiateDkgResponse._();

  factory InitiateDkgResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitiateDkgResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitiateDkgResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'dkg'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'identifier')
    ..p<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'round1Package', $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateDkgResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateDkgResponse copyWith(void Function(InitiateDkgResponse) updates) =>
      super.copyWith((message) => updates(message as InitiateDkgResponse))
          as InitiateDkgResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitiateDkgResponse create() => InitiateDkgResponse._();
  @$core.override
  InitiateDkgResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InitiateDkgResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InitiateDkgResponse>(create);
  static InitiateDkgResponse? _defaultInstance;

  /// The identifier of the participant.
  @$pb.TagNumber(1)
  $core.String get identifier => $_getSZ(0);
  @$pb.TagNumber(1)
  set identifier($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentifier() => $_clearField(1);

  /// The round1 package for the participant.
  @$pb.TagNumber(2)
  $pb.PbList<$core.List<$core.int>> get round1Package => $_getList(1);
}

class Round1PackagesRequest extends $pb.GeneratedMessage {
  factory Round1PackagesRequest({
    $core.String? requestId,
    $core.Iterable<$2.PackageMap>? round1Packages,
  }) {
    final result = create();
    if (requestId != null) result.requestId = requestId;
    if (round1Packages != null) result.round1Packages.addAll(round1Packages);
    return result;
  }

  Round1PackagesRequest._();

  factory Round1PackagesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Round1PackagesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Round1PackagesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'dkg'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..pPM<$2.PackageMap>(2, _omitFieldNames ? '' : 'round1Packages',
        subBuilder: $2.PackageMap.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Round1PackagesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Round1PackagesRequest copyWith(
          void Function(Round1PackagesRequest) updates) =>
      super.copyWith((message) => updates(message as Round1PackagesRequest))
          as Round1PackagesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Round1PackagesRequest create() => Round1PackagesRequest._();
  @$core.override
  Round1PackagesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Round1PackagesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Round1PackagesRequest>(create);
  static Round1PackagesRequest? _defaultInstance;

  /// An uuid to identify the request.
  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);

  /// The round1 packages from the participants.
  @$pb.TagNumber(2)
  $pb.PbList<$2.PackageMap> get round1Packages => $_getList(1);
}

class Round1PackagesResponse extends $pb.GeneratedMessage {
  factory Round1PackagesResponse({
    $core.String? identifier,
    $core.List<$core.int>? round1Signature,
  }) {
    final result = create();
    if (identifier != null) result.identifier = identifier;
    if (round1Signature != null) result.round1Signature = round1Signature;
    return result;
  }

  Round1PackagesResponse._();

  factory Round1PackagesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Round1PackagesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Round1PackagesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'dkg'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'identifier')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'round1Signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Round1PackagesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Round1PackagesResponse copyWith(
          void Function(Round1PackagesResponse) updates) =>
      super.copyWith((message) => updates(message as Round1PackagesResponse))
          as Round1PackagesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Round1PackagesResponse create() => Round1PackagesResponse._();
  @$core.override
  Round1PackagesResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Round1PackagesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Round1PackagesResponse>(create);
  static Round1PackagesResponse? _defaultInstance;

  /// The identifier of the participant.
  @$pb.TagNumber(1)
  $core.String get identifier => $_getSZ(0);
  @$pb.TagNumber(1)
  set identifier($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentifier() => $_clearField(1);

  /// The round1 package signature from the participant.
  @$pb.TagNumber(2)
  $core.List<$core.int> get round1Signature => $_getN(1);
  @$pb.TagNumber(2)
  set round1Signature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRound1Signature() => $_has(1);
  @$pb.TagNumber(2)
  void clearRound1Signature() => $_clearField(2);
}

class Round1SignatureRequest extends $pb.GeneratedMessage {
  factory Round1SignatureRequest({
    $core.String? requestId,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        round1Signatures,
  }) {
    final result = create();
    if (requestId != null) result.requestId = requestId;
    if (round1Signatures != null)
      result.round1Signatures.addEntries(round1Signatures);
    return result;
  }

  Round1SignatureRequest._();

  factory Round1SignatureRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Round1SignatureRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Round1SignatureRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'dkg'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..m<$core.String, $core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'round1Signatures',
        entryClassName: 'Round1SignatureRequest.Round1SignaturesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('dkg'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Round1SignatureRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Round1SignatureRequest copyWith(
          void Function(Round1SignatureRequest) updates) =>
      super.copyWith((message) => updates(message as Round1SignatureRequest))
          as Round1SignatureRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Round1SignatureRequest create() => Round1SignatureRequest._();
  @$core.override
  Round1SignatureRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Round1SignatureRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Round1SignatureRequest>(create);
  static Round1SignatureRequest? _defaultInstance;

  /// An uuid to identify the request.
  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);

  /// The round1 package signatures from the participants.
  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $core.List<$core.int>> get round1Signatures =>
      $_getMap(1);
}

class Round1SignatureResponse extends $pb.GeneratedMessage {
  factory Round1SignatureResponse({
    $core.String? identifier,
    $core.Iterable<$core.String>? validationFailures,
  }) {
    final result = create();
    if (identifier != null) result.identifier = identifier;
    if (validationFailures != null)
      result.validationFailures.addAll(validationFailures);
    return result;
  }

  Round1SignatureResponse._();

  factory Round1SignatureResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Round1SignatureResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Round1SignatureResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'dkg'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'identifier')
    ..pPS(2, _omitFieldNames ? '' : 'validationFailures')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Round1SignatureResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Round1SignatureResponse copyWith(
          void Function(Round1SignatureResponse) updates) =>
      super.copyWith((message) => updates(message as Round1SignatureResponse))
          as Round1SignatureResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Round1SignatureResponse create() => Round1SignatureResponse._();
  @$core.override
  Round1SignatureResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Round1SignatureResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Round1SignatureResponse>(create);
  static Round1SignatureResponse? _defaultInstance;

  /// The identifier of the participant.
  @$pb.TagNumber(1)
  $core.String get identifier => $_getSZ(0);
  @$pb.TagNumber(1)
  set identifier($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentifier() => $_clearField(1);

  /// The identifiers of the participants that failed the validation of the round1 package
  /// signatures.
  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get validationFailures => $_getList(1);
}

class Round2PackagesRequest extends $pb.GeneratedMessage {
  factory Round2PackagesRequest({
    $core.String? requestId,
    $core.String? identifier,
    $core.Iterable<$core.List<$core.int>>? round2Packages,
    $core.List<$core.int>? round2Signature,
  }) {
    final result = create();
    if (requestId != null) result.requestId = requestId;
    if (identifier != null) result.identifier = identifier;
    if (round2Packages != null) result.round2Packages.addAll(round2Packages);
    if (round2Signature != null) result.round2Signature = round2Signature;
    return result;
  }

  Round2PackagesRequest._();

  factory Round2PackagesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Round2PackagesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Round2PackagesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'dkg'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..aOS(2, _omitFieldNames ? '' : 'identifier')
    ..p<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'round2Packages', $pb.PbFieldType.PY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'round2Signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Round2PackagesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Round2PackagesRequest copyWith(
          void Function(Round2PackagesRequest) updates) =>
      super.copyWith((message) => updates(message as Round2PackagesRequest))
          as Round2PackagesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Round2PackagesRequest create() => Round2PackagesRequest._();
  @$core.override
  Round2PackagesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Round2PackagesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Round2PackagesRequest>(create);
  static Round2PackagesRequest? _defaultInstance;

  /// An uuid to identify the request.
  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);

  /// The identifier of the participant.
  @$pb.TagNumber(2)
  $core.String get identifier => $_getSZ(1);
  @$pb.TagNumber(2)
  set identifier($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdentifier() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentifier() => $_clearField(2);

  /// The round2 packages from the participant.
  @$pb.TagNumber(3)
  $pb.PbList<$core.List<$core.int>> get round2Packages => $_getList(2);

  /// The signature on the hash of the round2 packages by the participant.
  @$pb.TagNumber(4)
  $core.List<$core.int> get round2Signature => $_getN(3);
  @$pb.TagNumber(4)
  set round2Signature($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRound2Signature() => $_has(3);
  @$pb.TagNumber(4)
  void clearRound2Signature() => $_clearField(4);
}

/// Acknowledge the round2 packages from the participant.
class Round2PackagesResponse extends $pb.GeneratedMessage {
  factory Round2PackagesResponse() => create();

  Round2PackagesResponse._();

  factory Round2PackagesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Round2PackagesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Round2PackagesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'dkg'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Round2PackagesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Round2PackagesResponse copyWith(
          void Function(Round2PackagesResponse) updates) =>
      super.copyWith((message) => updates(message as Round2PackagesResponse))
          as Round2PackagesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Round2PackagesResponse create() => Round2PackagesResponse._();
  @$core.override
  Round2PackagesResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Round2PackagesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Round2PackagesResponse>(create);
  static Round2PackagesResponse? _defaultInstance;
}

/// RoundConfirmationRequest is sent by the coordinator to each participant to
/// confirm the presence and availability of the generated keyshares.
class RoundConfirmationRequest extends $pb.GeneratedMessage {
  factory RoundConfirmationRequest({
    $core.Iterable<$core.String>? keyIds,
  }) {
    final result = create();
    if (keyIds != null) result.keyIds.addAll(keyIds);
    return result;
  }

  RoundConfirmationRequest._();

  factory RoundConfirmationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoundConfirmationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoundConfirmationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'dkg'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'keyIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoundConfirmationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoundConfirmationRequest copyWith(
          void Function(RoundConfirmationRequest) updates) =>
      super.copyWith((message) => updates(message as RoundConfirmationRequest))
          as RoundConfirmationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoundConfirmationRequest create() => RoundConfirmationRequest._();
  @$core.override
  RoundConfirmationRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoundConfirmationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoundConfirmationRequest>(create);
  static RoundConfirmationRequest? _defaultInstance;

  /// The list of keyshare IDs (UUID strings) to check.
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get keyIds => $_getList(0);
}

/// RoundConfirmationResponse contains which keys are available.
class RoundConfirmationResponse extends $pb.GeneratedMessage {
  factory RoundConfirmationResponse({
    $core.Iterable<$core.String>? availableKeyIds,
    $core.Iterable<$core.String>? unavailableKeyIds,
  }) {
    final result = create();
    if (availableKeyIds != null) result.availableKeyIds.addAll(availableKeyIds);
    if (unavailableKeyIds != null)
      result.unavailableKeyIds.addAll(unavailableKeyIds);
    return result;
  }

  RoundConfirmationResponse._();

  factory RoundConfirmationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoundConfirmationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoundConfirmationResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'dkg'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'availableKeyIds')
    ..pPS(2, _omitFieldNames ? '' : 'unavailableKeyIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoundConfirmationResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoundConfirmationResponse copyWith(
          void Function(RoundConfirmationResponse) updates) =>
      super.copyWith((message) => updates(message as RoundConfirmationResponse))
          as RoundConfirmationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoundConfirmationResponse create() => RoundConfirmationResponse._();
  @$core.override
  RoundConfirmationResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoundConfirmationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoundConfirmationResponse>(create);
  static RoundConfirmationResponse? _defaultInstance;

  /// The list of key IDs that are AVAILABLE on this participant.
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get availableKeyIds => $_getList(0);

  /// The list of key IDs that are NOT available (missing or PENDING).
  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get unavailableKeyIds => $_getList(1);
}

class StartDkgRequest extends $pb.GeneratedMessage {
  factory StartDkgRequest({
    $core.int? count,
  }) {
    final result = create();
    if (count != null) result.count = count;
    return result;
  }

  StartDkgRequest._();

  factory StartDkgRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartDkgRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartDkgRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'dkg'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartDkgRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartDkgRequest copyWith(void Function(StartDkgRequest) updates) =>
      super.copyWith((message) => updates(message as StartDkgRequest))
          as StartDkgRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartDkgRequest create() => StartDkgRequest._();
  @$core.override
  StartDkgRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartDkgRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartDkgRequest>(create);
  static StartDkgRequest? _defaultInstance;

  /// The number of participants in the signing group.
  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
