// This is a generated file - do not edit.
//
// Generated from gossip.proto.

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

@$core.Deprecated('Use consensusOperationTypeDescriptor instead')
const ConsensusOperationType$json = {
  '1': 'ConsensusOperationType',
  '2': [
    {'1': 'CONSENSUS_OPERATION_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'CONSENSUS_OPERATION_TYPE_FINALIZE_DEPOSIT_TREE', '2': 1},
    {'1': 'CONSENSUS_OPERATION_TYPE_STORE_PREIMAGE_SHARE', '2': 2},
  ],
};

/// Descriptor for `ConsensusOperationType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List consensusOperationTypeDescriptor = $convert.base64Decode(
    'ChZDb25zZW5zdXNPcGVyYXRpb25UeXBlEigKJENPTlNFTlNVU19PUEVSQVRJT05fVFlQRV9VTl'
    'NQRUNJRklFRBAAEjIKLkNPTlNFTlNVU19PUEVSQVRJT05fVFlQRV9GSU5BTElaRV9ERVBPU0lU'
    'X1RSRUUQARIxCi1DT05TRU5TVVNfT1BFUkFUSU9OX1RZUEVfU1RPUkVfUFJFSU1BR0VfU0hBUk'
    'UQAg==');

@$core.Deprecated('Use gossipMessageDescriptor instead')
const GossipMessage$json = {
  '1': 'GossipMessage',
  '2': [
    {'1': 'message_id', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
    {
      '1': 'cancel_transfer',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.gossip.GossipMessageCancelTransfer',
      '9': 0,
      '10': 'cancelTransfer'
    },
    {
      '1': 'settle_sender_key_tweak',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.gossip.GossipMessageSettleSenderKeyTweak',
      '9': 0,
      '10': 'settleSenderKeyTweak'
    },
    {
      '1': 'rollback_transfer',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.gossip.GossipMessageRollbackTransfer',
      '9': 0,
      '10': 'rollbackTransfer'
    },
    {
      '1': 'mark_trees_exited',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.gossip.GossipMessageMarkTreesExited',
      '9': 0,
      '10': 'markTreesExited'
    },
    {
      '1': 'finalize_tree_creation',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.gossip.GossipMessageFinalizeTreeCreation',
      '9': 0,
      '10': 'finalizeTreeCreation'
    },
    {
      '1': 'finalize_transfer',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.gossip.GossipMessageFinalizeTransfer',
      '9': 0,
      '10': 'finalizeTransfer'
    },
    {
      '1': 'finalize_refresh_timelock',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.gossip.GossipMessageFinalizeRefreshTimelock',
      '8': {'3': true},
      '9': 0,
      '10': 'finalizeRefreshTimelock',
    },
    {
      '1': 'finalize_extend_leaf',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.gossip.GossipMessageFinalizeExtendLeaf',
      '8': {'3': true},
      '9': 0,
      '10': 'finalizeExtendLeaf',
    },
    {
      '1': 'rollback_utxo_swap',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.gossip.GossipMessageRollbackUtxoSwap',
      '9': 0,
      '10': 'rollbackUtxoSwap'
    },
    {
      '1': 'deposit_cleanup',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.gossip.GossipMessageDepositCleanup',
      '9': 0,
      '10': 'depositCleanup'
    },
    {
      '1': 'preimage',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.gossip.GossipMessagePreimage',
      '9': 0,
      '10': 'preimage'
    },
    {
      '1': 'finalize_refund_timelock',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.gossip.GossipMessageFinalizeRenewRefundTimelock',
      '9': 0,
      '10': 'finalizeRefundTimelock'
    },
    {
      '1': 'finalize_node_timelock',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.gossip.GossipMessageFinalizeRenewNodeTimelock',
      '9': 0,
      '10': 'finalizeNodeTimelock'
    },
    {
      '1': 'settle_swap_key_tweak',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.gossip.GossipMessageSettleSwapKeyTweak',
      '9': 0,
      '10': 'settleSwapKeyTweak'
    },
    {
      '1': 'update_wallet_setting',
      '3': 17,
      '4': 1,
      '5': 11,
      '6': '.gossip.GossipMessageUpdateWalletSetting',
      '9': 0,
      '10': 'updateWalletSetting'
    },
    {
      '1': 'archive_static_deposit_address',
      '3': 18,
      '4': 1,
      '5': 11,
      '6': '.gossip.GossipMessageArchiveStaticDepositAddress',
      '9': 0,
      '10': 'archiveStaticDepositAddress'
    },
    {
      '1': 'rollback_instant_utxo_swap',
      '3': 19,
      '4': 1,
      '5': 11,
      '6': '.gossip.GossipMessageRollbackInstantUtxoSwap',
      '9': 0,
      '10': 'rollbackInstantUtxoSwap'
    },
    {
      '1': 'finalize_transfer_receiver',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.gossip.GossipMessageFinalizeTransferReceiver',
      '9': 0,
      '10': 'finalizeTransferReceiver'
    },
    {
      '1': 'finalize_tree_node',
      '3': 21,
      '4': 1,
      '5': 11,
      '6': '.gossip.GossipMessageFinalizeTreeNode',
      '9': 0,
      '10': 'finalizeTreeNode'
    },
    {
      '1': 'consensus_commit',
      '3': 22,
      '4': 1,
      '5': 11,
      '6': '.gossip.GossipMessageConsensusCommit',
      '9': 0,
      '10': 'consensusCommit'
    },
    {
      '1': 'consensus_rollback',
      '3': 23,
      '4': 1,
      '5': 11,
      '6': '.gossip.GossipMessageConsensusRollback',
      '9': 0,
      '10': 'consensusRollback'
    },
  ],
  '8': [
    {'1': 'message'},
  ],
  '9': [
    {'1': 3, '2': 4},
  ],
};

/// Descriptor for `GossipMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessageDescriptor = $convert.base64Decode(
    'Cg1Hb3NzaXBNZXNzYWdlEh0KCm1lc3NhZ2VfaWQYASABKAlSCW1lc3NhZ2VJZBJOCg9jYW5jZW'
    'xfdHJhbnNmZXIYAiABKAsyIy5nb3NzaXAuR29zc2lwTWVzc2FnZUNhbmNlbFRyYW5zZmVySABS'
    'DmNhbmNlbFRyYW5zZmVyEmIKF3NldHRsZV9zZW5kZXJfa2V5X3R3ZWFrGAQgASgLMikuZ29zc2'
    'lwLkdvc3NpcE1lc3NhZ2VTZXR0bGVTZW5kZXJLZXlUd2Vha0gAUhRzZXR0bGVTZW5kZXJLZXlU'
    'd2VhaxJUChFyb2xsYmFja190cmFuc2ZlchgFIAEoCzIlLmdvc3NpcC5Hb3NzaXBNZXNzYWdlUm'
    '9sbGJhY2tUcmFuc2ZlckgAUhByb2xsYmFja1RyYW5zZmVyElIKEW1hcmtfdHJlZXNfZXhpdGVk'
    'GAYgASgLMiQuZ29zc2lwLkdvc3NpcE1lc3NhZ2VNYXJrVHJlZXNFeGl0ZWRIAFIPbWFya1RyZW'
    'VzRXhpdGVkEmEKFmZpbmFsaXplX3RyZWVfY3JlYXRpb24YByABKAsyKS5nb3NzaXAuR29zc2lw'
    'TWVzc2FnZUZpbmFsaXplVHJlZUNyZWF0aW9uSABSFGZpbmFsaXplVHJlZUNyZWF0aW9uElQKEW'
    'ZpbmFsaXplX3RyYW5zZmVyGAggASgLMiUuZ29zc2lwLkdvc3NpcE1lc3NhZ2VGaW5hbGl6ZVRy'
    'YW5zZmVySABSEGZpbmFsaXplVHJhbnNmZXISbgoZZmluYWxpemVfcmVmcmVzaF90aW1lbG9jax'
    'gJIAEoCzIsLmdvc3NpcC5Hb3NzaXBNZXNzYWdlRmluYWxpemVSZWZyZXNoVGltZWxvY2tCAhgB'
    'SABSF2ZpbmFsaXplUmVmcmVzaFRpbWVsb2NrEl8KFGZpbmFsaXplX2V4dGVuZF9sZWFmGAogAS'
    'gLMicuZ29zc2lwLkdvc3NpcE1lc3NhZ2VGaW5hbGl6ZUV4dGVuZExlYWZCAhgBSABSEmZpbmFs'
    'aXplRXh0ZW5kTGVhZhJVChJyb2xsYmFja191dHhvX3N3YXAYCyABKAsyJS5nb3NzaXAuR29zc2'
    'lwTWVzc2FnZVJvbGxiYWNrVXR4b1N3YXBIAFIQcm9sbGJhY2tVdHhvU3dhcBJOCg9kZXBvc2l0'
    'X2NsZWFudXAYDCABKAsyIy5nb3NzaXAuR29zc2lwTWVzc2FnZURlcG9zaXRDbGVhbnVwSABSDm'
    'RlcG9zaXRDbGVhbnVwEjsKCHByZWltYWdlGA0gASgLMh0uZ29zc2lwLkdvc3NpcE1lc3NhZ2VQ'
    'cmVpbWFnZUgAUghwcmVpbWFnZRJsChhmaW5hbGl6ZV9yZWZ1bmRfdGltZWxvY2sYDiABKAsyMC'
    '5nb3NzaXAuR29zc2lwTWVzc2FnZUZpbmFsaXplUmVuZXdSZWZ1bmRUaW1lbG9ja0gAUhZmaW5h'
    'bGl6ZVJlZnVuZFRpbWVsb2NrEmYKFmZpbmFsaXplX25vZGVfdGltZWxvY2sYDyABKAsyLi5nb3'
    'NzaXAuR29zc2lwTWVzc2FnZUZpbmFsaXplUmVuZXdOb2RlVGltZWxvY2tIAFIUZmluYWxpemVO'
    'b2RlVGltZWxvY2sSXAoVc2V0dGxlX3N3YXBfa2V5X3R3ZWFrGBAgASgLMicuZ29zc2lwLkdvc3'
    'NpcE1lc3NhZ2VTZXR0bGVTd2FwS2V5VHdlYWtIAFISc2V0dGxlU3dhcEtleVR3ZWFrEl4KFXVw'
    'ZGF0ZV93YWxsZXRfc2V0dGluZxgRIAEoCzIoLmdvc3NpcC5Hb3NzaXBNZXNzYWdlVXBkYXRlV2'
    'FsbGV0U2V0dGluZ0gAUhN1cGRhdGVXYWxsZXRTZXR0aW5nEncKHmFyY2hpdmVfc3RhdGljX2Rl'
    'cG9zaXRfYWRkcmVzcxgSIAEoCzIwLmdvc3NpcC5Hb3NzaXBNZXNzYWdlQXJjaGl2ZVN0YXRpY0'
    'RlcG9zaXRBZGRyZXNzSABSG2FyY2hpdmVTdGF0aWNEZXBvc2l0QWRkcmVzcxJrChpyb2xsYmFj'
    'a19pbnN0YW50X3V0eG9fc3dhcBgTIAEoCzIsLmdvc3NpcC5Hb3NzaXBNZXNzYWdlUm9sbGJhY2'
    'tJbnN0YW50VXR4b1N3YXBIAFIXcm9sbGJhY2tJbnN0YW50VXR4b1N3YXASbQoaZmluYWxpemVf'
    'dHJhbnNmZXJfcmVjZWl2ZXIYFCABKAsyLS5nb3NzaXAuR29zc2lwTWVzc2FnZUZpbmFsaXplVH'
    'JhbnNmZXJSZWNlaXZlckgAUhhmaW5hbGl6ZVRyYW5zZmVyUmVjZWl2ZXISVQoSZmluYWxpemVf'
    'dHJlZV9ub2RlGBUgASgLMiUuZ29zc2lwLkdvc3NpcE1lc3NhZ2VGaW5hbGl6ZVRyZWVOb2RlSA'
    'BSEGZpbmFsaXplVHJlZU5vZGUSUQoQY29uc2Vuc3VzX2NvbW1pdBgWIAEoCzIkLmdvc3NpcC5H'
    'b3NzaXBNZXNzYWdlQ29uc2Vuc3VzQ29tbWl0SABSD2NvbnNlbnN1c0NvbW1pdBJXChJjb25zZW'
    '5zdXNfcm9sbGJhY2sYFyABKAsyJi5nb3NzaXAuR29zc2lwTWVzc2FnZUNvbnNlbnN1c1JvbGxi'
    'YWNrSABSEWNvbnNlbnN1c1JvbGxiYWNrQgkKB21lc3NhZ2VKBAgDEAQ=');

@$core.Deprecated('Use gossipMessageCancelTransferDescriptor instead')
const GossipMessageCancelTransfer$json = {
  '1': 'GossipMessageCancelTransfer',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
  ],
};

/// Descriptor for `GossipMessageCancelTransfer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessageCancelTransferDescriptor =
    $convert.base64Decode(
        'ChtHb3NzaXBNZXNzYWdlQ2FuY2VsVHJhbnNmZXISHwoLdHJhbnNmZXJfaWQYASABKAlSCnRyYW'
        '5zZmVySWQ=');

@$core.Deprecated('Use gossipMessageRollbackTransferDescriptor instead')
const GossipMessageRollbackTransfer$json = {
  '1': 'GossipMessageRollbackTransfer',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
  ],
};

/// Descriptor for `GossipMessageRollbackTransfer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessageRollbackTransferDescriptor =
    $convert.base64Decode(
        'Ch1Hb3NzaXBNZXNzYWdlUm9sbGJhY2tUcmFuc2ZlchIfCgt0cmFuc2Zlcl9pZBgBIAEoCVIKdH'
        'JhbnNmZXJJZA==');

@$core.Deprecated('Use gossipMessageSettleSenderKeyTweakDescriptor instead')
const GossipMessageSettleSenderKeyTweak$json = {
  '1': 'GossipMessageSettleSenderKeyTweak',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {
      '1': 'sender_key_tweak_proofs',
      '3': 2,
      '4': 3,
      '5': 11,
      '6':
          '.gossip.GossipMessageSettleSenderKeyTweak.SenderKeyTweakProofsEntry',
      '10': 'senderKeyTweakProofs'
    },
  ],
  '3': [GossipMessageSettleSenderKeyTweak_SenderKeyTweakProofsEntry$json],
};

@$core.Deprecated('Use gossipMessageSettleSenderKeyTweakDescriptor instead')
const GossipMessageSettleSenderKeyTweak_SenderKeyTweakProofsEntry$json = {
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

/// Descriptor for `GossipMessageSettleSenderKeyTweak`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessageSettleSenderKeyTweakDescriptor = $convert.base64Decode(
    'CiFHb3NzaXBNZXNzYWdlU2V0dGxlU2VuZGVyS2V5VHdlYWsSHwoLdHJhbnNmZXJfaWQYASABKA'
    'lSCnRyYW5zZmVySWQSegoXc2VuZGVyX2tleV90d2Vha19wcm9vZnMYAiADKAsyQy5nb3NzaXAu'
    'R29zc2lwTWVzc2FnZVNldHRsZVNlbmRlcktleVR3ZWFrLlNlbmRlcktleVR3ZWFrUHJvb2ZzRW'
    '50cnlSFHNlbmRlcktleVR3ZWFrUHJvb2ZzGlsKGVNlbmRlcktleVR3ZWFrUHJvb2ZzRW50cnkS'
    'EAoDa2V5GAEgASgJUgNrZXkSKAoFdmFsdWUYAiABKAsyEi5zcGFyay5TZWNyZXRQcm9vZlIFdm'
    'FsdWU6AjgB');

@$core.Deprecated('Use gossipMessageMarkTreesExitedDescriptor instead')
const GossipMessageMarkTreesExited$json = {
  '1': 'GossipMessageMarkTreesExited',
  '2': [
    {'1': 'tree_ids', '3': 1, '4': 3, '5': 9, '10': 'treeIds'},
  ],
};

/// Descriptor for `GossipMessageMarkTreesExited`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessageMarkTreesExitedDescriptor =
    $convert.base64Decode(
        'ChxHb3NzaXBNZXNzYWdlTWFya1RyZWVzRXhpdGVkEhkKCHRyZWVfaWRzGAEgAygJUgd0cmVlSW'
        'Rz');

@$core.Deprecated('Use gossipMessageFinalizeTreeCreationDescriptor instead')
const GossipMessageFinalizeTreeCreation$json = {
  '1': 'GossipMessageFinalizeTreeCreation',
  '2': [
    {
      '1': 'internal_nodes',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark_internal.TreeNode',
      '10': 'internalNodes'
    },
    {
      '1': 'proto_network',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.spark.Network',
      '10': 'protoNetwork'
    },
  ],
};

/// Descriptor for `GossipMessageFinalizeTreeCreation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessageFinalizeTreeCreationDescriptor =
    $convert.base64Decode(
        'CiFHb3NzaXBNZXNzYWdlRmluYWxpemVUcmVlQ3JlYXRpb24SPwoOaW50ZXJuYWxfbm9kZXMYAS'
        'ADKAsyGC5zcGFya19pbnRlcm5hbC5UcmVlTm9kZVINaW50ZXJuYWxOb2RlcxIzCg1wcm90b19u'
        'ZXR3b3JrGAIgASgOMg4uc3BhcmsuTmV0d29ya1IMcHJvdG9OZXR3b3Jr');

@$core.Deprecated('Use gossipMessageFinalizeTransferDescriptor instead')
const GossipMessageFinalizeTransfer$json = {
  '1': 'GossipMessageFinalizeTransfer',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {
      '1': 'internal_nodes',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.spark_internal.TreeNode',
      '10': 'internalNodes'
    },
    {
      '1': 'completion_timestamp',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'completionTimestamp'
    },
  ],
};

/// Descriptor for `GossipMessageFinalizeTransfer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessageFinalizeTransferDescriptor = $convert.base64Decode(
    'Ch1Hb3NzaXBNZXNzYWdlRmluYWxpemVUcmFuc2ZlchIfCgt0cmFuc2Zlcl9pZBgBIAEoCVIKdH'
    'JhbnNmZXJJZBI/Cg5pbnRlcm5hbF9ub2RlcxgCIAMoCzIYLnNwYXJrX2ludGVybmFsLlRyZWVO'
    'b2RlUg1pbnRlcm5hbE5vZGVzEk0KFGNvbXBsZXRpb25fdGltZXN0YW1wGAMgASgLMhouZ29vZ2'
    'xlLnByb3RvYnVmLlRpbWVzdGFtcFITY29tcGxldGlvblRpbWVzdGFtcA==');

@$core.Deprecated('Use gossipMessageFinalizeTransferReceiverDescriptor instead')
const GossipMessageFinalizeTransferReceiver$json = {
  '1': 'GossipMessageFinalizeTransferReceiver',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {
      '1': 'receiver_identity_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'receiverIdentityPublicKey'
    },
    {
      '1': 'internal_nodes',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.spark_internal.TreeNode',
      '10': 'internalNodes'
    },
    {
      '1': 'completion_timestamp',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'completionTimestamp'
    },
  ],
};

/// Descriptor for `GossipMessageFinalizeTransferReceiver`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessageFinalizeTransferReceiverDescriptor = $convert.base64Decode(
    'CiVHb3NzaXBNZXNzYWdlRmluYWxpemVUcmFuc2ZlclJlY2VpdmVyEh8KC3RyYW5zZmVyX2lkGA'
    'EgASgJUgp0cmFuc2ZlcklkEj8KHHJlY2VpdmVyX2lkZW50aXR5X3B1YmxpY19rZXkYAiABKAxS'
    'GXJlY2VpdmVySWRlbnRpdHlQdWJsaWNLZXkSPwoOaW50ZXJuYWxfbm9kZXMYAyADKAsyGC5zcG'
    'Fya19pbnRlcm5hbC5UcmVlTm9kZVINaW50ZXJuYWxOb2RlcxJNChRjb21wbGV0aW9uX3RpbWVz'
    'dGFtcBgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSE2NvbXBsZXRpb25UaW1lc3'
    'RhbXA=');

@$core.Deprecated('Use gossipMessageFinalizeRefreshTimelockDescriptor instead')
const GossipMessageFinalizeRefreshTimelock$json = {
  '1': 'GossipMessageFinalizeRefreshTimelock',
  '2': [
    {
      '1': 'internal_nodes',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark_internal.TreeNode',
      '10': 'internalNodes'
    },
  ],
};

/// Descriptor for `GossipMessageFinalizeRefreshTimelock`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessageFinalizeRefreshTimelockDescriptor =
    $convert.base64Decode(
        'CiRHb3NzaXBNZXNzYWdlRmluYWxpemVSZWZyZXNoVGltZWxvY2sSPwoOaW50ZXJuYWxfbm9kZX'
        'MYASADKAsyGC5zcGFya19pbnRlcm5hbC5UcmVlTm9kZVINaW50ZXJuYWxOb2Rlcw==');

@$core.Deprecated('Use gossipMessageFinalizeExtendLeafDescriptor instead')
const GossipMessageFinalizeExtendLeaf$json = {
  '1': 'GossipMessageFinalizeExtendLeaf',
  '2': [
    {
      '1': 'internal_nodes',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.spark_internal.TreeNode',
      '10': 'internalNodes'
    },
  ],
};

/// Descriptor for `GossipMessageFinalizeExtendLeaf`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessageFinalizeExtendLeafDescriptor =
    $convert.base64Decode(
        'Ch9Hb3NzaXBNZXNzYWdlRmluYWxpemVFeHRlbmRMZWFmEj8KDmludGVybmFsX25vZGVzGAEgAy'
        'gLMhguc3BhcmtfaW50ZXJuYWwuVHJlZU5vZGVSDWludGVybmFsTm9kZXM=');

@$core.Deprecated(
    'Use gossipMessageFinalizeRenewRefundTimelockDescriptor instead')
const GossipMessageFinalizeRenewRefundTimelock$json = {
  '1': 'GossipMessageFinalizeRenewRefundTimelock',
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

/// Descriptor for `GossipMessageFinalizeRenewRefundTimelock`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessageFinalizeRenewRefundTimelockDescriptor =
    $convert.base64Decode(
        'CihHb3NzaXBNZXNzYWdlRmluYWxpemVSZW5ld1JlZnVuZFRpbWVsb2NrEiwKBG5vZGUYASABKA'
        'syGC5zcGFya19pbnRlcm5hbC5UcmVlTm9kZVIEbm9kZQ==');

@$core
    .Deprecated('Use gossipMessageFinalizeRenewNodeTimelockDescriptor instead')
const GossipMessageFinalizeRenewNodeTimelock$json = {
  '1': 'GossipMessageFinalizeRenewNodeTimelock',
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

/// Descriptor for `GossipMessageFinalizeRenewNodeTimelock`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessageFinalizeRenewNodeTimelockDescriptor =
    $convert.base64Decode(
        'CiZHb3NzaXBNZXNzYWdlRmluYWxpemVSZW5ld05vZGVUaW1lbG9jaxI3CgpzcGxpdF9ub2RlGA'
        'EgASgLMhguc3BhcmtfaW50ZXJuYWwuVHJlZU5vZGVSCXNwbGl0Tm9kZRIsCgRub2RlGAIgASgL'
        'Mhguc3BhcmtfaW50ZXJuYWwuVHJlZU5vZGVSBG5vZGU=');

@$core.Deprecated('Use gossipMessageRollbackUtxoSwapDescriptor instead')
const GossipMessageRollbackUtxoSwap$json = {
  '1': 'GossipMessageRollbackUtxoSwap',
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

/// Descriptor for `GossipMessageRollbackUtxoSwap`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessageRollbackUtxoSwapDescriptor = $convert.base64Decode(
    'Ch1Hb3NzaXBNZXNzYWdlUm9sbGJhY2tVdHhvU3dhcBIvCg1vbl9jaGFpbl91dHhvGAEgASgLMg'
    'suc3BhcmsuVVRYT1ILb25DaGFpblV0eG8SHAoJc2lnbmF0dXJlGAIgASgMUglzaWduYXR1cmUS'
    'NAoWY29vcmRpbmF0b3JfcHVibGljX2tleRgDIAEoDFIUY29vcmRpbmF0b3JQdWJsaWNLZXk=');

@$core.Deprecated('Use gossipMessageRollbackInstantUtxoSwapDescriptor instead')
const GossipMessageRollbackInstantUtxoSwap$json = {
  '1': 'GossipMessageRollbackInstantUtxoSwap',
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

/// Descriptor for `GossipMessageRollbackInstantUtxoSwap`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessageRollbackInstantUtxoSwapDescriptor = $convert.base64Decode(
    'CiRHb3NzaXBNZXNzYWdlUm9sbGJhY2tJbnN0YW50VXR4b1N3YXASLwoNb25fY2hhaW5fdXR4bx'
    'gBIAEoCzILLnNwYXJrLlVUWE9SC29uQ2hhaW5VdHhvEhwKCXNpZ25hdHVyZRgCIAEoDFIJc2ln'
    'bmF0dXJlEjQKFmNvb3JkaW5hdG9yX3B1YmxpY19rZXkYAyABKAxSFGNvb3JkaW5hdG9yUHVibG'
    'ljS2V5EksKFnJvbGxiYWNrX2Zyb21fc3RhdHVzZXMYBCADKA4yFS5zcGFyay5VdHhvU3dhcFN0'
    'YXR1c1IUcm9sbGJhY2tGcm9tU3RhdHVzZXMSQwoScm9sbGJhY2tfdG9fc3RhdHVzGAUgASgOMh'
    'Uuc3BhcmsuVXR4b1N3YXBTdGF0dXNSEHJvbGxiYWNrVG9TdGF0dXM=');

@$core.Deprecated('Use gossipMessageDepositCleanupDescriptor instead')
const GossipMessageDepositCleanup$json = {
  '1': 'GossipMessageDepositCleanup',
  '2': [
    {'1': 'tree_id', '3': 1, '4': 1, '5': 9, '10': 'treeId'},
  ],
};

/// Descriptor for `GossipMessageDepositCleanup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessageDepositCleanupDescriptor =
    $convert.base64Decode(
        'ChtHb3NzaXBNZXNzYWdlRGVwb3NpdENsZWFudXASFwoHdHJlZV9pZBgBIAEoCVIGdHJlZUlk');

@$core.Deprecated('Use gossipMessagePreimageDescriptor instead')
const GossipMessagePreimage$json = {
  '1': 'GossipMessagePreimage',
  '2': [
    {'1': 'preimage', '3': 1, '4': 1, '5': 12, '10': 'preimage'},
    {'1': 'payment_hash', '3': 2, '4': 1, '5': 12, '10': 'paymentHash'},
  ],
};

/// Descriptor for `GossipMessagePreimage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessagePreimageDescriptor = $convert.base64Decode(
    'ChVHb3NzaXBNZXNzYWdlUHJlaW1hZ2USGgoIcHJlaW1hZ2UYASABKAxSCHByZWltYWdlEiEKDH'
    'BheW1lbnRfaGFzaBgCIAEoDFILcGF5bWVudEhhc2g=');

@$core.Deprecated('Use gossipMessageSettleSwapKeyTweakDescriptor instead')
const GossipMessageSettleSwapKeyTweak$json = {
  '1': 'GossipMessageSettleSwapKeyTweak',
  '2': [
    {
      '1': 'counter_transfer_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'counterTransferId'
    },
  ],
};

/// Descriptor for `GossipMessageSettleSwapKeyTweak`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessageSettleSwapKeyTweakDescriptor =
    $convert.base64Decode(
        'Ch9Hb3NzaXBNZXNzYWdlU2V0dGxlU3dhcEtleVR3ZWFrEi4KE2NvdW50ZXJfdHJhbnNmZXJfaW'
        'QYASABKAlSEWNvdW50ZXJUcmFuc2Zlcklk');

@$core.Deprecated('Use gossipMessageUpdateWalletSettingDescriptor instead')
const GossipMessageUpdateWalletSetting$json = {
  '1': 'GossipMessageUpdateWalletSetting',
  '2': [
    {
      '1': 'owner_identity_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'ownerIdentityPublicKey'
    },
    {
      '1': 'private_enabled',
      '3': 2,
      '4': 1,
      '5': 8,
      '9': 1,
      '10': 'privateEnabled',
      '17': true
    },
    {
      '1': 'set_master_identity_public_key',
      '3': 3,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'setMasterIdentityPublicKey'
    },
    {
      '1': 'clear_master_identity_public_key',
      '3': 4,
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

/// Descriptor for `GossipMessageUpdateWalletSetting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessageUpdateWalletSettingDescriptor = $convert.base64Decode(
    'CiBHb3NzaXBNZXNzYWdlVXBkYXRlV2FsbGV0U2V0dGluZxI5Chlvd25lcl9pZGVudGl0eV9wdW'
    'JsaWNfa2V5GAEgASgMUhZvd25lcklkZW50aXR5UHVibGljS2V5EiwKD3ByaXZhdGVfZW5hYmxl'
    'ZBgCIAEoCEgBUg5wcml2YXRlRW5hYmxlZIgBARJECh5zZXRfbWFzdGVyX2lkZW50aXR5X3B1Ym'
    'xpY19rZXkYAyABKAxIAFIac2V0TWFzdGVySWRlbnRpdHlQdWJsaWNLZXkSSAogY2xlYXJfbWFz'
    'dGVyX2lkZW50aXR5X3B1YmxpY19rZXkYBCABKAhIAFIcY2xlYXJNYXN0ZXJJZGVudGl0eVB1Ym'
    'xpY0tleUIcChptYXN0ZXJfaWRlbnRpdHlfcHVibGljX2tleUISChBfcHJpdmF0ZV9lbmFibGVk');

@$core.Deprecated(
    'Use gossipMessageArchiveStaticDepositAddressDescriptor instead')
const GossipMessageArchiveStaticDepositAddress$json = {
  '1': 'GossipMessageArchiveStaticDepositAddress',
  '2': [
    {
      '1': 'owner_identity_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'ownerIdentityPublicKey'
    },
    {
      '1': 'network',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.spark.Network',
      '10': 'network'
    },
    {'1': 'address', '3': 3, '4': 1, '5': 9, '10': 'address'},
    {'1': 'signature', '3': 4, '4': 1, '5': 12, '10': 'signature'},
    {
      '1': 'coordinator_public_key',
      '3': 5,
      '4': 1,
      '5': 12,
      '10': 'coordinatorPublicKey'
    },
  ],
};

/// Descriptor for `GossipMessageArchiveStaticDepositAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessageArchiveStaticDepositAddressDescriptor =
    $convert.base64Decode(
        'CihHb3NzaXBNZXNzYWdlQXJjaGl2ZVN0YXRpY0RlcG9zaXRBZGRyZXNzEjkKGW93bmVyX2lkZW'
        '50aXR5X3B1YmxpY19rZXkYASABKAxSFm93bmVySWRlbnRpdHlQdWJsaWNLZXkSKAoHbmV0d29y'
        'axgCIAEoDjIOLnNwYXJrLk5ldHdvcmtSB25ldHdvcmsSGAoHYWRkcmVzcxgDIAEoCVIHYWRkcm'
        'VzcxIcCglzaWduYXR1cmUYBCABKAxSCXNpZ25hdHVyZRI0ChZjb29yZGluYXRvcl9wdWJsaWNf'
        'a2V5GAUgASgMUhRjb29yZGluYXRvclB1YmxpY0tleQ==');

@$core.Deprecated('Use gossipMessageFinalizeTreeNodeDescriptor instead')
const GossipMessageFinalizeTreeNode$json = {
  '1': 'GossipMessageFinalizeTreeNode',
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

/// Descriptor for `GossipMessageFinalizeTreeNode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessageFinalizeTreeNodeDescriptor =
    $convert.base64Decode(
        'Ch1Hb3NzaXBNZXNzYWdlRmluYWxpemVUcmVlTm9kZRIuCgVub2RlcxgBIAMoCzIYLnNwYXJrX2'
        'ludGVybmFsLlRyZWVOb2RlUgVub2Rlcw==');

@$core.Deprecated('Use gossipMessageConsensusCommitDescriptor instead')
const GossipMessageConsensusCommit$json = {
  '1': 'GossipMessageConsensusCommit',
  '2': [
    {
      '1': 'op_type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.gossip.ConsensusOperationType',
      '10': 'opType'
    },
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

/// Descriptor for `GossipMessageConsensusCommit`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessageConsensusCommitDescriptor =
    $convert.base64Decode(
        'ChxHb3NzaXBNZXNzYWdlQ29uc2Vuc3VzQ29tbWl0EjcKB29wX3R5cGUYASABKA4yHi5nb3NzaX'
        'AuQ29uc2Vuc3VzT3BlcmF0aW9uVHlwZVIGb3BUeXBlEjIKCW9wZXJhdGlvbhgCIAEoCzIULmdv'
        'b2dsZS5wcm90b2J1Zi5BbnlSCW9wZXJhdGlvbg==');

@$core.Deprecated('Use gossipMessageConsensusRollbackDescriptor instead')
const GossipMessageConsensusRollback$json = {
  '1': 'GossipMessageConsensusRollback',
  '2': [
    {
      '1': 'op_type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.gossip.ConsensusOperationType',
      '10': 'opType'
    },
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

/// Descriptor for `GossipMessageConsensusRollback`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipMessageConsensusRollbackDescriptor =
    $convert.base64Decode(
        'Ch5Hb3NzaXBNZXNzYWdlQ29uc2Vuc3VzUm9sbGJhY2sSNwoHb3BfdHlwZRgBIAEoDjIeLmdvc3'
        'NpcC5Db25zZW5zdXNPcGVyYXRpb25UeXBlUgZvcFR5cGUSMgoJb3BlcmF0aW9uGAIgASgLMhQu'
        'Z29vZ2xlLnByb3RvYnVmLkFueVIJb3BlcmF0aW9u');
