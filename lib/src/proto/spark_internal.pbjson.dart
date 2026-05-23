// This is a generated file - do not edit.
//
// Generated from spark_internal.proto.

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

@$core.Deprecated('Use settleKeyTweakActionDescriptor instead')
const SettleKeyTweakAction$json = {
  '1': 'SettleKeyTweakAction',
  '2': [
    {'1': 'NONE', '2': 0},
    {'1': 'COMMIT', '2': 1},
    {'1': 'ROLLBACK', '2': 2},
  ],
};

/// Descriptor for `SettleKeyTweakAction`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List settleKeyTweakActionDescriptor = $convert.base64Decode(
    'ChRTZXR0bGVLZXlUd2Vha0FjdGlvbhIICgROT05FEAASCgoGQ09NTUlUEAESDAoIUk9MTEJBQ0'
    'sQAg==');

@$core.Deprecated('Use markKeysharesAsUsedRequestDescriptor instead')
const MarkKeysharesAsUsedRequest$json = {
  '1': 'MarkKeysharesAsUsedRequest',
  '2': [
    {'1': 'keyshare_id', '3': 1, '4': 3, '5': 9, '10': 'keyshareId'},
  ],
};

/// Descriptor for `MarkKeysharesAsUsedRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markKeysharesAsUsedRequestDescriptor =
    $convert.base64Decode(
        'ChpNYXJrS2V5c2hhcmVzQXNVc2VkUmVxdWVzdBIfCgtrZXlzaGFyZV9pZBgBIAMoCVIKa2V5c2'
        'hhcmVJZA==');

@$core.Deprecated('Use markKeyshareForDepositAddressRequestDescriptor instead')
const MarkKeyshareForDepositAddressRequest$json = {
  '1': 'MarkKeyshareForDepositAddressRequest',
  '2': [
    {'1': 'keyshare_id', '3': 1, '4': 1, '5': 9, '10': 'keyshareId'},
    {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
    {
      '1': 'owner_identity_public_key',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'ownerIdentityPublicKey'
    },
    {
      '1': 'owner_signing_public_key',
      '3': 4,
      '4': 1,
      '5': 12,
      '10': 'ownerSigningPublicKey'
    },
    {
      '1': 'is_static',
      '3': 5,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'isStatic',
      '17': true
    },
  ],
  '8': [
    {'1': '_is_static'},
  ],
};

/// Descriptor for `MarkKeyshareForDepositAddressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markKeyshareForDepositAddressRequestDescriptor =
    $convert.base64Decode(
        'CiRNYXJrS2V5c2hhcmVGb3JEZXBvc2l0QWRkcmVzc1JlcXVlc3QSHwoLa2V5c2hhcmVfaWQYAS'
        'ABKAlSCmtleXNoYXJlSWQSGAoHYWRkcmVzcxgCIAEoCVIHYWRkcmVzcxI5Chlvd25lcl9pZGVu'
        'dGl0eV9wdWJsaWNfa2V5GAMgASgMUhZvd25lcklkZW50aXR5UHVibGljS2V5EjcKGG93bmVyX3'
        'NpZ25pbmdfcHVibGljX2tleRgEIAEoDFIVb3duZXJTaWduaW5nUHVibGljS2V5EiAKCWlzX3N0'
        'YXRpYxgFIAEoCEgAUghpc1N0YXRpY4gBAUIMCgpfaXNfc3RhdGlj');

@$core.Deprecated('Use markKeyshareForDepositAddressResponseDescriptor instead')
const MarkKeyshareForDepositAddressResponse$json = {
  '1': 'MarkKeyshareForDepositAddressResponse',
  '2': [
    {
      '1': 'address_signature',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'addressSignature'
    },
  ],
};

/// Descriptor for `MarkKeyshareForDepositAddressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markKeyshareForDepositAddressResponseDescriptor =
    $convert.base64Decode(
        'CiVNYXJrS2V5c2hhcmVGb3JEZXBvc2l0QWRkcmVzc1Jlc3BvbnNlEisKEWFkZHJlc3Nfc2lnbm'
        'F0dXJlGAEgASgMUhBhZGRyZXNzU2lnbmF0dXJl');

@$core.Deprecated('Use frostRound1RequestDescriptor instead')
const FrostRound1Request$json = {
  '1': 'FrostRound1Request',
  '2': [
    {
      '1': 'keyshare_ids',
      '3': 1,
      '4': 3,
      '5': 9,
      '8': {'3': true},
      '10': 'keyshareIds',
    },
    {
      '1': 'public_keys',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark_internal.FrostRound1Request.PublicKeysEntry',
      '8': {'3': true},
      '10': 'publicKeys',
    },
    {
      '1': 'count',
      '3': 3,
      '4': 1,
      '5': 13,
      '8': {'3': true},
      '10': 'count',
    },
    {
      '1': 'random_nonce_count',
      '3': 4,
      '4': 1,
      '5': 13,
      '10': 'randomNonceCount'
    },
  ],
  '3': [FrostRound1Request_PublicKeysEntry$json],
};

@$core.Deprecated('Use frostRound1RequestDescriptor instead')
const FrostRound1Request_PublicKeysEntry$json = {
  '1': 'PublicKeysEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `FrostRound1Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List frostRound1RequestDescriptor = $convert.base64Decode(
    'ChJGcm9zdFJvdW5kMVJlcXVlc3QSJQoMa2V5c2hhcmVfaWRzGAEgAygJQgIYAVILa2V5c2hhcm'
    'VJZHMSVwoLcHVibGljX2tleXMYAiADKAsyMi5zcGFya19pbnRlcm5hbC5Gcm9zdFJvdW5kMVJl'
    'cXVlc3QuUHVibGljS2V5c0VudHJ5QgIYAVIKcHVibGljS2V5cxIYCgVjb3VudBgDIAEoDUICGA'
    'FSBWNvdW50EiwKEnJhbmRvbV9ub25jZV9jb3VudBgEIAEoDVIQcmFuZG9tTm9uY2VDb3VudBo9'
    'Cg9QdWJsaWNLZXlzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAxSBXZhbH'
    'VlOgI4AQ==');

@$core.Deprecated('Use frostRound1ResponseDescriptor instead')
const FrostRound1Response$json = {
  '1': 'FrostRound1Response',
  '2': [
    {
      '1': 'signing_commitments',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.common.SigningCommitment',
      '10': 'signingCommitments'
    },
  ],
};

/// Descriptor for `FrostRound1Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List frostRound1ResponseDescriptor = $convert.base64Decode(
    'ChNGcm9zdFJvdW5kMVJlc3BvbnNlEkoKE3NpZ25pbmdfY29tbWl0bWVudHMYASADKAsyGS5jb2'
    '1tb24uU2lnbmluZ0NvbW1pdG1lbnRSEnNpZ25pbmdDb21taXRtZW50cw==');

@$core.Deprecated('Use signingJobDescriptor instead')
const SigningJob$json = {
  '1': 'SigningJob',
  '2': [
    {'1': 'job_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'jobId'},
    {'1': 'message', '3': 2, '4': 1, '5': 12, '10': 'message'},
    {'1': 'keyshare_id', '3': 3, '4': 1, '5': 9, '10': 'keyshareId'},
    {'1': 'verifying_key', '3': 4, '4': 1, '5': 12, '10': 'verifyingKey'},
    {
      '1': 'commitments',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.spark_internal.SigningJob.CommitmentsEntry',
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
    {
      '1': 'adaptor_public_key',
      '3': 7,
      '4': 1,
      '5': 12,
      '10': 'adaptorPublicKey'
    },
  ],
  '3': [SigningJob_CommitmentsEntry$json],
};

@$core.Deprecated('Use signingJobDescriptor instead')
const SigningJob_CommitmentsEntry$json = {
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

/// Descriptor for `SigningJob`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingJobDescriptor = $convert.base64Decode(
    'CgpTaWduaW5nSm9iEh8KBmpvYl9pZBgBIAEoCUII+kIFcgOwAQFSBWpvYklkEhgKB21lc3NhZ2'
    'UYAiABKAxSB21lc3NhZ2USHwoLa2V5c2hhcmVfaWQYAyABKAlSCmtleXNoYXJlSWQSIwoNdmVy'
    'aWZ5aW5nX2tleRgEIAEoDFIMdmVyaWZ5aW5nS2V5Ek0KC2NvbW1pdG1lbnRzGAUgAygLMisuc3'
    'BhcmtfaW50ZXJuYWwuU2lnbmluZ0pvYi5Db21taXRtZW50c0VudHJ5Ugtjb21taXRtZW50cxJE'
    'ChB1c2VyX2NvbW1pdG1lbnRzGAYgASgLMhkuY29tbW9uLlNpZ25pbmdDb21taXRtZW50Ug91c2'
    'VyQ29tbWl0bWVudHMSLAoSYWRhcHRvcl9wdWJsaWNfa2V5GAcgASgMUhBhZGFwdG9yUHVibGlj'
    'S2V5GlkKEENvbW1pdG1lbnRzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSLwoFdmFsdWUYAiABKA'
    'syGS5jb21tb24uU2lnbmluZ0NvbW1pdG1lbnRSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use frostRound2RequestDescriptor instead')
const FrostRound2Request$json = {
  '1': 'FrostRound2Request',
  '2': [
    {
      '1': 'signing_jobs',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark_internal.SigningJob',
      '10': 'signingJobs'
    },
  ],
};

/// Descriptor for `FrostRound2Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List frostRound2RequestDescriptor = $convert.base64Decode(
    'ChJGcm9zdFJvdW5kMlJlcXVlc3QSPQoMc2lnbmluZ19qb2JzGAEgAygLMhouc3BhcmtfaW50ZX'
    'JuYWwuU2lnbmluZ0pvYlILc2lnbmluZ0pvYnM=');

@$core.Deprecated('Use frostRound2ResponseDescriptor instead')
const FrostRound2Response$json = {
  '1': 'FrostRound2Response',
  '2': [
    {
      '1': 'results',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark_internal.FrostRound2Response.ResultsEntry',
      '10': 'results'
    },
  ],
  '3': [FrostRound2Response_ResultsEntry$json],
};

@$core.Deprecated('Use frostRound2ResponseDescriptor instead')
const FrostRound2Response_ResultsEntry$json = {
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

/// Descriptor for `FrostRound2Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List frostRound2ResponseDescriptor = $convert.base64Decode(
    'ChNGcm9zdFJvdW5kMlJlc3BvbnNlEkoKB3Jlc3VsdHMYASADKAsyMC5zcGFya19pbnRlcm5hbC'
    '5Gcm9zdFJvdW5kMlJlc3BvbnNlLlJlc3VsdHNFbnRyeVIHcmVzdWx0cxpRCgxSZXN1bHRzRW50'
    'cnkSEAoDa2V5GAEgASgJUgNrZXkSKwoFdmFsdWUYAiABKAsyFS5jb21tb24uU2lnbmluZ1Jlc3'
    'VsdFIFdmFsdWU6AjgB');

@$core.Deprecated('Use finalizeTreeCreationRequestDescriptor instead')
const FinalizeTreeCreationRequest$json = {
  '1': 'FinalizeTreeCreationRequest',
  '2': [
    {
      '1': 'nodes',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark_internal.TreeNode',
      '10': 'nodes'
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

/// Descriptor for `FinalizeTreeCreationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List finalizeTreeCreationRequestDescriptor =
    $convert.base64Decode(
        'ChtGaW5hbGl6ZVRyZWVDcmVhdGlvblJlcXVlc3QSLgoFbm9kZXMYASADKAsyGC5zcGFya19pbn'
        'Rlcm5hbC5UcmVlTm9kZVIFbm9kZXMSKAoHbmV0d29yaxgCIAEoDjIOLnNwYXJrLk5ldHdvcmtS'
        'B25ldHdvcms=');

@$core.Deprecated('Use finalizeTransferRequestDescriptor instead')
const FinalizeTransferRequest$json = {
  '1': 'FinalizeTransferRequest',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {
      '1': 'nodes',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark_internal.TreeNode',
      '10': 'nodes'
    },
    {
      '1': 'timestamp',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'timestamp'
    },
  ],
};

/// Descriptor for `FinalizeTransferRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List finalizeTransferRequestDescriptor = $convert.base64Decode(
    'ChdGaW5hbGl6ZVRyYW5zZmVyUmVxdWVzdBIfCgt0cmFuc2Zlcl9pZBgBIAEoCVIKdHJhbnNmZX'
    'JJZBIuCgVub2RlcxgCIAMoCzIYLnNwYXJrX2ludGVybmFsLlRyZWVOb2RlUgVub2RlcxI4Cgl0'
    'aW1lc3RhbXAYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl0aW1lc3RhbXA=');

@$core.Deprecated('Use finalizeRefreshTimelockRequestDescriptor instead')
const FinalizeRefreshTimelockRequest$json = {
  '1': 'FinalizeRefreshTimelockRequest',
  '2': [
    {
      '1': 'nodes',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark_internal.TreeNode',
      '10': 'nodes'
    },
  ],
};

/// Descriptor for `FinalizeRefreshTimelockRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List finalizeRefreshTimelockRequestDescriptor =
    $convert.base64Decode(
        'Ch5GaW5hbGl6ZVJlZnJlc2hUaW1lbG9ja1JlcXVlc3QSLgoFbm9kZXMYASADKAsyGC5zcGFya1'
        '9pbnRlcm5hbC5UcmVlTm9kZVIFbm9kZXM=');

@$core.Deprecated('Use finalizeExtendLeafRequestDescriptor instead')
const FinalizeExtendLeafRequest$json = {
  '1': 'FinalizeExtendLeafRequest',
  '2': [
    {
      '1': 'node',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark_internal.TreeNode',
      '10': 'node'
    },
  ],
};

/// Descriptor for `FinalizeExtendLeafRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List finalizeExtendLeafRequestDescriptor =
    $convert.base64Decode(
        'ChlGaW5hbGl6ZUV4dGVuZExlYWZSZXF1ZXN0EiwKBG5vZGUYASABKAsyGC5zcGFya19pbnRlcm'
        '5hbC5UcmVlTm9kZVIEbm9kZQ==');

@$core.Deprecated('Use finalizeRenewRefundTimelockRequestDescriptor instead')
const FinalizeRenewRefundTimelockRequest$json = {
  '1': 'FinalizeRenewRefundTimelockRequest',
  '2': [
    {
      '1': 'node',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark_internal.TreeNode',
      '10': 'node'
    },
  ],
};

/// Descriptor for `FinalizeRenewRefundTimelockRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List finalizeRenewRefundTimelockRequestDescriptor =
    $convert.base64Decode(
        'CiJGaW5hbGl6ZVJlbmV3UmVmdW5kVGltZWxvY2tSZXF1ZXN0EiwKBG5vZGUYASABKAsyGC5zcG'
        'Fya19pbnRlcm5hbC5UcmVlTm9kZVIEbm9kZQ==');

@$core.Deprecated('Use finalizeRenewNodeTimelockRequestDescriptor instead')
const FinalizeRenewNodeTimelockRequest$json = {
  '1': 'FinalizeRenewNodeTimelockRequest',
  '2': [
    {
      '1': 'split_node',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark_internal.TreeNode',
      '10': 'splitNode'
    },
    {
      '1': 'node',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark_internal.TreeNode',
      '10': 'node'
    },
  ],
};

/// Descriptor for `FinalizeRenewNodeTimelockRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List finalizeRenewNodeTimelockRequestDescriptor =
    $convert.base64Decode(
        'CiBGaW5hbGl6ZVJlbmV3Tm9kZVRpbWVsb2NrUmVxdWVzdBI3CgpzcGxpdF9ub2RlGAEgASgLMh'
        'guc3BhcmtfaW50ZXJuYWwuVHJlZU5vZGVSCXNwbGl0Tm9kZRIsCgRub2RlGAIgASgLMhguc3Bh'
        'cmtfaW50ZXJuYWwuVHJlZU5vZGVSBG5vZGU=');

@$core.Deprecated('Use nodeAvailableForRenewRequestDescriptor instead')
const NodeAvailableForRenewRequest$json = {
  '1': 'NodeAvailableForRenewRequest',
  '2': [
    {'1': 'node_id', '3': 1, '4': 1, '5': 9, '10': 'nodeId'},
  ],
};

/// Descriptor for `NodeAvailableForRenewRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nodeAvailableForRenewRequestDescriptor =
    $convert.base64Decode(
        'ChxOb2RlQXZhaWxhYmxlRm9yUmVuZXdSZXF1ZXN0EhcKB25vZGVfaWQYASABKAlSBm5vZGVJZA'
        '==');

@$core.Deprecated('Use treeNodeDescriptor instead')
const TreeNode$json = {
  '1': 'TreeNode',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'value', '3': 2, '4': 1, '5': 4, '10': 'value'},
    {'1': 'verifying_pubkey', '3': 3, '4': 1, '5': 12, '10': 'verifyingPubkey'},
    {
      '1': 'owner_identity_pubkey',
      '3': 4,
      '4': 1,
      '5': 12,
      '10': 'ownerIdentityPubkey'
    },
    {
      '1': 'owner_signing_pubkey',
      '3': 5,
      '4': 1,
      '5': 12,
      '10': 'ownerSigningPubkey'
    },
    {'1': 'raw_tx', '3': 6, '4': 1, '5': 12, '10': 'rawTx'},
    {'1': 'raw_refund_tx', '3': 7, '4': 1, '5': 12, '10': 'rawRefundTx'},
    {'1': 'tree_id', '3': 8, '4': 1, '5': 9, '10': 'treeId'},
    {
      '1': 'parent_node_id',
      '3': 9,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'parentNodeId',
      '17': true
    },
    {
      '1': 'signing_keyshare_id',
      '3': 10,
      '4': 1,
      '5': 9,
      '10': 'signingKeyshareId'
    },
    {'1': 'vout', '3': 11, '4': 1, '5': 13, '10': 'vout'},
    {'1': 'refund_timelock', '3': 12, '4': 1, '5': 13, '10': 'refundTimelock'},
    {'1': 'direct_tx', '3': 13, '4': 1, '5': 12, '10': 'directTx'},
    {'1': 'direct_refund_tx', '3': 14, '4': 1, '5': 12, '10': 'directRefundTx'},
    {
      '1': 'direct_from_cpfp_refund_tx',
      '3': 15,
      '4': 1,
      '5': 12,
      '10': 'directFromCpfpRefundTx'
    },
  ],
  '8': [
    {'1': '_parent_node_id'},
  ],
};

/// Descriptor for `TreeNode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List treeNodeDescriptor = $convert.base64Decode(
    'CghUcmVlTm9kZRIOCgJpZBgBIAEoCVICaWQSFAoFdmFsdWUYAiABKARSBXZhbHVlEikKEHZlcm'
    'lmeWluZ19wdWJrZXkYAyABKAxSD3ZlcmlmeWluZ1B1YmtleRIyChVvd25lcl9pZGVudGl0eV9w'
    'dWJrZXkYBCABKAxSE293bmVySWRlbnRpdHlQdWJrZXkSMAoUb3duZXJfc2lnbmluZ19wdWJrZX'
    'kYBSABKAxSEm93bmVyU2lnbmluZ1B1YmtleRIVCgZyYXdfdHgYBiABKAxSBXJhd1R4EiIKDXJh'
    'd19yZWZ1bmRfdHgYByABKAxSC3Jhd1JlZnVuZFR4EhcKB3RyZWVfaWQYCCABKAlSBnRyZWVJZB'
    'IpCg5wYXJlbnRfbm9kZV9pZBgJIAEoCUgAUgxwYXJlbnROb2RlSWSIAQESLgoTc2lnbmluZ19r'
    'ZXlzaGFyZV9pZBgKIAEoCVIRc2lnbmluZ0tleXNoYXJlSWQSEgoEdm91dBgLIAEoDVIEdm91dB'
    'InCg9yZWZ1bmRfdGltZWxvY2sYDCABKA1SDnJlZnVuZFRpbWVsb2NrEhsKCWRpcmVjdF90eBgN'
    'IAEoDFIIZGlyZWN0VHgSKAoQZGlyZWN0X3JlZnVuZF90eBgOIAEoDFIOZGlyZWN0UmVmdW5kVH'
    'gSOgoaZGlyZWN0X2Zyb21fY3BmcF9yZWZ1bmRfdHgYDyABKAxSFmRpcmVjdEZyb21DcGZwUmVm'
    'dW5kVHhCEQoPX3BhcmVudF9ub2RlX2lk');

@$core.Deprecated('Use initiatePreimageSwapRequestDescriptor instead')
const InitiatePreimageSwapRequest$json = {
  '1': 'InitiatePreimageSwapRequest',
  '2': [
    {
      '1': 'request',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.InitiatePreimageSwapRequest',
      '10': 'request'
    },
    {
      '1': 'cpfp_refund_signatures',
      '3': 2,
      '4': 3,
      '5': 11,
      '6':
          '.spark_internal.InitiatePreimageSwapRequest.CpfpRefundSignaturesEntry',
      '10': 'cpfpRefundSignatures'
    },
    {
      '1': 'direct_refund_signatures',
      '3': 3,
      '4': 3,
      '5': 11,
      '6':
          '.spark_internal.InitiatePreimageSwapRequest.DirectRefundSignaturesEntry',
      '10': 'directRefundSignatures'
    },
    {
      '1': 'direct_from_cpfp_refund_signatures',
      '3': 4,
      '4': 3,
      '5': 11,
      '6':
          '.spark_internal.InitiatePreimageSwapRequest.DirectFromCpfpRefundSignaturesEntry',
      '10': 'directFromCpfpRefundSignatures'
    },
  ],
  '3': [
    InitiatePreimageSwapRequest_CpfpRefundSignaturesEntry$json,
    InitiatePreimageSwapRequest_DirectRefundSignaturesEntry$json,
    InitiatePreimageSwapRequest_DirectFromCpfpRefundSignaturesEntry$json
  ],
};

@$core.Deprecated('Use initiatePreimageSwapRequestDescriptor instead')
const InitiatePreimageSwapRequest_CpfpRefundSignaturesEntry$json = {
  '1': 'CpfpRefundSignaturesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use initiatePreimageSwapRequestDescriptor instead')
const InitiatePreimageSwapRequest_DirectRefundSignaturesEntry$json = {
  '1': 'DirectRefundSignaturesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use initiatePreimageSwapRequestDescriptor instead')
const InitiatePreimageSwapRequest_DirectFromCpfpRefundSignaturesEntry$json = {
  '1': 'DirectFromCpfpRefundSignaturesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `InitiatePreimageSwapRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiatePreimageSwapRequestDescriptor = $convert.base64Decode(
    'ChtJbml0aWF0ZVByZWltYWdlU3dhcFJlcXVlc3QSPAoHcmVxdWVzdBgBIAEoCzIiLnNwYXJrLk'
    'luaXRpYXRlUHJlaW1hZ2VTd2FwUmVxdWVzdFIHcmVxdWVzdBJ7ChZjcGZwX3JlZnVuZF9zaWdu'
    'YXR1cmVzGAIgAygLMkUuc3BhcmtfaW50ZXJuYWwuSW5pdGlhdGVQcmVpbWFnZVN3YXBSZXF1ZX'
    'N0LkNwZnBSZWZ1bmRTaWduYXR1cmVzRW50cnlSFGNwZnBSZWZ1bmRTaWduYXR1cmVzEoEBChhk'
    'aXJlY3RfcmVmdW5kX3NpZ25hdHVyZXMYAyADKAsyRy5zcGFya19pbnRlcm5hbC5Jbml0aWF0ZV'
    'ByZWltYWdlU3dhcFJlcXVlc3QuRGlyZWN0UmVmdW5kU2lnbmF0dXJlc0VudHJ5UhZkaXJlY3RS'
    'ZWZ1bmRTaWduYXR1cmVzEpsBCiJkaXJlY3RfZnJvbV9jcGZwX3JlZnVuZF9zaWduYXR1cmVzGA'
    'QgAygLMk8uc3BhcmtfaW50ZXJuYWwuSW5pdGlhdGVQcmVpbWFnZVN3YXBSZXF1ZXN0LkRpcmVj'
    'dEZyb21DcGZwUmVmdW5kU2lnbmF0dXJlc0VudHJ5Uh5kaXJlY3RGcm9tQ3BmcFJlZnVuZFNpZ2'
    '5hdHVyZXMaRwoZQ3BmcFJlZnVuZFNpZ25hdHVyZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIU'
    'CgV2YWx1ZRgCIAEoDFIFdmFsdWU6AjgBGkkKG0RpcmVjdFJlZnVuZFNpZ25hdHVyZXNFbnRyeR'
    'IQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoDFIFdmFsdWU6AjgBGlEKI0RpcmVjdEZy'
    'b21DcGZwUmVmdW5kU2lnbmF0dXJlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGA'
    'IgASgMUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use initiatePreimageSwapResponseDescriptor instead')
const InitiatePreimageSwapResponse$json = {
  '1': 'InitiatePreimageSwapResponse',
  '2': [
    {'1': 'preimage_share', '3': 1, '4': 1, '5': 12, '10': 'preimageShare'},
  ],
};

/// Descriptor for `InitiatePreimageSwapResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiatePreimageSwapResponseDescriptor =
    $convert.base64Decode(
        'ChxJbml0aWF0ZVByZWltYWdlU3dhcFJlc3BvbnNlEiUKDnByZWltYWdlX3NoYXJlGAEgASgMUg'
        '1wcmVpbWFnZVNoYXJl');

@$core.Deprecated('Use prepareTreeAddressNodeDescriptor instead')
const PrepareTreeAddressNode$json = {
  '1': 'PrepareTreeAddressNode',
  '2': [
    {
      '1': 'signing_keyshare_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'signingKeyshareId'
    },
    {'1': 'user_public_key', '3': 2, '4': 1, '5': 12, '10': 'userPublicKey'},
    {
      '1': 'children',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.spark_internal.PrepareTreeAddressNode',
      '10': 'children'
    },
  ],
};

/// Descriptor for `PrepareTreeAddressNode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List prepareTreeAddressNodeDescriptor = $convert.base64Decode(
    'ChZQcmVwYXJlVHJlZUFkZHJlc3NOb2RlEi4KE3NpZ25pbmdfa2V5c2hhcmVfaWQYASABKAlSEX'
    'NpZ25pbmdLZXlzaGFyZUlkEiYKD3VzZXJfcHVibGljX2tleRgCIAEoDFINdXNlclB1YmxpY0tl'
    'eRJCCghjaGlsZHJlbhgDIAMoCzImLnNwYXJrX2ludGVybmFsLlByZXBhcmVUcmVlQWRkcmVzc0'
    '5vZGVSCGNoaWxkcmVu');

@$core.Deprecated('Use prepareTreeAddressRequestDescriptor instead')
const PrepareTreeAddressRequest$json = {
  '1': 'PrepareTreeAddressRequest',
  '2': [
    {
      '1': 'target_keyshare_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'targetKeyshareId'
    },
    {
      '1': 'node',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark_internal.PrepareTreeAddressNode',
      '10': 'node'
    },
    {
      '1': 'user_identity_public_key',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'userIdentityPublicKey'
    },
    {
      '1': 'network',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.spark.Network',
      '10': 'network'
    },
  ],
};

/// Descriptor for `PrepareTreeAddressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List prepareTreeAddressRequestDescriptor = $convert.base64Decode(
    'ChlQcmVwYXJlVHJlZUFkZHJlc3NSZXF1ZXN0EiwKEnRhcmdldF9rZXlzaGFyZV9pZBgBIAEoCV'
    'IQdGFyZ2V0S2V5c2hhcmVJZBI6CgRub2RlGAIgASgLMiYuc3BhcmtfaW50ZXJuYWwuUHJlcGFy'
    'ZVRyZWVBZGRyZXNzTm9kZVIEbm9kZRI3Chh1c2VyX2lkZW50aXR5X3B1YmxpY19rZXkYAyABKA'
    'xSFXVzZXJJZGVudGl0eVB1YmxpY0tleRIoCgduZXR3b3JrGAQgASgOMg4uc3BhcmsuTmV0d29y'
    'a1IHbmV0d29yaw==');

@$core.Deprecated('Use prepareTreeAddressResponseDescriptor instead')
const PrepareTreeAddressResponse$json = {
  '1': 'PrepareTreeAddressResponse',
  '2': [
    {
      '1': 'signatures',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark_internal.PrepareTreeAddressResponse.SignaturesEntry',
      '10': 'signatures'
    },
  ],
  '3': [PrepareTreeAddressResponse_SignaturesEntry$json],
};

@$core.Deprecated('Use prepareTreeAddressResponseDescriptor instead')
const PrepareTreeAddressResponse_SignaturesEntry$json = {
  '1': 'SignaturesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `PrepareTreeAddressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List prepareTreeAddressResponseDescriptor = $convert.base64Decode(
    'ChpQcmVwYXJlVHJlZUFkZHJlc3NSZXNwb25zZRJaCgpzaWduYXR1cmVzGAEgAygLMjouc3Bhcm'
    'tfaW50ZXJuYWwuUHJlcGFyZVRyZWVBZGRyZXNzUmVzcG9uc2UuU2lnbmF0dXJlc0VudHJ5Ugpz'
    'aWduYXR1cmVzGj0KD1NpZ25hdHVyZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZR'
    'gCIAEoDFIFdmFsdWU6AjgB');

@$core.Deprecated('Use initiateTransferLeafDescriptor instead')
const InitiateTransferLeaf$json = {
  '1': 'InitiateTransferLeaf',
  '2': [
    {'1': 'leaf_id', '3': 1, '4': 1, '5': 9, '10': 'leafId'},
    {'1': 'raw_refund_tx', '3': 2, '4': 1, '5': 12, '10': 'rawRefundTx'},
    {'1': 'direct_refund_tx', '3': 3, '4': 1, '5': 12, '10': 'directRefundTx'},
    {
      '1': 'direct_from_cpfp_refund_tx',
      '3': 4,
      '4': 1,
      '5': 12,
      '10': 'directFromCpfpRefundTx'
    },
  ],
};

/// Descriptor for `InitiateTransferLeaf`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiateTransferLeafDescriptor = $convert.base64Decode(
    'ChRJbml0aWF0ZVRyYW5zZmVyTGVhZhIXCgdsZWFmX2lkGAEgASgJUgZsZWFmSWQSIgoNcmF3X3'
    'JlZnVuZF90eBgCIAEoDFILcmF3UmVmdW5kVHgSKAoQZGlyZWN0X3JlZnVuZF90eBgDIAEoDFIO'
    'ZGlyZWN0UmVmdW5kVHgSOgoaZGlyZWN0X2Zyb21fY3BmcF9yZWZ1bmRfdHgYBCABKAxSFmRpcm'
    'VjdEZyb21DcGZwUmVmdW5kVHg=');

@$core.Deprecated('Use initiateTransferRequestDescriptor instead')
const InitiateTransferRequest$json = {
  '1': 'InitiateTransferRequest',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
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
      '1': 'expiry_time',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'expiryTime'
    },
    {
      '1': 'leaves',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.spark_internal.InitiateTransferLeaf',
      '10': 'leaves'
    },
    {
      '1': 'sender_key_tweak_proofs',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.spark_internal.InitiateTransferRequest.SenderKeyTweakProofsEntry',
      '10': 'senderKeyTweakProofs'
    },
    {
      '1': 'type',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.spark.TransferType',
      '10': 'type'
    },
    {
      '1': 'transfer_package',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.spark.TransferPackage',
      '10': 'transferPackage'
    },
    {
      '1': 'refund_signatures',
      '3': 9,
      '4': 3,
      '5': 11,
      '6': '.spark_internal.InitiateTransferRequest.RefundSignaturesEntry',
      '10': 'refundSignatures'
    },
    {
      '1': 'direct_refund_signatures',
      '3': 10,
      '4': 3,
      '5': 11,
      '6':
          '.spark_internal.InitiateTransferRequest.DirectRefundSignaturesEntry',
      '10': 'directRefundSignatures'
    },
    {
      '1': 'direct_from_cpfp_refund_signatures',
      '3': 11,
      '4': 3,
      '5': 11,
      '6':
          '.spark_internal.InitiateTransferRequest.DirectFromCpfpRefundSignaturesEntry',
      '10': 'directFromCpfpRefundSignatures'
    },
    {'1': 'spark_invoice', '3': 12, '4': 1, '5': 9, '10': 'sparkInvoice'},
    {
      '1': 'adaptor_public_keys',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.spark.AdaptorPublicKeyPackage',
      '10': 'adaptorPublicKeys'
    },
    {
      '1': 'primary_transfer_id',
      '3': 14,
      '4': 1,
      '5': 9,
      '10': 'primaryTransferId'
    },
  ],
  '3': [
    InitiateTransferRequest_SenderKeyTweakProofsEntry$json,
    InitiateTransferRequest_RefundSignaturesEntry$json,
    InitiateTransferRequest_DirectRefundSignaturesEntry$json,
    InitiateTransferRequest_DirectFromCpfpRefundSignaturesEntry$json
  ],
};

@$core.Deprecated('Use initiateTransferRequestDescriptor instead')
const InitiateTransferRequest_SenderKeyTweakProofsEntry$json = {
  '1': 'SenderKeyTweakProofsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.SecretProof',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use initiateTransferRequestDescriptor instead')
const InitiateTransferRequest_RefundSignaturesEntry$json = {
  '1': 'RefundSignaturesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use initiateTransferRequestDescriptor instead')
const InitiateTransferRequest_DirectRefundSignaturesEntry$json = {
  '1': 'DirectRefundSignaturesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use initiateTransferRequestDescriptor instead')
const InitiateTransferRequest_DirectFromCpfpRefundSignaturesEntry$json = {
  '1': 'DirectFromCpfpRefundSignaturesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `InitiateTransferRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiateTransferRequestDescriptor = $convert.base64Decode(
    'ChdJbml0aWF0ZVRyYW5zZmVyUmVxdWVzdBIfCgt0cmFuc2Zlcl9pZBgBIAEoCVIKdHJhbnNmZX'
    'JJZBI7ChpzZW5kZXJfaWRlbnRpdHlfcHVibGljX2tleRgCIAEoDFIXc2VuZGVySWRlbnRpdHlQ'
    'dWJsaWNLZXkSPwoccmVjZWl2ZXJfaWRlbnRpdHlfcHVibGljX2tleRgDIAEoDFIZcmVjZWl2ZX'
    'JJZGVudGl0eVB1YmxpY0tleRI7CgtleHBpcnlfdGltZRgEIAEoCzIaLmdvb2dsZS5wcm90b2J1'
    'Zi5UaW1lc3RhbXBSCmV4cGlyeVRpbWUSPAoGbGVhdmVzGAUgAygLMiQuc3BhcmtfaW50ZXJuYW'
    'wuSW5pdGlhdGVUcmFuc2ZlckxlYWZSBmxlYXZlcxJ4ChdzZW5kZXJfa2V5X3R3ZWFrX3Byb29m'
    'cxgGIAMoCzJBLnNwYXJrX2ludGVybmFsLkluaXRpYXRlVHJhbnNmZXJSZXF1ZXN0LlNlbmRlck'
    'tleVR3ZWFrUHJvb2ZzRW50cnlSFHNlbmRlcktleVR3ZWFrUHJvb2ZzEicKBHR5cGUYByABKA4y'
    'Ey5zcGFyay5UcmFuc2ZlclR5cGVSBHR5cGUSQQoQdHJhbnNmZXJfcGFja2FnZRgIIAEoCzIWLn'
    'NwYXJrLlRyYW5zZmVyUGFja2FnZVIPdHJhbnNmZXJQYWNrYWdlEmoKEXJlZnVuZF9zaWduYXR1'
    'cmVzGAkgAygLMj0uc3BhcmtfaW50ZXJuYWwuSW5pdGlhdGVUcmFuc2ZlclJlcXVlc3QuUmVmdW'
    '5kU2lnbmF0dXJlc0VudHJ5UhByZWZ1bmRTaWduYXR1cmVzEn0KGGRpcmVjdF9yZWZ1bmRfc2ln'
    'bmF0dXJlcxgKIAMoCzJDLnNwYXJrX2ludGVybmFsLkluaXRpYXRlVHJhbnNmZXJSZXF1ZXN0Lk'
    'RpcmVjdFJlZnVuZFNpZ25hdHVyZXNFbnRyeVIWZGlyZWN0UmVmdW5kU2lnbmF0dXJlcxKXAQoi'
    'ZGlyZWN0X2Zyb21fY3BmcF9yZWZ1bmRfc2lnbmF0dXJlcxgLIAMoCzJLLnNwYXJrX2ludGVybm'
    'FsLkluaXRpYXRlVHJhbnNmZXJSZXF1ZXN0LkRpcmVjdEZyb21DcGZwUmVmdW5kU2lnbmF0dXJl'
    'c0VudHJ5Uh5kaXJlY3RGcm9tQ3BmcFJlZnVuZFNpZ25hdHVyZXMSIwoNc3BhcmtfaW52b2ljZR'
    'gMIAEoCVIMc3BhcmtJbnZvaWNlEk4KE2FkYXB0b3JfcHVibGljX2tleXMYDSABKAsyHi5zcGFy'
    'ay5BZGFwdG9yUHVibGljS2V5UGFja2FnZVIRYWRhcHRvclB1YmxpY0tleXMSLgoTcHJpbWFyeV'
    '90cmFuc2Zlcl9pZBgOIAEoCVIRcHJpbWFyeVRyYW5zZmVySWQaWwoZU2VuZGVyS2V5VHdlYWtQ'
    'cm9vZnNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIoCgV2YWx1ZRgCIAEoCzISLnNwYXJrLlNlY3'
    'JldFByb29mUgV2YWx1ZToCOAEaQwoVUmVmdW5kU2lnbmF0dXJlc0VudHJ5EhAKA2tleRgBIAEo'
    'CVIDa2V5EhQKBXZhbHVlGAIgASgMUgV2YWx1ZToCOAEaSQobRGlyZWN0UmVmdW5kU2lnbmF0dX'
    'Jlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgMUgV2YWx1ZToCOAEaUQoj'
    'RGlyZWN0RnJvbUNwZnBSZWZ1bmRTaWduYXR1cmVzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFA'
    'oFdmFsdWUYAiABKAxSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use initiateTransferSenderPackageDescriptor instead')
const InitiateTransferSenderPackage$json = {
  '1': 'InitiateTransferSenderPackage',
  '2': [
    {
      '1': 'sender_identity_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'senderIdentityPublicKey'
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
      '6':
          '.spark_internal.InitiateTransferSenderPackage.ReceiverIdentityPublicKeysEntry',
      '10': 'receiverIdentityPublicKeys'
    },
    {
      '1': 'refund_signatures',
      '3': 4,
      '4': 3,
      '5': 11,
      '6':
          '.spark_internal.InitiateTransferSenderPackage.RefundSignaturesEntry',
      '10': 'refundSignatures'
    },
    {
      '1': 'direct_refund_signatures',
      '3': 5,
      '4': 3,
      '5': 11,
      '6':
          '.spark_internal.InitiateTransferSenderPackage.DirectRefundSignaturesEntry',
      '10': 'directRefundSignatures'
    },
    {
      '1': 'direct_from_cpfp_refund_signatures',
      '3': 6,
      '4': 3,
      '5': 11,
      '6':
          '.spark_internal.InitiateTransferSenderPackage.DirectFromCpfpRefundSignaturesEntry',
      '10': 'directFromCpfpRefundSignatures'
    },
  ],
  '3': [
    InitiateTransferSenderPackage_ReceiverIdentityPublicKeysEntry$json,
    InitiateTransferSenderPackage_RefundSignaturesEntry$json,
    InitiateTransferSenderPackage_DirectRefundSignaturesEntry$json,
    InitiateTransferSenderPackage_DirectFromCpfpRefundSignaturesEntry$json
  ],
};

@$core.Deprecated('Use initiateTransferSenderPackageDescriptor instead')
const InitiateTransferSenderPackage_ReceiverIdentityPublicKeysEntry$json = {
  '1': 'ReceiverIdentityPublicKeysEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use initiateTransferSenderPackageDescriptor instead')
const InitiateTransferSenderPackage_RefundSignaturesEntry$json = {
  '1': 'RefundSignaturesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use initiateTransferSenderPackageDescriptor instead')
const InitiateTransferSenderPackage_DirectRefundSignaturesEntry$json = {
  '1': 'DirectRefundSignaturesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use initiateTransferSenderPackageDescriptor instead')
const InitiateTransferSenderPackage_DirectFromCpfpRefundSignaturesEntry$json = {
  '1': 'DirectFromCpfpRefundSignaturesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `InitiateTransferSenderPackage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiateTransferSenderPackageDescriptor = $convert.base64Decode(
    'Ch1Jbml0aWF0ZVRyYW5zZmVyU2VuZGVyUGFja2FnZRI7ChpzZW5kZXJfaWRlbnRpdHlfcHVibG'
    'ljX2tleRgBIAEoDFIXc2VuZGVySWRlbnRpdHlQdWJsaWNLZXkSQQoQdHJhbnNmZXJfcGFja2Fn'
    'ZRgCIAEoCzIWLnNwYXJrLlRyYW5zZmVyUGFja2FnZVIPdHJhbnNmZXJQYWNrYWdlEpABCh1yZW'
    'NlaXZlcl9pZGVudGl0eV9wdWJsaWNfa2V5cxgDIAMoCzJNLnNwYXJrX2ludGVybmFsLkluaXRp'
    'YXRlVHJhbnNmZXJTZW5kZXJQYWNrYWdlLlJlY2VpdmVySWRlbnRpdHlQdWJsaWNLZXlzRW50cn'
    'lSGnJlY2VpdmVySWRlbnRpdHlQdWJsaWNLZXlzEnAKEXJlZnVuZF9zaWduYXR1cmVzGAQgAygL'
    'MkMuc3BhcmtfaW50ZXJuYWwuSW5pdGlhdGVUcmFuc2ZlclNlbmRlclBhY2thZ2UuUmVmdW5kU2'
    'lnbmF0dXJlc0VudHJ5UhByZWZ1bmRTaWduYXR1cmVzEoMBChhkaXJlY3RfcmVmdW5kX3NpZ25h'
    'dHVyZXMYBSADKAsySS5zcGFya19pbnRlcm5hbC5Jbml0aWF0ZVRyYW5zZmVyU2VuZGVyUGFja2'
    'FnZS5EaXJlY3RSZWZ1bmRTaWduYXR1cmVzRW50cnlSFmRpcmVjdFJlZnVuZFNpZ25hdHVyZXMS'
    'nQEKImRpcmVjdF9mcm9tX2NwZnBfcmVmdW5kX3NpZ25hdHVyZXMYBiADKAsyUS5zcGFya19pbn'
    'Rlcm5hbC5Jbml0aWF0ZVRyYW5zZmVyU2VuZGVyUGFja2FnZS5EaXJlY3RGcm9tQ3BmcFJlZnVu'
    'ZFNpZ25hdHVyZXNFbnRyeVIeZGlyZWN0RnJvbUNwZnBSZWZ1bmRTaWduYXR1cmVzGk0KH1JlY2'
    'VpdmVySWRlbnRpdHlQdWJsaWNLZXlzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUY'
    'AiABKAxSBXZhbHVlOgI4ARpDChVSZWZ1bmRTaWduYXR1cmVzRW50cnkSEAoDa2V5GAEgASgJUg'
    'NrZXkSFAoFdmFsdWUYAiABKAxSBXZhbHVlOgI4ARpJChtEaXJlY3RSZWZ1bmRTaWduYXR1cmVz'
    'RW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAxSBXZhbHVlOgI4ARpRCiNEaX'
    'JlY3RGcm9tQ3BmcFJlZnVuZFNpZ25hdHVyZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2'
    'YWx1ZRgCIAEoDFIFdmFsdWU6AjgB');

@$core.Deprecated('Use initiateTransferV2RequestDescriptor instead')
const InitiateTransferV2Request$json = {
  '1': 'InitiateTransferV2Request',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {
      '1': 'sender_packages',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark_internal.InitiateTransferSenderPackage',
      '10': 'senderPackages'
    },
    {
      '1': 'sender_key_tweak_proofs',
      '3': 3,
      '4': 3,
      '5': 11,
      '6':
          '.spark_internal.InitiateTransferV2Request.SenderKeyTweakProofsEntry',
      '10': 'senderKeyTweakProofs'
    },
    {
      '1': 'expiry_time',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'expiryTime'
    },
  ],
  '3': [InitiateTransferV2Request_SenderKeyTweakProofsEntry$json],
};

@$core.Deprecated('Use initiateTransferV2RequestDescriptor instead')
const InitiateTransferV2Request_SenderKeyTweakProofsEntry$json = {
  '1': 'SenderKeyTweakProofsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.SecretProof',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `InitiateTransferV2Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiateTransferV2RequestDescriptor = $convert.base64Decode(
    'ChlJbml0aWF0ZVRyYW5zZmVyVjJSZXF1ZXN0Eh8KC3RyYW5zZmVyX2lkGAEgASgJUgp0cmFuc2'
    'ZlcklkElYKD3NlbmRlcl9wYWNrYWdlcxgCIAMoCzItLnNwYXJrX2ludGVybmFsLkluaXRpYXRl'
    'VHJhbnNmZXJTZW5kZXJQYWNrYWdlUg5zZW5kZXJQYWNrYWdlcxJ6ChdzZW5kZXJfa2V5X3R3ZW'
    'FrX3Byb29mcxgDIAMoCzJDLnNwYXJrX2ludGVybmFsLkluaXRpYXRlVHJhbnNmZXJWMlJlcXVl'
    'c3QuU2VuZGVyS2V5VHdlYWtQcm9vZnNFbnRyeVIUc2VuZGVyS2V5VHdlYWtQcm9vZnMSOwoLZX'
    'hwaXJ5X3RpbWUYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgpleHBpcnlUaW1l'
    'GlsKGVNlbmRlcktleVR3ZWFrUHJvb2ZzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSKAoFdmFsdW'
    'UYAiABKAsyEi5zcGFyay5TZWNyZXRQcm9vZlIFdmFsdWU6AjgB');

@$core.Deprecated('Use deliverSenderKeyTweakRequestDescriptor instead')
const DeliverSenderKeyTweakRequest$json = {
  '1': 'DeliverSenderKeyTweakRequest',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {
      '1': 'sender_identity_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'senderIdentityPublicKey'
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

/// Descriptor for `DeliverSenderKeyTweakRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deliverSenderKeyTweakRequestDescriptor = $convert.base64Decode(
    'ChxEZWxpdmVyU2VuZGVyS2V5VHdlYWtSZXF1ZXN0Eh8KC3RyYW5zZmVyX2lkGAEgASgJUgp0cm'
    'Fuc2ZlcklkEjsKGnNlbmRlcl9pZGVudGl0eV9wdWJsaWNfa2V5GAIgASgMUhdzZW5kZXJJZGVu'
    'dGl0eVB1YmxpY0tleRJBChB0cmFuc2Zlcl9wYWNrYWdlGAMgASgLMhYuc3BhcmsuVHJhbnNmZX'
    'JQYWNrYWdlUg90cmFuc2ZlclBhY2thZ2U=');

@$core.Deprecated('Use initiateCooperativeExitRequestDescriptor instead')
const InitiateCooperativeExitRequest$json = {
  '1': 'InitiateCooperativeExitRequest',
  '2': [
    {
      '1': 'transfer',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark_internal.InitiateTransferRequest',
      '10': 'transfer'
    },
    {'1': 'exit_id', '3': 2, '4': 1, '5': 9, '10': 'exitId'},
    {'1': 'exit_txid', '3': 3, '4': 1, '5': 12, '10': 'exitTxid'},
    {'1': 'connector_tx', '3': 4, '4': 1, '5': 12, '10': 'connectorTx'},
  ],
};

/// Descriptor for `InitiateCooperativeExitRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiateCooperativeExitRequestDescriptor =
    $convert.base64Decode(
        'Ch5Jbml0aWF0ZUNvb3BlcmF0aXZlRXhpdFJlcXVlc3QSQwoIdHJhbnNmZXIYASABKAsyJy5zcG'
        'Fya19pbnRlcm5hbC5Jbml0aWF0ZVRyYW5zZmVyUmVxdWVzdFIIdHJhbnNmZXISFwoHZXhpdF9p'
        'ZBgCIAEoCVIGZXhpdElkEhsKCWV4aXRfdHhpZBgDIAEoDFIIZXhpdFR4aWQSIQoMY29ubmVjdG'
        '9yX3R4GAQgASgMUgtjb25uZWN0b3JUeA==');

@$core.Deprecated('Use updatePreimageRequestRequestDescriptor instead')
const UpdatePreimageRequestRequest$json = {
  '1': 'UpdatePreimageRequestRequest',
  '2': [
    {
      '1': 'preimage_request_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'preimageRequestId'
    },
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

/// Descriptor for `UpdatePreimageRequestRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePreimageRequestRequestDescriptor =
    $convert.base64Decode(
        'ChxVcGRhdGVQcmVpbWFnZVJlcXVlc3RSZXF1ZXN0Ei4KE3ByZWltYWdlX3JlcXVlc3RfaWQYAS'
        'ABKAlSEXByZWltYWdlUmVxdWVzdElkEhoKCHByZWltYWdlGAIgASgMUghwcmVpbWFnZRIuChNp'
        'ZGVudGl0eV9wdWJsaWNfa2V5GAMgASgMUhFpZGVudGl0eVB1YmxpY0tleQ==');

@$core.Deprecated('Use initiateSettleReceiverKeyTweakRequestDescriptor instead')
const InitiateSettleReceiverKeyTweakRequest$json = {
  '1': 'InitiateSettleReceiverKeyTweakRequest',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {
      '1': 'key_tweak_proofs',
      '3': 2,
      '4': 3,
      '5': 11,
      '6':
          '.spark_internal.InitiateSettleReceiverKeyTweakRequest.KeyTweakProofsEntry',
      '10': 'keyTweakProofs'
    },
    {
      '1': 'user_public_keys',
      '3': 3,
      '4': 3,
      '5': 11,
      '6':
          '.spark_internal.InitiateSettleReceiverKeyTweakRequest.UserPublicKeysEntry',
      '10': 'userPublicKeys'
    },
    {
      '1': 'encrypted_claim_key_tweak_package',
      '3': 4,
      '4': 3,
      '5': 11,
      '6':
          '.spark_internal.InitiateSettleReceiverKeyTweakRequest.EncryptedClaimKeyTweakPackageEntry',
      '10': 'encryptedClaimKeyTweakPackage'
    },
    {'1': 'claim_signature', '3': 5, '4': 1, '5': 12, '10': 'claimSignature'},
    {
      '1': 'receiver_identity_public_key',
      '3': 6,
      '4': 1,
      '5': 12,
      '10': 'receiverIdentityPublicKey'
    },
  ],
  '3': [
    InitiateSettleReceiverKeyTweakRequest_KeyTweakProofsEntry$json,
    InitiateSettleReceiverKeyTweakRequest_UserPublicKeysEntry$json,
    InitiateSettleReceiverKeyTweakRequest_EncryptedClaimKeyTweakPackageEntry$json
  ],
};

@$core.Deprecated('Use initiateSettleReceiverKeyTweakRequestDescriptor instead')
const InitiateSettleReceiverKeyTweakRequest_KeyTweakProofsEntry$json = {
  '1': 'KeyTweakProofsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.SecretProof',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use initiateSettleReceiverKeyTweakRequestDescriptor instead')
const InitiateSettleReceiverKeyTweakRequest_UserPublicKeysEntry$json = {
  '1': 'UserPublicKeysEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use initiateSettleReceiverKeyTweakRequestDescriptor instead')
const InitiateSettleReceiverKeyTweakRequest_EncryptedClaimKeyTweakPackageEntry$json =
    {
  '1': 'EncryptedClaimKeyTweakPackageEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `InitiateSettleReceiverKeyTweakRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiateSettleReceiverKeyTweakRequestDescriptor = $convert.base64Decode(
    'CiVJbml0aWF0ZVNldHRsZVJlY2VpdmVyS2V5VHdlYWtSZXF1ZXN0Eh8KC3RyYW5zZmVyX2lkGA'
    'EgASgJUgp0cmFuc2ZlcklkEnMKEGtleV90d2Vha19wcm9vZnMYAiADKAsySS5zcGFya19pbnRl'
    'cm5hbC5Jbml0aWF0ZVNldHRsZVJlY2VpdmVyS2V5VHdlYWtSZXF1ZXN0LktleVR3ZWFrUHJvb2'
    'ZzRW50cnlSDmtleVR3ZWFrUHJvb2ZzEnMKEHVzZXJfcHVibGljX2tleXMYAyADKAsySS5zcGFy'
    'a19pbnRlcm5hbC5Jbml0aWF0ZVNldHRsZVJlY2VpdmVyS2V5VHdlYWtSZXF1ZXN0LlVzZXJQdW'
    'JsaWNLZXlzRW50cnlSDnVzZXJQdWJsaWNLZXlzEqIBCiFlbmNyeXB0ZWRfY2xhaW1fa2V5X3R3'
    'ZWFrX3BhY2thZ2UYBCADKAsyWC5zcGFya19pbnRlcm5hbC5Jbml0aWF0ZVNldHRsZVJlY2Vpdm'
    'VyS2V5VHdlYWtSZXF1ZXN0LkVuY3J5cHRlZENsYWltS2V5VHdlYWtQYWNrYWdlRW50cnlSHWVu'
    'Y3J5cHRlZENsYWltS2V5VHdlYWtQYWNrYWdlEicKD2NsYWltX3NpZ25hdHVyZRgFIAEoDFIOY2'
    'xhaW1TaWduYXR1cmUSPwoccmVjZWl2ZXJfaWRlbnRpdHlfcHVibGljX2tleRgGIAEoDFIZcmVj'
    'ZWl2ZXJJZGVudGl0eVB1YmxpY0tleRpVChNLZXlUd2Vha1Byb29mc0VudHJ5EhAKA2tleRgBIA'
    'EoCVIDa2V5EigKBXZhbHVlGAIgASgLMhIuc3BhcmsuU2VjcmV0UHJvb2ZSBXZhbHVlOgI4ARpB'
    'ChNVc2VyUHVibGljS2V5c0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgMUg'
    'V2YWx1ZToCOAEaUAoiRW5jcnlwdGVkQ2xhaW1LZXlUd2Vha1BhY2thZ2VFbnRyeRIQCgNrZXkY'
    'ASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoDFIFdmFsdWU6AjgB');

@$core.Deprecated('Use settleReceiverKeyTweakRequestDescriptor instead')
const SettleReceiverKeyTweakRequest$json = {
  '1': 'SettleReceiverKeyTweakRequest',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {
      '1': 'action',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.spark_internal.SettleKeyTweakAction',
      '10': 'action'
    },
    {
      '1': 'receiver_identity_public_key',
      '3': 4,
      '4': 1,
      '5': 12,
      '10': 'receiverIdentityPublicKey'
    },
  ],
  '9': [
    {'1': 2, '2': 3},
  ],
};

/// Descriptor for `SettleReceiverKeyTweakRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List settleReceiverKeyTweakRequestDescriptor = $convert.base64Decode(
    'Ch1TZXR0bGVSZWNlaXZlcktleVR3ZWFrUmVxdWVzdBIfCgt0cmFuc2Zlcl9pZBgBIAEoCVIKdH'
    'JhbnNmZXJJZBI8CgZhY3Rpb24YAyABKA4yJC5zcGFya19pbnRlcm5hbC5TZXR0bGVLZXlUd2Vh'
    'a0FjdGlvblIGYWN0aW9uEj8KHHJlY2VpdmVyX2lkZW50aXR5X3B1YmxpY19rZXkYBCABKAxSGX'
    'JlY2VpdmVySWRlbnRpdHlQdWJsaWNLZXlKBAgCEAM=');

@$core.Deprecated('Use settleSenderKeyTweakRequestDescriptor instead')
const SettleSenderKeyTweakRequest$json = {
  '1': 'SettleSenderKeyTweakRequest',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {
      '1': 'action',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.spark_internal.SettleKeyTweakAction',
      '10': 'action'
    },
  ],
};

/// Descriptor for `SettleSenderKeyTweakRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List settleSenderKeyTweakRequestDescriptor =
    $convert.base64Decode(
        'ChtTZXR0bGVTZW5kZXJLZXlUd2Vha1JlcXVlc3QSHwoLdHJhbnNmZXJfaWQYASABKAlSCnRyYW'
        '5zZmVySWQSPAoGYWN0aW9uGAIgASgOMiQuc3BhcmtfaW50ZXJuYWwuU2V0dGxlS2V5VHdlYWtB'
        'Y3Rpb25SBmFjdGlvbg==');

@$core.Deprecated(
    'Use reserveInstantStaticDepositUtxoSwapRequestDescriptor instead')
const ReserveInstantStaticDepositUtxoSwapRequest$json = {
  '1': 'ReserveInstantStaticDepositUtxoSwapRequest',
  '2': [
    {
      '1': 'on_chain_utxo',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.UTXO',
      '10': 'onChainUtxo'
    },
    {'1': 'ssp_signature', '3': 2, '4': 1, '5': 12, '10': 'sspSignature'},
    {'1': 'user_signature', '3': 3, '4': 1, '5': 12, '10': 'userSignature'},
    {
      '1': 'transfer',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark.StartTransferRequest',
      '10': 'transfer'
    },
    {
      '1': 'destination_address',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'destinationAddress'
    },
    {'1': 'value_sats', '3': 6, '4': 1, '5': 3, '10': 'valueSats'},
    {
      '1': 'credit_amount_sats',
      '3': 7,
      '4': 1,
      '5': 3,
      '10': 'creditAmountSats'
    },
    {
      '1': 'secondary_credit_amount_sats',
      '3': 8,
      '4': 1,
      '5': 3,
      '10': 'secondaryCreditAmountSats'
    },
    {
      '1': 'expiry_time',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'expiryTime'
    },
    {
      '1': 'requested_secondary_transfer_id',
      '3': 10,
      '4': 1,
      '5': 9,
      '10': 'requestedSecondaryTransferId'
    },
  ],
};

/// Descriptor for `ReserveInstantStaticDepositUtxoSwapRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reserveInstantStaticDepositUtxoSwapRequestDescriptor = $convert.base64Decode(
    'CipSZXNlcnZlSW5zdGFudFN0YXRpY0RlcG9zaXRVdHhvU3dhcFJlcXVlc3QSLwoNb25fY2hhaW'
    '5fdXR4bxgBIAEoCzILLnNwYXJrLlVUWE9SC29uQ2hhaW5VdHhvEiMKDXNzcF9zaWduYXR1cmUY'
    'AiABKAxSDHNzcFNpZ25hdHVyZRIlCg51c2VyX3NpZ25hdHVyZRgDIAEoDFINdXNlclNpZ25hdH'
    'VyZRI3Cgh0cmFuc2ZlchgEIAEoCzIbLnNwYXJrLlN0YXJ0VHJhbnNmZXJSZXF1ZXN0Ugh0cmFu'
    'c2ZlchIvChNkZXN0aW5hdGlvbl9hZGRyZXNzGAUgASgJUhJkZXN0aW5hdGlvbkFkZHJlc3MSHQ'
    'oKdmFsdWVfc2F0cxgGIAEoA1IJdmFsdWVTYXRzEiwKEmNyZWRpdF9hbW91bnRfc2F0cxgHIAEo'
    'A1IQY3JlZGl0QW1vdW50U2F0cxI/ChxzZWNvbmRhcnlfY3JlZGl0X2Ftb3VudF9zYXRzGAggAS'
    'gDUhlzZWNvbmRhcnlDcmVkaXRBbW91bnRTYXRzEjsKC2V4cGlyeV90aW1lGAkgASgLMhouZ29v'
    'Z2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKZXhwaXJ5VGltZRJFCh9yZXF1ZXN0ZWRfc2Vjb25kYX'
    'J5X3RyYW5zZmVyX2lkGAogASgJUhxyZXF1ZXN0ZWRTZWNvbmRhcnlUcmFuc2Zlcklk');

@$core.Deprecated(
    'Use createInstantStaticDepositUtxoSwapRequestDescriptor instead')
const CreateInstantStaticDepositUtxoSwapRequest$json = {
  '1': 'CreateInstantStaticDepositUtxoSwapRequest',
  '2': [
    {
      '1': 'request',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark_internal.ReserveInstantStaticDepositUtxoSwapRequest',
      '10': 'request'
    },
    {'1': 'signature', '3': 2, '4': 1, '5': 12, '10': 'signature'},
    {
      '1': 'coordinator_public_key',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'coordinatorPublicKey'
    },
  ],
};

/// Descriptor for `CreateInstantStaticDepositUtxoSwapRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List
    createInstantStaticDepositUtxoSwapRequestDescriptor = $convert.base64Decode(
        'CilDcmVhdGVJbnN0YW50U3RhdGljRGVwb3NpdFV0eG9Td2FwUmVxdWVzdBJUCgdyZXF1ZXN0GA'
        'EgASgLMjouc3BhcmtfaW50ZXJuYWwuUmVzZXJ2ZUluc3RhbnRTdGF0aWNEZXBvc2l0VXR4b1N3'
        'YXBSZXF1ZXN0UgdyZXF1ZXN0EhwKCXNpZ25hdHVyZRgCIAEoDFIJc2lnbmF0dXJlEjQKFmNvb3'
        'JkaW5hdG9yX3B1YmxpY19rZXkYAyABKAxSFGNvb3JkaW5hdG9yUHVibGljS2V5');

@$core.Deprecated(
    'Use createInstantStaticDepositUtxoSwapResponseDescriptor instead')
const CreateInstantStaticDepositUtxoSwapResponse$json = {
  '1': 'CreateInstantStaticDepositUtxoSwapResponse',
  '2': [
    {'1': 'swap_id', '3': 1, '4': 1, '5': 9, '10': 'swapId'},
  ],
};

/// Descriptor for `CreateInstantStaticDepositUtxoSwapResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List
    createInstantStaticDepositUtxoSwapResponseDescriptor =
    $convert.base64Decode(
        'CipDcmVhdGVJbnN0YW50U3RhdGljRGVwb3NpdFV0eG9Td2FwUmVzcG9uc2USFwoHc3dhcF9pZB'
        'gBIAEoCVIGc3dhcElk');

@$core
    .Deprecated('Use saveUtxoForInstantStaticDepositRequestDescriptor instead')
const SaveUtxoForInstantStaticDepositRequest$json = {
  '1': 'SaveUtxoForInstantStaticDepositRequest',
  '2': [
    {
      '1': 'on_chain_utxo',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.UTXO',
      '10': 'onChainUtxo'
    },
    {'1': 'utxo_swap_id', '3': 2, '4': 1, '5': 9, '10': 'utxoSwapId'},
    {'1': 'signature', '3': 3, '4': 1, '5': 12, '10': 'signature'},
    {
      '1': 'coordinator_public_key',
      '3': 4,
      '4': 1,
      '5': 12,
      '10': 'coordinatorPublicKey'
    },
    {'1': 'transfer_id', '3': 5, '4': 1, '5': 9, '10': 'transferId'},
  ],
};

/// Descriptor for `SaveUtxoForInstantStaticDepositRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saveUtxoForInstantStaticDepositRequestDescriptor =
    $convert.base64Decode(
        'CiZTYXZlVXR4b0Zvckluc3RhbnRTdGF0aWNEZXBvc2l0UmVxdWVzdBIvCg1vbl9jaGFpbl91dH'
        'hvGAEgASgLMgsuc3BhcmsuVVRYT1ILb25DaGFpblV0eG8SIAoMdXR4b19zd2FwX2lkGAIgASgJ'
        'Ugp1dHhvU3dhcElkEhwKCXNpZ25hdHVyZRgDIAEoDFIJc2lnbmF0dXJlEjQKFmNvb3JkaW5hdG'
        '9yX3B1YmxpY19rZXkYBCABKAxSFGNvb3JkaW5hdG9yUHVibGljS2V5Eh8KC3RyYW5zZmVyX2lk'
        'GAUgASgJUgp0cmFuc2Zlcklk');

@$core
    .Deprecated('Use saveUtxoForInstantStaticDepositResponseDescriptor instead')
const SaveUtxoForInstantStaticDepositResponse$json = {
  '1': 'SaveUtxoForInstantStaticDepositResponse',
};

/// Descriptor for `SaveUtxoForInstantStaticDepositResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saveUtxoForInstantStaticDepositResponseDescriptor =
    $convert.base64Decode(
        'CidTYXZlVXR4b0Zvckluc3RhbnRTdGF0aWNEZXBvc2l0UmVzcG9uc2U=');

@$core.Deprecated('Use initiateStaticDepositUtxoSwapRequestDescriptor instead')
const InitiateStaticDepositUtxoSwapRequest$json = {
  '1': 'InitiateStaticDepositUtxoSwapRequest',
  '2': [
    {
      '1': 'on_chain_utxo',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.UTXO',
      '10': 'onChainUtxo'
    },
    {'1': 'ssp_signature', '3': 2, '4': 1, '5': 12, '10': 'sspSignature'},
    {'1': 'user_signature', '3': 3, '4': 1, '5': 12, '10': 'userSignature'},
    {
      '1': 'transfer',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.spark.StartTransferRequest',
      '10': 'transfer'
    },
    {
      '1': 'spend_tx_signing_job',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.spark.SigningJob',
      '10': 'spendTxSigningJob'
    },
    {
      '1': 'hash_variant',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.spark.HashVariant',
      '10': 'hashVariant'
    },
    {
      '1': 'confirmation_threshold',
      '3': 7,
      '4': 1,
      '5': 13,
      '9': 0,
      '10': 'confirmationThreshold',
      '17': true
    },
  ],
  '8': [
    {'1': '_confirmation_threshold'},
  ],
};

/// Descriptor for `InitiateStaticDepositUtxoSwapRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiateStaticDepositUtxoSwapRequestDescriptor = $convert.base64Decode(
    'CiRJbml0aWF0ZVN0YXRpY0RlcG9zaXRVdHhvU3dhcFJlcXVlc3QSLwoNb25fY2hhaW5fdXR4bx'
    'gBIAEoCzILLnNwYXJrLlVUWE9SC29uQ2hhaW5VdHhvEiMKDXNzcF9zaWduYXR1cmUYAiABKAxS'
    'DHNzcFNpZ25hdHVyZRIlCg51c2VyX3NpZ25hdHVyZRgDIAEoDFINdXNlclNpZ25hdHVyZRI3Cg'
    'h0cmFuc2ZlchgEIAEoCzIbLnNwYXJrLlN0YXJ0VHJhbnNmZXJSZXF1ZXN0Ugh0cmFuc2ZlchJC'
    'ChRzcGVuZF90eF9zaWduaW5nX2pvYhgFIAEoCzIRLnNwYXJrLlNpZ25pbmdKb2JSEXNwZW5kVH'
    'hTaWduaW5nSm9iEjUKDGhhc2hfdmFyaWFudBgGIAEoDjISLnNwYXJrLkhhc2hWYXJpYW50Ugto'
    'YXNoVmFyaWFudBI6ChZjb25maXJtYXRpb25fdGhyZXNob2xkGAcgASgNSABSFWNvbmZpcm1hdG'
    'lvblRocmVzaG9sZIgBAUIZChdfY29uZmlybWF0aW9uX3RocmVzaG9sZA==');

@$core.Deprecated('Use createStaticDepositUtxoSwapRequestDescriptor instead')
const CreateStaticDepositUtxoSwapRequest$json = {
  '1': 'CreateStaticDepositUtxoSwapRequest',
  '2': [
    {
      '1': 'request',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark_internal.InitiateStaticDepositUtxoSwapRequest',
      '10': 'request'
    },
    {'1': 'signature', '3': 2, '4': 1, '5': 12, '10': 'signature'},
    {
      '1': 'coordinator_public_key',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'coordinatorPublicKey'
    },
  ],
};

/// Descriptor for `CreateStaticDepositUtxoSwapRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createStaticDepositUtxoSwapRequestDescriptor =
    $convert.base64Decode(
        'CiJDcmVhdGVTdGF0aWNEZXBvc2l0VXR4b1N3YXBSZXF1ZXN0Ek4KB3JlcXVlc3QYASABKAsyNC'
        '5zcGFya19pbnRlcm5hbC5Jbml0aWF0ZVN0YXRpY0RlcG9zaXRVdHhvU3dhcFJlcXVlc3RSB3Jl'
        'cXVlc3QSHAoJc2lnbmF0dXJlGAIgASgMUglzaWduYXR1cmUSNAoWY29vcmRpbmF0b3JfcHVibG'
        'ljX2tleRgDIAEoDFIUY29vcmRpbmF0b3JQdWJsaWNLZXk=');

@$core.Deprecated('Use createStaticDepositUtxoSwapResponseDescriptor instead')
const CreateStaticDepositUtxoSwapResponse$json = {
  '1': 'CreateStaticDepositUtxoSwapResponse',
  '2': [
    {
      '1': 'UtxoDepositAddress',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'UtxoDepositAddress'
    },
  ],
};

/// Descriptor for `CreateStaticDepositUtxoSwapResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createStaticDepositUtxoSwapResponseDescriptor =
    $convert.base64Decode(
        'CiNDcmVhdGVTdGF0aWNEZXBvc2l0VXR4b1N3YXBSZXNwb25zZRIuChJVdHhvRGVwb3NpdEFkZH'
        'Jlc3MYASABKAlSElV0eG9EZXBvc2l0QWRkcmVzcw==');

@$core.Deprecated('Use createStaticDepositUtxoRefundRequestDescriptor instead')
const CreateStaticDepositUtxoRefundRequest$json = {
  '1': 'CreateStaticDepositUtxoRefundRequest',
  '2': [
    {
      '1': 'request',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.InitiateStaticDepositUtxoRefundRequest',
      '10': 'request'
    },
    {'1': 'signature', '3': 2, '4': 1, '5': 12, '10': 'signature'},
    {
      '1': 'coordinator_public_key',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'coordinatorPublicKey'
    },
  ],
};

/// Descriptor for `CreateStaticDepositUtxoRefundRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createStaticDepositUtxoRefundRequestDescriptor =
    $convert.base64Decode(
        'CiRDcmVhdGVTdGF0aWNEZXBvc2l0VXR4b1JlZnVuZFJlcXVlc3QSRwoHcmVxdWVzdBgBIAEoCz'
        'ItLnNwYXJrLkluaXRpYXRlU3RhdGljRGVwb3NpdFV0eG9SZWZ1bmRSZXF1ZXN0UgdyZXF1ZXN0'
        'EhwKCXNpZ25hdHVyZRgCIAEoDFIJc2lnbmF0dXJlEjQKFmNvb3JkaW5hdG9yX3B1YmxpY19rZX'
        'kYAyABKAxSFGNvb3JkaW5hdG9yUHVibGljS2V5');

@$core.Deprecated('Use createStaticDepositUtxoRefundResponseDescriptor instead')
const CreateStaticDepositUtxoRefundResponse$json = {
  '1': 'CreateStaticDepositUtxoRefundResponse',
  '2': [
    {
      '1': 'UtxoDepositAddress',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'UtxoDepositAddress'
    },
  ],
};

/// Descriptor for `CreateStaticDepositUtxoRefundResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createStaticDepositUtxoRefundResponseDescriptor =
    $convert.base64Decode(
        'CiVDcmVhdGVTdGF0aWNEZXBvc2l0VXR4b1JlZnVuZFJlc3BvbnNlEi4KElV0eG9EZXBvc2l0QW'
        'RkcmVzcxgBIAEoCVISVXR4b0RlcG9zaXRBZGRyZXNz');

@$core.Deprecated('Use rollbackUtxoSwapRequestDescriptor instead')
const RollbackUtxoSwapRequest$json = {
  '1': 'RollbackUtxoSwapRequest',
  '2': [
    {
      '1': 'on_chain_utxo',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.UTXO',
      '10': 'onChainUtxo'
    },
    {'1': 'signature', '3': 2, '4': 1, '5': 12, '10': 'signature'},
    {
      '1': 'coordinator_public_key',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'coordinatorPublicKey'
    },
  ],
};

/// Descriptor for `RollbackUtxoSwapRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rollbackUtxoSwapRequestDescriptor = $convert.base64Decode(
    'ChdSb2xsYmFja1V0eG9Td2FwUmVxdWVzdBIvCg1vbl9jaGFpbl91dHhvGAEgASgLMgsuc3Bhcm'
    'suVVRYT1ILb25DaGFpblV0eG8SHAoJc2lnbmF0dXJlGAIgASgMUglzaWduYXR1cmUSNAoWY29v'
    'cmRpbmF0b3JfcHVibGljX2tleRgDIAEoDFIUY29vcmRpbmF0b3JQdWJsaWNLZXk=');

@$core.Deprecated('Use rollbackUtxoSwapResponseDescriptor instead')
const RollbackUtxoSwapResponse$json = {
  '1': 'RollbackUtxoSwapResponse',
};

/// Descriptor for `RollbackUtxoSwapResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rollbackUtxoSwapResponseDescriptor =
    $convert.base64Decode('ChhSb2xsYmFja1V0eG9Td2FwUmVzcG9uc2U=');

@$core.Deprecated('Use rollbackInstantUtxoSwapRequestDescriptor instead')
const RollbackInstantUtxoSwapRequest$json = {
  '1': 'RollbackInstantUtxoSwapRequest',
  '2': [
    {
      '1': 'on_chain_utxo',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.UTXO',
      '10': 'onChainUtxo'
    },
    {'1': 'signature', '3': 2, '4': 1, '5': 12, '10': 'signature'},
    {
      '1': 'coordinator_public_key',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'coordinatorPublicKey'
    },
    {
      '1': 'rollback_from_statuses',
      '3': 4,
      '4': 3,
      '5': 14,
      '6': '.spark.UtxoSwapStatus',
      '10': 'rollbackFromStatuses'
    },
    {
      '1': 'rollback_to_status',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.spark.UtxoSwapStatus',
      '10': 'rollbackToStatus'
    },
  ],
};

/// Descriptor for `RollbackInstantUtxoSwapRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rollbackInstantUtxoSwapRequestDescriptor = $convert.base64Decode(
    'Ch5Sb2xsYmFja0luc3RhbnRVdHhvU3dhcFJlcXVlc3QSLwoNb25fY2hhaW5fdXR4bxgBIAEoCz'
    'ILLnNwYXJrLlVUWE9SC29uQ2hhaW5VdHhvEhwKCXNpZ25hdHVyZRgCIAEoDFIJc2lnbmF0dXJl'
    'EjQKFmNvb3JkaW5hdG9yX3B1YmxpY19rZXkYAyABKAxSFGNvb3JkaW5hdG9yUHVibGljS2V5Ek'
    'sKFnJvbGxiYWNrX2Zyb21fc3RhdHVzZXMYBCADKA4yFS5zcGFyay5VdHhvU3dhcFN0YXR1c1IU'
    'cm9sbGJhY2tGcm9tU3RhdHVzZXMSQwoScm9sbGJhY2tfdG9fc3RhdHVzGAUgASgOMhUuc3Bhcm'
    'suVXR4b1N3YXBTdGF0dXNSEHJvbGxiYWNrVG9TdGF0dXM=');

@$core.Deprecated('Use rollbackInstantUtxoSwapResponseDescriptor instead')
const RollbackInstantUtxoSwapResponse$json = {
  '1': 'RollbackInstantUtxoSwapResponse',
};

/// Descriptor for `RollbackInstantUtxoSwapResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rollbackInstantUtxoSwapResponseDescriptor =
    $convert.base64Decode('Ch9Sb2xsYmFja0luc3RhbnRVdHhvU3dhcFJlc3BvbnNl');

@$core.Deprecated('Use utxoSwapCompletedRequestDescriptor instead')
const UtxoSwapCompletedRequest$json = {
  '1': 'UtxoSwapCompletedRequest',
  '2': [
    {
      '1': 'on_chain_utxo',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.UTXO',
      '10': 'onChainUtxo'
    },
    {'1': 'signature', '3': 2, '4': 1, '5': 12, '10': 'signature'},
    {
      '1': 'coordinator_public_key',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'coordinatorPublicKey'
    },
  ],
};

/// Descriptor for `UtxoSwapCompletedRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List utxoSwapCompletedRequestDescriptor = $convert.base64Decode(
    'ChhVdHhvU3dhcENvbXBsZXRlZFJlcXVlc3QSLwoNb25fY2hhaW5fdXR4bxgBIAEoCzILLnNwYX'
    'JrLlVUWE9SC29uQ2hhaW5VdHhvEhwKCXNpZ25hdHVyZRgCIAEoDFIJc2lnbmF0dXJlEjQKFmNv'
    'b3JkaW5hdG9yX3B1YmxpY19rZXkYAyABKAxSFGNvb3JkaW5hdG9yUHVibGljS2V5');

@$core.Deprecated('Use utxoSwapCompletedResponseDescriptor instead')
const UtxoSwapCompletedResponse$json = {
  '1': 'UtxoSwapCompletedResponse',
};

/// Descriptor for `UtxoSwapCompletedResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List utxoSwapCompletedResponseDescriptor =
    $convert.base64Decode('ChlVdHhvU3dhcENvbXBsZXRlZFJlc3BvbnNl');

@$core.Deprecated('Use linkUtxoSwapTransferRequestDescriptor instead')
const LinkUtxoSwapTransferRequest$json = {
  '1': 'LinkUtxoSwapTransferRequest',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {'1': 'signature', '3': 2, '4': 1, '5': 12, '10': 'signature'},
    {
      '1': 'coordinator_public_key',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'coordinatorPublicKey'
    },
  ],
};

/// Descriptor for `LinkUtxoSwapTransferRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List linkUtxoSwapTransferRequestDescriptor =
    $convert.base64Decode(
        'ChtMaW5rVXR4b1N3YXBUcmFuc2ZlclJlcXVlc3QSHwoLdHJhbnNmZXJfaWQYASABKAlSCnRyYW'
        '5zZmVySWQSHAoJc2lnbmF0dXJlGAIgASgMUglzaWduYXR1cmUSNAoWY29vcmRpbmF0b3JfcHVi'
        'bGljX2tleRgDIAEoDFIUY29vcmRpbmF0b3JQdWJsaWNLZXk=');

@$core.Deprecated('Use linkUtxoSwapTransferResponseDescriptor instead')
const LinkUtxoSwapTransferResponse$json = {
  '1': 'LinkUtxoSwapTransferResponse',
};

/// Descriptor for `LinkUtxoSwapTransferResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List linkUtxoSwapTransferResponseDescriptor =
    $convert.base64Decode('ChxMaW5rVXR4b1N3YXBUcmFuc2ZlclJlc3BvbnNl');

@$core.Deprecated('Use queryLeafSigningPubkeysRequestDescriptor instead')
const QueryLeafSigningPubkeysRequest$json = {
  '1': 'QueryLeafSigningPubkeysRequest',
  '2': [
    {'1': 'leaf_ids', '3': 1, '4': 3, '5': 9, '10': 'leafIds'},
  ],
};

/// Descriptor for `QueryLeafSigningPubkeysRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryLeafSigningPubkeysRequestDescriptor =
    $convert.base64Decode(
        'Ch5RdWVyeUxlYWZTaWduaW5nUHVia2V5c1JlcXVlc3QSGQoIbGVhZl9pZHMYASADKAlSB2xlYW'
        'ZJZHM=');

@$core.Deprecated('Use queryLeafSigningPubkeysResponseDescriptor instead')
const QueryLeafSigningPubkeysResponse$json = {
  '1': 'QueryLeafSigningPubkeysResponse',
  '2': [
    {
      '1': 'signing_pubkeys',
      '3': 1,
      '4': 3,
      '5': 11,
      '6':
          '.spark_internal.QueryLeafSigningPubkeysResponse.SigningPubkeysEntry',
      '10': 'signingPubkeys'
    },
  ],
  '3': [QueryLeafSigningPubkeysResponse_SigningPubkeysEntry$json],
};

@$core.Deprecated('Use queryLeafSigningPubkeysResponseDescriptor instead')
const QueryLeafSigningPubkeysResponse_SigningPubkeysEntry$json = {
  '1': 'SigningPubkeysEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `QueryLeafSigningPubkeysResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryLeafSigningPubkeysResponseDescriptor =
    $convert.base64Decode(
        'Ch9RdWVyeUxlYWZTaWduaW5nUHVia2V5c1Jlc3BvbnNlEmwKD3NpZ25pbmdfcHVia2V5cxgBIA'
        'MoCzJDLnNwYXJrX2ludGVybmFsLlF1ZXJ5TGVhZlNpZ25pbmdQdWJrZXlzUmVzcG9uc2UuU2ln'
        'bmluZ1B1YmtleXNFbnRyeVIOc2lnbmluZ1B1YmtleXMaQQoTU2lnbmluZ1B1YmtleXNFbnRyeR'
        'IQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoDFIFdmFsdWU6AjgB');

@$core.Deprecated('Use resolveLeafInvestigationRequestDescriptor instead')
const ResolveLeafInvestigationRequest$json = {
  '1': 'ResolveLeafInvestigationRequest',
  '2': [
    {'1': 'lost_leaf_ids', '3': 1, '4': 3, '5': 9, '10': 'lostLeafIds'},
    {
      '1': 'available_leaf_ids',
      '3': 2,
      '4': 3,
      '5': 9,
      '10': 'availableLeafIds'
    },
  ],
};

/// Descriptor for `ResolveLeafInvestigationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolveLeafInvestigationRequestDescriptor =
    $convert.base64Decode(
        'Ch9SZXNvbHZlTGVhZkludmVzdGlnYXRpb25SZXF1ZXN0EiIKDWxvc3RfbGVhZl9pZHMYASADKA'
        'lSC2xvc3RMZWFmSWRzEiwKEmF2YWlsYWJsZV9sZWFmX2lkcxgCIAMoCVIQYXZhaWxhYmxlTGVh'
        'Zklkcw==');

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
    {
      '1': 'key_tweak_proofs',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.spark_internal.ProvidePreimageRequest.KeyTweakProofsEntry',
      '10': 'keyTweakProofs'
    },
  ],
  '3': [ProvidePreimageRequest_KeyTweakProofsEntry$json],
};

@$core.Deprecated('Use providePreimageRequestDescriptor instead')
const ProvidePreimageRequest_KeyTweakProofsEntry$json = {
  '1': 'KeyTweakProofsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.spark.SecretProof',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `ProvidePreimageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List providePreimageRequestDescriptor = $convert.base64Decode(
    'ChZQcm92aWRlUHJlaW1hZ2VSZXF1ZXN0EiEKDHBheW1lbnRfaGFzaBgBIAEoDFILcGF5bWVudE'
    'hhc2gSGgoIcHJlaW1hZ2UYAiABKAxSCHByZWltYWdlEi4KE2lkZW50aXR5X3B1YmxpY19rZXkY'
    'AyABKAxSEWlkZW50aXR5UHVibGljS2V5EmQKEGtleV90d2Vha19wcm9vZnMYBCADKAsyOi5zcG'
    'Fya19pbnRlcm5hbC5Qcm92aWRlUHJlaW1hZ2VSZXF1ZXN0LktleVR3ZWFrUHJvb2ZzRW50cnlS'
    'DmtleVR3ZWFrUHJvb2ZzGlUKE0tleVR3ZWFrUHJvb2ZzRW50cnkSEAoDa2V5GAEgASgJUgNrZX'
    'kSKAoFdmFsdWUYAiABKAsyEi5zcGFyay5TZWNyZXRQcm9vZlIFdmFsdWU6AjgB');

@$core.Deprecated('Use reserveEntityDkgKeyRequestDescriptor instead')
const ReserveEntityDkgKeyRequest$json = {
  '1': 'ReserveEntityDkgKeyRequest',
  '2': [
    {'1': 'keyshare_id', '3': 1, '4': 1, '5': 9, '10': 'keyshareId'},
  ],
};

/// Descriptor for `ReserveEntityDkgKeyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reserveEntityDkgKeyRequestDescriptor =
    $convert.base64Decode(
        'ChpSZXNlcnZlRW50aXR5RGtnS2V5UmVxdWVzdBIfCgtrZXlzaGFyZV9pZBgBIAEoCVIKa2V5c2'
        'hhcmVJZA==');

@$core.Deprecated('Use fixKeyshareRequestDescriptor instead')
const FixKeyshareRequest$json = {
  '1': 'FixKeyshareRequest',
  '2': [
    {'1': 'bad_keyshare_id', '3': 1, '4': 1, '5': 9, '10': 'badKeyshareId'},
    {'1': 'bad_operator_id', '3': 2, '4': 1, '5': 9, '10': 'badOperatorId'},
    {'1': 'good_operator_ids', '3': 3, '4': 3, '5': 9, '10': 'goodOperatorIds'},
  ],
};

/// Descriptor for `FixKeyshareRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fixKeyshareRequestDescriptor = $convert.base64Decode(
    'ChJGaXhLZXlzaGFyZVJlcXVlc3QSJgoPYmFkX2tleXNoYXJlX2lkGAEgASgJUg1iYWRLZXlzaG'
    'FyZUlkEiYKD2JhZF9vcGVyYXRvcl9pZBgCIAEoCVINYmFkT3BlcmF0b3JJZBIqChFnb29kX29w'
    'ZXJhdG9yX2lkcxgDIAMoCVIPZ29vZE9wZXJhdG9ySWRz');

@$core.Deprecated('Use fixKeyshareRound1RequestDescriptor instead')
const FixKeyshareRound1Request$json = {
  '1': 'FixKeyshareRound1Request',
  '2': [
    {'1': 'bad_keyshare_id', '3': 1, '4': 1, '5': 9, '10': 'badKeyshareId'},
    {'1': 'bad_operator_id', '3': 2, '4': 1, '5': 9, '10': 'badOperatorId'},
    {'1': 'good_operator_ids', '3': 3, '4': 3, '5': 9, '10': 'goodOperatorIds'},
  ],
};

/// Descriptor for `FixKeyshareRound1Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fixKeyshareRound1RequestDescriptor = $convert.base64Decode(
    'ChhGaXhLZXlzaGFyZVJvdW5kMVJlcXVlc3QSJgoPYmFkX2tleXNoYXJlX2lkGAEgASgJUg1iYW'
    'RLZXlzaGFyZUlkEiYKD2JhZF9vcGVyYXRvcl9pZBgCIAEoCVINYmFkT3BlcmF0b3JJZBIqChFn'
    'b29kX29wZXJhdG9yX2lkcxgDIAMoCVIPZ29vZE9wZXJhdG9ySWRz');

@$core.Deprecated('Use fixKeyshareRound1ResponseDescriptor instead')
const FixKeyshareRound1Response$json = {
  '1': 'FixKeyshareRound1Response',
  '2': [
    {'1': 'message', '3': 1, '4': 3, '5': 12, '10': 'message'},
  ],
};

/// Descriptor for `FixKeyshareRound1Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fixKeyshareRound1ResponseDescriptor =
    $convert.base64Decode(
        'ChlGaXhLZXlzaGFyZVJvdW5kMVJlc3BvbnNlEhgKB21lc3NhZ2UYASADKAxSB21lc3NhZ2U=');

@$core.Deprecated('Use fixKeyshareRound2RequestDescriptor instead')
const FixKeyshareRound2Request$json = {
  '1': 'FixKeyshareRound2Request',
  '2': [
    {'1': 'bad_keyshare_id', '3': 1, '4': 1, '5': 9, '10': 'badKeyshareId'},
    {'1': 'bad_operator_id', '3': 2, '4': 1, '5': 9, '10': 'badOperatorId'},
    {'1': 'good_operator_ids', '3': 3, '4': 3, '5': 9, '10': 'goodOperatorIds'},
    {'1': 'message', '3': 4, '4': 3, '5': 12, '10': 'message'},
  ],
};

/// Descriptor for `FixKeyshareRound2Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fixKeyshareRound2RequestDescriptor = $convert.base64Decode(
    'ChhGaXhLZXlzaGFyZVJvdW5kMlJlcXVlc3QSJgoPYmFkX2tleXNoYXJlX2lkGAEgASgJUg1iYW'
    'RLZXlzaGFyZUlkEiYKD2JhZF9vcGVyYXRvcl9pZBgCIAEoCVINYmFkT3BlcmF0b3JJZBIqChFn'
    'b29kX29wZXJhdG9yX2lkcxgDIAMoCVIPZ29vZE9wZXJhdG9ySWRzEhgKB21lc3NhZ2UYBCADKA'
    'xSB21lc3NhZ2U=');

@$core.Deprecated('Use fixKeyshareRound2ResponseDescriptor instead')
const FixKeyshareRound2Response$json = {
  '1': 'FixKeyshareRound2Response',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 12, '10': 'message'},
  ],
};

/// Descriptor for `FixKeyshareRound2Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fixKeyshareRound2ResponseDescriptor =
    $convert.base64Decode(
        'ChlGaXhLZXlzaGFyZVJvdW5kMlJlc3BvbnNlEhgKB21lc3NhZ2UYASABKAxSB21lc3NhZ2U=');

@$core.Deprecated('Use getTransfersRequestDescriptor instead')
const GetTransfersRequest$json = {
  '1': 'GetTransfersRequest',
  '2': [
    {'1': 'transfer_ids', '3': 1, '4': 3, '5': 9, '10': 'transferIds'},
  ],
};

/// Descriptor for `GetTransfersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTransfersRequestDescriptor = $convert.base64Decode(
    'ChNHZXRUcmFuc2ZlcnNSZXF1ZXN0EiEKDHRyYW5zZmVyX2lkcxgBIAMoCVILdHJhbnNmZXJJZH'
    'M=');

@$core.Deprecated('Use getTransfersResponseDescriptor instead')
const GetTransfersResponse$json = {
  '1': 'GetTransfersResponse',
  '2': [
    {
      '1': 'transfers',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark.Transfer',
      '10': 'transfers'
    },
  ],
};

/// Descriptor for `GetTransfersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTransfersResponseDescriptor = $convert.base64Decode(
    'ChRHZXRUcmFuc2ZlcnNSZXNwb25zZRItCgl0cmFuc2ZlcnMYASADKAsyDy5zcGFyay5UcmFuc2'
    'ZlclIJdHJhbnNmZXJz');

@$core.Deprecated(
    'Use generateStaticDepositAddressProofsRequestDescriptor instead')
const GenerateStaticDepositAddressProofsRequest$json = {
  '1': 'GenerateStaticDepositAddressProofsRequest',
  '2': [
    {'1': 'keyshare_id', '3': 1, '4': 1, '5': 9, '10': 'keyshareId'},
    {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
    {
      '1': 'owner_identity_public_key',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'ownerIdentityPublicKey'
    },
  ],
};

/// Descriptor for `GenerateStaticDepositAddressProofsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List
    generateStaticDepositAddressProofsRequestDescriptor = $convert.base64Decode(
        'CilHZW5lcmF0ZVN0YXRpY0RlcG9zaXRBZGRyZXNzUHJvb2ZzUmVxdWVzdBIfCgtrZXlzaGFyZV'
        '9pZBgBIAEoCVIKa2V5c2hhcmVJZBIYCgdhZGRyZXNzGAIgASgJUgdhZGRyZXNzEjkKGW93bmVy'
        'X2lkZW50aXR5X3B1YmxpY19rZXkYAyABKAxSFm93bmVySWRlbnRpdHlQdWJsaWNLZXk=');

@$core.Deprecated(
    'Use generateStaticDepositAddressProofsResponseDescriptor instead')
const GenerateStaticDepositAddressProofsResponse$json = {
  '1': 'GenerateStaticDepositAddressProofsResponse',
  '2': [
    {
      '1': 'address_signature',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'addressSignature'
    },
  ],
};

/// Descriptor for `GenerateStaticDepositAddressProofsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List
    generateStaticDepositAddressProofsResponseDescriptor =
    $convert.base64Decode(
        'CipHZW5lcmF0ZVN0YXRpY0RlcG9zaXRBZGRyZXNzUHJvb2ZzUmVzcG9uc2USKwoRYWRkcmVzc1'
        '9zaWduYXR1cmUYASABKAxSEGFkZHJlc3NTaWduYXR1cmU=');

@$core.Deprecated('Use syncNodeRequestDescriptor instead')
const SyncNodeRequest$json = {
  '1': 'SyncNodeRequest',
  '2': [
    {'1': 'node_ids', '3': 1, '4': 3, '5': 9, '10': 'nodeIds'},
    {'1': 'operator_id', '3': 2, '4': 1, '5': 9, '10': 'operatorId'},
  ],
};

/// Descriptor for `SyncNodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncNodeRequestDescriptor = $convert.base64Decode(
    'Cg9TeW5jTm9kZVJlcXVlc3QSGQoIbm9kZV9pZHMYASADKAlSB25vZGVJZHMSHwoLb3BlcmF0b3'
    'JfaWQYAiABKAlSCm9wZXJhdG9ySWQ=');

@$core.Deprecated('Use depositTreePrepareRequestDescriptor instead')
const DepositTreePrepareRequest$json = {
  '1': 'DepositTreePrepareRequest',
  '2': [
    {
      '1': 'original_request',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.FinalizeDepositTreeCreationRequest',
      '10': 'originalRequest'
    },
  ],
};

/// Descriptor for `DepositTreePrepareRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List depositTreePrepareRequestDescriptor = $convert.base64Decode(
    'ChlEZXBvc2l0VHJlZVByZXBhcmVSZXF1ZXN0ElQKEG9yaWdpbmFsX3JlcXVlc3QYASABKAsyKS'
    '5zcGFyay5GaW5hbGl6ZURlcG9zaXRUcmVlQ3JlYXRpb25SZXF1ZXN0Ug9vcmlnaW5hbFJlcXVl'
    'c3Q=');

@$core.Deprecated('Use storePreimageSharePrepareRequestDescriptor instead')
const StorePreimageSharePrepareRequest$json = {
  '1': 'StorePreimageSharePrepareRequest',
  '2': [
    {
      '1': 'original_request',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.spark.StorePreimageShareV2Request',
      '10': 'originalRequest'
    },
  ],
};

/// Descriptor for `StorePreimageSharePrepareRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storePreimageSharePrepareRequestDescriptor =
    $convert.base64Decode(
        'CiBTdG9yZVByZWltYWdlU2hhcmVQcmVwYXJlUmVxdWVzdBJNChBvcmlnaW5hbF9yZXF1ZXN0GA'
        'EgASgLMiIuc3BhcmsuU3RvcmVQcmVpbWFnZVNoYXJlVjJSZXF1ZXN0Ug9vcmlnaW5hbFJlcXVl'
        'c3Q=');

@$core.Deprecated('Use consensusPrepareRequestDescriptor instead')
const ConsensusPrepareRequest$json = {
  '1': 'ConsensusPrepareRequest',
  '2': [
    {'1': 'op_type', '3': 1, '4': 1, '5': 5, '10': 'opType'},
    {
      '1': 'operation',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Any',
      '10': 'operation'
    },
  ],
};

/// Descriptor for `ConsensusPrepareRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List consensusPrepareRequestDescriptor =
    $convert.base64Decode(
        'ChdDb25zZW5zdXNQcmVwYXJlUmVxdWVzdBIXCgdvcF90eXBlGAEgASgFUgZvcFR5cGUSMgoJb3'
        'BlcmF0aW9uGAIgASgLMhQuZ29vZ2xlLnByb3RvYnVmLkFueVIJb3BlcmF0aW9u');

@$core.Deprecated('Use consensusPrepareResponseDescriptor instead')
const ConsensusPrepareResponse$json = {
  '1': 'ConsensusPrepareResponse',
  '2': [
    {
      '1': 'result',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Any',
      '10': 'result'
    },
  ],
};

/// Descriptor for `ConsensusPrepareResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List consensusPrepareResponseDescriptor =
    $convert.base64Decode(
        'ChhDb25zZW5zdXNQcmVwYXJlUmVzcG9uc2USLAoGcmVzdWx0GAEgASgLMhQuZ29vZ2xlLnByb3'
        'RvYnVmLkFueVIGcmVzdWx0');
