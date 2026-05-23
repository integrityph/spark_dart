// This is a generated file - do not edit.
//
// Generated from frost.proto.

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

@$core.Deprecated('Use signingRoleDescriptor instead')
const SigningRole$json = {
  '1': 'SigningRole',
  '2': [
    {'1': 'STATECHAIN', '2': 0},
    {'1': 'USER', '2': 1},
  ],
};

/// Descriptor for `SigningRole`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List signingRoleDescriptor = $convert
    .base64Decode('CgtTaWduaW5nUm9sZRIOCgpTVEFURUNIQUlOEAASCAoEVVNFUhAB');

@$core.Deprecated('Use echoRequestDescriptor instead')
const EchoRequest$json = {
  '1': 'EchoRequest',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `EchoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List echoRequestDescriptor = $convert
    .base64Decode('CgtFY2hvUmVxdWVzdBIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use echoResponseDescriptor instead')
const EchoResponse$json = {
  '1': 'EchoResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `EchoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List echoResponseDescriptor = $convert
    .base64Decode('CgxFY2hvUmVzcG9uc2USGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use dkgRound1RequestDescriptor instead')
const DkgRound1Request$json = {
  '1': 'DkgRound1Request',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 9, '10': 'requestId'},
    {'1': 'identifier', '3': 2, '4': 1, '5': 9, '10': 'identifier'},
    {'1': 'max_signers', '3': 3, '4': 1, '5': 4, '10': 'maxSigners'},
    {'1': 'min_signers', '3': 4, '4': 1, '5': 4, '10': 'minSigners'},
    {'1': 'key_count', '3': 5, '4': 1, '5': 4, '10': 'keyCount'},
  ],
};

/// Descriptor for `DkgRound1Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dkgRound1RequestDescriptor = $convert.base64Decode(
    'ChBEa2dSb3VuZDFSZXF1ZXN0Eh0KCnJlcXVlc3RfaWQYASABKAlSCXJlcXVlc3RJZBIeCgppZG'
    'VudGlmaWVyGAIgASgJUgppZGVudGlmaWVyEh8KC21heF9zaWduZXJzGAMgASgEUgptYXhTaWdu'
    'ZXJzEh8KC21pbl9zaWduZXJzGAQgASgEUgptaW5TaWduZXJzEhsKCWtleV9jb3VudBgFIAEoBF'
    'IIa2V5Q291bnQ=');

@$core.Deprecated('Use dkgRound1ResponseDescriptor instead')
const DkgRound1Response$json = {
  '1': 'DkgRound1Response',
  '2': [
    {'1': 'round1_packages', '3': 1, '4': 3, '5': 12, '10': 'round1Packages'},
  ],
};

/// Descriptor for `DkgRound1Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dkgRound1ResponseDescriptor = $convert.base64Decode(
    'ChFEa2dSb3VuZDFSZXNwb25zZRInCg9yb3VuZDFfcGFja2FnZXMYASADKAxSDnJvdW5kMVBhY2'
    'thZ2Vz');

@$core.Deprecated('Use dkgRound2RequestDescriptor instead')
const DkgRound2Request$json = {
  '1': 'DkgRound2Request',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 9, '10': 'requestId'},
    {
      '1': 'round1_packages_maps',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.common.PackageMap',
      '10': 'round1PackagesMaps'
    },
  ],
};

/// Descriptor for `DkgRound2Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dkgRound2RequestDescriptor = $convert.base64Decode(
    'ChBEa2dSb3VuZDJSZXF1ZXN0Eh0KCnJlcXVlc3RfaWQYASABKAlSCXJlcXVlc3RJZBJEChRyb3'
    'VuZDFfcGFja2FnZXNfbWFwcxgCIAMoCzISLmNvbW1vbi5QYWNrYWdlTWFwUhJyb3VuZDFQYWNr'
    'YWdlc01hcHM=');

@$core.Deprecated('Use dkgRound2ResponseDescriptor instead')
const DkgRound2Response$json = {
  '1': 'DkgRound2Response',
  '2': [
    {
      '1': 'round2_packages',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.common.PackageMap',
      '10': 'round2Packages'
    },
  ],
};

/// Descriptor for `DkgRound2Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dkgRound2ResponseDescriptor = $convert.base64Decode(
    'ChFEa2dSb3VuZDJSZXNwb25zZRI7Cg9yb3VuZDJfcGFja2FnZXMYASADKAsyEi5jb21tb24uUG'
    'Fja2FnZU1hcFIOcm91bmQyUGFja2FnZXM=');

@$core.Deprecated('Use dkgRound3RequestDescriptor instead')
const DkgRound3Request$json = {
  '1': 'DkgRound3Request',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 9, '10': 'requestId'},
    {
      '1': 'round1_packages_maps',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.common.PackageMap',
      '10': 'round1PackagesMaps'
    },
    {
      '1': 'round2_packages_maps',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.common.PackageMap',
      '10': 'round2PackagesMaps'
    },
  ],
};

/// Descriptor for `DkgRound3Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dkgRound3RequestDescriptor = $convert.base64Decode(
    'ChBEa2dSb3VuZDNSZXF1ZXN0Eh0KCnJlcXVlc3RfaWQYASABKAlSCXJlcXVlc3RJZBJEChRyb3'
    'VuZDFfcGFja2FnZXNfbWFwcxgCIAMoCzISLmNvbW1vbi5QYWNrYWdlTWFwUhJyb3VuZDFQYWNr'
    'YWdlc01hcHMSRAoUcm91bmQyX3BhY2thZ2VzX21hcHMYAyADKAsyEi5jb21tb24uUGFja2FnZU'
    '1hcFIScm91bmQyUGFja2FnZXNNYXBz');

@$core.Deprecated('Use keyPackageDescriptor instead')
const KeyPackage$json = {
  '1': 'KeyPackage',
  '2': [
    {'1': 'identifier', '3': 1, '4': 1, '5': 9, '10': 'identifier'},
    {'1': 'secret_share', '3': 2, '4': 1, '5': 12, '10': 'secretShare'},
    {
      '1': 'public_shares',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.frost.KeyPackage.PublicSharesEntry',
      '10': 'publicShares'
    },
    {'1': 'public_key', '3': 4, '4': 1, '5': 12, '10': 'publicKey'},
    {'1': 'min_signers', '3': 5, '4': 1, '5': 13, '10': 'minSigners'},
  ],
  '3': [KeyPackage_PublicSharesEntry$json],
};

@$core.Deprecated('Use keyPackageDescriptor instead')
const KeyPackage_PublicSharesEntry$json = {
  '1': 'PublicSharesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `KeyPackage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keyPackageDescriptor = $convert.base64Decode(
    'CgpLZXlQYWNrYWdlEh4KCmlkZW50aWZpZXIYASABKAlSCmlkZW50aWZpZXISIQoMc2VjcmV0X3'
    'NoYXJlGAIgASgMUgtzZWNyZXRTaGFyZRJICg1wdWJsaWNfc2hhcmVzGAMgAygLMiMuZnJvc3Qu'
    'S2V5UGFja2FnZS5QdWJsaWNTaGFyZXNFbnRyeVIMcHVibGljU2hhcmVzEh0KCnB1YmxpY19rZX'
    'kYBCABKAxSCXB1YmxpY0tleRIfCgttaW5fc2lnbmVycxgFIAEoDVIKbWluU2lnbmVycxo/ChFQ'
    'dWJsaWNTaGFyZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoDFIFdmFsdW'
    'U6AjgB');

@$core.Deprecated('Use dkgRound3ResponseDescriptor instead')
const DkgRound3Response$json = {
  '1': 'DkgRound3Response',
  '2': [
    {
      '1': 'key_packages',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.frost.KeyPackage',
      '10': 'keyPackages'
    },
  ],
};

/// Descriptor for `DkgRound3Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dkgRound3ResponseDescriptor = $convert.base64Decode(
    'ChFEa2dSb3VuZDNSZXNwb25zZRI0CgxrZXlfcGFja2FnZXMYASADKAsyES5mcm9zdC5LZXlQYW'
    'NrYWdlUgtrZXlQYWNrYWdlcw==');

@$core.Deprecated('Use signingNonceDescriptor instead')
const SigningNonce$json = {
  '1': 'SigningNonce',
  '2': [
    {'1': 'hiding', '3': 1, '4': 1, '5': 12, '10': 'hiding'},
    {'1': 'binding', '3': 2, '4': 1, '5': 12, '10': 'binding'},
  ],
};

/// Descriptor for `SigningNonce`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingNonceDescriptor = $convert.base64Decode(
    'CgxTaWduaW5nTm9uY2USFgoGaGlkaW5nGAEgASgMUgZoaWRpbmcSGAoHYmluZGluZxgCIAEoDF'
    'IHYmluZGluZw==');

@$core.Deprecated('Use frostNonceRequestDescriptor instead')
const FrostNonceRequest$json = {
  '1': 'FrostNonceRequest',
  '2': [
    {
      '1': 'key_packages',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.frost.KeyPackage',
      '10': 'keyPackages'
    },
  ],
};

/// Descriptor for `FrostNonceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List frostNonceRequestDescriptor = $convert.base64Decode(
    'ChFGcm9zdE5vbmNlUmVxdWVzdBI0CgxrZXlfcGFja2FnZXMYASADKAsyES5mcm9zdC5LZXlQYW'
    'NrYWdlUgtrZXlQYWNrYWdlcw==');

@$core.Deprecated('Use signingNonceResultDescriptor instead')
const SigningNonceResult$json = {
  '1': 'SigningNonceResult',
  '2': [
    {
      '1': 'nonces',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.frost.SigningNonce',
      '10': 'nonces'
    },
    {
      '1': 'commitments',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.common.SigningCommitment',
      '10': 'commitments'
    },
  ],
};

/// Descriptor for `SigningNonceResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingNonceResultDescriptor = $convert.base64Decode(
    'ChJTaWduaW5nTm9uY2VSZXN1bHQSKwoGbm9uY2VzGAEgASgLMhMuZnJvc3QuU2lnbmluZ05vbm'
    'NlUgZub25jZXMSOwoLY29tbWl0bWVudHMYAiABKAsyGS5jb21tb24uU2lnbmluZ0NvbW1pdG1l'
    'bnRSC2NvbW1pdG1lbnRz');

@$core.Deprecated('Use frostNonceResponseDescriptor instead')
const FrostNonceResponse$json = {
  '1': 'FrostNonceResponse',
  '2': [
    {
      '1': 'results',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.frost.SigningNonceResult',
      '10': 'results'
    },
  ],
};

/// Descriptor for `FrostNonceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List frostNonceResponseDescriptor = $convert.base64Decode(
    'ChJGcm9zdE5vbmNlUmVzcG9uc2USMwoHcmVzdWx0cxgBIAMoCzIZLmZyb3N0LlNpZ25pbmdOb2'
    '5jZVJlc3VsdFIHcmVzdWx0cw==');

@$core.Deprecated('Use frostSigningJobDescriptor instead')
const FrostSigningJob$json = {
  '1': 'FrostSigningJob',
  '2': [
    {'1': 'job_id', '3': 1, '4': 1, '5': 9, '10': 'jobId'},
    {'1': 'message', '3': 2, '4': 1, '5': 12, '10': 'message'},
    {
      '1': 'key_package',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.frost.KeyPackage',
      '10': 'keyPackage'
    },
    {'1': 'verifying_key', '3': 4, '4': 1, '5': 12, '10': 'verifyingKey'},
    {
      '1': 'nonce',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.frost.SigningNonce',
      '10': 'nonce'
    },
    {
      '1': 'commitments',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.frost.FrostSigningJob.CommitmentsEntry',
      '10': 'commitments'
    },
    {
      '1': 'user_commitments',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.common.SigningCommitment',
      '10': 'userCommitments'
    },
    {
      '1': 'adaptor_public_key',
      '3': 8,
      '4': 1,
      '5': 12,
      '10': 'adaptorPublicKey'
    },
  ],
  '3': [FrostSigningJob_CommitmentsEntry$json],
};

@$core.Deprecated('Use frostSigningJobDescriptor instead')
const FrostSigningJob_CommitmentsEntry$json = {
  '1': 'CommitmentsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.common.SigningCommitment',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `FrostSigningJob`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List frostSigningJobDescriptor = $convert.base64Decode(
    'Cg9Gcm9zdFNpZ25pbmdKb2ISFQoGam9iX2lkGAEgASgJUgVqb2JJZBIYCgdtZXNzYWdlGAIgAS'
    'gMUgdtZXNzYWdlEjIKC2tleV9wYWNrYWdlGAMgASgLMhEuZnJvc3QuS2V5UGFja2FnZVIKa2V5'
    'UGFja2FnZRIjCg12ZXJpZnlpbmdfa2V5GAQgASgMUgx2ZXJpZnlpbmdLZXkSKQoFbm9uY2UYBS'
    'ABKAsyEy5mcm9zdC5TaWduaW5nTm9uY2VSBW5vbmNlEkkKC2NvbW1pdG1lbnRzGAYgAygLMicu'
    'ZnJvc3QuRnJvc3RTaWduaW5nSm9iLkNvbW1pdG1lbnRzRW50cnlSC2NvbW1pdG1lbnRzEkQKEH'
    'VzZXJfY29tbWl0bWVudHMYByABKAsyGS5jb21tb24uU2lnbmluZ0NvbW1pdG1lbnRSD3VzZXJD'
    'b21taXRtZW50cxIsChJhZGFwdG9yX3B1YmxpY19rZXkYCCABKAxSEGFkYXB0b3JQdWJsaWNLZX'
    'kaWQoQQ29tbWl0bWVudHNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIvCgV2YWx1ZRgCIAEoCzIZ'
    'LmNvbW1vbi5TaWduaW5nQ29tbWl0bWVudFIFdmFsdWU6AjgB');

@$core.Deprecated('Use signFrostRequestDescriptor instead')
const SignFrostRequest$json = {
  '1': 'SignFrostRequest',
  '2': [
    {
      '1': 'signing_jobs',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.frost.FrostSigningJob',
      '10': 'signingJobs'
    },
    {
      '1': 'role',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.frost.SigningRole',
      '10': 'role'
    },
  ],
};

/// Descriptor for `SignFrostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signFrostRequestDescriptor = $convert.base64Decode(
    'ChBTaWduRnJvc3RSZXF1ZXN0EjkKDHNpZ25pbmdfam9icxgBIAMoCzIWLmZyb3N0LkZyb3N0U2'
    'lnbmluZ0pvYlILc2lnbmluZ0pvYnMSJgoEcm9sZRgCIAEoDjISLmZyb3N0LlNpZ25pbmdSb2xl'
    'UgRyb2xl');

@$core.Deprecated('Use signFrostResponseDescriptor instead')
const SignFrostResponse$json = {
  '1': 'SignFrostResponse',
  '2': [
    {
      '1': 'results',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.frost.SignFrostResponse.ResultsEntry',
      '10': 'results'
    },
  ],
  '3': [SignFrostResponse_ResultsEntry$json],
};

@$core.Deprecated('Use signFrostResponseDescriptor instead')
const SignFrostResponse_ResultsEntry$json = {
  '1': 'ResultsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.common.SigningResult',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `SignFrostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signFrostResponseDescriptor = $convert.base64Decode(
    'ChFTaWduRnJvc3RSZXNwb25zZRI/CgdyZXN1bHRzGAEgAygLMiUuZnJvc3QuU2lnbkZyb3N0Um'
    'VzcG9uc2UuUmVzdWx0c0VudHJ5UgdyZXN1bHRzGlEKDFJlc3VsdHNFbnRyeRIQCgNrZXkYASAB'
    'KAlSA2tleRIrCgV2YWx1ZRgCIAEoCzIVLmNvbW1vbi5TaWduaW5nUmVzdWx0UgV2YWx1ZToCOA'
    'E=');

@$core.Deprecated('Use aggregateFrostRequestDescriptor instead')
const AggregateFrostRequest$json = {
  '1': 'AggregateFrostRequest',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 12, '10': 'message'},
    {
      '1': 'signature_shares',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.frost.AggregateFrostRequest.SignatureSharesEntry',
      '10': 'signatureShares'
    },
    {
      '1': 'public_shares',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.frost.AggregateFrostRequest.PublicSharesEntry',
      '10': 'publicShares'
    },
    {'1': 'verifying_key', '3': 4, '4': 1, '5': 12, '10': 'verifyingKey'},
    {
      '1': 'commitments',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.frost.AggregateFrostRequest.CommitmentsEntry',
      '10': 'commitments'
    },
    {
      '1': 'user_commitments',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.common.SigningCommitment',
      '10': 'userCommitments'
    },
    {'1': 'user_public_key', '3': 7, '4': 1, '5': 12, '10': 'userPublicKey'},
    {
      '1': 'user_signature_share',
      '3': 8,
      '4': 1,
      '5': 12,
      '10': 'userSignatureShare'
    },
    {
      '1': 'adaptor_public_key',
      '3': 9,
      '4': 1,
      '5': 12,
      '10': 'adaptorPublicKey'
    },
  ],
  '3': [
    AggregateFrostRequest_SignatureSharesEntry$json,
    AggregateFrostRequest_PublicSharesEntry$json,
    AggregateFrostRequest_CommitmentsEntry$json
  ],
};

@$core.Deprecated('Use aggregateFrostRequestDescriptor instead')
const AggregateFrostRequest_SignatureSharesEntry$json = {
  '1': 'SignatureSharesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use aggregateFrostRequestDescriptor instead')
const AggregateFrostRequest_PublicSharesEntry$json = {
  '1': 'PublicSharesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use aggregateFrostRequestDescriptor instead')
const AggregateFrostRequest_CommitmentsEntry$json = {
  '1': 'CommitmentsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.common.SigningCommitment',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `AggregateFrostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aggregateFrostRequestDescriptor = $convert.base64Decode(
    'ChVBZ2dyZWdhdGVGcm9zdFJlcXVlc3QSGAoHbWVzc2FnZRgBIAEoDFIHbWVzc2FnZRJcChBzaW'
    'duYXR1cmVfc2hhcmVzGAIgAygLMjEuZnJvc3QuQWdncmVnYXRlRnJvc3RSZXF1ZXN0LlNpZ25h'
    'dHVyZVNoYXJlc0VudHJ5Ug9zaWduYXR1cmVTaGFyZXMSUwoNcHVibGljX3NoYXJlcxgDIAMoCz'
    'IuLmZyb3N0LkFnZ3JlZ2F0ZUZyb3N0UmVxdWVzdC5QdWJsaWNTaGFyZXNFbnRyeVIMcHVibGlj'
    'U2hhcmVzEiMKDXZlcmlmeWluZ19rZXkYBCABKAxSDHZlcmlmeWluZ0tleRJPCgtjb21taXRtZW'
    '50cxgFIAMoCzItLmZyb3N0LkFnZ3JlZ2F0ZUZyb3N0UmVxdWVzdC5Db21taXRtZW50c0VudHJ5'
    'Ugtjb21taXRtZW50cxJEChB1c2VyX2NvbW1pdG1lbnRzGAYgASgLMhkuY29tbW9uLlNpZ25pbm'
    'dDb21taXRtZW50Ug91c2VyQ29tbWl0bWVudHMSJgoPdXNlcl9wdWJsaWNfa2V5GAcgASgMUg11'
    'c2VyUHVibGljS2V5EjAKFHVzZXJfc2lnbmF0dXJlX3NoYXJlGAggASgMUhJ1c2VyU2lnbmF0dX'
    'JlU2hhcmUSLAoSYWRhcHRvcl9wdWJsaWNfa2V5GAkgASgMUhBhZGFwdG9yUHVibGljS2V5GkIK'
    'FFNpZ25hdHVyZVNoYXJlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgMUg'
    'V2YWx1ZToCOAEaPwoRUHVibGljU2hhcmVzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFs'
    'dWUYAiABKAxSBXZhbHVlOgI4ARpZChBDb21taXRtZW50c0VudHJ5EhAKA2tleRgBIAEoCVIDa2'
    'V5Ei8KBXZhbHVlGAIgASgLMhkuY29tbW9uLlNpZ25pbmdDb21taXRtZW50UgV2YWx1ZToCOAE=');

@$core.Deprecated('Use aggregateFrostResponseDescriptor instead')
const AggregateFrostResponse$json = {
  '1': 'AggregateFrostResponse',
  '2': [
    {'1': 'signature', '3': 1, '4': 1, '5': 12, '10': 'signature'},
  ],
};

/// Descriptor for `AggregateFrostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aggregateFrostResponseDescriptor =
    $convert.base64Decode(
        'ChZBZ2dyZWdhdGVGcm9zdFJlc3BvbnNlEhwKCXNpZ25hdHVyZRgBIAEoDFIJc2lnbmF0dXJl');

@$core.Deprecated('Use validateSignatureShareRequestDescriptor instead')
const ValidateSignatureShareRequest$json = {
  '1': 'ValidateSignatureShareRequest',
  '2': [
    {'1': 'identifier', '3': 1, '4': 1, '5': 9, '10': 'identifier'},
    {
      '1': 'role',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.frost.SigningRole',
      '10': 'role'
    },
    {'1': 'message', '3': 3, '4': 1, '5': 12, '10': 'message'},
    {'1': 'signature_share', '3': 4, '4': 1, '5': 12, '10': 'signatureShare'},
    {'1': 'public_share', '3': 5, '4': 1, '5': 12, '10': 'publicShare'},
    {'1': 'verifying_key', '3': 6, '4': 1, '5': 12, '10': 'verifyingKey'},
    {
      '1': 'commitments',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.frost.ValidateSignatureShareRequest.CommitmentsEntry',
      '10': 'commitments'
    },
    {
      '1': 'user_commitments',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.common.SigningCommitment',
      '10': 'userCommitments'
    },
  ],
  '3': [ValidateSignatureShareRequest_CommitmentsEntry$json],
};

@$core.Deprecated('Use validateSignatureShareRequestDescriptor instead')
const ValidateSignatureShareRequest_CommitmentsEntry$json = {
  '1': 'CommitmentsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.common.SigningCommitment',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `ValidateSignatureShareRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validateSignatureShareRequestDescriptor = $convert.base64Decode(
    'Ch1WYWxpZGF0ZVNpZ25hdHVyZVNoYXJlUmVxdWVzdBIeCgppZGVudGlmaWVyGAEgASgJUgppZG'
    'VudGlmaWVyEiYKBHJvbGUYAiABKA4yEi5mcm9zdC5TaWduaW5nUm9sZVIEcm9sZRIYCgdtZXNz'
    'YWdlGAMgASgMUgdtZXNzYWdlEicKD3NpZ25hdHVyZV9zaGFyZRgEIAEoDFIOc2lnbmF0dXJlU2'
    'hhcmUSIQoMcHVibGljX3NoYXJlGAUgASgMUgtwdWJsaWNTaGFyZRIjCg12ZXJpZnlpbmdfa2V5'
    'GAYgASgMUgx2ZXJpZnlpbmdLZXkSVwoLY29tbWl0bWVudHMYByADKAsyNS5mcm9zdC5WYWxpZG'
    'F0ZVNpZ25hdHVyZVNoYXJlUmVxdWVzdC5Db21taXRtZW50c0VudHJ5Ugtjb21taXRtZW50cxJE'
    'ChB1c2VyX2NvbW1pdG1lbnRzGAggASgLMhkuY29tbW9uLlNpZ25pbmdDb21taXRtZW50Ug91c2'
    'VyQ29tbWl0bWVudHMaWQoQQ29tbWl0bWVudHNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIvCgV2'
    'YWx1ZRgCIAEoCzIZLmNvbW1vbi5TaWduaW5nQ29tbWl0bWVudFIFdmFsdWU6AjgB');

@$core.Deprecated('Use participantGroupDescriptor instead')
const ParticipantGroup$json = {
  '1': 'ParticipantGroup',
  '2': [
    {'1': 'identifiers', '3': 1, '4': 3, '5': 9, '10': 'identifiers'},
  ],
};

/// Descriptor for `ParticipantGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List participantGroupDescriptor = $convert.base64Decode(
    'ChBQYXJ0aWNpcGFudEdyb3VwEiAKC2lkZW50aWZpZXJzGAEgAygJUgtpZGVudGlmaWVycw==');

@$core.Deprecated('Use frostSigningJobV2Descriptor instead')
const FrostSigningJobV2$json = {
  '1': 'FrostSigningJobV2',
  '2': [
    {'1': 'job_id', '3': 1, '4': 1, '5': 9, '10': 'jobId'},
    {'1': 'message', '3': 2, '4': 1, '5': 12, '10': 'message'},
    {
      '1': 'key_package',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.frost.KeyPackage',
      '10': 'keyPackage'
    },
    {'1': 'verifying_key', '3': 4, '4': 1, '5': 12, '10': 'verifyingKey'},
    {
      '1': 'nonce',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.frost.SigningNonce',
      '10': 'nonce'
    },
    {
      '1': 'commitments',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.frost.FrostSigningJobV2.CommitmentsEntry',
      '10': 'commitments'
    },
    {
      '1': 'participant_groups',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.frost.ParticipantGroup',
      '10': 'participantGroups'
    },
    {
      '1': 'adaptor_public_key',
      '3': 8,
      '4': 1,
      '5': 12,
      '10': 'adaptorPublicKey'
    },
    {'1': 'use_tweak', '3': 9, '4': 1, '5': 8, '10': 'useTweak'},
  ],
  '3': [FrostSigningJobV2_CommitmentsEntry$json],
};

@$core.Deprecated('Use frostSigningJobV2Descriptor instead')
const FrostSigningJobV2_CommitmentsEntry$json = {
  '1': 'CommitmentsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.common.SigningCommitment',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `FrostSigningJobV2`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List frostSigningJobV2Descriptor = $convert.base64Decode(
    'ChFGcm9zdFNpZ25pbmdKb2JWMhIVCgZqb2JfaWQYASABKAlSBWpvYklkEhgKB21lc3NhZ2UYAi'
    'ABKAxSB21lc3NhZ2USMgoLa2V5X3BhY2thZ2UYAyABKAsyES5mcm9zdC5LZXlQYWNrYWdlUgpr'
    'ZXlQYWNrYWdlEiMKDXZlcmlmeWluZ19rZXkYBCABKAxSDHZlcmlmeWluZ0tleRIpCgVub25jZR'
    'gFIAEoCzITLmZyb3N0LlNpZ25pbmdOb25jZVIFbm9uY2USSwoLY29tbWl0bWVudHMYBiADKAsy'
    'KS5mcm9zdC5Gcm9zdFNpZ25pbmdKb2JWMi5Db21taXRtZW50c0VudHJ5Ugtjb21taXRtZW50cx'
    'JGChJwYXJ0aWNpcGFudF9ncm91cHMYByADKAsyFy5mcm9zdC5QYXJ0aWNpcGFudEdyb3VwUhFw'
    'YXJ0aWNpcGFudEdyb3VwcxIsChJhZGFwdG9yX3B1YmxpY19rZXkYCCABKAxSEGFkYXB0b3JQdW'
    'JsaWNLZXkSGwoJdXNlX3R3ZWFrGAkgASgIUgh1c2VUd2VhaxpZChBDb21taXRtZW50c0VudHJ5'
    'EhAKA2tleRgBIAEoCVIDa2V5Ei8KBXZhbHVlGAIgASgLMhkuY29tbW9uLlNpZ25pbmdDb21taX'
    'RtZW50UgV2YWx1ZToCOAE=');

@$core.Deprecated('Use signFrostRequestV2Descriptor instead')
const SignFrostRequestV2$json = {
  '1': 'SignFrostRequestV2',
  '2': [
    {
      '1': 'signing_jobs',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.frost.FrostSigningJobV2',
      '10': 'signingJobs'
    },
  ],
};

/// Descriptor for `SignFrostRequestV2`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signFrostRequestV2Descriptor = $convert.base64Decode(
    'ChJTaWduRnJvc3RSZXF1ZXN0VjISOwoMc2lnbmluZ19qb2JzGAEgAygLMhguZnJvc3QuRnJvc3'
    'RTaWduaW5nSm9iVjJSC3NpZ25pbmdKb2Jz');

@$core.Deprecated('Use aggregateFrostRequestV2Descriptor instead')
const AggregateFrostRequestV2$json = {
  '1': 'AggregateFrostRequestV2',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 12, '10': 'message'},
    {
      '1': 'signature_shares',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.frost.AggregateFrostRequestV2.SignatureSharesEntry',
      '10': 'signatureShares'
    },
    {
      '1': 'public_shares',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.frost.AggregateFrostRequestV2.PublicSharesEntry',
      '10': 'publicShares'
    },
    {'1': 'verifying_key', '3': 4, '4': 1, '5': 12, '10': 'verifyingKey'},
    {
      '1': 'commitments',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.frost.AggregateFrostRequestV2.CommitmentsEntry',
      '10': 'commitments'
    },
    {
      '1': 'participant_groups',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.frost.ParticipantGroup',
      '10': 'participantGroups'
    },
    {
      '1': 'adaptor_public_key',
      '3': 7,
      '4': 1,
      '5': 12,
      '10': 'adaptorPublicKey'
    },
  ],
  '3': [
    AggregateFrostRequestV2_SignatureSharesEntry$json,
    AggregateFrostRequestV2_PublicSharesEntry$json,
    AggregateFrostRequestV2_CommitmentsEntry$json
  ],
};

@$core.Deprecated('Use aggregateFrostRequestV2Descriptor instead')
const AggregateFrostRequestV2_SignatureSharesEntry$json = {
  '1': 'SignatureSharesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use aggregateFrostRequestV2Descriptor instead')
const AggregateFrostRequestV2_PublicSharesEntry$json = {
  '1': 'PublicSharesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use aggregateFrostRequestV2Descriptor instead')
const AggregateFrostRequestV2_CommitmentsEntry$json = {
  '1': 'CommitmentsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.common.SigningCommitment',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `AggregateFrostRequestV2`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aggregateFrostRequestV2Descriptor = $convert.base64Decode(
    'ChdBZ2dyZWdhdGVGcm9zdFJlcXVlc3RWMhIYCgdtZXNzYWdlGAEgASgMUgdtZXNzYWdlEl4KEH'
    'NpZ25hdHVyZV9zaGFyZXMYAiADKAsyMy5mcm9zdC5BZ2dyZWdhdGVGcm9zdFJlcXVlc3RWMi5T'
    'aWduYXR1cmVTaGFyZXNFbnRyeVIPc2lnbmF0dXJlU2hhcmVzElUKDXB1YmxpY19zaGFyZXMYAy'
    'ADKAsyMC5mcm9zdC5BZ2dyZWdhdGVGcm9zdFJlcXVlc3RWMi5QdWJsaWNTaGFyZXNFbnRyeVIM'
    'cHVibGljU2hhcmVzEiMKDXZlcmlmeWluZ19rZXkYBCABKAxSDHZlcmlmeWluZ0tleRJRCgtjb2'
    '1taXRtZW50cxgFIAMoCzIvLmZyb3N0LkFnZ3JlZ2F0ZUZyb3N0UmVxdWVzdFYyLkNvbW1pdG1l'
    'bnRzRW50cnlSC2NvbW1pdG1lbnRzEkYKEnBhcnRpY2lwYW50X2dyb3VwcxgGIAMoCzIXLmZyb3'
    'N0LlBhcnRpY2lwYW50R3JvdXBSEXBhcnRpY2lwYW50R3JvdXBzEiwKEmFkYXB0b3JfcHVibGlj'
    'X2tleRgHIAEoDFIQYWRhcHRvclB1YmxpY0tleRpCChRTaWduYXR1cmVTaGFyZXNFbnRyeRIQCg'
    'NrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoDFIFdmFsdWU6AjgBGj8KEVB1YmxpY1NoYXJl'
    'c0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgMUgV2YWx1ZToCOAEaWQoQQ2'
    '9tbWl0bWVudHNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIvCgV2YWx1ZRgCIAEoCzIZLmNvbW1v'
    'bi5TaWduaW5nQ29tbWl0bWVudFIFdmFsdWU6AjgB');

@$core.Deprecated('Use validateSignatureShareRequestV2Descriptor instead')
const ValidateSignatureShareRequestV2$json = {
  '1': 'ValidateSignatureShareRequestV2',
  '2': [
    {'1': 'identifier', '3': 1, '4': 1, '5': 9, '10': 'identifier'},
    {'1': 'message', '3': 2, '4': 1, '5': 12, '10': 'message'},
    {'1': 'signature_share', '3': 3, '4': 1, '5': 12, '10': 'signatureShare'},
    {'1': 'public_share', '3': 4, '4': 1, '5': 12, '10': 'publicShare'},
    {'1': 'verifying_key', '3': 5, '4': 1, '5': 12, '10': 'verifyingKey'},
    {
      '1': 'commitments',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.frost.ValidateSignatureShareRequestV2.CommitmentsEntry',
      '10': 'commitments'
    },
    {
      '1': 'participant_groups',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.frost.ParticipantGroup',
      '10': 'participantGroups'
    },
  ],
  '3': [ValidateSignatureShareRequestV2_CommitmentsEntry$json],
};

@$core.Deprecated('Use validateSignatureShareRequestV2Descriptor instead')
const ValidateSignatureShareRequestV2_CommitmentsEntry$json = {
  '1': 'CommitmentsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.common.SigningCommitment',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `ValidateSignatureShareRequestV2`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validateSignatureShareRequestV2Descriptor = $convert.base64Decode(
    'Ch9WYWxpZGF0ZVNpZ25hdHVyZVNoYXJlUmVxdWVzdFYyEh4KCmlkZW50aWZpZXIYASABKAlSCm'
    'lkZW50aWZpZXISGAoHbWVzc2FnZRgCIAEoDFIHbWVzc2FnZRInCg9zaWduYXR1cmVfc2hhcmUY'
    'AyABKAxSDnNpZ25hdHVyZVNoYXJlEiEKDHB1YmxpY19zaGFyZRgEIAEoDFILcHVibGljU2hhcm'
    'USIwoNdmVyaWZ5aW5nX2tleRgFIAEoDFIMdmVyaWZ5aW5nS2V5ElkKC2NvbW1pdG1lbnRzGAYg'
    'AygLMjcuZnJvc3QuVmFsaWRhdGVTaWduYXR1cmVTaGFyZVJlcXVlc3RWMi5Db21taXRtZW50c0'
    'VudHJ5Ugtjb21taXRtZW50cxJGChJwYXJ0aWNpcGFudF9ncm91cHMYByADKAsyFy5mcm9zdC5Q'
    'YXJ0aWNpcGFudEdyb3VwUhFwYXJ0aWNpcGFudEdyb3VwcxpZChBDb21taXRtZW50c0VudHJ5Eh'
    'AKA2tleRgBIAEoCVIDa2V5Ei8KBXZhbHVlGAIgASgLMhkuY29tbW9uLlNpZ25pbmdDb21taXRt'
    'ZW50UgV2YWx1ZToCOAE=');
