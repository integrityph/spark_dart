// This is a generated file - do not edit.
//
// Generated from spark_token_legacy.proto.

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

@$core.Deprecated('Use tokenOutputToSpendDescriptor instead')
const TokenOutputToSpend$json = {
  '1': 'TokenOutputToSpend',
  '2': [
    {
      '1': 'prev_token_transaction_hash',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'prevTokenTransactionHash'
    },
    {
      '1': 'prev_token_transaction_vout',
      '3': 2,
      '4': 1,
      '5': 13,
      '10': 'prevTokenTransactionVout'
    },
  ],
};

/// Descriptor for `TokenOutputToSpend`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenOutputToSpendDescriptor = $convert.base64Decode(
    'ChJUb2tlbk91dHB1dFRvU3BlbmQSRgobcHJldl90b2tlbl90cmFuc2FjdGlvbl9oYXNoGAEgAS'
    'gMQgf6QgR6AmggUhhwcmV2VG9rZW5UcmFuc2FjdGlvbkhhc2gSPQobcHJldl90b2tlbl90cmFu'
    'c2FjdGlvbl92b3V0GAIgASgNUhhwcmV2VG9rZW5UcmFuc2FjdGlvblZvdXQ=');

@$core.Deprecated('Use tokenTransferInputDescriptor instead')
const TokenTransferInput$json = {
  '1': 'TokenTransferInput',
  '2': [
    {
      '1': 'outputs_to_spend',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark_token_legacy.TokenOutputToSpend',
      '10': 'outputsToSpend'
    },
  ],
};

/// Descriptor for `TokenTransferInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenTransferInputDescriptor = $convert.base64Decode(
    'ChJUb2tlblRyYW5zZmVySW5wdXQSUAoQb3V0cHV0c190b19zcGVuZBgBIAMoCzImLnNwYXJrX3'
    'Rva2VuX2xlZ2FjeS5Ub2tlbk91dHB1dFRvU3BlbmRSDm91dHB1dHNUb1NwZW5k');

@$core.Deprecated('Use tokenMintInputDescriptor instead')
const TokenMintInput$json = {
  '1': 'TokenMintInput',
  '2': [
    {
      '1': 'issuer_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'issuerPublicKey'
    },
    {
      '1': 'issuer_provided_timestamp',
      '3': 2,
      '4': 1,
      '5': 4,
      '10': 'issuerProvidedTimestamp'
    },
    {
      '1': 'token_identifier',
      '3': 3,
      '4': 1,
      '5': 12,
      '8': {},
      '9': 0,
      '10': 'tokenIdentifier',
      '17': true
    },
  ],
  '8': [
    {'1': '_token_identifier'},
  ],
};

/// Descriptor for `TokenMintInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenMintInputDescriptor = $convert.base64Decode(
    'Cg5Ub2tlbk1pbnRJbnB1dBIzChFpc3N1ZXJfcHVibGljX2tleRgBIAEoDEIH+kIEegJoIVIPaX'
    'NzdWVyUHVibGljS2V5EjoKGWlzc3Vlcl9wcm92aWRlZF90aW1lc3RhbXAYAiABKARSF2lzc3Vl'
    'clByb3ZpZGVkVGltZXN0YW1wEjcKEHRva2VuX2lkZW50aWZpZXIYAyABKAxCB/pCBHoCaCBIAF'
    'IPdG9rZW5JZGVudGlmaWVyiAEBQhMKEV90b2tlbl9pZGVudGlmaWVy');

@$core.Deprecated('Use tokenCreateInputDescriptor instead')
const TokenCreateInput$json = {
  '1': 'TokenCreateInput',
  '2': [
    {
      '1': 'issuer_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'issuerPublicKey'
    },
    {'1': 'token_name', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'tokenName'},
    {'1': 'token_ticker', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'tokenTicker'},
    {'1': 'decimals', '3': 4, '4': 1, '5': 13, '8': {}, '10': 'decimals'},
    {'1': 'max_supply', '3': 5, '4': 1, '5': 12, '8': {}, '10': 'maxSupply'},
    {'1': 'is_freezable', '3': 6, '4': 1, '5': 8, '10': 'isFreezable'},
    {
      '1': 'creation_entity_public_key',
      '3': 7,
      '4': 1,
      '5': 12,
      '8': {},
      '9': 0,
      '10': 'creationEntityPublicKey',
      '17': true
    },
  ],
  '8': [
    {'1': '_creation_entity_public_key'},
  ],
};

/// Descriptor for `TokenCreateInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenCreateInputDescriptor = $convert.base64Decode(
    'ChBUb2tlbkNyZWF0ZUlucHV0EjMKEWlzc3Vlcl9wdWJsaWNfa2V5GAEgASgMQgf6QgR6AmghUg'
    '9pc3N1ZXJQdWJsaWNLZXkSJgoKdG9rZW5fbmFtZRgCIAEoCUIH+kIEcgIYFFIJdG9rZW5OYW1l'
    'EioKDHRva2VuX3RpY2tlchgDIAEoCUIH+kIEcgIYBlILdG9rZW5UaWNrZXISJAoIZGVjaW1hbH'
    'MYBCABKA1CCPpCBSoDGP8BUghkZWNpbWFscxImCgptYXhfc3VwcGx5GAUgASgMQgf6QgR6AmgQ'
    'UgltYXhTdXBwbHkSIQoMaXNfZnJlZXphYmxlGAYgASgIUgtpc0ZyZWV6YWJsZRJJChpjcmVhdG'
    'lvbl9lbnRpdHlfcHVibGljX2tleRgHIAEoDEIH+kIEegJoIUgAUhdjcmVhdGlvbkVudGl0eVB1'
    'YmxpY0tleYgBAUIdChtfY3JlYXRpb25fZW50aXR5X3B1YmxpY19rZXk=');

@$core.Deprecated('Use tokenOutputDescriptor instead')
const TokenOutput$json = {
  '1': 'TokenOutput',
  '2': [
    {
      '1': 'id',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 0,
      '10': 'id',
      '17': true
    },
    {
      '1': 'owner_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'ownerPublicKey'
    },
    {
      '1': 'revocation_commitment',
      '3': 3,
      '4': 1,
      '5': 12,
      '8': {},
      '9': 1,
      '10': 'revocationCommitment',
      '17': true
    },
    {
      '1': 'withdraw_bond_sats',
      '3': 4,
      '4': 1,
      '5': 4,
      '9': 2,
      '10': 'withdrawBondSats',
      '17': true
    },
    {
      '1': 'withdraw_relative_block_locktime',
      '3': 5,
      '4': 1,
      '5': 4,
      '9': 3,
      '10': 'withdrawRelativeBlockLocktime',
      '17': true
    },
    {
      '1': 'token_public_key',
      '3': 6,
      '4': 1,
      '5': 12,
      '8': {},
      '9': 4,
      '10': 'tokenPublicKey',
      '17': true
    },
    {
      '1': 'token_identifier',
      '3': 8,
      '4': 1,
      '5': 12,
      '8': {},
      '9': 5,
      '10': 'tokenIdentifier',
      '17': true
    },
    {
      '1': 'token_amount',
      '3': 7,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'tokenAmount'
    },
  ],
  '8': [
    {'1': '_id'},
    {'1': '_revocation_commitment'},
    {'1': '_withdraw_bond_sats'},
    {'1': '_withdraw_relative_block_locktime'},
    {'1': '_token_public_key'},
    {'1': '_token_identifier'},
  ],
};

/// Descriptor for `TokenOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenOutputDescriptor = $convert.base64Decode(
    'CgtUb2tlbk91dHB1dBIdCgJpZBgBIAEoCUII+kIFcgOwAQFIAFICaWSIAQESMQoQb3duZXJfcH'
    'VibGljX2tleRgCIAEoDEIH+kIEegJoIVIOb3duZXJQdWJsaWNLZXkSQQoVcmV2b2NhdGlvbl9j'
    'b21taXRtZW50GAMgASgMQgf6QgR6AmghSAFSFHJldm9jYXRpb25Db21taXRtZW50iAEBEjEKEn'
    'dpdGhkcmF3X2JvbmRfc2F0cxgEIAEoBEgCUhB3aXRoZHJhd0JvbmRTYXRziAEBEkwKIHdpdGhk'
    'cmF3X3JlbGF0aXZlX2Jsb2NrX2xvY2t0aW1lGAUgASgESANSHXdpdGhkcmF3UmVsYXRpdmVCbG'
    '9ja0xvY2t0aW1liAEBEjYKEHRva2VuX3B1YmxpY19rZXkYBiABKAxCB/pCBHoCaCFIBFIOdG9r'
    'ZW5QdWJsaWNLZXmIAQESNwoQdG9rZW5faWRlbnRpZmllchgIIAEoDEIH+kIEegJoIEgFUg90b2'
    'tlbklkZW50aWZpZXKIAQESKgoMdG9rZW5fYW1vdW50GAcgASgMQgf6QgR6AmgQUgt0b2tlbkFt'
    'b3VudEIFCgNfaWRCGAoWX3Jldm9jYXRpb25fY29tbWl0bWVudEIVChNfd2l0aGRyYXdfYm9uZF'
    '9zYXRzQiMKIV93aXRoZHJhd19yZWxhdGl2ZV9ibG9ja19sb2NrdGltZUITChFfdG9rZW5fcHVi'
    'bGljX2tleUITChFfdG9rZW5faWRlbnRpZmllcg==');

@$core.Deprecated('Use tokenTransactionDescriptor instead')
const TokenTransaction$json = {
  '1': 'TokenTransaction',
  '2': [
    {
      '1': 'mint_input',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark_token_legacy.TokenMintInput',
      '9': 0,
      '10': 'mintInput'
    },
    {
      '1': 'transfer_input',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark_token_legacy.TokenTransferInput',
      '9': 0,
      '10': 'transferInput'
    },
    {
      '1': 'create_input',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.spark_token_legacy.TokenCreateInput',
      '9': 0,
      '10': 'createInput'
    },
    {
      '1': 'token_outputs',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.spark_token_legacy.TokenOutput',
      '10': 'tokenOutputs'
    },
    {
      '1': 'spark_operator_identity_public_keys',
      '3': 4,
      '4': 3,
      '5': 12,
      '8': {},
      '10': 'sparkOperatorIdentityPublicKeys'
    },
    {
      '1': 'network',
      '3': 10,
      '4': 1,
      '5': 14,
      '6': '.spark.Network',
      '8': {},
      '10': 'network'
    },
  ],
  '8': [
    {'1': 'token_inputs'},
  ],
};

/// Descriptor for `TokenTransaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenTransactionDescriptor = $convert.base64Decode(
    'ChBUb2tlblRyYW5zYWN0aW9uEkMKCm1pbnRfaW5wdXQYASABKAsyIi5zcGFya190b2tlbl9sZW'
    'dhY3kuVG9rZW5NaW50SW5wdXRIAFIJbWludElucHV0Ek8KDnRyYW5zZmVyX2lucHV0GAIgASgL'
    'MiYuc3BhcmtfdG9rZW5fbGVnYWN5LlRva2VuVHJhbnNmZXJJbnB1dEgAUg10cmFuc2ZlcklucH'
    'V0EkkKDGNyZWF0ZV9pbnB1dBgFIAEoCzIkLnNwYXJrX3Rva2VuX2xlZ2FjeS5Ub2tlbkNyZWF0'
    'ZUlucHV0SABSC2NyZWF0ZUlucHV0EkQKDXRva2VuX291dHB1dHMYAyADKAsyHy5zcGFya190b2'
    'tlbl9sZWdhY3kuVG9rZW5PdXRwdXRSDHRva2VuT3V0cHV0cxJaCiNzcGFya19vcGVyYXRvcl9p'
    'ZGVudGl0eV9wdWJsaWNfa2V5cxgEIAMoDEIM+kIJkgEGIgR6AmghUh9zcGFya09wZXJhdG9ySW'
    'RlbnRpdHlQdWJsaWNLZXlzEjIKB25ldHdvcmsYCiABKA4yDi5zcGFyay5OZXR3b3JrQgj6QgWC'
    'AQIgAFIHbmV0d29ya0IOCgx0b2tlbl9pbnB1dHM=');
