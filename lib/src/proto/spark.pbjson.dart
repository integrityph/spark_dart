// This is a generated file - do not edit.
//
// Generated from spark.proto.

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

@$core.Deprecated('Use networkDescriptor instead')
const Network$json = {
  '1': 'Network',
  '2': [
    {'1': 'UNSPECIFIED', '2': 0},
    {'1': 'MAINNET', '2': 1},
    {'1': 'REGTEST', '2': 2},
    {'1': 'TESTNET', '2': 3},
    {'1': 'SIGNET', '2': 4},
  ],
};

/// Descriptor for `Network`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List networkDescriptor = $convert.base64Decode(
    'CgdOZXR3b3JrEg8KC1VOU1BFQ0lGSUVEEAASCwoHTUFJTk5FVBABEgsKB1JFR1RFU1QQAhILCg'
    'dURVNUTkVUEAMSCgoGU0lHTkVUEAQ=');

@$core.Deprecated('Use directionDescriptor instead')
const Direction$json = {
  '1': 'Direction',
  '2': [
    {'1': 'NEXT', '2': 0},
    {'1': 'PREVIOUS', '2': 1},
  ],
};

/// Descriptor for `Direction`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List directionDescriptor =
    $convert.base64Decode('CglEaXJlY3Rpb24SCAoETkVYVBAAEgwKCFBSRVZJT1VTEAE=');

@$core.Deprecated('Use transferStatusDescriptor instead')
const TransferStatus$json = {
  '1': 'TransferStatus',
  '2': [
    {'1': 'TRANSFER_STATUS_SENDER_INITIATED', '2': 0},
    {'1': 'TRANSFER_STATUS_SENDER_KEY_TWEAK_PENDING', '2': 1},
    {'1': 'TRANSFER_STATUS_SENDER_KEY_TWEAKED', '2': 2},
    {'1': 'TRANSFER_STATUS_RECEIVER_KEY_TWEAKED', '2': 3},
    {'1': 'TRANSFER_STATUS_RECEIVER_REFUND_SIGNED', '2': 4},
    {'1': 'TRANSFER_STATUS_COMPLETED', '2': 5},
    {'1': 'TRANSFER_STATUS_EXPIRED', '2': 6},
    {'1': 'TRANSFER_STATUS_RETURNED', '2': 7},
    {'1': 'TRANSFER_STATUS_SENDER_INITIATED_COORDINATOR', '2': 8},
    {'1': 'TRANSFER_STATUS_RECEIVER_KEY_TWEAK_LOCKED', '2': 9},
    {'1': 'TRANSFER_STATUS_RECEIVER_KEY_TWEAK_APPLIED', '2': 10},
    {'1': 'TRANSFER_STATUS_APPLYING_SENDER_KEY_TWEAK', '2': 11},
  ],
};

/// Descriptor for `TransferStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List transferStatusDescriptor = $convert.base64Decode(
    'Cg5UcmFuc2ZlclN0YXR1cxIkCiBUUkFOU0ZFUl9TVEFUVVNfU0VOREVSX0lOSVRJQVRFRBAAEi'
    'wKKFRSQU5TRkVSX1NUQVRVU19TRU5ERVJfS0VZX1RXRUFLX1BFTkRJTkcQARImCiJUUkFOU0ZF'
    'Ul9TVEFUVVNfU0VOREVSX0tFWV9UV0VBS0VEEAISKAokVFJBTlNGRVJfU1RBVFVTX1JFQ0VJVk'
    'VSX0tFWV9UV0VBS0VEEAMSKgomVFJBTlNGRVJfU1RBVFVTX1JFQ0VJVkVSX1JFRlVORF9TSUdO'
    'RUQQBBIdChlUUkFOU0ZFUl9TVEFUVVNfQ09NUExFVEVEEAUSGwoXVFJBTlNGRVJfU1RBVFVTX0'
    'VYUElSRUQQBhIcChhUUkFOU0ZFUl9TVEFUVVNfUkVUVVJORUQQBxIwCixUUkFOU0ZFUl9TVEFU'
    'VVNfU0VOREVSX0lOSVRJQVRFRF9DT09SRElOQVRPUhAIEi0KKVRSQU5TRkVSX1NUQVRVU19SRU'
    'NFSVZFUl9LRVlfVFdFQUtfTE9DS0VEEAkSLgoqVFJBTlNGRVJfU1RBVFVTX1JFQ0VJVkVSX0tF'
    'WV9UV0VBS19BUFBMSUVEEAoSLQopVFJBTlNGRVJfU1RBVFVTX0FQUExZSU5HX1NFTkRFUl9LRV'
    'lfVFdFQUsQCw==');

@$core.Deprecated('Use transferTypeDescriptor instead')
const TransferType$json = {
  '1': 'TransferType',
  '2': [
    {'1': 'PREIMAGE_SWAP', '2': 0},
    {'1': 'COOPERATIVE_EXIT', '2': 1},
    {'1': 'TRANSFER', '2': 2},
    {'1': 'UTXO_SWAP', '2': 3},
    {'1': 'SWAP', '2': 30},
    {'1': 'COUNTER_SWAP', '2': 40},
    {'1': 'PRIMARY_SWAP_V3', '2': 4},
    {'1': 'COUNTER_SWAP_V3', '2': 5},
  ],
};

/// Descriptor for `TransferType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List transferTypeDescriptor = $convert.base64Decode(
    'CgxUcmFuc2ZlclR5cGUSEQoNUFJFSU1BR0VfU1dBUBAAEhQKEENPT1BFUkFUSVZFX0VYSVQQAR'
    'IMCghUUkFOU0ZFUhACEg0KCVVUWE9fU1dBUBADEggKBFNXQVAQHhIQCgxDT1VOVEVSX1NXQVAQ'
    'KBITCg9QUklNQVJZX1NXQVBfVjMQBBITCg9DT1VOVEVSX1NXQVBfVjMQBQ==');

@$core.Deprecated('Use orderDescriptor instead')
const Order$json = {
  '1': 'Order',
  '2': [
    {'1': 'DESCENDING', '2': 0},
    {'1': 'ASCENDING', '2': 1},
  ],
};

/// Descriptor for `Order`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List orderDescriptor = $convert
    .base64Decode('CgVPcmRlchIOCgpERVNDRU5ESU5HEAASDQoJQVNDRU5ESU5HEAE=');

@$core.Deprecated('Use preimageRequestStatusDescriptor instead')
const PreimageRequestStatus$json = {
  '1': 'PreimageRequestStatus',
  '2': [
    {'1': 'PREIMAGE_REQUEST_STATUS_WAITING_FOR_PREIMAGE', '2': 0},
    {'1': 'PREIMAGE_REQUEST_STATUS_PREIMAGE_SHARED', '2': 1},
    {'1': 'PREIMAGE_REQUEST_STATUS_RETURNED', '2': 2},
  ],
};

/// Descriptor for `PreimageRequestStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List preimageRequestStatusDescriptor = $convert.base64Decode(
    'ChVQcmVpbWFnZVJlcXVlc3RTdGF0dXMSMAosUFJFSU1BR0VfUkVRVUVTVF9TVEFUVVNfV0FJVE'
    'lOR19GT1JfUFJFSU1BR0UQABIrCidQUkVJTUFHRV9SRVFVRVNUX1NUQVRVU19QUkVJTUFHRV9T'
    'SEFSRUQQARIkCiBQUkVJTUFHRV9SRVFVRVNUX1NUQVRVU19SRVRVUk5FRBAC');

@$core.Deprecated('Use preimageRequestRoleDescriptor instead')
const PreimageRequestRole$json = {
  '1': 'PreimageRequestRole',
  '2': [
    {'1': 'PREIMAGE_REQUEST_ROLE_RECEIVER', '2': 0},
    {'1': 'PREIMAGE_REQUEST_ROLE_SENDER', '2': 1},
    {'1': 'PREIMAGE_REQUEST_ROLE_RECEIVER_AND_SENDER', '2': 2},
  ],
};

/// Descriptor for `PreimageRequestRole`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List preimageRequestRoleDescriptor = $convert.base64Decode(
    'ChNQcmVpbWFnZVJlcXVlc3RSb2xlEiIKHlBSRUlNQUdFX1JFUVVFU1RfUk9MRV9SRUNFSVZFUh'
    'AAEiAKHFBSRUlNQUdFX1JFUVVFU1RfUk9MRV9TRU5ERVIQARItCilQUkVJTUFHRV9SRVFVRVNU'
    'X1JPTEVfUkVDRUlWRVJfQU5EX1NFTkRFUhAC');

@$core.Deprecated('Use utxoSwapRequestTypeDescriptor instead')
const UtxoSwapRequestType$json = {
  '1': 'UtxoSwapRequestType',
  '2': [
    {'1': 'Fixed', '2': 0},
    {'1': 'MaxFee', '2': 1},
    {'1': 'Refund', '2': 2},
    {'1': 'Instant', '2': 3},
  ],
};

/// Descriptor for `UtxoSwapRequestType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List utxoSwapRequestTypeDescriptor = $convert.base64Decode(
    'ChNVdHhvU3dhcFJlcXVlc3RUeXBlEgkKBUZpeGVkEAASCgoGTWF4RmVlEAESCgoGUmVmdW5kEA'
    'ISCwoHSW5zdGFudBAD');

@$core.Deprecated('Use utxoSwapStatusDescriptor instead')
const UtxoSwapStatus$json = {
  '1': 'UtxoSwapStatus',
  '2': [
    {'1': 'UTXO_SWAP_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'UTXO_SWAP_STATUS_CREATED', '2': 1},
    {'1': 'UTXO_SWAP_STATUS_COMPLETED', '2': 2},
    {'1': 'UTXO_SWAP_STATUS_CANCELLED', '2': 3},
  ],
};

/// Descriptor for `UtxoSwapStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List utxoSwapStatusDescriptor = $convert.base64Decode(
    'Cg5VdHhvU3dhcFN0YXR1cxIgChxVVFhPX1NXQVBfU1RBVFVTX1VOU1BFQ0lGSUVEEAASHAoYVV'
    'RYT19TV0FQX1NUQVRVU19DUkVBVEVEEAESHgoaVVRYT19TV0FQX1NUQVRVU19DT01QTEVURUQQ'
    'AhIeChpVVFhPX1NXQVBfU1RBVFVTX0NBTkNFTExFRBAD');

@$core.Deprecated('Use hashVariantDescriptor instead')
const HashVariant$json = {
  '1': 'HashVariant',
  '2': [
    {'1': 'HASH_VARIANT_UNSPECIFIED', '2': 0},
    {'1': 'HASH_VARIANT_V2', '2': 1},
  ],
};

/// Descriptor for `HashVariant`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List hashVariantDescriptor = $convert.base64Decode(
    'CgtIYXNoVmFyaWFudBIcChhIQVNIX1ZBUklBTlRfVU5TUEVDSUZJRUQQABITCg9IQVNIX1ZBUk'
    'lBTlRfVjIQAQ==');

@$core.Deprecated('Use invoiceStatusDescriptor instead')
const InvoiceStatus$json = {
  '1': 'InvoiceStatus',
  '2': [
    {'1': 'NOT_FOUND', '2': 0},
    {'1': 'PENDING', '2': 1},
    {'1': 'FINALIZED', '2': 2},
    {'1': 'RETURNED', '2': 4},
  ],
  '4': [
    {'1': 3, '2': 3},
  ],
};

/// Descriptor for `InvoiceStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List invoiceStatusDescriptor = $convert.base64Decode(
    'Cg1JbnZvaWNlU3RhdHVzEg0KCU5PVF9GT1VORBAAEgsKB1BFTkRJTkcQARINCglGSU5BTElaRU'
    'QQAhIMCghSRVRVUk5FRBAEIgQIAxAD');

@$core.Deprecated('Use treeNodeStatusDescriptor instead')
const TreeNodeStatus$json = {
  '1': 'TreeNodeStatus',
  '2': [
    {'1': 'TREE_NODE_STATUS_CREATING', '2': 0},
    {'1': 'TREE_NODE_STATUS_AVAILABLE', '2': 1},
    {'1': 'TREE_NODE_STATUS_FROZEN_BY_ISSUER', '2': 2},
    {'1': 'TREE_NODE_STATUS_TRANSFER_LOCKED', '2': 3},
    {'1': 'TREE_NODE_STATUS_SPLIT_LOCKED', '2': 4},
    {'1': 'TREE_NODE_STATUS_SPLITTED', '2': 5},
    {'1': 'TREE_NODE_STATUS_AGGREGATED', '2': 6},
    {'1': 'TREE_NODE_STATUS_ON_CHAIN', '2': 7},
    {'1': 'TREE_NODE_STATUS_AGGREGATE_LOCK', '2': 8},
    {'1': 'TREE_NODE_STATUS_EXITED', '2': 9},
    {'1': 'TREE_NODE_STATUS_RENEW_LOCKED', '2': 10},
    {'1': 'TREE_NODE_STATUS_UNAVAILABLE', '2': 11},
    {'1': 'TREE_NODE_STATUS_PARENT_EXITED', '2': 12},
  ],
};

/// Descriptor for `TreeNodeStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List treeNodeStatusDescriptor = $convert.base64Decode(
    'Cg5UcmVlTm9kZVN0YXR1cxIdChlUUkVFX05PREVfU1RBVFVTX0NSRUFUSU5HEAASHgoaVFJFRV'
    '9OT0RFX1NUQVRVU19BVkFJTEFCTEUQARIlCiFUUkVFX05PREVfU1RBVFVTX0ZST1pFTl9CWV9J'
    'U1NVRVIQAhIkCiBUUkVFX05PREVfU1RBVFVTX1RSQU5TRkVSX0xPQ0tFRBADEiEKHVRSRUVfTk'
    '9ERV9TVEFUVVNfU1BMSVRfTE9DS0VEEAQSHQoZVFJFRV9OT0RFX1NUQVRVU19TUExJVFRFRBAF'
    'Eh8KG1RSRUVfTk9ERV9TVEFUVVNfQUdHUkVHQVRFRBAGEh0KGVRSRUVfTk9ERV9TVEFUVVNfT0'
    '5fQ0hBSU4QBxIjCh9UUkVFX05PREVfU1RBVFVTX0FHR1JFR0FURV9MT0NLEAgSGwoXVFJFRV9O'
    'T0RFX1NUQVRVU19FWElURUQQCRIhCh1UUkVFX05PREVfU1RBVFVTX1JFTkVXX0xPQ0tFRBAKEi'
    'AKHFRSRUVfTk9ERV9TVEFUVVNfVU5BVkFJTEFCTEUQCxIiCh5UUkVFX05PREVfU1RBVFVTX1BB'
    'UkVOVF9FWElURUQQDA==');

@$core.Deprecated('Use sparkTransactionTypeDescriptor instead')
const SparkTransactionType$json = {
  '1': 'SparkTransactionType',
  '2': [
    {'1': 'SPARK_TRANSACTION_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'SPARK_TRANSACTION_TYPE_TRANSFER', '2': 1},
    {'1': 'SPARK_TRANSACTION_TYPE_LIGHTNING_SEND', '2': 2},
    {'1': 'SPARK_TRANSACTION_TYPE_LIGHTNING_RECEIVE', '2': 3},
    {'1': 'SPARK_TRANSACTION_TYPE_COOPERATIVE_EXIT', '2': 4},
    {'1': 'SPARK_TRANSACTION_TYPE_DEPOSIT', '2': 5},
  ],
};

/// Descriptor for `SparkTransactionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sparkTransactionTypeDescriptor = $convert.base64Decode(
    'ChRTcGFya1RyYW5zYWN0aW9uVHlwZRImCiJTUEFSS19UUkFOU0FDVElPTl9UWVBFX1VOU1BFQ0'
    'lGSUVEEAASIwofU1BBUktfVFJBTlNBQ1RJT05fVFlQRV9UUkFOU0ZFUhABEikKJVNQQVJLX1RS'
    'QU5TQUNUSU9OX1RZUEVfTElHSFROSU5HX1NFTkQQAhIsCihTUEFSS19UUkFOU0FDVElPTl9UWV'
    'BFX0xJR0hUTklOR19SRUNFSVZFEAMSKwonU1BBUktfVFJBTlNBQ1RJT05fVFlQRV9DT09QRVJB'
    'VElWRV9FWElUEAQSIgoeU1BBUktfVFJBTlNBQ1RJT05fVFlQRV9ERVBPU0lUEAU=');

@$core.Deprecated('Use subscribeToEventsRequestDescriptor instead')
const SubscribeToEventsRequest$json = {
  '1': 'SubscribeToEventsRequest',
  '2': [
    {
      '1': 'identity_public_key',
      '3': 10,
      '4': 1,
      '5': 12,
      '10': 'identityPublicKey'
    },
  ],
};

/// Descriptor for `SubscribeToEventsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeToEventsRequestDescriptor =
    $convert.base64Decode(
        'ChhTdWJzY3JpYmVUb0V2ZW50c1JlcXVlc3QSLgoTaWRlbnRpdHlfcHVibGljX2tleRgKIAEoDF'
        'IRaWRlbnRpdHlQdWJsaWNLZXk=');

@$core.Deprecated('Use subscribeToEventsResponseDescriptor instead')
const SubscribeToEventsResponse$json = {
  '1': 'SubscribeToEventsResponse',
  '2': [
    {
      '1': 'receiver_transfer',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.TransferEvent',
      '9': 0,
      '10': 'transfer'
    },
    {
      '1': 'deposit',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.DepositEvent',
      '9': 0,
      '10': 'deposit'
    },
    {
      '1': 'connected',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.ConnectedEvent',
      '9': 0,
      '10': 'connected'
    },
    {
      '1': 'sender_transfer',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark.TransferEvent',
      '9': 0,
      '10': 'senderTransfer'
    },
    {
      '1': 'heartbeat',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.spark.HeartbeatEvent',
      '9': 0,
      '10': 'heartbeat'
    },
    {
      '1': 'token_transaction',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.spark.TokenTransactionEvent',
      '9': 0,
      '10': 'tokenTransaction'
    },
  ],
  '8': [
    {'1': 'event'},
  ],
};

/// Descriptor for `SubscribeToEventsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeToEventsResponseDescriptor = $convert.base64Decode(
    'ChlTdWJzY3JpYmVUb0V2ZW50c1Jlc3BvbnNlEjsKEXJlY2VpdmVyX3RyYW5zZmVyGAEgASgLMh'
    'Quc3BhcmsuVHJhbnNmZXJFdmVudEgAUgh0cmFuc2ZlchIvCgdkZXBvc2l0GAIgASgLMhMuc3Bh'
    'cmsuRGVwb3NpdEV2ZW50SABSB2RlcG9zaXQSNQoJY29ubmVjdGVkGAMgASgLMhUuc3BhcmsuQ2'
    '9ubmVjdGVkRXZlbnRIAFIJY29ubmVjdGVkEj8KD3NlbmRlcl90cmFuc2ZlchgEIAEoCzIULnNw'
    'YXJrLlRyYW5zZmVyRXZlbnRIAFIOc2VuZGVyVHJhbnNmZXISNQoJaGVhcnRiZWF0GAUgASgLMh'
    'Uuc3BhcmsuSGVhcnRiZWF0RXZlbnRIAFIJaGVhcnRiZWF0EksKEXRva2VuX3RyYW5zYWN0aW9u'
    'GAYgASgLMhwuc3BhcmsuVG9rZW5UcmFuc2FjdGlvbkV2ZW50SABSEHRva2VuVHJhbnNhY3Rpb2'
    '5CBwoFZXZlbnQ=');

@$core.Deprecated('Use tokenTransactionEventDescriptor instead')
const TokenTransactionEvent$json = {
  '1': 'TokenTransactionEvent',
  '2': [
    {
      '1': 'token_transaction_hash',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'tokenTransactionHash'
    },
    {
      '1': 'token_identifiers',
      '3': 2,
      '4': 3,
      '5': 12,
      '10': 'tokenIdentifiers'
    },
    {'1': 'spark_invoices', '3': 3, '4': 3, '5': 9, '10': 'sparkInvoices'},
  ],
};

/// Descriptor for `TokenTransactionEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenTransactionEventDescriptor = $convert.base64Decode(
    'ChVUb2tlblRyYW5zYWN0aW9uRXZlbnQSNAoWdG9rZW5fdHJhbnNhY3Rpb25faGFzaBgBIAEoDF'
    'IUdG9rZW5UcmFuc2FjdGlvbkhhc2gSKwoRdG9rZW5faWRlbnRpZmllcnMYAiADKAxSEHRva2Vu'
    'SWRlbnRpZmllcnMSJQoOc3BhcmtfaW52b2ljZXMYAyADKAlSDXNwYXJrSW52b2ljZXM=');

@$core.Deprecated('Use connectedEventDescriptor instead')
const ConnectedEvent$json = {
  '1': 'ConnectedEvent',
};

/// Descriptor for `ConnectedEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectedEventDescriptor =
    $convert.base64Decode('Cg5Db25uZWN0ZWRFdmVudA==');

@$core.Deprecated('Use heartbeatEventDescriptor instead')
const HeartbeatEvent$json = {
  '1': 'HeartbeatEvent',
};

/// Descriptor for `HeartbeatEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List heartbeatEventDescriptor =
    $convert.base64Decode('Cg5IZWFydGJlYXRFdmVudA==');

@$core.Deprecated('Use transferEventDescriptor instead')
const TransferEvent$json = {
  '1': 'TransferEvent',
  '2': [
    {
      '1': 'transfer',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.spark.Transfer',
      '10': 'transfer'
    },
    {'1': 'trace_id', '3': 11, '4': 1, '5': 9, '10': 'traceId'},
  ],
};

/// Descriptor for `TransferEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transferEventDescriptor = $convert.base64Decode(
    'Cg1UcmFuc2ZlckV2ZW50EisKCHRyYW5zZmVyGAogASgLMg8uc3BhcmsuVHJhbnNmZXJSCHRyYW'
    '5zZmVyEhkKCHRyYWNlX2lkGAsgASgJUgd0cmFjZUlk');

@$core.Deprecated('Use depositEventDescriptor instead')
const DepositEvent$json = {
  '1': 'DepositEvent',
  '2': [
    {
      '1': 'deposit',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.spark.TreeNode',
      '10': 'deposit'
    },
    {'1': 'trace_id', '3': 11, '4': 1, '5': 9, '10': 'traceId'},
  ],
};

/// Descriptor for `DepositEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List depositEventDescriptor = $convert.base64Decode(
    'CgxEZXBvc2l0RXZlbnQSKQoHZGVwb3NpdBgKIAEoCzIPLnNwYXJrLlRyZWVOb2RlUgdkZXBvc2'
    'l0EhkKCHRyYWNlX2lkGAsgASgJUgd0cmFjZUlk');

@$core.Deprecated('Use pageRequestDescriptor instead')
const PageRequest$json = {
  '1': 'PageRequest',
  '2': [
    {
      '1': 'unsafe_page_size',
      '3': 1,
      '4': 1,
      '5': 5,
      '8': {},
      '10': 'unsafePageSize'
    },
    {'1': 'page_size', '3': 4, '4': 1, '5': 13, '8': {}, '10': 'pageSize'},
    {'1': 'cursor', '3': 2, '4': 1, '5': 9, '10': 'cursor'},
    {
      '1': 'direction',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.spark.Direction',
      '10': 'direction'
    },
  ],
};

/// Descriptor for `PageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pageRequestDescriptor = $convert.base64Decode(
    'CgtQYWdlUmVxdWVzdBI0ChB1bnNhZmVfcGFnZV9zaXplGAEgASgFQgr6QgcaBRjoBygAUg51bn'
    'NhZmVQYWdlU2l6ZRInCglwYWdlX3NpemUYBCABKA1CCvpCByoFGOgHKABSCHBhZ2VTaXplEhYK'
    'BmN1cnNvchgCIAEoCVIGY3Vyc29yEi4KCWRpcmVjdGlvbhgDIAEoDjIQLnNwYXJrLkRpcmVjdG'
    'lvblIJZGlyZWN0aW9u');

@$core.Deprecated('Use pageResponseDescriptor instead')
const PageResponse$json = {
  '1': 'PageResponse',
  '2': [
    {'1': 'has_next_page', '3': 1, '4': 1, '5': 8, '10': 'hasNextPage'},
    {'1': 'has_previous_page', '3': 2, '4': 1, '5': 8, '10': 'hasPreviousPage'},
    {'1': 'next_cursor', '3': 3, '4': 1, '5': 9, '10': 'nextCursor'},
    {'1': 'previous_cursor', '3': 4, '4': 1, '5': 9, '10': 'previousCursor'},
  ],
};

/// Descriptor for `PageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pageResponseDescriptor = $convert.base64Decode(
    'CgxQYWdlUmVzcG9uc2USIgoNaGFzX25leHRfcGFnZRgBIAEoCFILaGFzTmV4dFBhZ2USKgoRaG'
    'FzX3ByZXZpb3VzX3BhZ2UYAiABKAhSD2hhc1ByZXZpb3VzUGFnZRIfCgtuZXh0X2N1cnNvchgD'
    'IAEoCVIKbmV4dEN1cnNvchInCg9wcmV2aW91c19jdXJzb3IYBCABKAlSDnByZXZpb3VzQ3Vyc2'
    '9y');

@$core.Deprecated('Use depositAddressProofDescriptor instead')
const DepositAddressProof$json = {
  '1': 'DepositAddressProof',
  '2': [
    {
      '1': 'address_signatures',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.DepositAddressProof.AddressSignaturesEntry',
      '10': 'addressSignatures'
    },
    {
      '1': 'proof_of_possession_signature',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'proofOfPossessionSignature'
    },
  ],
  '3': [DepositAddressProof_AddressSignaturesEntry$json],
};

@$core.Deprecated('Use depositAddressProofDescriptor instead')
const DepositAddressProof_AddressSignaturesEntry$json = {
  '1': 'AddressSignaturesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `DepositAddressProof`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List depositAddressProofDescriptor = $convert.base64Decode(
    'ChNEZXBvc2l0QWRkcmVzc1Byb29mEmAKEmFkZHJlc3Nfc2lnbmF0dXJlcxgBIAMoCzIxLnNwYX'
    'JrLkRlcG9zaXRBZGRyZXNzUHJvb2YuQWRkcmVzc1NpZ25hdHVyZXNFbnRyeVIRYWRkcmVzc1Np'
    'Z25hdHVyZXMSQQodcHJvb2Zfb2ZfcG9zc2Vzc2lvbl9zaWduYXR1cmUYAiABKAxSGnByb29mT2'
    'ZQb3NzZXNzaW9uU2lnbmF0dXJlGkQKFkFkZHJlc3NTaWduYXR1cmVzRW50cnkSEAoDa2V5GAEg'
    'ASgJUgNrZXkSFAoFdmFsdWUYAiABKAxSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use generateDepositAddressRequestDescriptor instead')
const GenerateDepositAddressRequest$json = {
  '1': 'GenerateDepositAddressRequest',
  '2': [
    {
      '1': 'signing_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'signingPublicKey'
    },
    {
      '1': 'identity_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'identityPublicKey'
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
      '1': 'leaf_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 0,
      '10': 'leafId',
      '17': true
    },
    {
      '1': 'is_static',
      '3': 5,
      '4': 1,
      '5': 8,
      '9': 1,
      '10': 'isStatic',
      '17': true
    },
    {
      '1': 'hash_variant',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.spark.HashVariant',
      '10': 'hashVariant'
    },
  ],
  '8': [
    {'1': '_leaf_id'},
    {'1': '_is_static'},
  ],
};

/// Descriptor for `GenerateDepositAddressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateDepositAddressRequestDescriptor = $convert.base64Decode(
    'Ch1HZW5lcmF0ZURlcG9zaXRBZGRyZXNzUmVxdWVzdBIsChJzaWduaW5nX3B1YmxpY19rZXkYAS'
    'ABKAxSEHNpZ25pbmdQdWJsaWNLZXkSLgoTaWRlbnRpdHlfcHVibGljX2tleRgCIAEoDFIRaWRl'
    'bnRpdHlQdWJsaWNLZXkSMgoHbmV0d29yaxgDIAEoDjIOLnNwYXJrLk5ldHdvcmtCCPpCBYIBAi'
    'AAUgduZXR3b3JrEiYKB2xlYWZfaWQYBCABKAlCCPpCBXIDsAEBSABSBmxlYWZJZIgBARIgCglp'
    'c19zdGF0aWMYBSABKAhIAVIIaXNTdGF0aWOIAQESNQoMaGFzaF92YXJpYW50GAYgASgOMhIuc3'
    'BhcmsuSGFzaFZhcmlhbnRSC2hhc2hWYXJpYW50QgoKCF9sZWFmX2lkQgwKCl9pc19zdGF0aWM=');

@$core.Deprecated('Use addressDescriptor instead')
const Address$json = {
  '1': 'Address',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    {'1': 'verifying_key', '3': 2, '4': 1, '5': 12, '10': 'verifyingKey'},
    {
      '1': 'deposit_address_proof',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.DepositAddressProof',
      '10': 'depositAddressProof'
    },
    {'1': 'is_static', '3': 5, '4': 1, '5': 8, '10': 'isStatic'},
  ],
};

/// Descriptor for `Address`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addressDescriptor = $convert.base64Decode(
    'CgdBZGRyZXNzEhgKB2FkZHJlc3MYASABKAlSB2FkZHJlc3MSIwoNdmVyaWZ5aW5nX2tleRgCIA'
    'EoDFIMdmVyaWZ5aW5nS2V5Ek4KFWRlcG9zaXRfYWRkcmVzc19wcm9vZhgDIAEoCzIaLnNwYXJr'
    'LkRlcG9zaXRBZGRyZXNzUHJvb2ZSE2RlcG9zaXRBZGRyZXNzUHJvb2YSGwoJaXNfc3RhdGljGA'
    'UgASgIUghpc1N0YXRpYw==');

@$core.Deprecated('Use generateDepositAddressResponseDescriptor instead')
const GenerateDepositAddressResponse$json = {
  '1': 'GenerateDepositAddressResponse',
  '2': [
    {
      '1': 'deposit_address',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.Address',
      '10': 'depositAddress'
    },
  ],
};

/// Descriptor for `GenerateDepositAddressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateDepositAddressResponseDescriptor =
    $convert.base64Decode(
        'Ch5HZW5lcmF0ZURlcG9zaXRBZGRyZXNzUmVzcG9uc2USNwoPZGVwb3NpdF9hZGRyZXNzGAEgAS'
        'gLMg4uc3BhcmsuQWRkcmVzc1IOZGVwb3NpdEFkZHJlc3M=');

@$core.Deprecated('Use generateStaticDepositAddressRequestDescriptor instead')
const GenerateStaticDepositAddressRequest$json = {
  '1': 'GenerateStaticDepositAddressRequest',
  '2': [
    {
      '1': 'signing_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'signingPublicKey'
    },
    {
      '1': 'identity_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'identityPublicKey'
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
      '1': 'hash_variant',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.spark.HashVariant',
      '10': 'hashVariant'
    },
  ],
};

/// Descriptor for `GenerateStaticDepositAddressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateStaticDepositAddressRequestDescriptor =
    $convert.base64Decode(
        'CiNHZW5lcmF0ZVN0YXRpY0RlcG9zaXRBZGRyZXNzUmVxdWVzdBI1ChJzaWduaW5nX3B1YmxpY1'
        '9rZXkYASABKAxCB/pCBHoCaCFSEHNpZ25pbmdQdWJsaWNLZXkSNwoTaWRlbnRpdHlfcHVibGlj'
        'X2tleRgCIAEoDEIH+kIEegJoIVIRaWRlbnRpdHlQdWJsaWNLZXkSMgoHbmV0d29yaxgDIAEoDj'
        'IOLnNwYXJrLk5ldHdvcmtCCPpCBYIBAiAAUgduZXR3b3JrEjUKDGhhc2hfdmFyaWFudBgEIAEo'
        'DjISLnNwYXJrLkhhc2hWYXJpYW50UgtoYXNoVmFyaWFudA==');

@$core.Deprecated('Use generateStaticDepositAddressResponseDescriptor instead')
const GenerateStaticDepositAddressResponse$json = {
  '1': 'GenerateStaticDepositAddressResponse',
  '2': [
    {
      '1': 'deposit_address',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.Address',
      '10': 'depositAddress'
    },
  ],
};

/// Descriptor for `GenerateStaticDepositAddressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateStaticDepositAddressResponseDescriptor =
    $convert.base64Decode(
        'CiRHZW5lcmF0ZVN0YXRpY0RlcG9zaXRBZGRyZXNzUmVzcG9uc2USNwoPZGVwb3NpdF9hZGRyZX'
        'NzGAEgASgLMg4uc3BhcmsuQWRkcmVzc1IOZGVwb3NpdEFkZHJlc3M=');

@$core.Deprecated('Use rotateStaticDepositAddressRequestDescriptor instead')
const RotateStaticDepositAddressRequest$json = {
  '1': 'RotateStaticDepositAddressRequest',
  '2': [
    {
      '1': 'signing_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'signingPublicKey'
    },
    {
      '1': 'network',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.spark.Network',
      '8': {},
      '10': 'network'
    },
    {
      '1': 'hash_variant',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.spark.HashVariant',
      '10': 'hashVariant'
    },
  ],
};

/// Descriptor for `RotateStaticDepositAddressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rotateStaticDepositAddressRequestDescriptor =
    $convert.base64Decode(
        'CiFSb3RhdGVTdGF0aWNEZXBvc2l0QWRkcmVzc1JlcXVlc3QSNQoSc2lnbmluZ19wdWJsaWNfa2'
        'V5GAEgASgMQgf6QgR6AmghUhBzaWduaW5nUHVibGljS2V5EjIKB25ldHdvcmsYAiABKA4yDi5z'
        'cGFyay5OZXR3b3JrQgj6QgWCAQIgAFIHbmV0d29yaxI1CgxoYXNoX3ZhcmlhbnQYAyABKA4yEi'
        '5zcGFyay5IYXNoVmFyaWFudFILaGFzaFZhcmlhbnQ=');

@$core.Deprecated('Use rotateStaticDepositAddressResponseDescriptor instead')
const RotateStaticDepositAddressResponse$json = {
  '1': 'RotateStaticDepositAddressResponse',
  '2': [
    {
      '1': 'new_deposit_address',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.Address',
      '10': 'newDepositAddress'
    },
    {
      '1': 'archived_deposit_address',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.Address',
      '10': 'archivedDepositAddress'
    },
  ],
};

/// Descriptor for `RotateStaticDepositAddressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rotateStaticDepositAddressResponseDescriptor =
    $convert.base64Decode(
        'CiJSb3RhdGVTdGF0aWNEZXBvc2l0QWRkcmVzc1Jlc3BvbnNlEj4KE25ld19kZXBvc2l0X2FkZH'
        'Jlc3MYASABKAsyDi5zcGFyay5BZGRyZXNzUhFuZXdEZXBvc2l0QWRkcmVzcxJIChhhcmNoaXZl'
        'ZF9kZXBvc2l0X2FkZHJlc3MYAiABKAsyDi5zcGFyay5BZGRyZXNzUhZhcmNoaXZlZERlcG9zaX'
        'RBZGRyZXNz');

@$core.Deprecated('Use uTXODescriptor instead')
const UTXO$json = {
  '1': 'UTXO',
  '2': [
    {'1': 'raw_tx', '3': 1, '4': 1, '5': 12, '10': 'rawTx'},
    {'1': 'vout', '3': 2, '4': 1, '5': 13, '10': 'vout'},
    {
      '1': 'network',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.spark.Network',
      '8': {},
      '10': 'network'
    },
    {'1': 'txid', '3': 4, '4': 1, '5': 12, '10': 'txid'},
  ],
};

/// Descriptor for `UTXO`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uTXODescriptor = $convert.base64Decode(
    'CgRVVFhPEhUKBnJhd190eBgBIAEoDFIFcmF3VHgSEgoEdm91dBgCIAEoDVIEdm91dBIyCgduZX'
    'R3b3JrGAMgASgOMg4uc3BhcmsuTmV0d29ya0II+kIFggECIABSB25ldHdvcmsSEgoEdHhpZBgE'
    'IAEoDFIEdHhpZA==');

@$core.Deprecated('Use addressedUtxoDescriptor instead')
const AddressedUtxo$json = {
  '1': 'AddressedUtxo',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    {'1': 'utxo', '3': 2, '4': 1, '5': 11, '6': '.spark.UTXO', '10': 'utxo'},
    {'1': 'is_confirmed', '3': 3, '4': 1, '5': 8, '10': 'isConfirmed'},
  ],
};

/// Descriptor for `AddressedUtxo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addressedUtxoDescriptor = $convert.base64Decode(
    'Cg1BZGRyZXNzZWRVdHhvEhgKB2FkZHJlc3MYASABKAlSB2FkZHJlc3MSHwoEdXR4bxgCIAEoCz'
    'ILLnNwYXJrLlVUWE9SBHV0eG8SIQoMaXNfY29uZmlybWVkGAMgASgIUgtpc0NvbmZpcm1lZA==');

@$core.Deprecated('Use nodeOutputDescriptor instead')
const NodeOutput$json = {
  '1': 'NodeOutput',
  '2': [
    {'1': 'node_id', '3': 1, '4': 1, '5': 9, '10': 'nodeId'},
    {'1': 'vout', '3': 2, '4': 1, '5': 13, '10': 'vout'},
  ],
};

/// Descriptor for `NodeOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nodeOutputDescriptor = $convert.base64Decode(
    'CgpOb2RlT3V0cHV0EhcKB25vZGVfaWQYASABKAlSBm5vZGVJZBISCgR2b3V0GAIgASgNUgR2b3'
    'V0');

@$core.Deprecated('Use signingJobDescriptor instead')
const SigningJob$json = {
  '1': 'SigningJob',
  '2': [
    {
      '1': 'signing_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'signingPublicKey'
    },
    {'1': 'raw_tx', '3': 2, '4': 1, '5': 12, '10': 'rawTx'},
    {
      '1': 'signing_nonce_commitment',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.common.SigningCommitment',
      '10': 'signingNonceCommitment'
    },
  ],
};

/// Descriptor for `SigningJob`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingJobDescriptor = $convert.base64Decode(
    'CgpTaWduaW5nSm9iEiwKEnNpZ25pbmdfcHVibGljX2tleRgBIAEoDFIQc2lnbmluZ1B1YmxpY0'
    'tleRIVCgZyYXdfdHgYAiABKAxSBXJhd1R4ElMKGHNpZ25pbmdfbm9uY2VfY29tbWl0bWVudBgD'
    'IAEoCzIZLmNvbW1vbi5TaWduaW5nQ29tbWl0bWVudFIWc2lnbmluZ05vbmNlQ29tbWl0bWVudA'
    '==');

@$core.Deprecated('Use signingKeyshareDescriptor instead')
const SigningKeyshare$json = {
  '1': 'SigningKeyshare',
  '2': [
    {
      '1': 'owner_identifiers',
      '3': 1,
      '4': 3,
      '5': 9,
      '10': 'ownerIdentifiers'
    },
    {'1': 'threshold', '3': 2, '4': 1, '5': 13, '10': 'threshold'},
    {'1': 'public_key', '3': 3, '4': 1, '5': 12, '10': 'publicKey'},
    {
      '1': 'public_shares',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.spark.SigningKeyshare.PublicSharesEntry',
      '10': 'publicShares'
    },
    {
      '1': 'updated_time',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedTime'
    },
  ],
  '3': [SigningKeyshare_PublicSharesEntry$json],
};

@$core.Deprecated('Use signingKeyshareDescriptor instead')
const SigningKeyshare_PublicSharesEntry$json = {
  '1': 'PublicSharesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `SigningKeyshare`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingKeyshareDescriptor = $convert.base64Decode(
    'Cg9TaWduaW5nS2V5c2hhcmUSKwoRb3duZXJfaWRlbnRpZmllcnMYASADKAlSEG93bmVySWRlbn'
    'RpZmllcnMSHAoJdGhyZXNob2xkGAIgASgNUgl0aHJlc2hvbGQSHQoKcHVibGljX2tleRgDIAEo'
    'DFIJcHVibGljS2V5Ek0KDXB1YmxpY19zaGFyZXMYBCADKAsyKC5zcGFyay5TaWduaW5nS2V5c2'
    'hhcmUuUHVibGljU2hhcmVzRW50cnlSDHB1YmxpY1NoYXJlcxI9Cgx1cGRhdGVkX3RpbWUYBSAB'
    'KAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgt1cGRhdGVkVGltZRo/ChFQdWJsaWNTaG'
    'FyZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoDFIFdmFsdWU6AjgB');

@$core.Deprecated('Use signingResultDescriptor instead')
const SigningResult$json = {
  '1': 'SigningResult',
  '2': [
    {
      '1': 'public_keys',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.SigningResult.PublicKeysEntry',
      '10': 'publicKeys'
    },
    {
      '1': 'signing_nonce_commitments',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark.SigningResult.SigningNonceCommitmentsEntry',
      '10': 'signingNonceCommitments'
    },
    {
      '1': 'signature_shares',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.spark.SigningResult.SignatureSharesEntry',
      '10': 'signatureShares'
    },
    {
      '1': 'signing_keyshare',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningKeyshare',
      '10': 'signingKeyshare'
    },
  ],
  '3': [
    SigningResult_PublicKeysEntry$json,
    SigningResult_SigningNonceCommitmentsEntry$json,
    SigningResult_SignatureSharesEntry$json
  ],
};

@$core.Deprecated('Use signingResultDescriptor instead')
const SigningResult_PublicKeysEntry$json = {
  '1': 'PublicKeysEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use signingResultDescriptor instead')
const SigningResult_SigningNonceCommitmentsEntry$json = {
  '1': 'SigningNonceCommitmentsEntry',
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

@$core.Deprecated('Use signingResultDescriptor instead')
const SigningResult_SignatureSharesEntry$json = {
  '1': 'SignatureSharesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `SigningResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingResultDescriptor = $convert.base64Decode(
    'Cg1TaWduaW5nUmVzdWx0EkUKC3B1YmxpY19rZXlzGAEgAygLMiQuc3BhcmsuU2lnbmluZ1Jlc3'
    'VsdC5QdWJsaWNLZXlzRW50cnlSCnB1YmxpY0tleXMSbQoZc2lnbmluZ19ub25jZV9jb21taXRt'
    'ZW50cxgCIAMoCzIxLnNwYXJrLlNpZ25pbmdSZXN1bHQuU2lnbmluZ05vbmNlQ29tbWl0bWVudH'
    'NFbnRyeVIXc2lnbmluZ05vbmNlQ29tbWl0bWVudHMSVAoQc2lnbmF0dXJlX3NoYXJlcxgDIAMo'
    'CzIpLnNwYXJrLlNpZ25pbmdSZXN1bHQuU2lnbmF0dXJlU2hhcmVzRW50cnlSD3NpZ25hdHVyZV'
    'NoYXJlcxJBChBzaWduaW5nX2tleXNoYXJlGAQgASgLMhYuc3BhcmsuU2lnbmluZ0tleXNoYXJl'
    'Ug9zaWduaW5nS2V5c2hhcmUaPQoPUHVibGljS2V5c0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5Eh'
    'QKBXZhbHVlGAIgASgMUgV2YWx1ZToCOAEaZQocU2lnbmluZ05vbmNlQ29tbWl0bWVudHNFbnRy'
    'eRIQCgNrZXkYASABKAlSA2tleRIvCgV2YWx1ZRgCIAEoCzIZLmNvbW1vbi5TaWduaW5nQ29tbW'
    'l0bWVudFIFdmFsdWU6AjgBGkIKFFNpZ25hdHVyZVNoYXJlc0VudHJ5EhAKA2tleRgBIAEoCVID'
    'a2V5EhQKBXZhbHVlGAIgASgMUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use renewLeafRequestDescriptor instead')
const RenewLeafRequest$json = {
  '1': 'RenewLeafRequest',
  '2': [
    {'1': 'leaf_id', '3': 1, '4': 1, '5': 9, '10': 'leafId'},
    {
      '1': 'renew_node_timelock_signing_job',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.RenewNodeTimelockSigningJob',
      '9': 0,
      '10': 'renewNodeTimelockSigningJob'
    },
    {
      '1': 'renew_refund_timelock_signing_job',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.RenewRefundTimelockSigningJob',
      '9': 0,
      '10': 'renewRefundTimelockSigningJob'
    },
    {
      '1': 'renew_node_zero_timelock_signing_job',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark.RenewNodeZeroTimelockSigningJob',
      '9': 0,
      '10': 'renewNodeZeroTimelockSigningJob'
    },
  ],
  '8': [
    {'1': 'signing_jobs'},
  ],
};

/// Descriptor for `RenewLeafRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List renewLeafRequestDescriptor = $convert.base64Decode(
    'ChBSZW5ld0xlYWZSZXF1ZXN0EhcKB2xlYWZfaWQYASABKAlSBmxlYWZJZBJqCh9yZW5ld19ub2'
    'RlX3RpbWVsb2NrX3NpZ25pbmdfam9iGAIgASgLMiIuc3BhcmsuUmVuZXdOb2RlVGltZWxvY2tT'
    'aWduaW5nSm9iSABSG3JlbmV3Tm9kZVRpbWVsb2NrU2lnbmluZ0pvYhJwCiFyZW5ld19yZWZ1bm'
    'RfdGltZWxvY2tfc2lnbmluZ19qb2IYAyABKAsyJC5zcGFyay5SZW5ld1JlZnVuZFRpbWVsb2Nr'
    'U2lnbmluZ0pvYkgAUh1yZW5ld1JlZnVuZFRpbWVsb2NrU2lnbmluZ0pvYhJ3CiRyZW5ld19ub2'
    'RlX3plcm9fdGltZWxvY2tfc2lnbmluZ19qb2IYBCABKAsyJi5zcGFyay5SZW5ld05vZGVaZXJv'
    'VGltZWxvY2tTaWduaW5nSm9iSABSH3JlbmV3Tm9kZVplcm9UaW1lbG9ja1NpZ25pbmdKb2JCDg'
    'oMc2lnbmluZ19qb2Jz');

@$core.Deprecated('Use renewNodeTimelockSigningJobDescriptor instead')
const RenewNodeTimelockSigningJob$json = {
  '1': 'RenewNodeTimelockSigningJob',
  '2': [
    {
      '1': 'split_node_tx_signing_job',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'splitNodeTxSigningJob'
    },
    {
      '1': 'split_node_direct_tx_signing_job',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'splitNodeDirectTxSigningJob'
    },
    {
      '1': 'node_tx_signing_job',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'nodeTxSigningJob'
    },
    {
      '1': 'refund_tx_signing_job',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'refundTxSigningJob'
    },
    {
      '1': 'direct_node_tx_signing_job',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'directNodeTxSigningJob'
    },
    {
      '1': 'direct_refund_tx_signing_job',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'directRefundTxSigningJob'
    },
    {
      '1': 'direct_from_cpfp_refund_tx_signing_job',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'directFromCpfpRefundTxSigningJob'
    },
  ],
};

/// Descriptor for `RenewNodeTimelockSigningJob`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List renewNodeTimelockSigningJobDescriptor = $convert.base64Decode(
    'ChtSZW5ld05vZGVUaW1lbG9ja1NpZ25pbmdKb2ISVwoZc3BsaXRfbm9kZV90eF9zaWduaW5nX2'
    'pvYhgBIAEoCzIdLnNwYXJrLlVzZXJTaWduZWRUeFNpZ25pbmdKb2JSFXNwbGl0Tm9kZVR4U2ln'
    'bmluZ0pvYhJkCiBzcGxpdF9ub2RlX2RpcmVjdF90eF9zaWduaW5nX2pvYhgCIAEoCzIdLnNwYX'
    'JrLlVzZXJTaWduZWRUeFNpZ25pbmdKb2JSG3NwbGl0Tm9kZURpcmVjdFR4U2lnbmluZ0pvYhJM'
    'ChNub2RlX3R4X3NpZ25pbmdfam9iGAMgASgLMh0uc3BhcmsuVXNlclNpZ25lZFR4U2lnbmluZ0'
    'pvYlIQbm9kZVR4U2lnbmluZ0pvYhJQChVyZWZ1bmRfdHhfc2lnbmluZ19qb2IYBCABKAsyHS5z'
    'cGFyay5Vc2VyU2lnbmVkVHhTaWduaW5nSm9iUhJyZWZ1bmRUeFNpZ25pbmdKb2ISWQoaZGlyZW'
    'N0X25vZGVfdHhfc2lnbmluZ19qb2IYBSABKAsyHS5zcGFyay5Vc2VyU2lnbmVkVHhTaWduaW5n'
    'Sm9iUhZkaXJlY3ROb2RlVHhTaWduaW5nSm9iEl0KHGRpcmVjdF9yZWZ1bmRfdHhfc2lnbmluZ1'
    '9qb2IYBiABKAsyHS5zcGFyay5Vc2VyU2lnbmVkVHhTaWduaW5nSm9iUhhkaXJlY3RSZWZ1bmRU'
    'eFNpZ25pbmdKb2ISbwomZGlyZWN0X2Zyb21fY3BmcF9yZWZ1bmRfdHhfc2lnbmluZ19qb2IYBy'
    'ABKAsyHS5zcGFyay5Vc2VyU2lnbmVkVHhTaWduaW5nSm9iUiBkaXJlY3RGcm9tQ3BmcFJlZnVu'
    'ZFR4U2lnbmluZ0pvYg==');

@$core.Deprecated('Use renewRefundTimelockSigningJobDescriptor instead')
const RenewRefundTimelockSigningJob$json = {
  '1': 'RenewRefundTimelockSigningJob',
  '2': [
    {
      '1': 'node_tx_signing_job',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'nodeTxSigningJob'
    },
    {
      '1': 'refund_tx_signing_job',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'refundTxSigningJob'
    },
    {
      '1': 'direct_node_tx_signing_job',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'directNodeTxSigningJob'
    },
    {
      '1': 'direct_refund_tx_signing_job',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'directRefundTxSigningJob'
    },
    {
      '1': 'direct_from_cpfp_refund_tx_signing_job',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'directFromCpfpRefundTxSigningJob'
    },
  ],
};

/// Descriptor for `RenewRefundTimelockSigningJob`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List renewRefundTimelockSigningJobDescriptor = $convert.base64Decode(
    'Ch1SZW5ld1JlZnVuZFRpbWVsb2NrU2lnbmluZ0pvYhJMChNub2RlX3R4X3NpZ25pbmdfam9iGA'
    'EgASgLMh0uc3BhcmsuVXNlclNpZ25lZFR4U2lnbmluZ0pvYlIQbm9kZVR4U2lnbmluZ0pvYhJQ'
    'ChVyZWZ1bmRfdHhfc2lnbmluZ19qb2IYAiABKAsyHS5zcGFyay5Vc2VyU2lnbmVkVHhTaWduaW'
    '5nSm9iUhJyZWZ1bmRUeFNpZ25pbmdKb2ISWQoaZGlyZWN0X25vZGVfdHhfc2lnbmluZ19qb2IY'
    'AyABKAsyHS5zcGFyay5Vc2VyU2lnbmVkVHhTaWduaW5nSm9iUhZkaXJlY3ROb2RlVHhTaWduaW'
    '5nSm9iEl0KHGRpcmVjdF9yZWZ1bmRfdHhfc2lnbmluZ19qb2IYBCABKAsyHS5zcGFyay5Vc2Vy'
    'U2lnbmVkVHhTaWduaW5nSm9iUhhkaXJlY3RSZWZ1bmRUeFNpZ25pbmdKb2ISbwomZGlyZWN0X2'
    'Zyb21fY3BmcF9yZWZ1bmRfdHhfc2lnbmluZ19qb2IYBSABKAsyHS5zcGFyay5Vc2VyU2lnbmVk'
    'VHhTaWduaW5nSm9iUiBkaXJlY3RGcm9tQ3BmcFJlZnVuZFR4U2lnbmluZ0pvYg==');

@$core.Deprecated('Use renewNodeZeroTimelockSigningJobDescriptor instead')
const RenewNodeZeroTimelockSigningJob$json = {
  '1': 'RenewNodeZeroTimelockSigningJob',
  '2': [
    {
      '1': 'node_tx_signing_job',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'nodeTxSigningJob'
    },
    {
      '1': 'refund_tx_signing_job',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'refundTxSigningJob'
    },
    {
      '1': 'direct_node_tx_signing_job',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'directNodeTxSigningJob'
    },
    {
      '1': 'direct_from_cpfp_refund_tx_signing_job',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'directFromCpfpRefundTxSigningJob'
    },
  ],
  '9': [
    {'1': 4, '2': 5},
  ],
};

/// Descriptor for `RenewNodeZeroTimelockSigningJob`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List renewNodeZeroTimelockSigningJobDescriptor = $convert.base64Decode(
    'Ch9SZW5ld05vZGVaZXJvVGltZWxvY2tTaWduaW5nSm9iEkwKE25vZGVfdHhfc2lnbmluZ19qb2'
    'IYASABKAsyHS5zcGFyay5Vc2VyU2lnbmVkVHhTaWduaW5nSm9iUhBub2RlVHhTaWduaW5nSm9i'
    'ElAKFXJlZnVuZF90eF9zaWduaW5nX2pvYhgCIAEoCzIdLnNwYXJrLlVzZXJTaWduZWRUeFNpZ2'
    '5pbmdKb2JSEnJlZnVuZFR4U2lnbmluZ0pvYhJZChpkaXJlY3Rfbm9kZV90eF9zaWduaW5nX2pv'
    'YhgDIAEoCzIdLnNwYXJrLlVzZXJTaWduZWRUeFNpZ25pbmdKb2JSFmRpcmVjdE5vZGVUeFNpZ2'
    '5pbmdKb2ISbwomZGlyZWN0X2Zyb21fY3BmcF9yZWZ1bmRfdHhfc2lnbmluZ19qb2IYBSABKAsy'
    'HS5zcGFyay5Vc2VyU2lnbmVkVHhTaWduaW5nSm9iUiBkaXJlY3RGcm9tQ3BmcFJlZnVuZFR4U2'
    'lnbmluZ0pvYkoECAQQBQ==');

@$core.Deprecated('Use renewLeafResponseDescriptor instead')
const RenewLeafResponse$json = {
  '1': 'RenewLeafResponse',
  '2': [
    {
      '1': 'renew_node_timelock_result',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.RenewNodeTimelockResult',
      '9': 0,
      '10': 'renewNodeTimelockResult'
    },
    {
      '1': 'renew_refund_timelock_result',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.RenewRefundTimelockResult',
      '9': 0,
      '10': 'renewRefundTimelockResult'
    },
    {
      '1': 'renew_node_zero_timelock_result',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.RenewNodeZeroTimelockResult',
      '9': 0,
      '10': 'renewNodeZeroTimelockResult'
    },
  ],
  '8': [
    {'1': 'renew_result'},
  ],
};

/// Descriptor for `RenewLeafResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List renewLeafResponseDescriptor = $convert.base64Decode(
    'ChFSZW5ld0xlYWZSZXNwb25zZRJdChpyZW5ld19ub2RlX3RpbWVsb2NrX3Jlc3VsdBgBIAEoCz'
    'IeLnNwYXJrLlJlbmV3Tm9kZVRpbWVsb2NrUmVzdWx0SABSF3JlbmV3Tm9kZVRpbWVsb2NrUmVz'
    'dWx0EmMKHHJlbmV3X3JlZnVuZF90aW1lbG9ja19yZXN1bHQYAiABKAsyIC5zcGFyay5SZW5ld1'
    'JlZnVuZFRpbWVsb2NrUmVzdWx0SABSGXJlbmV3UmVmdW5kVGltZWxvY2tSZXN1bHQSagofcmVu'
    'ZXdfbm9kZV96ZXJvX3RpbWVsb2NrX3Jlc3VsdBgDIAEoCzIiLnNwYXJrLlJlbmV3Tm9kZVplcm'
    '9UaW1lbG9ja1Jlc3VsdEgAUhtyZW5ld05vZGVaZXJvVGltZWxvY2tSZXN1bHRCDgoMcmVuZXdf'
    'cmVzdWx0');

@$core.Deprecated('Use renewNodeTimelockResultDescriptor instead')
const RenewNodeTimelockResult$json = {
  '1': 'RenewNodeTimelockResult',
  '2': [
    {
      '1': 'split_node',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.TreeNode',
      '10': 'splitNode'
    },
    {
      '1': 'node',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.TreeNode',
      '10': 'node'
    },
  ],
};

/// Descriptor for `RenewNodeTimelockResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List renewNodeTimelockResultDescriptor = $convert.base64Decode(
    'ChdSZW5ld05vZGVUaW1lbG9ja1Jlc3VsdBIuCgpzcGxpdF9ub2RlGAEgASgLMg8uc3BhcmsuVH'
    'JlZU5vZGVSCXNwbGl0Tm9kZRIjCgRub2RlGAIgASgLMg8uc3BhcmsuVHJlZU5vZGVSBG5vZGU=');

@$core.Deprecated('Use renewRefundTimelockResultDescriptor instead')
const RenewRefundTimelockResult$json = {
  '1': 'RenewRefundTimelockResult',
  '2': [
    {
      '1': 'node',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.TreeNode',
      '10': 'node'
    },
  ],
};

/// Descriptor for `RenewRefundTimelockResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List renewRefundTimelockResultDescriptor =
    $convert.base64Decode(
        'ChlSZW5ld1JlZnVuZFRpbWVsb2NrUmVzdWx0EiMKBG5vZGUYASABKAsyDy5zcGFyay5UcmVlTm'
        '9kZVIEbm9kZQ==');

@$core.Deprecated('Use renewNodeZeroTimelockResultDescriptor instead')
const RenewNodeZeroTimelockResult$json = {
  '1': 'RenewNodeZeroTimelockResult',
  '2': [
    {
      '1': 'split_node',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.TreeNode',
      '10': 'splitNode'
    },
    {
      '1': 'node',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.TreeNode',
      '10': 'node'
    },
  ],
};

/// Descriptor for `RenewNodeZeroTimelockResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List renewNodeZeroTimelockResultDescriptor =
    $convert.base64Decode(
        'ChtSZW5ld05vZGVaZXJvVGltZWxvY2tSZXN1bHQSLgoKc3BsaXRfbm9kZRgBIAEoCzIPLnNwYX'
        'JrLlRyZWVOb2RlUglzcGxpdE5vZGUSIwoEbm9kZRgCIAEoCzIPLnNwYXJrLlRyZWVOb2RlUgRu'
        'b2Rl');

@$core.Deprecated('Use nodeSignatureSharesDescriptor instead')
const NodeSignatureShares$json = {
  '1': 'NodeSignatureShares',
  '2': [
    {'1': 'node_id', '3': 1, '4': 1, '5': 9, '10': 'nodeId'},
    {
      '1': 'node_tx_signing_result',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningResult',
      '10': 'nodeTxSigningResult'
    },
    {
      '1': 'refund_tx_signing_result',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningResult',
      '10': 'refundTxSigningResult'
    },
    {'1': 'verifying_key', '3': 4, '4': 1, '5': 12, '10': 'verifyingKey'},
    {
      '1': 'direct_node_tx_signing_result',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningResult',
      '8': {'3': true},
      '10': 'directNodeTxSigningResult',
    },
    {
      '1': 'direct_refund_tx_signing_result',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningResult',
      '8': {'3': true},
      '10': 'directRefundTxSigningResult',
    },
    {
      '1': 'direct_from_cpfp_refund_tx_signing_result',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningResult',
      '10': 'directFromCpfpRefundTxSigningResult'
    },
  ],
};

/// Descriptor for `NodeSignatureShares`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nodeSignatureSharesDescriptor = $convert.base64Decode(
    'ChNOb2RlU2lnbmF0dXJlU2hhcmVzEhcKB25vZGVfaWQYASABKAlSBm5vZGVJZBJJChZub2RlX3'
    'R4X3NpZ25pbmdfcmVzdWx0GAIgASgLMhQuc3BhcmsuU2lnbmluZ1Jlc3VsdFITbm9kZVR4U2ln'
    'bmluZ1Jlc3VsdBJNChhyZWZ1bmRfdHhfc2lnbmluZ19yZXN1bHQYAyABKAsyFC5zcGFyay5TaW'
    'duaW5nUmVzdWx0UhVyZWZ1bmRUeFNpZ25pbmdSZXN1bHQSIwoNdmVyaWZ5aW5nX2tleRgEIAEo'
    'DFIMdmVyaWZ5aW5nS2V5EloKHWRpcmVjdF9ub2RlX3R4X3NpZ25pbmdfcmVzdWx0GAUgASgLMh'
    'Quc3BhcmsuU2lnbmluZ1Jlc3VsdEICGAFSGWRpcmVjdE5vZGVUeFNpZ25pbmdSZXN1bHQSXgof'
    'ZGlyZWN0X3JlZnVuZF90eF9zaWduaW5nX3Jlc3VsdBgGIAEoCzIULnNwYXJrLlNpZ25pbmdSZX'
    'N1bHRCAhgBUhtkaXJlY3RSZWZ1bmRUeFNpZ25pbmdSZXN1bHQSbAopZGlyZWN0X2Zyb21fY3Bm'
    'cF9yZWZ1bmRfdHhfc2lnbmluZ19yZXN1bHQYByABKAsyFC5zcGFyay5TaWduaW5nUmVzdWx0Ui'
    'NkaXJlY3RGcm9tQ3BmcFJlZnVuZFR4U2lnbmluZ1Jlc3VsdA==');

@$core.Deprecated('Use nodeSignaturesDescriptor instead')
const NodeSignatures$json = {
  '1': 'NodeSignatures',
  '2': [
    {'1': 'node_id', '3': 1, '4': 1, '5': 9, '10': 'nodeId'},
    {
      '1': 'node_tx_signature',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'nodeTxSignature'
    },
    {
      '1': 'refund_tx_signature',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'refundTxSignature'
    },
    {
      '1': 'direct_node_tx_signature',
      '3': 4,
      '4': 1,
      '5': 12,
      '10': 'directNodeTxSignature'
    },
    {
      '1': 'direct_refund_tx_signature',
      '3': 5,
      '4': 1,
      '5': 12,
      '10': 'directRefundTxSignature'
    },
    {
      '1': 'direct_from_cpfp_refund_tx_signature',
      '3': 6,
      '4': 1,
      '5': 12,
      '10': 'directFromCpfpRefundTxSignature'
    },
  ],
};

/// Descriptor for `NodeSignatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nodeSignaturesDescriptor = $convert.base64Decode(
    'Cg5Ob2RlU2lnbmF0dXJlcxIXCgdub2RlX2lkGAEgASgJUgZub2RlSWQSKgoRbm9kZV90eF9zaW'
    'duYXR1cmUYAiABKAxSD25vZGVUeFNpZ25hdHVyZRIuChNyZWZ1bmRfdHhfc2lnbmF0dXJlGAMg'
    'ASgMUhFyZWZ1bmRUeFNpZ25hdHVyZRI3ChhkaXJlY3Rfbm9kZV90eF9zaWduYXR1cmUYBCABKA'
    'xSFWRpcmVjdE5vZGVUeFNpZ25hdHVyZRI7ChpkaXJlY3RfcmVmdW5kX3R4X3NpZ25hdHVyZRgF'
    'IAEoDFIXZGlyZWN0UmVmdW5kVHhTaWduYXR1cmUSTQokZGlyZWN0X2Zyb21fY3BmcF9yZWZ1bm'
    'RfdHhfc2lnbmF0dXJlGAYgASgMUh9kaXJlY3RGcm9tQ3BmcFJlZnVuZFR4U2lnbmF0dXJl');

@$core.Deprecated('Use startTreeCreationRequestDescriptor instead')
const StartTreeCreationRequest$json = {
  '1': 'StartTreeCreationRequest',
  '2': [
    {
      '1': 'identity_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'identityPublicKey'
    },
    {
      '1': 'on_chain_utxo',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.UTXO',
      '10': 'onChainUtxo'
    },
    {
      '1': 'root_tx_signing_job',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'rootTxSigningJob'
    },
    {
      '1': 'refund_tx_signing_job',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'refundTxSigningJob'
    },
    {
      '1': 'direct_root_tx_signing_job',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'directRootTxSigningJob'
    },
    {
      '1': 'direct_refund_tx_signing_job',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'directRefundTxSigningJob'
    },
    {
      '1': 'direct_from_cpfp_refund_tx_signing_job',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'directFromCpfpRefundTxSigningJob'
    },
  ],
};

/// Descriptor for `StartTreeCreationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startTreeCreationRequestDescriptor = $convert.base64Decode(
    'ChhTdGFydFRyZWVDcmVhdGlvblJlcXVlc3QSLgoTaWRlbnRpdHlfcHVibGljX2tleRgBIAEoDF'
    'IRaWRlbnRpdHlQdWJsaWNLZXkSLwoNb25fY2hhaW5fdXR4bxgCIAEoCzILLnNwYXJrLlVUWE9S'
    'C29uQ2hhaW5VdHhvEkAKE3Jvb3RfdHhfc2lnbmluZ19qb2IYAyABKAsyES5zcGFyay5TaWduaW'
    '5nSm9iUhByb290VHhTaWduaW5nSm9iEkQKFXJlZnVuZF90eF9zaWduaW5nX2pvYhgEIAEoCzIR'
    'LnNwYXJrLlNpZ25pbmdKb2JSEnJlZnVuZFR4U2lnbmluZ0pvYhJNChpkaXJlY3Rfcm9vdF90eF'
    '9zaWduaW5nX2pvYhgFIAEoCzIRLnNwYXJrLlNpZ25pbmdKb2JSFmRpcmVjdFJvb3RUeFNpZ25p'
    'bmdKb2ISUQocZGlyZWN0X3JlZnVuZF90eF9zaWduaW5nX2pvYhgGIAEoCzIRLnNwYXJrLlNpZ2'
    '5pbmdKb2JSGGRpcmVjdFJlZnVuZFR4U2lnbmluZ0pvYhJjCiZkaXJlY3RfZnJvbV9jcGZwX3Jl'
    'ZnVuZF90eF9zaWduaW5nX2pvYhgHIAEoCzIRLnNwYXJrLlNpZ25pbmdKb2JSIGRpcmVjdEZyb2'
    '1DcGZwUmVmdW5kVHhTaWduaW5nSm9i');

@$core.Deprecated('Use startTreeCreationResponseDescriptor instead')
const StartTreeCreationResponse$json = {
  '1': 'StartTreeCreationResponse',
  '2': [
    {'1': 'tree_id', '3': 1, '4': 1, '5': 9, '10': 'treeId'},
    {
      '1': 'root_node_signature_shares',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.NodeSignatureShares',
      '10': 'rootNodeSignatureShares'
    },
  ],
};

/// Descriptor for `StartTreeCreationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startTreeCreationResponseDescriptor = $convert.base64Decode(
    'ChlTdGFydFRyZWVDcmVhdGlvblJlc3BvbnNlEhcKB3RyZWVfaWQYASABKAlSBnRyZWVJZBJXCh'
    'pyb290X25vZGVfc2lnbmF0dXJlX3NoYXJlcxgCIAEoCzIaLnNwYXJrLk5vZGVTaWduYXR1cmVT'
    'aGFyZXNSF3Jvb3ROb2RlU2lnbmF0dXJlU2hhcmVz');

@$core.Deprecated('Use startDepositTreeCreationRequestDescriptor instead')
const StartDepositTreeCreationRequest$json = {
  '1': 'StartDepositTreeCreationRequest',
  '2': [
    {
      '1': 'identity_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'identityPublicKey'
    },
    {
      '1': 'on_chain_utxo',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.UTXO',
      '10': 'onChainUtxo'
    },
    {
      '1': 'root_tx_signing_job',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'rootTxSigningJob'
    },
    {
      '1': 'refund_tx_signing_job',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'refundTxSigningJob'
    },
    {
      '1': 'direct_root_tx_signing_job',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '8': {'3': true},
      '10': 'directRootTxSigningJob',
    },
    {
      '1': 'direct_refund_tx_signing_job',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '8': {'3': true},
      '10': 'directRefundTxSigningJob',
    },
    {
      '1': 'direct_from_cpfp_refund_tx_signing_job',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'directFromCpfpRefundTxSigningJob'
    },
  ],
};

/// Descriptor for `StartDepositTreeCreationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startDepositTreeCreationRequestDescriptor = $convert.base64Decode(
    'Ch9TdGFydERlcG9zaXRUcmVlQ3JlYXRpb25SZXF1ZXN0Ei4KE2lkZW50aXR5X3B1YmxpY19rZX'
    'kYASABKAxSEWlkZW50aXR5UHVibGljS2V5Ei8KDW9uX2NoYWluX3V0eG8YAiABKAsyCy5zcGFy'
    'ay5VVFhPUgtvbkNoYWluVXR4bxJAChNyb290X3R4X3NpZ25pbmdfam9iGAMgASgLMhEuc3Bhcm'
    'suU2lnbmluZ0pvYlIQcm9vdFR4U2lnbmluZ0pvYhJEChVyZWZ1bmRfdHhfc2lnbmluZ19qb2IY'
    'BCABKAsyES5zcGFyay5TaWduaW5nSm9iUhJyZWZ1bmRUeFNpZ25pbmdKb2ISUQoaZGlyZWN0X3'
    'Jvb3RfdHhfc2lnbmluZ19qb2IYBSABKAsyES5zcGFyay5TaWduaW5nSm9iQgIYAVIWZGlyZWN0'
    'Um9vdFR4U2lnbmluZ0pvYhJVChxkaXJlY3RfcmVmdW5kX3R4X3NpZ25pbmdfam9iGAYgASgLMh'
    'Euc3BhcmsuU2lnbmluZ0pvYkICGAFSGGRpcmVjdFJlZnVuZFR4U2lnbmluZ0pvYhJjCiZkaXJl'
    'Y3RfZnJvbV9jcGZwX3JlZnVuZF90eF9zaWduaW5nX2pvYhgHIAEoCzIRLnNwYXJrLlNpZ25pbm'
    'dKb2JSIGRpcmVjdEZyb21DcGZwUmVmdW5kVHhTaWduaW5nSm9i');

@$core.Deprecated('Use startDepositTreeCreationResponseDescriptor instead')
const StartDepositTreeCreationResponse$json = {
  '1': 'StartDepositTreeCreationResponse',
  '2': [
    {'1': 'tree_id', '3': 1, '4': 1, '5': 9, '10': 'treeId'},
    {
      '1': 'root_node_signature_shares',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.NodeSignatureShares',
      '10': 'rootNodeSignatureShares'
    },
  ],
};

/// Descriptor for `StartDepositTreeCreationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startDepositTreeCreationResponseDescriptor =
    $convert.base64Decode(
        'CiBTdGFydERlcG9zaXRUcmVlQ3JlYXRpb25SZXNwb25zZRIXCgd0cmVlX2lkGAEgASgJUgZ0cm'
        'VlSWQSVwoacm9vdF9ub2RlX3NpZ25hdHVyZV9zaGFyZXMYAiABKAsyGi5zcGFyay5Ob2RlU2ln'
        'bmF0dXJlU2hhcmVzUhdyb290Tm9kZVNpZ25hdHVyZVNoYXJlcw==');

@$core.Deprecated('Use finalizeDepositTreeCreationRequestDescriptor instead')
const FinalizeDepositTreeCreationRequest$json = {
  '1': 'FinalizeDepositTreeCreationRequest',
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
      '1': 'on_chain_utxo',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.UTXO',
      '10': 'onChainUtxo'
    },
    {
      '1': 'root_tx_signing_job',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'rootTxSigningJob'
    },
    {
      '1': 'refund_tx_signing_job',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'refundTxSigningJob'
    },
    {
      '1': 'direct_from_cpfp_refund_tx_signing_job',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'directFromCpfpRefundTxSigningJob'
    },
    {
      '1': 'additional_on_chain_utxos',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.spark.UTXO',
      '10': 'additionalOnChainUtxos'
    },
  ],
};

/// Descriptor for `FinalizeDepositTreeCreationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List finalizeDepositTreeCreationRequestDescriptor = $convert.base64Decode(
    'CiJGaW5hbGl6ZURlcG9zaXRUcmVlQ3JlYXRpb25SZXF1ZXN0EjcKE2lkZW50aXR5X3B1YmxpY1'
    '9rZXkYASABKAxCB/pCBHoCaCFSEWlkZW50aXR5UHVibGljS2V5Ei8KDW9uX2NoYWluX3V0eG8Y'
    'AiABKAsyCy5zcGFyay5VVFhPUgtvbkNoYWluVXR4bxJMChNyb290X3R4X3NpZ25pbmdfam9iGA'
    'MgASgLMh0uc3BhcmsuVXNlclNpZ25lZFR4U2lnbmluZ0pvYlIQcm9vdFR4U2lnbmluZ0pvYhJQ'
    'ChVyZWZ1bmRfdHhfc2lnbmluZ19qb2IYBCABKAsyHS5zcGFyay5Vc2VyU2lnbmVkVHhTaWduaW'
    '5nSm9iUhJyZWZ1bmRUeFNpZ25pbmdKb2ISbwomZGlyZWN0X2Zyb21fY3BmcF9yZWZ1bmRfdHhf'
    'c2lnbmluZ19qb2IYBSABKAsyHS5zcGFyay5Vc2VyU2lnbmVkVHhTaWduaW5nSm9iUiBkaXJlY3'
    'RGcm9tQ3BmcFJlZnVuZFR4U2lnbmluZ0pvYhJGChlhZGRpdGlvbmFsX29uX2NoYWluX3V0eG9z'
    'GAYgAygLMgsuc3BhcmsuVVRYT1IWYWRkaXRpb25hbE9uQ2hhaW5VdHhvcw==');

@$core.Deprecated('Use finalizeDepositTreeCreationResponseDescriptor instead')
const FinalizeDepositTreeCreationResponse$json = {
  '1': 'FinalizeDepositTreeCreationResponse',
  '2': [
    {
      '1': 'root_node',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.TreeNode',
      '10': 'rootNode'
    },
  ],
};

/// Descriptor for `FinalizeDepositTreeCreationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List finalizeDepositTreeCreationResponseDescriptor =
    $convert.base64Decode(
        'CiNGaW5hbGl6ZURlcG9zaXRUcmVlQ3JlYXRpb25SZXNwb25zZRIsCglyb290X25vZGUYASABKA'
        'syDy5zcGFyay5UcmVlTm9kZVIIcm9vdE5vZGU=');

@$core.Deprecated('Use treeNodeDescriptor instead')
const TreeNode$json = {
  '1': 'TreeNode',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'tree_id', '3': 2, '4': 1, '5': 9, '10': 'treeId'},
    {'1': 'value', '3': 3, '4': 1, '5': 4, '10': 'value'},
    {
      '1': 'parent_node_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'parentNodeId',
      '17': true
    },
    {'1': 'node_tx', '3': 5, '4': 1, '5': 12, '10': 'nodeTx'},
    {'1': 'refund_tx', '3': 6, '4': 1, '5': 12, '10': 'refundTx'},
    {'1': 'vout', '3': 7, '4': 1, '5': 13, '10': 'vout'},
    {
      '1': 'verifying_public_key',
      '3': 8,
      '4': 1,
      '5': 12,
      '10': 'verifyingPublicKey'
    },
    {
      '1': 'owner_identity_public_key',
      '3': 9,
      '4': 1,
      '5': 12,
      '10': 'ownerIdentityPublicKey'
    },
    {
      '1': 'signing_keyshare',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningKeyshare',
      '10': 'signingKeyshare'
    },
    {'1': 'status', '3': 11, '4': 1, '5': 9, '10': 'status'},
    {
      '1': 'network',
      '3': 12,
      '4': 1,
      '5': 14,
      '6': '.spark.Network',
      '10': 'network'
    },
    {
      '1': 'created_time',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdTime'
    },
    {
      '1': 'updated_time',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedTime'
    },
    {
      '1': 'owner_signing_public_key',
      '3': 15,
      '4': 1,
      '5': 12,
      '10': 'ownerSigningPublicKey'
    },
    {'1': 'direct_tx', '3': 16, '4': 1, '5': 12, '10': 'directTx'},
    {'1': 'direct_refund_tx', '3': 17, '4': 1, '5': 12, '10': 'directRefundTx'},
    {
      '1': 'direct_from_cpfp_refund_tx',
      '3': 18,
      '4': 1,
      '5': 12,
      '10': 'directFromCpfpRefundTx'
    },
    {
      '1': 'treenode_status',
      '3': 19,
      '4': 1,
      '5': 14,
      '6': '.spark.TreeNodeStatus',
      '10': 'treenodeStatus'
    },
  ],
  '8': [
    {'1': '_parent_node_id'},
  ],
};

/// Descriptor for `TreeNode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List treeNodeDescriptor = $convert.base64Decode(
    'CghUcmVlTm9kZRIOCgJpZBgBIAEoCVICaWQSFwoHdHJlZV9pZBgCIAEoCVIGdHJlZUlkEhQKBX'
    'ZhbHVlGAMgASgEUgV2YWx1ZRIpCg5wYXJlbnRfbm9kZV9pZBgEIAEoCUgAUgxwYXJlbnROb2Rl'
    'SWSIAQESFwoHbm9kZV90eBgFIAEoDFIGbm9kZVR4EhsKCXJlZnVuZF90eBgGIAEoDFIIcmVmdW'
    '5kVHgSEgoEdm91dBgHIAEoDVIEdm91dBIwChR2ZXJpZnlpbmdfcHVibGljX2tleRgIIAEoDFIS'
    'dmVyaWZ5aW5nUHVibGljS2V5EjkKGW93bmVyX2lkZW50aXR5X3B1YmxpY19rZXkYCSABKAxSFm'
    '93bmVySWRlbnRpdHlQdWJsaWNLZXkSQQoQc2lnbmluZ19rZXlzaGFyZRgKIAEoCzIWLnNwYXJr'
    'LlNpZ25pbmdLZXlzaGFyZVIPc2lnbmluZ0tleXNoYXJlEhYKBnN0YXR1cxgLIAEoCVIGc3RhdH'
    'VzEigKB25ldHdvcmsYDCABKA4yDi5zcGFyay5OZXR3b3JrUgduZXR3b3JrEj0KDGNyZWF0ZWRf'
    'dGltZRgNIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSC2NyZWF0ZWRUaW1lEj0KDH'
    'VwZGF0ZWRfdGltZRgOIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSC3VwZGF0ZWRU'
    'aW1lEjcKGG93bmVyX3NpZ25pbmdfcHVibGljX2tleRgPIAEoDFIVb3duZXJTaWduaW5nUHVibG'
    'ljS2V5EhsKCWRpcmVjdF90eBgQIAEoDFIIZGlyZWN0VHgSKAoQZGlyZWN0X3JlZnVuZF90eBgR'
    'IAEoDFIOZGlyZWN0UmVmdW5kVHgSOgoaZGlyZWN0X2Zyb21fY3BmcF9yZWZ1bmRfdHgYEiABKA'
    'xSFmRpcmVjdEZyb21DcGZwUmVmdW5kVHgSPgoPdHJlZW5vZGVfc3RhdHVzGBMgASgOMhUuc3Bh'
    'cmsuVHJlZU5vZGVTdGF0dXNSDnRyZWVub2RlU3RhdHVzQhEKD19wYXJlbnRfbm9kZV9pZA==');

@$core.Deprecated('Use finalizeNodeSignaturesRequestDescriptor instead')
const FinalizeNodeSignaturesRequest$json = {
  '1': 'FinalizeNodeSignaturesRequest',
  '2': [
    {
      '1': 'intent',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.common.SignatureIntent',
      '10': 'intent'
    },
    {
      '1': 'node_signatures',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark.NodeSignatures',
      '10': 'nodeSignatures'
    },
  ],
};

/// Descriptor for `FinalizeNodeSignaturesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List finalizeNodeSignaturesRequestDescriptor =
    $convert.base64Decode(
        'Ch1GaW5hbGl6ZU5vZGVTaWduYXR1cmVzUmVxdWVzdBIvCgZpbnRlbnQYASABKA4yFy5jb21tb2'
        '4uU2lnbmF0dXJlSW50ZW50UgZpbnRlbnQSPgoPbm9kZV9zaWduYXR1cmVzGAIgAygLMhUuc3Bh'
        'cmsuTm9kZVNpZ25hdHVyZXNSDm5vZGVTaWduYXR1cmVz');

@$core.Deprecated('Use finalizeNodeSignaturesResponseDescriptor instead')
const FinalizeNodeSignaturesResponse$json = {
  '1': 'FinalizeNodeSignaturesResponse',
  '2': [
    {
      '1': 'nodes',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.TreeNode',
      '10': 'nodes'
    },
  ],
};

/// Descriptor for `FinalizeNodeSignaturesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List finalizeNodeSignaturesResponseDescriptor =
    $convert.base64Decode(
        'Ch5GaW5hbGl6ZU5vZGVTaWduYXR1cmVzUmVzcG9uc2USJQoFbm9kZXMYASADKAsyDy5zcGFyay'
        '5UcmVlTm9kZVIFbm9kZXM=');

@$core.Deprecated('Use secretShareDescriptor instead')
const SecretShare$json = {
  '1': 'SecretShare',
  '2': [
    {'1': 'secret_share', '3': 1, '4': 1, '5': 12, '10': 'secretShare'},
    {'1': 'proofs', '3': 2, '4': 3, '5': 12, '10': 'proofs'},
  ],
};

/// Descriptor for `SecretShare`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List secretShareDescriptor = $convert.base64Decode(
    'CgtTZWNyZXRTaGFyZRIhCgxzZWNyZXRfc2hhcmUYASABKAxSC3NlY3JldFNoYXJlEhYKBnByb2'
    '9mcxgCIAMoDFIGcHJvb2Zz');

@$core.Deprecated('Use secretProofDescriptor instead')
const SecretProof$json = {
  '1': 'SecretProof',
  '2': [
    {'1': 'proofs', '3': 1, '4': 3, '5': 12, '10': 'proofs'},
  ],
};

/// Descriptor for `SecretProof`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List secretProofDescriptor = $convert
    .base64Decode('CgtTZWNyZXRQcm9vZhIWCgZwcm9vZnMYASADKAxSBnByb29mcw==');

@$core.Deprecated('Use leafRefundTxSigningJobDescriptor instead')
const LeafRefundTxSigningJob$json = {
  '1': 'LeafRefundTxSigningJob',
  '2': [
    {'1': 'leaf_id', '3': 1, '4': 1, '5': 9, '10': 'leafId'},
    {
      '1': 'refund_tx_signing_job',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'refundTxSigningJob'
    },
    {
      '1': 'direct_refund_tx_signing_job',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'directRefundTxSigningJob'
    },
    {
      '1': 'direct_from_cpfp_refund_tx_signing_job',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'directFromCpfpRefundTxSigningJob'
    },
  ],
};

/// Descriptor for `LeafRefundTxSigningJob`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leafRefundTxSigningJobDescriptor = $convert.base64Decode(
    'ChZMZWFmUmVmdW5kVHhTaWduaW5nSm9iEhcKB2xlYWZfaWQYASABKAlSBmxlYWZJZBJEChVyZW'
    'Z1bmRfdHhfc2lnbmluZ19qb2IYAiABKAsyES5zcGFyay5TaWduaW5nSm9iUhJyZWZ1bmRUeFNp'
    'Z25pbmdKb2ISUQocZGlyZWN0X3JlZnVuZF90eF9zaWduaW5nX2pvYhgDIAEoCzIRLnNwYXJrLl'
    'NpZ25pbmdKb2JSGGRpcmVjdFJlZnVuZFR4U2lnbmluZ0pvYhJjCiZkaXJlY3RfZnJvbV9jcGZw'
    'X3JlZnVuZF90eF9zaWduaW5nX2pvYhgEIAEoCzIRLnNwYXJrLlNpZ25pbmdKb2JSIGRpcmVjdE'
    'Zyb21DcGZwUmVmdW5kVHhTaWduaW5nSm9i');

@$core.Deprecated('Use userSignedTxSigningJobDescriptor instead')
const UserSignedTxSigningJob$json = {
  '1': 'UserSignedTxSigningJob',
  '2': [
    {'1': 'leaf_id', '3': 1, '4': 1, '5': 9, '10': 'leafId'},
    {
      '1': 'signing_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'signingPublicKey'
    },
    {'1': 'raw_tx', '3': 3, '4': 1, '5': 12, '10': 'rawTx'},
    {
      '1': 'signing_nonce_commitment',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.common.SigningCommitment',
      '10': 'signingNonceCommitment'
    },
    {'1': 'user_signature', '3': 5, '4': 1, '5': 12, '10': 'userSignature'},
    {
      '1': 'signing_commitments',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningCommitments',
      '10': 'signingCommitments'
    },
    {
      '1': 'additional_inputs',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.spark.InputSigningData',
      '10': 'additionalInputs'
    },
  ],
};

/// Descriptor for `UserSignedTxSigningJob`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userSignedTxSigningJobDescriptor = $convert.base64Decode(
    'ChZVc2VyU2lnbmVkVHhTaWduaW5nSm9iEhcKB2xlYWZfaWQYASABKAlSBmxlYWZJZBIsChJzaW'
    'duaW5nX3B1YmxpY19rZXkYAiABKAxSEHNpZ25pbmdQdWJsaWNLZXkSFQoGcmF3X3R4GAMgASgM'
    'UgVyYXdUeBJTChhzaWduaW5nX25vbmNlX2NvbW1pdG1lbnQYBCABKAsyGS5jb21tb24uU2lnbm'
    'luZ0NvbW1pdG1lbnRSFnNpZ25pbmdOb25jZUNvbW1pdG1lbnQSJQoOdXNlcl9zaWduYXR1cmUY'
    'BSABKAxSDXVzZXJTaWduYXR1cmUSSgoTc2lnbmluZ19jb21taXRtZW50cxgGIAEoCzIZLnNwYX'
    'JrLlNpZ25pbmdDb21taXRtZW50c1ISc2lnbmluZ0NvbW1pdG1lbnRzEkQKEWFkZGl0aW9uYWxf'
    'aW5wdXRzGAcgAygLMhcuc3BhcmsuSW5wdXRTaWduaW5nRGF0YVIQYWRkaXRpb25hbElucHV0cw'
    '==');

@$core.Deprecated('Use inputSigningDataDescriptor instead')
const InputSigningData$json = {
  '1': 'InputSigningData',
  '2': [
    {
      '1': 'signing_nonce_commitment',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.common.SigningCommitment',
      '10': 'signingNonceCommitment'
    },
    {'1': 'user_signature', '3': 2, '4': 1, '5': 12, '10': 'userSignature'},
    {
      '1': 'signing_commitments',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningCommitments',
      '10': 'signingCommitments'
    },
  ],
};

/// Descriptor for `InputSigningData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputSigningDataDescriptor = $convert.base64Decode(
    'ChBJbnB1dFNpZ25pbmdEYXRhElMKGHNpZ25pbmdfbm9uY2VfY29tbWl0bWVudBgBIAEoCzIZLm'
    'NvbW1vbi5TaWduaW5nQ29tbWl0bWVudFIWc2lnbmluZ05vbmNlQ29tbWl0bWVudBIlCg51c2Vy'
    'X3NpZ25hdHVyZRgCIAEoDFINdXNlclNpZ25hdHVyZRJKChNzaWduaW5nX2NvbW1pdG1lbnRzGA'
    'MgASgLMhkuc3BhcmsuU2lnbmluZ0NvbW1pdG1lbnRzUhJzaWduaW5nQ29tbWl0bWVudHM=');

@$core.Deprecated('Use leafRefundTxSigningResultDescriptor instead')
const LeafRefundTxSigningResult$json = {
  '1': 'LeafRefundTxSigningResult',
  '2': [
    {'1': 'leaf_id', '3': 1, '4': 1, '5': 9, '10': 'leafId'},
    {
      '1': 'refund_tx_signing_result',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningResult',
      '10': 'refundTxSigningResult'
    },
    {'1': 'verifying_key', '3': 3, '4': 1, '5': 12, '10': 'verifyingKey'},
    {
      '1': 'direct_refund_tx_signing_result',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningResult',
      '10': 'directRefundTxSigningResult'
    },
    {
      '1': 'direct_from_cpfp_refund_tx_signing_result',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningResult',
      '10': 'directFromCpfpRefundTxSigningResult'
    },
  ],
};

/// Descriptor for `LeafRefundTxSigningResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leafRefundTxSigningResultDescriptor = $convert.base64Decode(
    'ChlMZWFmUmVmdW5kVHhTaWduaW5nUmVzdWx0EhcKB2xlYWZfaWQYASABKAlSBmxlYWZJZBJNCh'
    'hyZWZ1bmRfdHhfc2lnbmluZ19yZXN1bHQYAiABKAsyFC5zcGFyay5TaWduaW5nUmVzdWx0UhVy'
    'ZWZ1bmRUeFNpZ25pbmdSZXN1bHQSIwoNdmVyaWZ5aW5nX2tleRgDIAEoDFIMdmVyaWZ5aW5nS2'
    'V5EloKH2RpcmVjdF9yZWZ1bmRfdHhfc2lnbmluZ19yZXN1bHQYBCABKAsyFC5zcGFyay5TaWdu'
    'aW5nUmVzdWx0UhtkaXJlY3RSZWZ1bmRUeFNpZ25pbmdSZXN1bHQSbAopZGlyZWN0X2Zyb21fY3'
    'BmcF9yZWZ1bmRfdHhfc2lnbmluZ19yZXN1bHQYBSABKAsyFC5zcGFyay5TaWduaW5nUmVzdWx0'
    'UiNkaXJlY3RGcm9tQ3BmcFJlZnVuZFR4U2lnbmluZ1Jlc3VsdA==');

@$core.Deprecated('Use startUserSignedTransferRequestDescriptor instead')
const StartUserSignedTransferRequest$json = {
  '1': 'StartUserSignedTransferRequest',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {
      '1': 'owner_identity_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'ownerIdentityPublicKey'
    },
    {
      '1': 'leaves_to_send',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'leavesToSend'
    },
    {
      '1': 'receiver_identity_public_key',
      '3': 4,
      '4': 1,
      '5': 12,
      '10': 'receiverIdentityPublicKey'
    },
    {
      '1': 'expiry_time',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'expiryTime'
    },
    {
      '1': 'direct_leaves_to_send',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'directLeavesToSend'
    },
    {
      '1': 'direct_from_cpfp_leaves_to_send',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'directFromCpfpLeavesToSend'
    },
  ],
};

/// Descriptor for `StartUserSignedTransferRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startUserSignedTransferRequestDescriptor = $convert.base64Decode(
    'Ch5TdGFydFVzZXJTaWduZWRUcmFuc2ZlclJlcXVlc3QSHwoLdHJhbnNmZXJfaWQYASABKAlSCn'
    'RyYW5zZmVySWQSOQoZb3duZXJfaWRlbnRpdHlfcHVibGljX2tleRgCIAEoDFIWb3duZXJJZGVu'
    'dGl0eVB1YmxpY0tleRJDCg5sZWF2ZXNfdG9fc2VuZBgDIAMoCzIdLnNwYXJrLlVzZXJTaWduZW'
    'RUeFNpZ25pbmdKb2JSDGxlYXZlc1RvU2VuZBI/ChxyZWNlaXZlcl9pZGVudGl0eV9wdWJsaWNf'
    'a2V5GAQgASgMUhlyZWNlaXZlcklkZW50aXR5UHVibGljS2V5EjsKC2V4cGlyeV90aW1lGAUgAS'
    'gLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKZXhwaXJ5VGltZRJQChVkaXJlY3RfbGVh'
    'dmVzX3RvX3NlbmQYBiADKAsyHS5zcGFyay5Vc2VyU2lnbmVkVHhTaWduaW5nSm9iUhJkaXJlY3'
    'RMZWF2ZXNUb1NlbmQSYgofZGlyZWN0X2Zyb21fY3BmcF9sZWF2ZXNfdG9fc2VuZBgHIAMoCzId'
    'LnNwYXJrLlVzZXJTaWduZWRUeFNpZ25pbmdKb2JSGmRpcmVjdEZyb21DcGZwTGVhdmVzVG9TZW'
    '5k');

@$core.Deprecated('Use startTransferRequestDescriptor instead')
const StartTransferRequest$json = {
  '1': 'StartTransferRequest',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {
      '1': 'owner_identity_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'ownerIdentityPublicKey'
    },
    {
      '1': 'leaves_to_send',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.spark.LeafRefundTxSigningJob',
      '10': 'leavesToSend'
    },
    {
      '1': 'receiver_identity_public_key',
      '3': 4,
      '4': 1,
      '5': 12,
      '10': 'receiverIdentityPublicKey'
    },
    {
      '1': 'expiry_time',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'expiryTime'
    },
    {
      '1': 'transfer_package',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.spark.TransferPackage',
      '10': 'transferPackage'
    },
    {'1': 'spark_invoice', '3': 10, '4': 1, '5': 9, '10': 'sparkInvoice'},
  ],
  '9': [
    {'1': 6, '2': 7},
    {'1': 9, '2': 10},
  ],
};

/// Descriptor for `StartTransferRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startTransferRequestDescriptor = $convert.base64Decode(
    'ChRTdGFydFRyYW5zZmVyUmVxdWVzdBIfCgt0cmFuc2Zlcl9pZBgBIAEoCVIKdHJhbnNmZXJJZB'
    'I5Chlvd25lcl9pZGVudGl0eV9wdWJsaWNfa2V5GAIgASgMUhZvd25lcklkZW50aXR5UHVibGlj'
    'S2V5EkMKDmxlYXZlc190b19zZW5kGAMgAygLMh0uc3BhcmsuTGVhZlJlZnVuZFR4U2lnbmluZ0'
    'pvYlIMbGVhdmVzVG9TZW5kEj8KHHJlY2VpdmVyX2lkZW50aXR5X3B1YmxpY19rZXkYBCABKAxS'
    'GXJlY2VpdmVySWRlbnRpdHlQdWJsaWNLZXkSOwoLZXhwaXJ5X3RpbWUYBSABKAsyGi5nb29nbG'
    'UucHJvdG9idWYuVGltZXN0YW1wUgpleHBpcnlUaW1lEkEKEHRyYW5zZmVyX3BhY2thZ2UYByAB'
    'KAsyFi5zcGFyay5UcmFuc2ZlclBhY2thZ2VSD3RyYW5zZmVyUGFja2FnZRIjCg1zcGFya19pbn'
    'ZvaWNlGAogASgJUgxzcGFya0ludm9pY2VKBAgGEAdKBAgJEAo=');

@$core.Deprecated('Use startTransferResponseDescriptor instead')
const StartTransferResponse$json = {
  '1': 'StartTransferResponse',
  '2': [
    {
      '1': 'transfer',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.Transfer',
      '10': 'transfer'
    },
    {
      '1': 'signing_results',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark.LeafRefundTxSigningResult',
      '10': 'signingResults'
    },
  ],
};

/// Descriptor for `StartTransferResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startTransferResponseDescriptor = $convert.base64Decode(
    'ChVTdGFydFRyYW5zZmVyUmVzcG9uc2USKwoIdHJhbnNmZXIYASABKAsyDy5zcGFyay5UcmFuc2'
    'ZlclIIdHJhbnNmZXISSQoPc2lnbmluZ19yZXN1bHRzGAIgAygLMiAuc3BhcmsuTGVhZlJlZnVu'
    'ZFR4U2lnbmluZ1Jlc3VsdFIOc2lnbmluZ1Jlc3VsdHM=');

@$core.Deprecated('Use senderTransferPackageDescriptor instead')
const SenderTransferPackage$json = {
  '1': 'SenderTransferPackage',
  '2': [
    {
      '1': 'owner_identity_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'ownerIdentityPublicKey'
    },
    {
      '1': 'transfer_package',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.TransferPackage',
      '10': 'transferPackage'
    },
    {
      '1': 'receiver_identity_public_keys',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.spark.SenderTransferPackage.ReceiverIdentityPublicKeysEntry',
      '10': 'receiverIdentityPublicKeys'
    },
  ],
  '3': [SenderTransferPackage_ReceiverIdentityPublicKeysEntry$json],
};

@$core.Deprecated('Use senderTransferPackageDescriptor instead')
const SenderTransferPackage_ReceiverIdentityPublicKeysEntry$json = {
  '1': 'ReceiverIdentityPublicKeysEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `SenderTransferPackage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List senderTransferPackageDescriptor = $convert.base64Decode(
    'ChVTZW5kZXJUcmFuc2ZlclBhY2thZ2USOQoZb3duZXJfaWRlbnRpdHlfcHVibGljX2tleRgBIA'
    'EoDFIWb3duZXJJZGVudGl0eVB1YmxpY0tleRJBChB0cmFuc2Zlcl9wYWNrYWdlGAIgASgLMhYu'
    'c3BhcmsuVHJhbnNmZXJQYWNrYWdlUg90cmFuc2ZlclBhY2thZ2USfwodcmVjZWl2ZXJfaWRlbn'
    'RpdHlfcHVibGljX2tleXMYAyADKAsyPC5zcGFyay5TZW5kZXJUcmFuc2ZlclBhY2thZ2UuUmVj'
    'ZWl2ZXJJZGVudGl0eVB1YmxpY0tleXNFbnRyeVIacmVjZWl2ZXJJZGVudGl0eVB1YmxpY0tleX'
    'MaTQofUmVjZWl2ZXJJZGVudGl0eVB1YmxpY0tleXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIU'
    'CgV2YWx1ZRgCIAEoDFIFdmFsdWU6AjgB');

@$core.Deprecated('Use startTransferV3RequestDescriptor instead')
const StartTransferV3Request$json = {
  '1': 'StartTransferV3Request',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {
      '1': 'sender_packages',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark.SenderTransferPackage',
      '10': 'senderPackages'
    },
    {
      '1': 'expiry_time',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'expiryTime'
    },
  ],
};

/// Descriptor for `StartTransferV3Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startTransferV3RequestDescriptor = $convert.base64Decode(
    'ChZTdGFydFRyYW5zZmVyVjNSZXF1ZXN0Eh8KC3RyYW5zZmVyX2lkGAEgASgJUgp0cmFuc2Zlck'
    'lkEkUKD3NlbmRlcl9wYWNrYWdlcxgCIAMoCzIcLnNwYXJrLlNlbmRlclRyYW5zZmVyUGFja2Fn'
    'ZVIOc2VuZGVyUGFja2FnZXMSOwoLZXhwaXJ5X3RpbWUYAyABKAsyGi5nb29nbGUucHJvdG9idW'
    'YuVGltZXN0YW1wUgpleHBpcnlUaW1l');

@$core.Deprecated('Use transferPackageDescriptor instead')
const TransferPackage$json = {
  '1': 'TransferPackage',
  '2': [
    {
      '1': 'leaves_to_send',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'leavesToSend'
    },
    {
      '1': 'key_tweak_package',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark.TransferPackage.KeyTweakPackageEntry',
      '10': 'keyTweakPackage'
    },
    {'1': 'user_signature', '3': 3, '4': 1, '5': 12, '10': 'userSignature'},
    {
      '1': 'direct_leaves_to_send',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'directLeavesToSend'
    },
    {
      '1': 'direct_from_cpfp_leaves_to_send',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'directFromCpfpLeavesToSend'
    },
    {
      '1': 'hash_variant',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.spark.HashVariant',
      '10': 'hashVariant'
    },
  ],
  '3': [TransferPackage_KeyTweakPackageEntry$json],
};

@$core.Deprecated('Use transferPackageDescriptor instead')
const TransferPackage_KeyTweakPackageEntry$json = {
  '1': 'KeyTweakPackageEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `TransferPackage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transferPackageDescriptor = $convert.base64Decode(
    'Cg9UcmFuc2ZlclBhY2thZ2USQwoObGVhdmVzX3RvX3NlbmQYASADKAsyHS5zcGFyay5Vc2VyU2'
    'lnbmVkVHhTaWduaW5nSm9iUgxsZWF2ZXNUb1NlbmQSVwoRa2V5X3R3ZWFrX3BhY2thZ2UYAiAD'
    'KAsyKy5zcGFyay5UcmFuc2ZlclBhY2thZ2UuS2V5VHdlYWtQYWNrYWdlRW50cnlSD2tleVR3ZW'
    'FrUGFja2FnZRIlCg51c2VyX3NpZ25hdHVyZRgDIAEoDFINdXNlclNpZ25hdHVyZRJQChVkaXJl'
    'Y3RfbGVhdmVzX3RvX3NlbmQYBCADKAsyHS5zcGFyay5Vc2VyU2lnbmVkVHhTaWduaW5nSm9iUh'
    'JkaXJlY3RMZWF2ZXNUb1NlbmQSYgofZGlyZWN0X2Zyb21fY3BmcF9sZWF2ZXNfdG9fc2VuZBgF'
    'IAMoCzIdLnNwYXJrLlVzZXJTaWduZWRUeFNpZ25pbmdKb2JSGmRpcmVjdEZyb21DcGZwTGVhdm'
    'VzVG9TZW5kEjUKDGhhc2hfdmFyaWFudBgGIAEoDjISLnNwYXJrLkhhc2hWYXJpYW50UgtoYXNo'
    'VmFyaWFudBpCChRLZXlUd2Vha1BhY2thZ2VFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YW'
    'x1ZRgCIAEoDFIFdmFsdWU6AjgB');

@$core.Deprecated('Use sendLeafKeyTweaksDescriptor instead')
const SendLeafKeyTweaks$json = {
  '1': 'SendLeafKeyTweaks',
  '2': [
    {
      '1': 'leaves_to_send',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.SendLeafKeyTweak',
      '10': 'leavesToSend'
    },
  ],
};

/// Descriptor for `SendLeafKeyTweaks`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendLeafKeyTweaksDescriptor = $convert.base64Decode(
    'ChFTZW5kTGVhZktleVR3ZWFrcxI9Cg5sZWF2ZXNfdG9fc2VuZBgBIAMoCzIXLnNwYXJrLlNlbm'
    'RMZWFmS2V5VHdlYWtSDGxlYXZlc1RvU2VuZA==');

@$core.Deprecated('Use sendLeafKeyTweakDescriptor instead')
const SendLeafKeyTweak$json = {
  '1': 'SendLeafKeyTweak',
  '2': [
    {'1': 'leaf_id', '3': 1, '4': 1, '5': 9, '10': 'leafId'},
    {
      '1': 'secret_share_tweak',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.SecretShare',
      '10': 'secretShareTweak'
    },
    {
      '1': 'pubkey_shares_tweak',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.spark.SendLeafKeyTweak.PubkeySharesTweakEntry',
      '10': 'pubkeySharesTweak'
    },
    {'1': 'secret_cipher', '3': 4, '4': 1, '5': 12, '10': 'secretCipher'},
    {'1': 'signature', '3': 5, '4': 1, '5': 12, '10': 'signature'},
    {'1': 'refund_signature', '3': 6, '4': 1, '5': 12, '10': 'refundSignature'},
    {
      '1': 'direct_refund_signature',
      '3': 7,
      '4': 1,
      '5': 12,
      '10': 'directRefundSignature'
    },
    {
      '1': 'direct_from_cpfp_refund_signature',
      '3': 8,
      '4': 1,
      '5': 12,
      '10': 'directFromCpfpRefundSignature'
    },
  ],
  '3': [SendLeafKeyTweak_PubkeySharesTweakEntry$json],
};

@$core.Deprecated('Use sendLeafKeyTweakDescriptor instead')
const SendLeafKeyTweak_PubkeySharesTweakEntry$json = {
  '1': 'PubkeySharesTweakEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `SendLeafKeyTweak`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendLeafKeyTweakDescriptor = $convert.base64Decode(
    'ChBTZW5kTGVhZktleVR3ZWFrEhcKB2xlYWZfaWQYASABKAlSBmxlYWZJZBJAChJzZWNyZXRfc2'
    'hhcmVfdHdlYWsYAiABKAsyEi5zcGFyay5TZWNyZXRTaGFyZVIQc2VjcmV0U2hhcmVUd2VhaxJe'
    'ChNwdWJrZXlfc2hhcmVzX3R3ZWFrGAMgAygLMi4uc3BhcmsuU2VuZExlYWZLZXlUd2Vhay5QdW'
    'JrZXlTaGFyZXNUd2Vha0VudHJ5UhFwdWJrZXlTaGFyZXNUd2VhaxIjCg1zZWNyZXRfY2lwaGVy'
    'GAQgASgMUgxzZWNyZXRDaXBoZXISHAoJc2lnbmF0dXJlGAUgASgMUglzaWduYXR1cmUSKQoQcm'
    'VmdW5kX3NpZ25hdHVyZRgGIAEoDFIPcmVmdW5kU2lnbmF0dXJlEjYKF2RpcmVjdF9yZWZ1bmRf'
    'c2lnbmF0dXJlGAcgASgMUhVkaXJlY3RSZWZ1bmRTaWduYXR1cmUSSAohZGlyZWN0X2Zyb21fY3'
    'BmcF9yZWZ1bmRfc2lnbmF0dXJlGAggASgMUh1kaXJlY3RGcm9tQ3BmcFJlZnVuZFNpZ25hdHVy'
    'ZRpEChZQdWJrZXlTaGFyZXNUd2Vha0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGA'
    'IgASgMUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use finalizeTransferRequestDescriptor instead')
const FinalizeTransferRequest$json = {
  '1': 'FinalizeTransferRequest',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {
      '1': 'owner_identity_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'ownerIdentityPublicKey'
    },
    {
      '1': 'leaves_to_send',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.spark.SendLeafKeyTweak',
      '10': 'leavesToSend'
    },
    {
      '1': 'spark_payment_intent',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'sparkPaymentIntent'
    },
  ],
};

/// Descriptor for `FinalizeTransferRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List finalizeTransferRequestDescriptor = $convert.base64Decode(
    'ChdGaW5hbGl6ZVRyYW5zZmVyUmVxdWVzdBIfCgt0cmFuc2Zlcl9pZBgBIAEoCVIKdHJhbnNmZX'
    'JJZBI5Chlvd25lcl9pZGVudGl0eV9wdWJsaWNfa2V5GAIgASgMUhZvd25lcklkZW50aXR5UHVi'
    'bGljS2V5Ej0KDmxlYXZlc190b19zZW5kGAMgAygLMhcuc3BhcmsuU2VuZExlYWZLZXlUd2Vha1'
    'IMbGVhdmVzVG9TZW5kEjAKFHNwYXJrX3BheW1lbnRfaW50ZW50GAQgASgJUhJzcGFya1BheW1l'
    'bnRJbnRlbnQ=');

@$core.Deprecated(
    'Use finalizeTransferWithTransferPackageRequestDescriptor instead')
const FinalizeTransferWithTransferPackageRequest$json = {
  '1': 'FinalizeTransferWithTransferPackageRequest',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {
      '1': 'owner_identity_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'ownerIdentityPublicKey'
    },
    {
      '1': 'transfer_package',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.TransferPackage',
      '10': 'transferPackage'
    },
  ],
};

/// Descriptor for `FinalizeTransferWithTransferPackageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List
    finalizeTransferWithTransferPackageRequestDescriptor =
    $convert.base64Decode(
        'CipGaW5hbGl6ZVRyYW5zZmVyV2l0aFRyYW5zZmVyUGFja2FnZVJlcXVlc3QSHwoLdHJhbnNmZX'
        'JfaWQYASABKAlSCnRyYW5zZmVySWQSOQoZb3duZXJfaWRlbnRpdHlfcHVibGljX2tleRgCIAEo'
        'DFIWb3duZXJJZGVudGl0eVB1YmxpY0tleRJBChB0cmFuc2Zlcl9wYWNrYWdlGAMgASgLMhYuc3'
        'BhcmsuVHJhbnNmZXJQYWNrYWdlUg90cmFuc2ZlclBhY2thZ2U=');

@$core.Deprecated('Use finalizeTransferResponseDescriptor instead')
const FinalizeTransferResponse$json = {
  '1': 'FinalizeTransferResponse',
  '2': [
    {
      '1': 'transfer',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.Transfer',
      '10': 'transfer'
    },
  ],
};

/// Descriptor for `FinalizeTransferResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List finalizeTransferResponseDescriptor =
    $convert.base64Decode(
        'ChhGaW5hbGl6ZVRyYW5zZmVyUmVzcG9uc2USKwoIdHJhbnNmZXIYASABKAsyDy5zcGFyay5Ucm'
        'Fuc2ZlclIIdHJhbnNmZXI=');

@$core.Deprecated('Use transferReceiverDescriptor instead')
const TransferReceiver$json = {
  '1': 'TransferReceiver',
  '2': [
    {
      '1': 'identity_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'identityPublicKey'
    },
    {'1': 'amount_sats', '3': 2, '4': 1, '5': 4, '10': 'amountSats'},
  ],
};

/// Descriptor for `TransferReceiver`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transferReceiverDescriptor = $convert.base64Decode(
    'ChBUcmFuc2ZlclJlY2VpdmVyEi4KE2lkZW50aXR5X3B1YmxpY19rZXkYASABKAxSEWlkZW50aX'
    'R5UHVibGljS2V5Eh8KC2Ftb3VudF9zYXRzGAIgASgEUgphbW91bnRTYXRz');

@$core.Deprecated('Use transferDescriptor instead')
const Transfer$json = {
  '1': 'Transfer',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {
      '1': 'sender_identity_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'senderIdentityPublicKey'
    },
    {
      '1': 'receiver_identity_public_key',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'receiverIdentityPublicKey'
    },
    {
      '1': 'status',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.spark.TransferStatus',
      '10': 'status'
    },
    {'1': 'total_value', '3': 5, '4': 1, '5': 4, '10': 'totalValue'},
    {
      '1': 'expiry_time',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'expiryTime'
    },
    {
      '1': 'leaves',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.spark.TransferLeaf',
      '10': 'leaves'
    },
    {
      '1': 'created_time',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdTime'
    },
    {
      '1': 'updated_time',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedTime'
    },
    {
      '1': 'type',
      '3': 10,
      '4': 1,
      '5': 14,
      '6': '.spark.TransferType',
      '10': 'type'
    },
    {'1': 'spark_invoice', '3': 11, '4': 1, '5': 9, '10': 'sparkInvoice'},
    {
      '1': 'network',
      '3': 12,
      '4': 1,
      '5': 14,
      '6': '.spark.Network',
      '10': 'network'
    },
    {
      '1': 'receivers',
      '3': 13,
      '4': 3,
      '5': 11,
      '6': '.spark.TransferReceiver',
      '10': 'receivers'
    },
  ],
};

/// Descriptor for `Transfer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transferDescriptor = $convert.base64Decode(
    'CghUcmFuc2ZlchIOCgJpZBgBIAEoCVICaWQSOwoac2VuZGVyX2lkZW50aXR5X3B1YmxpY19rZX'
    'kYAiABKAxSF3NlbmRlcklkZW50aXR5UHVibGljS2V5Ej8KHHJlY2VpdmVyX2lkZW50aXR5X3B1'
    'YmxpY19rZXkYAyABKAxSGXJlY2VpdmVySWRlbnRpdHlQdWJsaWNLZXkSLQoGc3RhdHVzGAQgAS'
    'gOMhUuc3BhcmsuVHJhbnNmZXJTdGF0dXNSBnN0YXR1cxIfCgt0b3RhbF92YWx1ZRgFIAEoBFIK'
    'dG90YWxWYWx1ZRI7CgtleHBpcnlfdGltZRgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3'
    'RhbXBSCmV4cGlyeVRpbWUSKwoGbGVhdmVzGAcgAygLMhMuc3BhcmsuVHJhbnNmZXJMZWFmUgZs'
    'ZWF2ZXMSPQoMY3JlYXRlZF90aW1lGAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcF'
    'ILY3JlYXRlZFRpbWUSPQoMdXBkYXRlZF90aW1lGAkgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRp'
    'bWVzdGFtcFILdXBkYXRlZFRpbWUSJwoEdHlwZRgKIAEoDjITLnNwYXJrLlRyYW5zZmVyVHlwZV'
    'IEdHlwZRIjCg1zcGFya19pbnZvaWNlGAsgASgJUgxzcGFya0ludm9pY2USKAoHbmV0d29yaxgM'
    'IAEoDjIOLnNwYXJrLk5ldHdvcmtSB25ldHdvcmsSNQoJcmVjZWl2ZXJzGA0gAygLMhcuc3Bhcm'
    'suVHJhbnNmZXJSZWNlaXZlclIJcmVjZWl2ZXJz');

@$core.Deprecated('Use transferLeafDescriptor instead')
const TransferLeaf$json = {
  '1': 'TransferLeaf',
  '2': [
    {
      '1': 'leaf',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.TreeNode',
      '10': 'leaf'
    },
    {'1': 'secret_cipher', '3': 2, '4': 1, '5': 12, '10': 'secretCipher'},
    {'1': 'signature', '3': 3, '4': 1, '5': 12, '10': 'signature'},
    {
      '1': 'intermediate_refund_tx',
      '3': 4,
      '4': 1,
      '5': 12,
      '10': 'intermediateRefundTx'
    },
    {
      '1': 'intermediate_direct_refund_tx',
      '3': 5,
      '4': 1,
      '5': 12,
      '10': 'intermediateDirectRefundTx'
    },
    {
      '1': 'intermediate_direct_from_cpfp_refund_tx',
      '3': 6,
      '4': 1,
      '5': 12,
      '10': 'intermediateDirectFromCpfpRefundTx'
    },
    {
      '1': 'pending_key_tweak_public_key',
      '3': 7,
      '4': 1,
      '5': 12,
      '10': 'pendingKeyTweakPublicKey'
    },
  ],
};

/// Descriptor for `TransferLeaf`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transferLeafDescriptor = $convert.base64Decode(
    'CgxUcmFuc2ZlckxlYWYSIwoEbGVhZhgBIAEoCzIPLnNwYXJrLlRyZWVOb2RlUgRsZWFmEiMKDX'
    'NlY3JldF9jaXBoZXIYAiABKAxSDHNlY3JldENpcGhlchIcCglzaWduYXR1cmUYAyABKAxSCXNp'
    'Z25hdHVyZRI0ChZpbnRlcm1lZGlhdGVfcmVmdW5kX3R4GAQgASgMUhRpbnRlcm1lZGlhdGVSZW'
    'Z1bmRUeBJBCh1pbnRlcm1lZGlhdGVfZGlyZWN0X3JlZnVuZF90eBgFIAEoDFIaaW50ZXJtZWRp'
    'YXRlRGlyZWN0UmVmdW5kVHgSUwonaW50ZXJtZWRpYXRlX2RpcmVjdF9mcm9tX2NwZnBfcmVmdW'
    '5kX3R4GAYgASgMUiJpbnRlcm1lZGlhdGVEaXJlY3RGcm9tQ3BmcFJlZnVuZFR4Ej4KHHBlbmRp'
    'bmdfa2V5X3R3ZWFrX3B1YmxpY19rZXkYByABKAxSGHBlbmRpbmdLZXlUd2Vha1B1YmxpY0tleQ'
    '==');

@$core.Deprecated('Use transferFilterDescriptor instead')
const TransferFilter$json = {
  '1': 'TransferFilter',
  '2': [
    {
      '1': 'receiver_identity_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'receiverIdentityPublicKey'
    },
    {
      '1': 'sender_identity_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'senderIdentityPublicKey'
    },
    {
      '1': 'sender_or_receiver_identity_public_key',
      '3': 60,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'senderOrReceiverIdentityPublicKey'
    },
    {'1': 'transfer_ids', '3': 3, '4': 3, '5': 9, '10': 'transferIds'},
    {'1': 'limit', '3': 40, '4': 1, '5': 3, '10': 'limit'},
    {'1': 'offset', '3': 50, '4': 1, '5': 3, '10': 'offset'},
    {
      '1': 'types',
      '3': 70,
      '4': 3,
      '5': 14,
      '6': '.spark.TransferType',
      '10': 'types'
    },
    {
      '1': 'network',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.spark.Network',
      '10': 'network'
    },
    {
      '1': 'statuses',
      '3': 80,
      '4': 3,
      '5': 14,
      '6': '.spark.TransferStatus',
      '10': 'statuses'
    },
    {'1': 'order', '3': 5, '4': 1, '5': 14, '6': '.spark.Order', '10': 'order'},
    {
      '1': 'created_after',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 1,
      '10': 'createdAfter'
    },
    {
      '1': 'created_before',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 1,
      '10': 'createdBefore'
    },
  ],
  '8': [
    {'1': 'participant'},
    {'1': 'time_filter'},
  ],
};

/// Descriptor for `TransferFilter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transferFilterDescriptor = $convert.base64Decode(
    'Cg5UcmFuc2ZlckZpbHRlchJBChxyZWNlaXZlcl9pZGVudGl0eV9wdWJsaWNfa2V5GAEgASgMSA'
    'BSGXJlY2VpdmVySWRlbnRpdHlQdWJsaWNLZXkSPQoac2VuZGVyX2lkZW50aXR5X3B1YmxpY19r'
    'ZXkYAiABKAxIAFIXc2VuZGVySWRlbnRpdHlQdWJsaWNLZXkSUwomc2VuZGVyX29yX3JlY2Vpdm'
    'VyX2lkZW50aXR5X3B1YmxpY19rZXkYPCABKAxIAFIhc2VuZGVyT3JSZWNlaXZlcklkZW50aXR5'
    'UHVibGljS2V5EiEKDHRyYW5zZmVyX2lkcxgDIAMoCVILdHJhbnNmZXJJZHMSFAoFbGltaXQYKC'
    'ABKANSBWxpbWl0EhYKBm9mZnNldBgyIAEoA1IGb2Zmc2V0EikKBXR5cGVzGEYgAygOMhMuc3Bh'
    'cmsuVHJhbnNmZXJUeXBlUgV0eXBlcxIoCgduZXR3b3JrGAQgASgOMg4uc3BhcmsuTmV0d29ya1'
    'IHbmV0d29yaxIxCghzdGF0dXNlcxhQIAMoDjIVLnNwYXJrLlRyYW5zZmVyU3RhdHVzUghzdGF0'
    'dXNlcxIiCgVvcmRlchgFIAEoDjIMLnNwYXJrLk9yZGVyUgVvcmRlchJBCg1jcmVhdGVkX2FmdG'
    'VyGAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgBUgxjcmVhdGVkQWZ0ZXISQwoO'
    'Y3JlYXRlZF9iZWZvcmUYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSAFSDWNyZW'
    'F0ZWRCZWZvcmVCDQoLcGFydGljaXBhbnRCDQoLdGltZV9maWx0ZXI=');

@$core.Deprecated('Use queryTransfersResponseDescriptor instead')
const QueryTransfersResponse$json = {
  '1': 'QueryTransfersResponse',
  '2': [
    {
      '1': 'transfers',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.Transfer',
      '10': 'transfers'
    },
    {'1': 'offset', '3': 2, '4': 1, '5': 3, '10': 'offset'},
  ],
};

/// Descriptor for `QueryTransfersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTransfersResponseDescriptor =
    $convert.base64Decode(
        'ChZRdWVyeVRyYW5zZmVyc1Jlc3BvbnNlEi0KCXRyYW5zZmVycxgBIAMoCzIPLnNwYXJrLlRyYW'
        '5zZmVyUgl0cmFuc2ZlcnMSFgoGb2Zmc2V0GAIgASgDUgZvZmZzZXQ=');

@$core.Deprecated('Use claimLeafKeyTweakDescriptor instead')
const ClaimLeafKeyTweak$json = {
  '1': 'ClaimLeafKeyTweak',
  '2': [
    {'1': 'leaf_id', '3': 1, '4': 1, '5': 9, '10': 'leafId'},
    {
      '1': 'secret_share_tweak',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.SecretShare',
      '10': 'secretShareTweak'
    },
    {
      '1': 'pubkey_shares_tweak',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.spark.ClaimLeafKeyTweak.PubkeySharesTweakEntry',
      '10': 'pubkeySharesTweak'
    },
  ],
  '3': [ClaimLeafKeyTweak_PubkeySharesTweakEntry$json],
};

@$core.Deprecated('Use claimLeafKeyTweakDescriptor instead')
const ClaimLeafKeyTweak_PubkeySharesTweakEntry$json = {
  '1': 'PubkeySharesTweakEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ClaimLeafKeyTweak`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List claimLeafKeyTweakDescriptor = $convert.base64Decode(
    'ChFDbGFpbUxlYWZLZXlUd2VhaxIXCgdsZWFmX2lkGAEgASgJUgZsZWFmSWQSQAoSc2VjcmV0X3'
    'NoYXJlX3R3ZWFrGAIgASgLMhIuc3BhcmsuU2VjcmV0U2hhcmVSEHNlY3JldFNoYXJlVHdlYWsS'
    'XwoTcHVia2V5X3NoYXJlc190d2VhaxgDIAMoCzIvLnNwYXJrLkNsYWltTGVhZktleVR3ZWFrLl'
    'B1YmtleVNoYXJlc1R3ZWFrRW50cnlSEXB1YmtleVNoYXJlc1R3ZWFrGkQKFlB1YmtleVNoYXJl'
    'c1R3ZWFrRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAxSBXZhbHVlOgI4AQ'
    '==');

@$core.Deprecated('Use claimLeafKeyTweaksDescriptor instead')
const ClaimLeafKeyTweaks$json = {
  '1': 'ClaimLeafKeyTweaks',
  '2': [
    {
      '1': 'leaves_to_receive',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.ClaimLeafKeyTweak',
      '10': 'leavesToReceive'
    },
  ],
};

/// Descriptor for `ClaimLeafKeyTweaks`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List claimLeafKeyTweaksDescriptor = $convert.base64Decode(
    'ChJDbGFpbUxlYWZLZXlUd2Vha3MSRAoRbGVhdmVzX3RvX3JlY2VpdmUYASADKAsyGC5zcGFyay'
    '5DbGFpbUxlYWZLZXlUd2Vha1IPbGVhdmVzVG9SZWNlaXZl');

@$core.Deprecated('Use claimPackageDescriptor instead')
const ClaimPackage$json = {
  '1': 'ClaimPackage',
  '2': [
    {
      '1': 'leaves_to_claim',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'leavesToClaim'
    },
    {
      '1': 'key_tweak_package',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark.ClaimPackage.KeyTweakPackageEntry',
      '10': 'keyTweakPackage'
    },
    {'1': 'user_signature', '3': 3, '4': 1, '5': 12, '10': 'userSignature'},
    {
      '1': 'direct_leaves_to_claim',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'directLeavesToClaim'
    },
    {
      '1': 'direct_from_cpfp_leaves_to_claim',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.spark.UserSignedTxSigningJob',
      '10': 'directFromCpfpLeavesToClaim'
    },
    {
      '1': 'hash_variant',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.spark.HashVariant',
      '10': 'hashVariant'
    },
  ],
  '3': [ClaimPackage_KeyTweakPackageEntry$json],
};

@$core.Deprecated('Use claimPackageDescriptor instead')
const ClaimPackage_KeyTweakPackageEntry$json = {
  '1': 'KeyTweakPackageEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ClaimPackage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List claimPackageDescriptor = $convert.base64Decode(
    'CgxDbGFpbVBhY2thZ2USRQoPbGVhdmVzX3RvX2NsYWltGAEgAygLMh0uc3BhcmsuVXNlclNpZ2'
    '5lZFR4U2lnbmluZ0pvYlINbGVhdmVzVG9DbGFpbRJUChFrZXlfdHdlYWtfcGFja2FnZRgCIAMo'
    'CzIoLnNwYXJrLkNsYWltUGFja2FnZS5LZXlUd2Vha1BhY2thZ2VFbnRyeVIPa2V5VHdlYWtQYW'
    'NrYWdlEiUKDnVzZXJfc2lnbmF0dXJlGAMgASgMUg11c2VyU2lnbmF0dXJlElIKFmRpcmVjdF9s'
    'ZWF2ZXNfdG9fY2xhaW0YBCADKAsyHS5zcGFyay5Vc2VyU2lnbmVkVHhTaWduaW5nSm9iUhNkaX'
    'JlY3RMZWF2ZXNUb0NsYWltEmQKIGRpcmVjdF9mcm9tX2NwZnBfbGVhdmVzX3RvX2NsYWltGAUg'
    'AygLMh0uc3BhcmsuVXNlclNpZ25lZFR4U2lnbmluZ0pvYlIbZGlyZWN0RnJvbUNwZnBMZWF2ZX'
    'NUb0NsYWltEjUKDGhhc2hfdmFyaWFudBgGIAEoDjISLnNwYXJrLkhhc2hWYXJpYW50UgtoYXNo'
    'VmFyaWFudBpCChRLZXlUd2Vha1BhY2thZ2VFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YW'
    'x1ZRgCIAEoDFIFdmFsdWU6AjgB');

@$core.Deprecated('Use claimTransferRequestDescriptor instead')
const ClaimTransferRequest$json = {
  '1': 'ClaimTransferRequest',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {
      '1': 'owner_identity_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'ownerIdentityPublicKey'
    },
    {
      '1': 'claim_package',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.ClaimPackage',
      '10': 'claimPackage'
    },
  ],
};

/// Descriptor for `ClaimTransferRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List claimTransferRequestDescriptor = $convert.base64Decode(
    'ChRDbGFpbVRyYW5zZmVyUmVxdWVzdBIfCgt0cmFuc2Zlcl9pZBgBIAEoCVIKdHJhbnNmZXJJZB'
    'I5Chlvd25lcl9pZGVudGl0eV9wdWJsaWNfa2V5GAIgASgMUhZvd25lcklkZW50aXR5UHVibGlj'
    'S2V5EjgKDWNsYWltX3BhY2thZ2UYAyABKAsyEy5zcGFyay5DbGFpbVBhY2thZ2VSDGNsYWltUG'
    'Fja2FnZQ==');

@$core.Deprecated('Use claimTransferResponseDescriptor instead')
const ClaimTransferResponse$json = {
  '1': 'ClaimTransferResponse',
  '2': [
    {
      '1': 'transfer',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.Transfer',
      '10': 'transfer'
    },
  ],
};

/// Descriptor for `ClaimTransferResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List claimTransferResponseDescriptor = $convert.base64Decode(
    'ChVDbGFpbVRyYW5zZmVyUmVzcG9uc2USKwoIdHJhbnNmZXIYASABKAsyDy5zcGFyay5UcmFuc2'
    'ZlclIIdHJhbnNmZXI=');

@$core.Deprecated('Use claimTransferTweakKeysRequestDescriptor instead')
const ClaimTransferTweakKeysRequest$json = {
  '1': 'ClaimTransferTweakKeysRequest',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {
      '1': 'owner_identity_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'ownerIdentityPublicKey'
    },
    {
      '1': 'leaves_to_receive',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.spark.ClaimLeafKeyTweak',
      '10': 'leavesToReceive'
    },
  ],
};

/// Descriptor for `ClaimTransferTweakKeysRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List claimTransferTweakKeysRequestDescriptor = $convert.base64Decode(
    'Ch1DbGFpbVRyYW5zZmVyVHdlYWtLZXlzUmVxdWVzdBIfCgt0cmFuc2Zlcl9pZBgBIAEoCVIKdH'
    'JhbnNmZXJJZBI5Chlvd25lcl9pZGVudGl0eV9wdWJsaWNfa2V5GAIgASgMUhZvd25lcklkZW50'
    'aXR5UHVibGljS2V5EkQKEWxlYXZlc190b19yZWNlaXZlGAMgAygLMhguc3BhcmsuQ2xhaW1MZW'
    'FmS2V5VHdlYWtSD2xlYXZlc1RvUmVjZWl2ZQ==');

@$core.Deprecated('Use claimTransferSignRefundsRequestDescriptor instead')
const ClaimTransferSignRefundsRequest$json = {
  '1': 'ClaimTransferSignRefundsRequest',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {
      '1': 'owner_identity_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'ownerIdentityPublicKey'
    },
    {
      '1': 'signing_jobs',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.spark.LeafRefundTxSigningJob',
      '10': 'signingJobs'
    },
  ],
  '9': [
    {'1': 4, '2': 5},
  ],
};

/// Descriptor for `ClaimTransferSignRefundsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List claimTransferSignRefundsRequestDescriptor =
    $convert.base64Decode(
        'Ch9DbGFpbVRyYW5zZmVyU2lnblJlZnVuZHNSZXF1ZXN0Eh8KC3RyYW5zZmVyX2lkGAEgASgJUg'
        'p0cmFuc2ZlcklkEjkKGW93bmVyX2lkZW50aXR5X3B1YmxpY19rZXkYAiABKAxSFm93bmVySWRl'
        'bnRpdHlQdWJsaWNLZXkSQAoMc2lnbmluZ19qb2JzGAMgAygLMh0uc3BhcmsuTGVhZlJlZnVuZF'
        'R4U2lnbmluZ0pvYlILc2lnbmluZ0pvYnNKBAgEEAU=');

@$core.Deprecated('Use claimTransferSignRefundsResponseDescriptor instead')
const ClaimTransferSignRefundsResponse$json = {
  '1': 'ClaimTransferSignRefundsResponse',
  '2': [
    {
      '1': 'signing_results',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.LeafRefundTxSigningResult',
      '10': 'signingResults'
    },
  ],
};

/// Descriptor for `ClaimTransferSignRefundsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List claimTransferSignRefundsResponseDescriptor =
    $convert.base64Decode(
        'CiBDbGFpbVRyYW5zZmVyU2lnblJlZnVuZHNSZXNwb25zZRJJCg9zaWduaW5nX3Jlc3VsdHMYAS'
        'ADKAsyIC5zcGFyay5MZWFmUmVmdW5kVHhTaWduaW5nUmVzdWx0Ug5zaWduaW5nUmVzdWx0cw==');

@$core.Deprecated('Use storePreimageShareRequestDescriptor instead')
const StorePreimageShareRequest$json = {
  '1': 'StorePreimageShareRequest',
  '2': [
    {'1': 'payment_hash', '3': 1, '4': 1, '5': 12, '10': 'paymentHash'},
    {
      '1': 'preimage_share',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.SecretShare',
      '10': 'preimageShare'
    },
    {'1': 'threshold', '3': 3, '4': 1, '5': 13, '10': 'threshold'},
    {'1': 'invoice_string', '3': 4, '4': 1, '5': 9, '10': 'invoiceString'},
    {
      '1': 'user_identity_public_key',
      '3': 5,
      '4': 1,
      '5': 12,
      '10': 'userIdentityPublicKey'
    },
  ],
};

/// Descriptor for `StorePreimageShareRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storePreimageShareRequestDescriptor = $convert.base64Decode(
    'ChlTdG9yZVByZWltYWdlU2hhcmVSZXF1ZXN0EiEKDHBheW1lbnRfaGFzaBgBIAEoDFILcGF5bW'
    'VudEhhc2gSOQoOcHJlaW1hZ2Vfc2hhcmUYAiABKAsyEi5zcGFyay5TZWNyZXRTaGFyZVINcHJl'
    'aW1hZ2VTaGFyZRIcCgl0aHJlc2hvbGQYAyABKA1SCXRocmVzaG9sZBIlCg5pbnZvaWNlX3N0cm'
    'luZxgEIAEoCVINaW52b2ljZVN0cmluZxI3Chh1c2VyX2lkZW50aXR5X3B1YmxpY19rZXkYBSAB'
    'KAxSFXVzZXJJZGVudGl0eVB1YmxpY0tleQ==');

@$core.Deprecated('Use storePreimageShareV2RequestDescriptor instead')
const StorePreimageShareV2Request$json = {
  '1': 'StorePreimageShareV2Request',
  '2': [
    {'1': 'payment_hash', '3': 1, '4': 1, '5': 12, '10': 'paymentHash'},
    {
      '1': 'encrypted_preimage_shares',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark.StorePreimageShareV2Request.EncryptedPreimageSharesEntry',
      '10': 'encryptedPreimageShares'
    },
    {'1': 'threshold', '3': 3, '4': 1, '5': 13, '10': 'threshold'},
    {'1': 'invoice_string', '3': 4, '4': 1, '5': 9, '10': 'invoiceString'},
    {
      '1': 'user_identity_public_key',
      '3': 5,
      '4': 1,
      '5': 12,
      '10': 'userIdentityPublicKey'
    },
  ],
  '3': [StorePreimageShareV2Request_EncryptedPreimageSharesEntry$json],
  '9': [
    {'1': 6, '2': 7},
  ],
  '10': ['user_signature'],
};

@$core.Deprecated('Use storePreimageShareV2RequestDescriptor instead')
const StorePreimageShareV2Request_EncryptedPreimageSharesEntry$json = {
  '1': 'EncryptedPreimageSharesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `StorePreimageShareV2Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storePreimageShareV2RequestDescriptor = $convert.base64Decode(
    'ChtTdG9yZVByZWltYWdlU2hhcmVWMlJlcXVlc3QSIQoMcGF5bWVudF9oYXNoGAEgASgMUgtwYX'
    'ltZW50SGFzaBJ7ChllbmNyeXB0ZWRfcHJlaW1hZ2Vfc2hhcmVzGAIgAygLMj8uc3BhcmsuU3Rv'
    'cmVQcmVpbWFnZVNoYXJlVjJSZXF1ZXN0LkVuY3J5cHRlZFByZWltYWdlU2hhcmVzRW50cnlSF2'
    'VuY3J5cHRlZFByZWltYWdlU2hhcmVzEhwKCXRocmVzaG9sZBgDIAEoDVIJdGhyZXNob2xkEiUK'
    'Dmludm9pY2Vfc3RyaW5nGAQgASgJUg1pbnZvaWNlU3RyaW5nEjcKGHVzZXJfaWRlbnRpdHlfcH'
    'VibGljX2tleRgFIAEoDFIVdXNlcklkZW50aXR5UHVibGljS2V5GkoKHEVuY3J5cHRlZFByZWlt'
    'YWdlU2hhcmVzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAxSBXZhbHVlOg'
    'I4AUoECAYQB1IOdXNlcl9zaWduYXR1cmU=');

@$core.Deprecated('Use requestedSigningCommitmentsDescriptor instead')
const RequestedSigningCommitments$json = {
  '1': 'RequestedSigningCommitments',
  '2': [
    {
      '1': 'signing_nonce_commitments',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.RequestedSigningCommitments.SigningNonceCommitmentsEntry',
      '10': 'signingNonceCommitments'
    },
  ],
  '3': [RequestedSigningCommitments_SigningNonceCommitmentsEntry$json],
};

@$core.Deprecated('Use requestedSigningCommitmentsDescriptor instead')
const RequestedSigningCommitments_SigningNonceCommitmentsEntry$json = {
  '1': 'SigningNonceCommitmentsEntry',
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

/// Descriptor for `RequestedSigningCommitments`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestedSigningCommitmentsDescriptor = $convert.base64Decode(
    'ChtSZXF1ZXN0ZWRTaWduaW5nQ29tbWl0bWVudHMSewoZc2lnbmluZ19ub25jZV9jb21taXRtZW'
    '50cxgBIAMoCzI/LnNwYXJrLlJlcXVlc3RlZFNpZ25pbmdDb21taXRtZW50cy5TaWduaW5nTm9u'
    'Y2VDb21taXRtZW50c0VudHJ5UhdzaWduaW5nTm9uY2VDb21taXRtZW50cxplChxTaWduaW5nTm'
    '9uY2VDb21taXRtZW50c0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5Ei8KBXZhbHVlGAIgASgLMhku'
    'Y29tbW9uLlNpZ25pbmdDb21taXRtZW50UgV2YWx1ZToCOAE=');

@$core.Deprecated('Use getSigningCommitmentsRequestDescriptor instead')
const GetSigningCommitmentsRequest$json = {
  '1': 'GetSigningCommitmentsRequest',
  '2': [
    {'1': 'node_ids', '3': 1, '4': 3, '5': 9, '10': 'nodeIds'},
    {'1': 'count', '3': 2, '4': 1, '5': 13, '10': 'count'},
    {'1': 'node_id_count', '3': 3, '4': 1, '5': 13, '10': 'nodeIdCount'},
  ],
};

/// Descriptor for `GetSigningCommitmentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSigningCommitmentsRequestDescriptor =
    $convert.base64Decode(
        'ChxHZXRTaWduaW5nQ29tbWl0bWVudHNSZXF1ZXN0EhkKCG5vZGVfaWRzGAEgAygJUgdub2RlSW'
        'RzEhQKBWNvdW50GAIgASgNUgVjb3VudBIiCg1ub2RlX2lkX2NvdW50GAMgASgNUgtub2RlSWRD'
        'b3VudA==');

@$core.Deprecated('Use getSigningCommitmentsResponseDescriptor instead')
const GetSigningCommitmentsResponse$json = {
  '1': 'GetSigningCommitmentsResponse',
  '2': [
    {
      '1': 'signing_commitments',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.RequestedSigningCommitments',
      '10': 'signingCommitments'
    },
  ],
};

/// Descriptor for `GetSigningCommitmentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSigningCommitmentsResponseDescriptor =
    $convert.base64Decode(
        'Ch1HZXRTaWduaW5nQ29tbWl0bWVudHNSZXNwb25zZRJTChNzaWduaW5nX2NvbW1pdG1lbnRzGA'
        'EgAygLMiIuc3BhcmsuUmVxdWVzdGVkU2lnbmluZ0NvbW1pdG1lbnRzUhJzaWduaW5nQ29tbWl0'
        'bWVudHM=');

@$core.Deprecated('Use signingCommitmentsDescriptor instead')
const SigningCommitments$json = {
  '1': 'SigningCommitments',
  '2': [
    {
      '1': 'signing_commitments',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.SigningCommitments.SigningCommitmentsEntry',
      '10': 'signingCommitments'
    },
  ],
  '3': [SigningCommitments_SigningCommitmentsEntry$json],
};

@$core.Deprecated('Use signingCommitmentsDescriptor instead')
const SigningCommitments_SigningCommitmentsEntry$json = {
  '1': 'SigningCommitmentsEntry',
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

/// Descriptor for `SigningCommitments`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingCommitmentsDescriptor = $convert.base64Decode(
    'ChJTaWduaW5nQ29tbWl0bWVudHMSYgoTc2lnbmluZ19jb21taXRtZW50cxgBIAMoCzIxLnNwYX'
    'JrLlNpZ25pbmdDb21taXRtZW50cy5TaWduaW5nQ29tbWl0bWVudHNFbnRyeVISc2lnbmluZ0Nv'
    'bW1pdG1lbnRzGmAKF1NpZ25pbmdDb21taXRtZW50c0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5Ei'
    '8KBXZhbHVlGAIgASgLMhkuY29tbW9uLlNpZ25pbmdDb21taXRtZW50UgV2YWx1ZToCOAE=');

@$core.Deprecated('Use userSignedRefundDescriptor instead')
const UserSignedRefund$json = {
  '1': 'UserSignedRefund',
  '2': [
    {'1': 'node_id', '3': 1, '4': 1, '5': 9, '10': 'nodeId'},
    {'1': 'refund_tx', '3': 2, '4': 1, '5': 12, '10': 'refundTx'},
    {'1': 'user_signature', '3': 3, '4': 1, '5': 12, '10': 'userSignature'},
    {
      '1': 'signing_commitments',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningCommitments',
      '10': 'signingCommitments'
    },
    {
      '1': 'user_signature_commitment',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.common.SigningCommitment',
      '10': 'userSignatureCommitment'
    },
    {
      '1': 'network',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.spark.Network',
      '8': {},
      '10': 'network'
    },
  ],
};

/// Descriptor for `UserSignedRefund`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userSignedRefundDescriptor = $convert.base64Decode(
    'ChBVc2VyU2lnbmVkUmVmdW5kEhcKB25vZGVfaWQYASABKAlSBm5vZGVJZBIbCglyZWZ1bmRfdH'
    'gYAiABKAxSCHJlZnVuZFR4EiUKDnVzZXJfc2lnbmF0dXJlGAMgASgMUg11c2VyU2lnbmF0dXJl'
    'EkoKE3NpZ25pbmdfY29tbWl0bWVudHMYBCABKAsyGS5zcGFyay5TaWduaW5nQ29tbWl0bWVudH'
    'NSEnNpZ25pbmdDb21taXRtZW50cxJVChl1c2VyX3NpZ25hdHVyZV9jb21taXRtZW50GAUgASgL'
    'MhkuY29tbW9uLlNpZ25pbmdDb21taXRtZW50Uhd1c2VyU2lnbmF0dXJlQ29tbWl0bWVudBIyCg'
    'duZXR3b3JrGAYgASgOMg4uc3BhcmsuTmV0d29ya0II+kIFggECIABSB25ldHdvcms=');

@$core.Deprecated('Use invoiceAmountProofDescriptor instead')
const InvoiceAmountProof$json = {
  '1': 'InvoiceAmountProof',
  '2': [
    {'1': 'bolt11_invoice', '3': 1, '4': 1, '5': 9, '10': 'bolt11Invoice'},
  ],
};

/// Descriptor for `InvoiceAmountProof`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List invoiceAmountProofDescriptor = $convert.base64Decode(
    'ChJJbnZvaWNlQW1vdW50UHJvb2YSJQoOYm9sdDExX2ludm9pY2UYASABKAlSDWJvbHQxMUludm'
    '9pY2U=');

@$core.Deprecated('Use invoiceAmountDescriptor instead')
const InvoiceAmount$json = {
  '1': 'InvoiceAmount',
  '2': [
    {'1': 'value_sats', '3': 1, '4': 1, '5': 4, '10': 'valueSats'},
    {
      '1': 'invoice_amount_proof',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.InvoiceAmountProof',
      '10': 'invoiceAmountProof'
    },
  ],
};

/// Descriptor for `InvoiceAmount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List invoiceAmountDescriptor = $convert.base64Decode(
    'Cg1JbnZvaWNlQW1vdW50Eh0KCnZhbHVlX3NhdHMYASABKARSCXZhbHVlU2F0cxJLChRpbnZvaW'
    'NlX2Ftb3VudF9wcm9vZhgCIAEoCzIZLnNwYXJrLkludm9pY2VBbW91bnRQcm9vZlISaW52b2lj'
    'ZUFtb3VudFByb29m');

@$core.Deprecated('Use initiatePreimageSwapRequestDescriptor instead')
const InitiatePreimageSwapRequest$json = {
  '1': 'InitiatePreimageSwapRequest',
  '2': [
    {'1': 'payment_hash', '3': 1, '4': 1, '5': 12, '10': 'paymentHash'},
    {
      '1': 'invoice_amount',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.InvoiceAmount',
      '10': 'invoiceAmount'
    },
    {
      '1': 'reason',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.spark.InitiatePreimageSwapRequest.Reason',
      '10': 'reason'
    },
    {
      '1': 'transfer',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark.StartUserSignedTransferRequest',
      '10': 'transfer'
    },
    {
      '1': 'receiver_identity_public_key',
      '3': 5,
      '4': 1,
      '5': 12,
      '10': 'receiverIdentityPublicKey'
    },
    {'1': 'fee_sats', '3': 6, '4': 1, '5': 4, '10': 'feeSats'},
    {
      '1': 'transfer_request',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.spark.StartTransferRequest',
      '10': 'transferRequest'
    },
  ],
  '4': [InitiatePreimageSwapRequest_Reason$json],
};

@$core.Deprecated('Use initiatePreimageSwapRequestDescriptor instead')
const InitiatePreimageSwapRequest_Reason$json = {
  '1': 'Reason',
  '2': [
    {'1': 'REASON_SEND', '2': 0},
    {'1': 'REASON_RECEIVE', '2': 1},
  ],
};

/// Descriptor for `InitiatePreimageSwapRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiatePreimageSwapRequestDescriptor = $convert.base64Decode(
    'ChtJbml0aWF0ZVByZWltYWdlU3dhcFJlcXVlc3QSIQoMcGF5bWVudF9oYXNoGAEgASgMUgtwYX'
    'ltZW50SGFzaBI7Cg5pbnZvaWNlX2Ftb3VudBgCIAEoCzIULnNwYXJrLkludm9pY2VBbW91bnRS'
    'DWludm9pY2VBbW91bnQSQQoGcmVhc29uGAMgASgOMikuc3BhcmsuSW5pdGlhdGVQcmVpbWFnZV'
    'N3YXBSZXF1ZXN0LlJlYXNvblIGcmVhc29uEkEKCHRyYW5zZmVyGAQgASgLMiUuc3BhcmsuU3Rh'
    'cnRVc2VyU2lnbmVkVHJhbnNmZXJSZXF1ZXN0Ugh0cmFuc2ZlchI/ChxyZWNlaXZlcl9pZGVudG'
    'l0eV9wdWJsaWNfa2V5GAUgASgMUhlyZWNlaXZlcklkZW50aXR5UHVibGljS2V5EhkKCGZlZV9z'
    'YXRzGAYgASgEUgdmZWVTYXRzEkYKEHRyYW5zZmVyX3JlcXVlc3QYByABKAsyGy5zcGFyay5TdG'
    'FydFRyYW5zZmVyUmVxdWVzdFIPdHJhbnNmZXJSZXF1ZXN0Ii0KBlJlYXNvbhIPCgtSRUFTT05f'
    'U0VORBAAEhIKDlJFQVNPTl9SRUNFSVZFEAE=');

@$core.Deprecated('Use initiatePreimageSwapResponseDescriptor instead')
const InitiatePreimageSwapResponse$json = {
  '1': 'InitiatePreimageSwapResponse',
  '2': [
    {'1': 'preimage', '3': 1, '4': 1, '5': 12, '10': 'preimage'},
    {
      '1': 'transfer',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.Transfer',
      '10': 'transfer'
    },
  ],
};

/// Descriptor for `InitiatePreimageSwapResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiatePreimageSwapResponseDescriptor =
    $convert.base64Decode(
        'ChxJbml0aWF0ZVByZWltYWdlU3dhcFJlc3BvbnNlEhoKCHByZWltYWdlGAEgASgMUghwcmVpbW'
        'FnZRIrCgh0cmFuc2ZlchgCIAEoCzIPLnNwYXJrLlRyYW5zZmVyUgh0cmFuc2Zlcg==');

@$core.Deprecated('Use outPointDescriptor instead')
const OutPoint$json = {
  '1': 'OutPoint',
  '2': [
    {'1': 'txid', '3': 1, '4': 1, '5': 12, '10': 'txid'},
    {'1': 'vout', '3': 2, '4': 1, '5': 13, '10': 'vout'},
  ],
};

/// Descriptor for `OutPoint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List outPointDescriptor = $convert.base64Decode(
    'CghPdXRQb2ludBISCgR0eGlkGAEgASgMUgR0eGlkEhIKBHZvdXQYAiABKA1SBHZvdXQ=');

@$core.Deprecated('Use cooperativeExitRequestDescriptor instead')
const CooperativeExitRequest$json = {
  '1': 'CooperativeExitRequest',
  '2': [
    {
      '1': 'transfer',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.StartTransferRequest',
      '10': 'transfer'
    },
    {'1': 'exit_id', '3': 2, '4': 1, '5': 9, '10': 'exitId'},
    {'1': 'exit_txid', '3': 3, '4': 1, '5': 12, '10': 'exitTxid'},
    {'1': 'connector_tx', '3': 4, '4': 1, '5': 12, '10': 'connectorTx'},
  ],
};

/// Descriptor for `CooperativeExitRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cooperativeExitRequestDescriptor = $convert.base64Decode(
    'ChZDb29wZXJhdGl2ZUV4aXRSZXF1ZXN0EjcKCHRyYW5zZmVyGAEgASgLMhsuc3BhcmsuU3Rhcn'
    'RUcmFuc2ZlclJlcXVlc3RSCHRyYW5zZmVyEhcKB2V4aXRfaWQYAiABKAlSBmV4aXRJZBIbCgll'
    'eGl0X3R4aWQYAyABKAxSCGV4aXRUeGlkEiEKDGNvbm5lY3Rvcl90eBgEIAEoDFILY29ubmVjdG'
    '9yVHg=');

@$core.Deprecated('Use cooperativeExitResponseDescriptor instead')
const CooperativeExitResponse$json = {
  '1': 'CooperativeExitResponse',
  '2': [
    {
      '1': 'transfer',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.Transfer',
      '10': 'transfer'
    },
    {
      '1': 'signing_results',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark.LeafRefundTxSigningResult',
      '10': 'signingResults'
    },
  ],
};

/// Descriptor for `CooperativeExitResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cooperativeExitResponseDescriptor = $convert.base64Decode(
    'ChdDb29wZXJhdGl2ZUV4aXRSZXNwb25zZRIrCgh0cmFuc2ZlchgBIAEoCzIPLnNwYXJrLlRyYW'
    '5zZmVyUgh0cmFuc2ZlchJJCg9zaWduaW5nX3Jlc3VsdHMYAiADKAsyIC5zcGFyay5MZWFmUmVm'
    'dW5kVHhTaWduaW5nUmVzdWx0Ug5zaWduaW5nUmVzdWx0cw==');

@$core.Deprecated('Use counterLeafSwapRequestDescriptor instead')
const CounterLeafSwapRequest$json = {
  '1': 'CounterLeafSwapRequest',
  '2': [
    {
      '1': 'transfer',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.StartTransferRequest',
      '10': 'transfer'
    },
    {'1': 'swap_id', '3': 2, '4': 1, '5': 9, '10': 'swapId'},
    {
      '1': 'adaptor_public_key',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'adaptorPublicKey'
    },
    {
      '1': 'direct_adaptor_public_key',
      '3': 4,
      '4': 1,
      '5': 12,
      '10': 'directAdaptorPublicKey'
    },
    {
      '1': 'direct_from_cpfp_adaptor_public_key',
      '3': 5,
      '4': 1,
      '5': 12,
      '10': 'directFromCpfpAdaptorPublicKey'
    },
  ],
};

/// Descriptor for `CounterLeafSwapRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List counterLeafSwapRequestDescriptor = $convert.base64Decode(
    'ChZDb3VudGVyTGVhZlN3YXBSZXF1ZXN0EjcKCHRyYW5zZmVyGAEgASgLMhsuc3BhcmsuU3Rhcn'
    'RUcmFuc2ZlclJlcXVlc3RSCHRyYW5zZmVyEhcKB3N3YXBfaWQYAiABKAlSBnN3YXBJZBIsChJh'
    'ZGFwdG9yX3B1YmxpY19rZXkYAyABKAxSEGFkYXB0b3JQdWJsaWNLZXkSOQoZZGlyZWN0X2FkYX'
    'B0b3JfcHVibGljX2tleRgEIAEoDFIWZGlyZWN0QWRhcHRvclB1YmxpY0tleRJLCiNkaXJlY3Rf'
    'ZnJvbV9jcGZwX2FkYXB0b3JfcHVibGljX2tleRgFIAEoDFIeZGlyZWN0RnJvbUNwZnBBZGFwdG'
    '9yUHVibGljS2V5');

@$core.Deprecated('Use counterLeafSwapResponseDescriptor instead')
const CounterLeafSwapResponse$json = {
  '1': 'CounterLeafSwapResponse',
  '2': [
    {
      '1': 'transfer',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.Transfer',
      '10': 'transfer'
    },
    {
      '1': 'signing_results',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark.LeafRefundTxSigningResult',
      '10': 'signingResults'
    },
  ],
};

/// Descriptor for `CounterLeafSwapResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List counterLeafSwapResponseDescriptor = $convert.base64Decode(
    'ChdDb3VudGVyTGVhZlN3YXBSZXNwb25zZRIrCgh0cmFuc2ZlchgBIAEoCzIPLnNwYXJrLlRyYW'
    '5zZmVyUgh0cmFuc2ZlchJJCg9zaWduaW5nX3Jlc3VsdHMYAiADKAsyIC5zcGFyay5MZWFmUmVm'
    'dW5kVHhTaWduaW5nUmVzdWx0Ug5zaWduaW5nUmVzdWx0cw==');

@$core.Deprecated('Use refreshTimelockRequestDescriptor instead')
const RefreshTimelockRequest$json = {
  '1': 'RefreshTimelockRequest',
  '2': [
    {'1': 'leaf_id', '3': 1, '4': 1, '5': 9, '10': 'leafId'},
    {
      '1': 'owner_identity_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'ownerIdentityPublicKey'
    },
    {
      '1': 'signing_jobs',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'signingJobs'
    },
  ],
};

/// Descriptor for `RefreshTimelockRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTimelockRequestDescriptor = $convert.base64Decode(
    'ChZSZWZyZXNoVGltZWxvY2tSZXF1ZXN0EhcKB2xlYWZfaWQYASABKAlSBmxlYWZJZBI5Chlvd2'
    '5lcl9pZGVudGl0eV9wdWJsaWNfa2V5GAIgASgMUhZvd25lcklkZW50aXR5UHVibGljS2V5EjQK'
    'DHNpZ25pbmdfam9icxgDIAMoCzIRLnNwYXJrLlNpZ25pbmdKb2JSC3NpZ25pbmdKb2Jz');

@$core.Deprecated('Use refreshTimelockSigningResultDescriptor instead')
const RefreshTimelockSigningResult$json = {
  '1': 'RefreshTimelockSigningResult',
  '2': [
    {
      '1': 'signing_result',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningResult',
      '10': 'signingResult'
    },
    {'1': 'verifying_key', '3': 2, '4': 1, '5': 12, '10': 'verifyingKey'},
  ],
};

/// Descriptor for `RefreshTimelockSigningResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTimelockSigningResultDescriptor =
    $convert.base64Decode(
        'ChxSZWZyZXNoVGltZWxvY2tTaWduaW5nUmVzdWx0EjsKDnNpZ25pbmdfcmVzdWx0GAEgASgLMh'
        'Quc3BhcmsuU2lnbmluZ1Jlc3VsdFINc2lnbmluZ1Jlc3VsdBIjCg12ZXJpZnlpbmdfa2V5GAIg'
        'ASgMUgx2ZXJpZnlpbmdLZXk=');

@$core.Deprecated('Use refreshTimelockResponseDescriptor instead')
const RefreshTimelockResponse$json = {
  '1': 'RefreshTimelockResponse',
  '2': [
    {
      '1': 'signing_results',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.RefreshTimelockSigningResult',
      '10': 'signingResults'
    },
  ],
};

/// Descriptor for `RefreshTimelockResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTimelockResponseDescriptor =
    $convert.base64Decode(
        'ChdSZWZyZXNoVGltZWxvY2tSZXNwb25zZRJMCg9zaWduaW5nX3Jlc3VsdHMYASADKAsyIy5zcG'
        'Fyay5SZWZyZXNoVGltZWxvY2tTaWduaW5nUmVzdWx0Ug5zaWduaW5nUmVzdWx0cw==');

@$core.Deprecated('Use extendLeafRequestDescriptor instead')
const ExtendLeafRequest$json = {
  '1': 'ExtendLeafRequest',
  '2': [
    {'1': 'leaf_id', '3': 1, '4': 1, '5': 9, '10': 'leafId'},
    {
      '1': 'owner_identity_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'ownerIdentityPublicKey'
    },
    {
      '1': 'node_tx_signing_job',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'nodeTxSigningJob'
    },
    {
      '1': 'refund_tx_signing_job',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'refundTxSigningJob'
    },
    {
      '1': 'direct_node_tx_signing_job',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'directNodeTxSigningJob'
    },
    {
      '1': 'direct_refund_tx_signing_job',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'directRefundTxSigningJob'
    },
    {
      '1': 'direct_from_cpfp_refund_tx_signing_job',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'directFromCpfpRefundTxSigningJob'
    },
  ],
};

/// Descriptor for `ExtendLeafRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List extendLeafRequestDescriptor = $convert.base64Decode(
    'ChFFeHRlbmRMZWFmUmVxdWVzdBIXCgdsZWFmX2lkGAEgASgJUgZsZWFmSWQSOQoZb3duZXJfaW'
    'RlbnRpdHlfcHVibGljX2tleRgCIAEoDFIWb3duZXJJZGVudGl0eVB1YmxpY0tleRJAChNub2Rl'
    'X3R4X3NpZ25pbmdfam9iGAMgASgLMhEuc3BhcmsuU2lnbmluZ0pvYlIQbm9kZVR4U2lnbmluZ0'
    'pvYhJEChVyZWZ1bmRfdHhfc2lnbmluZ19qb2IYBCABKAsyES5zcGFyay5TaWduaW5nSm9iUhJy'
    'ZWZ1bmRUeFNpZ25pbmdKb2ISTQoaZGlyZWN0X25vZGVfdHhfc2lnbmluZ19qb2IYBSABKAsyES'
    '5zcGFyay5TaWduaW5nSm9iUhZkaXJlY3ROb2RlVHhTaWduaW5nSm9iElEKHGRpcmVjdF9yZWZ1'
    'bmRfdHhfc2lnbmluZ19qb2IYBiABKAsyES5zcGFyay5TaWduaW5nSm9iUhhkaXJlY3RSZWZ1bm'
    'RUeFNpZ25pbmdKb2ISYwomZGlyZWN0X2Zyb21fY3BmcF9yZWZ1bmRfdHhfc2lnbmluZ19qb2IY'
    'ByABKAsyES5zcGFyay5TaWduaW5nSm9iUiBkaXJlY3RGcm9tQ3BmcFJlZnVuZFR4U2lnbmluZ0'
    'pvYg==');

@$core.Deprecated('Use extendLeafSigningResultDescriptor instead')
const ExtendLeafSigningResult$json = {
  '1': 'ExtendLeafSigningResult',
  '2': [
    {
      '1': 'signing_result',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningResult',
      '10': 'signingResult'
    },
    {'1': 'verifying_key', '3': 2, '4': 1, '5': 12, '10': 'verifyingKey'},
  ],
};

/// Descriptor for `ExtendLeafSigningResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List extendLeafSigningResultDescriptor = $convert.base64Decode(
    'ChdFeHRlbmRMZWFmU2lnbmluZ1Jlc3VsdBI7Cg5zaWduaW5nX3Jlc3VsdBgBIAEoCzIULnNwYX'
    'JrLlNpZ25pbmdSZXN1bHRSDXNpZ25pbmdSZXN1bHQSIwoNdmVyaWZ5aW5nX2tleRgCIAEoDFIM'
    'dmVyaWZ5aW5nS2V5');

@$core.Deprecated('Use extendLeafResponseDescriptor instead')
const ExtendLeafResponse$json = {
  '1': 'ExtendLeafResponse',
  '2': [
    {'1': 'leaf_id', '3': 1, '4': 1, '5': 9, '10': 'leafId'},
    {
      '1': 'node_tx_signing_result',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.ExtendLeafSigningResult',
      '10': 'nodeTxSigningResult'
    },
    {
      '1': 'refund_tx_signing_result',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.ExtendLeafSigningResult',
      '10': 'refundTxSigningResult'
    },
    {
      '1': 'direct_node_tx_signing_result',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark.ExtendLeafSigningResult',
      '10': 'directNodeTxSigningResult'
    },
    {
      '1': 'direct_refund_tx_signing_result',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.spark.ExtendLeafSigningResult',
      '10': 'directRefundTxSigningResult'
    },
    {
      '1': 'direct_from_cpfp_refund_tx_signing_result',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.spark.ExtendLeafSigningResult',
      '10': 'directFromCpfpRefundTxSigningResult'
    },
  ],
};

/// Descriptor for `ExtendLeafResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List extendLeafResponseDescriptor = $convert.base64Decode(
    'ChJFeHRlbmRMZWFmUmVzcG9uc2USFwoHbGVhZl9pZBgBIAEoCVIGbGVhZklkElMKFm5vZGVfdH'
    'hfc2lnbmluZ19yZXN1bHQYAiABKAsyHi5zcGFyay5FeHRlbmRMZWFmU2lnbmluZ1Jlc3VsdFIT'
    'bm9kZVR4U2lnbmluZ1Jlc3VsdBJXChhyZWZ1bmRfdHhfc2lnbmluZ19yZXN1bHQYAyABKAsyHi'
    '5zcGFyay5FeHRlbmRMZWFmU2lnbmluZ1Jlc3VsdFIVcmVmdW5kVHhTaWduaW5nUmVzdWx0EmAK'
    'HWRpcmVjdF9ub2RlX3R4X3NpZ25pbmdfcmVzdWx0GAQgASgLMh4uc3BhcmsuRXh0ZW5kTGVhZl'
    'NpZ25pbmdSZXN1bHRSGWRpcmVjdE5vZGVUeFNpZ25pbmdSZXN1bHQSZAofZGlyZWN0X3JlZnVu'
    'ZF90eF9zaWduaW5nX3Jlc3VsdBgFIAEoCzIeLnNwYXJrLkV4dGVuZExlYWZTaWduaW5nUmVzdW'
    'x0UhtkaXJlY3RSZWZ1bmRUeFNpZ25pbmdSZXN1bHQSdgopZGlyZWN0X2Zyb21fY3BmcF9yZWZ1'
    'bmRfdHhfc2lnbmluZ19yZXN1bHQYBiABKAsyHi5zcGFyay5FeHRlbmRMZWFmU2lnbmluZ1Jlc3'
    'VsdFIjZGlyZWN0RnJvbUNwZnBSZWZ1bmRUeFNpZ25pbmdSZXN1bHQ=');

@$core.Deprecated('Use addressRequestNodeDescriptor instead')
const AddressRequestNode$json = {
  '1': 'AddressRequestNode',
  '2': [
    {'1': 'user_public_key', '3': 1, '4': 1, '5': 12, '10': 'userPublicKey'},
    {
      '1': 'children',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark.AddressRequestNode',
      '10': 'children'
    },
  ],
};

/// Descriptor for `AddressRequestNode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addressRequestNodeDescriptor = $convert.base64Decode(
    'ChJBZGRyZXNzUmVxdWVzdE5vZGUSJgoPdXNlcl9wdWJsaWNfa2V5GAEgASgMUg11c2VyUHVibG'
    'ljS2V5EjUKCGNoaWxkcmVuGAIgAygLMhkuc3BhcmsuQWRkcmVzc1JlcXVlc3ROb2RlUghjaGls'
    'ZHJlbg==');

@$core.Deprecated('Use prepareTreeAddressRequestDescriptor instead')
const PrepareTreeAddressRequest$json = {
  '1': 'PrepareTreeAddressRequest',
  '2': [
    {
      '1': 'parent_node_output',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.NodeOutput',
      '9': 0,
      '10': 'parentNodeOutput'
    },
    {
      '1': 'on_chain_utxo',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.UTXO',
      '9': 0,
      '10': 'onChainUtxo'
    },
    {
      '1': 'node',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.AddressRequestNode',
      '10': 'node'
    },
    {
      '1': 'user_identity_public_key',
      '3': 4,
      '4': 1,
      '5': 12,
      '10': 'userIdentityPublicKey'
    },
  ],
  '8': [
    {'1': 'source'},
  ],
};

/// Descriptor for `PrepareTreeAddressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List prepareTreeAddressRequestDescriptor = $convert.base64Decode(
    'ChlQcmVwYXJlVHJlZUFkZHJlc3NSZXF1ZXN0EkEKEnBhcmVudF9ub2RlX291dHB1dBgBIAEoCz'
    'IRLnNwYXJrLk5vZGVPdXRwdXRIAFIQcGFyZW50Tm9kZU91dHB1dBIxCg1vbl9jaGFpbl91dHhv'
    'GAIgASgLMgsuc3BhcmsuVVRYT0gAUgtvbkNoYWluVXR4bxItCgRub2RlGAMgASgLMhkuc3Bhcm'
    'suQWRkcmVzc1JlcXVlc3ROb2RlUgRub2RlEjcKGHVzZXJfaWRlbnRpdHlfcHVibGljX2tleRgE'
    'IAEoDFIVdXNlcklkZW50aXR5UHVibGljS2V5QggKBnNvdXJjZQ==');

@$core.Deprecated('Use addressNodeDescriptor instead')
const AddressNode$json = {
  '1': 'AddressNode',
  '2': [
    {
      '1': 'address',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.Address',
      '10': 'address'
    },
    {
      '1': 'children',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark.AddressNode',
      '10': 'children'
    },
  ],
};

/// Descriptor for `AddressNode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addressNodeDescriptor = $convert.base64Decode(
    'CgtBZGRyZXNzTm9kZRIoCgdhZGRyZXNzGAEgASgLMg4uc3BhcmsuQWRkcmVzc1IHYWRkcmVzcx'
    'IuCghjaGlsZHJlbhgCIAMoCzISLnNwYXJrLkFkZHJlc3NOb2RlUghjaGlsZHJlbg==');

@$core.Deprecated('Use prepareTreeAddressResponseDescriptor instead')
const PrepareTreeAddressResponse$json = {
  '1': 'PrepareTreeAddressResponse',
  '2': [
    {
      '1': 'node',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.AddressNode',
      '10': 'node'
    },
  ],
};

/// Descriptor for `PrepareTreeAddressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List prepareTreeAddressResponseDescriptor =
    $convert.base64Decode(
        'ChpQcmVwYXJlVHJlZUFkZHJlc3NSZXNwb25zZRImCgRub2RlGAEgASgLMhIuc3BhcmsuQWRkcm'
        'Vzc05vZGVSBG5vZGU=');

@$core.Deprecated('Use creationNodeDescriptor instead')
const CreationNode$json = {
  '1': 'CreationNode',
  '2': [
    {
      '1': 'node_tx_signing_job',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'nodeTxSigningJob'
    },
    {
      '1': 'refund_tx_signing_job',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'refundTxSigningJob'
    },
    {
      '1': 'children',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.spark.CreationNode',
      '10': 'children'
    },
    {
      '1': 'direct_node_tx_signing_job',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'directNodeTxSigningJob'
    },
    {
      '1': 'direct_refund_tx_signing_job',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'directRefundTxSigningJob'
    },
    {
      '1': 'direct_from_cpfp_refund_tx_signing_job',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'directFromCpfpRefundTxSigningJob'
    },
  ],
};

/// Descriptor for `CreationNode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List creationNodeDescriptor = $convert.base64Decode(
    'CgxDcmVhdGlvbk5vZGUSQAoTbm9kZV90eF9zaWduaW5nX2pvYhgBIAEoCzIRLnNwYXJrLlNpZ2'
    '5pbmdKb2JSEG5vZGVUeFNpZ25pbmdKb2ISRAoVcmVmdW5kX3R4X3NpZ25pbmdfam9iGAIgASgL'
    'MhEuc3BhcmsuU2lnbmluZ0pvYlIScmVmdW5kVHhTaWduaW5nSm9iEi8KCGNoaWxkcmVuGAMgAy'
    'gLMhMuc3BhcmsuQ3JlYXRpb25Ob2RlUghjaGlsZHJlbhJNChpkaXJlY3Rfbm9kZV90eF9zaWdu'
    'aW5nX2pvYhgEIAEoCzIRLnNwYXJrLlNpZ25pbmdKb2JSFmRpcmVjdE5vZGVUeFNpZ25pbmdKb2'
    'ISUQocZGlyZWN0X3JlZnVuZF90eF9zaWduaW5nX2pvYhgFIAEoCzIRLnNwYXJrLlNpZ25pbmdK'
    'b2JSGGRpcmVjdFJlZnVuZFR4U2lnbmluZ0pvYhJjCiZkaXJlY3RfZnJvbV9jcGZwX3JlZnVuZF'
    '90eF9zaWduaW5nX2pvYhgGIAEoCzIRLnNwYXJrLlNpZ25pbmdKb2JSIGRpcmVjdEZyb21DcGZw'
    'UmVmdW5kVHhTaWduaW5nSm9i');

@$core.Deprecated('Use createTreeRequestDescriptor instead')
const CreateTreeRequest$json = {
  '1': 'CreateTreeRequest',
  '2': [
    {
      '1': 'parent_node_output',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.NodeOutput',
      '9': 0,
      '10': 'parentNodeOutput'
    },
    {
      '1': 'on_chain_utxo',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.UTXO',
      '9': 0,
      '10': 'onChainUtxo'
    },
    {
      '1': 'node',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.CreationNode',
      '10': 'node'
    },
    {
      '1': 'user_identity_public_key',
      '3': 4,
      '4': 1,
      '5': 12,
      '10': 'userIdentityPublicKey'
    },
  ],
  '8': [
    {'1': 'source'},
  ],
};

/// Descriptor for `CreateTreeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTreeRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVUcmVlUmVxdWVzdBJBChJwYXJlbnRfbm9kZV9vdXRwdXQYASABKAsyES5zcGFyay'
    '5Ob2RlT3V0cHV0SABSEHBhcmVudE5vZGVPdXRwdXQSMQoNb25fY2hhaW5fdXR4bxgCIAEoCzIL'
    'LnNwYXJrLlVUWE9IAFILb25DaGFpblV0eG8SJwoEbm9kZRgDIAEoCzITLnNwYXJrLkNyZWF0aW'
    '9uTm9kZVIEbm9kZRI3Chh1c2VyX2lkZW50aXR5X3B1YmxpY19rZXkYBCABKAxSFXVzZXJJZGVu'
    'dGl0eVB1YmxpY0tleUIICgZzb3VyY2U=');

@$core.Deprecated('Use creationResponseNodeDescriptor instead')
const CreationResponseNode$json = {
  '1': 'CreationResponseNode',
  '2': [
    {'1': 'node_id', '3': 1, '4': 1, '5': 9, '10': 'nodeId'},
    {
      '1': 'node_tx_signing_result',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningResult',
      '10': 'nodeTxSigningResult'
    },
    {
      '1': 'refund_tx_signing_result',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningResult',
      '10': 'refundTxSigningResult'
    },
    {
      '1': 'children',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.spark.CreationResponseNode',
      '10': 'children'
    },
    {
      '1': 'direct_node_tx_signing_result',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningResult',
      '10': 'directNodeTxSigningResult'
    },
    {
      '1': 'direct_refund_tx_signing_result',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningResult',
      '10': 'directRefundTxSigningResult'
    },
    {
      '1': 'direct_from_cpfp_refund_tx_signing_result',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningResult',
      '10': 'directFromCpfpRefundTxSigningResult'
    },
  ],
};

/// Descriptor for `CreationResponseNode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List creationResponseNodeDescriptor = $convert.base64Decode(
    'ChRDcmVhdGlvblJlc3BvbnNlTm9kZRIXCgdub2RlX2lkGAEgASgJUgZub2RlSWQSSQoWbm9kZV'
    '90eF9zaWduaW5nX3Jlc3VsdBgCIAEoCzIULnNwYXJrLlNpZ25pbmdSZXN1bHRSE25vZGVUeFNp'
    'Z25pbmdSZXN1bHQSTQoYcmVmdW5kX3R4X3NpZ25pbmdfcmVzdWx0GAMgASgLMhQuc3BhcmsuU2'
    'lnbmluZ1Jlc3VsdFIVcmVmdW5kVHhTaWduaW5nUmVzdWx0EjcKCGNoaWxkcmVuGAQgAygLMhsu'
    'c3BhcmsuQ3JlYXRpb25SZXNwb25zZU5vZGVSCGNoaWxkcmVuElYKHWRpcmVjdF9ub2RlX3R4X3'
    'NpZ25pbmdfcmVzdWx0GAUgASgLMhQuc3BhcmsuU2lnbmluZ1Jlc3VsdFIZZGlyZWN0Tm9kZVR4'
    'U2lnbmluZ1Jlc3VsdBJaCh9kaXJlY3RfcmVmdW5kX3R4X3NpZ25pbmdfcmVzdWx0GAYgASgLMh'
    'Quc3BhcmsuU2lnbmluZ1Jlc3VsdFIbZGlyZWN0UmVmdW5kVHhTaWduaW5nUmVzdWx0EmwKKWRp'
    'cmVjdF9mcm9tX2NwZnBfcmVmdW5kX3R4X3NpZ25pbmdfcmVzdWx0GAcgASgLMhQuc3BhcmsuU2'
    'lnbmluZ1Jlc3VsdFIjZGlyZWN0RnJvbUNwZnBSZWZ1bmRUeFNpZ25pbmdSZXN1bHQ=');

@$core.Deprecated('Use createTreeResponseDescriptor instead')
const CreateTreeResponse$json = {
  '1': 'CreateTreeResponse',
  '2': [
    {
      '1': 'node',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.CreationResponseNode',
      '10': 'node'
    },
  ],
};

/// Descriptor for `CreateTreeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTreeResponseDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVUcmVlUmVzcG9uc2USLwoEbm9kZRgBIAEoCzIbLnNwYXJrLkNyZWF0aW9uUmVzcG'
    '9uc2VOb2RlUgRub2Rl');

@$core.Deprecated('Use signingOperatorInfoDescriptor instead')
const SigningOperatorInfo$json = {
  '1': 'SigningOperatorInfo',
  '2': [
    {'1': 'index', '3': 1, '4': 1, '5': 4, '10': 'index'},
    {'1': 'identifier', '3': 2, '4': 1, '5': 9, '10': 'identifier'},
    {'1': 'public_key', '3': 3, '4': 1, '5': 12, '10': 'publicKey'},
    {'1': 'address', '3': 4, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `SigningOperatorInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingOperatorInfoDescriptor = $convert.base64Decode(
    'ChNTaWduaW5nT3BlcmF0b3JJbmZvEhQKBWluZGV4GAEgASgEUgVpbmRleBIeCgppZGVudGlmaW'
    'VyGAIgASgJUgppZGVudGlmaWVyEh0KCnB1YmxpY19rZXkYAyABKAxSCXB1YmxpY0tleRIYCgdh'
    'ZGRyZXNzGAQgASgJUgdhZGRyZXNz');

@$core.Deprecated('Use getSigningOperatorListResponseDescriptor instead')
const GetSigningOperatorListResponse$json = {
  '1': 'GetSigningOperatorListResponse',
  '2': [
    {
      '1': 'signing_operators',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.GetSigningOperatorListResponse.SigningOperatorsEntry',
      '10': 'signingOperators'
    },
  ],
  '3': [GetSigningOperatorListResponse_SigningOperatorsEntry$json],
};

@$core.Deprecated('Use getSigningOperatorListResponseDescriptor instead')
const GetSigningOperatorListResponse_SigningOperatorsEntry$json = {
  '1': 'SigningOperatorsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningOperatorInfo',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `GetSigningOperatorListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSigningOperatorListResponseDescriptor = $convert.base64Decode(
    'Ch5HZXRTaWduaW5nT3BlcmF0b3JMaXN0UmVzcG9uc2USaAoRc2lnbmluZ19vcGVyYXRvcnMYAS'
    'ADKAsyOy5zcGFyay5HZXRTaWduaW5nT3BlcmF0b3JMaXN0UmVzcG9uc2UuU2lnbmluZ09wZXJh'
    'dG9yc0VudHJ5UhBzaWduaW5nT3BlcmF0b3JzGl8KFVNpZ25pbmdPcGVyYXRvcnNFbnRyeRIQCg'
    'NrZXkYASABKAlSA2tleRIwCgV2YWx1ZRgCIAEoCzIaLnNwYXJrLlNpZ25pbmdPcGVyYXRvcklu'
    'Zm9SBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use queryUserSignedRefundsRequestDescriptor instead')
const QueryUserSignedRefundsRequest$json = {
  '1': 'QueryUserSignedRefundsRequest',
  '2': [
    {'1': 'payment_hash', '3': 1, '4': 1, '5': 12, '10': 'paymentHash'},
    {
      '1': 'identity_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'identityPublicKey'
    },
  ],
};

/// Descriptor for `QueryUserSignedRefundsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryUserSignedRefundsRequestDescriptor =
    $convert.base64Decode(
        'Ch1RdWVyeVVzZXJTaWduZWRSZWZ1bmRzUmVxdWVzdBIhCgxwYXltZW50X2hhc2gYASABKAxSC3'
        'BheW1lbnRIYXNoEi4KE2lkZW50aXR5X3B1YmxpY19rZXkYAiABKAxSEWlkZW50aXR5UHVibGlj'
        'S2V5');

@$core.Deprecated('Use queryUserSignedRefundsResponseDescriptor instead')
const QueryUserSignedRefundsResponse$json = {
  '1': 'QueryUserSignedRefundsResponse',
  '2': [
    {
      '1': 'user_signed_refunds',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.UserSignedRefund',
      '10': 'userSignedRefunds'
    },
    {
      '1': 'transfer',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.Transfer',
      '10': 'transfer'
    },
  ],
  '9': [
    {'1': 2, '2': 3},
  ],
};

/// Descriptor for `QueryUserSignedRefundsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryUserSignedRefundsResponseDescriptor =
    $convert.base64Decode(
        'Ch5RdWVyeVVzZXJTaWduZWRSZWZ1bmRzUmVzcG9uc2USRwoTdXNlcl9zaWduZWRfcmVmdW5kcx'
        'gBIAMoCzIXLnNwYXJrLlVzZXJTaWduZWRSZWZ1bmRSEXVzZXJTaWduZWRSZWZ1bmRzEisKCHRy'
        'YW5zZmVyGAMgASgLMg8uc3BhcmsuVHJhbnNmZXJSCHRyYW5zZmVySgQIAhAD');

@$core.Deprecated('Use preimageRequestWithTransferDescriptor instead')
const PreimageRequestWithTransfer$json = {
  '1': 'PreimageRequestWithTransfer',
  '2': [
    {
      '1': 'payment_hash',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'paymentHash'
    },
    {
      '1': 'receiver_identity_pubkey',
      '3': 2,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'receiverIdentityPubkey'
    },
    {
      '1': 'status',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.spark.PreimageRequestStatus',
      '10': 'status'
    },
    {
      '1': 'created_time',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdTime'
    },
    {
      '1': 'transfer',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.spark.Transfer',
      '9': 0,
      '10': 'transfer',
      '17': true
    },
    {
      '1': 'preimage',
      '3': 6,
      '4': 1,
      '5': 12,
      '9': 1,
      '10': 'preimage',
      '17': true
    },
    {
      '1': 'sender_identity_pubkey',
      '3': 7,
      '4': 1,
      '5': 12,
      '10': 'senderIdentityPubkey'
    },
  ],
  '8': [
    {'1': '_transfer'},
    {'1': '_preimage'},
  ],
};

/// Descriptor for `PreimageRequestWithTransfer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List preimageRequestWithTransferDescriptor = $convert.base64Decode(
    'ChtQcmVpbWFnZVJlcXVlc3RXaXRoVHJhbnNmZXISKgoMcGF5bWVudF9oYXNoGAEgASgMQgf6Qg'
    'R6AmggUgtwYXltZW50SGFzaBJBChhyZWNlaXZlcl9pZGVudGl0eV9wdWJrZXkYAiABKAxCB/pC'
    'BHoCaCFSFnJlY2VpdmVySWRlbnRpdHlQdWJrZXkSNAoGc3RhdHVzGAMgASgOMhwuc3BhcmsuUH'
    'JlaW1hZ2VSZXF1ZXN0U3RhdHVzUgZzdGF0dXMSPQoMY3JlYXRlZF90aW1lGAQgASgLMhouZ29v'
    'Z2xlLnByb3RvYnVmLlRpbWVzdGFtcFILY3JlYXRlZFRpbWUSMAoIdHJhbnNmZXIYBSABKAsyDy'
    '5zcGFyay5UcmFuc2ZlckgAUgh0cmFuc2ZlcogBARIfCghwcmVpbWFnZRgGIAEoDEgBUghwcmVp'
    'bWFnZYgBARI0ChZzZW5kZXJfaWRlbnRpdHlfcHVia2V5GAcgASgMUhRzZW5kZXJJZGVudGl0eV'
    'B1YmtleUILCglfdHJhbnNmZXJCCwoJX3ByZWltYWdl');

@$core.Deprecated('Use queryHtlcRequestDescriptor instead')
const QueryHtlcRequest$json = {
  '1': 'QueryHtlcRequest',
  '2': [
    {'1': 'payment_hashes', '3': 1, '4': 3, '5': 12, '10': 'paymentHashes'},
    {
      '1': 'identity_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'identityPublicKey'
    },
    {
      '1': 'status',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.spark.PreimageRequestStatus',
      '9': 0,
      '10': 'status',
      '17': true
    },
    {'1': 'limit', '3': 4, '4': 1, '5': 3, '10': 'limit'},
    {'1': 'offset', '3': 5, '4': 1, '5': 3, '10': 'offset'},
    {'1': 'transfer_ids', '3': 6, '4': 3, '5': 9, '10': 'transferIds'},
    {
      '1': 'match_role',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.spark.PreimageRequestRole',
      '10': 'matchRole'
    },
  ],
  '8': [
    {'1': '_status'},
  ],
};

/// Descriptor for `QueryHtlcRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryHtlcRequestDescriptor = $convert.base64Decode(
    'ChBRdWVyeUh0bGNSZXF1ZXN0EiUKDnBheW1lbnRfaGFzaGVzGAEgAygMUg1wYXltZW50SGFzaG'
    'VzEjcKE2lkZW50aXR5X3B1YmxpY19rZXkYAiABKAxCB/pCBHoCaCFSEWlkZW50aXR5UHVibGlj'
    'S2V5EjkKBnN0YXR1cxgDIAEoDjIcLnNwYXJrLlByZWltYWdlUmVxdWVzdFN0YXR1c0gAUgZzdG'
    'F0dXOIAQESFAoFbGltaXQYBCABKANSBWxpbWl0EhYKBm9mZnNldBgFIAEoA1IGb2Zmc2V0EiEK'
    'DHRyYW5zZmVyX2lkcxgGIAMoCVILdHJhbnNmZXJJZHMSOQoKbWF0Y2hfcm9sZRgHIAEoDjIaLn'
    'NwYXJrLlByZWltYWdlUmVxdWVzdFJvbGVSCW1hdGNoUm9sZUIJCgdfc3RhdHVz');

@$core.Deprecated('Use queryHtlcResponseDescriptor instead')
const QueryHtlcResponse$json = {
  '1': 'QueryHtlcResponse',
  '2': [
    {
      '1': 'preimage_requests',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.PreimageRequestWithTransfer',
      '10': 'preimageRequests'
    },
    {'1': 'offset', '3': 2, '4': 1, '5': 3, '10': 'offset'},
  ],
};

/// Descriptor for `QueryHtlcResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryHtlcResponseDescriptor = $convert.base64Decode(
    'ChFRdWVyeUh0bGNSZXNwb25zZRJPChFwcmVpbWFnZV9yZXF1ZXN0cxgBIAMoCzIiLnNwYXJrLl'
    'ByZWltYWdlUmVxdWVzdFdpdGhUcmFuc2ZlclIQcHJlaW1hZ2VSZXF1ZXN0cxIWCgZvZmZzZXQY'
    'AiABKANSBm9mZnNldA==');

@$core.Deprecated('Use providePreimageRequestDescriptor instead')
const ProvidePreimageRequest$json = {
  '1': 'ProvidePreimageRequest',
  '2': [
    {'1': 'payment_hash', '3': 1, '4': 1, '5': 12, '10': 'paymentHash'},
    {'1': 'preimage', '3': 2, '4': 1, '5': 12, '10': 'preimage'},
    {
      '1': 'identity_public_key',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'identityPublicKey'
    },
  ],
};

/// Descriptor for `ProvidePreimageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List providePreimageRequestDescriptor = $convert.base64Decode(
    'ChZQcm92aWRlUHJlaW1hZ2VSZXF1ZXN0EiEKDHBheW1lbnRfaGFzaBgBIAEoDFILcGF5bWVudE'
    'hhc2gSGgoIcHJlaW1hZ2UYAiABKAxSCHByZWltYWdlEi4KE2lkZW50aXR5X3B1YmxpY19rZXkY'
    'AyABKAxSEWlkZW50aXR5UHVibGljS2V5');

@$core.Deprecated('Use providePreimageResponseDescriptor instead')
const ProvidePreimageResponse$json = {
  '1': 'ProvidePreimageResponse',
  '2': [
    {
      '1': 'transfer',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.Transfer',
      '10': 'transfer'
    },
  ],
};

/// Descriptor for `ProvidePreimageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List providePreimageResponseDescriptor =
    $convert.base64Decode(
        'ChdQcm92aWRlUHJlaW1hZ2VSZXNwb25zZRIrCgh0cmFuc2ZlchgBIAEoCzIPLnNwYXJrLlRyYW'
        '5zZmVyUgh0cmFuc2Zlcg==');

@$core.Deprecated('Use queryPreimageRequestDescriptor instead')
const QueryPreimageRequest$json = {
  '1': 'QueryPreimageRequest',
  '2': [
    {
      '1': 'payment_hash',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'paymentHash'
    },
    {
      '1': 'receiver_identity_pubkey',
      '3': 2,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'receiverIdentityPubkey'
    },
  ],
};

/// Descriptor for `QueryPreimageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryPreimageRequestDescriptor = $convert.base64Decode(
    'ChRRdWVyeVByZWltYWdlUmVxdWVzdBIqCgxwYXltZW50X2hhc2gYASABKAxCB/pCBHoCaCBSC3'
    'BheW1lbnRIYXNoEkEKGHJlY2VpdmVyX2lkZW50aXR5X3B1YmtleRgCIAEoDEIH+kIEegJoIVIW'
    'cmVjZWl2ZXJJZGVudGl0eVB1YmtleQ==');

@$core.Deprecated('Use queryPreimageResponseDescriptor instead')
const QueryPreimageResponse$json = {
  '1': 'QueryPreimageResponse',
  '2': [
    {
      '1': 'preimage',
      '3': 1,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'preimage',
      '17': true
    },
  ],
  '8': [
    {'1': '_preimage'},
  ],
};

/// Descriptor for `QueryPreimageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryPreimageResponseDescriptor = $convert.base64Decode(
    'ChVRdWVyeVByZWltYWdlUmVzcG9uc2USHwoIcHJlaW1hZ2UYASABKAxIAFIIcHJlaW1hZ2WIAQ'
    'FCCwoJX3ByZWltYWdl');

@$core.Deprecated('Use treeNodeIdsDescriptor instead')
const TreeNodeIds$json = {
  '1': 'TreeNodeIds',
  '2': [
    {'1': 'node_ids', '3': 1, '4': 3, '5': 9, '10': 'nodeIds'},
  ],
};

/// Descriptor for `TreeNodeIds`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List treeNodeIdsDescriptor = $convert
    .base64Decode('CgtUcmVlTm9kZUlkcxIZCghub2RlX2lkcxgBIAMoCVIHbm9kZUlkcw==');

@$core.Deprecated('Use queryNodesRequestDescriptor instead')
const QueryNodesRequest$json = {
  '1': 'QueryNodesRequest',
  '2': [
    {
      '1': 'owner_identity_pubkey',
      '3': 1,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'ownerIdentityPubkey'
    },
    {
      '1': 'node_ids',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.TreeNodeIds',
      '9': 0,
      '10': 'nodeIds'
    },
    {'1': 'include_parents', '3': 3, '4': 1, '5': 8, '10': 'includeParents'},
    {'1': 'limit', '3': 4, '4': 1, '5': 3, '10': 'limit'},
    {'1': 'offset', '3': 5, '4': 1, '5': 3, '10': 'offset'},
    {
      '1': 'network',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.spark.Network',
      '10': 'network'
    },
    {
      '1': 'statuses',
      '3': 7,
      '4': 3,
      '5': 14,
      '6': '.spark.TreeNodeStatus',
      '10': 'statuses'
    },
  ],
  '8': [
    {'1': 'source'},
  ],
};

/// Descriptor for `QueryNodesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryNodesRequestDescriptor = $convert.base64Decode(
    'ChFRdWVyeU5vZGVzUmVxdWVzdBI0ChVvd25lcl9pZGVudGl0eV9wdWJrZXkYASABKAxIAFITb3'
    'duZXJJZGVudGl0eVB1YmtleRIvCghub2RlX2lkcxgCIAEoCzISLnNwYXJrLlRyZWVOb2RlSWRz'
    'SABSB25vZGVJZHMSJwoPaW5jbHVkZV9wYXJlbnRzGAMgASgIUg5pbmNsdWRlUGFyZW50cxIUCg'
    'VsaW1pdBgEIAEoA1IFbGltaXQSFgoGb2Zmc2V0GAUgASgDUgZvZmZzZXQSKAoHbmV0d29yaxgG'
    'IAEoDjIOLnNwYXJrLk5ldHdvcmtSB25ldHdvcmsSMQoIc3RhdHVzZXMYByADKA4yFS5zcGFyay'
    '5UcmVlTm9kZVN0YXR1c1IIc3RhdHVzZXNCCAoGc291cmNl');

@$core.Deprecated('Use queryNodesResponseDescriptor instead')
const QueryNodesResponse$json = {
  '1': 'QueryNodesResponse',
  '2': [
    {
      '1': 'nodes',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.QueryNodesResponse.NodesEntry',
      '10': 'nodes'
    },
    {'1': 'offset', '3': 2, '4': 1, '5': 3, '10': 'offset'},
  ],
  '3': [QueryNodesResponse_NodesEntry$json],
};

@$core.Deprecated('Use queryNodesResponseDescriptor instead')
const QueryNodesResponse_NodesEntry$json = {
  '1': 'NodesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.TreeNode',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `QueryNodesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryNodesResponseDescriptor = $convert.base64Decode(
    'ChJRdWVyeU5vZGVzUmVzcG9uc2USOgoFbm9kZXMYASADKAsyJC5zcGFyay5RdWVyeU5vZGVzUm'
    'VzcG9uc2UuTm9kZXNFbnRyeVIFbm9kZXMSFgoGb2Zmc2V0GAIgASgDUgZvZmZzZXQaSQoKTm9k'
    'ZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIlCgV2YWx1ZRgCIAEoCzIPLnNwYXJrLlRyZWVOb2'
    'RlUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use cancelTransferRequestDescriptor instead')
const CancelTransferRequest$json = {
  '1': 'CancelTransferRequest',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {
      '1': 'sender_identity_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'senderIdentityPublicKey'
    },
  ],
};

/// Descriptor for `CancelTransferRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cancelTransferRequestDescriptor = $convert.base64Decode(
    'ChVDYW5jZWxUcmFuc2ZlclJlcXVlc3QSHwoLdHJhbnNmZXJfaWQYASABKAlSCnRyYW5zZmVySW'
    'QSOwoac2VuZGVyX2lkZW50aXR5X3B1YmxpY19rZXkYAiABKAxSF3NlbmRlcklkZW50aXR5UHVi'
    'bGljS2V5');

@$core.Deprecated('Use cancelTransferResponseDescriptor instead')
const CancelTransferResponse$json = {
  '1': 'CancelTransferResponse',
  '2': [
    {
      '1': 'transfer',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.Transfer',
      '10': 'transfer'
    },
  ],
};

/// Descriptor for `CancelTransferResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cancelTransferResponseDescriptor =
    $convert.base64Decode(
        'ChZDYW5jZWxUcmFuc2ZlclJlc3BvbnNlEisKCHRyYW5zZmVyGAEgASgLMg8uc3BhcmsuVHJhbn'
        'NmZXJSCHRyYW5zZmVy');

@$core.Deprecated('Use queryUnusedDepositAddressesRequestDescriptor instead')
const QueryUnusedDepositAddressesRequest$json = {
  '1': 'QueryUnusedDepositAddressesRequest',
  '2': [
    {
      '1': 'identity_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'identityPublicKey'
    },
    {
      '1': 'network',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.spark.Network',
      '10': 'network'
    },
    {'1': 'limit', '3': 3, '4': 1, '5': 3, '10': 'limit'},
    {'1': 'offset', '3': 4, '4': 1, '5': 3, '10': 'offset'},
  ],
};

/// Descriptor for `QueryUnusedDepositAddressesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryUnusedDepositAddressesRequestDescriptor =
    $convert.base64Decode(
        'CiJRdWVyeVVudXNlZERlcG9zaXRBZGRyZXNzZXNSZXF1ZXN0Ei4KE2lkZW50aXR5X3B1YmxpY1'
        '9rZXkYASABKAxSEWlkZW50aXR5UHVibGljS2V5EigKB25ldHdvcmsYAiABKA4yDi5zcGFyay5O'
        'ZXR3b3JrUgduZXR3b3JrEhQKBWxpbWl0GAMgASgDUgVsaW1pdBIWCgZvZmZzZXQYBCABKANSBm'
        '9mZnNldA==');

@$core.Deprecated('Use queryStaticDepositAddressesRequestDescriptor instead')
const QueryStaticDepositAddressesRequest$json = {
  '1': 'QueryStaticDepositAddressesRequest',
  '2': [
    {
      '1': 'identity_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'identityPublicKey'
    },
    {
      '1': 'network',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.spark.Network',
      '10': 'network'
    },
    {'1': 'limit', '3': 4, '4': 1, '5': 3, '10': 'limit'},
    {'1': 'offset', '3': 5, '4': 1, '5': 3, '10': 'offset'},
    {
      '1': 'deposit_address',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'depositAddress',
      '17': true
    },
    {
      '1': 'hash_variant',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.spark.HashVariant',
      '10': 'hashVariant'
    },
  ],
  '8': [
    {'1': '_deposit_address'},
  ],
};

/// Descriptor for `QueryStaticDepositAddressesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryStaticDepositAddressesRequestDescriptor = $convert.base64Decode(
    'CiJRdWVyeVN0YXRpY0RlcG9zaXRBZGRyZXNzZXNSZXF1ZXN0Ei4KE2lkZW50aXR5X3B1YmxpY1'
    '9rZXkYASABKAxSEWlkZW50aXR5UHVibGljS2V5EigKB25ldHdvcmsYAiABKA4yDi5zcGFyay5O'
    'ZXR3b3JrUgduZXR3b3JrEhQKBWxpbWl0GAQgASgDUgVsaW1pdBIWCgZvZmZzZXQYBSABKANSBm'
    '9mZnNldBIsCg9kZXBvc2l0X2FkZHJlc3MYBiABKAlIAFIOZGVwb3NpdEFkZHJlc3OIAQESNQoM'
    'aGFzaF92YXJpYW50GAcgASgOMhIuc3BhcmsuSGFzaFZhcmlhbnRSC2hhc2hWYXJpYW50QhIKEF'
    '9kZXBvc2l0X2FkZHJlc3M=');

@$core.Deprecated('Use depositAddressQueryResultDescriptor instead')
const DepositAddressQueryResult$json = {
  '1': 'DepositAddressQueryResult',
  '2': [
    {'1': 'deposit_address', '3': 1, '4': 1, '5': 9, '10': 'depositAddress'},
    {
      '1': 'user_signing_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'userSigningPublicKey'
    },
    {
      '1': 'verifying_public_key',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'verifyingPublicKey'
    },
    {
      '1': 'leaf_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 0,
      '10': 'leafId',
      '17': true
    },
    {
      '1': 'proof_of_possession',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.spark.DepositAddressProof',
      '9': 1,
      '10': 'proofOfPossession',
      '17': true
    },
  ],
  '8': [
    {'1': '_leaf_id'},
    {'1': '_proof_of_possession'},
  ],
};

/// Descriptor for `DepositAddressQueryResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List depositAddressQueryResultDescriptor = $convert.base64Decode(
    'ChlEZXBvc2l0QWRkcmVzc1F1ZXJ5UmVzdWx0EicKD2RlcG9zaXRfYWRkcmVzcxgBIAEoCVIOZG'
    'Vwb3NpdEFkZHJlc3MSNQoXdXNlcl9zaWduaW5nX3B1YmxpY19rZXkYAiABKAxSFHVzZXJTaWdu'
    'aW5nUHVibGljS2V5EjAKFHZlcmlmeWluZ19wdWJsaWNfa2V5GAMgASgMUhJ2ZXJpZnlpbmdQdW'
    'JsaWNLZXkSJgoHbGVhZl9pZBgEIAEoCUII+kIFcgOwAQFIAFIGbGVhZklkiAEBEk8KE3Byb29m'
    'X29mX3Bvc3Nlc3Npb24YBSABKAsyGi5zcGFyay5EZXBvc2l0QWRkcmVzc1Byb29mSAFSEXByb2'
    '9mT2ZQb3NzZXNzaW9uiAEBQgoKCF9sZWFmX2lkQhYKFF9wcm9vZl9vZl9wb3NzZXNzaW9u');

@$core.Deprecated('Use queryUnusedDepositAddressesResponseDescriptor instead')
const QueryUnusedDepositAddressesResponse$json = {
  '1': 'QueryUnusedDepositAddressesResponse',
  '2': [
    {
      '1': 'deposit_addresses',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.DepositAddressQueryResult',
      '10': 'depositAddresses'
    },
    {'1': 'offset', '3': 2, '4': 1, '5': 3, '10': 'offset'},
  ],
};

/// Descriptor for `QueryUnusedDepositAddressesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryUnusedDepositAddressesResponseDescriptor =
    $convert.base64Decode(
        'CiNRdWVyeVVudXNlZERlcG9zaXRBZGRyZXNzZXNSZXNwb25zZRJNChFkZXBvc2l0X2FkZHJlc3'
        'NlcxgBIAMoCzIgLnNwYXJrLkRlcG9zaXRBZGRyZXNzUXVlcnlSZXN1bHRSEGRlcG9zaXRBZGRy'
        'ZXNzZXMSFgoGb2Zmc2V0GAIgASgDUgZvZmZzZXQ=');

@$core.Deprecated('Use queryStaticDepositAddressesResponseDescriptor instead')
const QueryStaticDepositAddressesResponse$json = {
  '1': 'QueryStaticDepositAddressesResponse',
  '2': [
    {
      '1': 'deposit_addresses',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.DepositAddressQueryResult',
      '10': 'depositAddresses'
    },
  ],
};

/// Descriptor for `QueryStaticDepositAddressesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryStaticDepositAddressesResponseDescriptor =
    $convert.base64Decode(
        'CiNRdWVyeVN0YXRpY0RlcG9zaXRBZGRyZXNzZXNSZXNwb25zZRJNChFkZXBvc2l0X2FkZHJlc3'
        'NlcxgBIAMoCzIgLnNwYXJrLkRlcG9zaXRBZGRyZXNzUXVlcnlSZXN1bHRSEGRlcG9zaXRBZGRy'
        'ZXNzZXM=');

@$core.Deprecated('Use queryBalanceRequestDescriptor instead')
const QueryBalanceRequest$json = {
  '1': 'QueryBalanceRequest',
  '2': [
    {
      '1': 'identity_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'identityPublicKey'
    },
    {
      '1': 'network',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.spark.Network',
      '10': 'network'
    },
  ],
};

/// Descriptor for `QueryBalanceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryBalanceRequestDescriptor = $convert.base64Decode(
    'ChNRdWVyeUJhbGFuY2VSZXF1ZXN0Ei4KE2lkZW50aXR5X3B1YmxpY19rZXkYASABKAxSEWlkZW'
    '50aXR5UHVibGljS2V5EigKB25ldHdvcmsYAiABKA4yDi5zcGFyay5OZXR3b3JrUgduZXR3b3Jr');

@$core.Deprecated('Use queryBalanceResponseDescriptor instead')
const QueryBalanceResponse$json = {
  '1': 'QueryBalanceResponse',
  '2': [
    {'1': 'balance', '3': 1, '4': 1, '5': 4, '10': 'balance'},
    {
      '1': 'node_balances',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark.QueryBalanceResponse.NodeBalancesEntry',
      '10': 'nodeBalances'
    },
  ],
  '3': [QueryBalanceResponse_NodeBalancesEntry$json],
};

@$core.Deprecated('Use queryBalanceResponseDescriptor instead')
const QueryBalanceResponse_NodeBalancesEntry$json = {
  '1': 'NodeBalancesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 4, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `QueryBalanceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryBalanceResponseDescriptor = $convert.base64Decode(
    'ChRRdWVyeUJhbGFuY2VSZXNwb25zZRIYCgdiYWxhbmNlGAEgASgEUgdiYWxhbmNlElIKDW5vZG'
    'VfYmFsYW5jZXMYAiADKAsyLS5zcGFyay5RdWVyeUJhbGFuY2VSZXNwb25zZS5Ob2RlQmFsYW5j'
    'ZXNFbnRyeVIMbm9kZUJhbGFuY2VzGj8KEU5vZGVCYWxhbmNlc0VudHJ5EhAKA2tleRgBIAEoCV'
    'IDa2V5EhQKBXZhbHVlGAIgASgEUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use sparkAddressDescriptor instead')
const SparkAddress$json = {
  '1': 'SparkAddress',
  '2': [
    {
      '1': 'identity_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'identityPublicKey'
    },
    {
      '1': 'spark_invoice_fields',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.SparkInvoiceFields',
      '10': 'sparkInvoiceFields'
    },
    {
      '1': 'signature',
      '3': 3,
      '4': 1,
      '5': 12,
      '8': {},
      '9': 0,
      '10': 'signature',
      '17': true
    },
  ],
  '8': [
    {'1': '_signature'},
  ],
};

/// Descriptor for `SparkAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sparkAddressDescriptor = $convert.base64Decode(
    'CgxTcGFya0FkZHJlc3MSLgoTaWRlbnRpdHlfcHVibGljX2tleRgBIAEoDFIRaWRlbnRpdHlQdW'
    'JsaWNLZXkSSwoUc3BhcmtfaW52b2ljZV9maWVsZHMYAiABKAsyGS5zcGFyay5TcGFya0ludm9p'
    'Y2VGaWVsZHNSEnNwYXJrSW52b2ljZUZpZWxkcxIqCglzaWduYXR1cmUYAyABKAxCB/pCBHoCaE'
    'BIAFIJc2lnbmF0dXJliAEBQgwKCl9zaWduYXR1cmU=');

@$core.Deprecated('Use sparkInvoiceFieldsDescriptor instead')
const SparkInvoiceFields$json = {
  '1': 'SparkInvoiceFields',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 13, '10': 'version'},
    {'1': 'id', '3': 2, '4': 1, '5': 12, '8': {}, '10': 'id'},
    {
      '1': 'tokens_payment',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.TokensPayment',
      '9': 0,
      '10': 'tokensPayment'
    },
    {
      '1': 'sats_payment',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark.SatsPayment',
      '9': 0,
      '10': 'satsPayment'
    },
    {
      '1': 'memo',
      '3': 5,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 1,
      '10': 'memo',
      '17': true
    },
    {
      '1': 'sender_public_key',
      '3': 6,
      '4': 1,
      '5': 12,
      '8': {},
      '9': 2,
      '10': 'senderPublicKey',
      '17': true
    },
    {
      '1': 'expiry_time',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 3,
      '10': 'expiryTime',
      '17': true
    },
  ],
  '8': [
    {'1': 'payment_type'},
    {'1': '_memo'},
    {'1': '_sender_public_key'},
    {'1': '_expiry_time'},
  ],
};

/// Descriptor for `SparkInvoiceFields`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sparkInvoiceFieldsDescriptor = $convert.base64Decode(
    'ChJTcGFya0ludm9pY2VGaWVsZHMSGAoHdmVyc2lvbhgBIAEoDVIHdmVyc2lvbhIXCgJpZBgCIA'
    'EoDEIH+kIEegJoEFICaWQSPQoOdG9rZW5zX3BheW1lbnQYAyABKAsyFC5zcGFyay5Ub2tlbnNQ'
    'YXltZW50SABSDXRva2Vuc1BheW1lbnQSNwoMc2F0c19wYXltZW50GAQgASgLMhIuc3BhcmsuU2'
    'F0c1BheW1lbnRIAFILc2F0c1BheW1lbnQSIAoEbWVtbxgFIAEoCUIH+kIEcgIoeEgBUgRtZW1v'
    'iAEBEjgKEXNlbmRlcl9wdWJsaWNfa2V5GAYgASgMQgf6QgR6AmghSAJSD3NlbmRlclB1YmxpY0'
    'tleYgBARJACgtleHBpcnlfdGltZRgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBI'
    'A1IKZXhwaXJ5VGltZYgBAUIOCgxwYXltZW50X3R5cGVCBwoFX21lbW9CFAoSX3NlbmRlcl9wdW'
    'JsaWNfa2V5Qg4KDF9leHBpcnlfdGltZQ==');

@$core.Deprecated('Use satsPaymentDescriptor instead')
const SatsPayment$json = {
  '1': 'SatsPayment',
  '2': [
    {'1': 'amount', '3': 1, '4': 1, '5': 4, '9': 0, '10': 'amount', '17': true},
  ],
  '8': [
    {'1': '_amount'},
  ],
};

/// Descriptor for `SatsPayment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List satsPaymentDescriptor = $convert.base64Decode(
    'CgtTYXRzUGF5bWVudBIbCgZhbW91bnQYASABKARIAFIGYW1vdW50iAEBQgkKB19hbW91bnQ=');

@$core.Deprecated('Use tokensPaymentDescriptor instead')
const TokensPayment$json = {
  '1': 'TokensPayment',
  '2': [
    {
      '1': 'token_identifier',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {},
      '9': 0,
      '10': 'tokenIdentifier',
      '17': true
    },
    {
      '1': 'amount',
      '3': 2,
      '4': 1,
      '5': 12,
      '8': {},
      '9': 1,
      '10': 'amount',
      '17': true
    },
  ],
  '8': [
    {'1': '_token_identifier'},
    {'1': '_amount'},
  ],
};

/// Descriptor for `TokensPayment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokensPaymentDescriptor = $convert.base64Decode(
    'Cg1Ub2tlbnNQYXltZW50EjcKEHRva2VuX2lkZW50aWZpZXIYASABKAxCB/pCBHoCaCBIAFIPdG'
    '9rZW5JZGVudGlmaWVyiAEBEiQKBmFtb3VudBgCIAEoDEIH+kIEegIYEEgBUgZhbW91bnSIAQFC'
    'EwoRX3Rva2VuX2lkZW50aWZpZXJCCQoHX2Ftb3VudA==');

@$core
    .Deprecated('Use initiateStaticDepositUtxoRefundRequestDescriptor instead')
const InitiateStaticDepositUtxoRefundRequest$json = {
  '1': 'InitiateStaticDepositUtxoRefundRequest',
  '2': [
    {
      '1': 'on_chain_utxo',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.UTXO',
      '10': 'onChainUtxo'
    },
    {
      '1': 'refund_tx_signing_job',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'refundTxSigningJob'
    },
    {'1': 'user_signature', '3': 4, '4': 1, '5': 12, '10': 'userSignature'},
    {
      '1': 'hash_variant',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.spark.HashVariant',
      '10': 'hashVariant'
    },
  ],
};

/// Descriptor for `InitiateStaticDepositUtxoRefundRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiateStaticDepositUtxoRefundRequestDescriptor =
    $convert.base64Decode(
        'CiZJbml0aWF0ZVN0YXRpY0RlcG9zaXRVdHhvUmVmdW5kUmVxdWVzdBIvCg1vbl9jaGFpbl91dH'
        'hvGAEgASgLMgsuc3BhcmsuVVRYT1ILb25DaGFpblV0eG8SRAoVcmVmdW5kX3R4X3NpZ25pbmdf'
        'am9iGAMgASgLMhEuc3BhcmsuU2lnbmluZ0pvYlIScmVmdW5kVHhTaWduaW5nSm9iEiUKDnVzZX'
        'Jfc2lnbmF0dXJlGAQgASgMUg11c2VyU2lnbmF0dXJlEjUKDGhhc2hfdmFyaWFudBgFIAEoDjIS'
        'LnNwYXJrLkhhc2hWYXJpYW50UgtoYXNoVmFyaWFudA==');

@$core
    .Deprecated('Use initiateStaticDepositUtxoRefundResponseDescriptor instead')
const InitiateStaticDepositUtxoRefundResponse$json = {
  '1': 'InitiateStaticDepositUtxoRefundResponse',
  '2': [
    {
      '1': 'refund_tx_signing_result',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningResult',
      '10': 'refundTxSigningResult'
    },
    {
      '1': 'deposit_address',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.DepositAddressQueryResult',
      '10': 'depositAddress'
    },
  ],
};

/// Descriptor for `InitiateStaticDepositUtxoRefundResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiateStaticDepositUtxoRefundResponseDescriptor =
    $convert.base64Decode(
        'CidJbml0aWF0ZVN0YXRpY0RlcG9zaXRVdHhvUmVmdW5kUmVzcG9uc2USTQoYcmVmdW5kX3R4X3'
        'NpZ25pbmdfcmVzdWx0GAEgASgLMhQuc3BhcmsuU2lnbmluZ1Jlc3VsdFIVcmVmdW5kVHhTaWdu'
        'aW5nUmVzdWx0EkkKD2RlcG9zaXRfYWRkcmVzcxgCIAEoCzIgLnNwYXJrLkRlcG9zaXRBZGRyZX'
        'NzUXVlcnlSZXN1bHRSDmRlcG9zaXRBZGRyZXNz');

@$core.Deprecated('Use initiateUtxoSwapRequestDescriptor instead')
const InitiateUtxoSwapRequest$json = {
  '1': 'InitiateUtxoSwapRequest',
  '2': [
    {
      '1': 'on_chain_utxo',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.UTXO',
      '10': 'onChainUtxo'
    },
    {
      '1': 'request_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.spark.UtxoSwapRequestType',
      '10': 'requestType'
    },
    {
      '1': 'credit_amount_sats',
      '3': 3,
      '4': 1,
      '5': 4,
      '9': 0,
      '10': 'creditAmountSats'
    },
    {'1': 'max_fee_sats', '3': 4, '4': 1, '5': 4, '9': 0, '10': 'maxFeeSats'},
    {'1': 'ssp_signature', '3': 5, '4': 1, '5': 12, '10': 'sspSignature'},
    {'1': 'user_signature', '3': 6, '4': 1, '5': 12, '10': 'userSignature'},
    {
      '1': 'transfer',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.spark.StartTransferRequest',
      '10': 'transfer'
    },
    {
      '1': 'spend_tx_signing_job',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'spendTxSigningJob'
    },
  ],
  '8': [
    {'1': 'amount'},
  ],
};

/// Descriptor for `InitiateUtxoSwapRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiateUtxoSwapRequestDescriptor = $convert.base64Decode(
    'ChdJbml0aWF0ZVV0eG9Td2FwUmVxdWVzdBIvCg1vbl9jaGFpbl91dHhvGAEgASgLMgsuc3Bhcm'
    'suVVRYT1ILb25DaGFpblV0eG8SPQoMcmVxdWVzdF90eXBlGAIgASgOMhouc3BhcmsuVXR4b1N3'
    'YXBSZXF1ZXN0VHlwZVILcmVxdWVzdFR5cGUSLgoSY3JlZGl0X2Ftb3VudF9zYXRzGAMgASgESA'
    'BSEGNyZWRpdEFtb3VudFNhdHMSIgoMbWF4X2ZlZV9zYXRzGAQgASgESABSCm1heEZlZVNhdHMS'
    'IwoNc3NwX3NpZ25hdHVyZRgFIAEoDFIMc3NwU2lnbmF0dXJlEiUKDnVzZXJfc2lnbmF0dXJlGA'
    'YgASgMUg11c2VyU2lnbmF0dXJlEjcKCHRyYW5zZmVyGAcgASgLMhsuc3BhcmsuU3RhcnRUcmFu'
    'c2ZlclJlcXVlc3RSCHRyYW5zZmVyEkIKFHNwZW5kX3R4X3NpZ25pbmdfam9iGAggASgLMhEuc3'
    'BhcmsuU2lnbmluZ0pvYlIRc3BlbmRUeFNpZ25pbmdKb2JCCAoGYW1vdW50');

@$core.Deprecated('Use initiateUtxoSwapResponseDescriptor instead')
const InitiateUtxoSwapResponse$json = {
  '1': 'InitiateUtxoSwapResponse',
  '2': [
    {
      '1': 'spend_tx_signing_result',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningResult',
      '10': 'spendTxSigningResult'
    },
    {
      '1': 'transfer',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.Transfer',
      '10': 'transfer'
    },
    {
      '1': 'deposit_address',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.DepositAddressQueryResult',
      '10': 'depositAddress'
    },
  ],
};

/// Descriptor for `InitiateUtxoSwapResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiateUtxoSwapResponseDescriptor = $convert.base64Decode(
    'ChhJbml0aWF0ZVV0eG9Td2FwUmVzcG9uc2USSwoXc3BlbmRfdHhfc2lnbmluZ19yZXN1bHQYAS'
    'ABKAsyFC5zcGFyay5TaWduaW5nUmVzdWx0UhRzcGVuZFR4U2lnbmluZ1Jlc3VsdBIrCgh0cmFu'
    'c2ZlchgCIAEoCzIPLnNwYXJrLlRyYW5zZmVyUgh0cmFuc2ZlchJJCg9kZXBvc2l0X2FkZHJlc3'
    'MYAyABKAsyIC5zcGFyay5EZXBvc2l0QWRkcmVzc1F1ZXJ5UmVzdWx0Ug5kZXBvc2l0QWRkcmVz'
    'cw==');

@$core.Deprecated('Use exitingTreeDescriptor instead')
const ExitingTree$json = {
  '1': 'ExitingTree',
  '2': [
    {'1': 'tree_id', '3': 1, '4': 1, '5': 9, '10': 'treeId'},
    {
      '1': 'user_signing_commitment',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.common.SigningCommitment',
      '10': 'userSigningCommitment'
    },
    {'1': 'vin', '3': 3, '4': 1, '5': 13, '10': 'vin'},
  ],
};

/// Descriptor for `ExitingTree`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exitingTreeDescriptor = $convert.base64Decode(
    'CgtFeGl0aW5nVHJlZRIXCgd0cmVlX2lkGAEgASgJUgZ0cmVlSWQSUQoXdXNlcl9zaWduaW5nX2'
    'NvbW1pdG1lbnQYAiABKAsyGS5jb21tb24uU2lnbmluZ0NvbW1pdG1lbnRSFXVzZXJTaWduaW5n'
    'Q29tbWl0bWVudBIQCgN2aW4YAyABKA1SA3Zpbg==');

@$core.Deprecated('Use exitSingleNodeTreeSigningResultDescriptor instead')
const ExitSingleNodeTreeSigningResult$json = {
  '1': 'ExitSingleNodeTreeSigningResult',
  '2': [
    {'1': 'tree_id', '3': 1, '4': 1, '5': 9, '10': 'treeId'},
    {
      '1': 'signing_result',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningResult',
      '10': 'signingResult'
    },
    {'1': 'verifying_key', '3': 3, '4': 1, '5': 12, '10': 'verifyingKey'},
  ],
};

/// Descriptor for `ExitSingleNodeTreeSigningResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exitSingleNodeTreeSigningResultDescriptor =
    $convert.base64Decode(
        'Ch9FeGl0U2luZ2xlTm9kZVRyZWVTaWduaW5nUmVzdWx0EhcKB3RyZWVfaWQYASABKAlSBnRyZW'
        'VJZBI7Cg5zaWduaW5nX3Jlc3VsdBgCIAEoCzIULnNwYXJrLlNpZ25pbmdSZXN1bHRSDXNpZ25p'
        'bmdSZXN1bHQSIwoNdmVyaWZ5aW5nX2tleRgDIAEoDFIMdmVyaWZ5aW5nS2V5');

@$core.Deprecated('Use bitcoinTransactionOutputDescriptor instead')
const BitcoinTransactionOutput$json = {
  '1': 'BitcoinTransactionOutput',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 3, '10': 'value'},
    {'1': 'pk_script', '3': 2, '4': 1, '5': 12, '10': 'pkScript'},
  ],
};

/// Descriptor for `BitcoinTransactionOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bitcoinTransactionOutputDescriptor =
    $convert.base64Decode(
        'ChhCaXRjb2luVHJhbnNhY3Rpb25PdXRwdXQSFAoFdmFsdWUYASABKANSBXZhbHVlEhsKCXBrX3'
        'NjcmlwdBgCIAEoDFIIcGtTY3JpcHQ=');

@$core.Deprecated('Use exitSingleNodeTreesRequestDescriptor instead')
const ExitSingleNodeTreesRequest$json = {
  '1': 'ExitSingleNodeTreesRequest',
  '2': [
    {
      '1': 'owner_identity_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'ownerIdentityPublicKey'
    },
    {
      '1': 'exiting_trees',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark.ExitingTree',
      '10': 'exitingTrees'
    },
    {'1': 'raw_tx', '3': 3, '4': 1, '5': 12, '10': 'rawTx'},
    {
      '1': 'previous_outputs',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.spark.BitcoinTransactionOutput',
      '10': 'previousOutputs'
    },
  ],
};

/// Descriptor for `ExitSingleNodeTreesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exitSingleNodeTreesRequestDescriptor = $convert.base64Decode(
    'ChpFeGl0U2luZ2xlTm9kZVRyZWVzUmVxdWVzdBI5Chlvd25lcl9pZGVudGl0eV9wdWJsaWNfa2'
    'V5GAEgASgMUhZvd25lcklkZW50aXR5UHVibGljS2V5EjcKDWV4aXRpbmdfdHJlZXMYAiADKAsy'
    'Ei5zcGFyay5FeGl0aW5nVHJlZVIMZXhpdGluZ1RyZWVzEhUKBnJhd190eBgDIAEoDFIFcmF3VH'
    'gSSgoQcHJldmlvdXNfb3V0cHV0cxgEIAMoCzIfLnNwYXJrLkJpdGNvaW5UcmFuc2FjdGlvbk91'
    'dHB1dFIPcHJldmlvdXNPdXRwdXRz');

@$core.Deprecated('Use exitSingleNodeTreesResponseDescriptor instead')
const ExitSingleNodeTreesResponse$json = {
  '1': 'ExitSingleNodeTreesResponse',
  '2': [
    {
      '1': 'signing_results',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.ExitSingleNodeTreeSigningResult',
      '10': 'signingResults'
    },
  ],
};

/// Descriptor for `ExitSingleNodeTreesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exitSingleNodeTreesResponseDescriptor =
    $convert.base64Decode(
        'ChtFeGl0U2luZ2xlTm9kZVRyZWVzUmVzcG9uc2USTwoPc2lnbmluZ19yZXN1bHRzGAEgAygLMi'
        'Yuc3BhcmsuRXhpdFNpbmdsZU5vZGVUcmVlU2lnbmluZ1Jlc3VsdFIOc2lnbmluZ1Jlc3VsdHM=');

@$core.Deprecated('Use queryNodesDistributionRequestDescriptor instead')
const QueryNodesDistributionRequest$json = {
  '1': 'QueryNodesDistributionRequest',
  '2': [
    {
      '1': 'owner_identity_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'ownerIdentityPublicKey'
    },
  ],
};

/// Descriptor for `QueryNodesDistributionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryNodesDistributionRequestDescriptor =
    $convert.base64Decode(
        'Ch1RdWVyeU5vZGVzRGlzdHJpYnV0aW9uUmVxdWVzdBI5Chlvd25lcl9pZGVudGl0eV9wdWJsaW'
        'Nfa2V5GAEgASgMUhZvd25lcklkZW50aXR5UHVibGljS2V5');

@$core.Deprecated('Use queryNodesDistributionResponseDescriptor instead')
const QueryNodesDistributionResponse$json = {
  '1': 'QueryNodesDistributionResponse',
  '2': [
    {
      '1': 'node_distribution',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.QueryNodesDistributionResponse.NodeDistributionEntry',
      '10': 'nodeDistribution'
    },
  ],
  '3': [QueryNodesDistributionResponse_NodeDistributionEntry$json],
};

@$core.Deprecated('Use queryNodesDistributionResponseDescriptor instead')
const QueryNodesDistributionResponse_NodeDistributionEntry$json = {
  '1': 'NodeDistributionEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 4, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 4, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `QueryNodesDistributionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryNodesDistributionResponseDescriptor =
    $convert.base64Decode(
        'Ch5RdWVyeU5vZGVzRGlzdHJpYnV0aW9uUmVzcG9uc2USaAoRbm9kZV9kaXN0cmlidXRpb24YAS'
        'ADKAsyOy5zcGFyay5RdWVyeU5vZGVzRGlzdHJpYnV0aW9uUmVzcG9uc2UuTm9kZURpc3RyaWJ1'
        'dGlvbkVudHJ5UhBub2RlRGlzdHJpYnV0aW9uGkMKFU5vZGVEaXN0cmlidXRpb25FbnRyeRIQCg'
        'NrZXkYASABKARSA2tleRIUCgV2YWx1ZRgCIAEoBFIFdmFsdWU6AjgB');

@$core.Deprecated('Use queryNodesByValueRequestDescriptor instead')
const QueryNodesByValueRequest$json = {
  '1': 'QueryNodesByValueRequest',
  '2': [
    {
      '1': 'owner_identity_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'ownerIdentityPublicKey'
    },
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
    {'1': 'offset', '3': 3, '4': 1, '5': 3, '10': 'offset'},
    {'1': 'limit', '3': 4, '4': 1, '5': 3, '10': 'limit'},
  ],
};

/// Descriptor for `QueryNodesByValueRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryNodesByValueRequestDescriptor = $convert.base64Decode(
    'ChhRdWVyeU5vZGVzQnlWYWx1ZVJlcXVlc3QSOQoZb3duZXJfaWRlbnRpdHlfcHVibGljX2tleR'
    'gBIAEoDFIWb3duZXJJZGVudGl0eVB1YmxpY0tleRIUCgV2YWx1ZRgCIAEoA1IFdmFsdWUSFgoG'
    'b2Zmc2V0GAMgASgDUgZvZmZzZXQSFAoFbGltaXQYBCABKANSBWxpbWl0');

@$core.Deprecated('Use queryNodesByValueResponseDescriptor instead')
const QueryNodesByValueResponse$json = {
  '1': 'QueryNodesByValueResponse',
  '2': [
    {
      '1': 'nodes',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.QueryNodesByValueResponse.NodesEntry',
      '10': 'nodes'
    },
    {'1': 'offset', '3': 2, '4': 1, '5': 3, '10': 'offset'},
  ],
  '3': [QueryNodesByValueResponse_NodesEntry$json],
};

@$core.Deprecated('Use queryNodesByValueResponseDescriptor instead')
const QueryNodesByValueResponse_NodesEntry$json = {
  '1': 'NodesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.TreeNode',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `QueryNodesByValueResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryNodesByValueResponseDescriptor = $convert.base64Decode(
    'ChlRdWVyeU5vZGVzQnlWYWx1ZVJlc3BvbnNlEkEKBW5vZGVzGAEgAygLMisuc3BhcmsuUXVlcn'
    'lOb2Rlc0J5VmFsdWVSZXNwb25zZS5Ob2Rlc0VudHJ5UgVub2RlcxIWCgZvZmZzZXQYAiABKANS'
    'Bm9mZnNldBpJCgpOb2Rlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EiUKBXZhbHVlGAIgASgLMg'
    '8uc3BhcmsuVHJlZU5vZGVSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use getUtxosForAddressRequestDescriptor instead')
const GetUtxosForAddressRequest$json = {
  '1': 'GetUtxosForAddressRequest',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    {'1': 'offset', '3': 2, '4': 1, '5': 4, '10': 'offset'},
    {'1': 'limit', '3': 3, '4': 1, '5': 4, '10': 'limit'},
    {
      '1': 'network',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.spark.Network',
      '10': 'network'
    },
    {'1': 'exclude_claimed', '3': 5, '4': 1, '5': 8, '10': 'excludeClaimed'},
  ],
};

/// Descriptor for `GetUtxosForAddressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUtxosForAddressRequestDescriptor = $convert.base64Decode(
    'ChlHZXRVdHhvc0ZvckFkZHJlc3NSZXF1ZXN0EhgKB2FkZHJlc3MYASABKAlSB2FkZHJlc3MSFg'
    'oGb2Zmc2V0GAIgASgEUgZvZmZzZXQSFAoFbGltaXQYAyABKARSBWxpbWl0EigKB25ldHdvcmsY'
    'BCABKA4yDi5zcGFyay5OZXR3b3JrUgduZXR3b3JrEicKD2V4Y2x1ZGVfY2xhaW1lZBgFIAEoCF'
    'IOZXhjbHVkZUNsYWltZWQ=');

@$core.Deprecated('Use getUtxosForAddressResponseDescriptor instead')
const GetUtxosForAddressResponse$json = {
  '1': 'GetUtxosForAddressResponse',
  '2': [
    {'1': 'utxos', '3': 1, '4': 3, '5': 11, '6': '.spark.UTXO', '10': 'utxos'},
    {'1': 'offset', '3': 2, '4': 1, '5': 4, '10': 'offset'},
  ],
};

/// Descriptor for `GetUtxosForAddressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUtxosForAddressResponseDescriptor =
    $convert.base64Decode(
        'ChpHZXRVdHhvc0ZvckFkZHJlc3NSZXNwb25zZRIhCgV1dHhvcxgBIAMoCzILLnNwYXJrLlVUWE'
        '9SBXV0eG9zEhYKBm9mZnNldBgCIAEoBFIGb2Zmc2V0');

@$core.Deprecated('Use getUtxosForIdentityRequestDescriptor instead')
const GetUtxosForIdentityRequest$json = {
  '1': 'GetUtxosForIdentityRequest',
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
      '1': 'network',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.spark.Network',
      '8': {},
      '10': 'network'
    },
    {'1': 'exclude_claimed', '3': 3, '4': 1, '5': 8, '10': 'excludeClaimed'},
    {
      '1': 'page',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark.PageRequest',
      '10': 'page'
    },
    {'1': 'include_pending', '3': 5, '4': 1, '5': 8, '10': 'includePending'},
  ],
};

/// Descriptor for `GetUtxosForIdentityRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUtxosForIdentityRequestDescriptor = $convert.base64Decode(
    'ChpHZXRVdHhvc0ZvcklkZW50aXR5UmVxdWVzdBI3ChNpZGVudGl0eV9wdWJsaWNfa2V5GAEgAS'
    'gMQgf6QgR6AmghUhFpZGVudGl0eVB1YmxpY0tleRIyCgduZXR3b3JrGAIgASgOMg4uc3Bhcmsu'
    'TmV0d29ya0II+kIFggECIABSB25ldHdvcmsSJwoPZXhjbHVkZV9jbGFpbWVkGAMgASgIUg5leG'
    'NsdWRlQ2xhaW1lZBImCgRwYWdlGAQgASgLMhIuc3BhcmsuUGFnZVJlcXVlc3RSBHBhZ2USJwoP'
    'aW5jbHVkZV9wZW5kaW5nGAUgASgIUg5pbmNsdWRlUGVuZGluZw==');

@$core.Deprecated('Use getUtxosForIdentityResponseDescriptor instead')
const GetUtxosForIdentityResponse$json = {
  '1': 'GetUtxosForIdentityResponse',
  '2': [
    {
      '1': 'utxos',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.AddressedUtxo',
      '10': 'utxos'
    },
    {
      '1': 'page',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.PageResponse',
      '10': 'page'
    },
  ],
};

/// Descriptor for `GetUtxosForIdentityResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUtxosForIdentityResponseDescriptor =
    $convert.base64Decode(
        'ChtHZXRVdHhvc0ZvcklkZW50aXR5UmVzcG9uc2USKgoFdXR4b3MYASADKAsyFC5zcGFyay5BZG'
        'RyZXNzZWRVdHhvUgV1dHhvcxInCgRwYWdlGAIgASgLMhMuc3BhcmsuUGFnZVJlc3BvbnNlUgRw'
        'YWdl');

@$core.Deprecated('Use querySparkInvoicesRequestDescriptor instead')
const QuerySparkInvoicesRequest$json = {
  '1': 'QuerySparkInvoicesRequest',
  '2': [
    {'1': 'limit', '3': 1, '4': 1, '5': 3, '10': 'limit'},
    {'1': 'offset', '3': 2, '4': 1, '5': 3, '10': 'offset'},
    {'1': 'invoice', '3': 3, '4': 3, '5': 9, '10': 'invoice'},
  ],
};

/// Descriptor for `QuerySparkInvoicesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List querySparkInvoicesRequestDescriptor =
    $convert.base64Decode(
        'ChlRdWVyeVNwYXJrSW52b2ljZXNSZXF1ZXN0EhQKBWxpbWl0GAEgASgDUgVsaW1pdBIWCgZvZm'
        'ZzZXQYAiABKANSBm9mZnNldBIYCgdpbnZvaWNlGAMgAygJUgdpbnZvaWNl');

@$core.Deprecated('Use querySparkInvoicesResponseDescriptor instead')
const QuerySparkInvoicesResponse$json = {
  '1': 'QuerySparkInvoicesResponse',
  '2': [
    {'1': 'offset', '3': 1, '4': 1, '5': 3, '10': 'offset'},
    {
      '1': 'invoice_statuses',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark.InvoiceResponse',
      '10': 'invoiceStatuses'
    },
  ],
};

/// Descriptor for `QuerySparkInvoicesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List querySparkInvoicesResponseDescriptor =
    $convert.base64Decode(
        'ChpRdWVyeVNwYXJrSW52b2ljZXNSZXNwb25zZRIWCgZvZmZzZXQYASABKANSBm9mZnNldBJBCh'
        'BpbnZvaWNlX3N0YXR1c2VzGAIgAygLMhYuc3BhcmsuSW52b2ljZVJlc3BvbnNlUg9pbnZvaWNl'
        'U3RhdHVzZXM=');

@$core.Deprecated('Use invoiceResponseDescriptor instead')
const InvoiceResponse$json = {
  '1': 'InvoiceResponse',
  '2': [
    {'1': 'invoice', '3': 1, '4': 1, '5': 9, '10': 'invoice'},
    {
      '1': 'status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.spark.InvoiceStatus',
      '10': 'status'
    },
    {
      '1': 'sats_transfer',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.spark.SatsTransfer',
      '9': 0,
      '10': 'satsTransfer'
    },
    {
      '1': 'token_transfer',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark.TokenTransfer',
      '9': 0,
      '10': 'tokenTransfer'
    },
  ],
  '8': [
    {'1': 'transfer_type'},
  ],
};

/// Descriptor for `InvoiceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List invoiceResponseDescriptor = $convert.base64Decode(
    'Cg9JbnZvaWNlUmVzcG9uc2USGAoHaW52b2ljZRgBIAEoCVIHaW52b2ljZRIsCgZzdGF0dXMYAi'
    'ABKA4yFC5zcGFyay5JbnZvaWNlU3RhdHVzUgZzdGF0dXMSOgoNc2F0c190cmFuc2ZlchgDIAEo'
    'CzITLnNwYXJrLlNhdHNUcmFuc2ZlckgAUgxzYXRzVHJhbnNmZXISPQoOdG9rZW5fdHJhbnNmZX'
    'IYBCABKAsyFC5zcGFyay5Ub2tlblRyYW5zZmVySABSDXRva2VuVHJhbnNmZXJCDwoNdHJhbnNm'
    'ZXJfdHlwZQ==');

@$core.Deprecated('Use satsTransferDescriptor instead')
const SatsTransfer$json = {
  '1': 'SatsTransfer',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 12, '8': {}, '10': 'transferId'},
  ],
};

/// Descriptor for `SatsTransfer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List satsTransferDescriptor = $convert.base64Decode(
    'CgxTYXRzVHJhbnNmZXISKAoLdHJhbnNmZXJfaWQYASABKAxCB/pCBHoCaBBSCnRyYW5zZmVySW'
    'Q=');

@$core.Deprecated('Use tokenTransferDescriptor instead')
const TokenTransfer$json = {
  '1': 'TokenTransfer',
  '2': [
    {
      '1': 'final_token_transaction_hash',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'finalTokenTransactionHash'
    },
  ],
};

/// Descriptor for `TokenTransfer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenTransferDescriptor = $convert.base64Decode(
    'Cg1Ub2tlblRyYW5zZmVyEkgKHGZpbmFsX3Rva2VuX3RyYW5zYWN0aW9uX2hhc2gYASABKAxCB/'
    'pCBHoCaCBSGWZpbmFsVG9rZW5UcmFuc2FjdGlvbkhhc2g=');

@$core.Deprecated('Use initiateSwapPrimaryTransferRequestDescriptor instead')
const InitiateSwapPrimaryTransferRequest$json = {
  '1': 'InitiateSwapPrimaryTransferRequest',
  '2': [
    {
      '1': 'transfer',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.StartTransferRequest',
      '10': 'transfer'
    },
    {
      '1': 'adaptor_public_keys',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.AdaptorPublicKeyPackage',
      '10': 'adaptorPublicKeys'
    },
  ],
};

/// Descriptor for `InitiateSwapPrimaryTransferRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiateSwapPrimaryTransferRequestDescriptor =
    $convert.base64Decode(
        'CiJJbml0aWF0ZVN3YXBQcmltYXJ5VHJhbnNmZXJSZXF1ZXN0EjcKCHRyYW5zZmVyGAEgASgLMh'
        'suc3BhcmsuU3RhcnRUcmFuc2ZlclJlcXVlc3RSCHRyYW5zZmVyEk4KE2FkYXB0b3JfcHVibGlj'
        'X2tleXMYAiABKAsyHi5zcGFyay5BZGFwdG9yUHVibGljS2V5UGFja2FnZVIRYWRhcHRvclB1Ym'
        'xpY0tleXM=');

@$core.Deprecated('Use initiateSwapPrimaryTransferResponseDescriptor instead')
const InitiateSwapPrimaryTransferResponse$json = {
  '1': 'InitiateSwapPrimaryTransferResponse',
  '2': [
    {
      '1': 'transfer',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.Transfer',
      '10': 'transfer'
    },
    {
      '1': 'signing_results',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark.LeafRefundTxSigningResult',
      '10': 'signingResults'
    },
  ],
};

/// Descriptor for `InitiateSwapPrimaryTransferResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiateSwapPrimaryTransferResponseDescriptor =
    $convert.base64Decode(
        'CiNJbml0aWF0ZVN3YXBQcmltYXJ5VHJhbnNmZXJSZXNwb25zZRIrCgh0cmFuc2ZlchgBIAEoCz'
        'IPLnNwYXJrLlRyYW5zZmVyUgh0cmFuc2ZlchJJCg9zaWduaW5nX3Jlc3VsdHMYAiADKAsyIC5z'
        'cGFyay5MZWFmUmVmdW5kVHhTaWduaW5nUmVzdWx0Ug5zaWduaW5nUmVzdWx0cw==');

@$core.Deprecated('Use adaptorPublicKeyPackageDescriptor instead')
const AdaptorPublicKeyPackage$json = {
  '1': 'AdaptorPublicKeyPackage',
  '2': [
    {
      '1': 'adaptor_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'adaptorPublicKey'
    },
    {
      '1': 'direct_adaptor_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'directAdaptorPublicKey'
    },
    {
      '1': 'direct_from_cpfp_adaptor_public_key',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'directFromCpfpAdaptorPublicKey'
    },
  ],
};

/// Descriptor for `AdaptorPublicKeyPackage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adaptorPublicKeyPackageDescriptor = $convert.base64Decode(
    'ChdBZGFwdG9yUHVibGljS2V5UGFja2FnZRIsChJhZGFwdG9yX3B1YmxpY19rZXkYASABKAxSEG'
    'FkYXB0b3JQdWJsaWNLZXkSOQoZZGlyZWN0X2FkYXB0b3JfcHVibGljX2tleRgCIAEoDFIWZGly'
    'ZWN0QWRhcHRvclB1YmxpY0tleRJLCiNkaXJlY3RfZnJvbV9jcGZwX2FkYXB0b3JfcHVibGljX2'
    'tleRgDIAEoDFIeZGlyZWN0RnJvbUNwZnBBZGFwdG9yUHVibGljS2V5');

@$core.Deprecated('Use walletSettingDescriptor instead')
const WalletSetting$json = {
  '1': 'WalletSetting',
  '2': [
    {
      '1': 'owner_identity_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '8': {},
      '10': 'ownerIdentityPublicKey'
    },
    {'1': 'private_enabled', '3': 2, '4': 1, '5': 8, '10': 'privateEnabled'},
    {
      '1': 'master_identity_public_key',
      '3': 3,
      '4': 1,
      '5': 12,
      '8': {},
      '9': 0,
      '10': 'masterIdentityPublicKey',
      '17': true
    },
  ],
  '8': [
    {'1': '_master_identity_public_key'},
  ],
};

/// Descriptor for `WalletSetting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List walletSettingDescriptor = $convert.base64Decode(
    'Cg1XYWxsZXRTZXR0aW5nEkIKGW93bmVyX2lkZW50aXR5X3B1YmxpY19rZXkYASABKAxCB/pCBH'
    'oCaCFSFm93bmVySWRlbnRpdHlQdWJsaWNLZXkSJwoPcHJpdmF0ZV9lbmFibGVkGAIgASgIUg5w'
    'cml2YXRlRW5hYmxlZBJJChptYXN0ZXJfaWRlbnRpdHlfcHVibGljX2tleRgDIAEoDEIH+kIEeg'
    'JoIUgAUhdtYXN0ZXJJZGVudGl0eVB1YmxpY0tleYgBAUIdChtfbWFzdGVyX2lkZW50aXR5X3B1'
    'YmxpY19rZXk=');

@$core.Deprecated('Use updateWalletSettingRequestDescriptor instead')
const UpdateWalletSettingRequest$json = {
  '1': 'UpdateWalletSettingRequest',
  '2': [
    {
      '1': 'private_enabled',
      '3': 1,
      '4': 1,
      '5': 8,
      '9': 1,
      '10': 'privateEnabled',
      '17': true
    },
    {
      '1': 'set_master_identity_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'setMasterIdentityPublicKey'
    },
    {
      '1': 'clear_master_identity_public_key',
      '3': 3,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'clearMasterIdentityPublicKey'
    },
  ],
  '8': [
    {'1': 'master_identity_public_key'},
    {'1': '_private_enabled'},
  ],
};

/// Descriptor for `UpdateWalletSettingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateWalletSettingRequestDescriptor = $convert.base64Decode(
    'ChpVcGRhdGVXYWxsZXRTZXR0aW5nUmVxdWVzdBIsCg9wcml2YXRlX2VuYWJsZWQYASABKAhIAV'
    'IOcHJpdmF0ZUVuYWJsZWSIAQESRAoec2V0X21hc3Rlcl9pZGVudGl0eV9wdWJsaWNfa2V5GAIg'
    'ASgMSABSGnNldE1hc3RlcklkZW50aXR5UHVibGljS2V5EkgKIGNsZWFyX21hc3Rlcl9pZGVudG'
    'l0eV9wdWJsaWNfa2V5GAMgASgISABSHGNsZWFyTWFzdGVySWRlbnRpdHlQdWJsaWNLZXlCHAoa'
    'bWFzdGVyX2lkZW50aXR5X3B1YmxpY19rZXlCEgoQX3ByaXZhdGVfZW5hYmxlZA==');

@$core.Deprecated('Use updateWalletSettingResponseDescriptor instead')
const UpdateWalletSettingResponse$json = {
  '1': 'UpdateWalletSettingResponse',
  '2': [
    {
      '1': 'wallet_setting',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.WalletSetting',
      '10': 'walletSetting'
    },
  ],
};

/// Descriptor for `UpdateWalletSettingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateWalletSettingResponseDescriptor =
    $convert.base64Decode(
        'ChtVcGRhdGVXYWxsZXRTZXR0aW5nUmVzcG9uc2USOwoOd2FsbGV0X3NldHRpbmcYASABKAsyFC'
        '5zcGFyay5XYWxsZXRTZXR0aW5nUg13YWxsZXRTZXR0aW5n');

@$core.Deprecated('Use queryWalletSettingRequestDescriptor instead')
const QueryWalletSettingRequest$json = {
  '1': 'QueryWalletSettingRequest',
};

/// Descriptor for `QueryWalletSettingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryWalletSettingRequestDescriptor =
    $convert.base64Decode('ChlRdWVyeVdhbGxldFNldHRpbmdSZXF1ZXN0');

@$core.Deprecated('Use queryWalletSettingResponseDescriptor instead')
const QueryWalletSettingResponse$json = {
  '1': 'QueryWalletSettingResponse',
  '2': [
    {
      '1': 'wallet_setting',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.WalletSetting',
      '10': 'walletSetting'
    },
  ],
};

/// Descriptor for `QueryWalletSettingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryWalletSettingResponseDescriptor =
    $convert.base64Decode(
        'ChpRdWVyeVdhbGxldFNldHRpbmdSZXNwb25zZRI7Cg53YWxsZXRfc2V0dGluZxgBIAEoCzIULn'
        'NwYXJrLldhbGxldFNldHRpbmdSDXdhbGxldFNldHRpbmc=');

@$core.Deprecated('Use querySparkTransactionVolumesRequestDescriptor instead')
const QuerySparkTransactionVolumesRequest$json = {
  '1': 'QuerySparkTransactionVolumesRequest',
  '2': [
    {'1': 'start_date', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'startDate'},
    {'1': 'end_date', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'endDate'},
    {
      '1': 'transaction_types',
      '3': 3,
      '4': 3,
      '5': 14,
      '6': '.spark.SparkTransactionType',
      '8': {},
      '10': 'transactionTypes'
    },
    {
      '1': 'network',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.spark.Network',
      '8': {},
      '9': 0,
      '10': 'network',
      '17': true
    },
  ],
  '8': [
    {'1': '_network'},
  ],
};

/// Descriptor for `QuerySparkTransactionVolumesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List querySparkTransactionVolumesRequestDescriptor = $convert.base64Decode(
    'CiNRdWVyeVNwYXJrVHJhbnNhY3Rpb25Wb2x1bWVzUmVxdWVzdBJFCgpzdGFydF9kYXRlGAEgAS'
    'gJQib6QiNyITIcXlswLTldezR9LVswLTldezJ9LVswLTldezJ9JJgBClIJc3RhcnREYXRlEkEK'
    'CGVuZF9kYXRlGAIgASgJQib6QiNyITIcXlswLTldezR9LVswLTldezJ9LVswLTldezJ9JJgBCl'
    'IHZW5kRGF0ZRJZChF0cmFuc2FjdGlvbl90eXBlcxgDIAMoDjIbLnNwYXJrLlNwYXJrVHJhbnNh'
    'Y3Rpb25UeXBlQg/6QgySAQkiB4IBBBABIABSEHRyYW5zYWN0aW9uVHlwZXMSOQoHbmV0d29yax'
    'gEIAEoDjIOLnNwYXJrLk5ldHdvcmtCCvpCB4IBBBABIABIAFIHbmV0d29ya4gBAUIKCghfbmV0'
    'd29yaw==');

@$core.Deprecated('Use sparkTransactionVolumeDescriptor instead')
const SparkTransactionVolume$json = {
  '1': 'SparkTransactionVolume',
  '2': [
    {
      '1': 'transaction_type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.spark.SparkTransactionType',
      '10': 'transactionType'
    },
    {'1': 'volume_sats', '3': 2, '4': 1, '5': 3, '10': 'volumeSats'},
    {
      '1': 'transaction_count',
      '3': 3,
      '4': 1,
      '5': 3,
      '10': 'transactionCount'
    },
  ],
};

/// Descriptor for `SparkTransactionVolume`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sparkTransactionVolumeDescriptor = $convert.base64Decode(
    'ChZTcGFya1RyYW5zYWN0aW9uVm9sdW1lEkYKEHRyYW5zYWN0aW9uX3R5cGUYASABKA4yGy5zcG'
    'Fyay5TcGFya1RyYW5zYWN0aW9uVHlwZVIPdHJhbnNhY3Rpb25UeXBlEh8KC3ZvbHVtZV9zYXRz'
    'GAIgASgDUgp2b2x1bWVTYXRzEisKEXRyYW5zYWN0aW9uX2NvdW50GAMgASgDUhB0cmFuc2FjdG'
    'lvbkNvdW50');

@$core.Deprecated('Use querySparkTransactionVolumesResponseDescriptor instead')
const QuerySparkTransactionVolumesResponse$json = {
  '1': 'QuerySparkTransactionVolumesResponse',
  '2': [
    {'1': 'partner_id', '3': 1, '4': 1, '5': 9, '10': 'partnerId'},
    {'1': 'label', '3': 2, '4': 1, '5': 9, '10': 'label'},
    {'1': 'start_date', '3': 3, '4': 1, '5': 9, '10': 'startDate'},
    {'1': 'end_date', '3': 4, '4': 1, '5': 9, '10': 'endDate'},
    {
      '1': 'transaction_types',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.spark.SparkTransactionVolume',
      '10': 'transactionTypes'
    },
    {'1': 'total_volume_sats', '3': 6, '4': 1, '5': 3, '10': 'totalVolumeSats'},
    {
      '1': 'total_transaction_count',
      '3': 7,
      '4': 1,
      '5': 3,
      '10': 'totalTransactionCount'
    },
  ],
};

/// Descriptor for `QuerySparkTransactionVolumesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List querySparkTransactionVolumesResponseDescriptor = $convert.base64Decode(
    'CiRRdWVyeVNwYXJrVHJhbnNhY3Rpb25Wb2x1bWVzUmVzcG9uc2USHQoKcGFydG5lcl9pZBgBIA'
    'EoCVIJcGFydG5lcklkEhQKBWxhYmVsGAIgASgJUgVsYWJlbBIdCgpzdGFydF9kYXRlGAMgASgJ'
    'UglzdGFydERhdGUSGQoIZW5kX2RhdGUYBCABKAlSB2VuZERhdGUSSgoRdHJhbnNhY3Rpb25fdH'
    'lwZXMYBSADKAsyHS5zcGFyay5TcGFya1RyYW5zYWN0aW9uVm9sdW1lUhB0cmFuc2FjdGlvblR5'
    'cGVzEioKEXRvdGFsX3ZvbHVtZV9zYXRzGAYgASgDUg90b3RhbFZvbHVtZVNhdHMSNgoXdG90YW'
    'xfdHJhbnNhY3Rpb25fY291bnQYByABKANSFXRvdGFsVHJhbnNhY3Rpb25Db3VudA==');
