// This is a generated file - do not edit.
//
// Generated from common.proto.

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

@$core.Deprecated('Use signatureIntentDescriptor instead')
const SignatureIntent$json = {
  '1': 'SignatureIntent',
  '2': [
    {'1': 'CREATION', '2': 0},
    {'1': 'TRANSFER', '2': 1},
    {'1': 'AGGREGATE', '2': 2},
    {
      '1': 'REFRESH',
      '2': 3,
      '3': {'1': true},
    },
    {
      '1': 'EXTEND',
      '2': 4,
      '3': {'1': true},
    },
  ],
};

/// Descriptor for `SignatureIntent`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List signatureIntentDescriptor = $convert.base64Decode(
    'Cg9TaWduYXR1cmVJbnRlbnQSDAoIQ1JFQVRJT04QABIMCghUUkFOU0ZFUhABEg0KCUFHR1JFR0'
    'FURRACEg8KB1JFRlJFU0gQAxoCCAESDgoGRVhURU5EEAQaAggB');

@$core.Deprecated('Use packageMapDescriptor instead')
const PackageMap$json = {
  '1': 'PackageMap',
  '2': [
    {
      '1': 'packages',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.common.PackageMap.PackagesEntry',
      '10': 'packages'
    },
  ],
  '3': [PackageMap_PackagesEntry$json],
};

@$core.Deprecated('Use packageMapDescriptor instead')
const PackageMap_PackagesEntry$json = {
  '1': 'PackagesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `PackageMap`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List packageMapDescriptor = $convert.base64Decode(
    'CgpQYWNrYWdlTWFwEjwKCHBhY2thZ2VzGAEgAygLMiAuY29tbW9uLlBhY2thZ2VNYXAuUGFja2'
    'FnZXNFbnRyeVIIcGFja2FnZXMaOwoNUGFja2FnZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIU'
    'CgV2YWx1ZRgCIAEoDFIFdmFsdWU6AjgB');

@$core.Deprecated('Use signingCommitmentDescriptor instead')
const SigningCommitment$json = {
  '1': 'SigningCommitment',
  '2': [
    {'1': 'hiding', '3': 1, '4': 1, '5': 12, '10': 'hiding'},
    {'1': 'binding', '3': 2, '4': 1, '5': 12, '10': 'binding'},
  ],
};

/// Descriptor for `SigningCommitment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingCommitmentDescriptor = $convert.base64Decode(
    'ChFTaWduaW5nQ29tbWl0bWVudBIWCgZoaWRpbmcYASABKAxSBmhpZGluZxIYCgdiaW5kaW5nGA'
    'IgASgMUgdiaW5kaW5n');

@$core.Deprecated('Use signingResultDescriptor instead')
const SigningResult$json = {
  '1': 'SigningResult',
  '2': [
    {'1': 'signature_share', '3': 1, '4': 1, '5': 12, '10': 'signatureShare'},
  ],
};

/// Descriptor for `SigningResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingResultDescriptor = $convert.base64Decode(
    'Cg1TaWduaW5nUmVzdWx0EicKD3NpZ25hdHVyZV9zaGFyZRgBIAEoDFIOc2lnbmF0dXJlU2hhcm'
    'U=');
