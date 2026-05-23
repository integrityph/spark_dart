// This is a generated file - do not edit.
//
// Generated from multisig.proto.

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

@$core.Deprecated('Use multisigConfigDescriptor instead')
const MultisigConfig$json = {
  '1': 'MultisigConfig',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 13, '10': 'version'},
    {'1': 'threshold', '3': 2, '4': 1, '5': 13, '8': {}, '10': 'threshold'},
    {'1': 'public_keys', '3': 3, '4': 3, '5': 12, '8': {}, '10': 'publicKeys'},
  ],
};

/// Descriptor for `MultisigConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List multisigConfigDescriptor = $convert.base64Decode(
    'Cg5NdWx0aXNpZ0NvbmZpZxIYCgd2ZXJzaW9uGAEgASgNUgd2ZXJzaW9uEiUKCXRocmVzaG9sZB'
    'gCIAEoDUIH+kIEKgIoAVIJdGhyZXNob2xkEi8KC3B1YmxpY19rZXlzGAMgAygMQg76QguSAQgI'
    'AiIEegJoIVIKcHVibGljS2V5cw==');

@$core.Deprecated('Use keyedSignatureDescriptor instead')
const KeyedSignature$json = {
  '1': 'KeyedSignature',
  '2': [
    {'1': 'public_key', '3': 1, '4': 1, '5': 12, '8': {}, '10': 'publicKey'},
    {'1': 'signature', '3': 2, '4': 1, '5': 12, '8': {}, '10': 'signature'},
  ],
};

/// Descriptor for `KeyedSignature`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keyedSignatureDescriptor = $convert.base64Decode(
    'Cg5LZXllZFNpZ25hdHVyZRImCgpwdWJsaWNfa2V5GAEgASgMQgf6QgR6AmghUglwdWJsaWNLZX'
    'kSLAoJc2lnbmF0dXJlGAIgASgMQg76QgR6AhBA+kIEegIYSVIJc2lnbmF0dXJl');

@$core.Deprecated('Use multisigSignatureSetDescriptor instead')
const MultisigSignatureSet$json = {
  '1': 'MultisigSignatureSet',
  '2': [
    {
      '1': 'multisig_config',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.multisig.MultisigConfig',
      '8': {},
      '10': 'multisigConfig'
    },
    {
      '1': 'signatures',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.multisig.KeyedSignature',
      '10': 'signatures'
    },
  ],
};

/// Descriptor for `MultisigSignatureSet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List multisigSignatureSetDescriptor = $convert.base64Decode(
    'ChRNdWx0aXNpZ1NpZ25hdHVyZVNldBJLCg9tdWx0aXNpZ19jb25maWcYASABKAsyGC5tdWx0aX'
    'NpZy5NdWx0aXNpZ0NvbmZpZ0II+kIFigECEAFSDm11bHRpc2lnQ29uZmlnEjgKCnNpZ25hdHVy'
    'ZXMYAiADKAsyGC5tdWx0aXNpZy5LZXllZFNpZ25hdHVyZVIKc2lnbmF0dXJlcw==');

@$core.Deprecated('Use signingAuthorityDescriptor instead')
const SigningAuthority$json = {
  '1': 'SigningAuthority',
  '2': [
    {
      '1': 'public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {},
      '9': 0,
      '10': 'publicKey'
    },
    {
      '1': 'multisig',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.multisig.MultisigConfig',
      '9': 0,
      '10': 'multisig'
    },
  ],
  '8': [
    {'1': 'authority'},
  ],
};

/// Descriptor for `SigningAuthority`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingAuthorityDescriptor = $convert.base64Decode(
    'ChBTaWduaW5nQXV0aG9yaXR5EigKCnB1YmxpY19rZXkYASABKAxCB/pCBHoCaCFIAFIJcHVibG'
    'ljS2V5EjYKCG11bHRpc2lnGAIgASgLMhgubXVsdGlzaWcuTXVsdGlzaWdDb25maWdIAFIIbXVs'
    'dGlzaWdCCwoJYXV0aG9yaXR5');
