// This is a generated file - do not edit.
//
// Generated from spark_authn_internal.proto.

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

@$core.Deprecated('Use sessionDescriptor instead')
const Session$json = {
  '1': 'Session',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 5, '10': 'version'},
    {
      '1': 'expiration_timestamp',
      '3': 2,
      '4': 1,
      '5': 3,
      '10': 'expirationTimestamp'
    },
    {'1': 'nonce', '3': 3, '4': 1, '5': 12, '10': 'nonce'},
    {'1': 'public_key', '3': 4, '4': 1, '5': 12, '10': 'publicKey'},
  ],
};

/// Descriptor for `Session`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionDescriptor = $convert.base64Decode(
    'CgdTZXNzaW9uEhgKB3ZlcnNpb24YASABKAVSB3ZlcnNpb24SMQoUZXhwaXJhdGlvbl90aW1lc3'
    'RhbXAYAiABKANSE2V4cGlyYXRpb25UaW1lc3RhbXASFAoFbm9uY2UYAyABKAxSBW5vbmNlEh0K'
    'CnB1YmxpY19rZXkYBCABKAxSCXB1YmxpY0tleQ==');

@$core.Deprecated('Use protectedSessionDescriptor instead')
const ProtectedSession$json = {
  '1': 'ProtectedSession',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 5, '10': 'version'},
    {
      '1': 'session',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark_authn.Session',
      '10': 'session'
    },
    {'1': 'hmac', '3': 3, '4': 1, '5': 12, '10': 'hmac'},
  ],
};

/// Descriptor for `ProtectedSession`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protectedSessionDescriptor = $convert.base64Decode(
    'ChBQcm90ZWN0ZWRTZXNzaW9uEhgKB3ZlcnNpb24YASABKAVSB3ZlcnNpb24SLgoHc2Vzc2lvbh'
    'gCIAEoCzIULnNwYXJrX2F1dGhuLlNlc3Npb25SB3Nlc3Npb24SEgoEaG1hYxgDIAEoDFIEaG1h'
    'Yw==');
