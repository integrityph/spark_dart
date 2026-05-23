// This is a generated file - do not edit.
//
// Generated from spark_authn.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// Challenge represents the core challenge data
class Challenge extends $pb.GeneratedMessage {
  factory Challenge({
    $core.int? version,
    $fixnum.Int64? timestamp,
    $core.List<$core.int>? nonce,
    $core.List<$core.int>? publicKey,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (timestamp != null) result.timestamp = timestamp;
    if (nonce != null) result.nonce = nonce;
    if (publicKey != null) result.publicKey = publicKey;
    return result;
  }

  Challenge._();

  factory Challenge.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Challenge.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Challenge',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_authn'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'version')
    ..aInt64(2, _omitFieldNames ? '' : 'timestamp')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'nonce', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Challenge clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Challenge copyWith(void Function(Challenge) updates) =>
      super.copyWith((message) => updates(message as Challenge)) as Challenge;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Challenge create() => Challenge._();
  @$core.override
  Challenge createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Challenge getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Challenge>(create);
  static Challenge? _defaultInstance;

  /// Protocol version for backward compatibility
  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  /// Timestamp when challenge was issued (UTC Unix seconds)
  @$pb.TagNumber(2)
  $fixnum.Int64 get timestamp => $_getI64(1);
  @$pb.TagNumber(2)
  set timestamp($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestamp() => $_clearField(2);

  /// Random nonce to prevent replay attacks (32 bytes)
  @$pb.TagNumber(3)
  $core.List<$core.int> get nonce => $_getN(2);
  @$pb.TagNumber(3)
  set nonce($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNonce() => $_has(2);
  @$pb.TagNumber(3)
  void clearNonce() => $_clearField(3);

  /// The public key this challenge is intended for (uncompressed secp256k1 public key)
  @$pb.TagNumber(4)
  $core.List<$core.int> get publicKey => $_getN(3);
  @$pb.TagNumber(4)
  set publicKey($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPublicKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearPublicKey() => $_clearField(4);
}

/// ProtectedChallenge wraps a Challenge with a server HMAC
class ProtectedChallenge extends $pb.GeneratedMessage {
  factory ProtectedChallenge({
    $core.int? version,
    Challenge? challenge,
    $core.List<$core.int>? serverHmac,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (challenge != null) result.challenge = challenge;
    if (serverHmac != null) result.serverHmac = serverHmac;
    return result;
  }

  ProtectedChallenge._();

  factory ProtectedChallenge.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtectedChallenge.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtectedChallenge',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_authn'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'version')
    ..aOM<Challenge>(2, _omitFieldNames ? '' : 'challenge',
        subBuilder: Challenge.create)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'serverHmac', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtectedChallenge clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtectedChallenge copyWith(void Function(ProtectedChallenge) updates) =>
      super.copyWith((message) => updates(message as ProtectedChallenge))
          as ProtectedChallenge;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtectedChallenge create() => ProtectedChallenge._();
  @$core.override
  ProtectedChallenge createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProtectedChallenge getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtectedChallenge>(create);
  static ProtectedChallenge? _defaultInstance;

  /// Protocol version for backward compatibility
  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  /// The core challenge data
  @$pb.TagNumber(2)
  Challenge get challenge => $_getN(1);
  @$pb.TagNumber(2)
  set challenge(Challenge value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasChallenge() => $_has(1);
  @$pb.TagNumber(2)
  void clearChallenge() => $_clearField(2);
  @$pb.TagNumber(2)
  Challenge ensureChallenge() => $_ensure(1);

  /// Server's HMAC of the Challenge
  @$pb.TagNumber(3)
  $core.List<$core.int> get serverHmac => $_getN(2);
  @$pb.TagNumber(3)
  set serverHmac($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasServerHmac() => $_has(2);
  @$pb.TagNumber(3)
  void clearServerHmac() => $_clearField(3);
}

/// Request to initiate an authentication challenge
class GetChallengeRequest extends $pb.GeneratedMessage {
  factory GetChallengeRequest({
    $core.List<$core.int>? publicKey,
  }) {
    final result = create();
    if (publicKey != null) result.publicKey = publicKey;
    return result;
  }

  GetChallengeRequest._();

  factory GetChallengeRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetChallengeRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetChallengeRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_authn'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetChallengeRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetChallengeRequest copyWith(void Function(GetChallengeRequest) updates) =>
      super.copyWith((message) => updates(message as GetChallengeRequest))
          as GetChallengeRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChallengeRequest create() => GetChallengeRequest._();
  @$core.override
  GetChallengeRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetChallengeRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetChallengeRequest>(create);
  static GetChallengeRequest? _defaultInstance;

  /// Client's public key (uncompressed secp256k1 public key)
  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => $_clearField(1);
}

/// Response containing the protected challenge
class GetChallengeResponse extends $pb.GeneratedMessage {
  factory GetChallengeResponse({
    ProtectedChallenge? protectedChallenge,
  }) {
    final result = create();
    if (protectedChallenge != null)
      result.protectedChallenge = protectedChallenge;
    return result;
  }

  GetChallengeResponse._();

  factory GetChallengeResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetChallengeResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetChallengeResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_authn'),
      createEmptyInstance: create)
    ..aOM<ProtectedChallenge>(1, _omitFieldNames ? '' : 'protectedChallenge',
        subBuilder: ProtectedChallenge.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetChallengeResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetChallengeResponse copyWith(void Function(GetChallengeResponse) updates) =>
      super.copyWith((message) => updates(message as GetChallengeResponse))
          as GetChallengeResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChallengeResponse create() => GetChallengeResponse._();
  @$core.override
  GetChallengeResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetChallengeResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetChallengeResponse>(create);
  static GetChallengeResponse? _defaultInstance;

  /// The protected challenge from the server
  @$pb.TagNumber(1)
  ProtectedChallenge get protectedChallenge => $_getN(0);
  @$pb.TagNumber(1)
  set protectedChallenge(ProtectedChallenge value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProtectedChallenge() => $_has(0);
  @$pb.TagNumber(1)
  void clearProtectedChallenge() => $_clearField(1);
  @$pb.TagNumber(1)
  ProtectedChallenge ensureProtectedChallenge() => $_ensure(0);
}

/// Request to verify a signed challenge
class VerifyChallengeRequest extends $pb.GeneratedMessage {
  factory VerifyChallengeRequest({
    ProtectedChallenge? protectedChallenge,
    $core.List<$core.int>? signature,
    $core.List<$core.int>? publicKey,
  }) {
    final result = create();
    if (protectedChallenge != null)
      result.protectedChallenge = protectedChallenge;
    if (signature != null) result.signature = signature;
    if (publicKey != null) result.publicKey = publicKey;
    return result;
  }

  VerifyChallengeRequest._();

  factory VerifyChallengeRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VerifyChallengeRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VerifyChallengeRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_authn'),
      createEmptyInstance: create)
    ..aOM<ProtectedChallenge>(1, _omitFieldNames ? '' : 'protectedChallenge',
        subBuilder: ProtectedChallenge.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VerifyChallengeRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VerifyChallengeRequest copyWith(
          void Function(VerifyChallengeRequest) updates) =>
      super.copyWith((message) => updates(message as VerifyChallengeRequest))
          as VerifyChallengeRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyChallengeRequest create() => VerifyChallengeRequest._();
  @$core.override
  VerifyChallengeRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VerifyChallengeRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VerifyChallengeRequest>(create);
  static VerifyChallengeRequest? _defaultInstance;

  /// The protected challenge from the server
  @$pb.TagNumber(1)
  ProtectedChallenge get protectedChallenge => $_getN(0);
  @$pb.TagNumber(1)
  set protectedChallenge(ProtectedChallenge value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProtectedChallenge() => $_has(0);
  @$pb.TagNumber(1)
  void clearProtectedChallenge() => $_clearField(1);
  @$pb.TagNumber(1)
  ProtectedChallenge ensureProtectedChallenge() => $_ensure(0);

  /// Client's secp256k1 signature of the Challenge
  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);

  /// Client's public key (uncompressed secp256k1 public key)
  @$pb.TagNumber(3)
  $core.List<$core.int> get publicKey => $_getN(2);
  @$pb.TagNumber(3)
  set publicKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearPublicKey() => $_clearField(3);
}

/// Response after successful authentication
class VerifyChallengeResponse extends $pb.GeneratedMessage {
  factory VerifyChallengeResponse({
    $core.String? sessionToken,
    $fixnum.Int64? expirationTimestamp,
  }) {
    final result = create();
    if (sessionToken != null) result.sessionToken = sessionToken;
    if (expirationTimestamp != null)
      result.expirationTimestamp = expirationTimestamp;
    return result;
  }

  VerifyChallengeResponse._();

  factory VerifyChallengeResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VerifyChallengeResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VerifyChallengeResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark_authn'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sessionToken')
    ..aInt64(2, _omitFieldNames ? '' : 'expirationTimestamp')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VerifyChallengeResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VerifyChallengeResponse copyWith(
          void Function(VerifyChallengeResponse) updates) =>
      super.copyWith((message) => updates(message as VerifyChallengeResponse))
          as VerifyChallengeResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyChallengeResponse create() => VerifyChallengeResponse._();
  @$core.override
  VerifyChallengeResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VerifyChallengeResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VerifyChallengeResponse>(create);
  static VerifyChallengeResponse? _defaultInstance;

  /// Session token for subsequent API calls
  @$pb.TagNumber(1)
  $core.String get sessionToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionToken($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionToken() => $_clearField(1);

  /// Token expiration timestamp (UTC Unix seconds)
  @$pb.TagNumber(2)
  $fixnum.Int64 get expirationTimestamp => $_getI64(1);
  @$pb.TagNumber(2)
  set expirationTimestamp($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasExpirationTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpirationTimestamp() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
