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

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'common.pbenum.dart';

///
///  A map from a string to a bytes. It's a workaround to have map arrays in proto.
class PackageMap extends $pb.GeneratedMessage {
  factory PackageMap({
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        packages,
  }) {
    final result = create();
    if (packages != null) result.packages.addEntries(packages);
    return result;
  }

  PackageMap._();

  factory PackageMap.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PackageMap.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PackageMap',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'common'),
      createEmptyInstance: create)
    ..m<$core.String, $core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'packages',
        entryClassName: 'PackageMap.PackagesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('common'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PackageMap clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PackageMap copyWith(void Function(PackageMap) updates) =>
      super.copyWith((message) => updates(message as PackageMap)) as PackageMap;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PackageMap create() => PackageMap._();
  @$core.override
  PackageMap createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PackageMap getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PackageMap>(create);
  static PackageMap? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $core.List<$core.int>> get packages => $_getMap(0);
}

///
///  A commitment for frost signing.
///  It's a pair of public keys (points) in secp256k1 curve.
class SigningCommitment extends $pb.GeneratedMessage {
  factory SigningCommitment({
    $core.List<$core.int>? hiding,
    $core.List<$core.int>? binding,
  }) {
    final result = create();
    if (hiding != null) result.hiding = hiding;
    if (binding != null) result.binding = binding;
    return result;
  }

  SigningCommitment._();

  factory SigningCommitment.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningCommitment.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningCommitment',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'common'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'hiding', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'binding', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningCommitment clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningCommitment copyWith(void Function(SigningCommitment) updates) =>
      super.copyWith((message) => updates(message as SigningCommitment))
          as SigningCommitment;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SigningCommitment create() => SigningCommitment._();
  @$core.override
  SigningCommitment createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SigningCommitment getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SigningCommitment>(create);
  static SigningCommitment? _defaultInstance;

  /// The public key for hiding. 33 bytes.
  @$pb.TagNumber(1)
  $core.List<$core.int> get hiding => $_getN(0);
  @$pb.TagNumber(1)
  set hiding($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHiding() => $_has(0);
  @$pb.TagNumber(1)
  void clearHiding() => $_clearField(1);

  /// The public key for binding. 33 bytes.
  @$pb.TagNumber(2)
  $core.List<$core.int> get binding => $_getN(1);
  @$pb.TagNumber(2)
  set binding($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBinding() => $_has(1);
  @$pb.TagNumber(2)
  void clearBinding() => $_clearField(2);
}

class SigningResult extends $pb.GeneratedMessage {
  factory SigningResult({
    $core.List<$core.int>? signatureShare,
  }) {
    final result = create();
    if (signatureShare != null) result.signatureShare = signatureShare;
    return result;
  }

  SigningResult._();

  factory SigningResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'common'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'signatureShare', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningResult copyWith(void Function(SigningResult) updates) =>
      super.copyWith((message) => updates(message as SigningResult))
          as SigningResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SigningResult create() => SigningResult._();
  @$core.override
  SigningResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SigningResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SigningResult>(create);
  static SigningResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get signatureShare => $_getN(0);
  @$pb.TagNumber(1)
  set signatureShare($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSignatureShare() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignatureShare() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
