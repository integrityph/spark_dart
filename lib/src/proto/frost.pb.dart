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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'common.pb.dart' as $2;
import 'frost.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'frost.pbenum.dart';

class EchoRequest extends $pb.GeneratedMessage {
  factory EchoRequest({
    $core.String? message,
  }) {
    final result = create();
    if (message != null) result.message = message;
    return result;
  }

  EchoRequest._();

  factory EchoRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EchoRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EchoRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EchoRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EchoRequest copyWith(void Function(EchoRequest) updates) =>
      super.copyWith((message) => updates(message as EchoRequest))
          as EchoRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EchoRequest create() => EchoRequest._();
  @$core.override
  EchoRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EchoRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EchoRequest>(create);
  static EchoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField(1);
}

class EchoResponse extends $pb.GeneratedMessage {
  factory EchoResponse({
    $core.String? message,
  }) {
    final result = create();
    if (message != null) result.message = message;
    return result;
  }

  EchoResponse._();

  factory EchoResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EchoResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EchoResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EchoResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EchoResponse copyWith(void Function(EchoResponse) updates) =>
      super.copyWith((message) => updates(message as EchoResponse))
          as EchoResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EchoResponse create() => EchoResponse._();
  @$core.override
  EchoResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EchoResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EchoResponse>(create);
  static EchoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField(1);
}

///
///  Distributed Key Generation Round 1 Request
///
///  This request is sent to the server to start the Distributed Key Generation
///  protocol. This will be a batch request, so the server will generate the
///  keys for all participants in the batch.
class DkgRound1Request extends $pb.GeneratedMessage {
  factory DkgRound1Request({
    $core.String? requestId,
    $core.String? identifier,
    $fixnum.Int64? maxSigners,
    $fixnum.Int64? minSigners,
    $fixnum.Int64? keyCount,
  }) {
    final result = create();
    if (requestId != null) result.requestId = requestId;
    if (identifier != null) result.identifier = identifier;
    if (maxSigners != null) result.maxSigners = maxSigners;
    if (minSigners != null) result.minSigners = minSigners;
    if (keyCount != null) result.keyCount = keyCount;
    return result;
  }

  DkgRound1Request._();

  factory DkgRound1Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DkgRound1Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DkgRound1Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..aOS(2, _omitFieldNames ? '' : 'identifier')
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'maxSigners', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'minSigners', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'keyCount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DkgRound1Request clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DkgRound1Request copyWith(void Function(DkgRound1Request) updates) =>
      super.copyWith((message) => updates(message as DkgRound1Request))
          as DkgRound1Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DkgRound1Request create() => DkgRound1Request._();
  @$core.override
  DkgRound1Request createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DkgRound1Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DkgRound1Request>(create);
  static DkgRound1Request? _defaultInstance;

  /// An uuid to identify the request.
  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);

  /// Identifier of the participant, this will be used as the index of the Shamir secret share. The
  /// value should be not be 0. This is a 32-byte hex string.
  @$pb.TagNumber(2)
  $core.String get identifier => $_getSZ(1);
  @$pb.TagNumber(2)
  set identifier($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdentifier() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentifier() => $_clearField(2);

  /// The maximum number of signers, this is the size of the threshold signature scheme.
  @$pb.TagNumber(3)
  $fixnum.Int64 get maxSigners => $_getI64(2);
  @$pb.TagNumber(3)
  set maxSigners($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMaxSigners() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxSigners() => $_clearField(3);

  /// The minimum number of signers, this is the threshold for the threshold signature scheme.
  @$pb.TagNumber(4)
  $fixnum.Int64 get minSigners => $_getI64(3);
  @$pb.TagNumber(4)
  set minSigners($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMinSigners() => $_has(3);
  @$pb.TagNumber(4)
  void clearMinSigners() => $_clearField(4);

  /// The number of keys to generate.
  @$pb.TagNumber(5)
  $fixnum.Int64 get keyCount => $_getI64(4);
  @$pb.TagNumber(5)
  set keyCount($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasKeyCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearKeyCount() => $_clearField(5);
}

///
///  Distributed Key Generation Round 1 Response
///
///  This response is sent from the server to the client after the Distributed Key Generation
///  protocol has been completed.
class DkgRound1Response extends $pb.GeneratedMessage {
  factory DkgRound1Response({
    $core.Iterable<$core.List<$core.int>>? round1Packages,
  }) {
    final result = create();
    if (round1Packages != null) result.round1Packages.addAll(round1Packages);
    return result;
  }

  DkgRound1Response._();

  factory DkgRound1Response.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DkgRound1Response.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DkgRound1Response',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..p<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'round1Packages', $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DkgRound1Response clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DkgRound1Response copyWith(void Function(DkgRound1Response) updates) =>
      super.copyWith((message) => updates(message as DkgRound1Response))
          as DkgRound1Response;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DkgRound1Response create() => DkgRound1Response._();
  @$core.override
  DkgRound1Response createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DkgRound1Response getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DkgRound1Response>(create);
  static DkgRound1Response? _defaultInstance;

  /// The packages for the participants. This will be sent to all participants and will be used for
  /// the next round.
  @$pb.TagNumber(1)
  $pb.PbList<$core.List<$core.int>> get round1Packages => $_getList(0);
}

///
///  Distributed Key Generation Round 2 Request
///
///  This request is sent to the server for the round 2 of DKG protocol.
///  This will be a batch request.
class DkgRound2Request extends $pb.GeneratedMessage {
  factory DkgRound2Request({
    $core.String? requestId,
    $core.Iterable<$2.PackageMap>? round1PackagesMaps,
  }) {
    final result = create();
    if (requestId != null) result.requestId = requestId;
    if (round1PackagesMaps != null)
      result.round1PackagesMaps.addAll(round1PackagesMaps);
    return result;
  }

  DkgRound2Request._();

  factory DkgRound2Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DkgRound2Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DkgRound2Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..pPM<$2.PackageMap>(2, _omitFieldNames ? '' : 'round1PackagesMaps',
        subBuilder: $2.PackageMap.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DkgRound2Request clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DkgRound2Request copyWith(void Function(DkgRound2Request) updates) =>
      super.copyWith((message) => updates(message as DkgRound2Request))
          as DkgRound2Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DkgRound2Request create() => DkgRound2Request._();
  @$core.override
  DkgRound2Request createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DkgRound2Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DkgRound2Request>(create);
  static DkgRound2Request? _defaultInstance;

  /// An uuid to identify the request.
  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);

  /// A map of all participants' identifiers to their serialized round1 packages.
  @$pb.TagNumber(2)
  $pb.PbList<$2.PackageMap> get round1PackagesMaps => $_getList(1);
}

///
///  Distributed Key Generation Round 2 Response
///
///  This response is sent from the server to the client after the Distributed Key Generation
///  protocol has been completed.
class DkgRound2Response extends $pb.GeneratedMessage {
  factory DkgRound2Response({
    $core.Iterable<$2.PackageMap>? round2Packages,
  }) {
    final result = create();
    if (round2Packages != null) result.round2Packages.addAll(round2Packages);
    return result;
  }

  DkgRound2Response._();

  factory DkgRound2Response.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DkgRound2Response.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DkgRound2Response',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..pPM<$2.PackageMap>(1, _omitFieldNames ? '' : 'round2Packages',
        subBuilder: $2.PackageMap.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DkgRound2Response clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DkgRound2Response copyWith(void Function(DkgRound2Response) updates) =>
      super.copyWith((message) => updates(message as DkgRound2Response))
          as DkgRound2Response;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DkgRound2Response create() => DkgRound2Response._();
  @$core.override
  DkgRound2Response createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DkgRound2Response getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DkgRound2Response>(create);
  static DkgRound2Response? _defaultInstance;

  /// The serialized round2 packages.
  @$pb.TagNumber(1)
  $pb.PbList<$2.PackageMap> get round2Packages => $_getList(0);
}

///
///  Distributed Key Generation Round 3 Request
///
///  This request is sent to the server for the round 3 of DKG protocol.
class DkgRound3Request extends $pb.GeneratedMessage {
  factory DkgRound3Request({
    $core.String? requestId,
    $core.Iterable<$2.PackageMap>? round1PackagesMaps,
    $core.Iterable<$2.PackageMap>? round2PackagesMaps,
  }) {
    final result = create();
    if (requestId != null) result.requestId = requestId;
    if (round1PackagesMaps != null)
      result.round1PackagesMaps.addAll(round1PackagesMaps);
    if (round2PackagesMaps != null)
      result.round2PackagesMaps.addAll(round2PackagesMaps);
    return result;
  }

  DkgRound3Request._();

  factory DkgRound3Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DkgRound3Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DkgRound3Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestId')
    ..pPM<$2.PackageMap>(2, _omitFieldNames ? '' : 'round1PackagesMaps',
        subBuilder: $2.PackageMap.create)
    ..pPM<$2.PackageMap>(3, _omitFieldNames ? '' : 'round2PackagesMaps',
        subBuilder: $2.PackageMap.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DkgRound3Request clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DkgRound3Request copyWith(void Function(DkgRound3Request) updates) =>
      super.copyWith((message) => updates(message as DkgRound3Request))
          as DkgRound3Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DkgRound3Request create() => DkgRound3Request._();
  @$core.override
  DkgRound3Request createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DkgRound3Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DkgRound3Request>(create);
  static DkgRound3Request? _defaultInstance;

  /// An uuid to identify the request.
  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);

  /// A map of all participants' identifiers to their serialized round1 packages.
  @$pb.TagNumber(2)
  $pb.PbList<$2.PackageMap> get round1PackagesMaps => $_getList(1);

  /// A map of all participants' identifiers to their serialized round2 packages.
  @$pb.TagNumber(3)
  $pb.PbList<$2.PackageMap> get round2PackagesMaps => $_getList(2);
}

///
///  A key package for frost signing.
class KeyPackage extends $pb.GeneratedMessage {
  factory KeyPackage({
    $core.String? identifier,
    $core.List<$core.int>? secretShare,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        publicShares,
    $core.List<$core.int>? publicKey,
    $core.int? minSigners,
  }) {
    final result = create();
    if (identifier != null) result.identifier = identifier;
    if (secretShare != null) result.secretShare = secretShare;
    if (publicShares != null) result.publicShares.addEntries(publicShares);
    if (publicKey != null) result.publicKey = publicKey;
    if (minSigners != null) result.minSigners = minSigners;
    return result;
  }

  KeyPackage._();

  factory KeyPackage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KeyPackage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KeyPackage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'identifier')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'secretShare', $pb.PbFieldType.OY)
    ..m<$core.String, $core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'publicShares',
        entryClassName: 'KeyPackage.PublicSharesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('frost'))
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..aI(5, _omitFieldNames ? '' : 'minSigners', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeyPackage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeyPackage copyWith(void Function(KeyPackage) updates) =>
      super.copyWith((message) => updates(message as KeyPackage)) as KeyPackage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KeyPackage create() => KeyPackage._();
  @$core.override
  KeyPackage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static KeyPackage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KeyPackage>(create);
  static KeyPackage? _defaultInstance;

  /// The identifier of the participant.
  @$pb.TagNumber(1)
  $core.String get identifier => $_getSZ(0);
  @$pb.TagNumber(1)
  set identifier($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentifier() => $_clearField(1);

  /// The secret share for the participant.
  @$pb.TagNumber(2)
  $core.List<$core.int> get secretShare => $_getN(1);
  @$pb.TagNumber(2)
  set secretShare($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSecretShare() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecretShare() => $_clearField(2);

  /// The public shares for each participant.
  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.List<$core.int>> get publicShares =>
      $_getMap(2);

  /// The public key for the group.
  @$pb.TagNumber(4)
  $core.List<$core.int> get publicKey => $_getN(3);
  @$pb.TagNumber(4)
  set publicKey($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPublicKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearPublicKey() => $_clearField(4);

  /// The minimum number of signers for the threshold signature scheme.
  @$pb.TagNumber(5)
  $core.int get minSigners => $_getIZ(4);
  @$pb.TagNumber(5)
  set minSigners($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMinSigners() => $_has(4);
  @$pb.TagNumber(5)
  void clearMinSigners() => $_clearField(5);
}

///
///  Distributed Key Generation Round 3 Response
///
///  This response is sent from the server to the client after the Distributed Key Generation
///  protocol has been completed.
class DkgRound3Response extends $pb.GeneratedMessage {
  factory DkgRound3Response({
    $core.Iterable<KeyPackage>? keyPackages,
  }) {
    final result = create();
    if (keyPackages != null) result.keyPackages.addAll(keyPackages);
    return result;
  }

  DkgRound3Response._();

  factory DkgRound3Response.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DkgRound3Response.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DkgRound3Response',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..pPM<KeyPackage>(1, _omitFieldNames ? '' : 'keyPackages',
        subBuilder: KeyPackage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DkgRound3Response clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DkgRound3Response copyWith(void Function(DkgRound3Response) updates) =>
      super.copyWith((message) => updates(message as DkgRound3Response))
          as DkgRound3Response;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DkgRound3Response create() => DkgRound3Response._();
  @$core.override
  DkgRound3Response createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DkgRound3Response getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DkgRound3Response>(create);
  static DkgRound3Response? _defaultInstance;

  /// The key packages for the participants.
  @$pb.TagNumber(1)
  $pb.PbList<KeyPackage> get keyPackages => $_getList(0);
}

///
///  A nonce for frost signing.
///  It's a pair of private keys in secp256k1 sha256 field.
class SigningNonce extends $pb.GeneratedMessage {
  factory SigningNonce({
    $core.List<$core.int>? hiding,
    $core.List<$core.int>? binding,
  }) {
    final result = create();
    if (hiding != null) result.hiding = hiding;
    if (binding != null) result.binding = binding;
    return result;
  }

  SigningNonce._();

  factory SigningNonce.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningNonce.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningNonce',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'hiding', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'binding', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningNonce clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningNonce copyWith(void Function(SigningNonce) updates) =>
      super.copyWith((message) => updates(message as SigningNonce))
          as SigningNonce;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SigningNonce create() => SigningNonce._();
  @$core.override
  SigningNonce createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SigningNonce getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SigningNonce>(create);
  static SigningNonce? _defaultInstance;

  /// The private key for hiding. 32 bytes.
  @$pb.TagNumber(1)
  $core.List<$core.int> get hiding => $_getN(0);
  @$pb.TagNumber(1)
  set hiding($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHiding() => $_has(0);
  @$pb.TagNumber(1)
  void clearHiding() => $_clearField(1);

  /// The private key for binding. 32 bytes.
  @$pb.TagNumber(2)
  $core.List<$core.int> get binding => $_getN(1);
  @$pb.TagNumber(2)
  set binding($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBinding() => $_has(1);
  @$pb.TagNumber(2)
  void clearBinding() => $_clearField(2);
}

class FrostNonceRequest extends $pb.GeneratedMessage {
  factory FrostNonceRequest({
    $core.Iterable<KeyPackage>? keyPackages,
  }) {
    final result = create();
    if (keyPackages != null) result.keyPackages.addAll(keyPackages);
    return result;
  }

  FrostNonceRequest._();

  factory FrostNonceRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FrostNonceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FrostNonceRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..pPM<KeyPackage>(1, _omitFieldNames ? '' : 'keyPackages',
        subBuilder: KeyPackage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrostNonceRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrostNonceRequest copyWith(void Function(FrostNonceRequest) updates) =>
      super.copyWith((message) => updates(message as FrostNonceRequest))
          as FrostNonceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FrostNonceRequest create() => FrostNonceRequest._();
  @$core.override
  FrostNonceRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FrostNonceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FrostNonceRequest>(create);
  static FrostNonceRequest? _defaultInstance;

  /// The key packages for the signing, used as entropy for the nonce.
  @$pb.TagNumber(1)
  $pb.PbList<KeyPackage> get keyPackages => $_getList(0);
}

class SigningNonceResult extends $pb.GeneratedMessage {
  factory SigningNonceResult({
    SigningNonce? nonces,
    $2.SigningCommitment? commitments,
  }) {
    final result = create();
    if (nonces != null) result.nonces = nonces;
    if (commitments != null) result.commitments = commitments;
    return result;
  }

  SigningNonceResult._();

  factory SigningNonceResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningNonceResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningNonceResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..aOM<SigningNonce>(1, _omitFieldNames ? '' : 'nonces',
        subBuilder: SigningNonce.create)
    ..aOM<$2.SigningCommitment>(2, _omitFieldNames ? '' : 'commitments',
        subBuilder: $2.SigningCommitment.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningNonceResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningNonceResult copyWith(void Function(SigningNonceResult) updates) =>
      super.copyWith((message) => updates(message as SigningNonceResult))
          as SigningNonceResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SigningNonceResult create() => SigningNonceResult._();
  @$core.override
  SigningNonceResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SigningNonceResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SigningNonceResult>(create);
  static SigningNonceResult? _defaultInstance;

  /// The nonces for the signing.
  @$pb.TagNumber(1)
  SigningNonce get nonces => $_getN(0);
  @$pb.TagNumber(1)
  set nonces(SigningNonce value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasNonces() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonces() => $_clearField(1);
  @$pb.TagNumber(1)
  SigningNonce ensureNonces() => $_ensure(0);

  /// The commitments for the signing.
  @$pb.TagNumber(2)
  $2.SigningCommitment get commitments => $_getN(1);
  @$pb.TagNumber(2)
  set commitments($2.SigningCommitment value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCommitments() => $_has(1);
  @$pb.TagNumber(2)
  void clearCommitments() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.SigningCommitment ensureCommitments() => $_ensure(1);
}

class FrostNonceResponse extends $pb.GeneratedMessage {
  factory FrostNonceResponse({
    $core.Iterable<SigningNonceResult>? results,
  }) {
    final result = create();
    if (results != null) result.results.addAll(results);
    return result;
  }

  FrostNonceResponse._();

  factory FrostNonceResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FrostNonceResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FrostNonceResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..pPM<SigningNonceResult>(1, _omitFieldNames ? '' : 'results',
        subBuilder: SigningNonceResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrostNonceResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrostNonceResponse copyWith(void Function(FrostNonceResponse) updates) =>
      super.copyWith((message) => updates(message as FrostNonceResponse))
          as FrostNonceResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FrostNonceResponse create() => FrostNonceResponse._();
  @$core.override
  FrostNonceResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FrostNonceResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FrostNonceResponse>(create);
  static FrostNonceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SigningNonceResult> get results => $_getList(0);
}

class FrostSigningJob extends $pb.GeneratedMessage {
  factory FrostSigningJob({
    $core.String? jobId,
    $core.List<$core.int>? message,
    KeyPackage? keyPackage,
    $core.List<$core.int>? verifyingKey,
    SigningNonce? nonce,
    $core.Iterable<$core.MapEntry<$core.String, $2.SigningCommitment>>?
        commitments,
    $2.SigningCommitment? userCommitments,
    $core.List<$core.int>? adaptorPublicKey,
  }) {
    final result = create();
    if (jobId != null) result.jobId = jobId;
    if (message != null) result.message = message;
    if (keyPackage != null) result.keyPackage = keyPackage;
    if (verifyingKey != null) result.verifyingKey = verifyingKey;
    if (nonce != null) result.nonce = nonce;
    if (commitments != null) result.commitments.addEntries(commitments);
    if (userCommitments != null) result.userCommitments = userCommitments;
    if (adaptorPublicKey != null) result.adaptorPublicKey = adaptorPublicKey;
    return result;
  }

  FrostSigningJob._();

  factory FrostSigningJob.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FrostSigningJob.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FrostSigningJob',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'message', $pb.PbFieldType.OY)
    ..aOM<KeyPackage>(3, _omitFieldNames ? '' : 'keyPackage',
        subBuilder: KeyPackage.create)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'verifyingKey', $pb.PbFieldType.OY)
    ..aOM<SigningNonce>(5, _omitFieldNames ? '' : 'nonce',
        subBuilder: SigningNonce.create)
    ..m<$core.String, $2.SigningCommitment>(
        6, _omitFieldNames ? '' : 'commitments',
        entryClassName: 'FrostSigningJob.CommitmentsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $2.SigningCommitment.create,
        valueDefaultOrMaker: $2.SigningCommitment.getDefault,
        packageName: const $pb.PackageName('frost'))
    ..aOM<$2.SigningCommitment>(7, _omitFieldNames ? '' : 'userCommitments',
        subBuilder: $2.SigningCommitment.create)
    ..a<$core.List<$core.int>>(
        8, _omitFieldNames ? '' : 'adaptorPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrostSigningJob clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrostSigningJob copyWith(void Function(FrostSigningJob) updates) =>
      super.copyWith((message) => updates(message as FrostSigningJob))
          as FrostSigningJob;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FrostSigningJob create() => FrostSigningJob._();
  @$core.override
  FrostSigningJob createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FrostSigningJob getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FrostSigningJob>(create);
  static FrostSigningJob? _defaultInstance;

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
  KeyPackage get keyPackage => $_getN(2);
  @$pb.TagNumber(3)
  set keyPackage(KeyPackage value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasKeyPackage() => $_has(2);
  @$pb.TagNumber(3)
  void clearKeyPackage() => $_clearField(3);
  @$pb.TagNumber(3)
  KeyPackage ensureKeyPackage() => $_ensure(2);

  /// The verifying key. This should be the total public key for both user and StatechainEntity.
  @$pb.TagNumber(4)
  $core.List<$core.int> get verifyingKey => $_getN(3);
  @$pb.TagNumber(4)
  set verifyingKey($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVerifyingKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearVerifyingKey() => $_clearField(4);

  /// The nonce for current participant.
  @$pb.TagNumber(5)
  SigningNonce get nonce => $_getN(4);
  @$pb.TagNumber(5)
  set nonce(SigningNonce value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasNonce() => $_has(4);
  @$pb.TagNumber(5)
  void clearNonce() => $_clearField(5);
  @$pb.TagNumber(5)
  SigningNonce ensureNonce() => $_ensure(4);

  /// The commitments for all participants of the statechain.
  @$pb.TagNumber(6)
  $pb.PbMap<$core.String, $2.SigningCommitment> get commitments => $_getMap(5);

  /// The commitments for all participants of the user.
  @$pb.TagNumber(7)
  $2.SigningCommitment get userCommitments => $_getN(6);
  @$pb.TagNumber(7)
  set userCommitments($2.SigningCommitment value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasUserCommitments() => $_has(6);
  @$pb.TagNumber(7)
  void clearUserCommitments() => $_clearField(7);
  @$pb.TagNumber(7)
  $2.SigningCommitment ensureUserCommitments() => $_ensure(6);

  /// Adaptor public key for adaptor signature
  @$pb.TagNumber(8)
  $core.List<$core.int> get adaptorPublicKey => $_getN(7);
  @$pb.TagNumber(8)
  set adaptorPublicKey($core.List<$core.int> value) => $_setBytes(7, value);
  @$pb.TagNumber(8)
  $core.bool hasAdaptorPublicKey() => $_has(7);
  @$pb.TagNumber(8)
  void clearAdaptorPublicKey() => $_clearField(8);
}

///
///  Signing request
///
///  This request is sent to the server for the signing.
class SignFrostRequest extends $pb.GeneratedMessage {
  factory SignFrostRequest({
    $core.Iterable<FrostSigningJob>? signingJobs,
    SigningRole? role,
  }) {
    final result = create();
    if (signingJobs != null) result.signingJobs.addAll(signingJobs);
    if (role != null) result.role = role;
    return result;
  }

  SignFrostRequest._();

  factory SignFrostRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SignFrostRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignFrostRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..pPM<FrostSigningJob>(1, _omitFieldNames ? '' : 'signingJobs',
        subBuilder: FrostSigningJob.create)
    ..aE<SigningRole>(2, _omitFieldNames ? '' : 'role',
        enumValues: SigningRole.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignFrostRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignFrostRequest copyWith(void Function(SignFrostRequest) updates) =>
      super.copyWith((message) => updates(message as SignFrostRequest))
          as SignFrostRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignFrostRequest create() => SignFrostRequest._();
  @$core.override
  SignFrostRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SignFrostRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignFrostRequest>(create);
  static SignFrostRequest? _defaultInstance;

  /// The signing jobs.
  @$pb.TagNumber(1)
  $pb.PbList<FrostSigningJob> get signingJobs => $_getList(0);

  /// The role of the participant in the signing.
  @$pb.TagNumber(2)
  SigningRole get role => $_getN(1);
  @$pb.TagNumber(2)
  set role(SigningRole value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => $_clearField(2);
}

///
///  Signing response
///
///  This response is sent from the server to the client after the signing has been completed.
class SignFrostResponse extends $pb.GeneratedMessage {
  factory SignFrostResponse({
    $core.Iterable<$core.MapEntry<$core.String, $2.SigningResult>>? results,
  }) {
    final result = create();
    if (results != null) result.results.addEntries(results);
    return result;
  }

  SignFrostResponse._();

  factory SignFrostResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SignFrostResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignFrostResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..m<$core.String, $2.SigningResult>(1, _omitFieldNames ? '' : 'results',
        entryClassName: 'SignFrostResponse.ResultsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $2.SigningResult.create,
        valueDefaultOrMaker: $2.SigningResult.getDefault,
        packageName: const $pb.PackageName('frost'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignFrostResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignFrostResponse copyWith(void Function(SignFrostResponse) updates) =>
      super.copyWith((message) => updates(message as SignFrostResponse))
          as SignFrostResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignFrostResponse create() => SignFrostResponse._();
  @$core.override
  SignFrostResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SignFrostResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignFrostResponse>(create);
  static SignFrostResponse? _defaultInstance;

  /// The signature shares.
  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $2.SigningResult> get results => $_getMap(0);
}

///
///  Aggregate frost request
///
///  This request is sent to the server for the aggregate signing.
class AggregateFrostRequest extends $pb.GeneratedMessage {
  factory AggregateFrostRequest({
    $core.List<$core.int>? message,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        signatureShares,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        publicShares,
    $core.List<$core.int>? verifyingKey,
    $core.Iterable<$core.MapEntry<$core.String, $2.SigningCommitment>>?
        commitments,
    $2.SigningCommitment? userCommitments,
    $core.List<$core.int>? userPublicKey,
    $core.List<$core.int>? userSignatureShare,
    $core.List<$core.int>? adaptorPublicKey,
  }) {
    final result = create();
    if (message != null) result.message = message;
    if (signatureShares != null)
      result.signatureShares.addEntries(signatureShares);
    if (publicShares != null) result.publicShares.addEntries(publicShares);
    if (verifyingKey != null) result.verifyingKey = verifyingKey;
    if (commitments != null) result.commitments.addEntries(commitments);
    if (userCommitments != null) result.userCommitments = userCommitments;
    if (userPublicKey != null) result.userPublicKey = userPublicKey;
    if (userSignatureShare != null)
      result.userSignatureShare = userSignatureShare;
    if (adaptorPublicKey != null) result.adaptorPublicKey = adaptorPublicKey;
    return result;
  }

  AggregateFrostRequest._();

  factory AggregateFrostRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AggregateFrostRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AggregateFrostRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'message', $pb.PbFieldType.OY)
    ..m<$core.String, $core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signatureShares',
        entryClassName: 'AggregateFrostRequest.SignatureSharesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('frost'))
    ..m<$core.String, $core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'publicShares',
        entryClassName: 'AggregateFrostRequest.PublicSharesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('frost'))
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'verifyingKey', $pb.PbFieldType.OY)
    ..m<$core.String, $2.SigningCommitment>(
        5, _omitFieldNames ? '' : 'commitments',
        entryClassName: 'AggregateFrostRequest.CommitmentsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $2.SigningCommitment.create,
        valueDefaultOrMaker: $2.SigningCommitment.getDefault,
        packageName: const $pb.PackageName('frost'))
    ..aOM<$2.SigningCommitment>(6, _omitFieldNames ? '' : 'userCommitments',
        subBuilder: $2.SigningCommitment.create)
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'userPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        8, _omitFieldNames ? '' : 'userSignatureShare', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        9, _omitFieldNames ? '' : 'adaptorPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AggregateFrostRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AggregateFrostRequest copyWith(
          void Function(AggregateFrostRequest) updates) =>
      super.copyWith((message) => updates(message as AggregateFrostRequest))
          as AggregateFrostRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AggregateFrostRequest create() => AggregateFrostRequest._();
  @$core.override
  AggregateFrostRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AggregateFrostRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AggregateFrostRequest>(create);
  static AggregateFrostRequest? _defaultInstance;

  /// The message to sign.
  @$pb.TagNumber(1)
  $core.List<$core.int> get message => $_getN(0);
  @$pb.TagNumber(1)
  set message($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField(1);

  /// The signature shares for each participant of the statechain.
  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $core.List<$core.int>> get signatureShares =>
      $_getMap(1);

  /// The public shares for each participant of the statechain.
  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.List<$core.int>> get publicShares =>
      $_getMap(2);

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
  $pb.PbMap<$core.String, $2.SigningCommitment> get commitments => $_getMap(4);

  /// The commitments for all participants of the user.
  @$pb.TagNumber(6)
  $2.SigningCommitment get userCommitments => $_getN(5);
  @$pb.TagNumber(6)
  set userCommitments($2.SigningCommitment value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasUserCommitments() => $_has(5);
  @$pb.TagNumber(6)
  void clearUserCommitments() => $_clearField(6);
  @$pb.TagNumber(6)
  $2.SigningCommitment ensureUserCommitments() => $_ensure(5);

  /// The user's public key.
  @$pb.TagNumber(7)
  $core.List<$core.int> get userPublicKey => $_getN(6);
  @$pb.TagNumber(7)
  set userPublicKey($core.List<$core.int> value) => $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasUserPublicKey() => $_has(6);
  @$pb.TagNumber(7)
  void clearUserPublicKey() => $_clearField(7);

  /// The user's signature share.
  @$pb.TagNumber(8)
  $core.List<$core.int> get userSignatureShare => $_getN(7);
  @$pb.TagNumber(8)
  set userSignatureShare($core.List<$core.int> value) => $_setBytes(7, value);
  @$pb.TagNumber(8)
  $core.bool hasUserSignatureShare() => $_has(7);
  @$pb.TagNumber(8)
  void clearUserSignatureShare() => $_clearField(8);

  /// Adaptor public key for adaptor signature
  @$pb.TagNumber(9)
  $core.List<$core.int> get adaptorPublicKey => $_getN(8);
  @$pb.TagNumber(9)
  set adaptorPublicKey($core.List<$core.int> value) => $_setBytes(8, value);
  @$pb.TagNumber(9)
  $core.bool hasAdaptorPublicKey() => $_has(8);
  @$pb.TagNumber(9)
  void clearAdaptorPublicKey() => $_clearField(9);
}

///
///  Aggregate frost response
///
///  This response is sent from the server to the client after the aggregate signing has been completed.
class AggregateFrostResponse extends $pb.GeneratedMessage {
  factory AggregateFrostResponse({
    $core.List<$core.int>? signature,
  }) {
    final result = create();
    if (signature != null) result.signature = signature;
    return result;
  }

  AggregateFrostResponse._();

  factory AggregateFrostResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AggregateFrostResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AggregateFrostResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AggregateFrostResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AggregateFrostResponse copyWith(
          void Function(AggregateFrostResponse) updates) =>
      super.copyWith((message) => updates(message as AggregateFrostResponse))
          as AggregateFrostResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AggregateFrostResponse create() => AggregateFrostResponse._();
  @$core.override
  AggregateFrostResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AggregateFrostResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AggregateFrostResponse>(create);
  static AggregateFrostResponse? _defaultInstance;

  /// The signature.
  @$pb.TagNumber(1)
  $core.List<$core.int> get signature => $_getN(0);
  @$pb.TagNumber(1)
  set signature($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignature() => $_clearField(1);
}

class ValidateSignatureShareRequest extends $pb.GeneratedMessage {
  factory ValidateSignatureShareRequest({
    $core.String? identifier,
    SigningRole? role,
    $core.List<$core.int>? message,
    $core.List<$core.int>? signatureShare,
    $core.List<$core.int>? publicShare,
    $core.List<$core.int>? verifyingKey,
    $core.Iterable<$core.MapEntry<$core.String, $2.SigningCommitment>>?
        commitments,
    $2.SigningCommitment? userCommitments,
  }) {
    final result = create();
    if (identifier != null) result.identifier = identifier;
    if (role != null) result.role = role;
    if (message != null) result.message = message;
    if (signatureShare != null) result.signatureShare = signatureShare;
    if (publicShare != null) result.publicShare = publicShare;
    if (verifyingKey != null) result.verifyingKey = verifyingKey;
    if (commitments != null) result.commitments.addEntries(commitments);
    if (userCommitments != null) result.userCommitments = userCommitments;
    return result;
  }

  ValidateSignatureShareRequest._();

  factory ValidateSignatureShareRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ValidateSignatureShareRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ValidateSignatureShareRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'identifier')
    ..aE<SigningRole>(2, _omitFieldNames ? '' : 'role',
        enumValues: SigningRole.values)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'message', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'signatureShare', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'publicShare', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'verifyingKey', $pb.PbFieldType.OY)
    ..m<$core.String, $2.SigningCommitment>(
        7, _omitFieldNames ? '' : 'commitments',
        entryClassName: 'ValidateSignatureShareRequest.CommitmentsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $2.SigningCommitment.create,
        valueDefaultOrMaker: $2.SigningCommitment.getDefault,
        packageName: const $pb.PackageName('frost'))
    ..aOM<$2.SigningCommitment>(8, _omitFieldNames ? '' : 'userCommitments',
        subBuilder: $2.SigningCommitment.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValidateSignatureShareRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValidateSignatureShareRequest copyWith(
          void Function(ValidateSignatureShareRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ValidateSignatureShareRequest))
          as ValidateSignatureShareRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValidateSignatureShareRequest create() =>
      ValidateSignatureShareRequest._();
  @$core.override
  ValidateSignatureShareRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ValidateSignatureShareRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ValidateSignatureShareRequest>(create);
  static ValidateSignatureShareRequest? _defaultInstance;

  /// The identifier of the participant.
  @$pb.TagNumber(1)
  $core.String get identifier => $_getSZ(0);
  @$pb.TagNumber(1)
  set identifier($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentifier() => $_clearField(1);

  /// The role of the participant in the signing.
  @$pb.TagNumber(2)
  SigningRole get role => $_getN(1);
  @$pb.TagNumber(2)
  set role(SigningRole value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => $_clearField(2);

  /// The message to sign.
  @$pb.TagNumber(3)
  $core.List<$core.int> get message => $_getN(2);
  @$pb.TagNumber(3)
  set message($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => $_clearField(3);

  /// The signature share to validate.
  @$pb.TagNumber(4)
  $core.List<$core.int> get signatureShare => $_getN(3);
  @$pb.TagNumber(4)
  set signatureShare($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSignatureShare() => $_has(3);
  @$pb.TagNumber(4)
  void clearSignatureShare() => $_clearField(4);

  /// The public share for the participant.
  @$pb.TagNumber(5)
  $core.List<$core.int> get publicShare => $_getN(4);
  @$pb.TagNumber(5)
  set publicShare($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPublicShare() => $_has(4);
  @$pb.TagNumber(5)
  void clearPublicShare() => $_clearField(5);

  /// The verifying key. This should be the total public key for both user and StatechainEntity.
  @$pb.TagNumber(6)
  $core.List<$core.int> get verifyingKey => $_getN(5);
  @$pb.TagNumber(6)
  set verifyingKey($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasVerifyingKey() => $_has(5);
  @$pb.TagNumber(6)
  void clearVerifyingKey() => $_clearField(6);

  /// The commitments for all participants of the statechain.
  @$pb.TagNumber(7)
  $pb.PbMap<$core.String, $2.SigningCommitment> get commitments => $_getMap(6);

  /// The commitments for all participants of the user.
  @$pb.TagNumber(8)
  $2.SigningCommitment get userCommitments => $_getN(7);
  @$pb.TagNumber(8)
  set userCommitments($2.SigningCommitment value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasUserCommitments() => $_has(7);
  @$pb.TagNumber(8)
  void clearUserCommitments() => $_clearField(8);
  @$pb.TagNumber(8)
  $2.SigningCommitment ensureUserCommitments() => $_ensure(7);
}

class ParticipantGroup extends $pb.GeneratedMessage {
  factory ParticipantGroup({
    $core.Iterable<$core.String>? identifiers,
  }) {
    final result = create();
    if (identifiers != null) result.identifiers.addAll(identifiers);
    return result;
  }

  ParticipantGroup._();

  factory ParticipantGroup.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ParticipantGroup.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ParticipantGroup',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'identifiers')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParticipantGroup clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParticipantGroup copyWith(void Function(ParticipantGroup) updates) =>
      super.copyWith((message) => updates(message as ParticipantGroup))
          as ParticipantGroup;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParticipantGroup create() => ParticipantGroup._();
  @$core.override
  ParticipantGroup createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ParticipantGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParticipantGroup>(create);
  static ParticipantGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get identifiers => $_getList(0);
}

class FrostSigningJobV2 extends $pb.GeneratedMessage {
  factory FrostSigningJobV2({
    $core.String? jobId,
    $core.List<$core.int>? message,
    KeyPackage? keyPackage,
    $core.List<$core.int>? verifyingKey,
    SigningNonce? nonce,
    $core.Iterable<$core.MapEntry<$core.String, $2.SigningCommitment>>?
        commitments,
    $core.Iterable<ParticipantGroup>? participantGroups,
    $core.List<$core.int>? adaptorPublicKey,
    $core.bool? useTweak,
  }) {
    final result = create();
    if (jobId != null) result.jobId = jobId;
    if (message != null) result.message = message;
    if (keyPackage != null) result.keyPackage = keyPackage;
    if (verifyingKey != null) result.verifyingKey = verifyingKey;
    if (nonce != null) result.nonce = nonce;
    if (commitments != null) result.commitments.addEntries(commitments);
    if (participantGroups != null)
      result.participantGroups.addAll(participantGroups);
    if (adaptorPublicKey != null) result.adaptorPublicKey = adaptorPublicKey;
    if (useTweak != null) result.useTweak = useTweak;
    return result;
  }

  FrostSigningJobV2._();

  factory FrostSigningJobV2.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FrostSigningJobV2.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FrostSigningJobV2',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'jobId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'message', $pb.PbFieldType.OY)
    ..aOM<KeyPackage>(3, _omitFieldNames ? '' : 'keyPackage',
        subBuilder: KeyPackage.create)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'verifyingKey', $pb.PbFieldType.OY)
    ..aOM<SigningNonce>(5, _omitFieldNames ? '' : 'nonce',
        subBuilder: SigningNonce.create)
    ..m<$core.String, $2.SigningCommitment>(
        6, _omitFieldNames ? '' : 'commitments',
        entryClassName: 'FrostSigningJobV2.CommitmentsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $2.SigningCommitment.create,
        valueDefaultOrMaker: $2.SigningCommitment.getDefault,
        packageName: const $pb.PackageName('frost'))
    ..pPM<ParticipantGroup>(7, _omitFieldNames ? '' : 'participantGroups',
        subBuilder: ParticipantGroup.create)
    ..a<$core.List<$core.int>>(
        8, _omitFieldNames ? '' : 'adaptorPublicKey', $pb.PbFieldType.OY)
    ..aOB(9, _omitFieldNames ? '' : 'useTweak')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrostSigningJobV2 clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrostSigningJobV2 copyWith(void Function(FrostSigningJobV2) updates) =>
      super.copyWith((message) => updates(message as FrostSigningJobV2))
          as FrostSigningJobV2;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FrostSigningJobV2 create() => FrostSigningJobV2._();
  @$core.override
  FrostSigningJobV2 createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FrostSigningJobV2 getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FrostSigningJobV2>(create);
  static FrostSigningJobV2? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jobId => $_getSZ(0);
  @$pb.TagNumber(1)
  set jobId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get message => $_getN(1);
  @$pb.TagNumber(2)
  set message($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  KeyPackage get keyPackage => $_getN(2);
  @$pb.TagNumber(3)
  set keyPackage(KeyPackage value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasKeyPackage() => $_has(2);
  @$pb.TagNumber(3)
  void clearKeyPackage() => $_clearField(3);
  @$pb.TagNumber(3)
  KeyPackage ensureKeyPackage() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get verifyingKey => $_getN(3);
  @$pb.TagNumber(4)
  set verifyingKey($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVerifyingKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearVerifyingKey() => $_clearField(4);

  @$pb.TagNumber(5)
  SigningNonce get nonce => $_getN(4);
  @$pb.TagNumber(5)
  set nonce(SigningNonce value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasNonce() => $_has(4);
  @$pb.TagNumber(5)
  void clearNonce() => $_clearField(5);
  @$pb.TagNumber(5)
  SigningNonce ensureNonce() => $_ensure(4);

  @$pb.TagNumber(6)
  $pb.PbMap<$core.String, $2.SigningCommitment> get commitments => $_getMap(5);

  @$pb.TagNumber(7)
  $pb.PbList<ParticipantGroup> get participantGroups => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$core.int> get adaptorPublicKey => $_getN(7);
  @$pb.TagNumber(8)
  set adaptorPublicKey($core.List<$core.int> value) => $_setBytes(7, value);
  @$pb.TagNumber(8)
  $core.bool hasAdaptorPublicKey() => $_has(7);
  @$pb.TagNumber(8)
  void clearAdaptorPublicKey() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get useTweak => $_getBF(8);
  @$pb.TagNumber(9)
  set useTweak($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasUseTweak() => $_has(8);
  @$pb.TagNumber(9)
  void clearUseTweak() => $_clearField(9);
}

class SignFrostRequestV2 extends $pb.GeneratedMessage {
  factory SignFrostRequestV2({
    $core.Iterable<FrostSigningJobV2>? signingJobs,
  }) {
    final result = create();
    if (signingJobs != null) result.signingJobs.addAll(signingJobs);
    return result;
  }

  SignFrostRequestV2._();

  factory SignFrostRequestV2.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SignFrostRequestV2.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignFrostRequestV2',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..pPM<FrostSigningJobV2>(1, _omitFieldNames ? '' : 'signingJobs',
        subBuilder: FrostSigningJobV2.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignFrostRequestV2 clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignFrostRequestV2 copyWith(void Function(SignFrostRequestV2) updates) =>
      super.copyWith((message) => updates(message as SignFrostRequestV2))
          as SignFrostRequestV2;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignFrostRequestV2 create() => SignFrostRequestV2._();
  @$core.override
  SignFrostRequestV2 createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SignFrostRequestV2 getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignFrostRequestV2>(create);
  static SignFrostRequestV2? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<FrostSigningJobV2> get signingJobs => $_getList(0);
}

class AggregateFrostRequestV2 extends $pb.GeneratedMessage {
  factory AggregateFrostRequestV2({
    $core.List<$core.int>? message,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        signatureShares,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        publicShares,
    $core.List<$core.int>? verifyingKey,
    $core.Iterable<$core.MapEntry<$core.String, $2.SigningCommitment>>?
        commitments,
    $core.Iterable<ParticipantGroup>? participantGroups,
    $core.List<$core.int>? adaptorPublicKey,
  }) {
    final result = create();
    if (message != null) result.message = message;
    if (signatureShares != null)
      result.signatureShares.addEntries(signatureShares);
    if (publicShares != null) result.publicShares.addEntries(publicShares);
    if (verifyingKey != null) result.verifyingKey = verifyingKey;
    if (commitments != null) result.commitments.addEntries(commitments);
    if (participantGroups != null)
      result.participantGroups.addAll(participantGroups);
    if (adaptorPublicKey != null) result.adaptorPublicKey = adaptorPublicKey;
    return result;
  }

  AggregateFrostRequestV2._();

  factory AggregateFrostRequestV2.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AggregateFrostRequestV2.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AggregateFrostRequestV2',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'message', $pb.PbFieldType.OY)
    ..m<$core.String, $core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signatureShares',
        entryClassName: 'AggregateFrostRequestV2.SignatureSharesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('frost'))
    ..m<$core.String, $core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'publicShares',
        entryClassName: 'AggregateFrostRequestV2.PublicSharesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('frost'))
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'verifyingKey', $pb.PbFieldType.OY)
    ..m<$core.String, $2.SigningCommitment>(
        5, _omitFieldNames ? '' : 'commitments',
        entryClassName: 'AggregateFrostRequestV2.CommitmentsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $2.SigningCommitment.create,
        valueDefaultOrMaker: $2.SigningCommitment.getDefault,
        packageName: const $pb.PackageName('frost'))
    ..pPM<ParticipantGroup>(6, _omitFieldNames ? '' : 'participantGroups',
        subBuilder: ParticipantGroup.create)
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'adaptorPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AggregateFrostRequestV2 clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AggregateFrostRequestV2 copyWith(
          void Function(AggregateFrostRequestV2) updates) =>
      super.copyWith((message) => updates(message as AggregateFrostRequestV2))
          as AggregateFrostRequestV2;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AggregateFrostRequestV2 create() => AggregateFrostRequestV2._();
  @$core.override
  AggregateFrostRequestV2 createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AggregateFrostRequestV2 getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AggregateFrostRequestV2>(create);
  static AggregateFrostRequestV2? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get message => $_getN(0);
  @$pb.TagNumber(1)
  set message($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $core.List<$core.int>> get signatureShares =>
      $_getMap(1);

  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.List<$core.int>> get publicShares =>
      $_getMap(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get verifyingKey => $_getN(3);
  @$pb.TagNumber(4)
  set verifyingKey($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVerifyingKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearVerifyingKey() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbMap<$core.String, $2.SigningCommitment> get commitments => $_getMap(4);

  @$pb.TagNumber(6)
  $pb.PbList<ParticipantGroup> get participantGroups => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$core.int> get adaptorPublicKey => $_getN(6);
  @$pb.TagNumber(7)
  set adaptorPublicKey($core.List<$core.int> value) => $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAdaptorPublicKey() => $_has(6);
  @$pb.TagNumber(7)
  void clearAdaptorPublicKey() => $_clearField(7);
}

class ValidateSignatureShareRequestV2 extends $pb.GeneratedMessage {
  factory ValidateSignatureShareRequestV2({
    $core.String? identifier,
    $core.List<$core.int>? message,
    $core.List<$core.int>? signatureShare,
    $core.List<$core.int>? publicShare,
    $core.List<$core.int>? verifyingKey,
    $core.Iterable<$core.MapEntry<$core.String, $2.SigningCommitment>>?
        commitments,
    $core.Iterable<ParticipantGroup>? participantGroups,
  }) {
    final result = create();
    if (identifier != null) result.identifier = identifier;
    if (message != null) result.message = message;
    if (signatureShare != null) result.signatureShare = signatureShare;
    if (publicShare != null) result.publicShare = publicShare;
    if (verifyingKey != null) result.verifyingKey = verifyingKey;
    if (commitments != null) result.commitments.addEntries(commitments);
    if (participantGroups != null)
      result.participantGroups.addAll(participantGroups);
    return result;
  }

  ValidateSignatureShareRequestV2._();

  factory ValidateSignatureShareRequestV2.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ValidateSignatureShareRequestV2.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ValidateSignatureShareRequestV2',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'frost'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'identifier')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'message', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'signatureShare', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'publicShare', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'verifyingKey', $pb.PbFieldType.OY)
    ..m<$core.String, $2.SigningCommitment>(
        6, _omitFieldNames ? '' : 'commitments',
        entryClassName: 'ValidateSignatureShareRequestV2.CommitmentsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $2.SigningCommitment.create,
        valueDefaultOrMaker: $2.SigningCommitment.getDefault,
        packageName: const $pb.PackageName('frost'))
    ..pPM<ParticipantGroup>(7, _omitFieldNames ? '' : 'participantGroups',
        subBuilder: ParticipantGroup.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValidateSignatureShareRequestV2 clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValidateSignatureShareRequestV2 copyWith(
          void Function(ValidateSignatureShareRequestV2) updates) =>
      super.copyWith(
              (message) => updates(message as ValidateSignatureShareRequestV2))
          as ValidateSignatureShareRequestV2;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValidateSignatureShareRequestV2 create() =>
      ValidateSignatureShareRequestV2._();
  @$core.override
  ValidateSignatureShareRequestV2 createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ValidateSignatureShareRequestV2 getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ValidateSignatureShareRequestV2>(
          create);
  static ValidateSignatureShareRequestV2? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get identifier => $_getSZ(0);
  @$pb.TagNumber(1)
  set identifier($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentifier() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get message => $_getN(1);
  @$pb.TagNumber(2)
  set message($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get signatureShare => $_getN(2);
  @$pb.TagNumber(3)
  set signatureShare($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSignatureShare() => $_has(2);
  @$pb.TagNumber(3)
  void clearSignatureShare() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get publicShare => $_getN(3);
  @$pb.TagNumber(4)
  set publicShare($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPublicShare() => $_has(3);
  @$pb.TagNumber(4)
  void clearPublicShare() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get verifyingKey => $_getN(4);
  @$pb.TagNumber(5)
  set verifyingKey($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasVerifyingKey() => $_has(4);
  @$pb.TagNumber(5)
  void clearVerifyingKey() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbMap<$core.String, $2.SigningCommitment> get commitments => $_getMap(5);

  @$pb.TagNumber(7)
  $pb.PbList<ParticipantGroup> get participantGroups => $_getList(6);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
