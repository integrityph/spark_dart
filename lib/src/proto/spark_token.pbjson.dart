// This is a generated file - do not edit.
//
// Generated from spark_token.proto.

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

@$core.Deprecated('Use tokenOutputStatusDescriptor instead')
const TokenOutputStatus$json = {
  '1': 'TokenOutputStatus',
  '2': [
    {'1': 'TOKEN_OUTPUT_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'TOKEN_OUTPUT_STATUS_AVAILABLE', '2': 1},
    {'1': 'TOKEN_OUTPUT_STATUS_PENDING_OUTBOUND', '2': 2},
  ],
};

/// Descriptor for `TokenOutputStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List tokenOutputStatusDescriptor = $convert.base64Decode(
    'ChFUb2tlbk91dHB1dFN0YXR1cxIjCh9UT0tFTl9PVVRQVVRfU1RBVFVTX1VOU1BFQ0lGSUVEEA'
    'ASIQodVE9LRU5fT1VUUFVUX1NUQVRVU19BVkFJTEFCTEUQARIoCiRUT0tFTl9PVVRQVVRfU1RB'
    'VFVTX1BFTkRJTkdfT1VUQk9VTkQQAg==');

@$core.Deprecated('Use tokenTransactionTypeDescriptor instead')
const TokenTransactionType$json = {
  '1': 'TokenTransactionType',
  '2': [
    {'1': 'TOKEN_TRANSACTION_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'TOKEN_TRANSACTION_TYPE_CREATE', '2': 1},
    {'1': 'TOKEN_TRANSACTION_TYPE_MINT', '2': 2},
    {'1': 'TOKEN_TRANSACTION_TYPE_TRANSFER', '2': 3},
  ],
};

/// Descriptor for `TokenTransactionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List tokenTransactionTypeDescriptor = $convert.base64Decode(
    'ChRUb2tlblRyYW5zYWN0aW9uVHlwZRImCiJUT0tFTl9UUkFOU0FDVElPTl9UWVBFX1VOU1BFQ0'
    'lGSUVEEAASIQodVE9LRU5fVFJBTlNBQ1RJT05fVFlQRV9DUkVBVEUQARIfChtUT0tFTl9UUkFO'
    'U0FDVElPTl9UWVBFX01JTlQQAhIjCh9UT0tFTl9UUkFOU0FDVElPTl9UWVBFX1RSQU5TRkVSEA'
    'M=');

@$core.Deprecated('Use commitStatusDescriptor instead')
const CommitStatus$json = {
  '1': 'CommitStatus',
  '2': [
    {'1': 'COMMIT_UNSPECIFIED', '2': 0},
    {'1': 'COMMIT_PROCESSING', '2': 1},
    {'1': 'COMMIT_FINALIZED', '2': 2},
  ],
};

/// Descriptor for `CommitStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List commitStatusDescriptor = $convert.base64Decode(
    'CgxDb21taXRTdGF0dXMSFgoSQ09NTUlUX1VOU1BFQ0lGSUVEEAASFQoRQ09NTUlUX1BST0NFU1'
    'NJTkcQARIUChBDT01NSVRfRklOQUxJWkVEEAI=');

@$core.Deprecated('Use tokenTransactionStatusDescriptor instead')
const TokenTransactionStatus$json = {
  '1': 'TokenTransactionStatus',
  '2': [
    {'1': 'TOKEN_TRANSACTION_STARTED', '2': 0},
    {'1': 'TOKEN_TRANSACTION_SIGNED', '2': 1},
    {'1': 'TOKEN_TRANSACTION_REVEALED', '2': 5},
    {'1': 'TOKEN_TRANSACTION_FINALIZED', '2': 2},
    {'1': 'TOKEN_TRANSACTION_STARTED_CANCELLED', '2': 3},
    {'1': 'TOKEN_TRANSACTION_SIGNED_CANCELLED', '2': 4},
    {'1': 'TOKEN_TRANSACTION_UNKNOWN', '2': 10},
  ],
};

/// Descriptor for `TokenTransactionStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List tokenTransactionStatusDescriptor = $convert.base64Decode(
    'ChZUb2tlblRyYW5zYWN0aW9uU3RhdHVzEh0KGVRPS0VOX1RSQU5TQUNUSU9OX1NUQVJURUQQAB'
    'IcChhUT0tFTl9UUkFOU0FDVElPTl9TSUdORUQQARIeChpUT0tFTl9UUkFOU0FDVElPTl9SRVZF'
    'QUxFRBAFEh8KG1RPS0VOX1RSQU5TQUNUSU9OX0ZJTkFMSVpFRBACEicKI1RPS0VOX1RSQU5TQU'
    'NUSU9OX1NUQVJURURfQ0FOQ0VMTEVEEAMSJgoiVE9LRU5fVFJBTlNBQ1RJT05fU0lHTkVEX0NB'
    'TkNFTExFRBAEEh0KGVRPS0VOX1RSQU5TQUNUSU9OX1VOS05PV04QCg==');

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
      '6': '.spark_token.TokenOutputToSpend',
      '10': 'outputsToSpend'
    },
  ],
};

/// Descriptor for `TokenTransferInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenTransferInputDescriptor = $convert.base64Decode(
    'ChJUb2tlblRyYW5zZmVySW5wdXQSSQoQb3V0cHV0c190b19zcGVuZBgBIAMoCzIfLnNwYXJrX3'
    'Rva2VuLlRva2VuT3V0cHV0VG9TcGVuZFIOb3V0cHV0c1RvU3BlbmQ=');

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
      '1': 'token_identifier',
      '3': 2,
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
    'NzdWVyUHVibGljS2V5EjcKEHRva2VuX2lkZW50aWZpZXIYAiABKAxCB/pCBHoCaCBIAFIPdG9r'
    'ZW5JZGVudGlmaWVyiAEBQhMKEV90b2tlbl9pZGVudGlmaWVy');

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
    {
      '1': 'extra_metadata',
      '3': 8,
      '4': 1,
      '5': 12,
      '8': {},
      '9': 1,
      '10': 'extraMetadata',
      '17': true
    },
  ],
  '8': [
    {'1': '_creation_entity_public_key'},
    {'1': '_extra_metadata'},
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
    'YmxpY0tleYgBARI0Cg5leHRyYV9tZXRhZGF0YRgIIAEoDEII+kIFegMYgAhIAVINZXh0cmFNZX'
    'RhZGF0YYgBAUIdChtfY3JlYXRpb25fZW50aXR5X3B1YmxpY19rZXlCEQoPX2V4dHJhX21ldGFk'
    'YXRh');

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
    {
      '1': 'se_withdrawal_signature',
      '3': 9,
      '4': 1,
      '5': 12,
      '9': 6,
      '10': 'seWithdrawalSignature',
      '17': true
    },
    {
      '1': 'status',
      '3': 10,
      '4': 1,
      '5': 14,
      '6': '.spark_token.TokenOutputStatus',
      '9': 7,
      '10': 'status',
      '17': true
    },
  ],
  '8': [
    {'1': '_id'},
    {'1': '_revocation_commitment'},
    {'1': '_withdraw_bond_sats'},
    {'1': '_withdraw_relative_block_locktime'},
    {'1': '_token_public_key'},
    {'1': '_token_identifier'},
    {'1': '_se_withdrawal_signature'},
    {'1': '_status'},
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
    'b3VudBI7ChdzZV93aXRoZHJhd2FsX3NpZ25hdHVyZRgJIAEoDEgGUhVzZVdpdGhkcmF3YWxTaW'
    'duYXR1cmWIAQESOwoGc3RhdHVzGAogASgOMh4uc3BhcmtfdG9rZW4uVG9rZW5PdXRwdXRTdGF0'
    'dXNIB1IGc3RhdHVziAEBQgUKA19pZEIYChZfcmV2b2NhdGlvbl9jb21taXRtZW50QhUKE193aX'
    'RoZHJhd19ib25kX3NhdHNCIwohX3dpdGhkcmF3X3JlbGF0aXZlX2Jsb2NrX2xvY2t0aW1lQhMK'
    'EV90b2tlbl9wdWJsaWNfa2V5QhMKEV90b2tlbl9pZGVudGlmaWVyQhoKGF9zZV93aXRoZHJhd2'
    'FsX3NpZ25hdHVyZUIJCgdfc3RhdHVz');

@$core.Deprecated('Use partialTokenOutputDescriptor instead')
const PartialTokenOutput$json = {
  '1': 'PartialTokenOutput',
  '2': [
    {
      '1': 'owner_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'ownerPublicKey'
    },
    {
      '1': 'withdraw_bond_sats',
      '3': 2,
      '4': 1,
      '5': 4,
      '10': 'withdrawBondSats'
    },
    {
      '1': 'withdraw_relative_block_locktime',
      '3': 3,
      '4': 1,
      '5': 4,
      '10': 'withdrawRelativeBlockLocktime'
    },
    {
      '1': 'token_identifier',
      '3': 4,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'tokenIdentifier'
    },
    {
      '1': 'token_amount',
      '3': 5,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'tokenAmount'
    },
  ],
};

/// Descriptor for `PartialTokenOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List partialTokenOutputDescriptor = $convert.base64Decode(
    'ChJQYXJ0aWFsVG9rZW5PdXRwdXQSMQoQb3duZXJfcHVibGljX2tleRgBIAEoDEIH+kIEegJoIV'
    'IOb3duZXJQdWJsaWNLZXkSLAoSd2l0aGRyYXdfYm9uZF9zYXRzGAIgASgEUhB3aXRoZHJhd0Jv'
    'bmRTYXRzEkcKIHdpdGhkcmF3X3JlbGF0aXZlX2Jsb2NrX2xvY2t0aW1lGAMgASgEUh13aXRoZH'
    'Jhd1JlbGF0aXZlQmxvY2tMb2NrdGltZRIyChB0b2tlbl9pZGVudGlmaWVyGAQgASgMQgf6QgR6'
    'AmggUg90b2tlbklkZW50aWZpZXISKgoMdG9rZW5fYW1vdW50GAUgASgMQgf6QgR6AmgQUgt0b2'
    'tlbkFtb3VudA==');

@$core.Deprecated('Use finalTokenOutputDescriptor instead')
const FinalTokenOutput$json = {
  '1': 'FinalTokenOutput',
  '2': [
    {
      '1': 'partial_token_output',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark_token.PartialTokenOutput',
      '10': 'partialTokenOutput'
    },
    {
      '1': 'revocation_commitment',
      '3': 2,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'revocationCommitment'
    },
  ],
};

/// Descriptor for `FinalTokenOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List finalTokenOutputDescriptor = $convert.base64Decode(
    'ChBGaW5hbFRva2VuT3V0cHV0ElEKFHBhcnRpYWxfdG9rZW5fb3V0cHV0GAEgASgLMh8uc3Bhcm'
    'tfdG9rZW4uUGFydGlhbFRva2VuT3V0cHV0UhJwYXJ0aWFsVG9rZW5PdXRwdXQSPAoVcmV2b2Nh'
    'dGlvbl9jb21taXRtZW50GAIgASgMQgf6QgR6AmghUhRyZXZvY2F0aW9uQ29tbWl0bWVudA==');

@$core.Deprecated('Use tokenTransactionDescriptor instead')
const TokenTransaction$json = {
  '1': 'TokenTransaction',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 13, '10': 'version'},
    {
      '1': 'mint_input',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark_token.TokenMintInput',
      '9': 0,
      '10': 'mintInput'
    },
    {
      '1': 'transfer_input',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark_token.TokenTransferInput',
      '9': 0,
      '10': 'transferInput'
    },
    {
      '1': 'create_input',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.spark_token.TokenCreateInput',
      '9': 0,
      '10': 'createInput'
    },
    {
      '1': 'token_outputs',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.spark_token.TokenOutput',
      '10': 'tokenOutputs'
    },
    {
      '1': 'spark_operator_identity_public_keys',
      '3': 5,
      '4': 3,
      '5': 12,
      '8': {},
      '10': 'sparkOperatorIdentityPublicKeys'
    },
    {
      '1': 'expiry_time',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'expiryTime'
    },
    {
      '1': 'network',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.spark.Network',
      '8': {},
      '10': 'network'
    },
    {
      '1': 'client_created_timestamp',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'clientCreatedTimestamp'
    },
    {
      '1': 'invoice_attachments',
      '3': 10,
      '4': 3,
      '5': 11,
      '6': '.spark_token.InvoiceAttachment',
      '10': 'invoiceAttachments'
    },
    {
      '1': 'validity_duration_seconds',
      '3': 11,
      '4': 1,
      '5': 4,
      '9': 1,
      '10': 'validityDurationSeconds',
      '17': true
    },
    {
      '1': 'execute_before',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 2,
      '10': 'executeBefore',
      '17': true
    },
  ],
  '8': [
    {'1': 'token_inputs'},
    {'1': '_validity_duration_seconds'},
    {'1': '_execute_before'},
  ],
};

/// Descriptor for `TokenTransaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenTransactionDescriptor = $convert.base64Decode(
    'ChBUb2tlblRyYW5zYWN0aW9uEhgKB3ZlcnNpb24YASABKA1SB3ZlcnNpb24SPAoKbWludF9pbn'
    'B1dBgCIAEoCzIbLnNwYXJrX3Rva2VuLlRva2VuTWludElucHV0SABSCW1pbnRJbnB1dBJICg50'
    'cmFuc2Zlcl9pbnB1dBgDIAEoCzIfLnNwYXJrX3Rva2VuLlRva2VuVHJhbnNmZXJJbnB1dEgAUg'
    '10cmFuc2ZlcklucHV0EkIKDGNyZWF0ZV9pbnB1dBgIIAEoCzIdLnNwYXJrX3Rva2VuLlRva2Vu'
    'Q3JlYXRlSW5wdXRIAFILY3JlYXRlSW5wdXQSPQoNdG9rZW5fb3V0cHV0cxgEIAMoCzIYLnNwYX'
    'JrX3Rva2VuLlRva2VuT3V0cHV0Ugx0b2tlbk91dHB1dHMSWgojc3Bhcmtfb3BlcmF0b3JfaWRl'
    'bnRpdHlfcHVibGljX2tleXMYBSADKAxCDPpCCZIBBiIEegJoIVIfc3BhcmtPcGVyYXRvcklkZW'
    '50aXR5UHVibGljS2V5cxI7CgtleHBpcnlfdGltZRgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5U'
    'aW1lc3RhbXBSCmV4cGlyeVRpbWUSMgoHbmV0d29yaxgHIAEoDjIOLnNwYXJrLk5ldHdvcmtCCP'
    'pCBYIBAiAAUgduZXR3b3JrElQKGGNsaWVudF9jcmVhdGVkX3RpbWVzdGFtcBgJIAEoCzIaLmdv'
    'b2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSFmNsaWVudENyZWF0ZWRUaW1lc3RhbXASTwoTaW52b2'
    'ljZV9hdHRhY2htZW50cxgKIAMoCzIeLnNwYXJrX3Rva2VuLkludm9pY2VBdHRhY2htZW50UhJp'
    'bnZvaWNlQXR0YWNobWVudHMSPwoZdmFsaWRpdHlfZHVyYXRpb25fc2Vjb25kcxgLIAEoBEgBUh'
    'd2YWxpZGl0eUR1cmF0aW9uU2Vjb25kc4gBARJGCg5leGVjdXRlX2JlZm9yZRgMIAEoCzIaLmdv'
    'b2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIAlINZXhlY3V0ZUJlZm9yZYgBAUIOCgx0b2tlbl9pbn'
    'B1dHNCHAoaX3ZhbGlkaXR5X2R1cmF0aW9uX3NlY29uZHNCEQoPX2V4ZWN1dGVfYmVmb3Jl');

@$core.Deprecated('Use tokenTransactionMetadataDescriptor instead')
const TokenTransactionMetadata$json = {
  '1': 'TokenTransactionMetadata',
  '2': [
    {
      '1': 'spark_operator_identity_public_keys',
      '3': 2,
      '4': 3,
      '5': 12,
      '8': {},
      '10': 'sparkOperatorIdentityPublicKeys'
    },
    {
      '1': 'network',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.spark.Network',
      '8': {},
      '10': 'network'
    },
    {
      '1': 'client_created_timestamp',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'clientCreatedTimestamp'
    },
    {
      '1': 'validity_duration_seconds',
      '3': 5,
      '4': 1,
      '5': 4,
      '8': {},
      '10': 'validityDurationSeconds'
    },
    {
      '1': 'invoice_attachments',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.spark_token.InvoiceAttachment',
      '10': 'invoiceAttachments'
    },
  ],
};

/// Descriptor for `TokenTransactionMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenTransactionMetadataDescriptor = $convert.base64Decode(
    'ChhUb2tlblRyYW5zYWN0aW9uTWV0YWRhdGESWgojc3Bhcmtfb3BlcmF0b3JfaWRlbnRpdHlfcH'
    'VibGljX2tleXMYAiADKAxCDPpCCZIBBiIEegJoIVIfc3BhcmtPcGVyYXRvcklkZW50aXR5UHVi'
    'bGljS2V5cxIyCgduZXR3b3JrGAMgASgOMg4uc3BhcmsuTmV0d29ya0II+kIFggECIABSB25ldH'
    'dvcmsSVAoYY2xpZW50X2NyZWF0ZWRfdGltZXN0YW1wGAQgASgLMhouZ29vZ2xlLnByb3RvYnVm'
    'LlRpbWVzdGFtcFIWY2xpZW50Q3JlYXRlZFRpbWVzdGFtcBJGChl2YWxpZGl0eV9kdXJhdGlvbl'
    '9zZWNvbmRzGAUgASgEQgr6QgcyBRisAigBUhd2YWxpZGl0eUR1cmF0aW9uU2Vjb25kcxJPChNp'
    'bnZvaWNlX2F0dGFjaG1lbnRzGAYgAygLMh4uc3BhcmtfdG9rZW4uSW52b2ljZUF0dGFjaG1lbn'
    'RSEmludm9pY2VBdHRhY2htZW50cw==');

@$core.Deprecated('Use partialTokenTransactionDescriptor instead')
const PartialTokenTransaction$json = {
  '1': 'PartialTokenTransaction',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 13, '10': 'version'},
    {
      '1': 'token_transaction_metadata',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark_token.TokenTransactionMetadata',
      '10': 'tokenTransactionMetadata'
    },
    {
      '1': 'mint_input',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark_token.TokenMintInput',
      '9': 0,
      '10': 'mintInput'
    },
    {
      '1': 'transfer_input',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark_token.TokenTransferInput',
      '9': 0,
      '10': 'transferInput'
    },
    {
      '1': 'create_input',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.spark_token.TokenCreateInput',
      '9': 0,
      '10': 'createInput'
    },
    {
      '1': 'partial_token_outputs',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.spark_token.PartialTokenOutput',
      '10': 'partialTokenOutputs'
    },
    {
      '1': 'execute_before',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 1,
      '10': 'executeBefore',
      '17': true
    },
  ],
  '8': [
    {'1': 'token_inputs'},
    {'1': '_execute_before'},
  ],
};

/// Descriptor for `PartialTokenTransaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List partialTokenTransactionDescriptor = $convert.base64Decode(
    'ChdQYXJ0aWFsVG9rZW5UcmFuc2FjdGlvbhIYCgd2ZXJzaW9uGAEgASgNUgd2ZXJzaW9uEmMKGn'
    'Rva2VuX3RyYW5zYWN0aW9uX21ldGFkYXRhGAIgASgLMiUuc3BhcmtfdG9rZW4uVG9rZW5UcmFu'
    'c2FjdGlvbk1ldGFkYXRhUhh0b2tlblRyYW5zYWN0aW9uTWV0YWRhdGESPAoKbWludF9pbnB1dB'
    'gDIAEoCzIbLnNwYXJrX3Rva2VuLlRva2VuTWludElucHV0SABSCW1pbnRJbnB1dBJICg50cmFu'
    'c2Zlcl9pbnB1dBgEIAEoCzIfLnNwYXJrX3Rva2VuLlRva2VuVHJhbnNmZXJJbnB1dEgAUg10cm'
    'Fuc2ZlcklucHV0EkIKDGNyZWF0ZV9pbnB1dBgFIAEoCzIdLnNwYXJrX3Rva2VuLlRva2VuQ3Jl'
    'YXRlSW5wdXRIAFILY3JlYXRlSW5wdXQSUwoVcGFydGlhbF90b2tlbl9vdXRwdXRzGAYgAygLMh'
    '8uc3BhcmtfdG9rZW4uUGFydGlhbFRva2VuT3V0cHV0UhNwYXJ0aWFsVG9rZW5PdXRwdXRzEkYK'
    'DmV4ZWN1dGVfYmVmb3JlGAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgBUg1leG'
    'VjdXRlQmVmb3JliAEBQg4KDHRva2VuX2lucHV0c0IRCg9fZXhlY3V0ZV9iZWZvcmU=');

@$core.Deprecated('Use finalTokenTransactionDescriptor instead')
const FinalTokenTransaction$json = {
  '1': 'FinalTokenTransaction',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 13, '10': 'version'},
    {
      '1': 'token_transaction_metadata',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark_token.TokenTransactionMetadata',
      '10': 'tokenTransactionMetadata'
    },
    {
      '1': 'mint_input',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark_token.TokenMintInput',
      '9': 0,
      '10': 'mintInput'
    },
    {
      '1': 'transfer_input',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark_token.TokenTransferInput',
      '9': 0,
      '10': 'transferInput'
    },
    {
      '1': 'create_input',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.spark_token.TokenCreateInput',
      '9': 0,
      '10': 'createInput'
    },
    {
      '1': 'final_token_outputs',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.spark_token.FinalTokenOutput',
      '10': 'finalTokenOutputs'
    },
    {
      '1': 'execute_before',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 1,
      '10': 'executeBefore',
      '17': true
    },
  ],
  '8': [
    {'1': 'token_inputs'},
    {'1': '_execute_before'},
  ],
};

/// Descriptor for `FinalTokenTransaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List finalTokenTransactionDescriptor = $convert.base64Decode(
    'ChVGaW5hbFRva2VuVHJhbnNhY3Rpb24SGAoHdmVyc2lvbhgBIAEoDVIHdmVyc2lvbhJjChp0b2'
    'tlbl90cmFuc2FjdGlvbl9tZXRhZGF0YRgCIAEoCzIlLnNwYXJrX3Rva2VuLlRva2VuVHJhbnNh'
    'Y3Rpb25NZXRhZGF0YVIYdG9rZW5UcmFuc2FjdGlvbk1ldGFkYXRhEjwKCm1pbnRfaW5wdXQYAy'
    'ABKAsyGy5zcGFya190b2tlbi5Ub2tlbk1pbnRJbnB1dEgAUgltaW50SW5wdXQSSAoOdHJhbnNm'
    'ZXJfaW5wdXQYBCABKAsyHy5zcGFya190b2tlbi5Ub2tlblRyYW5zZmVySW5wdXRIAFINdHJhbn'
    'NmZXJJbnB1dBJCCgxjcmVhdGVfaW5wdXQYBSABKAsyHS5zcGFya190b2tlbi5Ub2tlbkNyZWF0'
    'ZUlucHV0SABSC2NyZWF0ZUlucHV0Ek0KE2ZpbmFsX3Rva2VuX291dHB1dHMYBiADKAsyHS5zcG'
    'Fya190b2tlbi5GaW5hbFRva2VuT3V0cHV0UhFmaW5hbFRva2VuT3V0cHV0cxJGCg5leGVjdXRl'
    'X2JlZm9yZRgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIAVINZXhlY3V0ZUJlZm'
    '9yZYgBAUIOCgx0b2tlbl9pbnB1dHNCEQoPX2V4ZWN1dGVfYmVmb3Jl');

@$core.Deprecated('Use invoiceAttachmentDescriptor instead')
const InvoiceAttachment$json = {
  '1': 'InvoiceAttachment',
  '2': [
    {'1': 'spark_invoice', '3': 1, '4': 1, '5': 9, '10': 'sparkInvoice'},
  ],
};

/// Descriptor for `InvoiceAttachment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List invoiceAttachmentDescriptor = $convert.base64Decode(
    'ChFJbnZvaWNlQXR0YWNobWVudBIjCg1zcGFya19pbnZvaWNlGAEgASgJUgxzcGFya0ludm9pY2'
    'U=');

@$core.Deprecated('Use signatureWithIndexDescriptor instead')
const SignatureWithIndex$json = {
  '1': 'SignatureWithIndex',
  '2': [
    {
      '1': 'signature',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {},
      '9': 1,
      '10': 'signature',
      '17': true
    },
    {'1': 'input_index', '3': 2, '4': 1, '5': 13, '10': 'inputIndex'},
    {
      '1': 'single_signature',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.multisig.KeyedSignature',
      '9': 0,
      '10': 'singleSignature'
    },
    {
      '1': 'multisig_signatures',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.multisig.MultisigSignatureSet',
      '9': 0,
      '10': 'multisigSignatures'
    },
  ],
  '8': [
    {'1': 'authority_signatures'},
    {'1': '_signature'},
  ],
};

/// Descriptor for `SignatureWithIndex`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signatureWithIndexDescriptor = $convert.base64Decode(
    'ChJTaWduYXR1cmVXaXRoSW5kZXgSOAoJc2lnbmF0dXJlGAEgASgMQhX6QgR6AnAB+kIEegIQQP'
    'pCBHoCGElIAVIJc2lnbmF0dXJliAEBEh8KC2lucHV0X2luZGV4GAIgASgNUgppbnB1dEluZGV4'
    'EkUKEHNpbmdsZV9zaWduYXR1cmUYAyABKAsyGC5tdWx0aXNpZy5LZXllZFNpZ25hdHVyZUgAUg'
    '9zaW5nbGVTaWduYXR1cmUSUQoTbXVsdGlzaWdfc2lnbmF0dXJlcxgEIAEoCzIeLm11bHRpc2ln'
    'Lk11bHRpc2lnU2lnbmF0dXJlU2V0SABSEm11bHRpc2lnU2lnbmF0dXJlc0IWChRhdXRob3JpdH'
    'lfc2lnbmF0dXJlc0IMCgpfc2lnbmF0dXJl');

@$core.Deprecated('Use inputTtxoSignaturesPerOperatorDescriptor instead')
const InputTtxoSignaturesPerOperator$json = {
  '1': 'InputTtxoSignaturesPerOperator',
  '2': [
    {
      '1': 'ttxo_signatures',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark_token.SignatureWithIndex',
      '10': 'ttxoSignatures'
    },
    {
      '1': 'operator_identity_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'operatorIdentityPublicKey'
    },
  ],
};

/// Descriptor for `InputTtxoSignaturesPerOperator`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputTtxoSignaturesPerOperatorDescriptor =
    $convert.base64Decode(
        'Ch5JbnB1dFR0eG9TaWduYXR1cmVzUGVyT3BlcmF0b3ISSAoPdHR4b19zaWduYXR1cmVzGAEgAy'
        'gLMh8uc3BhcmtfdG9rZW4uU2lnbmF0dXJlV2l0aEluZGV4Ug50dHhvU2lnbmF0dXJlcxJIChxv'
        'cGVyYXRvcl9pZGVudGl0eV9wdWJsaWNfa2V5GAIgASgMQgf6QgR6AmghUhlvcGVyYXRvcklkZW'
        '50aXR5UHVibGljS2V5');

@$core.Deprecated('Use startTransactionRequestDescriptor instead')
const StartTransactionRequest$json = {
  '1': 'StartTransactionRequest',
  '2': [
    {
      '1': 'identity_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'identityPublicKey'
    },
    {
      '1': 'partial_token_transaction',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark_token.TokenTransaction',
      '10': 'partialTokenTransaction'
    },
    {
      '1': 'partial_token_transaction_owner_signatures',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.spark_token.SignatureWithIndex',
      '10': 'partialTokenTransactionOwnerSignatures'
    },
    {
      '1': 'validity_duration_seconds',
      '3': 4,
      '4': 1,
      '5': 4,
      '8': {},
      '10': 'validityDurationSeconds'
    },
  ],
};

/// Descriptor for `StartTransactionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startTransactionRequestDescriptor = $convert.base64Decode(
    'ChdTdGFydFRyYW5zYWN0aW9uUmVxdWVzdBI3ChNpZGVudGl0eV9wdWJsaWNfa2V5GAEgASgMQg'
    'f6QgR6AmghUhFpZGVudGl0eVB1YmxpY0tleRJZChlwYXJ0aWFsX3Rva2VuX3RyYW5zYWN0aW9u'
    'GAIgASgLMh0uc3BhcmtfdG9rZW4uVG9rZW5UcmFuc2FjdGlvblIXcGFydGlhbFRva2VuVHJhbn'
    'NhY3Rpb24SewoqcGFydGlhbF90b2tlbl90cmFuc2FjdGlvbl9vd25lcl9zaWduYXR1cmVzGAMg'
    'AygLMh8uc3BhcmtfdG9rZW4uU2lnbmF0dXJlV2l0aEluZGV4UiZwYXJ0aWFsVG9rZW5UcmFuc2'
    'FjdGlvbk93bmVyU2lnbmF0dXJlcxJGChl2YWxpZGl0eV9kdXJhdGlvbl9zZWNvbmRzGAQgASgE'
    'Qgr6QgcyBRisAigBUhd2YWxpZGl0eUR1cmF0aW9uU2Vjb25kcw==');

@$core.Deprecated('Use startTransactionResponseDescriptor instead')
const StartTransactionResponse$json = {
  '1': 'StartTransactionResponse',
  '2': [
    {
      '1': 'final_token_transaction',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark_token.TokenTransaction',
      '10': 'finalTokenTransaction'
    },
    {
      '1': 'keyshare_info',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningKeyshare',
      '10': 'keyshareInfo'
    },
  ],
};

/// Descriptor for `StartTransactionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startTransactionResponseDescriptor = $convert.base64Decode(
    'ChhTdGFydFRyYW5zYWN0aW9uUmVzcG9uc2USVQoXZmluYWxfdG9rZW5fdHJhbnNhY3Rpb24YAS'
    'ABKAsyHS5zcGFya190b2tlbi5Ub2tlblRyYW5zYWN0aW9uUhVmaW5hbFRva2VuVHJhbnNhY3Rp'
    'b24SOwoNa2V5c2hhcmVfaW5mbxgCIAEoCzIWLnNwYXJrLlNpZ25pbmdLZXlzaGFyZVIMa2V5c2'
    'hhcmVJbmZv');

@$core.Deprecated('Use commitTransactionRequestDescriptor instead')
const CommitTransactionRequest$json = {
  '1': 'CommitTransactionRequest',
  '2': [
    {
      '1': 'final_token_transaction',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark_token.TokenTransaction',
      '10': 'finalTokenTransaction'
    },
    {
      '1': 'final_token_transaction_hash',
      '3': 2,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'finalTokenTransactionHash'
    },
    {
      '1': 'input_ttxo_signatures_per_operator',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.spark_token.InputTtxoSignaturesPerOperator',
      '10': 'inputTtxoSignaturesPerOperator'
    },
    {
      '1': 'owner_identity_public_key',
      '3': 4,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'ownerIdentityPublicKey'
    },
  ],
};

/// Descriptor for `CommitTransactionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commitTransactionRequestDescriptor = $convert.base64Decode(
    'ChhDb21taXRUcmFuc2FjdGlvblJlcXVlc3QSVQoXZmluYWxfdG9rZW5fdHJhbnNhY3Rpb24YAS'
    'ABKAsyHS5zcGFya190b2tlbi5Ub2tlblRyYW5zYWN0aW9uUhVmaW5hbFRva2VuVHJhbnNhY3Rp'
    'b24SSAocZmluYWxfdG9rZW5fdHJhbnNhY3Rpb25faGFzaBgCIAEoDEIH+kIEegJoIFIZZmluYW'
    'xUb2tlblRyYW5zYWN0aW9uSGFzaBJ3CiJpbnB1dF90dHhvX3NpZ25hdHVyZXNfcGVyX29wZXJh'
    'dG9yGAMgAygLMisuc3BhcmtfdG9rZW4uSW5wdXRUdHhvU2lnbmF0dXJlc1Blck9wZXJhdG9yUh'
    '5pbnB1dFR0eG9TaWduYXR1cmVzUGVyT3BlcmF0b3ISQgoZb3duZXJfaWRlbnRpdHlfcHVibGlj'
    'X2tleRgEIAEoDEIH+kIEegJoIVIWb3duZXJJZGVudGl0eVB1YmxpY0tleQ==');

@$core.Deprecated('Use commitProgressDescriptor instead')
const CommitProgress$json = {
  '1': 'CommitProgress',
  '2': [
    {
      '1': 'committed_operator_public_keys',
      '3': 1,
      '4': 3,
      '5': 12,
      '8': {},
      '10': 'committedOperatorPublicKeys'
    },
    {
      '1': 'uncommitted_operator_public_keys',
      '3': 2,
      '4': 3,
      '5': 12,
      '8': {},
      '10': 'uncommittedOperatorPublicKeys'
    },
  ],
};

/// Descriptor for `CommitProgress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commitProgressDescriptor = $convert.base64Decode(
    'Cg5Db21taXRQcm9ncmVzcxJRCh5jb21taXR0ZWRfb3BlcmF0b3JfcHVibGljX2tleXMYASADKA'
    'xCDPpCCZIBBiIEegJoIVIbY29tbWl0dGVkT3BlcmF0b3JQdWJsaWNLZXlzElUKIHVuY29tbWl0'
    'dGVkX29wZXJhdG9yX3B1YmxpY19rZXlzGAIgAygMQgz6QgmSAQYiBHoCaCFSHXVuY29tbWl0dG'
    'VkT3BlcmF0b3JQdWJsaWNLZXlz');

@$core.Deprecated('Use commitTransactionResponseDescriptor instead')
const CommitTransactionResponse$json = {
  '1': 'CommitTransactionResponse',
  '2': [
    {
      '1': 'commit_status',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.spark_token.CommitStatus',
      '10': 'commitStatus'
    },
    {
      '1': 'commit_progress',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark_token.CommitProgress',
      '10': 'commitProgress'
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

/// Descriptor for `CommitTransactionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commitTransactionResponseDescriptor = $convert.base64Decode(
    'ChlDb21taXRUcmFuc2FjdGlvblJlc3BvbnNlEj4KDWNvbW1pdF9zdGF0dXMYASABKA4yGS5zcG'
    'Fya190b2tlbi5Db21taXRTdGF0dXNSDGNvbW1pdFN0YXR1cxJECg9jb21taXRfcHJvZ3Jlc3MY'
    'AiABKAsyGy5zcGFya190b2tlbi5Db21taXRQcm9ncmVzc1IOY29tbWl0UHJvZ3Jlc3MSNwoQdG'
    '9rZW5faWRlbnRpZmllchgDIAEoDEIH+kIEegJoIEgAUg90b2tlbklkZW50aWZpZXKIAQFCEwoR'
    'X3Rva2VuX2lkZW50aWZpZXI=');

@$core.Deprecated('Use broadcastTransactionRequestDescriptor instead')
const BroadcastTransactionRequest$json = {
  '1': 'BroadcastTransactionRequest',
  '2': [
    {
      '1': 'identity_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'identityPublicKey'
    },
    {
      '1': 'partial_token_transaction',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark_token.PartialTokenTransaction',
      '10': 'partialTokenTransaction'
    },
    {
      '1': 'token_transaction_owner_signatures',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.spark_token.SignatureWithIndex',
      '10': 'tokenTransactionOwnerSignatures'
    },
  ],
};

/// Descriptor for `BroadcastTransactionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List broadcastTransactionRequestDescriptor = $convert.base64Decode(
    'ChtCcm9hZGNhc3RUcmFuc2FjdGlvblJlcXVlc3QSNwoTaWRlbnRpdHlfcHVibGljX2tleRgBIA'
    'EoDEIH+kIEegJoIVIRaWRlbnRpdHlQdWJsaWNLZXkSYAoZcGFydGlhbF90b2tlbl90cmFuc2Fj'
    'dGlvbhgCIAEoCzIkLnNwYXJrX3Rva2VuLlBhcnRpYWxUb2tlblRyYW5zYWN0aW9uUhdwYXJ0aW'
    'FsVG9rZW5UcmFuc2FjdGlvbhJsCiJ0b2tlbl90cmFuc2FjdGlvbl9vd25lcl9zaWduYXR1cmVz'
    'GAMgAygLMh8uc3BhcmtfdG9rZW4uU2lnbmF0dXJlV2l0aEluZGV4Uh90b2tlblRyYW5zYWN0aW'
    '9uT3duZXJTaWduYXR1cmVz');

@$core.Deprecated('Use broadcastTransactionResponseDescriptor instead')
const BroadcastTransactionResponse$json = {
  '1': 'BroadcastTransactionResponse',
  '2': [
    {
      '1': 'final_token_transaction',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark_token.FinalTokenTransaction',
      '10': 'finalTokenTransaction'
    },
    {
      '1': 'commit_status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.spark_token.CommitStatus',
      '10': 'commitStatus'
    },
    {
      '1': 'commit_progress',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark_token.CommitProgress',
      '10': 'commitProgress'
    },
    {
      '1': 'token_identifier',
      '3': 4,
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

/// Descriptor for `BroadcastTransactionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List broadcastTransactionResponseDescriptor = $convert.base64Decode(
    'ChxCcm9hZGNhc3RUcmFuc2FjdGlvblJlc3BvbnNlEloKF2ZpbmFsX3Rva2VuX3RyYW5zYWN0aW'
    '9uGAEgASgLMiIuc3BhcmtfdG9rZW4uRmluYWxUb2tlblRyYW5zYWN0aW9uUhVmaW5hbFRva2Vu'
    'VHJhbnNhY3Rpb24SPgoNY29tbWl0X3N0YXR1cxgCIAEoDjIZLnNwYXJrX3Rva2VuLkNvbW1pdF'
    'N0YXR1c1IMY29tbWl0U3RhdHVzEkQKD2NvbW1pdF9wcm9ncmVzcxgDIAEoCzIbLnNwYXJrX3Rv'
    'a2VuLkNvbW1pdFByb2dyZXNzUg5jb21taXRQcm9ncmVzcxI3ChB0b2tlbl9pZGVudGlmaWVyGA'
    'QgASgMQgf6QgR6AmggSABSD3Rva2VuSWRlbnRpZmllcogBAUITChFfdG9rZW5faWRlbnRpZmll'
    'cg==');

@$core.Deprecated('Use queryTokenMetadataRequestDescriptor instead')
const QueryTokenMetadataRequest$json = {
  '1': 'QueryTokenMetadataRequest',
  '2': [
    {
      '1': 'token_identifiers',
      '3': 1,
      '4': 3,
      '5': 12,
      '8': {},
      '10': 'tokenIdentifiers'
    },
    {
      '1': 'issuer_public_keys',
      '3': 2,
      '4': 3,
      '5': 12,
      '8': {},
      '10': 'issuerPublicKeys'
    },
  ],
};

/// Descriptor for `QueryTokenMetadataRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTokenMetadataRequestDescriptor = $convert.base64Decode(
    'ChlRdWVyeVRva2VuTWV0YWRhdGFSZXF1ZXN0EjkKEXRva2VuX2lkZW50aWZpZXJzGAEgAygMQg'
    'z6QgmSAQYiBHoCaCBSEHRva2VuSWRlbnRpZmllcnMSOgoSaXNzdWVyX3B1YmxpY19rZXlzGAIg'
    'AygMQgz6QgmSAQYiBHoCaCFSEGlzc3VlclB1YmxpY0tleXM=');

@$core.Deprecated('Use tokenMetadataDescriptor instead')
const TokenMetadata$json = {
  '1': 'TokenMetadata',
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
    {
      '1': 'token_identifier',
      '3': 8,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'tokenIdentifier'
    },
    {
      '1': 'extra_metadata',
      '3': 9,
      '4': 1,
      '5': 12,
      '8': {},
      '9': 1,
      '10': 'extraMetadata',
      '17': true
    },
  ],
  '8': [
    {'1': '_creation_entity_public_key'},
    {'1': '_extra_metadata'},
  ],
};

/// Descriptor for `TokenMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenMetadataDescriptor = $convert.base64Decode(
    'Cg1Ub2tlbk1ldGFkYXRhEjMKEWlzc3Vlcl9wdWJsaWNfa2V5GAEgASgMQgf6QgR6AmghUg9pc3'
    'N1ZXJQdWJsaWNLZXkSJgoKdG9rZW5fbmFtZRgCIAEoCUIH+kIEcgIYFFIJdG9rZW5OYW1lEioK'
    'DHRva2VuX3RpY2tlchgDIAEoCUIH+kIEcgIYBlILdG9rZW5UaWNrZXISJAoIZGVjaW1hbHMYBC'
    'ABKA1CCPpCBSoDGP8BUghkZWNpbWFscxImCgptYXhfc3VwcGx5GAUgASgMQgf6QgR6AmgQUglt'
    'YXhTdXBwbHkSIQoMaXNfZnJlZXphYmxlGAYgASgIUgtpc0ZyZWV6YWJsZRJJChpjcmVhdGlvbl'
    '9lbnRpdHlfcHVibGljX2tleRgHIAEoDEIH+kIEegJoIUgAUhdjcmVhdGlvbkVudGl0eVB1Ymxp'
    'Y0tleYgBARIyChB0b2tlbl9pZGVudGlmaWVyGAggASgMQgf6QgR6AmggUg90b2tlbklkZW50aW'
    'ZpZXISNAoOZXh0cmFfbWV0YWRhdGEYCSABKAxCCPpCBXoDGIAISAFSDWV4dHJhTWV0YWRhdGGI'
    'AQFCHQobX2NyZWF0aW9uX2VudGl0eV9wdWJsaWNfa2V5QhEKD19leHRyYV9tZXRhZGF0YQ==');

@$core.Deprecated('Use queryTokenMetadataResponseDescriptor instead')
const QueryTokenMetadataResponse$json = {
  '1': 'QueryTokenMetadataResponse',
  '2': [
    {
      '1': 'token_metadata',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark_token.TokenMetadata',
      '10': 'tokenMetadata'
    },
  ],
};

/// Descriptor for `QueryTokenMetadataResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTokenMetadataResponseDescriptor =
    $convert.base64Decode(
        'ChpRdWVyeVRva2VuTWV0YWRhdGFSZXNwb25zZRJBCg50b2tlbl9tZXRhZGF0YRgBIAMoCzIaLn'
        'NwYXJrX3Rva2VuLlRva2VuTWV0YWRhdGFSDXRva2VuTWV0YWRhdGE=');

@$core.Deprecated('Use queryTokenOutputsRequestDescriptor instead')
const QueryTokenOutputsRequest$json = {
  '1': 'QueryTokenOutputsRequest',
  '2': [
    {
      '1': 'owner_public_keys',
      '3': 1,
      '4': 3,
      '5': 12,
      '8': {},
      '10': 'ownerPublicKeys'
    },
    {
      '1': 'issuer_public_keys',
      '3': 2,
      '4': 3,
      '5': 12,
      '8': {},
      '10': 'issuerPublicKeys'
    },
    {
      '1': 'token_identifiers',
      '3': 4,
      '4': 3,
      '5': 12,
      '8': {},
      '10': 'tokenIdentifiers'
    },
    {
      '1': 'network',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.spark.Network',
      '10': 'network'
    },
    {
      '1': 'page_request',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.spark.PageRequest',
      '10': 'pageRequest'
    },
  ],
};

/// Descriptor for `QueryTokenOutputsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTokenOutputsRequestDescriptor = $convert.base64Decode(
    'ChhRdWVyeVRva2VuT3V0cHV0c1JlcXVlc3QSOAoRb3duZXJfcHVibGljX2tleXMYASADKAxCDP'
    'pCCZIBBiIEegJoIVIPb3duZXJQdWJsaWNLZXlzEjoKEmlzc3Vlcl9wdWJsaWNfa2V5cxgCIAMo'
    'DEIM+kIJkgEGIgR6AmghUhBpc3N1ZXJQdWJsaWNLZXlzEjkKEXRva2VuX2lkZW50aWZpZXJzGA'
    'QgAygMQgz6QgmSAQYiBHoCaCBSEHRva2VuSWRlbnRpZmllcnMSKAoHbmV0d29yaxgDIAEoDjIO'
    'LnNwYXJrLk5ldHdvcmtSB25ldHdvcmsSNQoMcGFnZV9yZXF1ZXN0GAUgASgLMhIuc3BhcmsuUG'
    'FnZVJlcXVlc3RSC3BhZ2VSZXF1ZXN0');

@$core.Deprecated('Use queryTokenTransactionsRequestDescriptor instead')
const QueryTokenTransactionsRequest$json = {
  '1': 'QueryTokenTransactionsRequest',
  '2': [
    {
      '1': 'by_tx_hash',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.spark_token.QueryTokenTransactionsByTxHash',
      '9': 0,
      '10': 'byTxHash'
    },
    {
      '1': 'by_filters',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.spark_token.QueryTokenTransactionsByFilters',
      '9': 0,
      '10': 'byFilters'
    },
    {'1': 'output_ids', '3': 1, '4': 3, '5': 9, '8': {}, '10': 'outputIds'},
    {
      '1': 'owner_public_keys',
      '3': 2,
      '4': 3,
      '5': 12,
      '8': {},
      '10': 'ownerPublicKeys'
    },
    {
      '1': 'issuer_public_keys',
      '3': 3,
      '4': 3,
      '5': 12,
      '8': {},
      '10': 'issuerPublicKeys'
    },
    {
      '1': 'token_identifiers',
      '3': 7,
      '4': 3,
      '5': 12,
      '8': {},
      '10': 'tokenIdentifiers'
    },
    {
      '1': 'token_transaction_hashes',
      '3': 4,
      '4': 3,
      '5': 12,
      '8': {},
      '10': 'tokenTransactionHashes'
    },
    {'1': 'order', '3': 8, '4': 1, '5': 14, '6': '.spark.Order', '10': 'order'},
    {'1': 'limit', '3': 5, '4': 1, '5': 3, '8': {}, '10': 'limit'},
    {'1': 'offset', '3': 6, '4': 1, '5': 3, '8': {}, '10': 'offset'},
  ],
  '8': [
    {'1': 'query_type'},
  ],
};

/// Descriptor for `QueryTokenTransactionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTokenTransactionsRequestDescriptor = $convert.base64Decode(
    'Ch1RdWVyeVRva2VuVHJhbnNhY3Rpb25zUmVxdWVzdBJLCgpieV90eF9oYXNoGAkgASgLMisuc3'
    'BhcmtfdG9rZW4uUXVlcnlUb2tlblRyYW5zYWN0aW9uc0J5VHhIYXNoSABSCGJ5VHhIYXNoEk0K'
    'CmJ5X2ZpbHRlcnMYCiABKAsyLC5zcGFya190b2tlbi5RdWVyeVRva2VuVHJhbnNhY3Rpb25zQn'
    'lGaWx0ZXJzSABSCWJ5RmlsdGVycxIsCgpvdXRwdXRfaWRzGAEgAygJQg36QgqSAQciBXIDsAEB'
    'UglvdXRwdXRJZHMSOAoRb3duZXJfcHVibGljX2tleXMYAiADKAxCDPpCCZIBBiIEegJoIVIPb3'
    'duZXJQdWJsaWNLZXlzEjoKEmlzc3Vlcl9wdWJsaWNfa2V5cxgDIAMoDEIM+kIJkgEGIgR6Amgh'
    'UhBpc3N1ZXJQdWJsaWNLZXlzEjkKEXRva2VuX2lkZW50aWZpZXJzGAcgAygMQgz6QgmSAQYiBH'
    'oCaCBSEHRva2VuSWRlbnRpZmllcnMSRgoYdG9rZW5fdHJhbnNhY3Rpb25faGFzaGVzGAQgAygM'
    'Qgz6QgmSAQYiBHoCaCBSFnRva2VuVHJhbnNhY3Rpb25IYXNoZXMSIgoFb3JkZXIYCCABKA4yDC'
    '5zcGFyay5PcmRlclIFb3JkZXISIAoFbGltaXQYBSABKANCCvpCByIFGOgHKABSBWxpbWl0Eh8K'
    'Bm9mZnNldBgGIAEoA0IH+kIEIgIoAFIGb2Zmc2V0QgwKCnF1ZXJ5X3R5cGU=');

@$core.Deprecated('Use queryTokenTransactionsByTxHashDescriptor instead')
const QueryTokenTransactionsByTxHash$json = {
  '1': 'QueryTokenTransactionsByTxHash',
  '2': [
    {
      '1': 'token_transaction_hashes',
      '3': 1,
      '4': 3,
      '5': 12,
      '8': {},
      '10': 'tokenTransactionHashes'
    },
  ],
};

/// Descriptor for `QueryTokenTransactionsByTxHash`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTokenTransactionsByTxHashDescriptor =
    $convert.base64Decode(
        'Ch5RdWVyeVRva2VuVHJhbnNhY3Rpb25zQnlUeEhhc2gSSAoYdG9rZW5fdHJhbnNhY3Rpb25faG'
        'FzaGVzGAEgAygMQg76QguSAQgIASIEegJoIFIWdG9rZW5UcmFuc2FjdGlvbkhhc2hlcw==');

@$core.Deprecated('Use queryTokenTransactionsByFiltersDescriptor instead')
const QueryTokenTransactionsByFilters$json = {
  '1': 'QueryTokenTransactionsByFilters',
  '2': [
    {'1': 'output_ids', '3': 1, '4': 3, '5': 9, '8': {}, '10': 'outputIds'},
    {
      '1': 'owner_public_keys',
      '3': 2,
      '4': 3,
      '5': 12,
      '8': {},
      '10': 'ownerPublicKeys'
    },
    {
      '1': 'issuer_public_keys',
      '3': 3,
      '4': 3,
      '5': 12,
      '8': {},
      '10': 'issuerPublicKeys'
    },
    {
      '1': 'token_identifiers',
      '3': 4,
      '4': 3,
      '5': 12,
      '8': {},
      '10': 'tokenIdentifiers'
    },
    {
      '1': 'page_request',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.spark.PageRequest',
      '10': 'pageRequest'
    },
  ],
};

/// Descriptor for `QueryTokenTransactionsByFilters`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTokenTransactionsByFiltersDescriptor = $convert.base64Decode(
    'Ch9RdWVyeVRva2VuVHJhbnNhY3Rpb25zQnlGaWx0ZXJzEiwKCm91dHB1dF9pZHMYASADKAlCDf'
    'pCCpIBByIFcgOwAQFSCW91dHB1dElkcxI4ChFvd25lcl9wdWJsaWNfa2V5cxgCIAMoDEIM+kIJ'
    'kgEGIgR6AmghUg9vd25lclB1YmxpY0tleXMSOgoSaXNzdWVyX3B1YmxpY19rZXlzGAMgAygMQg'
    'z6QgmSAQYiBHoCaCFSEGlzc3VlclB1YmxpY0tleXMSOQoRdG9rZW5faWRlbnRpZmllcnMYBCAD'
    'KAxCDPpCCZIBBiIEegJoIFIQdG9rZW5JZGVudGlmaWVycxI1CgxwYWdlX3JlcXVlc3QYBSABKA'
    'syEi5zcGFyay5QYWdlUmVxdWVzdFILcGFnZVJlcXVlc3Q=');

@$core.Deprecated('Use queryTokenTransactionsResponseDescriptor instead')
const QueryTokenTransactionsResponse$json = {
  '1': 'QueryTokenTransactionsResponse',
  '2': [
    {
      '1': 'token_transactions_with_status',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark_token.TokenTransactionWithStatus',
      '10': 'tokenTransactionsWithStatus'
    },
    {'1': 'offset', '3': 2, '4': 1, '5': 3, '10': 'offset'},
    {
      '1': 'page_response',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.PageResponse',
      '10': 'pageResponse'
    },
  ],
};

/// Descriptor for `QueryTokenTransactionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTokenTransactionsResponseDescriptor = $convert.base64Decode(
    'Ch5RdWVyeVRva2VuVHJhbnNhY3Rpb25zUmVzcG9uc2USbAoedG9rZW5fdHJhbnNhY3Rpb25zX3'
    'dpdGhfc3RhdHVzGAEgAygLMicuc3BhcmtfdG9rZW4uVG9rZW5UcmFuc2FjdGlvbldpdGhTdGF0'
    'dXNSG3Rva2VuVHJhbnNhY3Rpb25zV2l0aFN0YXR1cxIWCgZvZmZzZXQYAiABKANSBm9mZnNldB'
    'I4Cg1wYWdlX3Jlc3BvbnNlGAMgASgLMhMuc3BhcmsuUGFnZVJlc3BvbnNlUgxwYWdlUmVzcG9u'
    'c2U=');

@$core.Deprecated('Use outputWithPreviousTransactionDataDescriptor instead')
const OutputWithPreviousTransactionData$json = {
  '1': 'OutputWithPreviousTransactionData',
  '2': [
    {
      '1': 'output',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark_token.TokenOutput',
      '10': 'output'
    },
    {
      '1': 'previous_transaction_hash',
      '3': 2,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'previousTransactionHash'
    },
    {
      '1': 'previous_transaction_vout',
      '3': 3,
      '4': 1,
      '5': 13,
      '10': 'previousTransactionVout'
    },
  ],
};

/// Descriptor for `OutputWithPreviousTransactionData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List outputWithPreviousTransactionDataDescriptor =
    $convert.base64Decode(
        'CiFPdXRwdXRXaXRoUHJldmlvdXNUcmFuc2FjdGlvbkRhdGESMAoGb3V0cHV0GAEgASgLMhguc3'
        'BhcmtfdG9rZW4uVG9rZW5PdXRwdXRSBm91dHB1dBJDChlwcmV2aW91c190cmFuc2FjdGlvbl9o'
        'YXNoGAIgASgMQgf6QgR6AmggUhdwcmV2aW91c1RyYW5zYWN0aW9uSGFzaBI6ChlwcmV2aW91c1'
        '90cmFuc2FjdGlvbl92b3V0GAMgASgNUhdwcmV2aW91c1RyYW5zYWN0aW9uVm91dA==');

@$core.Deprecated('Use queryTokenOutputsResponseDescriptor instead')
const QueryTokenOutputsResponse$json = {
  '1': 'QueryTokenOutputsResponse',
  '2': [
    {
      '1': 'outputs_with_previous_transaction_data',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark_token.OutputWithPreviousTransactionData',
      '10': 'outputsWithPreviousTransactionData'
    },
    {
      '1': 'page_response',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.PageResponse',
      '10': 'pageResponse'
    },
  ],
};

/// Descriptor for `QueryTokenOutputsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTokenOutputsResponseDescriptor = $convert.base64Decode(
    'ChlRdWVyeVRva2VuT3V0cHV0c1Jlc3BvbnNlEoIBCiZvdXRwdXRzX3dpdGhfcHJldmlvdXNfdH'
    'JhbnNhY3Rpb25fZGF0YRgBIAMoCzIuLnNwYXJrX3Rva2VuLk91dHB1dFdpdGhQcmV2aW91c1Ry'
    'YW5zYWN0aW9uRGF0YVIib3V0cHV0c1dpdGhQcmV2aW91c1RyYW5zYWN0aW9uRGF0YRI4Cg1wYW'
    'dlX3Jlc3BvbnNlGAIgASgLMhMuc3BhcmsuUGFnZVJlc3BvbnNlUgxwYWdlUmVzcG9uc2U=');

@$core.Deprecated('Use spentTokenOutputMetadataDescriptor instead')
const SpentTokenOutputMetadata$json = {
  '1': 'SpentTokenOutputMetadata',
  '2': [
    {'1': 'output_id', '3': 1, '4': 1, '5': 9, '10': 'outputId'},
    {
      '1': 'revocation_secret',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'revocationSecret'
    },
  ],
};

/// Descriptor for `SpentTokenOutputMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List spentTokenOutputMetadataDescriptor =
    $convert.base64Decode(
        'ChhTcGVudFRva2VuT3V0cHV0TWV0YWRhdGESGwoJb3V0cHV0X2lkGAEgASgJUghvdXRwdXRJZB'
        'IrChFyZXZvY2F0aW9uX3NlY3JldBgCIAEoDFIQcmV2b2NhdGlvblNlY3JldA==');

@$core.Deprecated('Use tokenTransactionConfirmationMetadataDescriptor instead')
const TokenTransactionConfirmationMetadata$json = {
  '1': 'TokenTransactionConfirmationMetadata',
  '2': [
    {
      '1': 'spent_token_outputs_metadata',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark_token.SpentTokenOutputMetadata',
      '10': 'spentTokenOutputsMetadata'
    },
  ],
};

/// Descriptor for `TokenTransactionConfirmationMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenTransactionConfirmationMetadataDescriptor =
    $convert.base64Decode(
        'CiRUb2tlblRyYW5zYWN0aW9uQ29uZmlybWF0aW9uTWV0YWRhdGESZgocc3BlbnRfdG9rZW5fb3'
        'V0cHV0c19tZXRhZGF0YRgBIAMoCzIlLnNwYXJrX3Rva2VuLlNwZW50VG9rZW5PdXRwdXRNZXRh'
        'ZGF0YVIZc3BlbnRUb2tlbk91dHB1dHNNZXRhZGF0YQ==');

@$core.Deprecated('Use tokenTransactionWithStatusDescriptor instead')
const TokenTransactionWithStatus$json = {
  '1': 'TokenTransactionWithStatus',
  '2': [
    {
      '1': 'token_transaction',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark_token.TokenTransaction',
      '10': 'tokenTransaction'
    },
    {
      '1': 'status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.spark_token.TokenTransactionStatus',
      '10': 'status'
    },
    {
      '1': 'confirmation_metadata',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark_token.TokenTransactionConfirmationMetadata',
      '10': 'confirmationMetadata'
    },
    {
      '1': 'token_transaction_hash',
      '3': 4,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'tokenTransactionHash'
    },
  ],
};

/// Descriptor for `TokenTransactionWithStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenTransactionWithStatusDescriptor = $convert.base64Decode(
    'ChpUb2tlblRyYW5zYWN0aW9uV2l0aFN0YXR1cxJKChF0b2tlbl90cmFuc2FjdGlvbhgBIAEoCz'
    'IdLnNwYXJrX3Rva2VuLlRva2VuVHJhbnNhY3Rpb25SEHRva2VuVHJhbnNhY3Rpb24SOwoGc3Rh'
    'dHVzGAIgASgOMiMuc3BhcmtfdG9rZW4uVG9rZW5UcmFuc2FjdGlvblN0YXR1c1IGc3RhdHVzEm'
    'YKFWNvbmZpcm1hdGlvbl9tZXRhZGF0YRgDIAEoCzIxLnNwYXJrX3Rva2VuLlRva2VuVHJhbnNh'
    'Y3Rpb25Db25maXJtYXRpb25NZXRhZGF0YVIUY29uZmlybWF0aW9uTWV0YWRhdGESPQoWdG9rZW'
    '5fdHJhbnNhY3Rpb25faGFzaBgEIAEoDEIH+kIEegJoIFIUdG9rZW5UcmFuc2FjdGlvbkhhc2g=');

@$core.Deprecated('Use freezeTokensPayloadDescriptor instead')
const FreezeTokensPayload$json = {
  '1': 'FreezeTokensPayload',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 13, '10': 'version'},
    {
      '1': 'owner_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '8': {},
      '9': 0,
      '10': 'ownerPublicKey',
      '17': true
    },
    {
      '1': 'token_public_key',
      '3': 3,
      '4': 1,
      '5': 12,
      '8': {},
      '9': 1,
      '10': 'tokenPublicKey',
      '17': true
    },
    {
      '1': 'token_identifier',
      '3': 4,
      '4': 1,
      '5': 12,
      '8': {},
      '9': 2,
      '10': 'tokenIdentifier',
      '17': true
    },
    {
      '1': 'issuer_provided_timestamp',
      '3': 5,
      '4': 1,
      '5': 4,
      '10': 'issuerProvidedTimestamp'
    },
    {
      '1': 'operator_identity_public_key',
      '3': 6,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'operatorIdentityPublicKey'
    },
    {'1': 'should_unfreeze', '3': 7, '4': 1, '5': 8, '10': 'shouldUnfreeze'},
  ],
  '8': [
    {'1': '_owner_public_key'},
    {'1': '_token_public_key'},
    {'1': '_token_identifier'},
  ],
};

/// Descriptor for `FreezeTokensPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List freezeTokensPayloadDescriptor = $convert.base64Decode(
    'ChNGcmVlemVUb2tlbnNQYXlsb2FkEhgKB3ZlcnNpb24YASABKA1SB3ZlcnNpb24SNgoQb3duZX'
    'JfcHVibGljX2tleRgCIAEoDEIH+kIEegJoIUgAUg5vd25lclB1YmxpY0tleYgBARI2ChB0b2tl'
    'bl9wdWJsaWNfa2V5GAMgASgMQgf6QgR6AmghSAFSDnRva2VuUHVibGljS2V5iAEBEjcKEHRva2'
    'VuX2lkZW50aWZpZXIYBCABKAxCB/pCBHoCaCBIAlIPdG9rZW5JZGVudGlmaWVyiAEBEjoKGWlz'
    'c3Vlcl9wcm92aWRlZF90aW1lc3RhbXAYBSABKARSF2lzc3VlclByb3ZpZGVkVGltZXN0YW1wEk'
    'gKHG9wZXJhdG9yX2lkZW50aXR5X3B1YmxpY19rZXkYBiABKAxCB/pCBHoCaCFSGW9wZXJhdG9y'
    'SWRlbnRpdHlQdWJsaWNLZXkSJwoPc2hvdWxkX3VuZnJlZXplGAcgASgIUg5zaG91bGRVbmZyZW'
    'V6ZUITChFfb3duZXJfcHVibGljX2tleUITChFfdG9rZW5fcHVibGljX2tleUITChFfdG9rZW5f'
    'aWRlbnRpZmllcg==');

@$core.Deprecated('Use freezeTokensRequestDescriptor instead')
const FreezeTokensRequest$json = {
  '1': 'FreezeTokensRequest',
  '2': [
    {
      '1': 'freeze_tokens_payload',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark_token.FreezeTokensPayload',
      '10': 'freezeTokensPayload'
    },
    {
      '1': 'issuer_signature',
      '3': 2,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'issuerSignature'
    },
  ],
};

/// Descriptor for `FreezeTokensRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List freezeTokensRequestDescriptor = $convert.base64Decode(
    'ChNGcmVlemVUb2tlbnNSZXF1ZXN0ElQKFWZyZWV6ZV90b2tlbnNfcGF5bG9hZBgBIAEoCzIgLn'
    'NwYXJrX3Rva2VuLkZyZWV6ZVRva2Vuc1BheWxvYWRSE2ZyZWV6ZVRva2Vuc1BheWxvYWQSOQoQ'
    'aXNzdWVyX3NpZ25hdHVyZRgCIAEoDEIO+kIEegIQQPpCBHoCGElSD2lzc3VlclNpZ25hdHVyZQ'
    '==');

@$core.Deprecated('Use tokenOutputRefDescriptor instead')
const TokenOutputRef$json = {
  '1': 'TokenOutputRef',
  '2': [
    {
      '1': 'transaction_hash',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'transactionHash'
    },
    {'1': 'vout', '3': 2, '4': 1, '5': 13, '10': 'vout'},
  ],
};

/// Descriptor for `TokenOutputRef`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenOutputRefDescriptor = $convert.base64Decode(
    'Cg5Ub2tlbk91dHB1dFJlZhIyChB0cmFuc2FjdGlvbl9oYXNoGAEgASgMQgf6QgR6AmggUg90cm'
    'Fuc2FjdGlvbkhhc2gSEgoEdm91dBgCIAEoDVIEdm91dA==');

@$core.Deprecated('Use freezeProgressDescriptor instead')
const FreezeProgress$json = {
  '1': 'FreezeProgress',
  '2': [
    {
      '1': 'applied_operator_public_keys',
      '3': 1,
      '4': 3,
      '5': 12,
      '8': {},
      '10': 'appliedOperatorPublicKeys'
    },
  ],
};

/// Descriptor for `FreezeProgress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List freezeProgressDescriptor = $convert.base64Decode(
    'Cg5GcmVlemVQcm9ncmVzcxJNChxhcHBsaWVkX29wZXJhdG9yX3B1YmxpY19rZXlzGAEgAygMQg'
    'z6QgmSAQYiBHoCaCFSGWFwcGxpZWRPcGVyYXRvclB1YmxpY0tleXM=');

@$core.Deprecated('Use freezeTokensResponseDescriptor instead')
const FreezeTokensResponse$json = {
  '1': 'FreezeTokensResponse',
  '2': [
    {
      '1': 'impacted_output_ids',
      '3': 1,
      '4': 3,
      '5': 9,
      '8': {'3': true},
      '10': 'impactedOutputIds',
    },
    {
      '1': 'impacted_token_amount',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'impactedTokenAmount'
    },
    {
      '1': 'impacted_token_outputs',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.spark_token.TokenOutputRef',
      '10': 'impactedTokenOutputs'
    },
    {
      '1': 'freeze_progress',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark_token.FreezeProgress',
      '10': 'freezeProgress'
    },
  ],
};

/// Descriptor for `FreezeTokensResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List freezeTokensResponseDescriptor = $convert.base64Decode(
    'ChRGcmVlemVUb2tlbnNSZXNwb25zZRI/ChNpbXBhY3RlZF9vdXRwdXRfaWRzGAEgAygJQg8YAf'
    'pCCpIBByIFcgOwAQFSEWltcGFjdGVkT3V0cHV0SWRzEjIKFWltcGFjdGVkX3Rva2VuX2Ftb3Vu'
    'dBgCIAEoDFITaW1wYWN0ZWRUb2tlbkFtb3VudBJRChZpbXBhY3RlZF90b2tlbl9vdXRwdXRzGA'
    'MgAygLMhsuc3BhcmtfdG9rZW4uVG9rZW5PdXRwdXRSZWZSFGltcGFjdGVkVG9rZW5PdXRwdXRz'
    'EkQKD2ZyZWV6ZV9wcm9ncmVzcxgEIAEoCzIbLnNwYXJrX3Rva2VuLkZyZWV6ZVByb2dyZXNzUg'
    '5mcmVlemVQcm9ncmVzcw==');
