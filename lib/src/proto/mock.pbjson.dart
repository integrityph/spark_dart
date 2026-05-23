// This is a generated file - do not edit.
//
// Generated from mock.proto.

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

@$core.Deprecated('Use cleanUpPreimageShareRequestDescriptor instead')
const CleanUpPreimageShareRequest$json = {
  '1': 'CleanUpPreimageShareRequest',
  '2': [
    {'1': 'payment_hash', '3': 1, '4': 1, '5': 12, '10': 'paymentHash'},
  ],
};

/// Descriptor for `CleanUpPreimageShareRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cleanUpPreimageShareRequestDescriptor =
    $convert.base64Decode(
        'ChtDbGVhblVwUHJlaW1hZ2VTaGFyZVJlcXVlc3QSIQoMcGF5bWVudF9oYXNoGAEgASgMUgtwYX'
        'ltZW50SGFzaA==');

@$core.Deprecated('Use updateNodesStatusRequestDescriptor instead')
const UpdateNodesStatusRequest$json = {
  '1': 'UpdateNodesStatusRequest',
  '2': [
    {'1': 'node_ids', '3': 1, '4': 3, '5': 9, '10': 'nodeIds'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `UpdateNodesStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateNodesStatusRequestDescriptor =
    $convert.base64Decode(
        'ChhVcGRhdGVOb2Rlc1N0YXR1c1JlcXVlc3QSGQoIbm9kZV9pZHMYASADKAlSB25vZGVJZHMSFg'
        'oGc3RhdHVzGAIgASgJUgZzdGF0dXM=');

@$core.Deprecated('Use triggerTaskRequestDescriptor instead')
const TriggerTaskRequest$json = {
  '1': 'TriggerTaskRequest',
  '2': [
    {'1': 'task_name', '3': 1, '4': 1, '5': 9, '10': 'taskName'},
  ],
};

/// Descriptor for `TriggerTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List triggerTaskRequestDescriptor =
    $convert.base64Decode(
        'ChJUcmlnZ2VyVGFza1JlcXVlc3QSGwoJdGFza19uYW1lGAEgASgJUgh0YXNrTmFtZQ==');

@$core.Deprecated('Use queryPreimageShareRequestDescriptor instead')
const QueryPreimageShareRequest$json = {
  '1': 'QueryPreimageShareRequest',
  '2': [
    {'1': 'payment_hash', '3': 1, '4': 1, '5': 12, '10': 'paymentHash'},
  ],
};

/// Descriptor for `QueryPreimageShareRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryPreimageShareRequestDescriptor =
    $convert.base64Decode(
        'ChlRdWVyeVByZWltYWdlU2hhcmVSZXF1ZXN0EiEKDHBheW1lbnRfaGFzaBgBIAEoDFILcGF5bW'
        'VudEhhc2g=');

@$core.Deprecated('Use queryPreimageShareResponseDescriptor instead')
const QueryPreimageShareResponse$json = {
  '1': 'QueryPreimageShareResponse',
  '2': [
    {'1': 'preimage_share', '3': 1, '4': 1, '5': 12, '10': 'preimageShare'},
    {'1': 'threshold', '3': 2, '4': 1, '5': 5, '10': 'threshold'},
    {'1': 'invoice_string', '3': 3, '4': 1, '5': 9, '10': 'invoiceString'},
  ],
};

/// Descriptor for `QueryPreimageShareResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryPreimageShareResponseDescriptor =
    $convert.base64Decode(
        'ChpRdWVyeVByZWltYWdlU2hhcmVSZXNwb25zZRIlCg5wcmVpbWFnZV9zaGFyZRgBIAEoDFINcH'
        'JlaW1hZ2VTaGFyZRIcCgl0aHJlc2hvbGQYAiABKAVSCXRocmVzaG9sZBIlCg5pbnZvaWNlX3N0'
        'cmluZxgDIAEoCVINaW52b2ljZVN0cmluZw==');

@$core.Deprecated('Use modifyNodeTimelockRequestDescriptor instead')
const ModifyNodeTimelockRequest$json = {
  '1': 'ModifyNodeTimelockRequest',
  '2': [
    {'1': 'node_id', '3': 1, '4': 1, '5': 9, '10': 'nodeId'},
    {'1': 'node_timelock', '3': 2, '4': 1, '5': 13, '10': 'nodeTimelock'},
    {'1': 'refund_timelock', '3': 3, '4': 1, '5': 13, '10': 'refundTimelock'},
  ],
};

/// Descriptor for `ModifyNodeTimelockRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List modifyNodeTimelockRequestDescriptor = $convert.base64Decode(
    'ChlNb2RpZnlOb2RlVGltZWxvY2tSZXF1ZXN0EhcKB25vZGVfaWQYASABKAlSBm5vZGVJZBIjCg'
    '1ub2RlX3RpbWVsb2NrGAIgASgNUgxub2RlVGltZWxvY2sSJwoPcmVmdW5kX3RpbWVsb2NrGAMg'
    'ASgNUg5yZWZ1bmRUaW1lbG9jaw==');
