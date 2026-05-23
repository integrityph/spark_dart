// This is a generated file - do not edit.
//
// Generated from dkg.proto.

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

@$core.Deprecated('Use initiateDkgRequestDescriptor instead')
const InitiateDkgRequest$json = {
  '1': 'InitiateDkgRequest',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 9, '10': 'requestId'},
    {'1': 'key_count', '3': 2, '4': 1, '5': 4, '10': 'keyCount'},
    {'1': 'min_signers', '3': 3, '4': 1, '5': 4, '10': 'minSigners'},
    {'1': 'max_signers', '3': 4, '4': 1, '5': 4, '10': 'maxSigners'},
    {
      '1': 'coordinator_index',
      '3': 5,
      '4': 1,
      '5': 4,
      '10': 'coordinatorIndex'
    },
  ],
};

/// Descriptor for `InitiateDkgRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiateDkgRequestDescriptor = $convert.base64Decode(
    'ChJJbml0aWF0ZURrZ1JlcXVlc3QSHQoKcmVxdWVzdF9pZBgBIAEoCVIJcmVxdWVzdElkEhsKCW'
    'tleV9jb3VudBgCIAEoBFIIa2V5Q291bnQSHwoLbWluX3NpZ25lcnMYAyABKARSCm1pblNpZ25l'
    'cnMSHwoLbWF4X3NpZ25lcnMYBCABKARSCm1heFNpZ25lcnMSKwoRY29vcmRpbmF0b3JfaW5kZX'
    'gYBSABKARSEGNvb3JkaW5hdG9ySW5kZXg=');

@$core.Deprecated('Use initiateDkgResponseDescriptor instead')
const InitiateDkgResponse$json = {
  '1': 'InitiateDkgResponse',
  '2': [
    {'1': 'identifier', '3': 1, '4': 1, '5': 9, '10': 'identifier'},
    {'1': 'round1_package', '3': 2, '4': 3, '5': 12, '10': 'round1Package'},
  ],
};

/// Descriptor for `InitiateDkgResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiateDkgResponseDescriptor = $convert.base64Decode(
    'ChNJbml0aWF0ZURrZ1Jlc3BvbnNlEh4KCmlkZW50aWZpZXIYASABKAlSCmlkZW50aWZpZXISJQ'
    'oOcm91bmQxX3BhY2thZ2UYAiADKAxSDXJvdW5kMVBhY2thZ2U=');

@$core.Deprecated('Use round1PackagesRequestDescriptor instead')
const Round1PackagesRequest$json = {
  '1': 'Round1PackagesRequest',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 9, '10': 'requestId'},
    {
      '1': 'round1_packages',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.common.PackageMap',
      '10': 'round1Packages'
    },
  ],
};

/// Descriptor for `Round1PackagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List round1PackagesRequestDescriptor = $convert.base64Decode(
    'ChVSb3VuZDFQYWNrYWdlc1JlcXVlc3QSHQoKcmVxdWVzdF9pZBgBIAEoCVIJcmVxdWVzdElkEj'
    'sKD3JvdW5kMV9wYWNrYWdlcxgCIAMoCzISLmNvbW1vbi5QYWNrYWdlTWFwUg5yb3VuZDFQYWNr'
    'YWdlcw==');

@$core.Deprecated('Use round1PackagesResponseDescriptor instead')
const Round1PackagesResponse$json = {
  '1': 'Round1PackagesResponse',
  '2': [
    {'1': 'identifier', '3': 1, '4': 1, '5': 9, '10': 'identifier'},
    {'1': 'round1_signature', '3': 2, '4': 1, '5': 12, '10': 'round1Signature'},
  ],
};

/// Descriptor for `Round1PackagesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List round1PackagesResponseDescriptor =
    $convert.base64Decode(
        'ChZSb3VuZDFQYWNrYWdlc1Jlc3BvbnNlEh4KCmlkZW50aWZpZXIYASABKAlSCmlkZW50aWZpZX'
        'ISKQoQcm91bmQxX3NpZ25hdHVyZRgCIAEoDFIPcm91bmQxU2lnbmF0dXJl');

@$core.Deprecated('Use round1SignatureRequestDescriptor instead')
const Round1SignatureRequest$json = {
  '1': 'Round1SignatureRequest',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 9, '10': 'requestId'},
    {
      '1': 'round1_signatures',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.dkg.Round1SignatureRequest.Round1SignaturesEntry',
      '10': 'round1Signatures'
    },
  ],
  '3': [Round1SignatureRequest_Round1SignaturesEntry$json],
};

@$core.Deprecated('Use round1SignatureRequestDescriptor instead')
const Round1SignatureRequest_Round1SignaturesEntry$json = {
  '1': 'Round1SignaturesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Round1SignatureRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List round1SignatureRequestDescriptor = $convert.base64Decode(
    'ChZSb3VuZDFTaWduYXR1cmVSZXF1ZXN0Eh0KCnJlcXVlc3RfaWQYASABKAlSCXJlcXVlc3RJZB'
    'JeChFyb3VuZDFfc2lnbmF0dXJlcxgCIAMoCzIxLmRrZy5Sb3VuZDFTaWduYXR1cmVSZXF1ZXN0'
    'LlJvdW5kMVNpZ25hdHVyZXNFbnRyeVIQcm91bmQxU2lnbmF0dXJlcxpDChVSb3VuZDFTaWduYX'
    'R1cmVzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAxSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use round1SignatureResponseDescriptor instead')
const Round1SignatureResponse$json = {
  '1': 'Round1SignatureResponse',
  '2': [
    {'1': 'identifier', '3': 1, '4': 1, '5': 9, '10': 'identifier'},
    {
      '1': 'validation_failures',
      '3': 2,
      '4': 3,
      '5': 9,
      '10': 'validationFailures'
    },
  ],
};

/// Descriptor for `Round1SignatureResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List round1SignatureResponseDescriptor = $convert.base64Decode(
    'ChdSb3VuZDFTaWduYXR1cmVSZXNwb25zZRIeCgppZGVudGlmaWVyGAEgASgJUgppZGVudGlmaW'
    'VyEi8KE3ZhbGlkYXRpb25fZmFpbHVyZXMYAiADKAlSEnZhbGlkYXRpb25GYWlsdXJlcw==');

@$core.Deprecated('Use round2PackagesRequestDescriptor instead')
const Round2PackagesRequest$json = {
  '1': 'Round2PackagesRequest',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 9, '10': 'requestId'},
    {'1': 'identifier', '3': 2, '4': 1, '5': 9, '10': 'identifier'},
    {'1': 'round2_packages', '3': 3, '4': 3, '5': 12, '10': 'round2Packages'},
    {'1': 'round2_signature', '3': 4, '4': 1, '5': 12, '10': 'round2Signature'},
  ],
};

/// Descriptor for `Round2PackagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List round2PackagesRequestDescriptor = $convert.base64Decode(
    'ChVSb3VuZDJQYWNrYWdlc1JlcXVlc3QSHQoKcmVxdWVzdF9pZBgBIAEoCVIJcmVxdWVzdElkEh'
    '4KCmlkZW50aWZpZXIYAiABKAlSCmlkZW50aWZpZXISJwoPcm91bmQyX3BhY2thZ2VzGAMgAygM'
    'Ug5yb3VuZDJQYWNrYWdlcxIpChByb3VuZDJfc2lnbmF0dXJlGAQgASgMUg9yb3VuZDJTaWduYX'
    'R1cmU=');

@$core.Deprecated('Use round2PackagesResponseDescriptor instead')
const Round2PackagesResponse$json = {
  '1': 'Round2PackagesResponse',
};

/// Descriptor for `Round2PackagesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List round2PackagesResponseDescriptor =
    $convert.base64Decode('ChZSb3VuZDJQYWNrYWdlc1Jlc3BvbnNl');

@$core.Deprecated('Use roundConfirmationRequestDescriptor instead')
const RoundConfirmationRequest$json = {
  '1': 'RoundConfirmationRequest',
  '2': [
    {'1': 'key_ids', '3': 1, '4': 3, '5': 9, '10': 'keyIds'},
  ],
};

/// Descriptor for `RoundConfirmationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roundConfirmationRequestDescriptor =
    $convert.base64Decode(
        'ChhSb3VuZENvbmZpcm1hdGlvblJlcXVlc3QSFwoHa2V5X2lkcxgBIAMoCVIGa2V5SWRz');

@$core.Deprecated('Use roundConfirmationResponseDescriptor instead')
const RoundConfirmationResponse$json = {
  '1': 'RoundConfirmationResponse',
  '2': [
    {'1': 'available_key_ids', '3': 1, '4': 3, '5': 9, '10': 'availableKeyIds'},
    {
      '1': 'unavailable_key_ids',
      '3': 2,
      '4': 3,
      '5': 9,
      '10': 'unavailableKeyIds'
    },
  ],
};

/// Descriptor for `RoundConfirmationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roundConfirmationResponseDescriptor = $convert.base64Decode(
    'ChlSb3VuZENvbmZpcm1hdGlvblJlc3BvbnNlEioKEWF2YWlsYWJsZV9rZXlfaWRzGAEgAygJUg'
    '9hdmFpbGFibGVLZXlJZHMSLgoTdW5hdmFpbGFibGVfa2V5X2lkcxgCIAMoCVIRdW5hdmFpbGFi'
    'bGVLZXlJZHM=');

@$core.Deprecated('Use startDkgRequestDescriptor instead')
const StartDkgRequest$json = {
  '1': 'StartDkgRequest',
  '2': [
    {'1': 'count', '3': 1, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `StartDkgRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startDkgRequestDescriptor = $convert
    .base64Decode('Cg9TdGFydERrZ1JlcXVlc3QSFAoFY291bnQYASABKAVSBWNvdW50');
