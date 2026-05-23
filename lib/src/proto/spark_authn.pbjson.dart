// This is a generated file - do not edit.
//
// Generated from spark_authn.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use challengeDescriptor instead')
const Challenge$json = {
  '1': 'Challenge',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 5, '10': 'version'},
    {'1': 'timestamp', '3': 2, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'nonce', '3': 3, '4': 1, '5': 12, '10': 'nonce'},
    {'1': 'public_key', '3': 4, '4': 1, '5': 12, '10': 'publicKey'},
  ],
};

/// Descriptor for `Challenge`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List challengeDescriptor = $convert.base64Decode(
    'CglDaGFsbGVuZ2USGAoHdmVyc2lvbhgBIAEoBVIHdmVyc2lvbhIcCgl0aW1lc3RhbXAYAiABKA'
    'NSCXRpbWVzdGFtcBIUCgVub25jZRgDIAEoDFIFbm9uY2USHQoKcHVibGljX2tleRgEIAEoDFIJ'
    'cHVibGljS2V5');

@$core.Deprecated('Use protectedChallengeDescriptor instead')
const ProtectedChallenge$json = {
  '1': 'ProtectedChallenge',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 5, '10': 'version'},
    {
      '1': 'challenge',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark_authn.Challenge',
      '10': 'challenge'
    },
    {'1': 'server_hmac', '3': 3, '4': 1, '5': 12, '10': 'serverHmac'},
  ],
};

/// Descriptor for `ProtectedChallenge`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protectedChallengeDescriptor = $convert.base64Decode(
    'ChJQcm90ZWN0ZWRDaGFsbGVuZ2USGAoHdmVyc2lvbhgBIAEoBVIHdmVyc2lvbhI0CgljaGFsbG'
    'VuZ2UYAiABKAsyFi5zcGFya19hdXRobi5DaGFsbGVuZ2VSCWNoYWxsZW5nZRIfCgtzZXJ2ZXJf'
    'aG1hYxgDIAEoDFIKc2VydmVySG1hYw==');

@$core.Deprecated('Use getChallengeRequestDescriptor instead')
const GetChallengeRequest$json = {
  '1': 'GetChallengeRequest',
  '2': [
    {'1': 'public_key', '3': 1, '4': 1, '5': 12, '10': 'publicKey'},
  ],
};

/// Descriptor for `GetChallengeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChallengeRequestDescriptor = $convert.base64Decode(
    'ChNHZXRDaGFsbGVuZ2VSZXF1ZXN0Eh0KCnB1YmxpY19rZXkYASABKAxSCXB1YmxpY0tleQ==');

@$core.Deprecated('Use getChallengeResponseDescriptor instead')
const GetChallengeResponse$json = {
  '1': 'GetChallengeResponse',
  '2': [
    {
      '1': 'protected_challenge',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark_authn.ProtectedChallenge',
      '10': 'protectedChallenge'
    },
  ],
};

/// Descriptor for `GetChallengeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChallengeResponseDescriptor = $convert.base64Decode(
    'ChRHZXRDaGFsbGVuZ2VSZXNwb25zZRJQChNwcm90ZWN0ZWRfY2hhbGxlbmdlGAEgASgLMh8uc3'
    'BhcmtfYXV0aG4uUHJvdGVjdGVkQ2hhbGxlbmdlUhJwcm90ZWN0ZWRDaGFsbGVuZ2U=');

@$core.Deprecated('Use verifyChallengeRequestDescriptor instead')
const VerifyChallengeRequest$json = {
  '1': 'VerifyChallengeRequest',
  '2': [
    {
      '1': 'protected_challenge',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark_authn.ProtectedChallenge',
      '10': 'protectedChallenge'
    },
    {'1': 'signature', '3': 2, '4': 1, '5': 12, '10': 'signature'},
    {'1': 'public_key', '3': 3, '4': 1, '5': 12, '10': 'publicKey'},
  ],
};

/// Descriptor for `VerifyChallengeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyChallengeRequestDescriptor = $convert.base64Decode(
    'ChZWZXJpZnlDaGFsbGVuZ2VSZXF1ZXN0ElAKE3Byb3RlY3RlZF9jaGFsbGVuZ2UYASABKAsyHy'
    '5zcGFya19hdXRobi5Qcm90ZWN0ZWRDaGFsbGVuZ2VSEnByb3RlY3RlZENoYWxsZW5nZRIcCglz'
    'aWduYXR1cmUYAiABKAxSCXNpZ25hdHVyZRIdCgpwdWJsaWNfa2V5GAMgASgMUglwdWJsaWNLZX'
    'k=');

@$core.Deprecated('Use verifyChallengeResponseDescriptor instead')
const VerifyChallengeResponse$json = {
  '1': 'VerifyChallengeResponse',
  '2': [
    {'1': 'session_token', '3': 1, '4': 1, '5': 9, '10': 'sessionToken'},
    {
      '1': 'expiration_timestamp',
      '3': 2,
      '4': 1,
      '5': 3,
      '10': 'expirationTimestamp'
    },
  ],
};

/// Descriptor for `VerifyChallengeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyChallengeResponseDescriptor = $convert.base64Decode(
    'ChdWZXJpZnlDaGFsbGVuZ2VSZXNwb25zZRIjCg1zZXNzaW9uX3Rva2VuGAEgASgJUgxzZXNzaW'
    '9uVG9rZW4SMQoUZXhwaXJhdGlvbl90aW1lc3RhbXAYAiABKANSE2V4cGlyYXRpb25UaW1lc3Rh'
    'bXA=');
