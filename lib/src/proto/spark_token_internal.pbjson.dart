// This is a generated file - do not edit.
//
// Generated from spark_token_internal.proto.

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

@$core.Deprecated('Use prepareTransactionRequestDescriptor instead')
const PrepareTransactionRequest$json = {
  '1': 'PrepareTransactionRequest',
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
      '1': 'token_transaction_signatures',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark_token.SignatureWithIndex',
      '10': 'tokenTransactionSignatures'
    },
    {'1': 'keyshare_ids', '3': 3, '4': 3, '5': 9, '8': {}, '10': 'keyshareIds'},
    {
      '1': 'coordinator_public_key',
      '3': 4,
      '4': 1,
      '5': 12,
      '10': 'coordinatorPublicKey'
    },
    {
      '1': 'execute_before',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 0,
      '10': 'executeBefore',
      '17': true
    },
  ],
  '8': [
    {'1': '_execute_before'},
  ],
};

/// Descriptor for `PrepareTransactionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List prepareTransactionRequestDescriptor = $convert.base64Decode(
    'ChlQcmVwYXJlVHJhbnNhY3Rpb25SZXF1ZXN0ElUKF2ZpbmFsX3Rva2VuX3RyYW5zYWN0aW9uGA'
    'EgASgLMh0uc3BhcmtfdG9rZW4uVG9rZW5UcmFuc2FjdGlvblIVZmluYWxUb2tlblRyYW5zYWN0'
    'aW9uEmEKHHRva2VuX3RyYW5zYWN0aW9uX3NpZ25hdHVyZXMYAiADKAsyHy5zcGFya190b2tlbi'
    '5TaWduYXR1cmVXaXRoSW5kZXhSGnRva2VuVHJhbnNhY3Rpb25TaWduYXR1cmVzEjAKDGtleXNo'
    'YXJlX2lkcxgDIAMoCUIN+kIKkgEHIgVyA7ABAVILa2V5c2hhcmVJZHMSNAoWY29vcmRpbmF0b3'
    'JfcHVibGljX2tleRgEIAEoDFIUY29vcmRpbmF0b3JQdWJsaWNLZXkSRgoOZXhlY3V0ZV9iZWZv'
    'cmUYBSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSABSDWV4ZWN1dGVCZWZvcmWIAQ'
    'FCEQoPX2V4ZWN1dGVfYmVmb3Jl');

@$core.Deprecated('Use prepareTransactionResponseDescriptor instead')
const PrepareTransactionResponse$json = {
  '1': 'PrepareTransactionResponse',
};

/// Descriptor for `PrepareTransactionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List prepareTransactionResponseDescriptor =
    $convert.base64Decode('ChpQcmVwYXJlVHJhbnNhY3Rpb25SZXNwb25zZQ==');

@$core.Deprecated(
    'Use signTokenTransactionFromCoordinationRequestDescriptor instead')
const SignTokenTransactionFromCoordinationRequest$json = {
  '1': 'SignTokenTransactionFromCoordinationRequest',
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
      '4': 1,
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

/// Descriptor for `SignTokenTransactionFromCoordinationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signTokenTransactionFromCoordinationRequestDescriptor = $convert.base64Decode(
    'CitTaWduVG9rZW5UcmFuc2FjdGlvbkZyb21Db29yZGluYXRpb25SZXF1ZXN0ElUKF2ZpbmFsX3'
    'Rva2VuX3RyYW5zYWN0aW9uGAEgASgLMh0uc3BhcmtfdG9rZW4uVG9rZW5UcmFuc2FjdGlvblIV'
    'ZmluYWxUb2tlblRyYW5zYWN0aW9uEkgKHGZpbmFsX3Rva2VuX3RyYW5zYWN0aW9uX2hhc2gYAi'
    'ABKAxCB/pCBHoCaCBSGWZpbmFsVG9rZW5UcmFuc2FjdGlvbkhhc2gSdwoiaW5wdXRfdHR4b19z'
    'aWduYXR1cmVzX3Blcl9vcGVyYXRvchgDIAEoCzIrLnNwYXJrX3Rva2VuLklucHV0VHR4b1NpZ2'
    '5hdHVyZXNQZXJPcGVyYXRvclIeaW5wdXRUdHhvU2lnbmF0dXJlc1Blck9wZXJhdG9yEkIKGW93'
    'bmVyX2lkZW50aXR5X3B1YmxpY19rZXkYBCABKAxCB/pCBHoCaCFSFm93bmVySWRlbnRpdHlQdW'
    'JsaWNLZXk=');

@$core.Deprecated(
    'Use signTokenTransactionFromCoordinationResponseDescriptor instead')
const SignTokenTransactionFromCoordinationResponse$json = {
  '1': 'SignTokenTransactionFromCoordinationResponse',
  '2': [
    {
      '1': 'spark_operator_signature',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'sparkOperatorSignature'
    },
  ],
};

/// Descriptor for `SignTokenTransactionFromCoordinationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List
    signTokenTransactionFromCoordinationResponseDescriptor =
    $convert.base64Decode(
        'CixTaWduVG9rZW5UcmFuc2FjdGlvbkZyb21Db29yZGluYXRpb25SZXNwb25zZRJIChhzcGFya1'
        '9vcGVyYXRvcl9zaWduYXR1cmUYASABKAxCDvpCBHoCEED6QgR6AhhJUhZzcGFya09wZXJhdG9y'
        'U2lnbmF0dXJl');

@$core.Deprecated('Use operatorTransactionSignatureDescriptor instead')
const OperatorTransactionSignature$json = {
  '1': 'OperatorTransactionSignature',
  '2': [
    {
      '1': 'operator_identity_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'operatorIdentityPublicKey'
    },
    {'1': 'signature', '3': 2, '4': 1, '5': 12, '8': {}, '10': 'signature'},
  ],
};

/// Descriptor for `OperatorTransactionSignature`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List operatorTransactionSignatureDescriptor =
    $convert.base64Decode(
        'ChxPcGVyYXRvclRyYW5zYWN0aW9uU2lnbmF0dXJlEkgKHG9wZXJhdG9yX2lkZW50aXR5X3B1Ym'
        'xpY19rZXkYASABKAxCB/pCBHoCaCFSGW9wZXJhdG9ySWRlbnRpdHlQdWJsaWNLZXkSLAoJc2ln'
        'bmF0dXJlGAIgASgMQg76QgR6AhBA+kIEegIYSVIJc2lnbmF0dXJl');

@$core.Deprecated('Use revocationSecretShareDescriptor instead')
const RevocationSecretShare$json = {
  '1': 'RevocationSecretShare',
  '2': [
    {
      '1': 'input_ttxo_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {'3': true},
      '10': 'inputTtxoId',
    },
    {'1': 'secret_share', '3': 2, '4': 1, '5': 12, '10': 'secretShare'},
    {
      '1': 'input_ttxo_ref',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark_token.TokenOutputToSpend',
      '10': 'inputTtxoRef'
    },
  ],
};

/// Descriptor for `RevocationSecretShare`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List revocationSecretShareDescriptor = $convert.base64Decode(
    'ChVSZXZvY2F0aW9uU2VjcmV0U2hhcmUSJgoNaW5wdXRfdHR4b19pZBgBIAEoCUICGAFSC2lucH'
    'V0VHR4b0lkEiEKDHNlY3JldF9zaGFyZRgCIAEoDFILc2VjcmV0U2hhcmUSRQoOaW5wdXRfdHR4'
    'b19yZWYYAyABKAsyHy5zcGFya190b2tlbi5Ub2tlbk91dHB1dFRvU3BlbmRSDGlucHV0VHR4b1'
    'JlZg==');

@$core.Deprecated('Use operatorRevocationSharesDescriptor instead')
const OperatorRevocationShares$json = {
  '1': 'OperatorRevocationShares',
  '2': [
    {
      '1': 'operator_identity_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'operatorIdentityPublicKey'
    },
    {
      '1': 'shares',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark_token.RevocationSecretShare',
      '10': 'shares'
    },
  ],
};

/// Descriptor for `OperatorRevocationShares`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List operatorRevocationSharesDescriptor = $convert.base64Decode(
    'ChhPcGVyYXRvclJldm9jYXRpb25TaGFyZXMSSAocb3BlcmF0b3JfaWRlbnRpdHlfcHVibGljX2'
    'tleRgBIAEoDEIH+kIEegJoIVIZb3BlcmF0b3JJZGVudGl0eVB1YmxpY0tleRI6CgZzaGFyZXMY'
    'AiADKAsyIi5zcGFya190b2tlbi5SZXZvY2F0aW9uU2VjcmV0U2hhcmVSBnNoYXJlcw==');

@$core
    .Deprecated('Use exchangeRevocationSecretsSharesRequestDescriptor instead')
const ExchangeRevocationSecretsSharesRequest$json = {
  '1': 'ExchangeRevocationSecretsSharesRequest',
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
      '1': 'operator_transaction_signatures',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.spark_token.OperatorTransactionSignature',
      '10': 'operatorTransactionSignatures'
    },
    {
      '1': 'operator_shares',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.spark_token.OperatorRevocationShares',
      '10': 'operatorShares'
    },
    {
      '1': 'operator_identity_public_key',
      '3': 5,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'operatorIdentityPublicKey'
    },
    {
      '1': 'outputs_to_spend',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.spark_token.OutputToSpend',
      '10': 'outputsToSpend'
    },
  ],
};

/// Descriptor for `ExchangeRevocationSecretsSharesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exchangeRevocationSecretsSharesRequestDescriptor = $convert.base64Decode(
    'CiZFeGNoYW5nZVJldm9jYXRpb25TZWNyZXRzU2hhcmVzUmVxdWVzdBJVChdmaW5hbF90b2tlbl'
    '90cmFuc2FjdGlvbhgBIAEoCzIdLnNwYXJrX3Rva2VuLlRva2VuVHJhbnNhY3Rpb25SFWZpbmFs'
    'VG9rZW5UcmFuc2FjdGlvbhJIChxmaW5hbF90b2tlbl90cmFuc2FjdGlvbl9oYXNoGAIgASgMQg'
    'f6QgR6AmggUhlmaW5hbFRva2VuVHJhbnNhY3Rpb25IYXNoEnEKH29wZXJhdG9yX3RyYW5zYWN0'
    'aW9uX3NpZ25hdHVyZXMYAyADKAsyKS5zcGFya190b2tlbi5PcGVyYXRvclRyYW5zYWN0aW9uU2'
    'lnbmF0dXJlUh1vcGVyYXRvclRyYW5zYWN0aW9uU2lnbmF0dXJlcxJOCg9vcGVyYXRvcl9zaGFy'
    'ZXMYBCADKAsyJS5zcGFya190b2tlbi5PcGVyYXRvclJldm9jYXRpb25TaGFyZXNSDm9wZXJhdG'
    '9yU2hhcmVzEkgKHG9wZXJhdG9yX2lkZW50aXR5X3B1YmxpY19rZXkYBSABKAxCB/pCBHoCaCFS'
    'GW9wZXJhdG9ySWRlbnRpdHlQdWJsaWNLZXkSRAoQb3V0cHV0c190b19zcGVuZBgGIAMoCzIaLn'
    'NwYXJrX3Rva2VuLk91dHB1dFRvU3BlbmRSDm91dHB1dHNUb1NwZW5k');

@$core
    .Deprecated('Use exchangeRevocationSecretsSharesResponseDescriptor instead')
const ExchangeRevocationSecretsSharesResponse$json = {
  '1': 'ExchangeRevocationSecretsSharesResponse',
  '2': [
    {
      '1': 'received_operator_shares',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark_token.OperatorRevocationShares',
      '10': 'receivedOperatorShares'
    },
  ],
};

/// Descriptor for `ExchangeRevocationSecretsSharesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exchangeRevocationSecretsSharesResponseDescriptor =
    $convert.base64Decode(
        'CidFeGNoYW5nZVJldm9jYXRpb25TZWNyZXRzU2hhcmVzUmVzcG9uc2USXwoYcmVjZWl2ZWRfb3'
        'BlcmF0b3Jfc2hhcmVzGAEgAygLMiUuc3BhcmtfdG9rZW4uT3BlcmF0b3JSZXZvY2F0aW9uU2hh'
        'cmVzUhZyZWNlaXZlZE9wZXJhdG9yU2hhcmVz');

@$core.Deprecated('Use outputToSpendDescriptor instead')
const OutputToSpend$json = {
  '1': 'OutputToSpend',
  '2': [
    {
      '1': 'created_token_transaction_hash',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'createdTokenTransactionHash'
    },
    {
      '1': 'created_token_transaction_vout',
      '3': 2,
      '4': 1,
      '5': 13,
      '10': 'createdTokenTransactionVout'
    },
    {
      '1': 'spent_token_transaction_vout',
      '3': 3,
      '4': 1,
      '5': 13,
      '10': 'spentTokenTransactionVout'
    },
    {
      '1': 'spent_ownership_signature',
      '3': 4,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'spentOwnershipSignature'
    },
  ],
};

/// Descriptor for `OutputToSpend`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List outputToSpendDescriptor = $convert.base64Decode(
    'Cg1PdXRwdXRUb1NwZW5kEkwKHmNyZWF0ZWRfdG9rZW5fdHJhbnNhY3Rpb25faGFzaBgBIAEoDE'
    'IH+kIEegJoIFIbY3JlYXRlZFRva2VuVHJhbnNhY3Rpb25IYXNoEkMKHmNyZWF0ZWRfdG9rZW5f'
    'dHJhbnNhY3Rpb25fdm91dBgCIAEoDVIbY3JlYXRlZFRva2VuVHJhbnNhY3Rpb25Wb3V0Ej8KHH'
    'NwZW50X3Rva2VuX3RyYW5zYWN0aW9uX3ZvdXQYAyABKA1SGXNwZW50VG9rZW5UcmFuc2FjdGlv'
    'blZvdXQSSgoZc3BlbnRfb3duZXJzaGlwX3NpZ25hdHVyZRgEIAEoDEIO+kIEegIQQPpCBHoCGE'
    'lSF3NwZW50T3duZXJzaGlwU2lnbmF0dXJl');

@$core.Deprecated('Use unencodedTokenIdentifierDescriptor instead')
const UnencodedTokenIdentifier$json = {
  '1': 'UnencodedTokenIdentifier',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 13, '10': 'version'},
    {
      '1': 'issuer_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'issuerPublicKey'
    },
    {'1': 'token_name', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'tokenName'},
    {'1': 'token_ticker', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'tokenTicker'},
    {'1': 'decimals', '3': 5, '4': 1, '5': 13, '8': {}, '10': 'decimals'},
    {'1': 'max_supply', '3': 6, '4': 1, '5': 12, '8': {}, '10': 'maxSupply'},
    {'1': 'is_freezable', '3': 7, '4': 1, '5': 8, '10': 'isFreezable'},
    {
      '1': 'network',
      '3': 8,
      '4': 1,
      '5': 14,
      '6': '.spark.Network',
      '8': {},
      '10': 'network'
    },
    {
      '1': 'creation_entity_public_key',
      '3': 9,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'creationEntityPublicKey'
    },
    {
      '1': 'extra_metadata',
      '3': 10,
      '4': 1,
      '5': 12,
      '8': {},
      '9': 0,
      '10': 'extraMetadata',
      '17': true
    },
  ],
  '8': [
    {'1': '_extra_metadata'},
  ],
};

/// Descriptor for `UnencodedTokenIdentifier`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unencodedTokenIdentifierDescriptor = $convert.base64Decode(
    'ChhVbmVuY29kZWRUb2tlbklkZW50aWZpZXISGAoHdmVyc2lvbhgBIAEoDVIHdmVyc2lvbhIzCh'
    'Fpc3N1ZXJfcHVibGljX2tleRgCIAEoDEIH+kIEegJoIVIPaXNzdWVyUHVibGljS2V5EiYKCnRv'
    'a2VuX25hbWUYAyABKAlCB/pCBHICGBRSCXRva2VuTmFtZRIqCgx0b2tlbl90aWNrZXIYBCABKA'
    'lCB/pCBHICGAZSC3Rva2VuVGlja2VyEiQKCGRlY2ltYWxzGAUgASgNQgj6QgUqAxj/AVIIZGVj'
    'aW1hbHMSJgoKbWF4X3N1cHBseRgGIAEoDEIH+kIEegJoEFIJbWF4U3VwcGx5EiEKDGlzX2ZyZW'
    'V6YWJsZRgHIAEoCFILaXNGcmVlemFibGUSMgoHbmV0d29yaxgIIAEoDjIOLnNwYXJrLk5ldHdv'
    'cmtCCPpCBYIBAhABUgduZXR3b3JrEkQKGmNyZWF0aW9uX2VudGl0eV9wdWJsaWNfa2V5GAkgAS'
    'gMQgf6QgR6AmghUhdjcmVhdGlvbkVudGl0eVB1YmxpY0tleRI0Cg5leHRyYV9tZXRhZGF0YRgK'
    'IAEoDEII+kIFegMYgAhIAFINZXh0cmFNZXRhZGF0YYgBAUIRCg9fZXh0cmFfbWV0YWRhdGE=');

@$core.Deprecated('Use signTokenTransactionRequestDescriptor instead')
const SignTokenTransactionRequest$json = {
  '1': 'SignTokenTransactionRequest',
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
      '1': 'token_transaction_signatures',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark_token.SignatureWithIndex',
      '10': 'tokenTransactionSignatures'
    },
    {'1': 'keyshare_ids', '3': 3, '4': 3, '5': 9, '8': {}, '10': 'keyshareIds'},
    {
      '1': 'coordinator_public_key',
      '3': 4,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'coordinatorPublicKey'
    },
    {
      '1': 'execute_before',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 0,
      '10': 'executeBefore',
      '17': true
    },
  ],
  '8': [
    {'1': '_execute_before'},
  ],
};

/// Descriptor for `SignTokenTransactionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signTokenTransactionRequestDescriptor = $convert.base64Decode(
    'ChtTaWduVG9rZW5UcmFuc2FjdGlvblJlcXVlc3QSVQoXZmluYWxfdG9rZW5fdHJhbnNhY3Rpb2'
    '4YASABKAsyHS5zcGFya190b2tlbi5Ub2tlblRyYW5zYWN0aW9uUhVmaW5hbFRva2VuVHJhbnNh'
    'Y3Rpb24SYQocdG9rZW5fdHJhbnNhY3Rpb25fc2lnbmF0dXJlcxgCIAMoCzIfLnNwYXJrX3Rva2'
    'VuLlNpZ25hdHVyZVdpdGhJbmRleFIadG9rZW5UcmFuc2FjdGlvblNpZ25hdHVyZXMSMAoMa2V5'
    'c2hhcmVfaWRzGAMgAygJQg36QgqSAQciBXIDsAEBUgtrZXlzaGFyZUlkcxI9ChZjb29yZGluYX'
    'Rvcl9wdWJsaWNfa2V5GAQgASgMQgf6QgR6AmghUhRjb29yZGluYXRvclB1YmxpY0tleRJGCg5l'
    'eGVjdXRlX2JlZm9yZRgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIAFINZXhlY3'
    'V0ZUJlZm9yZYgBAUIRCg9fZXhlY3V0ZV9iZWZvcmU=');

@$core.Deprecated('Use signTokenTransactionResponseDescriptor instead')
const SignTokenTransactionResponse$json = {
  '1': 'SignTokenTransactionResponse',
  '2': [
    {
      '1': 'spark_operator_signature',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'sparkOperatorSignature'
    },
  ],
};

/// Descriptor for `SignTokenTransactionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signTokenTransactionResponseDescriptor =
    $convert.base64Decode(
        'ChxTaWduVG9rZW5UcmFuc2FjdGlvblJlc3BvbnNlEkgKGHNwYXJrX29wZXJhdG9yX3NpZ25hdH'
        'VyZRgBIAEoDEIO+kIEegIQQPpCBHoCGElSFnNwYXJrT3BlcmF0b3JTaWduYXR1cmU=');

@$core.Deprecated('Use internalFreezeTokensRequestDescriptor instead')
const InternalFreezeTokensRequest$json = {
  '1': 'InternalFreezeTokensRequest',
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

/// Descriptor for `InternalFreezeTokensRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List internalFreezeTokensRequestDescriptor = $convert.base64Decode(
    'ChtJbnRlcm5hbEZyZWV6ZVRva2Vuc1JlcXVlc3QSVAoVZnJlZXplX3Rva2Vuc19wYXlsb2FkGA'
    'EgASgLMiAuc3BhcmtfdG9rZW4uRnJlZXplVG9rZW5zUGF5bG9hZFITZnJlZXplVG9rZW5zUGF5'
    'bG9hZBI5ChBpc3N1ZXJfc2lnbmF0dXJlGAIgASgMQg76QgR6AhBA+kIEegIYSVIPaXNzdWVyU2'
    'lnbmF0dXJl');

@$core.Deprecated('Use internalFreezeTokensResponseDescriptor instead')
const InternalFreezeTokensResponse$json = {
  '1': 'InternalFreezeTokensResponse',
  '2': [
    {
      '1': 'impacted_token_outputs',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark_token.TokenOutputRef',
      '10': 'impactedTokenOutputs'
    },
    {
      '1': 'impacted_token_amount',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'impactedTokenAmount'
    },
  ],
};

/// Descriptor for `InternalFreezeTokensResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List internalFreezeTokensResponseDescriptor = $convert.base64Decode(
    'ChxJbnRlcm5hbEZyZWV6ZVRva2Vuc1Jlc3BvbnNlElEKFmltcGFjdGVkX3Rva2VuX291dHB1dH'
    'MYASADKAsyGy5zcGFya190b2tlbi5Ub2tlbk91dHB1dFJlZlIUaW1wYWN0ZWRUb2tlbk91dHB1'
    'dHMSMgoVaW1wYWN0ZWRfdG9rZW5fYW1vdW50GAIgASgMUhNpbXBhY3RlZFRva2VuQW1vdW50');
