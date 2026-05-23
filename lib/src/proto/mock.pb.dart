// This is a generated file - do not edit.
//
// Generated from mock.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class CleanUpPreimageShareRequest extends $pb.GeneratedMessage {
  factory CleanUpPreimageShareRequest({
    $core.List<$core.int>? paymentHash,
  }) {
    final result = create();
    if (paymentHash != null) result.paymentHash = paymentHash;
    return result;
  }

  CleanUpPreimageShareRequest._();

  factory CleanUpPreimageShareRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CleanUpPreimageShareRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CleanUpPreimageShareRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mock'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'paymentHash', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CleanUpPreimageShareRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CleanUpPreimageShareRequest copyWith(
          void Function(CleanUpPreimageShareRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CleanUpPreimageShareRequest))
          as CleanUpPreimageShareRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CleanUpPreimageShareRequest create() =>
      CleanUpPreimageShareRequest._();
  @$core.override
  CleanUpPreimageShareRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CleanUpPreimageShareRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CleanUpPreimageShareRequest>(create);
  static CleanUpPreimageShareRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get paymentHash => $_getN(0);
  @$pb.TagNumber(1)
  set paymentHash($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPaymentHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaymentHash() => $_clearField(1);
}

class UpdateNodesStatusRequest extends $pb.GeneratedMessage {
  factory UpdateNodesStatusRequest({
    $core.Iterable<$core.String>? nodeIds,
    $core.String? status,
  }) {
    final result = create();
    if (nodeIds != null) result.nodeIds.addAll(nodeIds);
    if (status != null) result.status = status;
    return result;
  }

  UpdateNodesStatusRequest._();

  factory UpdateNodesStatusRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateNodesStatusRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateNodesStatusRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mock'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'nodeIds')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateNodesStatusRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateNodesStatusRequest copyWith(
          void Function(UpdateNodesStatusRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateNodesStatusRequest))
          as UpdateNodesStatusRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateNodesStatusRequest create() => UpdateNodesStatusRequest._();
  @$core.override
  UpdateNodesStatusRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateNodesStatusRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateNodesStatusRequest>(create);
  static UpdateNodesStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get nodeIds => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);
}

/// TriggerTaskRequest is used to trigger a scheduled task immediately in hermetic tests.
class TriggerTaskRequest extends $pb.GeneratedMessage {
  factory TriggerTaskRequest({
    $core.String? taskName,
  }) {
    final result = create();
    if (taskName != null) result.taskName = taskName;
    return result;
  }

  TriggerTaskRequest._();

  factory TriggerTaskRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TriggerTaskRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TriggerTaskRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mock'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TriggerTaskRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TriggerTaskRequest copyWith(void Function(TriggerTaskRequest) updates) =>
      super.copyWith((message) => updates(message as TriggerTaskRequest))
          as TriggerTaskRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TriggerTaskRequest create() => TriggerTaskRequest._();
  @$core.override
  TriggerTaskRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TriggerTaskRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TriggerTaskRequest>(create);
  static TriggerTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskName => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTaskName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskName() => $_clearField(1);
}

class QueryPreimageShareRequest extends $pb.GeneratedMessage {
  factory QueryPreimageShareRequest({
    $core.List<$core.int>? paymentHash,
  }) {
    final result = create();
    if (paymentHash != null) result.paymentHash = paymentHash;
    return result;
  }

  QueryPreimageShareRequest._();

  factory QueryPreimageShareRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryPreimageShareRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryPreimageShareRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mock'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'paymentHash', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryPreimageShareRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryPreimageShareRequest copyWith(
          void Function(QueryPreimageShareRequest) updates) =>
      super.copyWith((message) => updates(message as QueryPreimageShareRequest))
          as QueryPreimageShareRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryPreimageShareRequest create() => QueryPreimageShareRequest._();
  @$core.override
  QueryPreimageShareRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryPreimageShareRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryPreimageShareRequest>(create);
  static QueryPreimageShareRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get paymentHash => $_getN(0);
  @$pb.TagNumber(1)
  set paymentHash($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPaymentHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaymentHash() => $_clearField(1);
}

class QueryPreimageShareResponse extends $pb.GeneratedMessage {
  factory QueryPreimageShareResponse({
    $core.List<$core.int>? preimageShare,
    $core.int? threshold,
    $core.String? invoiceString,
  }) {
    final result = create();
    if (preimageShare != null) result.preimageShare = preimageShare;
    if (threshold != null) result.threshold = threshold;
    if (invoiceString != null) result.invoiceString = invoiceString;
    return result;
  }

  QueryPreimageShareResponse._();

  factory QueryPreimageShareResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryPreimageShareResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryPreimageShareResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mock'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'preimageShare', $pb.PbFieldType.OY)
    ..aI(2, _omitFieldNames ? '' : 'threshold')
    ..aOS(3, _omitFieldNames ? '' : 'invoiceString')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryPreimageShareResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryPreimageShareResponse copyWith(
          void Function(QueryPreimageShareResponse) updates) =>
      super.copyWith(
              (message) => updates(message as QueryPreimageShareResponse))
          as QueryPreimageShareResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryPreimageShareResponse create() => QueryPreimageShareResponse._();
  @$core.override
  QueryPreimageShareResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryPreimageShareResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryPreimageShareResponse>(create);
  static QueryPreimageShareResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get preimageShare => $_getN(0);
  @$pb.TagNumber(1)
  set preimageShare($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPreimageShare() => $_has(0);
  @$pb.TagNumber(1)
  void clearPreimageShare() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get threshold => $_getIZ(1);
  @$pb.TagNumber(2)
  set threshold($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasThreshold() => $_has(1);
  @$pb.TagNumber(2)
  void clearThreshold() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get invoiceString => $_getSZ(2);
  @$pb.TagNumber(3)
  set invoiceString($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasInvoiceString() => $_has(2);
  @$pb.TagNumber(3)
  void clearInvoiceString() => $_clearField(3);
}

class ModifyNodeTimelockRequest extends $pb.GeneratedMessage {
  factory ModifyNodeTimelockRequest({
    $core.String? nodeId,
    $core.int? nodeTimelock,
    $core.int? refundTimelock,
  }) {
    final result = create();
    if (nodeId != null) result.nodeId = nodeId;
    if (nodeTimelock != null) result.nodeTimelock = nodeTimelock;
    if (refundTimelock != null) result.refundTimelock = refundTimelock;
    return result;
  }

  ModifyNodeTimelockRequest._();

  factory ModifyNodeTimelockRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ModifyNodeTimelockRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ModifyNodeTimelockRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mock'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nodeId')
    ..aI(2, _omitFieldNames ? '' : 'nodeTimelock',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'refundTimelock',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ModifyNodeTimelockRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ModifyNodeTimelockRequest copyWith(
          void Function(ModifyNodeTimelockRequest) updates) =>
      super.copyWith((message) => updates(message as ModifyNodeTimelockRequest))
          as ModifyNodeTimelockRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ModifyNodeTimelockRequest create() => ModifyNodeTimelockRequest._();
  @$core.override
  ModifyNodeTimelockRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ModifyNodeTimelockRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ModifyNodeTimelockRequest>(create);
  static ModifyNodeTimelockRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nodeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set nodeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNodeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNodeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get nodeTimelock => $_getIZ(1);
  @$pb.TagNumber(2)
  set nodeTimelock($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNodeTimelock() => $_has(1);
  @$pb.TagNumber(2)
  void clearNodeTimelock() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get refundTimelock => $_getIZ(2);
  @$pb.TagNumber(3)
  set refundTimelock($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRefundTimelock() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefundTimelock() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
