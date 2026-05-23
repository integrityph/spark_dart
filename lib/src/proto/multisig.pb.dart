// This is a generated file - do not edit.
//
// Generated from multisig.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class MultisigConfig extends $pb.GeneratedMessage {
  factory MultisigConfig({
    $core.int? version,
    $core.int? threshold,
    $core.Iterable<$core.List<$core.int>>? publicKeys,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (threshold != null) result.threshold = threshold;
    if (publicKeys != null) result.publicKeys.addAll(publicKeys);
    return result;
  }

  MultisigConfig._();

  factory MultisigConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MultisigConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MultisigConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'multisig'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'threshold', fieldType: $pb.PbFieldType.OU3)
    ..p<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'publicKeys', $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MultisigConfig clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MultisigConfig copyWith(void Function(MultisigConfig) updates) =>
      super.copyWith((message) => updates(message as MultisigConfig))
          as MultisigConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MultisigConfig create() => MultisigConfig._();
  @$core.override
  MultisigConfig createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MultisigConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MultisigConfig>(create);
  static MultisigConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get threshold => $_getIZ(1);
  @$pb.TagNumber(2)
  set threshold($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasThreshold() => $_has(1);
  @$pb.TagNumber(2)
  void clearThreshold() => $_clearField(2);

  /// Public keys sorted lexicographically. Order determines canonical hash.
  @$pb.TagNumber(3)
  $pb.PbList<$core.List<$core.int>> get publicKeys => $_getList(2);
}

class KeyedSignature extends $pb.GeneratedMessage {
  factory KeyedSignature({
    $core.List<$core.int>? publicKey,
    $core.List<$core.int>? signature,
  }) {
    final result = create();
    if (publicKey != null) result.publicKey = publicKey;
    if (signature != null) result.signature = signature;
    return result;
  }

  KeyedSignature._();

  factory KeyedSignature.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KeyedSignature.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KeyedSignature',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'multisig'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeyedSignature clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeyedSignature copyWith(void Function(KeyedSignature) updates) =>
      super.copyWith((message) => updates(message as KeyedSignature))
          as KeyedSignature;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KeyedSignature create() => KeyedSignature._();
  @$core.override
  KeyedSignature createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static KeyedSignature getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KeyedSignature>(create);
  static KeyedSignature? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);
}

class MultisigSignatureSet extends $pb.GeneratedMessage {
  factory MultisigSignatureSet({
    MultisigConfig? multisigConfig,
    $core.Iterable<KeyedSignature>? signatures,
  }) {
    final result = create();
    if (multisigConfig != null) result.multisigConfig = multisigConfig;
    if (signatures != null) result.signatures.addAll(signatures);
    return result;
  }

  MultisigSignatureSet._();

  factory MultisigSignatureSet.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MultisigSignatureSet.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MultisigSignatureSet',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'multisig'),
      createEmptyInstance: create)
    ..aOM<MultisigConfig>(1, _omitFieldNames ? '' : 'multisigConfig',
        subBuilder: MultisigConfig.create)
    ..pPM<KeyedSignature>(2, _omitFieldNames ? '' : 'signatures',
        subBuilder: KeyedSignature.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MultisigSignatureSet clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MultisigSignatureSet copyWith(void Function(MultisigSignatureSet) updates) =>
      super.copyWith((message) => updates(message as MultisigSignatureSet))
          as MultisigSignatureSet;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MultisigSignatureSet create() => MultisigSignatureSet._();
  @$core.override
  MultisigSignatureSet createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MultisigSignatureSet getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MultisigSignatureSet>(create);
  static MultisigSignatureSet? _defaultInstance;

  @$pb.TagNumber(1)
  MultisigConfig get multisigConfig => $_getN(0);
  @$pb.TagNumber(1)
  set multisigConfig(MultisigConfig value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMultisigConfig() => $_has(0);
  @$pb.TagNumber(1)
  void clearMultisigConfig() => $_clearField(1);
  @$pb.TagNumber(1)
  MultisigConfig ensureMultisigConfig() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<KeyedSignature> get signatures => $_getList(1);
}

enum SigningAuthority_Authority { publicKey, multisig, notSet }

class SigningAuthority extends $pb.GeneratedMessage {
  factory SigningAuthority({
    $core.List<$core.int>? publicKey,
    MultisigConfig? multisig,
  }) {
    final result = create();
    if (publicKey != null) result.publicKey = publicKey;
    if (multisig != null) result.multisig = multisig;
    return result;
  }

  SigningAuthority._();

  factory SigningAuthority.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningAuthority.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SigningAuthority_Authority>
      _SigningAuthority_AuthorityByTag = {
    1: SigningAuthority_Authority.publicKey,
    2: SigningAuthority_Authority.multisig,
    0: SigningAuthority_Authority.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningAuthority',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'multisig'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..aOM<MultisigConfig>(2, _omitFieldNames ? '' : 'multisig',
        subBuilder: MultisigConfig.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningAuthority clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningAuthority copyWith(void Function(SigningAuthority) updates) =>
      super.copyWith((message) => updates(message as SigningAuthority))
          as SigningAuthority;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SigningAuthority create() => SigningAuthority._();
  @$core.override
  SigningAuthority createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SigningAuthority getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SigningAuthority>(create);
  static SigningAuthority? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  SigningAuthority_Authority whichAuthority() =>
      _SigningAuthority_AuthorityByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearAuthority() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  MultisigConfig get multisig => $_getN(1);
  @$pb.TagNumber(2)
  set multisig(MultisigConfig value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMultisig() => $_has(1);
  @$pb.TagNumber(2)
  void clearMultisig() => $_clearField(2);
  @$pb.TagNumber(2)
  MultisigConfig ensureMultisig() => $_ensure(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
