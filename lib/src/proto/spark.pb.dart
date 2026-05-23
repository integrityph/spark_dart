// This is a generated file - do not edit.
//
// Generated from spark.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $3;

import 'common.pb.dart' as $2;
import 'spark.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'spark.pbenum.dart';

class SubscribeToEventsRequest extends $pb.GeneratedMessage {
  factory SubscribeToEventsRequest({
    $core.List<$core.int>? identityPublicKey,
  }) {
    final result = create();
    if (identityPublicKey != null) result.identityPublicKey = identityPublicKey;
    return result;
  }

  SubscribeToEventsRequest._();

  factory SubscribeToEventsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubscribeToEventsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubscribeToEventsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        10, _omitFieldNames ? '' : 'identityPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubscribeToEventsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubscribeToEventsRequest copyWith(
          void Function(SubscribeToEventsRequest) updates) =>
      super.copyWith((message) => updates(message as SubscribeToEventsRequest))
          as SubscribeToEventsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeToEventsRequest create() => SubscribeToEventsRequest._();
  @$core.override
  SubscribeToEventsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubscribeToEventsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubscribeToEventsRequest>(create);
  static SubscribeToEventsRequest? _defaultInstance;

  @$pb.TagNumber(10)
  $core.List<$core.int> get identityPublicKey => $_getN(0);
  @$pb.TagNumber(10)
  set identityPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(10)
  $core.bool hasIdentityPublicKey() => $_has(0);
  @$pb.TagNumber(10)
  void clearIdentityPublicKey() => $_clearField(10);
}

enum SubscribeToEventsResponse_Event {
  receiverTransfer,
  deposit,
  connected,
  senderTransfer,
  heartbeat,
  tokenTransaction,
  notSet
}

class SubscribeToEventsResponse extends $pb.GeneratedMessage {
  factory SubscribeToEventsResponse({
    TransferEvent? receiverTransfer,
    DepositEvent? deposit,
    ConnectedEvent? connected,
    TransferEvent? senderTransfer,
    HeartbeatEvent? heartbeat,
    TokenTransactionEvent? tokenTransaction,
  }) {
    final result = create();
    if (receiverTransfer != null) result.receiverTransfer = receiverTransfer;
    if (deposit != null) result.deposit = deposit;
    if (connected != null) result.connected = connected;
    if (senderTransfer != null) result.senderTransfer = senderTransfer;
    if (heartbeat != null) result.heartbeat = heartbeat;
    if (tokenTransaction != null) result.tokenTransaction = tokenTransaction;
    return result;
  }

  SubscribeToEventsResponse._();

  factory SubscribeToEventsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubscribeToEventsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SubscribeToEventsResponse_Event>
      _SubscribeToEventsResponse_EventByTag = {
    1: SubscribeToEventsResponse_Event.receiverTransfer,
    2: SubscribeToEventsResponse_Event.deposit,
    3: SubscribeToEventsResponse_Event.connected,
    4: SubscribeToEventsResponse_Event.senderTransfer,
    5: SubscribeToEventsResponse_Event.heartbeat,
    6: SubscribeToEventsResponse_Event.tokenTransaction,
    0: SubscribeToEventsResponse_Event.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubscribeToEventsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6])
    ..aOM<TransferEvent>(1, _omitFieldNames ? '' : 'transfer',
        protoName: 'receiver_transfer', subBuilder: TransferEvent.create)
    ..aOM<DepositEvent>(2, _omitFieldNames ? '' : 'deposit',
        subBuilder: DepositEvent.create)
    ..aOM<ConnectedEvent>(3, _omitFieldNames ? '' : 'connected',
        subBuilder: ConnectedEvent.create)
    ..aOM<TransferEvent>(4, _omitFieldNames ? '' : 'senderTransfer',
        subBuilder: TransferEvent.create)
    ..aOM<HeartbeatEvent>(5, _omitFieldNames ? '' : 'heartbeat',
        subBuilder: HeartbeatEvent.create)
    ..aOM<TokenTransactionEvent>(6, _omitFieldNames ? '' : 'tokenTransaction',
        subBuilder: TokenTransactionEvent.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubscribeToEventsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubscribeToEventsResponse copyWith(
          void Function(SubscribeToEventsResponse) updates) =>
      super.copyWith((message) => updates(message as SubscribeToEventsResponse))
          as SubscribeToEventsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeToEventsResponse create() => SubscribeToEventsResponse._();
  @$core.override
  SubscribeToEventsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubscribeToEventsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubscribeToEventsResponse>(create);
  static SubscribeToEventsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  SubscribeToEventsResponse_Event whichEvent() =>
      _SubscribeToEventsResponse_EventByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  void clearEvent() => $_clearField($_whichOneof(0));

  /// Include json_name for backwards compatibility for those who are using json serialization.
  @$pb.TagNumber(1)
  TransferEvent get receiverTransfer => $_getN(0);
  @$pb.TagNumber(1)
  set receiverTransfer(TransferEvent value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasReceiverTransfer() => $_has(0);
  @$pb.TagNumber(1)
  void clearReceiverTransfer() => $_clearField(1);
  @$pb.TagNumber(1)
  TransferEvent ensureReceiverTransfer() => $_ensure(0);

  @$pb.TagNumber(2)
  DepositEvent get deposit => $_getN(1);
  @$pb.TagNumber(2)
  set deposit(DepositEvent value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDeposit() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeposit() => $_clearField(2);
  @$pb.TagNumber(2)
  DepositEvent ensureDeposit() => $_ensure(1);

  @$pb.TagNumber(3)
  ConnectedEvent get connected => $_getN(2);
  @$pb.TagNumber(3)
  set connected(ConnectedEvent value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasConnected() => $_has(2);
  @$pb.TagNumber(3)
  void clearConnected() => $_clearField(3);
  @$pb.TagNumber(3)
  ConnectedEvent ensureConnected() => $_ensure(2);

  @$pb.TagNumber(4)
  TransferEvent get senderTransfer => $_getN(3);
  @$pb.TagNumber(4)
  set senderTransfer(TransferEvent value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasSenderTransfer() => $_has(3);
  @$pb.TagNumber(4)
  void clearSenderTransfer() => $_clearField(4);
  @$pb.TagNumber(4)
  TransferEvent ensureSenderTransfer() => $_ensure(3);

  @$pb.TagNumber(5)
  HeartbeatEvent get heartbeat => $_getN(4);
  @$pb.TagNumber(5)
  set heartbeat(HeartbeatEvent value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasHeartbeat() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeartbeat() => $_clearField(5);
  @$pb.TagNumber(5)
  HeartbeatEvent ensureHeartbeat() => $_ensure(4);

  @$pb.TagNumber(6)
  TokenTransactionEvent get tokenTransaction => $_getN(5);
  @$pb.TagNumber(6)
  set tokenTransaction(TokenTransactionEvent value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasTokenTransaction() => $_has(5);
  @$pb.TagNumber(6)
  void clearTokenTransaction() => $_clearField(6);
  @$pb.TagNumber(6)
  TokenTransactionEvent ensureTokenTransaction() => $_ensure(5);
}

class TokenTransactionEvent extends $pb.GeneratedMessage {
  factory TokenTransactionEvent({
    $core.List<$core.int>? tokenTransactionHash,
    $core.Iterable<$core.List<$core.int>>? tokenIdentifiers,
    $core.Iterable<$core.String>? sparkInvoices,
  }) {
    final result = create();
    if (tokenTransactionHash != null)
      result.tokenTransactionHash = tokenTransactionHash;
    if (tokenIdentifiers != null)
      result.tokenIdentifiers.addAll(tokenIdentifiers);
    if (sparkInvoices != null) result.sparkInvoices.addAll(sparkInvoices);
    return result;
  }

  TokenTransactionEvent._();

  factory TokenTransactionEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenTransactionEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenTransactionEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'tokenTransactionHash', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'tokenIdentifiers', $pb.PbFieldType.PY)
    ..pPS(3, _omitFieldNames ? '' : 'sparkInvoices')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenTransactionEvent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenTransactionEvent copyWith(
          void Function(TokenTransactionEvent) updates) =>
      super.copyWith((message) => updates(message as TokenTransactionEvent))
          as TokenTransactionEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenTransactionEvent create() => TokenTransactionEvent._();
  @$core.override
  TokenTransactionEvent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenTransactionEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenTransactionEvent>(create);
  static TokenTransactionEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get tokenTransactionHash => $_getN(0);
  @$pb.TagNumber(1)
  set tokenTransactionHash($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTokenTransactionHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearTokenTransactionHash() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.List<$core.int>> get tokenIdentifiers => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get sparkInvoices => $_getList(2);
}

class ConnectedEvent extends $pb.GeneratedMessage {
  factory ConnectedEvent() => create();

  ConnectedEvent._();

  factory ConnectedEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConnectedEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConnectedEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectedEvent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectedEvent copyWith(void Function(ConnectedEvent) updates) =>
      super.copyWith((message) => updates(message as ConnectedEvent))
          as ConnectedEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectedEvent create() => ConnectedEvent._();
  @$core.override
  ConnectedEvent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConnectedEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConnectedEvent>(create);
  static ConnectedEvent? _defaultInstance;
}

class HeartbeatEvent extends $pb.GeneratedMessage {
  factory HeartbeatEvent() => create();

  HeartbeatEvent._();

  factory HeartbeatEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HeartbeatEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HeartbeatEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartbeatEvent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartbeatEvent copyWith(void Function(HeartbeatEvent) updates) =>
      super.copyWith((message) => updates(message as HeartbeatEvent))
          as HeartbeatEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeartbeatEvent create() => HeartbeatEvent._();
  @$core.override
  HeartbeatEvent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HeartbeatEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartbeatEvent>(create);
  static HeartbeatEvent? _defaultInstance;
}

class TransferEvent extends $pb.GeneratedMessage {
  factory TransferEvent({
    Transfer? transfer,
    $core.String? traceId,
  }) {
    final result = create();
    if (transfer != null) result.transfer = transfer;
    if (traceId != null) result.traceId = traceId;
    return result;
  }

  TransferEvent._();

  factory TransferEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransferEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransferEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<Transfer>(10, _omitFieldNames ? '' : 'transfer',
        subBuilder: Transfer.create)
    ..aOS(11, _omitFieldNames ? '' : 'traceId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferEvent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferEvent copyWith(void Function(TransferEvent) updates) =>
      super.copyWith((message) => updates(message as TransferEvent))
          as TransferEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferEvent create() => TransferEvent._();
  @$core.override
  TransferEvent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransferEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransferEvent>(create);
  static TransferEvent? _defaultInstance;

  @$pb.TagNumber(10)
  Transfer get transfer => $_getN(0);
  @$pb.TagNumber(10)
  set transfer(Transfer value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasTransfer() => $_has(0);
  @$pb.TagNumber(10)
  void clearTransfer() => $_clearField(10);
  @$pb.TagNumber(10)
  Transfer ensureTransfer() => $_ensure(0);

  @$pb.TagNumber(11)
  $core.String get traceId => $_getSZ(1);
  @$pb.TagNumber(11)
  set traceId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(11)
  $core.bool hasTraceId() => $_has(1);
  @$pb.TagNumber(11)
  void clearTraceId() => $_clearField(11);
}

class DepositEvent extends $pb.GeneratedMessage {
  factory DepositEvent({
    TreeNode? deposit,
    $core.String? traceId,
  }) {
    final result = create();
    if (deposit != null) result.deposit = deposit;
    if (traceId != null) result.traceId = traceId;
    return result;
  }

  DepositEvent._();

  factory DepositEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DepositEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DepositEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<TreeNode>(10, _omitFieldNames ? '' : 'deposit',
        subBuilder: TreeNode.create)
    ..aOS(11, _omitFieldNames ? '' : 'traceId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DepositEvent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DepositEvent copyWith(void Function(DepositEvent) updates) =>
      super.copyWith((message) => updates(message as DepositEvent))
          as DepositEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DepositEvent create() => DepositEvent._();
  @$core.override
  DepositEvent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DepositEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DepositEvent>(create);
  static DepositEvent? _defaultInstance;

  @$pb.TagNumber(10)
  TreeNode get deposit => $_getN(0);
  @$pb.TagNumber(10)
  set deposit(TreeNode value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasDeposit() => $_has(0);
  @$pb.TagNumber(10)
  void clearDeposit() => $_clearField(10);
  @$pb.TagNumber(10)
  TreeNode ensureDeposit() => $_ensure(0);

  @$pb.TagNumber(11)
  $core.String get traceId => $_getSZ(1);
  @$pb.TagNumber(11)
  set traceId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(11)
  $core.bool hasTraceId() => $_has(1);
  @$pb.TagNumber(11)
  void clearTraceId() => $_clearField(11);
}

class PageRequest extends $pb.GeneratedMessage {
  factory PageRequest({
    $core.int? unsafePageSize,
    $core.String? cursor,
    Direction? direction,
    $core.int? pageSize,
  }) {
    final result = create();
    if (unsafePageSize != null) result.unsafePageSize = unsafePageSize;
    if (cursor != null) result.cursor = cursor;
    if (direction != null) result.direction = direction;
    if (pageSize != null) result.pageSize = pageSize;
    return result;
  }

  PageRequest._();

  factory PageRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PageRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PageRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'unsafePageSize')
    ..aOS(2, _omitFieldNames ? '' : 'cursor')
    ..aE<Direction>(3, _omitFieldNames ? '' : 'direction',
        enumValues: Direction.values)
    ..aI(4, _omitFieldNames ? '' : 'pageSize', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PageRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PageRequest copyWith(void Function(PageRequest) updates) =>
      super.copyWith((message) => updates(message as PageRequest))
          as PageRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PageRequest create() => PageRequest._();
  @$core.override
  PageRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PageRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PageRequest>(create);
  static PageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get unsafePageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set unsafePageSize($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUnsafePageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnsafePageSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get cursor => $_getSZ(1);
  @$pb.TagNumber(2)
  set cursor($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCursor() => $_has(1);
  @$pb.TagNumber(2)
  void clearCursor() => $_clearField(2);

  @$pb.TagNumber(3)
  Direction get direction => $_getN(2);
  @$pb.TagNumber(3)
  set direction(Direction value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDirection() => $_has(2);
  @$pb.TagNumber(3)
  void clearDirection() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get pageSize => $_getIZ(3);
  @$pb.TagNumber(4)
  set pageSize($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPageSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearPageSize() => $_clearField(4);
}

class PageResponse extends $pb.GeneratedMessage {
  factory PageResponse({
    $core.bool? hasNextPage,
    $core.bool? hasPreviousPage,
    $core.String? nextCursor,
    $core.String? previousCursor,
  }) {
    final result = create();
    if (hasNextPage != null) result.hasNextPage = hasNextPage;
    if (hasPreviousPage != null) result.hasPreviousPage = hasPreviousPage;
    if (nextCursor != null) result.nextCursor = nextCursor;
    if (previousCursor != null) result.previousCursor = previousCursor;
    return result;
  }

  PageResponse._();

  factory PageResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PageResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PageResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'hasNextPage')
    ..aOB(2, _omitFieldNames ? '' : 'hasPreviousPage')
    ..aOS(3, _omitFieldNames ? '' : 'nextCursor')
    ..aOS(4, _omitFieldNames ? '' : 'previousCursor')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PageResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PageResponse copyWith(void Function(PageResponse) updates) =>
      super.copyWith((message) => updates(message as PageResponse))
          as PageResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PageResponse create() => PageResponse._();
  @$core.override
  PageResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PageResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PageResponse>(create);
  static PageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get hasNextPage => $_getBF(0);
  @$pb.TagNumber(1)
  set hasNextPage($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHasNextPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearHasNextPage() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get hasPreviousPage => $_getBF(1);
  @$pb.TagNumber(2)
  set hasPreviousPage($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHasPreviousPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearHasPreviousPage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get nextCursor => $_getSZ(2);
  @$pb.TagNumber(3)
  set nextCursor($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNextCursor() => $_has(2);
  @$pb.TagNumber(3)
  void clearNextCursor() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get previousCursor => $_getSZ(3);
  @$pb.TagNumber(4)
  set previousCursor($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPreviousCursor() => $_has(3);
  @$pb.TagNumber(4)
  void clearPreviousCursor() => $_clearField(4);
}

/// *
///  DepositAddressProof is the proof of possession of the deposit address.
///  When a user wants to generate a deposit address, they are sending their public key to the SE,
///  and the SE will respond with an address of user's public key + SE's public key.
///
///  In the trusty deposit flow, user will need to know that this address is valid, and no single SE
///  can generate this address.
///
///  The SE will need to sign the address with their identity keys, and have a proof of possession of
///  the signing key piece that the SE holds.
class DepositAddressProof extends $pb.GeneratedMessage {
  factory DepositAddressProof({
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        addressSignatures,
    $core.List<$core.int>? proofOfPossessionSignature,
  }) {
    final result = create();
    if (addressSignatures != null)
      result.addressSignatures.addEntries(addressSignatures);
    if (proofOfPossessionSignature != null)
      result.proofOfPossessionSignature = proofOfPossessionSignature;
    return result;
  }

  DepositAddressProof._();

  factory DepositAddressProof.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DepositAddressProof.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DepositAddressProof',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..m<$core.String, $core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'addressSignatures',
        entryClassName: 'DepositAddressProof.AddressSignaturesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark'))
    ..a<$core.List<$core.int>>(2,
        _omitFieldNames ? '' : 'proofOfPossessionSignature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DepositAddressProof clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DepositAddressProof copyWith(void Function(DepositAddressProof) updates) =>
      super.copyWith((message) => updates(message as DepositAddressProof))
          as DepositAddressProof;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DepositAddressProof create() => DepositAddressProof._();
  @$core.override
  DepositAddressProof createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DepositAddressProof getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DepositAddressProof>(create);
  static DepositAddressProof? _defaultInstance;

  /// The signatures of the address by the SE's identity keys.
  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $core.List<$core.int>> get addressSignatures =>
      $_getMap(0);

  /// The proof of possession of the signing key piece by the SE.
  @$pb.TagNumber(2)
  $core.List<$core.int> get proofOfPossessionSignature => $_getN(1);
  @$pb.TagNumber(2)
  set proofOfPossessionSignature($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasProofOfPossessionSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearProofOfPossessionSignature() => $_clearField(2);
}

/// *
///  GenerateDepositAddressRequest is the request to generate a deposit address.
///  The user will send their public key to the SE, and the SE will respond with an address of user's
///  public key + SE's public key.
class GenerateDepositAddressRequest extends $pb.GeneratedMessage {
  factory GenerateDepositAddressRequest({
    $core.List<$core.int>? signingPublicKey,
    $core.List<$core.int>? identityPublicKey,
    Network? network,
    $core.String? leafId,
    $core.bool? isStatic,
    HashVariant? hashVariant,
  }) {
    final result = create();
    if (signingPublicKey != null) result.signingPublicKey = signingPublicKey;
    if (identityPublicKey != null) result.identityPublicKey = identityPublicKey;
    if (network != null) result.network = network;
    if (leafId != null) result.leafId = leafId;
    if (isStatic != null) result.isStatic = isStatic;
    if (hashVariant != null) result.hashVariant = hashVariant;
    return result;
  }

  GenerateDepositAddressRequest._();

  factory GenerateDepositAddressRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateDepositAddressRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateDepositAddressRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'signingPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'identityPublicKey', $pb.PbFieldType.OY)
    ..aE<Network>(3, _omitFieldNames ? '' : 'network',
        enumValues: Network.values)
    ..aOS(4, _omitFieldNames ? '' : 'leafId')
    ..aOB(5, _omitFieldNames ? '' : 'isStatic')
    ..aE<HashVariant>(6, _omitFieldNames ? '' : 'hashVariant',
        enumValues: HashVariant.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateDepositAddressRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateDepositAddressRequest copyWith(
          void Function(GenerateDepositAddressRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GenerateDepositAddressRequest))
          as GenerateDepositAddressRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateDepositAddressRequest create() =>
      GenerateDepositAddressRequest._();
  @$core.override
  GenerateDepositAddressRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateDepositAddressRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateDepositAddressRequest>(create);
  static GenerateDepositAddressRequest? _defaultInstance;

  /// The signing public key of the user.
  @$pb.TagNumber(1)
  $core.List<$core.int> get signingPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set signingPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSigningPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSigningPublicKey() => $_clearField(1);

  /// The identity public key of the user.
  @$pb.TagNumber(2)
  $core.List<$core.int> get identityPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set identityPublicKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdentityPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentityPublicKey() => $_clearField(2);

  /// The network of the bitcoin network.
  @$pb.TagNumber(3)
  Network get network => $_getN(2);
  @$pb.TagNumber(3)
  set network(Network value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasNetwork() => $_has(2);
  @$pb.TagNumber(3)
  void clearNetwork() => $_clearField(3);

  /// The UUID to use for the created TreeNode
  @$pb.TagNumber(4)
  $core.String get leafId => $_getSZ(3);
  @$pb.TagNumber(4)
  set leafId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLeafId() => $_has(3);
  @$pb.TagNumber(4)
  void clearLeafId() => $_clearField(4);

  /// Generate static deposit address
  @$pb.TagNumber(5)
  $core.bool get isStatic => $_getBF(4);
  @$pb.TagNumber(5)
  set isStatic($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIsStatic() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsStatic() => $_clearField(5);

  /// The hash variant to use for computing the proof of possession message hash.
  @$pb.TagNumber(6)
  HashVariant get hashVariant => $_getN(5);
  @$pb.TagNumber(6)
  set hashVariant(HashVariant value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasHashVariant() => $_has(5);
  @$pb.TagNumber(6)
  void clearHashVariant() => $_clearField(6);
}

/// *
///  Address is the address of the user's public key + SE's public key.
class Address extends $pb.GeneratedMessage {
  factory Address({
    $core.String? address,
    $core.List<$core.int>? verifyingKey,
    DepositAddressProof? depositAddressProof,
    $core.bool? isStatic,
  }) {
    final result = create();
    if (address != null) result.address = address;
    if (verifyingKey != null) result.verifyingKey = verifyingKey;
    if (depositAddressProof != null)
      result.depositAddressProof = depositAddressProof;
    if (isStatic != null) result.isStatic = isStatic;
    return result;
  }

  Address._();

  factory Address.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Address.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Address',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'verifyingKey', $pb.PbFieldType.OY)
    ..aOM<DepositAddressProof>(3, _omitFieldNames ? '' : 'depositAddressProof',
        subBuilder: DepositAddressProof.create)
    ..aOB(5, _omitFieldNames ? '' : 'isStatic')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Address clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Address copyWith(void Function(Address) updates) =>
      super.copyWith((message) => updates(message as Address)) as Address;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Address create() => Address._();
  @$core.override
  Address createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Address getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Address>(create);
  static Address? _defaultInstance;

  /// The p2tr address of the user's public key + SE's public key.
  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => $_clearField(1);

  /// The verifying key of the address, which is user's public key + SE's public key.
  @$pb.TagNumber(2)
  $core.List<$core.int> get verifyingKey => $_getN(1);
  @$pb.TagNumber(2)
  set verifyingKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVerifyingKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearVerifyingKey() => $_clearField(2);

  /// The proof of possession of the address by the SE.
  @$pb.TagNumber(3)
  DepositAddressProof get depositAddressProof => $_getN(2);
  @$pb.TagNumber(3)
  set depositAddressProof(DepositAddressProof value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDepositAddressProof() => $_has(2);
  @$pb.TagNumber(3)
  void clearDepositAddressProof() => $_clearField(3);
  @$pb.TagNumber(3)
  DepositAddressProof ensureDepositAddressProof() => $_ensure(2);

  /// Is it a static deposit address
  @$pb.TagNumber(5)
  $core.bool get isStatic => $_getBF(3);
  @$pb.TagNumber(5)
  set isStatic($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(5)
  $core.bool hasIsStatic() => $_has(3);
  @$pb.TagNumber(5)
  void clearIsStatic() => $_clearField(5);
}

/// *
///  GenerateDepositAddressResponse is the response to the request to generate a deposit address.
class GenerateDepositAddressResponse extends $pb.GeneratedMessage {
  factory GenerateDepositAddressResponse({
    Address? depositAddress,
  }) {
    final result = create();
    if (depositAddress != null) result.depositAddress = depositAddress;
    return result;
  }

  GenerateDepositAddressResponse._();

  factory GenerateDepositAddressResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateDepositAddressResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateDepositAddressResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<Address>(1, _omitFieldNames ? '' : 'depositAddress',
        subBuilder: Address.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateDepositAddressResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateDepositAddressResponse copyWith(
          void Function(GenerateDepositAddressResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GenerateDepositAddressResponse))
          as GenerateDepositAddressResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateDepositAddressResponse create() =>
      GenerateDepositAddressResponse._();
  @$core.override
  GenerateDepositAddressResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateDepositAddressResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateDepositAddressResponse>(create);
  static GenerateDepositAddressResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Address get depositAddress => $_getN(0);
  @$pb.TagNumber(1)
  set depositAddress(Address value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasDepositAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearDepositAddress() => $_clearField(1);
  @$pb.TagNumber(1)
  Address ensureDepositAddress() => $_ensure(0);
}

/// *
///  GenerateStaticDepositAddressRequest is the request to generate a static deposit address.
class GenerateStaticDepositAddressRequest extends $pb.GeneratedMessage {
  factory GenerateStaticDepositAddressRequest({
    $core.List<$core.int>? signingPublicKey,
    $core.List<$core.int>? identityPublicKey,
    Network? network,
    HashVariant? hashVariant,
  }) {
    final result = create();
    if (signingPublicKey != null) result.signingPublicKey = signingPublicKey;
    if (identityPublicKey != null) result.identityPublicKey = identityPublicKey;
    if (network != null) result.network = network;
    if (hashVariant != null) result.hashVariant = hashVariant;
    return result;
  }

  GenerateStaticDepositAddressRequest._();

  factory GenerateStaticDepositAddressRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateStaticDepositAddressRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateStaticDepositAddressRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'signingPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'identityPublicKey', $pb.PbFieldType.OY)
    ..aE<Network>(3, _omitFieldNames ? '' : 'network',
        enumValues: Network.values)
    ..aE<HashVariant>(4, _omitFieldNames ? '' : 'hashVariant',
        enumValues: HashVariant.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateStaticDepositAddressRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateStaticDepositAddressRequest copyWith(
          void Function(GenerateStaticDepositAddressRequest) updates) =>
      super.copyWith((message) =>
              updates(message as GenerateStaticDepositAddressRequest))
          as GenerateStaticDepositAddressRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateStaticDepositAddressRequest create() =>
      GenerateStaticDepositAddressRequest._();
  @$core.override
  GenerateStaticDepositAddressRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateStaticDepositAddressRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GenerateStaticDepositAddressRequest>(create);
  static GenerateStaticDepositAddressRequest? _defaultInstance;

  /// The signing public key of the user.
  @$pb.TagNumber(1)
  $core.List<$core.int> get signingPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set signingPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSigningPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSigningPublicKey() => $_clearField(1);

  /// The identity public key of the user.
  @$pb.TagNumber(2)
  $core.List<$core.int> get identityPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set identityPublicKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdentityPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentityPublicKey() => $_clearField(2);

  /// The network of the bitcoin network.
  @$pb.TagNumber(3)
  Network get network => $_getN(2);
  @$pb.TagNumber(3)
  set network(Network value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasNetwork() => $_has(2);
  @$pb.TagNumber(3)
  void clearNetwork() => $_clearField(3);

  /// The hash variant to use for computing the proof of possession message hash.
  @$pb.TagNumber(4)
  HashVariant get hashVariant => $_getN(3);
  @$pb.TagNumber(4)
  set hashVariant(HashVariant value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasHashVariant() => $_has(3);
  @$pb.TagNumber(4)
  void clearHashVariant() => $_clearField(4);
}

/// *
///  GenerateStaticDepositAddressResponse is the response to the request to generate a static deposit address.
class GenerateStaticDepositAddressResponse extends $pb.GeneratedMessage {
  factory GenerateStaticDepositAddressResponse({
    Address? depositAddress,
  }) {
    final result = create();
    if (depositAddress != null) result.depositAddress = depositAddress;
    return result;
  }

  GenerateStaticDepositAddressResponse._();

  factory GenerateStaticDepositAddressResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateStaticDepositAddressResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateStaticDepositAddressResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<Address>(1, _omitFieldNames ? '' : 'depositAddress',
        subBuilder: Address.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateStaticDepositAddressResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateStaticDepositAddressResponse copyWith(
          void Function(GenerateStaticDepositAddressResponse) updates) =>
      super.copyWith((message) =>
              updates(message as GenerateStaticDepositAddressResponse))
          as GenerateStaticDepositAddressResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateStaticDepositAddressResponse create() =>
      GenerateStaticDepositAddressResponse._();
  @$core.override
  GenerateStaticDepositAddressResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateStaticDepositAddressResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GenerateStaticDepositAddressResponse>(create);
  static GenerateStaticDepositAddressResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Address get depositAddress => $_getN(0);
  @$pb.TagNumber(1)
  set depositAddress(Address value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasDepositAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearDepositAddress() => $_clearField(1);
  @$pb.TagNumber(1)
  Address ensureDepositAddress() => $_ensure(0);
}

/// *
///  Request to rotate a static deposit address.
///  This archives the current default address and generates a new one.
///  Old address still can be used to receive deposits.
class RotateStaticDepositAddressRequest extends $pb.GeneratedMessage {
  factory RotateStaticDepositAddressRequest({
    $core.List<$core.int>? signingPublicKey,
    Network? network,
    HashVariant? hashVariant,
  }) {
    final result = create();
    if (signingPublicKey != null) result.signingPublicKey = signingPublicKey;
    if (network != null) result.network = network;
    if (hashVariant != null) result.hashVariant = hashVariant;
    return result;
  }

  RotateStaticDepositAddressRequest._();

  factory RotateStaticDepositAddressRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RotateStaticDepositAddressRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RotateStaticDepositAddressRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'signingPublicKey', $pb.PbFieldType.OY)
    ..aE<Network>(2, _omitFieldNames ? '' : 'network',
        enumValues: Network.values)
    ..aE<HashVariant>(3, _omitFieldNames ? '' : 'hashVariant',
        enumValues: HashVariant.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RotateStaticDepositAddressRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RotateStaticDepositAddressRequest copyWith(
          void Function(RotateStaticDepositAddressRequest) updates) =>
      super.copyWith((message) =>
              updates(message as RotateStaticDepositAddressRequest))
          as RotateStaticDepositAddressRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RotateStaticDepositAddressRequest create() =>
      RotateStaticDepositAddressRequest._();
  @$core.override
  RotateStaticDepositAddressRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RotateStaticDepositAddressRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RotateStaticDepositAddressRequest>(
          create);
  static RotateStaticDepositAddressRequest? _defaultInstance;

  /// The signing public key of the user to aggregate with SO keys and produce the
  /// final pubkey used to generate P2TR address.
  @$pb.TagNumber(1)
  $core.List<$core.int> get signingPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set signingPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSigningPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSigningPublicKey() => $_clearField(1);

  /// The network of the bitcoin network.
  @$pb.TagNumber(2)
  Network get network => $_getN(1);
  @$pb.TagNumber(2)
  set network(Network value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNetwork() => $_has(1);
  @$pb.TagNumber(2)
  void clearNetwork() => $_clearField(2);

  /// The hash variant to use for computing the proof of possession message hash.
  @$pb.TagNumber(3)
  HashVariant get hashVariant => $_getN(2);
  @$pb.TagNumber(3)
  set hashVariant(HashVariant value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasHashVariant() => $_has(2);
  @$pb.TagNumber(3)
  void clearHashVariant() => $_clearField(3);
}

/// *
///  Response to the request to rotate a static deposit address.
class RotateStaticDepositAddressResponse extends $pb.GeneratedMessage {
  factory RotateStaticDepositAddressResponse({
    Address? newDepositAddress,
    Address? archivedDepositAddress,
  }) {
    final result = create();
    if (newDepositAddress != null) result.newDepositAddress = newDepositAddress;
    if (archivedDepositAddress != null)
      result.archivedDepositAddress = archivedDepositAddress;
    return result;
  }

  RotateStaticDepositAddressResponse._();

  factory RotateStaticDepositAddressResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RotateStaticDepositAddressResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RotateStaticDepositAddressResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<Address>(1, _omitFieldNames ? '' : 'newDepositAddress',
        subBuilder: Address.create)
    ..aOM<Address>(2, _omitFieldNames ? '' : 'archivedDepositAddress',
        subBuilder: Address.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RotateStaticDepositAddressResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RotateStaticDepositAddressResponse copyWith(
          void Function(RotateStaticDepositAddressResponse) updates) =>
      super.copyWith((message) =>
              updates(message as RotateStaticDepositAddressResponse))
          as RotateStaticDepositAddressResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RotateStaticDepositAddressResponse create() =>
      RotateStaticDepositAddressResponse._();
  @$core.override
  RotateStaticDepositAddressResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RotateStaticDepositAddressResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RotateStaticDepositAddressResponse>(
          create);
  static RotateStaticDepositAddressResponse? _defaultInstance;

  /// The newly generated default deposit address.
  @$pb.TagNumber(1)
  Address get newDepositAddress => $_getN(0);
  @$pb.TagNumber(1)
  set newDepositAddress(Address value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasNewDepositAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearNewDepositAddress() => $_clearField(1);
  @$pb.TagNumber(1)
  Address ensureNewDepositAddress() => $_ensure(0);

  /// The archived (previous default) deposit address.
  @$pb.TagNumber(2)
  Address get archivedDepositAddress => $_getN(1);
  @$pb.TagNumber(2)
  set archivedDepositAddress(Address value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasArchivedDepositAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearArchivedDepositAddress() => $_clearField(2);
  @$pb.TagNumber(2)
  Address ensureArchivedDepositAddress() => $_ensure(1);
}

/// *
///  UTXO represents a utxo on the bitcoin network.
///  The UTXO is used to create a tree on Spark, it can also be an off-chain utxo so that the user
///  can create the tree first and the broadcast the transaction.
class UTXO extends $pb.GeneratedMessage {
  factory UTXO({
    $core.List<$core.int>? rawTx,
    $core.int? vout,
    Network? network,
    $core.List<$core.int>? txid,
  }) {
    final result = create();
    if (rawTx != null) result.rawTx = rawTx;
    if (vout != null) result.vout = vout;
    if (network != null) result.network = network;
    if (txid != null) result.txid = txid;
    return result;
  }

  UTXO._();

  factory UTXO.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UTXO.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UTXO',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'rawTx', $pb.PbFieldType.OY)
    ..aI(2, _omitFieldNames ? '' : 'vout', fieldType: $pb.PbFieldType.OU3)
    ..aE<Network>(3, _omitFieldNames ? '' : 'network',
        enumValues: Network.values)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'txid', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UTXO clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UTXO copyWith(void Function(UTXO) updates) =>
      super.copyWith((message) => updates(message as UTXO)) as UTXO;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UTXO create() => UTXO._();
  @$core.override
  UTXO createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UTXO getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UTXO>(create);
  static UTXO? _defaultInstance;

  /// The raw transaction of the utxo (optional).
  @$pb.TagNumber(1)
  $core.List<$core.int> get rawTx => $_getN(0);
  @$pb.TagNumber(1)
  set rawTx($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRawTx() => $_has(0);
  @$pb.TagNumber(1)
  void clearRawTx() => $_clearField(1);

  /// The vout of the raw transaction for the utxo, which will be used to create the tree. Required.
  @$pb.TagNumber(2)
  $core.int get vout => $_getIZ(1);
  @$pb.TagNumber(2)
  set vout($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVout() => $_has(1);
  @$pb.TagNumber(2)
  void clearVout() => $_clearField(2);

  /// The network of the bitcoin network. Required.
  @$pb.TagNumber(3)
  Network get network => $_getN(2);
  @$pb.TagNumber(3)
  set network(Network value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasNetwork() => $_has(2);
  @$pb.TagNumber(3)
  void clearNetwork() => $_clearField(3);

  /// Transaction Id string, produced from transaction hash by reversing the bytes,
  /// converted to bytes. Required, but older code may not provide it.
  @$pb.TagNumber(4)
  $core.List<$core.int> get txid => $_getN(3);
  @$pb.TagNumber(4)
  set txid($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTxid() => $_has(3);
  @$pb.TagNumber(4)
  void clearTxid() => $_clearField(4);
}

class AddressedUtxo extends $pb.GeneratedMessage {
  factory AddressedUtxo({
    $core.String? address,
    UTXO? utxo,
    $core.bool? isConfirmed,
  }) {
    final result = create();
    if (address != null) result.address = address;
    if (utxo != null) result.utxo = utxo;
    if (isConfirmed != null) result.isConfirmed = isConfirmed;
    return result;
  }

  AddressedUtxo._();

  factory AddressedUtxo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddressedUtxo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddressedUtxo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..aOM<UTXO>(2, _omitFieldNames ? '' : 'utxo', subBuilder: UTXO.create)
    ..aOB(3, _omitFieldNames ? '' : 'isConfirmed')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddressedUtxo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddressedUtxo copyWith(void Function(AddressedUtxo) updates) =>
      super.copyWith((message) => updates(message as AddressedUtxo))
          as AddressedUtxo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddressedUtxo create() => AddressedUtxo._();
  @$core.override
  AddressedUtxo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddressedUtxo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddressedUtxo>(create);
  static AddressedUtxo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => $_clearField(1);

  @$pb.TagNumber(2)
  UTXO get utxo => $_getN(1);
  @$pb.TagNumber(2)
  set utxo(UTXO value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUtxo() => $_has(1);
  @$pb.TagNumber(2)
  void clearUtxo() => $_clearField(2);
  @$pb.TagNumber(2)
  UTXO ensureUtxo() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get isConfirmed => $_getBF(2);
  @$pb.TagNumber(3)
  set isConfirmed($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsConfirmed() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsConfirmed() => $_clearField(3);
}

/// *
///  NodeOutput represents a node on the tree.
///  This is similar to a UTXO, which is used to create a subtree on Spark. But instead of using
///  a utxo, a existing node on the tree is used as the utxo.
class NodeOutput extends $pb.GeneratedMessage {
  factory NodeOutput({
    $core.String? nodeId,
    $core.int? vout,
  }) {
    final result = create();
    if (nodeId != null) result.nodeId = nodeId;
    if (vout != null) result.vout = vout;
    return result;
  }

  NodeOutput._();

  factory NodeOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NodeOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NodeOutput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nodeId')
    ..aI(2, _omitFieldNames ? '' : 'vout', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NodeOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NodeOutput copyWith(void Function(NodeOutput) updates) =>
      super.copyWith((message) => updates(message as NodeOutput)) as NodeOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NodeOutput create() => NodeOutput._();
  @$core.override
  NodeOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NodeOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NodeOutput>(create);
  static NodeOutput? _defaultInstance;

  /// The id of the node.
  @$pb.TagNumber(1)
  $core.String get nodeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set nodeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNodeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNodeId() => $_clearField(1);

  /// The vout of the raw transaction for the node, which will be used to create the tree.
  @$pb.TagNumber(2)
  $core.int get vout => $_getIZ(1);
  @$pb.TagNumber(2)
  set vout($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVout() => $_has(1);
  @$pb.TagNumber(2)
  void clearVout() => $_clearField(2);
}

/// *
///  SigningJob is the job for signing a transaction.
///  The signing job is used to sign a bitcoin transaction using Spark FROST.
class SigningJob extends $pb.GeneratedMessage {
  factory SigningJob({
    $core.List<$core.int>? signingPublicKey,
    $core.List<$core.int>? rawTx,
    $2.SigningCommitment? signingNonceCommitment,
  }) {
    final result = create();
    if (signingPublicKey != null) result.signingPublicKey = signingPublicKey;
    if (rawTx != null) result.rawTx = rawTx;
    if (signingNonceCommitment != null)
      result.signingNonceCommitment = signingNonceCommitment;
    return result;
  }

  SigningJob._();

  factory SigningJob.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningJob.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningJob',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'signingPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'rawTx', $pb.PbFieldType.OY)
    ..aOM<$2.SigningCommitment>(
        3, _omitFieldNames ? '' : 'signingNonceCommitment',
        subBuilder: $2.SigningCommitment.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningJob clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningJob copyWith(void Function(SigningJob) updates) =>
      super.copyWith((message) => updates(message as SigningJob)) as SigningJob;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SigningJob create() => SigningJob._();
  @$core.override
  SigningJob createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SigningJob getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SigningJob>(create);
  static SigningJob? _defaultInstance;

  /// The signing public key of the user.
  @$pb.TagNumber(1)
  $core.List<$core.int> get signingPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set signingPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSigningPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSigningPublicKey() => $_clearField(1);

  /// The unsigned raw transaction to be signed.
  @$pb.TagNumber(2)
  $core.List<$core.int> get rawTx => $_getN(1);
  @$pb.TagNumber(2)
  set rawTx($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRawTx() => $_has(1);
  @$pb.TagNumber(2)
  void clearRawTx() => $_clearField(2);

  /// The signing nonce commitment of the user.
  @$pb.TagNumber(3)
  $2.SigningCommitment get signingNonceCommitment => $_getN(2);
  @$pb.TagNumber(3)
  set signingNonceCommitment($2.SigningCommitment value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSigningNonceCommitment() => $_has(2);
  @$pb.TagNumber(3)
  void clearSigningNonceCommitment() => $_clearField(3);
  @$pb.TagNumber(3)
  $2.SigningCommitment ensureSigningNonceCommitment() => $_ensure(2);
}

/// *
///  SigningKeyshare is the keyshare information of the SE keyshare group.
class SigningKeyshare extends $pb.GeneratedMessage {
  factory SigningKeyshare({
    $core.Iterable<$core.String>? ownerIdentifiers,
    $core.int? threshold,
    $core.List<$core.int>? publicKey,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        publicShares,
    $3.Timestamp? updatedTime,
  }) {
    final result = create();
    if (ownerIdentifiers != null)
      result.ownerIdentifiers.addAll(ownerIdentifiers);
    if (threshold != null) result.threshold = threshold;
    if (publicKey != null) result.publicKey = publicKey;
    if (publicShares != null) result.publicShares.addEntries(publicShares);
    if (updatedTime != null) result.updatedTime = updatedTime;
    return result;
  }

  SigningKeyshare._();

  factory SigningKeyshare.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningKeyshare.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningKeyshare',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'ownerIdentifiers')
    ..aI(2, _omitFieldNames ? '' : 'threshold', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..m<$core.String, $core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'publicShares',
        entryClassName: 'SigningKeyshare.PublicSharesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark'))
    ..aOM<$3.Timestamp>(5, _omitFieldNames ? '' : 'updatedTime',
        subBuilder: $3.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningKeyshare clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningKeyshare copyWith(void Function(SigningKeyshare) updates) =>
      super.copyWith((message) => updates(message as SigningKeyshare))
          as SigningKeyshare;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SigningKeyshare create() => SigningKeyshare._();
  @$core.override
  SigningKeyshare createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SigningKeyshare getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SigningKeyshare>(create);
  static SigningKeyshare? _defaultInstance;

  /// The identifiers of the owners of the keyshare.
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get ownerIdentifiers => $_getList(0);

  /// The threshold of the keyshare.
  @$pb.TagNumber(2)
  $core.int get threshold => $_getIZ(1);
  @$pb.TagNumber(2)
  set threshold($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasThreshold() => $_has(1);
  @$pb.TagNumber(2)
  void clearThreshold() => $_clearField(2);

  /// The public key of the keyshare.
  @$pb.TagNumber(3)
  $core.List<$core.int> get publicKey => $_getN(2);
  @$pb.TagNumber(3)
  set publicKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearPublicKey() => $_clearField(3);

  /// The public shares of the keyshare.
  @$pb.TagNumber(4)
  $pb.PbMap<$core.String, $core.List<$core.int>> get publicShares =>
      $_getMap(3);

  /// The latest update time of the keyshare.
  @$pb.TagNumber(5)
  $3.Timestamp get updatedTime => $_getN(4);
  @$pb.TagNumber(5)
  set updatedTime($3.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasUpdatedTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdatedTime() => $_clearField(5);
  @$pb.TagNumber(5)
  $3.Timestamp ensureUpdatedTime() => $_ensure(4);
}

/// *
///  SigningResult is the result of the signing job from the SE keyshare group.
///  It contains all the information for user to sign their part. After user signs, the signature
///  can be aggregated to form the final signature.
class SigningResult extends $pb.GeneratedMessage {
  factory SigningResult({
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        publicKeys,
    $core.Iterable<$core.MapEntry<$core.String, $2.SigningCommitment>>?
        signingNonceCommitments,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        signatureShares,
    SigningKeyshare? signingKeyshare,
  }) {
    final result = create();
    if (publicKeys != null) result.publicKeys.addEntries(publicKeys);
    if (signingNonceCommitments != null)
      result.signingNonceCommitments.addEntries(signingNonceCommitments);
    if (signatureShares != null)
      result.signatureShares.addEntries(signatureShares);
    if (signingKeyshare != null) result.signingKeyshare = signingKeyshare;
    return result;
  }

  SigningResult._();

  factory SigningResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..m<$core.String, $core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'publicKeys',
        entryClassName: 'SigningResult.PublicKeysEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark'))
    ..m<$core.String, $2.SigningCommitment>(
        2, _omitFieldNames ? '' : 'signingNonceCommitments',
        entryClassName: 'SigningResult.SigningNonceCommitmentsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $2.SigningCommitment.create,
        valueDefaultOrMaker: $2.SigningCommitment.getDefault,
        packageName: const $pb.PackageName('spark'))
    ..m<$core.String, $core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'signatureShares',
        entryClassName: 'SigningResult.SignatureSharesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark'))
    ..aOM<SigningKeyshare>(4, _omitFieldNames ? '' : 'signingKeyshare',
        subBuilder: SigningKeyshare.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningResult copyWith(void Function(SigningResult) updates) =>
      super.copyWith((message) => updates(message as SigningResult))
          as SigningResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SigningResult create() => SigningResult._();
  @$core.override
  SigningResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SigningResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SigningResult>(create);
  static SigningResult? _defaultInstance;

  /// The public keys of the SE keyshare group.
  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $core.List<$core.int>> get publicKeys => $_getMap(0);

  /// The signing nonce commitments of the SE keyshare group.
  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $2.SigningCommitment> get signingNonceCommitments =>
      $_getMap(1);

  /// The signature shares of the SE keyshare group.
  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.List<$core.int>> get signatureShares =>
      $_getMap(2);

  /// The keyshare information of the SE keyshare group.
  @$pb.TagNumber(4)
  SigningKeyshare get signingKeyshare => $_getN(3);
  @$pb.TagNumber(4)
  set signingKeyshare(SigningKeyshare value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasSigningKeyshare() => $_has(3);
  @$pb.TagNumber(4)
  void clearSigningKeyshare() => $_clearField(4);
  @$pb.TagNumber(4)
  SigningKeyshare ensureSigningKeyshare() => $_ensure(3);
}

enum RenewLeafRequest_SigningJobs {
  renewNodeTimelockSigningJob,
  renewRefundTimelockSigningJob,
  renewNodeZeroTimelockSigningJob,
  notSet
}

class RenewLeafRequest extends $pb.GeneratedMessage {
  factory RenewLeafRequest({
    $core.String? leafId,
    RenewNodeTimelockSigningJob? renewNodeTimelockSigningJob,
    RenewRefundTimelockSigningJob? renewRefundTimelockSigningJob,
    RenewNodeZeroTimelockSigningJob? renewNodeZeroTimelockSigningJob,
  }) {
    final result = create();
    if (leafId != null) result.leafId = leafId;
    if (renewNodeTimelockSigningJob != null)
      result.renewNodeTimelockSigningJob = renewNodeTimelockSigningJob;
    if (renewRefundTimelockSigningJob != null)
      result.renewRefundTimelockSigningJob = renewRefundTimelockSigningJob;
    if (renewNodeZeroTimelockSigningJob != null)
      result.renewNodeZeroTimelockSigningJob = renewNodeZeroTimelockSigningJob;
    return result;
  }

  RenewLeafRequest._();

  factory RenewLeafRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RenewLeafRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, RenewLeafRequest_SigningJobs>
      _RenewLeafRequest_SigningJobsByTag = {
    2: RenewLeafRequest_SigningJobs.renewNodeTimelockSigningJob,
    3: RenewLeafRequest_SigningJobs.renewRefundTimelockSigningJob,
    4: RenewLeafRequest_SigningJobs.renewNodeZeroTimelockSigningJob,
    0: RenewLeafRequest_SigningJobs.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RenewLeafRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..aOS(1, _omitFieldNames ? '' : 'leafId')
    ..aOM<RenewNodeTimelockSigningJob>(
        2, _omitFieldNames ? '' : 'renewNodeTimelockSigningJob',
        subBuilder: RenewNodeTimelockSigningJob.create)
    ..aOM<RenewRefundTimelockSigningJob>(
        3, _omitFieldNames ? '' : 'renewRefundTimelockSigningJob',
        subBuilder: RenewRefundTimelockSigningJob.create)
    ..aOM<RenewNodeZeroTimelockSigningJob>(
        4, _omitFieldNames ? '' : 'renewNodeZeroTimelockSigningJob',
        subBuilder: RenewNodeZeroTimelockSigningJob.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewLeafRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewLeafRequest copyWith(void Function(RenewLeafRequest) updates) =>
      super.copyWith((message) => updates(message as RenewLeafRequest))
          as RenewLeafRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RenewLeafRequest create() => RenewLeafRequest._();
  @$core.override
  RenewLeafRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RenewLeafRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RenewLeafRequest>(create);
  static RenewLeafRequest? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  RenewLeafRequest_SigningJobs whichSigningJobs() =>
      _RenewLeafRequest_SigningJobsByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearSigningJobs() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get leafId => $_getSZ(0);
  @$pb.TagNumber(1)
  set leafId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLeafId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeafId() => $_clearField(1);

  /// Resets the node transaction timelock and refund transaction timelock
  /// for a leaf to 2000. The old node transaction is invalidated by
  /// introducing a "split node" with zero timelock that spends to a new
  /// node transaction. Takes in the signing jobs for the updated
  /// node, refund, and split node transactions with the new timelocks.
  /// Requires that the existing node transaction timelock is <= 300
  /// at the time this function is called. Returns an error if these
  /// conditions are not met.
  @$pb.TagNumber(2)
  RenewNodeTimelockSigningJob get renewNodeTimelockSigningJob => $_getN(1);
  @$pb.TagNumber(2)
  set renewNodeTimelockSigningJob(RenewNodeTimelockSigningJob value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRenewNodeTimelockSigningJob() => $_has(1);
  @$pb.TagNumber(2)
  void clearRenewNodeTimelockSigningJob() => $_clearField(2);
  @$pb.TagNumber(2)
  RenewNodeTimelockSigningJob ensureRenewNodeTimelockSigningJob() =>
      $_ensure(1);

  /// Resets the refund transaction timelock for a leaf to 2000. Takes in
  /// the signing jobs for the updated transactions with the new timelocks.
  /// Requires that the existing refund transaction timelock is <= 300 and
  /// the node transaction timelock > 300 at the time this function is
  /// called. Returns an error if these conditions are not met.
  @$pb.TagNumber(3)
  RenewRefundTimelockSigningJob get renewRefundTimelockSigningJob => $_getN(2);
  @$pb.TagNumber(3)
  set renewRefundTimelockSigningJob(RenewRefundTimelockSigningJob value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRenewRefundTimelockSigningJob() => $_has(2);
  @$pb.TagNumber(3)
  void clearRenewRefundTimelockSigningJob() => $_clearField(3);
  @$pb.TagNumber(3)
  RenewRefundTimelockSigningJob ensureRenewRefundTimelockSigningJob() =>
      $_ensure(2);

  /// A special case of refresh for when the node transaction is at 0 and
  /// cannot be decremented further. This operation resets the refund
  /// transaction's timelock and, similar to renew node, adds an additional
  /// node transaction to the transaction chain with zero timelock as well.
  /// This case is mostly used for user-created trees from L1 deposits.
  @$pb.TagNumber(4)
  RenewNodeZeroTimelockSigningJob get renewNodeZeroTimelockSigningJob =>
      $_getN(3);
  @$pb.TagNumber(4)
  set renewNodeZeroTimelockSigningJob(RenewNodeZeroTimelockSigningJob value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRenewNodeZeroTimelockSigningJob() => $_has(3);
  @$pb.TagNumber(4)
  void clearRenewNodeZeroTimelockSigningJob() => $_clearField(4);
  @$pb.TagNumber(4)
  RenewNodeZeroTimelockSigningJob ensureRenewNodeZeroTimelockSigningJob() =>
      $_ensure(3);
}

class RenewNodeTimelockSigningJob extends $pb.GeneratedMessage {
  factory RenewNodeTimelockSigningJob({
    UserSignedTxSigningJob? splitNodeTxSigningJob,
    UserSignedTxSigningJob? splitNodeDirectTxSigningJob,
    UserSignedTxSigningJob? nodeTxSigningJob,
    UserSignedTxSigningJob? refundTxSigningJob,
    UserSignedTxSigningJob? directNodeTxSigningJob,
    UserSignedTxSigningJob? directRefundTxSigningJob,
    UserSignedTxSigningJob? directFromCpfpRefundTxSigningJob,
  }) {
    final result = create();
    if (splitNodeTxSigningJob != null)
      result.splitNodeTxSigningJob = splitNodeTxSigningJob;
    if (splitNodeDirectTxSigningJob != null)
      result.splitNodeDirectTxSigningJob = splitNodeDirectTxSigningJob;
    if (nodeTxSigningJob != null) result.nodeTxSigningJob = nodeTxSigningJob;
    if (refundTxSigningJob != null)
      result.refundTxSigningJob = refundTxSigningJob;
    if (directNodeTxSigningJob != null)
      result.directNodeTxSigningJob = directNodeTxSigningJob;
    if (directRefundTxSigningJob != null)
      result.directRefundTxSigningJob = directRefundTxSigningJob;
    if (directFromCpfpRefundTxSigningJob != null)
      result.directFromCpfpRefundTxSigningJob =
          directFromCpfpRefundTxSigningJob;
    return result;
  }

  RenewNodeTimelockSigningJob._();

  factory RenewNodeTimelockSigningJob.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RenewNodeTimelockSigningJob.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RenewNodeTimelockSigningJob',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<UserSignedTxSigningJob>(
        1, _omitFieldNames ? '' : 'splitNodeTxSigningJob',
        subBuilder: UserSignedTxSigningJob.create)
    ..aOM<UserSignedTxSigningJob>(
        2, _omitFieldNames ? '' : 'splitNodeDirectTxSigningJob',
        subBuilder: UserSignedTxSigningJob.create)
    ..aOM<UserSignedTxSigningJob>(3, _omitFieldNames ? '' : 'nodeTxSigningJob',
        subBuilder: UserSignedTxSigningJob.create)
    ..aOM<UserSignedTxSigningJob>(
        4, _omitFieldNames ? '' : 'refundTxSigningJob',
        subBuilder: UserSignedTxSigningJob.create)
    ..aOM<UserSignedTxSigningJob>(
        5, _omitFieldNames ? '' : 'directNodeTxSigningJob',
        subBuilder: UserSignedTxSigningJob.create)
    ..aOM<UserSignedTxSigningJob>(
        6, _omitFieldNames ? '' : 'directRefundTxSigningJob',
        subBuilder: UserSignedTxSigningJob.create)
    ..aOM<UserSignedTxSigningJob>(
        7, _omitFieldNames ? '' : 'directFromCpfpRefundTxSigningJob',
        subBuilder: UserSignedTxSigningJob.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewNodeTimelockSigningJob clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewNodeTimelockSigningJob copyWith(
          void Function(RenewNodeTimelockSigningJob) updates) =>
      super.copyWith(
              (message) => updates(message as RenewNodeTimelockSigningJob))
          as RenewNodeTimelockSigningJob;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RenewNodeTimelockSigningJob create() =>
      RenewNodeTimelockSigningJob._();
  @$core.override
  RenewNodeTimelockSigningJob createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RenewNodeTimelockSigningJob getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RenewNodeTimelockSigningJob>(create);
  static RenewNodeTimelockSigningJob? _defaultInstance;

  /// Signing job with the new "split node" transaction. This spends the
  /// inputs of the old node transaction and its outputs are spent by the new
  /// node transaction. Timelock of split node transaction must be 0.
  @$pb.TagNumber(1)
  UserSignedTxSigningJob get splitNodeTxSigningJob => $_getN(0);
  @$pb.TagNumber(1)
  set splitNodeTxSigningJob(UserSignedTxSigningJob value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSplitNodeTxSigningJob() => $_has(0);
  @$pb.TagNumber(1)
  void clearSplitNodeTxSigningJob() => $_clearField(1);
  @$pb.TagNumber(1)
  UserSignedTxSigningJob ensureSplitNodeTxSigningJob() => $_ensure(0);

  @$pb.TagNumber(2)
  UserSignedTxSigningJob get splitNodeDirectTxSigningJob => $_getN(1);
  @$pb.TagNumber(2)
  set splitNodeDirectTxSigningJob(UserSignedTxSigningJob value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSplitNodeDirectTxSigningJob() => $_has(1);
  @$pb.TagNumber(2)
  void clearSplitNodeDirectTxSigningJob() => $_clearField(2);
  @$pb.TagNumber(2)
  UserSignedTxSigningJob ensureSplitNodeDirectTxSigningJob() => $_ensure(1);

  /// Signing job with the updated node transaction. The updated transaction is
  /// expected to have a timelock of 2000.
  @$pb.TagNumber(3)
  UserSignedTxSigningJob get nodeTxSigningJob => $_getN(2);
  @$pb.TagNumber(3)
  set nodeTxSigningJob(UserSignedTxSigningJob value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasNodeTxSigningJob() => $_has(2);
  @$pb.TagNumber(3)
  void clearNodeTxSigningJob() => $_clearField(3);
  @$pb.TagNumber(3)
  UserSignedTxSigningJob ensureNodeTxSigningJob() => $_ensure(2);

  @$pb.TagNumber(4)
  UserSignedTxSigningJob get refundTxSigningJob => $_getN(3);
  @$pb.TagNumber(4)
  set refundTxSigningJob(UserSignedTxSigningJob value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRefundTxSigningJob() => $_has(3);
  @$pb.TagNumber(4)
  void clearRefundTxSigningJob() => $_clearField(4);
  @$pb.TagNumber(4)
  UserSignedTxSigningJob ensureRefundTxSigningJob() => $_ensure(3);

  @$pb.TagNumber(5)
  UserSignedTxSigningJob get directNodeTxSigningJob => $_getN(4);
  @$pb.TagNumber(5)
  set directNodeTxSigningJob(UserSignedTxSigningJob value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasDirectNodeTxSigningJob() => $_has(4);
  @$pb.TagNumber(5)
  void clearDirectNodeTxSigningJob() => $_clearField(5);
  @$pb.TagNumber(5)
  UserSignedTxSigningJob ensureDirectNodeTxSigningJob() => $_ensure(4);

  @$pb.TagNumber(6)
  UserSignedTxSigningJob get directRefundTxSigningJob => $_getN(5);
  @$pb.TagNumber(6)
  set directRefundTxSigningJob(UserSignedTxSigningJob value) =>
      $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasDirectRefundTxSigningJob() => $_has(5);
  @$pb.TagNumber(6)
  void clearDirectRefundTxSigningJob() => $_clearField(6);
  @$pb.TagNumber(6)
  UserSignedTxSigningJob ensureDirectRefundTxSigningJob() => $_ensure(5);

  @$pb.TagNumber(7)
  UserSignedTxSigningJob get directFromCpfpRefundTxSigningJob => $_getN(6);
  @$pb.TagNumber(7)
  set directFromCpfpRefundTxSigningJob(UserSignedTxSigningJob value) =>
      $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasDirectFromCpfpRefundTxSigningJob() => $_has(6);
  @$pb.TagNumber(7)
  void clearDirectFromCpfpRefundTxSigningJob() => $_clearField(7);
  @$pb.TagNumber(7)
  UserSignedTxSigningJob ensureDirectFromCpfpRefundTxSigningJob() =>
      $_ensure(6);
}

class RenewRefundTimelockSigningJob extends $pb.GeneratedMessage {
  factory RenewRefundTimelockSigningJob({
    UserSignedTxSigningJob? nodeTxSigningJob,
    UserSignedTxSigningJob? refundTxSigningJob,
    UserSignedTxSigningJob? directNodeTxSigningJob,
    UserSignedTxSigningJob? directRefundTxSigningJob,
    UserSignedTxSigningJob? directFromCpfpRefundTxSigningJob,
  }) {
    final result = create();
    if (nodeTxSigningJob != null) result.nodeTxSigningJob = nodeTxSigningJob;
    if (refundTxSigningJob != null)
      result.refundTxSigningJob = refundTxSigningJob;
    if (directNodeTxSigningJob != null)
      result.directNodeTxSigningJob = directNodeTxSigningJob;
    if (directRefundTxSigningJob != null)
      result.directRefundTxSigningJob = directRefundTxSigningJob;
    if (directFromCpfpRefundTxSigningJob != null)
      result.directFromCpfpRefundTxSigningJob =
          directFromCpfpRefundTxSigningJob;
    return result;
  }

  RenewRefundTimelockSigningJob._();

  factory RenewRefundTimelockSigningJob.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RenewRefundTimelockSigningJob.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RenewRefundTimelockSigningJob',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<UserSignedTxSigningJob>(1, _omitFieldNames ? '' : 'nodeTxSigningJob',
        subBuilder: UserSignedTxSigningJob.create)
    ..aOM<UserSignedTxSigningJob>(
        2, _omitFieldNames ? '' : 'refundTxSigningJob',
        subBuilder: UserSignedTxSigningJob.create)
    ..aOM<UserSignedTxSigningJob>(
        3, _omitFieldNames ? '' : 'directNodeTxSigningJob',
        subBuilder: UserSignedTxSigningJob.create)
    ..aOM<UserSignedTxSigningJob>(
        4, _omitFieldNames ? '' : 'directRefundTxSigningJob',
        subBuilder: UserSignedTxSigningJob.create)
    ..aOM<UserSignedTxSigningJob>(
        5, _omitFieldNames ? '' : 'directFromCpfpRefundTxSigningJob',
        subBuilder: UserSignedTxSigningJob.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewRefundTimelockSigningJob clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewRefundTimelockSigningJob copyWith(
          void Function(RenewRefundTimelockSigningJob) updates) =>
      super.copyWith(
              (message) => updates(message as RenewRefundTimelockSigningJob))
          as RenewRefundTimelockSigningJob;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RenewRefundTimelockSigningJob create() =>
      RenewRefundTimelockSigningJob._();
  @$core.override
  RenewRefundTimelockSigningJob createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RenewRefundTimelockSigningJob getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RenewRefundTimelockSigningJob>(create);
  static RenewRefundTimelockSigningJob? _defaultInstance;

  /// Signing job with the updated node transaction. The updated transaction is
  /// expected to have a timelock of 100 less than the existing node transaction.
  @$pb.TagNumber(1)
  UserSignedTxSigningJob get nodeTxSigningJob => $_getN(0);
  @$pb.TagNumber(1)
  set nodeTxSigningJob(UserSignedTxSigningJob value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasNodeTxSigningJob() => $_has(0);
  @$pb.TagNumber(1)
  void clearNodeTxSigningJob() => $_clearField(1);
  @$pb.TagNumber(1)
  UserSignedTxSigningJob ensureNodeTxSigningJob() => $_ensure(0);

  /// Signing job with the updated refund transaction. This updated transaction
  /// must have a timelock of 2000.
  @$pb.TagNumber(2)
  UserSignedTxSigningJob get refundTxSigningJob => $_getN(1);
  @$pb.TagNumber(2)
  set refundTxSigningJob(UserSignedTxSigningJob value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRefundTxSigningJob() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefundTxSigningJob() => $_clearField(2);
  @$pb.TagNumber(2)
  UserSignedTxSigningJob ensureRefundTxSigningJob() => $_ensure(1);

  @$pb.TagNumber(3)
  UserSignedTxSigningJob get directNodeTxSigningJob => $_getN(2);
  @$pb.TagNumber(3)
  set directNodeTxSigningJob(UserSignedTxSigningJob value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDirectNodeTxSigningJob() => $_has(2);
  @$pb.TagNumber(3)
  void clearDirectNodeTxSigningJob() => $_clearField(3);
  @$pb.TagNumber(3)
  UserSignedTxSigningJob ensureDirectNodeTxSigningJob() => $_ensure(2);

  @$pb.TagNumber(4)
  UserSignedTxSigningJob get directRefundTxSigningJob => $_getN(3);
  @$pb.TagNumber(4)
  set directRefundTxSigningJob(UserSignedTxSigningJob value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasDirectRefundTxSigningJob() => $_has(3);
  @$pb.TagNumber(4)
  void clearDirectRefundTxSigningJob() => $_clearField(4);
  @$pb.TagNumber(4)
  UserSignedTxSigningJob ensureDirectRefundTxSigningJob() => $_ensure(3);

  @$pb.TagNumber(5)
  UserSignedTxSigningJob get directFromCpfpRefundTxSigningJob => $_getN(4);
  @$pb.TagNumber(5)
  set directFromCpfpRefundTxSigningJob(UserSignedTxSigningJob value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasDirectFromCpfpRefundTxSigningJob() => $_has(4);
  @$pb.TagNumber(5)
  void clearDirectFromCpfpRefundTxSigningJob() => $_clearField(5);
  @$pb.TagNumber(5)
  UserSignedTxSigningJob ensureDirectFromCpfpRefundTxSigningJob() =>
      $_ensure(4);
}

class RenewNodeZeroTimelockSigningJob extends $pb.GeneratedMessage {
  factory RenewNodeZeroTimelockSigningJob({
    UserSignedTxSigningJob? nodeTxSigningJob,
    UserSignedTxSigningJob? refundTxSigningJob,
    UserSignedTxSigningJob? directNodeTxSigningJob,
    UserSignedTxSigningJob? directFromCpfpRefundTxSigningJob,
  }) {
    final result = create();
    if (nodeTxSigningJob != null) result.nodeTxSigningJob = nodeTxSigningJob;
    if (refundTxSigningJob != null)
      result.refundTxSigningJob = refundTxSigningJob;
    if (directNodeTxSigningJob != null)
      result.directNodeTxSigningJob = directNodeTxSigningJob;
    if (directFromCpfpRefundTxSigningJob != null)
      result.directFromCpfpRefundTxSigningJob =
          directFromCpfpRefundTxSigningJob;
    return result;
  }

  RenewNodeZeroTimelockSigningJob._();

  factory RenewNodeZeroTimelockSigningJob.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RenewNodeZeroTimelockSigningJob.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RenewNodeZeroTimelockSigningJob',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<UserSignedTxSigningJob>(1, _omitFieldNames ? '' : 'nodeTxSigningJob',
        subBuilder: UserSignedTxSigningJob.create)
    ..aOM<UserSignedTxSigningJob>(
        2, _omitFieldNames ? '' : 'refundTxSigningJob',
        subBuilder: UserSignedTxSigningJob.create)
    ..aOM<UserSignedTxSigningJob>(
        3, _omitFieldNames ? '' : 'directNodeTxSigningJob',
        subBuilder: UserSignedTxSigningJob.create)
    ..aOM<UserSignedTxSigningJob>(
        5, _omitFieldNames ? '' : 'directFromCpfpRefundTxSigningJob',
        subBuilder: UserSignedTxSigningJob.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewNodeZeroTimelockSigningJob clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewNodeZeroTimelockSigningJob copyWith(
          void Function(RenewNodeZeroTimelockSigningJob) updates) =>
      super.copyWith(
              (message) => updates(message as RenewNodeZeroTimelockSigningJob))
          as RenewNodeZeroTimelockSigningJob;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RenewNodeZeroTimelockSigningJob create() =>
      RenewNodeZeroTimelockSigningJob._();
  @$core.override
  RenewNodeZeroTimelockSigningJob createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RenewNodeZeroTimelockSigningJob getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RenewNodeZeroTimelockSigningJob>(
          create);
  static RenewNodeZeroTimelockSigningJob? _defaultInstance;

  /// Signing job with the new node transaction. The updated transaction is
  /// expected to have a timelock of 0.
  @$pb.TagNumber(1)
  UserSignedTxSigningJob get nodeTxSigningJob => $_getN(0);
  @$pb.TagNumber(1)
  set nodeTxSigningJob(UserSignedTxSigningJob value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasNodeTxSigningJob() => $_has(0);
  @$pb.TagNumber(1)
  void clearNodeTxSigningJob() => $_clearField(1);
  @$pb.TagNumber(1)
  UserSignedTxSigningJob ensureNodeTxSigningJob() => $_ensure(0);

  /// Signing job with the updated refund transaction. This updated transaction
  /// must have a timelock of 2000.
  @$pb.TagNumber(2)
  UserSignedTxSigningJob get refundTxSigningJob => $_getN(1);
  @$pb.TagNumber(2)
  set refundTxSigningJob(UserSignedTxSigningJob value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRefundTxSigningJob() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefundTxSigningJob() => $_clearField(2);
  @$pb.TagNumber(2)
  UserSignedTxSigningJob ensureRefundTxSigningJob() => $_ensure(1);

  @$pb.TagNumber(3)
  UserSignedTxSigningJob get directNodeTxSigningJob => $_getN(2);
  @$pb.TagNumber(3)
  set directNodeTxSigningJob(UserSignedTxSigningJob value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDirectNodeTxSigningJob() => $_has(2);
  @$pb.TagNumber(3)
  void clearDirectNodeTxSigningJob() => $_clearField(3);
  @$pb.TagNumber(3)
  UserSignedTxSigningJob ensureDirectNodeTxSigningJob() => $_ensure(2);

  @$pb.TagNumber(5)
  UserSignedTxSigningJob get directFromCpfpRefundTxSigningJob => $_getN(3);
  @$pb.TagNumber(5)
  set directFromCpfpRefundTxSigningJob(UserSignedTxSigningJob value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasDirectFromCpfpRefundTxSigningJob() => $_has(3);
  @$pb.TagNumber(5)
  void clearDirectFromCpfpRefundTxSigningJob() => $_clearField(5);
  @$pb.TagNumber(5)
  UserSignedTxSigningJob ensureDirectFromCpfpRefundTxSigningJob() =>
      $_ensure(3);
}

enum RenewLeafResponse_RenewResult {
  renewNodeTimelockResult,
  renewRefundTimelockResult,
  renewNodeZeroTimelockResult,
  notSet
}

class RenewLeafResponse extends $pb.GeneratedMessage {
  factory RenewLeafResponse({
    RenewNodeTimelockResult? renewNodeTimelockResult,
    RenewRefundTimelockResult? renewRefundTimelockResult,
    RenewNodeZeroTimelockResult? renewNodeZeroTimelockResult,
  }) {
    final result = create();
    if (renewNodeTimelockResult != null)
      result.renewNodeTimelockResult = renewNodeTimelockResult;
    if (renewRefundTimelockResult != null)
      result.renewRefundTimelockResult = renewRefundTimelockResult;
    if (renewNodeZeroTimelockResult != null)
      result.renewNodeZeroTimelockResult = renewNodeZeroTimelockResult;
    return result;
  }

  RenewLeafResponse._();

  factory RenewLeafResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RenewLeafResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, RenewLeafResponse_RenewResult>
      _RenewLeafResponse_RenewResultByTag = {
    1: RenewLeafResponse_RenewResult.renewNodeTimelockResult,
    2: RenewLeafResponse_RenewResult.renewRefundTimelockResult,
    3: RenewLeafResponse_RenewResult.renewNodeZeroTimelockResult,
    0: RenewLeafResponse_RenewResult.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RenewLeafResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<RenewNodeTimelockResult>(
        1, _omitFieldNames ? '' : 'renewNodeTimelockResult',
        subBuilder: RenewNodeTimelockResult.create)
    ..aOM<RenewRefundTimelockResult>(
        2, _omitFieldNames ? '' : 'renewRefundTimelockResult',
        subBuilder: RenewRefundTimelockResult.create)
    ..aOM<RenewNodeZeroTimelockResult>(
        3, _omitFieldNames ? '' : 'renewNodeZeroTimelockResult',
        subBuilder: RenewNodeZeroTimelockResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewLeafResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewLeafResponse copyWith(void Function(RenewLeafResponse) updates) =>
      super.copyWith((message) => updates(message as RenewLeafResponse))
          as RenewLeafResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RenewLeafResponse create() => RenewLeafResponse._();
  @$core.override
  RenewLeafResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RenewLeafResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RenewLeafResponse>(create);
  static RenewLeafResponse? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  RenewLeafResponse_RenewResult whichRenewResult() =>
      _RenewLeafResponse_RenewResultByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearRenewResult() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  RenewNodeTimelockResult get renewNodeTimelockResult => $_getN(0);
  @$pb.TagNumber(1)
  set renewNodeTimelockResult(RenewNodeTimelockResult value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRenewNodeTimelockResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearRenewNodeTimelockResult() => $_clearField(1);
  @$pb.TagNumber(1)
  RenewNodeTimelockResult ensureRenewNodeTimelockResult() => $_ensure(0);

  @$pb.TagNumber(2)
  RenewRefundTimelockResult get renewRefundTimelockResult => $_getN(1);
  @$pb.TagNumber(2)
  set renewRefundTimelockResult(RenewRefundTimelockResult value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRenewRefundTimelockResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearRenewRefundTimelockResult() => $_clearField(2);
  @$pb.TagNumber(2)
  RenewRefundTimelockResult ensureRenewRefundTimelockResult() => $_ensure(1);

  @$pb.TagNumber(3)
  RenewNodeZeroTimelockResult get renewNodeZeroTimelockResult => $_getN(2);
  @$pb.TagNumber(3)
  set renewNodeZeroTimelockResult(RenewNodeZeroTimelockResult value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRenewNodeZeroTimelockResult() => $_has(2);
  @$pb.TagNumber(3)
  void clearRenewNodeZeroTimelockResult() => $_clearField(3);
  @$pb.TagNumber(3)
  RenewNodeZeroTimelockResult ensureRenewNodeZeroTimelockResult() =>
      $_ensure(2);
}

class RenewNodeTimelockResult extends $pb.GeneratedMessage {
  factory RenewNodeTimelockResult({
    TreeNode? splitNode,
    TreeNode? node,
  }) {
    final result = create();
    if (splitNode != null) result.splitNode = splitNode;
    if (node != null) result.node = node;
    return result;
  }

  RenewNodeTimelockResult._();

  factory RenewNodeTimelockResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RenewNodeTimelockResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RenewNodeTimelockResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<TreeNode>(1, _omitFieldNames ? '' : 'splitNode',
        subBuilder: TreeNode.create)
    ..aOM<TreeNode>(2, _omitFieldNames ? '' : 'node',
        subBuilder: TreeNode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewNodeTimelockResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewNodeTimelockResult copyWith(
          void Function(RenewNodeTimelockResult) updates) =>
      super.copyWith((message) => updates(message as RenewNodeTimelockResult))
          as RenewNodeTimelockResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RenewNodeTimelockResult create() => RenewNodeTimelockResult._();
  @$core.override
  RenewNodeTimelockResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RenewNodeTimelockResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RenewNodeTimelockResult>(create);
  static RenewNodeTimelockResult? _defaultInstance;

  @$pb.TagNumber(1)
  TreeNode get splitNode => $_getN(0);
  @$pb.TagNumber(1)
  set splitNode(TreeNode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSplitNode() => $_has(0);
  @$pb.TagNumber(1)
  void clearSplitNode() => $_clearField(1);
  @$pb.TagNumber(1)
  TreeNode ensureSplitNode() => $_ensure(0);

  @$pb.TagNumber(2)
  TreeNode get node => $_getN(1);
  @$pb.TagNumber(2)
  set node(TreeNode value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNode() => $_has(1);
  @$pb.TagNumber(2)
  void clearNode() => $_clearField(2);
  @$pb.TagNumber(2)
  TreeNode ensureNode() => $_ensure(1);
}

class RenewRefundTimelockResult extends $pb.GeneratedMessage {
  factory RenewRefundTimelockResult({
    TreeNode? node,
  }) {
    final result = create();
    if (node != null) result.node = node;
    return result;
  }

  RenewRefundTimelockResult._();

  factory RenewRefundTimelockResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RenewRefundTimelockResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RenewRefundTimelockResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<TreeNode>(1, _omitFieldNames ? '' : 'node',
        subBuilder: TreeNode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewRefundTimelockResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewRefundTimelockResult copyWith(
          void Function(RenewRefundTimelockResult) updates) =>
      super.copyWith((message) => updates(message as RenewRefundTimelockResult))
          as RenewRefundTimelockResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RenewRefundTimelockResult create() => RenewRefundTimelockResult._();
  @$core.override
  RenewRefundTimelockResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RenewRefundTimelockResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RenewRefundTimelockResult>(create);
  static RenewRefundTimelockResult? _defaultInstance;

  @$pb.TagNumber(1)
  TreeNode get node => $_getN(0);
  @$pb.TagNumber(1)
  set node(TreeNode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasNode() => $_has(0);
  @$pb.TagNumber(1)
  void clearNode() => $_clearField(1);
  @$pb.TagNumber(1)
  TreeNode ensureNode() => $_ensure(0);
}

class RenewNodeZeroTimelockResult extends $pb.GeneratedMessage {
  factory RenewNodeZeroTimelockResult({
    TreeNode? splitNode,
    TreeNode? node,
  }) {
    final result = create();
    if (splitNode != null) result.splitNode = splitNode;
    if (node != null) result.node = node;
    return result;
  }

  RenewNodeZeroTimelockResult._();

  factory RenewNodeZeroTimelockResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RenewNodeZeroTimelockResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RenewNodeZeroTimelockResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<TreeNode>(1, _omitFieldNames ? '' : 'splitNode',
        subBuilder: TreeNode.create)
    ..aOM<TreeNode>(2, _omitFieldNames ? '' : 'node',
        subBuilder: TreeNode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewNodeZeroTimelockResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewNodeZeroTimelockResult copyWith(
          void Function(RenewNodeZeroTimelockResult) updates) =>
      super.copyWith(
              (message) => updates(message as RenewNodeZeroTimelockResult))
          as RenewNodeZeroTimelockResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RenewNodeZeroTimelockResult create() =>
      RenewNodeZeroTimelockResult._();
  @$core.override
  RenewNodeZeroTimelockResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RenewNodeZeroTimelockResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RenewNodeZeroTimelockResult>(create);
  static RenewNodeZeroTimelockResult? _defaultInstance;

  @$pb.TagNumber(1)
  TreeNode get splitNode => $_getN(0);
  @$pb.TagNumber(1)
  set splitNode(TreeNode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSplitNode() => $_has(0);
  @$pb.TagNumber(1)
  void clearSplitNode() => $_clearField(1);
  @$pb.TagNumber(1)
  TreeNode ensureSplitNode() => $_ensure(0);

  @$pb.TagNumber(2)
  TreeNode get node => $_getN(1);
  @$pb.TagNumber(2)
  set node(TreeNode value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNode() => $_has(1);
  @$pb.TagNumber(2)
  void clearNode() => $_clearField(2);
  @$pb.TagNumber(2)
  TreeNode ensureNode() => $_ensure(1);
}

/// *
///  NodeSignatureShares is the signature shares for a node on the tree.
///  For each tree node, the verifying key stays the same for both transactions.
class NodeSignatureShares extends $pb.GeneratedMessage {
  factory NodeSignatureShares({
    $core.String? nodeId,
    SigningResult? nodeTxSigningResult,
    SigningResult? refundTxSigningResult,
    $core.List<$core.int>? verifyingKey,
    @$core.Deprecated('This field is deprecated.')
    SigningResult? directNodeTxSigningResult,
    @$core.Deprecated('This field is deprecated.')
    SigningResult? directRefundTxSigningResult,
    SigningResult? directFromCpfpRefundTxSigningResult,
  }) {
    final result = create();
    if (nodeId != null) result.nodeId = nodeId;
    if (nodeTxSigningResult != null)
      result.nodeTxSigningResult = nodeTxSigningResult;
    if (refundTxSigningResult != null)
      result.refundTxSigningResult = refundTxSigningResult;
    if (verifyingKey != null) result.verifyingKey = verifyingKey;
    if (directNodeTxSigningResult != null)
      result.directNodeTxSigningResult = directNodeTxSigningResult;
    if (directRefundTxSigningResult != null)
      result.directRefundTxSigningResult = directRefundTxSigningResult;
    if (directFromCpfpRefundTxSigningResult != null)
      result.directFromCpfpRefundTxSigningResult =
          directFromCpfpRefundTxSigningResult;
    return result;
  }

  NodeSignatureShares._();

  factory NodeSignatureShares.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NodeSignatureShares.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NodeSignatureShares',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nodeId')
    ..aOM<SigningResult>(2, _omitFieldNames ? '' : 'nodeTxSigningResult',
        subBuilder: SigningResult.create)
    ..aOM<SigningResult>(3, _omitFieldNames ? '' : 'refundTxSigningResult',
        subBuilder: SigningResult.create)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'verifyingKey', $pb.PbFieldType.OY)
    ..aOM<SigningResult>(5, _omitFieldNames ? '' : 'directNodeTxSigningResult',
        subBuilder: SigningResult.create)
    ..aOM<SigningResult>(
        6, _omitFieldNames ? '' : 'directRefundTxSigningResult',
        subBuilder: SigningResult.create)
    ..aOM<SigningResult>(
        7, _omitFieldNames ? '' : 'directFromCpfpRefundTxSigningResult',
        subBuilder: SigningResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NodeSignatureShares clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NodeSignatureShares copyWith(void Function(NodeSignatureShares) updates) =>
      super.copyWith((message) => updates(message as NodeSignatureShares))
          as NodeSignatureShares;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NodeSignatureShares create() => NodeSignatureShares._();
  @$core.override
  NodeSignatureShares createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NodeSignatureShares getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NodeSignatureShares>(create);
  static NodeSignatureShares? _defaultInstance;

  /// The id of the node.
  @$pb.TagNumber(1)
  $core.String get nodeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set nodeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNodeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNodeId() => $_clearField(1);

  /// The signing result of the node's transaction. This transaction is to pay to self.
  @$pb.TagNumber(2)
  SigningResult get nodeTxSigningResult => $_getN(1);
  @$pb.TagNumber(2)
  set nodeTxSigningResult(SigningResult value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNodeTxSigningResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearNodeTxSigningResult() => $_clearField(2);
  @$pb.TagNumber(2)
  SigningResult ensureNodeTxSigningResult() => $_ensure(1);

  /// The signing result of the node's refund transaction. This transaction is to pay to the user.
  @$pb.TagNumber(3)
  SigningResult get refundTxSigningResult => $_getN(2);
  @$pb.TagNumber(3)
  set refundTxSigningResult(SigningResult value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRefundTxSigningResult() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefundTxSigningResult() => $_clearField(3);
  @$pb.TagNumber(3)
  SigningResult ensureRefundTxSigningResult() => $_ensure(2);

  /// The verifying key of the node.
  @$pb.TagNumber(4)
  $core.List<$core.int> get verifyingKey => $_getN(3);
  @$pb.TagNumber(4)
  set verifyingKey($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVerifyingKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearVerifyingKey() => $_clearField(4);

  /// The signing result of the node's transaction. This transaction is to pay to self.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  SigningResult get directNodeTxSigningResult => $_getN(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  set directNodeTxSigningResult(SigningResult value) => $_setField(5, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.bool hasDirectNodeTxSigningResult() => $_has(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  void clearDirectNodeTxSigningResult() => $_clearField(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  SigningResult ensureDirectNodeTxSigningResult() => $_ensure(4);

  /// The signing result of the node's direct refund transaction. This transaction is to broadcast for the SO.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  SigningResult get directRefundTxSigningResult => $_getN(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  set directRefundTxSigningResult(SigningResult value) => $_setField(6, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.bool hasDirectRefundTxSigningResult() => $_has(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  void clearDirectRefundTxSigningResult() => $_clearField(6);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  SigningResult ensureDirectRefundTxSigningResult() => $_ensure(5);

  /// The signing result of the node's direct from cpfp refund transaction. This transaction is to broadcast for the SO.
  @$pb.TagNumber(7)
  SigningResult get directFromCpfpRefundTxSigningResult => $_getN(6);
  @$pb.TagNumber(7)
  set directFromCpfpRefundTxSigningResult(SigningResult value) =>
      $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasDirectFromCpfpRefundTxSigningResult() => $_has(6);
  @$pb.TagNumber(7)
  void clearDirectFromCpfpRefundTxSigningResult() => $_clearField(7);
  @$pb.TagNumber(7)
  SigningResult ensureDirectFromCpfpRefundTxSigningResult() => $_ensure(6);
}

/// *
///  NodeSignatures is the final signatures for a node on the tree.
///  It contains the signature for the node's transaction and refund transaction.
class NodeSignatures extends $pb.GeneratedMessage {
  factory NodeSignatures({
    $core.String? nodeId,
    $core.List<$core.int>? nodeTxSignature,
    $core.List<$core.int>? refundTxSignature,
    $core.List<$core.int>? directNodeTxSignature,
    $core.List<$core.int>? directRefundTxSignature,
    $core.List<$core.int>? directFromCpfpRefundTxSignature,
  }) {
    final result = create();
    if (nodeId != null) result.nodeId = nodeId;
    if (nodeTxSignature != null) result.nodeTxSignature = nodeTxSignature;
    if (refundTxSignature != null) result.refundTxSignature = refundTxSignature;
    if (directNodeTxSignature != null)
      result.directNodeTxSignature = directNodeTxSignature;
    if (directRefundTxSignature != null)
      result.directRefundTxSignature = directRefundTxSignature;
    if (directFromCpfpRefundTxSignature != null)
      result.directFromCpfpRefundTxSignature = directFromCpfpRefundTxSignature;
    return result;
  }

  NodeSignatures._();

  factory NodeSignatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NodeSignatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NodeSignatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nodeId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'nodeTxSignature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'refundTxSignature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'directNodeTxSignature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'directRefundTxSignature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        6,
        _omitFieldNames ? '' : 'directFromCpfpRefundTxSignature',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NodeSignatures clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NodeSignatures copyWith(void Function(NodeSignatures) updates) =>
      super.copyWith((message) => updates(message as NodeSignatures))
          as NodeSignatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NodeSignatures create() => NodeSignatures._();
  @$core.override
  NodeSignatures createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NodeSignatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NodeSignatures>(create);
  static NodeSignatures? _defaultInstance;

  /// The id of the node.
  @$pb.TagNumber(1)
  $core.String get nodeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set nodeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNodeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNodeId() => $_clearField(1);

  /// The final signature of the node's cpfp transaction. This transaction is to pay to self.
  @$pb.TagNumber(2)
  $core.List<$core.int> get nodeTxSignature => $_getN(1);
  @$pb.TagNumber(2)
  set nodeTxSignature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNodeTxSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearNodeTxSignature() => $_clearField(2);

  /// The final signature of the node's cpfp refund transaction. This transaction is to pay to the user.
  @$pb.TagNumber(3)
  $core.List<$core.int> get refundTxSignature => $_getN(2);
  @$pb.TagNumber(3)
  set refundTxSignature($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRefundTxSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefundTxSignature() => $_clearField(3);

  /// The final signature of the node's direct transaction. This transaction is to pay for the watchtower.
  @$pb.TagNumber(4)
  $core.List<$core.int> get directNodeTxSignature => $_getN(3);
  @$pb.TagNumber(4)
  set directNodeTxSignature($core.List<$core.int> value) =>
      $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDirectNodeTxSignature() => $_has(3);
  @$pb.TagNumber(4)
  void clearDirectNodeTxSignature() => $_clearField(4);

  /// The final signature of the node's direct refund transaction. This transaction is to pay for the watchtower.
  @$pb.TagNumber(5)
  $core.List<$core.int> get directRefundTxSignature => $_getN(4);
  @$pb.TagNumber(5)
  set directRefundTxSignature($core.List<$core.int> value) =>
      $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDirectRefundTxSignature() => $_has(4);
  @$pb.TagNumber(5)
  void clearDirectRefundTxSignature() => $_clearField(5);

  /// The final signature of the node's direct from cpfp refund transaction. This transaction is to pay for the watchtower.
  @$pb.TagNumber(6)
  $core.List<$core.int> get directFromCpfpRefundTxSignature => $_getN(5);
  @$pb.TagNumber(6)
  set directFromCpfpRefundTxSignature($core.List<$core.int> value) =>
      $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDirectFromCpfpRefundTxSignature() => $_has(5);
  @$pb.TagNumber(6)
  void clearDirectFromCpfpRefundTxSignature() => $_clearField(6);
}

/// *
///  StartTreeCreationRequest is the request to start the tree creation for a tree root node.
class StartTreeCreationRequest extends $pb.GeneratedMessage {
  factory StartTreeCreationRequest({
    $core.List<$core.int>? identityPublicKey,
    UTXO? onChainUtxo,
    SigningJob? rootTxSigningJob,
    SigningJob? refundTxSigningJob,
    SigningJob? directRootTxSigningJob,
    SigningJob? directRefundTxSigningJob,
    SigningJob? directFromCpfpRefundTxSigningJob,
  }) {
    final result = create();
    if (identityPublicKey != null) result.identityPublicKey = identityPublicKey;
    if (onChainUtxo != null) result.onChainUtxo = onChainUtxo;
    if (rootTxSigningJob != null) result.rootTxSigningJob = rootTxSigningJob;
    if (refundTxSigningJob != null)
      result.refundTxSigningJob = refundTxSigningJob;
    if (directRootTxSigningJob != null)
      result.directRootTxSigningJob = directRootTxSigningJob;
    if (directRefundTxSigningJob != null)
      result.directRefundTxSigningJob = directRefundTxSigningJob;
    if (directFromCpfpRefundTxSigningJob != null)
      result.directFromCpfpRefundTxSigningJob =
          directFromCpfpRefundTxSigningJob;
    return result;
  }

  StartTreeCreationRequest._();

  factory StartTreeCreationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartTreeCreationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartTreeCreationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'identityPublicKey', $pb.PbFieldType.OY)
    ..aOM<UTXO>(2, _omitFieldNames ? '' : 'onChainUtxo',
        subBuilder: UTXO.create)
    ..aOM<SigningJob>(3, _omitFieldNames ? '' : 'rootTxSigningJob',
        subBuilder: SigningJob.create)
    ..aOM<SigningJob>(4, _omitFieldNames ? '' : 'refundTxSigningJob',
        subBuilder: SigningJob.create)
    ..aOM<SigningJob>(5, _omitFieldNames ? '' : 'directRootTxSigningJob',
        subBuilder: SigningJob.create)
    ..aOM<SigningJob>(6, _omitFieldNames ? '' : 'directRefundTxSigningJob',
        subBuilder: SigningJob.create)
    ..aOM<SigningJob>(
        7, _omitFieldNames ? '' : 'directFromCpfpRefundTxSigningJob',
        subBuilder: SigningJob.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartTreeCreationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartTreeCreationRequest copyWith(
          void Function(StartTreeCreationRequest) updates) =>
      super.copyWith((message) => updates(message as StartTreeCreationRequest))
          as StartTreeCreationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartTreeCreationRequest create() => StartTreeCreationRequest._();
  @$core.override
  StartTreeCreationRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartTreeCreationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartTreeCreationRequest>(create);
  static StartTreeCreationRequest? _defaultInstance;

  /// The identity public key of the user.
  @$pb.TagNumber(1)
  $core.List<$core.int> get identityPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set identityPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentityPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentityPublicKey() => $_clearField(1);

  /// The on-chain utxo to be used to be spent by the root node.
  @$pb.TagNumber(2)
  UTXO get onChainUtxo => $_getN(1);
  @$pb.TagNumber(2)
  set onChainUtxo(UTXO value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOnChainUtxo() => $_has(1);
  @$pb.TagNumber(2)
  void clearOnChainUtxo() => $_clearField(2);
  @$pb.TagNumber(2)
  UTXO ensureOnChainUtxo() => $_ensure(1);

  /// The signing job for the root node's cpfp transaction.
  @$pb.TagNumber(3)
  SigningJob get rootTxSigningJob => $_getN(2);
  @$pb.TagNumber(3)
  set rootTxSigningJob(SigningJob value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRootTxSigningJob() => $_has(2);
  @$pb.TagNumber(3)
  void clearRootTxSigningJob() => $_clearField(3);
  @$pb.TagNumber(3)
  SigningJob ensureRootTxSigningJob() => $_ensure(2);

  /// The signing job for the root node's cpfp refund transaction.
  @$pb.TagNumber(4)
  SigningJob get refundTxSigningJob => $_getN(3);
  @$pb.TagNumber(4)
  set refundTxSigningJob(SigningJob value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRefundTxSigningJob() => $_has(3);
  @$pb.TagNumber(4)
  void clearRefundTxSigningJob() => $_clearField(4);
  @$pb.TagNumber(4)
  SigningJob ensureRefundTxSigningJob() => $_ensure(3);

  /// The signing job for the root node's direct transaction.
  @$pb.TagNumber(5)
  SigningJob get directRootTxSigningJob => $_getN(4);
  @$pb.TagNumber(5)
  set directRootTxSigningJob(SigningJob value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasDirectRootTxSigningJob() => $_has(4);
  @$pb.TagNumber(5)
  void clearDirectRootTxSigningJob() => $_clearField(5);
  @$pb.TagNumber(5)
  SigningJob ensureDirectRootTxSigningJob() => $_ensure(4);

  /// The signing job for the root node's direct refund transaction
  @$pb.TagNumber(6)
  SigningJob get directRefundTxSigningJob => $_getN(5);
  @$pb.TagNumber(6)
  set directRefundTxSigningJob(SigningJob value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasDirectRefundTxSigningJob() => $_has(5);
  @$pb.TagNumber(6)
  void clearDirectRefundTxSigningJob() => $_clearField(6);
  @$pb.TagNumber(6)
  SigningJob ensureDirectRefundTxSigningJob() => $_ensure(5);

  /// The signing job for the root node's direct refund transaction
  @$pb.TagNumber(7)
  SigningJob get directFromCpfpRefundTxSigningJob => $_getN(6);
  @$pb.TagNumber(7)
  set directFromCpfpRefundTxSigningJob(SigningJob value) =>
      $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasDirectFromCpfpRefundTxSigningJob() => $_has(6);
  @$pb.TagNumber(7)
  void clearDirectFromCpfpRefundTxSigningJob() => $_clearField(7);
  @$pb.TagNumber(7)
  SigningJob ensureDirectFromCpfpRefundTxSigningJob() => $_ensure(6);
}

/// *
///  StartTreeCreationResponse is the response to the request to start the tree creation for a tree root node.
class StartTreeCreationResponse extends $pb.GeneratedMessage {
  factory StartTreeCreationResponse({
    $core.String? treeId,
    NodeSignatureShares? rootNodeSignatureShares,
  }) {
    final result = create();
    if (treeId != null) result.treeId = treeId;
    if (rootNodeSignatureShares != null)
      result.rootNodeSignatureShares = rootNodeSignatureShares;
    return result;
  }

  StartTreeCreationResponse._();

  factory StartTreeCreationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartTreeCreationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartTreeCreationResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'treeId')
    ..aOM<NodeSignatureShares>(
        2, _omitFieldNames ? '' : 'rootNodeSignatureShares',
        subBuilder: NodeSignatureShares.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartTreeCreationResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartTreeCreationResponse copyWith(
          void Function(StartTreeCreationResponse) updates) =>
      super.copyWith((message) => updates(message as StartTreeCreationResponse))
          as StartTreeCreationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartTreeCreationResponse create() => StartTreeCreationResponse._();
  @$core.override
  StartTreeCreationResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartTreeCreationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartTreeCreationResponse>(create);
  static StartTreeCreationResponse? _defaultInstance;

  /// The id of the tree.
  @$pb.TagNumber(1)
  $core.String get treeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set treeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTreeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTreeId() => $_clearField(1);

  /// The signature shares for the root node.
  @$pb.TagNumber(2)
  NodeSignatureShares get rootNodeSignatureShares => $_getN(1);
  @$pb.TagNumber(2)
  set rootNodeSignatureShares(NodeSignatureShares value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRootNodeSignatureShares() => $_has(1);
  @$pb.TagNumber(2)
  void clearRootNodeSignatureShares() => $_clearField(2);
  @$pb.TagNumber(2)
  NodeSignatureShares ensureRootNodeSignatureShares() => $_ensure(1);
}

/// *
///  StartDepositTreeCreationRequest is the request to start the tree creation for a tree root node.
class StartDepositTreeCreationRequest extends $pb.GeneratedMessage {
  factory StartDepositTreeCreationRequest({
    $core.List<$core.int>? identityPublicKey,
    UTXO? onChainUtxo,
    SigningJob? rootTxSigningJob,
    SigningJob? refundTxSigningJob,
    @$core.Deprecated('This field is deprecated.')
    SigningJob? directRootTxSigningJob,
    @$core.Deprecated('This field is deprecated.')
    SigningJob? directRefundTxSigningJob,
    SigningJob? directFromCpfpRefundTxSigningJob,
  }) {
    final result = create();
    if (identityPublicKey != null) result.identityPublicKey = identityPublicKey;
    if (onChainUtxo != null) result.onChainUtxo = onChainUtxo;
    if (rootTxSigningJob != null) result.rootTxSigningJob = rootTxSigningJob;
    if (refundTxSigningJob != null)
      result.refundTxSigningJob = refundTxSigningJob;
    if (directRootTxSigningJob != null)
      result.directRootTxSigningJob = directRootTxSigningJob;
    if (directRefundTxSigningJob != null)
      result.directRefundTxSigningJob = directRefundTxSigningJob;
    if (directFromCpfpRefundTxSigningJob != null)
      result.directFromCpfpRefundTxSigningJob =
          directFromCpfpRefundTxSigningJob;
    return result;
  }

  StartDepositTreeCreationRequest._();

  factory StartDepositTreeCreationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartDepositTreeCreationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartDepositTreeCreationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'identityPublicKey', $pb.PbFieldType.OY)
    ..aOM<UTXO>(2, _omitFieldNames ? '' : 'onChainUtxo',
        subBuilder: UTXO.create)
    ..aOM<SigningJob>(3, _omitFieldNames ? '' : 'rootTxSigningJob',
        subBuilder: SigningJob.create)
    ..aOM<SigningJob>(4, _omitFieldNames ? '' : 'refundTxSigningJob',
        subBuilder: SigningJob.create)
    ..aOM<SigningJob>(5, _omitFieldNames ? '' : 'directRootTxSigningJob',
        subBuilder: SigningJob.create)
    ..aOM<SigningJob>(6, _omitFieldNames ? '' : 'directRefundTxSigningJob',
        subBuilder: SigningJob.create)
    ..aOM<SigningJob>(
        7, _omitFieldNames ? '' : 'directFromCpfpRefundTxSigningJob',
        subBuilder: SigningJob.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartDepositTreeCreationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartDepositTreeCreationRequest copyWith(
          void Function(StartDepositTreeCreationRequest) updates) =>
      super.copyWith(
              (message) => updates(message as StartDepositTreeCreationRequest))
          as StartDepositTreeCreationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartDepositTreeCreationRequest create() =>
      StartDepositTreeCreationRequest._();
  @$core.override
  StartDepositTreeCreationRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartDepositTreeCreationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartDepositTreeCreationRequest>(
          create);
  static StartDepositTreeCreationRequest? _defaultInstance;

  /// The identity public key of the user.
  @$pb.TagNumber(1)
  $core.List<$core.int> get identityPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set identityPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentityPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentityPublicKey() => $_clearField(1);

  /// The on-chain utxo to be used to be spent by the root node.
  @$pb.TagNumber(2)
  UTXO get onChainUtxo => $_getN(1);
  @$pb.TagNumber(2)
  set onChainUtxo(UTXO value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOnChainUtxo() => $_has(1);
  @$pb.TagNumber(2)
  void clearOnChainUtxo() => $_clearField(2);
  @$pb.TagNumber(2)
  UTXO ensureOnChainUtxo() => $_ensure(1);

  /// The signing job for the root node's transaction.
  @$pb.TagNumber(3)
  SigningJob get rootTxSigningJob => $_getN(2);
  @$pb.TagNumber(3)
  set rootTxSigningJob(SigningJob value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRootTxSigningJob() => $_has(2);
  @$pb.TagNumber(3)
  void clearRootTxSigningJob() => $_clearField(3);
  @$pb.TagNumber(3)
  SigningJob ensureRootTxSigningJob() => $_ensure(2);

  /// The signing job for the root node's refund transaction.
  @$pb.TagNumber(4)
  SigningJob get refundTxSigningJob => $_getN(3);
  @$pb.TagNumber(4)
  set refundTxSigningJob(SigningJob value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRefundTxSigningJob() => $_has(3);
  @$pb.TagNumber(4)
  void clearRefundTxSigningJob() => $_clearField(4);
  @$pb.TagNumber(4)
  SigningJob ensureRefundTxSigningJob() => $_ensure(3);

  /// The direct signing job for the root node's transaction.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  SigningJob get directRootTxSigningJob => $_getN(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  set directRootTxSigningJob(SigningJob value) => $_setField(5, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  $core.bool hasDirectRootTxSigningJob() => $_has(4);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  void clearDirectRootTxSigningJob() => $_clearField(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(5)
  SigningJob ensureDirectRootTxSigningJob() => $_ensure(4);

  /// The signing job for the root node's direct refund transaction.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  SigningJob get directRefundTxSigningJob => $_getN(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  set directRefundTxSigningJob(SigningJob value) => $_setField(6, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.bool hasDirectRefundTxSigningJob() => $_has(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  void clearDirectRefundTxSigningJob() => $_clearField(6);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  SigningJob ensureDirectRefundTxSigningJob() => $_ensure(5);

  /// The signing job for the root node's direct from cpfp refund transaction.
  @$pb.TagNumber(7)
  SigningJob get directFromCpfpRefundTxSigningJob => $_getN(6);
  @$pb.TagNumber(7)
  set directFromCpfpRefundTxSigningJob(SigningJob value) =>
      $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasDirectFromCpfpRefundTxSigningJob() => $_has(6);
  @$pb.TagNumber(7)
  void clearDirectFromCpfpRefundTxSigningJob() => $_clearField(7);
  @$pb.TagNumber(7)
  SigningJob ensureDirectFromCpfpRefundTxSigningJob() => $_ensure(6);
}

/// *
///  StartDepositTreeCreationResponse is the response to the request to start the tree creation for a tree root node.
class StartDepositTreeCreationResponse extends $pb.GeneratedMessage {
  factory StartDepositTreeCreationResponse({
    $core.String? treeId,
    NodeSignatureShares? rootNodeSignatureShares,
  }) {
    final result = create();
    if (treeId != null) result.treeId = treeId;
    if (rootNodeSignatureShares != null)
      result.rootNodeSignatureShares = rootNodeSignatureShares;
    return result;
  }

  StartDepositTreeCreationResponse._();

  factory StartDepositTreeCreationResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartDepositTreeCreationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartDepositTreeCreationResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'treeId')
    ..aOM<NodeSignatureShares>(
        2, _omitFieldNames ? '' : 'rootNodeSignatureShares',
        subBuilder: NodeSignatureShares.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartDepositTreeCreationResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartDepositTreeCreationResponse copyWith(
          void Function(StartDepositTreeCreationResponse) updates) =>
      super.copyWith(
              (message) => updates(message as StartDepositTreeCreationResponse))
          as StartDepositTreeCreationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartDepositTreeCreationResponse create() =>
      StartDepositTreeCreationResponse._();
  @$core.override
  StartDepositTreeCreationResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartDepositTreeCreationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartDepositTreeCreationResponse>(
          create);
  static StartDepositTreeCreationResponse? _defaultInstance;

  /// The id of the tree.
  @$pb.TagNumber(1)
  $core.String get treeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set treeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTreeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTreeId() => $_clearField(1);

  /// The signature shares for the root node.
  @$pb.TagNumber(2)
  NodeSignatureShares get rootNodeSignatureShares => $_getN(1);
  @$pb.TagNumber(2)
  set rootNodeSignatureShares(NodeSignatureShares value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRootNodeSignatureShares() => $_has(1);
  @$pb.TagNumber(2)
  void clearRootNodeSignatureShares() => $_clearField(2);
  @$pb.TagNumber(2)
  NodeSignatureShares ensureRootNodeSignatureShares() => $_ensure(1);
}

/// *
///  FinalizeDepositTreeCreationRequest is the request to finalize the tree creation for a tree root node.
class FinalizeDepositTreeCreationRequest extends $pb.GeneratedMessage {
  factory FinalizeDepositTreeCreationRequest({
    $core.List<$core.int>? identityPublicKey,
    UTXO? onChainUtxo,
    UserSignedTxSigningJob? rootTxSigningJob,
    UserSignedTxSigningJob? refundTxSigningJob,
    UserSignedTxSigningJob? directFromCpfpRefundTxSigningJob,
    $core.Iterable<UTXO>? additionalOnChainUtxos,
  }) {
    final result = create();
    if (identityPublicKey != null) result.identityPublicKey = identityPublicKey;
    if (onChainUtxo != null) result.onChainUtxo = onChainUtxo;
    if (rootTxSigningJob != null) result.rootTxSigningJob = rootTxSigningJob;
    if (refundTxSigningJob != null)
      result.refundTxSigningJob = refundTxSigningJob;
    if (directFromCpfpRefundTxSigningJob != null)
      result.directFromCpfpRefundTxSigningJob =
          directFromCpfpRefundTxSigningJob;
    if (additionalOnChainUtxos != null)
      result.additionalOnChainUtxos.addAll(additionalOnChainUtxos);
    return result;
  }

  FinalizeDepositTreeCreationRequest._();

  factory FinalizeDepositTreeCreationRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinalizeDepositTreeCreationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinalizeDepositTreeCreationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'identityPublicKey', $pb.PbFieldType.OY)
    ..aOM<UTXO>(2, _omitFieldNames ? '' : 'onChainUtxo',
        subBuilder: UTXO.create)
    ..aOM<UserSignedTxSigningJob>(3, _omitFieldNames ? '' : 'rootTxSigningJob',
        subBuilder: UserSignedTxSigningJob.create)
    ..aOM<UserSignedTxSigningJob>(
        4, _omitFieldNames ? '' : 'refundTxSigningJob',
        subBuilder: UserSignedTxSigningJob.create)
    ..aOM<UserSignedTxSigningJob>(
        5, _omitFieldNames ? '' : 'directFromCpfpRefundTxSigningJob',
        subBuilder: UserSignedTxSigningJob.create)
    ..pPM<UTXO>(6, _omitFieldNames ? '' : 'additionalOnChainUtxos',
        subBuilder: UTXO.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeDepositTreeCreationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeDepositTreeCreationRequest copyWith(
          void Function(FinalizeDepositTreeCreationRequest) updates) =>
      super.copyWith((message) =>
              updates(message as FinalizeDepositTreeCreationRequest))
          as FinalizeDepositTreeCreationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinalizeDepositTreeCreationRequest create() =>
      FinalizeDepositTreeCreationRequest._();
  @$core.override
  FinalizeDepositTreeCreationRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FinalizeDepositTreeCreationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinalizeDepositTreeCreationRequest>(
          create);
  static FinalizeDepositTreeCreationRequest? _defaultInstance;

  /// The identity public key of the user
  @$pb.TagNumber(1)
  $core.List<$core.int> get identityPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set identityPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentityPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentityPublicKey() => $_clearField(1);

  /// The on-chain utxo
  @$pb.TagNumber(2)
  UTXO get onChainUtxo => $_getN(1);
  @$pb.TagNumber(2)
  set onChainUtxo(UTXO value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOnChainUtxo() => $_has(1);
  @$pb.TagNumber(2)
  void clearOnChainUtxo() => $_clearField(2);
  @$pb.TagNumber(2)
  UTXO ensureOnChainUtxo() => $_ensure(1);

  /// User-signed transactions (with user signature shares, aggregated by server)
  @$pb.TagNumber(3)
  UserSignedTxSigningJob get rootTxSigningJob => $_getN(2);
  @$pb.TagNumber(3)
  set rootTxSigningJob(UserSignedTxSigningJob value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRootTxSigningJob() => $_has(2);
  @$pb.TagNumber(3)
  void clearRootTxSigningJob() => $_clearField(3);
  @$pb.TagNumber(3)
  UserSignedTxSigningJob ensureRootTxSigningJob() => $_ensure(2);

  @$pb.TagNumber(4)
  UserSignedTxSigningJob get refundTxSigningJob => $_getN(3);
  @$pb.TagNumber(4)
  set refundTxSigningJob(UserSignedTxSigningJob value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRefundTxSigningJob() => $_has(3);
  @$pb.TagNumber(4)
  void clearRefundTxSigningJob() => $_clearField(4);
  @$pb.TagNumber(4)
  UserSignedTxSigningJob ensureRefundTxSigningJob() => $_ensure(3);

  @$pb.TagNumber(5)
  UserSignedTxSigningJob get directFromCpfpRefundTxSigningJob => $_getN(4);
  @$pb.TagNumber(5)
  set directFromCpfpRefundTxSigningJob(UserSignedTxSigningJob value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasDirectFromCpfpRefundTxSigningJob() => $_has(4);
  @$pb.TagNumber(5)
  void clearDirectFromCpfpRefundTxSigningJob() => $_clearField(5);
  @$pb.TagNumber(5)
  UserSignedTxSigningJob ensureDirectFromCpfpRefundTxSigningJob() =>
      $_ensure(4);

  /// Additional on-chain UTXOs for non-static deposits with multiple UTXOs.
  /// All additional UTXOs must pay to the same deposit address as on_chain_utxo.
  /// For multi-UTXO deposits, all UTXOs (primary + additional) must be confirmed
  /// on-chain before finalization. The root_tx_signing_job.additional_inputs must
  /// contain one InputSigningData per additional UTXO, in the same order.
  @$pb.TagNumber(6)
  $pb.PbList<UTXO> get additionalOnChainUtxos => $_getList(5);
}

/// *
///  FinalizeDepositTreeCreationResponse is the response to the request to finalize the tree creation for a tree root node.
class FinalizeDepositTreeCreationResponse extends $pb.GeneratedMessage {
  factory FinalizeDepositTreeCreationResponse({
    TreeNode? rootNode,
  }) {
    final result = create();
    if (rootNode != null) result.rootNode = rootNode;
    return result;
  }

  FinalizeDepositTreeCreationResponse._();

  factory FinalizeDepositTreeCreationResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinalizeDepositTreeCreationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinalizeDepositTreeCreationResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<TreeNode>(1, _omitFieldNames ? '' : 'rootNode',
        subBuilder: TreeNode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeDepositTreeCreationResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeDepositTreeCreationResponse copyWith(
          void Function(FinalizeDepositTreeCreationResponse) updates) =>
      super.copyWith((message) =>
              updates(message as FinalizeDepositTreeCreationResponse))
          as FinalizeDepositTreeCreationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinalizeDepositTreeCreationResponse create() =>
      FinalizeDepositTreeCreationResponse._();
  @$core.override
  FinalizeDepositTreeCreationResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FinalizeDepositTreeCreationResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          FinalizeDepositTreeCreationResponse>(create);
  static FinalizeDepositTreeCreationResponse? _defaultInstance;

  /// the root node of the created tree
  @$pb.TagNumber(1)
  TreeNode get rootNode => $_getN(0);
  @$pb.TagNumber(1)
  set rootNode(TreeNode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRootNode() => $_has(0);
  @$pb.TagNumber(1)
  void clearRootNode() => $_clearField(1);
  @$pb.TagNumber(1)
  TreeNode ensureRootNode() => $_ensure(0);
}

/// *
///  TreeNode represents a node on the tree.
class TreeNode extends $pb.GeneratedMessage {
  factory TreeNode({
    $core.String? id,
    $core.String? treeId,
    $fixnum.Int64? value,
    $core.String? parentNodeId,
    $core.List<$core.int>? nodeTx,
    $core.List<$core.int>? refundTx,
    $core.int? vout,
    $core.List<$core.int>? verifyingPublicKey,
    $core.List<$core.int>? ownerIdentityPublicKey,
    SigningKeyshare? signingKeyshare,
    $core.String? status,
    Network? network,
    $3.Timestamp? createdTime,
    $3.Timestamp? updatedTime,
    $core.List<$core.int>? ownerSigningPublicKey,
    $core.List<$core.int>? directTx,
    $core.List<$core.int>? directRefundTx,
    $core.List<$core.int>? directFromCpfpRefundTx,
    TreeNodeStatus? treenodeStatus,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (treeId != null) result.treeId = treeId;
    if (value != null) result.value = value;
    if (parentNodeId != null) result.parentNodeId = parentNodeId;
    if (nodeTx != null) result.nodeTx = nodeTx;
    if (refundTx != null) result.refundTx = refundTx;
    if (vout != null) result.vout = vout;
    if (verifyingPublicKey != null)
      result.verifyingPublicKey = verifyingPublicKey;
    if (ownerIdentityPublicKey != null)
      result.ownerIdentityPublicKey = ownerIdentityPublicKey;
    if (signingKeyshare != null) result.signingKeyshare = signingKeyshare;
    if (status != null) result.status = status;
    if (network != null) result.network = network;
    if (createdTime != null) result.createdTime = createdTime;
    if (updatedTime != null) result.updatedTime = updatedTime;
    if (ownerSigningPublicKey != null)
      result.ownerSigningPublicKey = ownerSigningPublicKey;
    if (directTx != null) result.directTx = directTx;
    if (directRefundTx != null) result.directRefundTx = directRefundTx;
    if (directFromCpfpRefundTx != null)
      result.directFromCpfpRefundTx = directFromCpfpRefundTx;
    if (treenodeStatus != null) result.treenodeStatus = treenodeStatus;
    return result;
  }

  TreeNode._();

  factory TreeNode.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TreeNode.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TreeNode',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'treeId')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'parentNodeId')
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'nodeTx', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'refundTx', $pb.PbFieldType.OY)
    ..aI(7, _omitFieldNames ? '' : 'vout', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        8, _omitFieldNames ? '' : 'verifyingPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        9, _omitFieldNames ? '' : 'ownerIdentityPublicKey', $pb.PbFieldType.OY)
    ..aOM<SigningKeyshare>(10, _omitFieldNames ? '' : 'signingKeyshare',
        subBuilder: SigningKeyshare.create)
    ..aOS(11, _omitFieldNames ? '' : 'status')
    ..aE<Network>(12, _omitFieldNames ? '' : 'network',
        enumValues: Network.values)
    ..aOM<$3.Timestamp>(13, _omitFieldNames ? '' : 'createdTime',
        subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(14, _omitFieldNames ? '' : 'updatedTime',
        subBuilder: $3.Timestamp.create)
    ..a<$core.List<$core.int>>(
        15, _omitFieldNames ? '' : 'ownerSigningPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        16, _omitFieldNames ? '' : 'directTx', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        17, _omitFieldNames ? '' : 'directRefundTx', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        18, _omitFieldNames ? '' : 'directFromCpfpRefundTx', $pb.PbFieldType.OY)
    ..aE<TreeNodeStatus>(19, _omitFieldNames ? '' : 'treenodeStatus',
        enumValues: TreeNodeStatus.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TreeNode clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TreeNode copyWith(void Function(TreeNode) updates) =>
      super.copyWith((message) => updates(message as TreeNode)) as TreeNode;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TreeNode create() => TreeNode._();
  @$core.override
  TreeNode createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TreeNode getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TreeNode>(create);
  static TreeNode? _defaultInstance;

  /// The id of the node.
  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// The id of the tree for this node .
  @$pb.TagNumber(2)
  $core.String get treeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set treeId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTreeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTreeId() => $_clearField(2);

  /// The value that this node holds.
  @$pb.TagNumber(3)
  $fixnum.Int64 get value => $_getI64(2);
  @$pb.TagNumber(3)
  set value($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => $_clearField(3);

  /// The id of the parent node.
  @$pb.TagNumber(4)
  $core.String get parentNodeId => $_getSZ(3);
  @$pb.TagNumber(4)
  set parentNodeId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasParentNodeId() => $_has(3);
  @$pb.TagNumber(4)
  void clearParentNodeId() => $_clearField(4);

  /// The cpfp transaction of the node, this transaction is to pay to the same address as the node.
  @$pb.TagNumber(5)
  $core.List<$core.int> get nodeTx => $_getN(4);
  @$pb.TagNumber(5)
  set nodeTx($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNodeTx() => $_has(4);
  @$pb.TagNumber(5)
  void clearNodeTx() => $_clearField(5);

  /// The refund transaction of the node, this transaction is to pay to the user.
  @$pb.TagNumber(6)
  $core.List<$core.int> get refundTx => $_getN(5);
  @$pb.TagNumber(6)
  set refundTx($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRefundTx() => $_has(5);
  @$pb.TagNumber(6)
  void clearRefundTx() => $_clearField(6);

  /// This vout is the vout to spend the previous transaction, which is in the parent node.
  @$pb.TagNumber(7)
  $core.int get vout => $_getIZ(6);
  @$pb.TagNumber(7)
  set vout($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasVout() => $_has(6);
  @$pb.TagNumber(7)
  void clearVout() => $_clearField(7);

  /// The verifying public key of the node.
  @$pb.TagNumber(8)
  $core.List<$core.int> get verifyingPublicKey => $_getN(7);
  @$pb.TagNumber(8)
  set verifyingPublicKey($core.List<$core.int> value) => $_setBytes(7, value);
  @$pb.TagNumber(8)
  $core.bool hasVerifyingPublicKey() => $_has(7);
  @$pb.TagNumber(8)
  void clearVerifyingPublicKey() => $_clearField(8);

  /// The identity public key of the owner of the node.
  @$pb.TagNumber(9)
  $core.List<$core.int> get ownerIdentityPublicKey => $_getN(8);
  @$pb.TagNumber(9)
  set ownerIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(8, value);
  @$pb.TagNumber(9)
  $core.bool hasOwnerIdentityPublicKey() => $_has(8);
  @$pb.TagNumber(9)
  void clearOwnerIdentityPublicKey() => $_clearField(9);

  /// The signing keyshare information of the node on the SE side.
  @$pb.TagNumber(10)
  SigningKeyshare get signingKeyshare => $_getN(9);
  @$pb.TagNumber(10)
  set signingKeyshare(SigningKeyshare value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasSigningKeyshare() => $_has(9);
  @$pb.TagNumber(10)
  void clearSigningKeyshare() => $_clearField(10);
  @$pb.TagNumber(10)
  SigningKeyshare ensureSigningKeyshare() => $_ensure(9);

  /// The status of the node.
  @$pb.TagNumber(11)
  $core.String get status => $_getSZ(10);
  @$pb.TagNumber(11)
  set status($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearStatus() => $_clearField(11);

  /// The network of the node.
  @$pb.TagNumber(12)
  Network get network => $_getN(11);
  @$pb.TagNumber(12)
  set network(Network value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasNetwork() => $_has(11);
  @$pb.TagNumber(12)
  void clearNetwork() => $_clearField(12);

  /// The creation time of the node.
  @$pb.TagNumber(13)
  $3.Timestamp get createdTime => $_getN(12);
  @$pb.TagNumber(13)
  set createdTime($3.Timestamp value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasCreatedTime() => $_has(12);
  @$pb.TagNumber(13)
  void clearCreatedTime() => $_clearField(13);
  @$pb.TagNumber(13)
  $3.Timestamp ensureCreatedTime() => $_ensure(12);

  /// The latest update time of the node.
  @$pb.TagNumber(14)
  $3.Timestamp get updatedTime => $_getN(13);
  @$pb.TagNumber(14)
  set updatedTime($3.Timestamp value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasUpdatedTime() => $_has(13);
  @$pb.TagNumber(14)
  void clearUpdatedTime() => $_clearField(14);
  @$pb.TagNumber(14)
  $3.Timestamp ensureUpdatedTime() => $_ensure(13);

  /// The signing public key of the owner of the node.
  @$pb.TagNumber(15)
  $core.List<$core.int> get ownerSigningPublicKey => $_getN(14);
  @$pb.TagNumber(15)
  set ownerSigningPublicKey($core.List<$core.int> value) =>
      $_setBytes(14, value);
  @$pb.TagNumber(15)
  $core.bool hasOwnerSigningPublicKey() => $_has(14);
  @$pb.TagNumber(15)
  void clearOwnerSigningPublicKey() => $_clearField(15);

  /// The direct transaction of the node, this transaction is for the watchtower to broadcast.
  @$pb.TagNumber(16)
  $core.List<$core.int> get directTx => $_getN(15);
  @$pb.TagNumber(16)
  set directTx($core.List<$core.int> value) => $_setBytes(15, value);
  @$pb.TagNumber(16)
  $core.bool hasDirectTx() => $_has(15);
  @$pb.TagNumber(16)
  void clearDirectTx() => $_clearField(16);

  /// The refund transaction of the node, this transaction is to pay to the user.
  @$pb.TagNumber(17)
  $core.List<$core.int> get directRefundTx => $_getN(16);
  @$pb.TagNumber(17)
  set directRefundTx($core.List<$core.int> value) => $_setBytes(16, value);
  @$pb.TagNumber(17)
  $core.bool hasDirectRefundTx() => $_has(16);
  @$pb.TagNumber(17)
  void clearDirectRefundTx() => $_clearField(17);

  /// The refund transaction of the node, this transaction is to pay to the user.
  @$pb.TagNumber(18)
  $core.List<$core.int> get directFromCpfpRefundTx => $_getN(17);
  @$pb.TagNumber(18)
  set directFromCpfpRefundTx($core.List<$core.int> value) =>
      $_setBytes(17, value);
  @$pb.TagNumber(18)
  $core.bool hasDirectFromCpfpRefundTx() => $_has(17);
  @$pb.TagNumber(18)
  void clearDirectFromCpfpRefundTx() => $_clearField(18);

  /// The status of the node as a typed enum.
  @$pb.TagNumber(19)
  TreeNodeStatus get treenodeStatus => $_getN(18);
  @$pb.TagNumber(19)
  set treenodeStatus(TreeNodeStatus value) => $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasTreenodeStatus() => $_has(18);
  @$pb.TagNumber(19)
  void clearTreenodeStatus() => $_clearField(19);
}

/// *
///  FinalizeNodeSignaturesRequest is the request to finalize the signatures for a node.
class FinalizeNodeSignaturesRequest extends $pb.GeneratedMessage {
  factory FinalizeNodeSignaturesRequest({
    $2.SignatureIntent? intent,
    $core.Iterable<NodeSignatures>? nodeSignatures,
  }) {
    final result = create();
    if (intent != null) result.intent = intent;
    if (nodeSignatures != null) result.nodeSignatures.addAll(nodeSignatures);
    return result;
  }

  FinalizeNodeSignaturesRequest._();

  factory FinalizeNodeSignaturesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinalizeNodeSignaturesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinalizeNodeSignaturesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aE<$2.SignatureIntent>(1, _omitFieldNames ? '' : 'intent',
        enumValues: $2.SignatureIntent.values)
    ..pPM<NodeSignatures>(2, _omitFieldNames ? '' : 'nodeSignatures',
        subBuilder: NodeSignatures.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeNodeSignaturesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeNodeSignaturesRequest copyWith(
          void Function(FinalizeNodeSignaturesRequest) updates) =>
      super.copyWith(
              (message) => updates(message as FinalizeNodeSignaturesRequest))
          as FinalizeNodeSignaturesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinalizeNodeSignaturesRequest create() =>
      FinalizeNodeSignaturesRequest._();
  @$core.override
  FinalizeNodeSignaturesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FinalizeNodeSignaturesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinalizeNodeSignaturesRequest>(create);
  static FinalizeNodeSignaturesRequest? _defaultInstance;

  /// The intent of the signature.
  @$pb.TagNumber(1)
  $2.SignatureIntent get intent => $_getN(0);
  @$pb.TagNumber(1)
  set intent($2.SignatureIntent value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasIntent() => $_has(0);
  @$pb.TagNumber(1)
  void clearIntent() => $_clearField(1);

  /// The signatures for the node.
  @$pb.TagNumber(2)
  $pb.PbList<NodeSignatures> get nodeSignatures => $_getList(1);
}

/// *
///  FinalizeNodeSignaturesResponse is the response to the request to finalize the signatures for a node.
class FinalizeNodeSignaturesResponse extends $pb.GeneratedMessage {
  factory FinalizeNodeSignaturesResponse({
    $core.Iterable<TreeNode>? nodes,
  }) {
    final result = create();
    if (nodes != null) result.nodes.addAll(nodes);
    return result;
  }

  FinalizeNodeSignaturesResponse._();

  factory FinalizeNodeSignaturesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinalizeNodeSignaturesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinalizeNodeSignaturesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..pPM<TreeNode>(1, _omitFieldNames ? '' : 'nodes',
        subBuilder: TreeNode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeNodeSignaturesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeNodeSignaturesResponse copyWith(
          void Function(FinalizeNodeSignaturesResponse) updates) =>
      super.copyWith(
              (message) => updates(message as FinalizeNodeSignaturesResponse))
          as FinalizeNodeSignaturesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinalizeNodeSignaturesResponse create() =>
      FinalizeNodeSignaturesResponse._();
  @$core.override
  FinalizeNodeSignaturesResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FinalizeNodeSignaturesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinalizeNodeSignaturesResponse>(create);
  static FinalizeNodeSignaturesResponse? _defaultInstance;

  /// The nodes that are finalized.
  @$pb.TagNumber(1)
  $pb.PbList<TreeNode> get nodes => $_getList(0);
}

/// *
///  SecretShare is a secret share of a secret, using Feldman VSS.
///  The secret share is in the field of secp256k1 scalar field.
class SecretShare extends $pb.GeneratedMessage {
  factory SecretShare({
    $core.List<$core.int>? secretShare,
    $core.Iterable<$core.List<$core.int>>? proofs,
  }) {
    final result = create();
    if (secretShare != null) result.secretShare = secretShare;
    if (proofs != null) result.proofs.addAll(proofs);
    return result;
  }

  SecretShare._();

  factory SecretShare.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SecretShare.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SecretShare',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'secretShare', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'proofs', $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SecretShare clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SecretShare copyWith(void Function(SecretShare) updates) =>
      super.copyWith((message) => updates(message as SecretShare))
          as SecretShare;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SecretShare create() => SecretShare._();
  @$core.override
  SecretShare createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SecretShare getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SecretShare>(create);
  static SecretShare? _defaultInstance;

  /// The secret share.
  @$pb.TagNumber(1)
  $core.List<$core.int> get secretShare => $_getN(0);
  @$pb.TagNumber(1)
  set secretShare($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSecretShare() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecretShare() => $_clearField(1);

  /// The proofs for the secret share. They are the compressed public keys in secp256k1 curve.
  /// proofs[0] is the public key of the secret, while proofs[1..n] are the public key of the polynomial.
  @$pb.TagNumber(2)
  $pb.PbList<$core.List<$core.int>> get proofs => $_getList(1);
}

/// *
///  SecretProof is the proof for a secret share using Feldman VSS.
///  The proof is the compressed public keys in secp256k1 curve.
class SecretProof extends $pb.GeneratedMessage {
  factory SecretProof({
    $core.Iterable<$core.List<$core.int>>? proofs,
  }) {
    final result = create();
    if (proofs != null) result.proofs.addAll(proofs);
    return result;
  }

  SecretProof._();

  factory SecretProof.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SecretProof.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SecretProof',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..p<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'proofs', $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SecretProof clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SecretProof copyWith(void Function(SecretProof) updates) =>
      super.copyWith((message) => updates(message as SecretProof))
          as SecretProof;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SecretProof create() => SecretProof._();
  @$core.override
  SecretProof createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SecretProof getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SecretProof>(create);
  static SecretProof? _defaultInstance;

  /// The proofs for the secret share.
  /// proofs[0] is the public key of the secret, while proofs[1..n] are the public key of the polynomial.
  @$pb.TagNumber(1)
  $pb.PbList<$core.List<$core.int>> get proofs => $_getList(0);
}

class LeafRefundTxSigningJob extends $pb.GeneratedMessage {
  factory LeafRefundTxSigningJob({
    $core.String? leafId,
    SigningJob? refundTxSigningJob,
    SigningJob? directRefundTxSigningJob,
    SigningJob? directFromCpfpRefundTxSigningJob,
  }) {
    final result = create();
    if (leafId != null) result.leafId = leafId;
    if (refundTxSigningJob != null)
      result.refundTxSigningJob = refundTxSigningJob;
    if (directRefundTxSigningJob != null)
      result.directRefundTxSigningJob = directRefundTxSigningJob;
    if (directFromCpfpRefundTxSigningJob != null)
      result.directFromCpfpRefundTxSigningJob =
          directFromCpfpRefundTxSigningJob;
    return result;
  }

  LeafRefundTxSigningJob._();

  factory LeafRefundTxSigningJob.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LeafRefundTxSigningJob.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LeafRefundTxSigningJob',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'leafId')
    ..aOM<SigningJob>(2, _omitFieldNames ? '' : 'refundTxSigningJob',
        subBuilder: SigningJob.create)
    ..aOM<SigningJob>(3, _omitFieldNames ? '' : 'directRefundTxSigningJob',
        subBuilder: SigningJob.create)
    ..aOM<SigningJob>(
        4, _omitFieldNames ? '' : 'directFromCpfpRefundTxSigningJob',
        subBuilder: SigningJob.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LeafRefundTxSigningJob clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LeafRefundTxSigningJob copyWith(
          void Function(LeafRefundTxSigningJob) updates) =>
      super.copyWith((message) => updates(message as LeafRefundTxSigningJob))
          as LeafRefundTxSigningJob;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LeafRefundTxSigningJob create() => LeafRefundTxSigningJob._();
  @$core.override
  LeafRefundTxSigningJob createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LeafRefundTxSigningJob getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LeafRefundTxSigningJob>(create);
  static LeafRefundTxSigningJob? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get leafId => $_getSZ(0);
  @$pb.TagNumber(1)
  set leafId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLeafId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeafId() => $_clearField(1);

  @$pb.TagNumber(2)
  SigningJob get refundTxSigningJob => $_getN(1);
  @$pb.TagNumber(2)
  set refundTxSigningJob(SigningJob value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRefundTxSigningJob() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefundTxSigningJob() => $_clearField(2);
  @$pb.TagNumber(2)
  SigningJob ensureRefundTxSigningJob() => $_ensure(1);

  @$pb.TagNumber(3)
  SigningJob get directRefundTxSigningJob => $_getN(2);
  @$pb.TagNumber(3)
  set directRefundTxSigningJob(SigningJob value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDirectRefundTxSigningJob() => $_has(2);
  @$pb.TagNumber(3)
  void clearDirectRefundTxSigningJob() => $_clearField(3);
  @$pb.TagNumber(3)
  SigningJob ensureDirectRefundTxSigningJob() => $_ensure(2);

  @$pb.TagNumber(4)
  SigningJob get directFromCpfpRefundTxSigningJob => $_getN(3);
  @$pb.TagNumber(4)
  set directFromCpfpRefundTxSigningJob(SigningJob value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasDirectFromCpfpRefundTxSigningJob() => $_has(3);
  @$pb.TagNumber(4)
  void clearDirectFromCpfpRefundTxSigningJob() => $_clearField(4);
  @$pb.TagNumber(4)
  SigningJob ensureDirectFromCpfpRefundTxSigningJob() => $_ensure(3);
}

class UserSignedTxSigningJob extends $pb.GeneratedMessage {
  factory UserSignedTxSigningJob({
    $core.String? leafId,
    $core.List<$core.int>? signingPublicKey,
    $core.List<$core.int>? rawTx,
    $2.SigningCommitment? signingNonceCommitment,
    $core.List<$core.int>? userSignature,
    SigningCommitments? signingCommitments,
    $core.Iterable<InputSigningData>? additionalInputs,
  }) {
    final result = create();
    if (leafId != null) result.leafId = leafId;
    if (signingPublicKey != null) result.signingPublicKey = signingPublicKey;
    if (rawTx != null) result.rawTx = rawTx;
    if (signingNonceCommitment != null)
      result.signingNonceCommitment = signingNonceCommitment;
    if (userSignature != null) result.userSignature = userSignature;
    if (signingCommitments != null)
      result.signingCommitments = signingCommitments;
    if (additionalInputs != null)
      result.additionalInputs.addAll(additionalInputs);
    return result;
  }

  UserSignedTxSigningJob._();

  factory UserSignedTxSigningJob.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserSignedTxSigningJob.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserSignedTxSigningJob',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'leafId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signingPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'rawTx', $pb.PbFieldType.OY)
    ..aOM<$2.SigningCommitment>(
        4, _omitFieldNames ? '' : 'signingNonceCommitment',
        subBuilder: $2.SigningCommitment.create)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'userSignature', $pb.PbFieldType.OY)
    ..aOM<SigningCommitments>(6, _omitFieldNames ? '' : 'signingCommitments',
        subBuilder: SigningCommitments.create)
    ..pPM<InputSigningData>(7, _omitFieldNames ? '' : 'additionalInputs',
        subBuilder: InputSigningData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserSignedTxSigningJob clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserSignedTxSigningJob copyWith(
          void Function(UserSignedTxSigningJob) updates) =>
      super.copyWith((message) => updates(message as UserSignedTxSigningJob))
          as UserSignedTxSigningJob;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserSignedTxSigningJob create() => UserSignedTxSigningJob._();
  @$core.override
  UserSignedTxSigningJob createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserSignedTxSigningJob getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserSignedTxSigningJob>(create);
  static UserSignedTxSigningJob? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get leafId => $_getSZ(0);
  @$pb.TagNumber(1)
  set leafId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLeafId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeafId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get signingPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set signingPublicKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSigningPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearSigningPublicKey() => $_clearField(2);

  /// CPFP Refund Tx that is created when the User signs refunds. It spends the
  /// node transaction to the receiver.
  @$pb.TagNumber(3)
  $core.List<$core.int> get rawTx => $_getN(2);
  @$pb.TagNumber(3)
  set rawTx($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRawTx() => $_has(2);
  @$pb.TagNumber(3)
  void clearRawTx() => $_clearField(3);

  @$pb.TagNumber(4)
  $2.SigningCommitment get signingNonceCommitment => $_getN(3);
  @$pb.TagNumber(4)
  set signingNonceCommitment($2.SigningCommitment value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasSigningNonceCommitment() => $_has(3);
  @$pb.TagNumber(4)
  void clearSigningNonceCommitment() => $_clearField(4);
  @$pb.TagNumber(4)
  $2.SigningCommitment ensureSigningNonceCommitment() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.List<$core.int> get userSignature => $_getN(4);
  @$pb.TagNumber(5)
  set userSignature($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUserSignature() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserSignature() => $_clearField(5);

  @$pb.TagNumber(6)
  SigningCommitments get signingCommitments => $_getN(5);
  @$pb.TagNumber(6)
  set signingCommitments(SigningCommitments value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasSigningCommitments() => $_has(5);
  @$pb.TagNumber(6)
  void clearSigningCommitments() => $_clearField(6);
  @$pb.TagNumber(6)
  SigningCommitments ensureSigningCommitments() => $_ensure(5);

  /// Additional inputs for multi-UTXO root transactions. Each entry carries
  /// the signing data for one additional root tx input (inputs 1..N).
  /// Input 0 uses the fields above for backward compatibility.
  @$pb.TagNumber(7)
  $pb.PbList<InputSigningData> get additionalInputs => $_getList(6);
}

/// InputSigningData carries the per-input signing data for additional root tx
/// inputs in a multi-UTXO deposit.
class InputSigningData extends $pb.GeneratedMessage {
  factory InputSigningData({
    $2.SigningCommitment? signingNonceCommitment,
    $core.List<$core.int>? userSignature,
    SigningCommitments? signingCommitments,
  }) {
    final result = create();
    if (signingNonceCommitment != null)
      result.signingNonceCommitment = signingNonceCommitment;
    if (userSignature != null) result.userSignature = userSignature;
    if (signingCommitments != null)
      result.signingCommitments = signingCommitments;
    return result;
  }

  InputSigningData._();

  factory InputSigningData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InputSigningData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InputSigningData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<$2.SigningCommitment>(
        1, _omitFieldNames ? '' : 'signingNonceCommitment',
        subBuilder: $2.SigningCommitment.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'userSignature', $pb.PbFieldType.OY)
    ..aOM<SigningCommitments>(3, _omitFieldNames ? '' : 'signingCommitments',
        subBuilder: SigningCommitments.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputSigningData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputSigningData copyWith(void Function(InputSigningData) updates) =>
      super.copyWith((message) => updates(message as InputSigningData))
          as InputSigningData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InputSigningData create() => InputSigningData._();
  @$core.override
  InputSigningData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InputSigningData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InputSigningData>(create);
  static InputSigningData? _defaultInstance;

  /// The user's nonce commitment for this input's FROST signing round.
  @$pb.TagNumber(1)
  $2.SigningCommitment get signingNonceCommitment => $_getN(0);
  @$pb.TagNumber(1)
  set signingNonceCommitment($2.SigningCommitment value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSigningNonceCommitment() => $_has(0);
  @$pb.TagNumber(1)
  void clearSigningNonceCommitment() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.SigningCommitment ensureSigningNonceCommitment() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get userSignature => $_getN(1);
  @$pb.TagNumber(2)
  set userSignature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserSignature() => $_clearField(2);

  /// The SE (Signing Entity) operators' nonce commitments for this input, keyed by operator identifier.
  @$pb.TagNumber(3)
  SigningCommitments get signingCommitments => $_getN(2);
  @$pb.TagNumber(3)
  set signingCommitments(SigningCommitments value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSigningCommitments() => $_has(2);
  @$pb.TagNumber(3)
  void clearSigningCommitments() => $_clearField(3);
  @$pb.TagNumber(3)
  SigningCommitments ensureSigningCommitments() => $_ensure(2);
}

class LeafRefundTxSigningResult extends $pb.GeneratedMessage {
  factory LeafRefundTxSigningResult({
    $core.String? leafId,
    SigningResult? refundTxSigningResult,
    $core.List<$core.int>? verifyingKey,
    SigningResult? directRefundTxSigningResult,
    SigningResult? directFromCpfpRefundTxSigningResult,
  }) {
    final result = create();
    if (leafId != null) result.leafId = leafId;
    if (refundTxSigningResult != null)
      result.refundTxSigningResult = refundTxSigningResult;
    if (verifyingKey != null) result.verifyingKey = verifyingKey;
    if (directRefundTxSigningResult != null)
      result.directRefundTxSigningResult = directRefundTxSigningResult;
    if (directFromCpfpRefundTxSigningResult != null)
      result.directFromCpfpRefundTxSigningResult =
          directFromCpfpRefundTxSigningResult;
    return result;
  }

  LeafRefundTxSigningResult._();

  factory LeafRefundTxSigningResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LeafRefundTxSigningResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LeafRefundTxSigningResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'leafId')
    ..aOM<SigningResult>(2, _omitFieldNames ? '' : 'refundTxSigningResult',
        subBuilder: SigningResult.create)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'verifyingKey', $pb.PbFieldType.OY)
    ..aOM<SigningResult>(
        4, _omitFieldNames ? '' : 'directRefundTxSigningResult',
        subBuilder: SigningResult.create)
    ..aOM<SigningResult>(
        5, _omitFieldNames ? '' : 'directFromCpfpRefundTxSigningResult',
        subBuilder: SigningResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LeafRefundTxSigningResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LeafRefundTxSigningResult copyWith(
          void Function(LeafRefundTxSigningResult) updates) =>
      super.copyWith((message) => updates(message as LeafRefundTxSigningResult))
          as LeafRefundTxSigningResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LeafRefundTxSigningResult create() => LeafRefundTxSigningResult._();
  @$core.override
  LeafRefundTxSigningResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LeafRefundTxSigningResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LeafRefundTxSigningResult>(create);
  static LeafRefundTxSigningResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get leafId => $_getSZ(0);
  @$pb.TagNumber(1)
  set leafId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLeafId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeafId() => $_clearField(1);

  @$pb.TagNumber(2)
  SigningResult get refundTxSigningResult => $_getN(1);
  @$pb.TagNumber(2)
  set refundTxSigningResult(SigningResult value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRefundTxSigningResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefundTxSigningResult() => $_clearField(2);
  @$pb.TagNumber(2)
  SigningResult ensureRefundTxSigningResult() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get verifyingKey => $_getN(2);
  @$pb.TagNumber(3)
  set verifyingKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVerifyingKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearVerifyingKey() => $_clearField(3);

  @$pb.TagNumber(4)
  SigningResult get directRefundTxSigningResult => $_getN(3);
  @$pb.TagNumber(4)
  set directRefundTxSigningResult(SigningResult value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasDirectRefundTxSigningResult() => $_has(3);
  @$pb.TagNumber(4)
  void clearDirectRefundTxSigningResult() => $_clearField(4);
  @$pb.TagNumber(4)
  SigningResult ensureDirectRefundTxSigningResult() => $_ensure(3);

  @$pb.TagNumber(5)
  SigningResult get directFromCpfpRefundTxSigningResult => $_getN(4);
  @$pb.TagNumber(5)
  set directFromCpfpRefundTxSigningResult(SigningResult value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasDirectFromCpfpRefundTxSigningResult() => $_has(4);
  @$pb.TagNumber(5)
  void clearDirectFromCpfpRefundTxSigningResult() => $_clearField(5);
  @$pb.TagNumber(5)
  SigningResult ensureDirectFromCpfpRefundTxSigningResult() => $_ensure(4);
}

class StartUserSignedTransferRequest extends $pb.GeneratedMessage {
  factory StartUserSignedTransferRequest({
    $core.String? transferId,
    $core.List<$core.int>? ownerIdentityPublicKey,
    $core.Iterable<UserSignedTxSigningJob>? leavesToSend,
    $core.List<$core.int>? receiverIdentityPublicKey,
    $3.Timestamp? expiryTime,
    $core.Iterable<UserSignedTxSigningJob>? directLeavesToSend,
    $core.Iterable<UserSignedTxSigningJob>? directFromCpfpLeavesToSend,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (ownerIdentityPublicKey != null)
      result.ownerIdentityPublicKey = ownerIdentityPublicKey;
    if (leavesToSend != null) result.leavesToSend.addAll(leavesToSend);
    if (receiverIdentityPublicKey != null)
      result.receiverIdentityPublicKey = receiverIdentityPublicKey;
    if (expiryTime != null) result.expiryTime = expiryTime;
    if (directLeavesToSend != null)
      result.directLeavesToSend.addAll(directLeavesToSend);
    if (directFromCpfpLeavesToSend != null)
      result.directFromCpfpLeavesToSend.addAll(directFromCpfpLeavesToSend);
    return result;
  }

  StartUserSignedTransferRequest._();

  factory StartUserSignedTransferRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartUserSignedTransferRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartUserSignedTransferRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'ownerIdentityPublicKey', $pb.PbFieldType.OY)
    ..pPM<UserSignedTxSigningJob>(3, _omitFieldNames ? '' : 'leavesToSend',
        subBuilder: UserSignedTxSigningJob.create)
    ..a<$core.List<$core.int>>(4,
        _omitFieldNames ? '' : 'receiverIdentityPublicKey', $pb.PbFieldType.OY)
    ..aOM<$3.Timestamp>(5, _omitFieldNames ? '' : 'expiryTime',
        subBuilder: $3.Timestamp.create)
    ..pPM<UserSignedTxSigningJob>(
        6, _omitFieldNames ? '' : 'directLeavesToSend',
        subBuilder: UserSignedTxSigningJob.create)
    ..pPM<UserSignedTxSigningJob>(
        7, _omitFieldNames ? '' : 'directFromCpfpLeavesToSend',
        subBuilder: UserSignedTxSigningJob.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartUserSignedTransferRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartUserSignedTransferRequest copyWith(
          void Function(StartUserSignedTransferRequest) updates) =>
      super.copyWith(
              (message) => updates(message as StartUserSignedTransferRequest))
          as StartUserSignedTransferRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartUserSignedTransferRequest create() =>
      StartUserSignedTransferRequest._();
  @$core.override
  StartUserSignedTransferRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartUserSignedTransferRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartUserSignedTransferRequest>(create);
  static StartUserSignedTransferRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get ownerIdentityPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set ownerIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOwnerIdentityPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerIdentityPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<UserSignedTxSigningJob> get leavesToSend => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get receiverIdentityPublicKey => $_getN(3);
  @$pb.TagNumber(4)
  set receiverIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasReceiverIdentityPublicKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearReceiverIdentityPublicKey() => $_clearField(4);

  @$pb.TagNumber(5)
  $3.Timestamp get expiryTime => $_getN(4);
  @$pb.TagNumber(5)
  set expiryTime($3.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasExpiryTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpiryTime() => $_clearField(5);
  @$pb.TagNumber(5)
  $3.Timestamp ensureExpiryTime() => $_ensure(4);

  @$pb.TagNumber(6)
  $pb.PbList<UserSignedTxSigningJob> get directLeavesToSend => $_getList(5);

  @$pb.TagNumber(7)
  $pb.PbList<UserSignedTxSigningJob> get directFromCpfpLeavesToSend =>
      $_getList(6);
}

class StartTransferRequest extends $pb.GeneratedMessage {
  factory StartTransferRequest({
    $core.String? transferId,
    $core.List<$core.int>? ownerIdentityPublicKey,
    $core.Iterable<LeafRefundTxSigningJob>? leavesToSend,
    $core.List<$core.int>? receiverIdentityPublicKey,
    $3.Timestamp? expiryTime,
    TransferPackage? transferPackage,
    $core.String? sparkInvoice,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (ownerIdentityPublicKey != null)
      result.ownerIdentityPublicKey = ownerIdentityPublicKey;
    if (leavesToSend != null) result.leavesToSend.addAll(leavesToSend);
    if (receiverIdentityPublicKey != null)
      result.receiverIdentityPublicKey = receiverIdentityPublicKey;
    if (expiryTime != null) result.expiryTime = expiryTime;
    if (transferPackage != null) result.transferPackage = transferPackage;
    if (sparkInvoice != null) result.sparkInvoice = sparkInvoice;
    return result;
  }

  StartTransferRequest._();

  factory StartTransferRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartTransferRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartTransferRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'ownerIdentityPublicKey', $pb.PbFieldType.OY)
    ..pPM<LeafRefundTxSigningJob>(3, _omitFieldNames ? '' : 'leavesToSend',
        subBuilder: LeafRefundTxSigningJob.create)
    ..a<$core.List<$core.int>>(4,
        _omitFieldNames ? '' : 'receiverIdentityPublicKey', $pb.PbFieldType.OY)
    ..aOM<$3.Timestamp>(5, _omitFieldNames ? '' : 'expiryTime',
        subBuilder: $3.Timestamp.create)
    ..aOM<TransferPackage>(7, _omitFieldNames ? '' : 'transferPackage',
        subBuilder: TransferPackage.create)
    ..aOS(10, _omitFieldNames ? '' : 'sparkInvoice')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartTransferRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartTransferRequest copyWith(void Function(StartTransferRequest) updates) =>
      super.copyWith((message) => updates(message as StartTransferRequest))
          as StartTransferRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartTransferRequest create() => StartTransferRequest._();
  @$core.override
  StartTransferRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartTransferRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartTransferRequest>(create);
  static StartTransferRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get ownerIdentityPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set ownerIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOwnerIdentityPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerIdentityPublicKey() => $_clearField(2);

  /// This field is used for swap and coop exits. Regular transfers must use
  /// the transfer_package field.
  @$pb.TagNumber(3)
  $pb.PbList<LeafRefundTxSigningJob> get leavesToSend => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get receiverIdentityPublicKey => $_getN(3);
  @$pb.TagNumber(4)
  set receiverIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasReceiverIdentityPublicKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearReceiverIdentityPublicKey() => $_clearField(4);

  @$pb.TagNumber(5)
  $3.Timestamp get expiryTime => $_getN(4);
  @$pb.TagNumber(5)
  set expiryTime($3.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasExpiryTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpiryTime() => $_clearField(5);
  @$pb.TagNumber(5)
  $3.Timestamp ensureExpiryTime() => $_ensure(4);

  /// This field is required for transfers of type "transfer". If this field
  /// is set, the leaves_to_send and key_tweak_proofs will be ignored.
  @$pb.TagNumber(7)
  TransferPackage get transferPackage => $_getN(5);
  @$pb.TagNumber(7)
  set transferPackage(TransferPackage value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasTransferPackage() => $_has(5);
  @$pb.TagNumber(7)
  void clearTransferPackage() => $_clearField(7);
  @$pb.TagNumber(7)
  TransferPackage ensureTransferPackage() => $_ensure(5);

  /// The invoice this transfer pays.
  @$pb.TagNumber(10)
  $core.String get sparkInvoice => $_getSZ(6);
  @$pb.TagNumber(10)
  set sparkInvoice($core.String value) => $_setString(6, value);
  @$pb.TagNumber(10)
  $core.bool hasSparkInvoice() => $_has(6);
  @$pb.TagNumber(10)
  void clearSparkInvoice() => $_clearField(10);
}

class StartTransferResponse extends $pb.GeneratedMessage {
  factory StartTransferResponse({
    Transfer? transfer,
    $core.Iterable<LeafRefundTxSigningResult>? signingResults,
  }) {
    final result = create();
    if (transfer != null) result.transfer = transfer;
    if (signingResults != null) result.signingResults.addAll(signingResults);
    return result;
  }

  StartTransferResponse._();

  factory StartTransferResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartTransferResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartTransferResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<Transfer>(1, _omitFieldNames ? '' : 'transfer',
        subBuilder: Transfer.create)
    ..pPM<LeafRefundTxSigningResult>(2, _omitFieldNames ? '' : 'signingResults',
        subBuilder: LeafRefundTxSigningResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartTransferResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartTransferResponse copyWith(
          void Function(StartTransferResponse) updates) =>
      super.copyWith((message) => updates(message as StartTransferResponse))
          as StartTransferResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartTransferResponse create() => StartTransferResponse._();
  @$core.override
  StartTransferResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartTransferResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartTransferResponse>(create);
  static StartTransferResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Transfer get transfer => $_getN(0);
  @$pb.TagNumber(1)
  set transfer(Transfer value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransfer() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransfer() => $_clearField(1);
  @$pb.TagNumber(1)
  Transfer ensureTransfer() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<LeafRefundTxSigningResult> get signingResults => $_getList(1);
}

class SenderTransferPackage extends $pb.GeneratedMessage {
  factory SenderTransferPackage({
    $core.List<$core.int>? ownerIdentityPublicKey,
    TransferPackage? transferPackage,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        receiverIdentityPublicKeys,
  }) {
    final result = create();
    if (ownerIdentityPublicKey != null)
      result.ownerIdentityPublicKey = ownerIdentityPublicKey;
    if (transferPackage != null) result.transferPackage = transferPackage;
    if (receiverIdentityPublicKeys != null)
      result.receiverIdentityPublicKeys.addEntries(receiverIdentityPublicKeys);
    return result;
  }

  SenderTransferPackage._();

  factory SenderTransferPackage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SenderTransferPackage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SenderTransferPackage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'ownerIdentityPublicKey', $pb.PbFieldType.OY)
    ..aOM<TransferPackage>(2, _omitFieldNames ? '' : 'transferPackage',
        subBuilder: TransferPackage.create)
    ..m<$core.String, $core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'receiverIdentityPublicKeys',
        entryClassName: 'SenderTransferPackage.ReceiverIdentityPublicKeysEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SenderTransferPackage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SenderTransferPackage copyWith(
          void Function(SenderTransferPackage) updates) =>
      super.copyWith((message) => updates(message as SenderTransferPackage))
          as SenderTransferPackage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SenderTransferPackage create() => SenderTransferPackage._();
  @$core.override
  SenderTransferPackage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SenderTransferPackage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SenderTransferPackage>(create);
  static SenderTransferPackage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerIdentityPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set ownerIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerIdentityPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerIdentityPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  TransferPackage get transferPackage => $_getN(1);
  @$pb.TagNumber(2)
  set transferPackage(TransferPackage value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTransferPackage() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransferPackage() => $_clearField(2);
  @$pb.TagNumber(2)
  TransferPackage ensureTransferPackage() => $_ensure(1);

  /// The transfer package contains leaves that may be meant for multiple receivers.
  /// This maps leaf_id to receiver_identity_public_key for each leaf.
  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.List<$core.int>>
      get receiverIdentityPublicKeys => $_getMap(2);
}

/// Request to transfer leaves from multiple senders to multiple receivers
/// in a single atomic operation.
class StartTransferV3Request extends $pb.GeneratedMessage {
  factory StartTransferV3Request({
    $core.String? transferId,
    $core.Iterable<SenderTransferPackage>? senderPackages,
    $3.Timestamp? expiryTime,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (senderPackages != null) result.senderPackages.addAll(senderPackages);
    if (expiryTime != null) result.expiryTime = expiryTime;
    return result;
  }

  StartTransferV3Request._();

  factory StartTransferV3Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartTransferV3Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartTransferV3Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..pPM<SenderTransferPackage>(2, _omitFieldNames ? '' : 'senderPackages',
        subBuilder: SenderTransferPackage.create)
    ..aOM<$3.Timestamp>(3, _omitFieldNames ? '' : 'expiryTime',
        subBuilder: $3.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartTransferV3Request clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartTransferV3Request copyWith(
          void Function(StartTransferV3Request) updates) =>
      super.copyWith((message) => updates(message as StartTransferV3Request))
          as StartTransferV3Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartTransferV3Request create() => StartTransferV3Request._();
  @$core.override
  StartTransferV3Request createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartTransferV3Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartTransferV3Request>(create);
  static StartTransferV3Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  /// One entry per sender. Leaf IDs must be disjoint across entries.
  @$pb.TagNumber(2)
  $pb.PbList<SenderTransferPackage> get senderPackages => $_getList(1);

  /// Expiry time for the entire transfer
  @$pb.TagNumber(3)
  $3.Timestamp get expiryTime => $_getN(2);
  @$pb.TagNumber(3)
  set expiryTime($3.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasExpiryTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpiryTime() => $_clearField(3);
  @$pb.TagNumber(3)
  $3.Timestamp ensureExpiryTime() => $_ensure(2);
}

/// *
///  TransferPackage is a package of leaves to send and key tweaks to send.
///  This is in the improved send transfer flow where the sender can send the transfer in one call to
///  the coordinator SO.
class TransferPackage extends $pb.GeneratedMessage {
  factory TransferPackage({
    $core.Iterable<UserSignedTxSigningJob>? leavesToSend,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        keyTweakPackage,
    $core.List<$core.int>? userSignature,
    $core.Iterable<UserSignedTxSigningJob>? directLeavesToSend,
    $core.Iterable<UserSignedTxSigningJob>? directFromCpfpLeavesToSend,
    HashVariant? hashVariant,
  }) {
    final result = create();
    if (leavesToSend != null) result.leavesToSend.addAll(leavesToSend);
    if (keyTweakPackage != null)
      result.keyTweakPackage.addEntries(keyTweakPackage);
    if (userSignature != null) result.userSignature = userSignature;
    if (directLeavesToSend != null)
      result.directLeavesToSend.addAll(directLeavesToSend);
    if (directFromCpfpLeavesToSend != null)
      result.directFromCpfpLeavesToSend.addAll(directFromCpfpLeavesToSend);
    if (hashVariant != null) result.hashVariant = hashVariant;
    return result;
  }

  TransferPackage._();

  factory TransferPackage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransferPackage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransferPackage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..pPM<UserSignedTxSigningJob>(1, _omitFieldNames ? '' : 'leavesToSend',
        subBuilder: UserSignedTxSigningJob.create)
    ..m<$core.String, $core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'keyTweakPackage',
        entryClassName: 'TransferPackage.KeyTweakPackageEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark'))
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'userSignature', $pb.PbFieldType.OY)
    ..pPM<UserSignedTxSigningJob>(
        4, _omitFieldNames ? '' : 'directLeavesToSend',
        subBuilder: UserSignedTxSigningJob.create)
    ..pPM<UserSignedTxSigningJob>(
        5, _omitFieldNames ? '' : 'directFromCpfpLeavesToSend',
        subBuilder: UserSignedTxSigningJob.create)
    ..aE<HashVariant>(6, _omitFieldNames ? '' : 'hashVariant',
        enumValues: HashVariant.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferPackage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferPackage copyWith(void Function(TransferPackage) updates) =>
      super.copyWith((message) => updates(message as TransferPackage))
          as TransferPackage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferPackage create() => TransferPackage._();
  @$core.override
  TransferPackage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransferPackage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransferPackage>(create);
  static TransferPackage? _defaultInstance;

  /// The leaves to send, with user signed cpfp refunds and signing package.
  @$pb.TagNumber(1)
  $pb.PbList<UserSignedTxSigningJob> get leavesToSend => $_getList(0);

  /// The map of SO identifier to ciphertext of SendLeafTweaks.
  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $core.List<$core.int>> get keyTweakPackage =>
      $_getMap(1);

  /// The signature of user to prove that the key_tweak_package is not tampered.
  @$pb.TagNumber(3)
  $core.List<$core.int> get userSignature => $_getN(2);
  @$pb.TagNumber(3)
  set userSignature($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserSignature() => $_clearField(3);

  /// The leaves to send, with user signed direct refunds and signing package.
  @$pb.TagNumber(4)
  $pb.PbList<UserSignedTxSigningJob> get directLeavesToSend => $_getList(3);

  /// The leaves to send, with user signed direct from cpfp refunds and signing package.
  @$pb.TagNumber(5)
  $pb.PbList<UserSignedTxSigningJob> get directFromCpfpLeavesToSend =>
      $_getList(4);

  /// The hash variant to use for computing the transfer package signing payload.
  @$pb.TagNumber(6)
  HashVariant get hashVariant => $_getN(5);
  @$pb.TagNumber(6)
  set hashVariant(HashVariant value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasHashVariant() => $_has(5);
  @$pb.TagNumber(6)
  void clearHashVariant() => $_clearField(6);
}

class SendLeafKeyTweaks extends $pb.GeneratedMessage {
  factory SendLeafKeyTweaks({
    $core.Iterable<SendLeafKeyTweak>? leavesToSend,
  }) {
    final result = create();
    if (leavesToSend != null) result.leavesToSend.addAll(leavesToSend);
    return result;
  }

  SendLeafKeyTweaks._();

  factory SendLeafKeyTweaks.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendLeafKeyTweaks.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendLeafKeyTweaks',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..pPM<SendLeafKeyTweak>(1, _omitFieldNames ? '' : 'leavesToSend',
        subBuilder: SendLeafKeyTweak.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendLeafKeyTweaks clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendLeafKeyTweaks copyWith(void Function(SendLeafKeyTweaks) updates) =>
      super.copyWith((message) => updates(message as SendLeafKeyTweaks))
          as SendLeafKeyTweaks;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendLeafKeyTweaks create() => SendLeafKeyTweaks._();
  @$core.override
  SendLeafKeyTweaks createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendLeafKeyTweaks getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendLeafKeyTweaks>(create);
  static SendLeafKeyTweaks? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SendLeafKeyTweak> get leavesToSend => $_getList(0);
}

class SendLeafKeyTweak extends $pb.GeneratedMessage {
  factory SendLeafKeyTweak({
    $core.String? leafId,
    SecretShare? secretShareTweak,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        pubkeySharesTweak,
    $core.List<$core.int>? secretCipher,
    $core.List<$core.int>? signature,
    $core.List<$core.int>? refundSignature,
    $core.List<$core.int>? directRefundSignature,
    $core.List<$core.int>? directFromCpfpRefundSignature,
  }) {
    final result = create();
    if (leafId != null) result.leafId = leafId;
    if (secretShareTweak != null) result.secretShareTweak = secretShareTweak;
    if (pubkeySharesTweak != null)
      result.pubkeySharesTweak.addEntries(pubkeySharesTweak);
    if (secretCipher != null) result.secretCipher = secretCipher;
    if (signature != null) result.signature = signature;
    if (refundSignature != null) result.refundSignature = refundSignature;
    if (directRefundSignature != null)
      result.directRefundSignature = directRefundSignature;
    if (directFromCpfpRefundSignature != null)
      result.directFromCpfpRefundSignature = directFromCpfpRefundSignature;
    return result;
  }

  SendLeafKeyTweak._();

  factory SendLeafKeyTweak.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendLeafKeyTweak.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendLeafKeyTweak',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'leafId')
    ..aOM<SecretShare>(2, _omitFieldNames ? '' : 'secretShareTweak',
        subBuilder: SecretShare.create)
    ..m<$core.String, $core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'pubkeySharesTweak',
        entryClassName: 'SendLeafKeyTweak.PubkeySharesTweakEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark'))
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'secretCipher', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'refundSignature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'directRefundSignature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        8,
        _omitFieldNames ? '' : 'directFromCpfpRefundSignature',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendLeafKeyTweak clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendLeafKeyTweak copyWith(void Function(SendLeafKeyTweak) updates) =>
      super.copyWith((message) => updates(message as SendLeafKeyTweak))
          as SendLeafKeyTweak;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendLeafKeyTweak create() => SendLeafKeyTweak._();
  @$core.override
  SendLeafKeyTweak createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendLeafKeyTweak getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendLeafKeyTweak>(create);
  static SendLeafKeyTweak? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get leafId => $_getSZ(0);
  @$pb.TagNumber(1)
  set leafId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLeafId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeafId() => $_clearField(1);

  @$pb.TagNumber(2)
  SecretShare get secretShareTweak => $_getN(1);
  @$pb.TagNumber(2)
  set secretShareTweak(SecretShare value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSecretShareTweak() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecretShareTweak() => $_clearField(2);
  @$pb.TagNumber(2)
  SecretShare ensureSecretShareTweak() => $_ensure(1);

  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.List<$core.int>> get pubkeySharesTweak =>
      $_getMap(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get secretCipher => $_getN(3);
  @$pb.TagNumber(4)
  set secretCipher($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSecretCipher() => $_has(3);
  @$pb.TagNumber(4)
  void clearSecretCipher() => $_clearField(4);

  /// Signature over Sha256(leaf_id||transfer_id||secret_cipher)
  @$pb.TagNumber(5)
  $core.List<$core.int> get signature => $_getN(4);
  @$pb.TagNumber(5)
  set signature($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSignature() => $_has(4);
  @$pb.TagNumber(5)
  void clearSignature() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get refundSignature => $_getN(5);
  @$pb.TagNumber(6)
  set refundSignature($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRefundSignature() => $_has(5);
  @$pb.TagNumber(6)
  void clearRefundSignature() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get directRefundSignature => $_getN(6);
  @$pb.TagNumber(7)
  set directRefundSignature($core.List<$core.int> value) =>
      $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDirectRefundSignature() => $_has(6);
  @$pb.TagNumber(7)
  void clearDirectRefundSignature() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.int> get directFromCpfpRefundSignature => $_getN(7);
  @$pb.TagNumber(8)
  set directFromCpfpRefundSignature($core.List<$core.int> value) =>
      $_setBytes(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDirectFromCpfpRefundSignature() => $_has(7);
  @$pb.TagNumber(8)
  void clearDirectFromCpfpRefundSignature() => $_clearField(8);
}

class FinalizeTransferRequest extends $pb.GeneratedMessage {
  factory FinalizeTransferRequest({
    $core.String? transferId,
    $core.List<$core.int>? ownerIdentityPublicKey,
    $core.Iterable<SendLeafKeyTweak>? leavesToSend,
    $core.String? sparkPaymentIntent,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (ownerIdentityPublicKey != null)
      result.ownerIdentityPublicKey = ownerIdentityPublicKey;
    if (leavesToSend != null) result.leavesToSend.addAll(leavesToSend);
    if (sparkPaymentIntent != null)
      result.sparkPaymentIntent = sparkPaymentIntent;
    return result;
  }

  FinalizeTransferRequest._();

  factory FinalizeTransferRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinalizeTransferRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinalizeTransferRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'ownerIdentityPublicKey', $pb.PbFieldType.OY)
    ..pPM<SendLeafKeyTweak>(3, _omitFieldNames ? '' : 'leavesToSend',
        subBuilder: SendLeafKeyTweak.create)
    ..aOS(4, _omitFieldNames ? '' : 'sparkPaymentIntent')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeTransferRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeTransferRequest copyWith(
          void Function(FinalizeTransferRequest) updates) =>
      super.copyWith((message) => updates(message as FinalizeTransferRequest))
          as FinalizeTransferRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinalizeTransferRequest create() => FinalizeTransferRequest._();
  @$core.override
  FinalizeTransferRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FinalizeTransferRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinalizeTransferRequest>(create);
  static FinalizeTransferRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get ownerIdentityPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set ownerIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOwnerIdentityPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerIdentityPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<SendLeafKeyTweak> get leavesToSend => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get sparkPaymentIntent => $_getSZ(3);
  @$pb.TagNumber(4)
  set sparkPaymentIntent($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSparkPaymentIntent() => $_has(3);
  @$pb.TagNumber(4)
  void clearSparkPaymentIntent() => $_clearField(4);
}

class FinalizeTransferWithTransferPackageRequest extends $pb.GeneratedMessage {
  factory FinalizeTransferWithTransferPackageRequest({
    $core.String? transferId,
    $core.List<$core.int>? ownerIdentityPublicKey,
    TransferPackage? transferPackage,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (ownerIdentityPublicKey != null)
      result.ownerIdentityPublicKey = ownerIdentityPublicKey;
    if (transferPackage != null) result.transferPackage = transferPackage;
    return result;
  }

  FinalizeTransferWithTransferPackageRequest._();

  factory FinalizeTransferWithTransferPackageRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinalizeTransferWithTransferPackageRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinalizeTransferWithTransferPackageRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'ownerIdentityPublicKey', $pb.PbFieldType.OY)
    ..aOM<TransferPackage>(3, _omitFieldNames ? '' : 'transferPackage',
        subBuilder: TransferPackage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeTransferWithTransferPackageRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeTransferWithTransferPackageRequest copyWith(
          void Function(FinalizeTransferWithTransferPackageRequest) updates) =>
      super.copyWith((message) =>
              updates(message as FinalizeTransferWithTransferPackageRequest))
          as FinalizeTransferWithTransferPackageRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinalizeTransferWithTransferPackageRequest create() =>
      FinalizeTransferWithTransferPackageRequest._();
  @$core.override
  FinalizeTransferWithTransferPackageRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FinalizeTransferWithTransferPackageRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          FinalizeTransferWithTransferPackageRequest>(create);
  static FinalizeTransferWithTransferPackageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get ownerIdentityPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set ownerIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOwnerIdentityPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerIdentityPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  TransferPackage get transferPackage => $_getN(2);
  @$pb.TagNumber(3)
  set transferPackage(TransferPackage value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTransferPackage() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransferPackage() => $_clearField(3);
  @$pb.TagNumber(3)
  TransferPackage ensureTransferPackage() => $_ensure(2);
}

class FinalizeTransferResponse extends $pb.GeneratedMessage {
  factory FinalizeTransferResponse({
    Transfer? transfer,
  }) {
    final result = create();
    if (transfer != null) result.transfer = transfer;
    return result;
  }

  FinalizeTransferResponse._();

  factory FinalizeTransferResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FinalizeTransferResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FinalizeTransferResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<Transfer>(1, _omitFieldNames ? '' : 'transfer',
        subBuilder: Transfer.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeTransferResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FinalizeTransferResponse copyWith(
          void Function(FinalizeTransferResponse) updates) =>
      super.copyWith((message) => updates(message as FinalizeTransferResponse))
          as FinalizeTransferResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FinalizeTransferResponse create() => FinalizeTransferResponse._();
  @$core.override
  FinalizeTransferResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FinalizeTransferResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FinalizeTransferResponse>(create);
  static FinalizeTransferResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Transfer get transfer => $_getN(0);
  @$pb.TagNumber(1)
  set transfer(Transfer value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransfer() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransfer() => $_clearField(1);
  @$pb.TagNumber(1)
  Transfer ensureTransfer() => $_ensure(0);
}

/// Per-receiver summary within a Transfer response.
class TransferReceiver extends $pb.GeneratedMessage {
  factory TransferReceiver({
    $core.List<$core.int>? identityPublicKey,
    $fixnum.Int64? amountSats,
  }) {
    final result = create();
    if (identityPublicKey != null) result.identityPublicKey = identityPublicKey;
    if (amountSats != null) result.amountSats = amountSats;
    return result;
  }

  TransferReceiver._();

  factory TransferReceiver.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransferReceiver.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransferReceiver',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'identityPublicKey', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'amountSats', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferReceiver clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferReceiver copyWith(void Function(TransferReceiver) updates) =>
      super.copyWith((message) => updates(message as TransferReceiver))
          as TransferReceiver;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferReceiver create() => TransferReceiver._();
  @$core.override
  TransferReceiver createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransferReceiver getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransferReceiver>(create);
  static TransferReceiver? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get identityPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set identityPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentityPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentityPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get amountSats => $_getI64(1);
  @$pb.TagNumber(2)
  set amountSats($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmountSats() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmountSats() => $_clearField(2);
}

class Transfer extends $pb.GeneratedMessage {
  factory Transfer({
    $core.String? id,
    $core.List<$core.int>? senderIdentityPublicKey,
    $core.List<$core.int>? receiverIdentityPublicKey,
    TransferStatus? status,
    $fixnum.Int64? totalValue,
    $3.Timestamp? expiryTime,
    $core.Iterable<TransferLeaf>? leaves,
    $3.Timestamp? createdTime,
    $3.Timestamp? updatedTime,
    TransferType? type,
    $core.String? sparkInvoice,
    Network? network,
    $core.Iterable<TransferReceiver>? receivers,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (senderIdentityPublicKey != null)
      result.senderIdentityPublicKey = senderIdentityPublicKey;
    if (receiverIdentityPublicKey != null)
      result.receiverIdentityPublicKey = receiverIdentityPublicKey;
    if (status != null) result.status = status;
    if (totalValue != null) result.totalValue = totalValue;
    if (expiryTime != null) result.expiryTime = expiryTime;
    if (leaves != null) result.leaves.addAll(leaves);
    if (createdTime != null) result.createdTime = createdTime;
    if (updatedTime != null) result.updatedTime = updatedTime;
    if (type != null) result.type = type;
    if (sparkInvoice != null) result.sparkInvoice = sparkInvoice;
    if (network != null) result.network = network;
    if (receivers != null) result.receivers.addAll(receivers);
    return result;
  }

  Transfer._();

  factory Transfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transfer',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'senderIdentityPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3,
        _omitFieldNames ? '' : 'receiverIdentityPublicKey', $pb.PbFieldType.OY)
    ..aE<TransferStatus>(4, _omitFieldNames ? '' : 'status',
        enumValues: TransferStatus.values)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'totalValue', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$3.Timestamp>(6, _omitFieldNames ? '' : 'expiryTime',
        subBuilder: $3.Timestamp.create)
    ..pPM<TransferLeaf>(7, _omitFieldNames ? '' : 'leaves',
        subBuilder: TransferLeaf.create)
    ..aOM<$3.Timestamp>(8, _omitFieldNames ? '' : 'createdTime',
        subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(9, _omitFieldNames ? '' : 'updatedTime',
        subBuilder: $3.Timestamp.create)
    ..aE<TransferType>(10, _omitFieldNames ? '' : 'type',
        enumValues: TransferType.values)
    ..aOS(11, _omitFieldNames ? '' : 'sparkInvoice')
    ..aE<Network>(12, _omitFieldNames ? '' : 'network',
        enumValues: Network.values)
    ..pPM<TransferReceiver>(13, _omitFieldNames ? '' : 'receivers',
        subBuilder: TransferReceiver.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transfer copyWith(void Function(Transfer) updates) =>
      super.copyWith((message) => updates(message as Transfer)) as Transfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transfer create() => Transfer._();
  @$core.override
  Transfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Transfer getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transfer>(create);
  static Transfer? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get senderIdentityPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set senderIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSenderIdentityPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearSenderIdentityPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get receiverIdentityPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set receiverIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReceiverIdentityPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearReceiverIdentityPublicKey() => $_clearField(3);

  @$pb.TagNumber(4)
  TransferStatus get status => $_getN(3);
  @$pb.TagNumber(4)
  set status(TransferStatus value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get totalValue => $_getI64(4);
  @$pb.TagNumber(5)
  set totalValue($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTotalValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalValue() => $_clearField(5);

  @$pb.TagNumber(6)
  $3.Timestamp get expiryTime => $_getN(5);
  @$pb.TagNumber(6)
  set expiryTime($3.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasExpiryTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearExpiryTime() => $_clearField(6);
  @$pb.TagNumber(6)
  $3.Timestamp ensureExpiryTime() => $_ensure(5);

  @$pb.TagNumber(7)
  $pb.PbList<TransferLeaf> get leaves => $_getList(6);

  @$pb.TagNumber(8)
  $3.Timestamp get createdTime => $_getN(7);
  @$pb.TagNumber(8)
  set createdTime($3.Timestamp value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasCreatedTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreatedTime() => $_clearField(8);
  @$pb.TagNumber(8)
  $3.Timestamp ensureCreatedTime() => $_ensure(7);

  @$pb.TagNumber(9)
  $3.Timestamp get updatedTime => $_getN(8);
  @$pb.TagNumber(9)
  set updatedTime($3.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasUpdatedTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearUpdatedTime() => $_clearField(9);
  @$pb.TagNumber(9)
  $3.Timestamp ensureUpdatedTime() => $_ensure(8);

  @$pb.TagNumber(10)
  TransferType get type => $_getN(9);
  @$pb.TagNumber(10)
  set type(TransferType value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasType() => $_has(9);
  @$pb.TagNumber(10)
  void clearType() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get sparkInvoice => $_getSZ(10);
  @$pb.TagNumber(11)
  set sparkInvoice($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasSparkInvoice() => $_has(10);
  @$pb.TagNumber(11)
  void clearSparkInvoice() => $_clearField(11);

  @$pb.TagNumber(12)
  Network get network => $_getN(11);
  @$pb.TagNumber(12)
  set network(Network value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasNetwork() => $_has(11);
  @$pb.TagNumber(12)
  void clearNetwork() => $_clearField(12);

  /// For V3 multi-receiver transfers. Empty for single-receiver (V2) transfers.
  @$pb.TagNumber(13)
  $pb.PbList<TransferReceiver> get receivers => $_getList(12);
}

class TransferLeaf extends $pb.GeneratedMessage {
  factory TransferLeaf({
    TreeNode? leaf,
    $core.List<$core.int>? secretCipher,
    $core.List<$core.int>? signature,
    $core.List<$core.int>? intermediateRefundTx,
    $core.List<$core.int>? intermediateDirectRefundTx,
    $core.List<$core.int>? intermediateDirectFromCpfpRefundTx,
    $core.List<$core.int>? pendingKeyTweakPublicKey,
  }) {
    final result = create();
    if (leaf != null) result.leaf = leaf;
    if (secretCipher != null) result.secretCipher = secretCipher;
    if (signature != null) result.signature = signature;
    if (intermediateRefundTx != null)
      result.intermediateRefundTx = intermediateRefundTx;
    if (intermediateDirectRefundTx != null)
      result.intermediateDirectRefundTx = intermediateDirectRefundTx;
    if (intermediateDirectFromCpfpRefundTx != null)
      result.intermediateDirectFromCpfpRefundTx =
          intermediateDirectFromCpfpRefundTx;
    if (pendingKeyTweakPublicKey != null)
      result.pendingKeyTweakPublicKey = pendingKeyTweakPublicKey;
    return result;
  }

  TransferLeaf._();

  factory TransferLeaf.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransferLeaf.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransferLeaf',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<TreeNode>(1, _omitFieldNames ? '' : 'leaf',
        subBuilder: TreeNode.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'secretCipher', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'intermediateRefundTx', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(5,
        _omitFieldNames ? '' : 'intermediateDirectRefundTx', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        6,
        _omitFieldNames ? '' : 'intermediateDirectFromCpfpRefundTx',
        $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(7,
        _omitFieldNames ? '' : 'pendingKeyTweakPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferLeaf clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferLeaf copyWith(void Function(TransferLeaf) updates) =>
      super.copyWith((message) => updates(message as TransferLeaf))
          as TransferLeaf;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferLeaf create() => TransferLeaf._();
  @$core.override
  TransferLeaf createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransferLeaf getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransferLeaf>(create);
  static TransferLeaf? _defaultInstance;

  @$pb.TagNumber(1)
  TreeNode get leaf => $_getN(0);
  @$pb.TagNumber(1)
  set leaf(TreeNode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasLeaf() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeaf() => $_clearField(1);
  @$pb.TagNumber(1)
  TreeNode ensureLeaf() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get secretCipher => $_getN(1);
  @$pb.TagNumber(2)
  set secretCipher($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSecretCipher() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecretCipher() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get signature => $_getN(2);
  @$pb.TagNumber(3)
  set signature($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearSignature() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get intermediateRefundTx => $_getN(3);
  @$pb.TagNumber(4)
  set intermediateRefundTx($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIntermediateRefundTx() => $_has(3);
  @$pb.TagNumber(4)
  void clearIntermediateRefundTx() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get intermediateDirectRefundTx => $_getN(4);
  @$pb.TagNumber(5)
  set intermediateDirectRefundTx($core.List<$core.int> value) =>
      $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIntermediateDirectRefundTx() => $_has(4);
  @$pb.TagNumber(5)
  void clearIntermediateDirectRefundTx() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get intermediateDirectFromCpfpRefundTx => $_getN(5);
  @$pb.TagNumber(6)
  set intermediateDirectFromCpfpRefundTx($core.List<$core.int> value) =>
      $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIntermediateDirectFromCpfpRefundTx() => $_has(5);
  @$pb.TagNumber(6)
  void clearIntermediateDirectFromCpfpRefundTx() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get pendingKeyTweakPublicKey => $_getN(6);
  @$pb.TagNumber(7)
  set pendingKeyTweakPublicKey($core.List<$core.int> value) =>
      $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPendingKeyTweakPublicKey() => $_has(6);
  @$pb.TagNumber(7)
  void clearPendingKeyTweakPublicKey() => $_clearField(7);
}

enum TransferFilter_Participant {
  receiverIdentityPublicKey,
  senderIdentityPublicKey,
  senderOrReceiverIdentityPublicKey,
  notSet
}

enum TransferFilter_TimeFilter { createdAfter, createdBefore, notSet }

class TransferFilter extends $pb.GeneratedMessage {
  factory TransferFilter({
    $core.List<$core.int>? receiverIdentityPublicKey,
    $core.List<$core.int>? senderIdentityPublicKey,
    $core.Iterable<$core.String>? transferIds,
    Network? network,
    Order? order,
    $3.Timestamp? createdAfter,
    $3.Timestamp? createdBefore,
    $fixnum.Int64? limit,
    $fixnum.Int64? offset,
    $core.List<$core.int>? senderOrReceiverIdentityPublicKey,
    $core.Iterable<TransferType>? types,
    $core.Iterable<TransferStatus>? statuses,
  }) {
    final result = create();
    if (receiverIdentityPublicKey != null)
      result.receiverIdentityPublicKey = receiverIdentityPublicKey;
    if (senderIdentityPublicKey != null)
      result.senderIdentityPublicKey = senderIdentityPublicKey;
    if (transferIds != null) result.transferIds.addAll(transferIds);
    if (network != null) result.network = network;
    if (order != null) result.order = order;
    if (createdAfter != null) result.createdAfter = createdAfter;
    if (createdBefore != null) result.createdBefore = createdBefore;
    if (limit != null) result.limit = limit;
    if (offset != null) result.offset = offset;
    if (senderOrReceiverIdentityPublicKey != null)
      result.senderOrReceiverIdentityPublicKey =
          senderOrReceiverIdentityPublicKey;
    if (types != null) result.types.addAll(types);
    if (statuses != null) result.statuses.addAll(statuses);
    return result;
  }

  TransferFilter._();

  factory TransferFilter.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransferFilter.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, TransferFilter_Participant>
      _TransferFilter_ParticipantByTag = {
    1: TransferFilter_Participant.receiverIdentityPublicKey,
    2: TransferFilter_Participant.senderIdentityPublicKey,
    60: TransferFilter_Participant.senderOrReceiverIdentityPublicKey,
    0: TransferFilter_Participant.notSet
  };
  static const $core.Map<$core.int, TransferFilter_TimeFilter>
      _TransferFilter_TimeFilterByTag = {
    6: TransferFilter_TimeFilter.createdAfter,
    7: TransferFilter_TimeFilter.createdBefore,
    0: TransferFilter_TimeFilter.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransferFilter',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 60])
    ..oo(1, [6, 7])
    ..a<$core.List<$core.int>>(1,
        _omitFieldNames ? '' : 'receiverIdentityPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'senderIdentityPublicKey', $pb.PbFieldType.OY)
    ..pPS(3, _omitFieldNames ? '' : 'transferIds')
    ..aE<Network>(4, _omitFieldNames ? '' : 'network',
        enumValues: Network.values)
    ..aE<Order>(5, _omitFieldNames ? '' : 'order', enumValues: Order.values)
    ..aOM<$3.Timestamp>(6, _omitFieldNames ? '' : 'createdAfter',
        subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(7, _omitFieldNames ? '' : 'createdBefore',
        subBuilder: $3.Timestamp.create)
    ..aInt64(40, _omitFieldNames ? '' : 'limit')
    ..aInt64(50, _omitFieldNames ? '' : 'offset')
    ..a<$core.List<$core.int>>(
        60,
        _omitFieldNames ? '' : 'senderOrReceiverIdentityPublicKey',
        $pb.PbFieldType.OY)
    ..pc<TransferType>(70, _omitFieldNames ? '' : 'types', $pb.PbFieldType.KE,
        valueOf: TransferType.valueOf,
        enumValues: TransferType.values,
        defaultEnumValue: TransferType.PREIMAGE_SWAP)
    ..pc<TransferStatus>(
        80, _omitFieldNames ? '' : 'statuses', $pb.PbFieldType.KE,
        valueOf: TransferStatus.valueOf,
        enumValues: TransferStatus.values,
        defaultEnumValue: TransferStatus.TRANSFER_STATUS_SENDER_INITIATED)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferFilter clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferFilter copyWith(void Function(TransferFilter) updates) =>
      super.copyWith((message) => updates(message as TransferFilter))
          as TransferFilter;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferFilter create() => TransferFilter._();
  @$core.override
  TransferFilter createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransferFilter getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransferFilter>(create);
  static TransferFilter? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(60)
  TransferFilter_Participant whichParticipant() =>
      _TransferFilter_ParticipantByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(60)
  void clearParticipant() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  TransferFilter_TimeFilter whichTimeFilter() =>
      _TransferFilter_TimeFilterByTag[$_whichOneof(1)]!;
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  void clearTimeFilter() => $_clearField($_whichOneof(1));

  @$pb.TagNumber(1)
  $core.List<$core.int> get receiverIdentityPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set receiverIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReceiverIdentityPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearReceiverIdentityPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get senderIdentityPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set senderIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSenderIdentityPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearSenderIdentityPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get transferIds => $_getList(2);

  @$pb.TagNumber(4)
  Network get network => $_getN(3);
  @$pb.TagNumber(4)
  set network(Network value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasNetwork() => $_has(3);
  @$pb.TagNumber(4)
  void clearNetwork() => $_clearField(4);

  @$pb.TagNumber(5)
  Order get order => $_getN(4);
  @$pb.TagNumber(5)
  set order(Order value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasOrder() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrder() => $_clearField(5);

  /// Filter transfers created strictly after this timestamp (exclusive)
  @$pb.TagNumber(6)
  $3.Timestamp get createdAfter => $_getN(5);
  @$pb.TagNumber(6)
  set createdAfter($3.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasCreatedAfter() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAfter() => $_clearField(6);
  @$pb.TagNumber(6)
  $3.Timestamp ensureCreatedAfter() => $_ensure(5);

  /// Filter transfers created strictly before this timestamp (exclusive)
  @$pb.TagNumber(7)
  $3.Timestamp get createdBefore => $_getN(6);
  @$pb.TagNumber(7)
  set createdBefore($3.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasCreatedBefore() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedBefore() => $_clearField(7);
  @$pb.TagNumber(7)
  $3.Timestamp ensureCreatedBefore() => $_ensure(6);

  @$pb.TagNumber(40)
  $fixnum.Int64 get limit => $_getI64(7);
  @$pb.TagNumber(40)
  set limit($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(40)
  $core.bool hasLimit() => $_has(7);
  @$pb.TagNumber(40)
  void clearLimit() => $_clearField(40);

  @$pb.TagNumber(50)
  $fixnum.Int64 get offset => $_getI64(8);
  @$pb.TagNumber(50)
  set offset($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(50)
  $core.bool hasOffset() => $_has(8);
  @$pb.TagNumber(50)
  void clearOffset() => $_clearField(50);

  /// This will include transfers where this public key is the sender or receiver.
  @$pb.TagNumber(60)
  $core.List<$core.int> get senderOrReceiverIdentityPublicKey => $_getN(9);
  @$pb.TagNumber(60)
  set senderOrReceiverIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(9, value);
  @$pb.TagNumber(60)
  $core.bool hasSenderOrReceiverIdentityPublicKey() => $_has(9);
  @$pb.TagNumber(60)
  void clearSenderOrReceiverIdentityPublicKey() => $_clearField(60);

  @$pb.TagNumber(70)
  $pb.PbList<TransferType> get types => $_getList(10);

  @$pb.TagNumber(80)
  $pb.PbList<TransferStatus> get statuses => $_getList(11);
}

class QueryTransfersResponse extends $pb.GeneratedMessage {
  factory QueryTransfersResponse({
    $core.Iterable<Transfer>? transfers,
    $fixnum.Int64? offset,
  }) {
    final result = create();
    if (transfers != null) result.transfers.addAll(transfers);
    if (offset != null) result.offset = offset;
    return result;
  }

  QueryTransfersResponse._();

  factory QueryTransfersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryTransfersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryTransfersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..pPM<Transfer>(1, _omitFieldNames ? '' : 'transfers',
        subBuilder: Transfer.create)
    ..aInt64(2, _omitFieldNames ? '' : 'offset')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryTransfersResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryTransfersResponse copyWith(
          void Function(QueryTransfersResponse) updates) =>
      super.copyWith((message) => updates(message as QueryTransfersResponse))
          as QueryTransfersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryTransfersResponse create() => QueryTransfersResponse._();
  @$core.override
  QueryTransfersResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryTransfersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryTransfersResponse>(create);
  static QueryTransfersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Transfer> get transfers => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get offset => $_getI64(1);
  @$pb.TagNumber(2)
  set offset($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => $_clearField(2);
}

class ClaimLeafKeyTweak extends $pb.GeneratedMessage {
  factory ClaimLeafKeyTweak({
    $core.String? leafId,
    SecretShare? secretShareTweak,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        pubkeySharesTweak,
  }) {
    final result = create();
    if (leafId != null) result.leafId = leafId;
    if (secretShareTweak != null) result.secretShareTweak = secretShareTweak;
    if (pubkeySharesTweak != null)
      result.pubkeySharesTweak.addEntries(pubkeySharesTweak);
    return result;
  }

  ClaimLeafKeyTweak._();

  factory ClaimLeafKeyTweak.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClaimLeafKeyTweak.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClaimLeafKeyTweak',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'leafId')
    ..aOM<SecretShare>(2, _omitFieldNames ? '' : 'secretShareTweak',
        subBuilder: SecretShare.create)
    ..m<$core.String, $core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'pubkeySharesTweak',
        entryClassName: 'ClaimLeafKeyTweak.PubkeySharesTweakEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimLeafKeyTweak clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimLeafKeyTweak copyWith(void Function(ClaimLeafKeyTweak) updates) =>
      super.copyWith((message) => updates(message as ClaimLeafKeyTweak))
          as ClaimLeafKeyTweak;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClaimLeafKeyTweak create() => ClaimLeafKeyTweak._();
  @$core.override
  ClaimLeafKeyTweak createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClaimLeafKeyTweak getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClaimLeafKeyTweak>(create);
  static ClaimLeafKeyTweak? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get leafId => $_getSZ(0);
  @$pb.TagNumber(1)
  set leafId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLeafId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeafId() => $_clearField(1);

  @$pb.TagNumber(2)
  SecretShare get secretShareTweak => $_getN(1);
  @$pb.TagNumber(2)
  set secretShareTweak(SecretShare value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSecretShareTweak() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecretShareTweak() => $_clearField(2);
  @$pb.TagNumber(2)
  SecretShare ensureSecretShareTweak() => $_ensure(1);

  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.List<$core.int>> get pubkeySharesTweak =>
      $_getMap(2);
}

class ClaimLeafKeyTweaks extends $pb.GeneratedMessage {
  factory ClaimLeafKeyTweaks({
    $core.Iterable<ClaimLeafKeyTweak>? leavesToReceive,
  }) {
    final result = create();
    if (leavesToReceive != null) result.leavesToReceive.addAll(leavesToReceive);
    return result;
  }

  ClaimLeafKeyTweaks._();

  factory ClaimLeafKeyTweaks.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClaimLeafKeyTweaks.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClaimLeafKeyTweaks',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..pPM<ClaimLeafKeyTweak>(1, _omitFieldNames ? '' : 'leavesToReceive',
        subBuilder: ClaimLeafKeyTweak.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimLeafKeyTweaks clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimLeafKeyTweaks copyWith(void Function(ClaimLeafKeyTweaks) updates) =>
      super.copyWith((message) => updates(message as ClaimLeafKeyTweaks))
          as ClaimLeafKeyTweaks;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClaimLeafKeyTweaks create() => ClaimLeafKeyTweaks._();
  @$core.override
  ClaimLeafKeyTweaks createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClaimLeafKeyTweaks getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClaimLeafKeyTweaks>(create);
  static ClaimLeafKeyTweaks? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ClaimLeafKeyTweak> get leavesToReceive => $_getList(0);
}

/// *
///  ClaimPackage is a package of leaves to claim and key tweaks to apply.
///  This is in the improved claim transfer flow where the receiver can claim the transfer in one call
///  to the coordinator SO, similar to how TransferPackage works for the sender.
class ClaimPackage extends $pb.GeneratedMessage {
  factory ClaimPackage({
    $core.Iterable<UserSignedTxSigningJob>? leavesToClaim,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        keyTweakPackage,
    $core.List<$core.int>? userSignature,
    $core.Iterable<UserSignedTxSigningJob>? directLeavesToClaim,
    $core.Iterable<UserSignedTxSigningJob>? directFromCpfpLeavesToClaim,
    HashVariant? hashVariant,
  }) {
    final result = create();
    if (leavesToClaim != null) result.leavesToClaim.addAll(leavesToClaim);
    if (keyTweakPackage != null)
      result.keyTweakPackage.addEntries(keyTweakPackage);
    if (userSignature != null) result.userSignature = userSignature;
    if (directLeavesToClaim != null)
      result.directLeavesToClaim.addAll(directLeavesToClaim);
    if (directFromCpfpLeavesToClaim != null)
      result.directFromCpfpLeavesToClaim.addAll(directFromCpfpLeavesToClaim);
    if (hashVariant != null) result.hashVariant = hashVariant;
    return result;
  }

  ClaimPackage._();

  factory ClaimPackage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClaimPackage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClaimPackage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..pPM<UserSignedTxSigningJob>(1, _omitFieldNames ? '' : 'leavesToClaim',
        subBuilder: UserSignedTxSigningJob.create)
    ..m<$core.String, $core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'keyTweakPackage',
        entryClassName: 'ClaimPackage.KeyTweakPackageEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark'))
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'userSignature', $pb.PbFieldType.OY)
    ..pPM<UserSignedTxSigningJob>(
        4, _omitFieldNames ? '' : 'directLeavesToClaim',
        subBuilder: UserSignedTxSigningJob.create)
    ..pPM<UserSignedTxSigningJob>(
        5, _omitFieldNames ? '' : 'directFromCpfpLeavesToClaim',
        subBuilder: UserSignedTxSigningJob.create)
    ..aE<HashVariant>(6, _omitFieldNames ? '' : 'hashVariant',
        enumValues: HashVariant.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimPackage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimPackage copyWith(void Function(ClaimPackage) updates) =>
      super.copyWith((message) => updates(message as ClaimPackage))
          as ClaimPackage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClaimPackage create() => ClaimPackage._();
  @$core.override
  ClaimPackage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClaimPackage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClaimPackage>(create);
  static ClaimPackage? _defaultInstance;

  /// The leaves to claim, with user signed cpfp refunds and signing package.
  @$pb.TagNumber(1)
  $pb.PbList<UserSignedTxSigningJob> get leavesToClaim => $_getList(0);

  /// The map of SO identifier to serialized ClaimLeafKeyTweaks.
  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $core.List<$core.int>> get keyTweakPackage =>
      $_getMap(1);

  /// The signature of user to prove that the key_tweak_package is not tampered.
  @$pb.TagNumber(3)
  $core.List<$core.int> get userSignature => $_getN(2);
  @$pb.TagNumber(3)
  set userSignature($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserSignature() => $_clearField(3);

  /// The leaves to claim, with user signed direct refunds and signing package.
  @$pb.TagNumber(4)
  $pb.PbList<UserSignedTxSigningJob> get directLeavesToClaim => $_getList(3);

  /// The leaves to claim, with user signed direct from cpfp refunds and signing package.
  @$pb.TagNumber(5)
  $pb.PbList<UserSignedTxSigningJob> get directFromCpfpLeavesToClaim =>
      $_getList(4);

  /// The hash variant to use for computing the claim package signing payload.
  @$pb.TagNumber(6)
  HashVariant get hashVariant => $_getN(5);
  @$pb.TagNumber(6)
  set hashVariant(HashVariant value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasHashVariant() => $_has(5);
  @$pb.TagNumber(6)
  void clearHashVariant() => $_clearField(6);
}

class ClaimTransferRequest extends $pb.GeneratedMessage {
  factory ClaimTransferRequest({
    $core.String? transferId,
    $core.List<$core.int>? ownerIdentityPublicKey,
    ClaimPackage? claimPackage,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (ownerIdentityPublicKey != null)
      result.ownerIdentityPublicKey = ownerIdentityPublicKey;
    if (claimPackage != null) result.claimPackage = claimPackage;
    return result;
  }

  ClaimTransferRequest._();

  factory ClaimTransferRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClaimTransferRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClaimTransferRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'ownerIdentityPublicKey', $pb.PbFieldType.OY)
    ..aOM<ClaimPackage>(3, _omitFieldNames ? '' : 'claimPackage',
        subBuilder: ClaimPackage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimTransferRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimTransferRequest copyWith(void Function(ClaimTransferRequest) updates) =>
      super.copyWith((message) => updates(message as ClaimTransferRequest))
          as ClaimTransferRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClaimTransferRequest create() => ClaimTransferRequest._();
  @$core.override
  ClaimTransferRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClaimTransferRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClaimTransferRequest>(create);
  static ClaimTransferRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get ownerIdentityPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set ownerIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOwnerIdentityPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerIdentityPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  ClaimPackage get claimPackage => $_getN(2);
  @$pb.TagNumber(3)
  set claimPackage(ClaimPackage value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasClaimPackage() => $_has(2);
  @$pb.TagNumber(3)
  void clearClaimPackage() => $_clearField(3);
  @$pb.TagNumber(3)
  ClaimPackage ensureClaimPackage() => $_ensure(2);
}

class ClaimTransferResponse extends $pb.GeneratedMessage {
  factory ClaimTransferResponse({
    Transfer? transfer,
  }) {
    final result = create();
    if (transfer != null) result.transfer = transfer;
    return result;
  }

  ClaimTransferResponse._();

  factory ClaimTransferResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClaimTransferResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClaimTransferResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<Transfer>(1, _omitFieldNames ? '' : 'transfer',
        subBuilder: Transfer.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimTransferResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimTransferResponse copyWith(
          void Function(ClaimTransferResponse) updates) =>
      super.copyWith((message) => updates(message as ClaimTransferResponse))
          as ClaimTransferResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClaimTransferResponse create() => ClaimTransferResponse._();
  @$core.override
  ClaimTransferResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClaimTransferResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClaimTransferResponse>(create);
  static ClaimTransferResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Transfer get transfer => $_getN(0);
  @$pb.TagNumber(1)
  set transfer(Transfer value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransfer() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransfer() => $_clearField(1);
  @$pb.TagNumber(1)
  Transfer ensureTransfer() => $_ensure(0);
}

class ClaimTransferTweakKeysRequest extends $pb.GeneratedMessage {
  factory ClaimTransferTweakKeysRequest({
    $core.String? transferId,
    $core.List<$core.int>? ownerIdentityPublicKey,
    $core.Iterable<ClaimLeafKeyTweak>? leavesToReceive,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (ownerIdentityPublicKey != null)
      result.ownerIdentityPublicKey = ownerIdentityPublicKey;
    if (leavesToReceive != null) result.leavesToReceive.addAll(leavesToReceive);
    return result;
  }

  ClaimTransferTweakKeysRequest._();

  factory ClaimTransferTweakKeysRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClaimTransferTweakKeysRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClaimTransferTweakKeysRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'ownerIdentityPublicKey', $pb.PbFieldType.OY)
    ..pPM<ClaimLeafKeyTweak>(3, _omitFieldNames ? '' : 'leavesToReceive',
        subBuilder: ClaimLeafKeyTweak.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimTransferTweakKeysRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimTransferTweakKeysRequest copyWith(
          void Function(ClaimTransferTweakKeysRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ClaimTransferTweakKeysRequest))
          as ClaimTransferTweakKeysRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClaimTransferTweakKeysRequest create() =>
      ClaimTransferTweakKeysRequest._();
  @$core.override
  ClaimTransferTweakKeysRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClaimTransferTweakKeysRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClaimTransferTweakKeysRequest>(create);
  static ClaimTransferTweakKeysRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get ownerIdentityPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set ownerIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOwnerIdentityPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerIdentityPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<ClaimLeafKeyTweak> get leavesToReceive => $_getList(2);
}

class ClaimTransferSignRefundsRequest extends $pb.GeneratedMessage {
  factory ClaimTransferSignRefundsRequest({
    $core.String? transferId,
    $core.List<$core.int>? ownerIdentityPublicKey,
    $core.Iterable<LeafRefundTxSigningJob>? signingJobs,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (ownerIdentityPublicKey != null)
      result.ownerIdentityPublicKey = ownerIdentityPublicKey;
    if (signingJobs != null) result.signingJobs.addAll(signingJobs);
    return result;
  }

  ClaimTransferSignRefundsRequest._();

  factory ClaimTransferSignRefundsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClaimTransferSignRefundsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClaimTransferSignRefundsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'ownerIdentityPublicKey', $pb.PbFieldType.OY)
    ..pPM<LeafRefundTxSigningJob>(3, _omitFieldNames ? '' : 'signingJobs',
        subBuilder: LeafRefundTxSigningJob.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimTransferSignRefundsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimTransferSignRefundsRequest copyWith(
          void Function(ClaimTransferSignRefundsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ClaimTransferSignRefundsRequest))
          as ClaimTransferSignRefundsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClaimTransferSignRefundsRequest create() =>
      ClaimTransferSignRefundsRequest._();
  @$core.override
  ClaimTransferSignRefundsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClaimTransferSignRefundsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClaimTransferSignRefundsRequest>(
          create);
  static ClaimTransferSignRefundsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get ownerIdentityPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set ownerIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOwnerIdentityPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerIdentityPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<LeafRefundTxSigningJob> get signingJobs => $_getList(2);
}

class ClaimTransferSignRefundsResponse extends $pb.GeneratedMessage {
  factory ClaimTransferSignRefundsResponse({
    $core.Iterable<LeafRefundTxSigningResult>? signingResults,
  }) {
    final result = create();
    if (signingResults != null) result.signingResults.addAll(signingResults);
    return result;
  }

  ClaimTransferSignRefundsResponse._();

  factory ClaimTransferSignRefundsResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClaimTransferSignRefundsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClaimTransferSignRefundsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..pPM<LeafRefundTxSigningResult>(1, _omitFieldNames ? '' : 'signingResults',
        subBuilder: LeafRefundTxSigningResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimTransferSignRefundsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimTransferSignRefundsResponse copyWith(
          void Function(ClaimTransferSignRefundsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ClaimTransferSignRefundsResponse))
          as ClaimTransferSignRefundsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClaimTransferSignRefundsResponse create() =>
      ClaimTransferSignRefundsResponse._();
  @$core.override
  ClaimTransferSignRefundsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClaimTransferSignRefundsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClaimTransferSignRefundsResponse>(
          create);
  static ClaimTransferSignRefundsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<LeafRefundTxSigningResult> get signingResults => $_getList(0);
}

class StorePreimageShareRequest extends $pb.GeneratedMessage {
  factory StorePreimageShareRequest({
    $core.List<$core.int>? paymentHash,
    SecretShare? preimageShare,
    $core.int? threshold,
    $core.String? invoiceString,
    $core.List<$core.int>? userIdentityPublicKey,
  }) {
    final result = create();
    if (paymentHash != null) result.paymentHash = paymentHash;
    if (preimageShare != null) result.preimageShare = preimageShare;
    if (threshold != null) result.threshold = threshold;
    if (invoiceString != null) result.invoiceString = invoiceString;
    if (userIdentityPublicKey != null)
      result.userIdentityPublicKey = userIdentityPublicKey;
    return result;
  }

  StorePreimageShareRequest._();

  factory StorePreimageShareRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StorePreimageShareRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StorePreimageShareRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'paymentHash', $pb.PbFieldType.OY)
    ..aOM<SecretShare>(2, _omitFieldNames ? '' : 'preimageShare',
        subBuilder: SecretShare.create)
    ..aI(3, _omitFieldNames ? '' : 'threshold', fieldType: $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'invoiceString')
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'userIdentityPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StorePreimageShareRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StorePreimageShareRequest copyWith(
          void Function(StorePreimageShareRequest) updates) =>
      super.copyWith((message) => updates(message as StorePreimageShareRequest))
          as StorePreimageShareRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StorePreimageShareRequest create() => StorePreimageShareRequest._();
  @$core.override
  StorePreimageShareRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StorePreimageShareRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StorePreimageShareRequest>(create);
  static StorePreimageShareRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get paymentHash => $_getN(0);
  @$pb.TagNumber(1)
  set paymentHash($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPaymentHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaymentHash() => $_clearField(1);

  @$pb.TagNumber(2)
  SecretShare get preimageShare => $_getN(1);
  @$pb.TagNumber(2)
  set preimageShare(SecretShare value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPreimageShare() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreimageShare() => $_clearField(2);
  @$pb.TagNumber(2)
  SecretShare ensurePreimageShare() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get threshold => $_getIZ(2);
  @$pb.TagNumber(3)
  set threshold($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasThreshold() => $_has(2);
  @$pb.TagNumber(3)
  void clearThreshold() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get invoiceString => $_getSZ(3);
  @$pb.TagNumber(4)
  set invoiceString($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasInvoiceString() => $_has(3);
  @$pb.TagNumber(4)
  void clearInvoiceString() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get userIdentityPublicKey => $_getN(4);
  @$pb.TagNumber(5)
  set userIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUserIdentityPublicKey() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserIdentityPublicKey() => $_clearField(5);
}

class StorePreimageShareV2Request extends $pb.GeneratedMessage {
  factory StorePreimageShareV2Request({
    $core.List<$core.int>? paymentHash,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        encryptedPreimageShares,
    $core.int? threshold,
    $core.String? invoiceString,
    $core.List<$core.int>? userIdentityPublicKey,
  }) {
    final result = create();
    if (paymentHash != null) result.paymentHash = paymentHash;
    if (encryptedPreimageShares != null)
      result.encryptedPreimageShares.addEntries(encryptedPreimageShares);
    if (threshold != null) result.threshold = threshold;
    if (invoiceString != null) result.invoiceString = invoiceString;
    if (userIdentityPublicKey != null)
      result.userIdentityPublicKey = userIdentityPublicKey;
    return result;
  }

  StorePreimageShareV2Request._();

  factory StorePreimageShareV2Request.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StorePreimageShareV2Request.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StorePreimageShareV2Request',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'paymentHash', $pb.PbFieldType.OY)
    ..m<$core.String, $core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'encryptedPreimageShares',
        entryClassName:
            'StorePreimageShareV2Request.EncryptedPreimageSharesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('spark'))
    ..aI(3, _omitFieldNames ? '' : 'threshold', fieldType: $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'invoiceString')
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'userIdentityPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StorePreimageShareV2Request clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StorePreimageShareV2Request copyWith(
          void Function(StorePreimageShareV2Request) updates) =>
      super.copyWith(
              (message) => updates(message as StorePreimageShareV2Request))
          as StorePreimageShareV2Request;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StorePreimageShareV2Request create() =>
      StorePreimageShareV2Request._();
  @$core.override
  StorePreimageShareV2Request createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StorePreimageShareV2Request getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StorePreimageShareV2Request>(create);
  static StorePreimageShareV2Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get paymentHash => $_getN(0);
  @$pb.TagNumber(1)
  set paymentHash($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPaymentHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaymentHash() => $_clearField(1);

  /// SO identifier -> ECIES-encrypted SecretShare protobuf
  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $core.List<$core.int>> get encryptedPreimageShares =>
      $_getMap(1);

  @$pb.TagNumber(3)
  $core.int get threshold => $_getIZ(2);
  @$pb.TagNumber(3)
  set threshold($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasThreshold() => $_has(2);
  @$pb.TagNumber(3)
  void clearThreshold() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get invoiceString => $_getSZ(3);
  @$pb.TagNumber(4)
  set invoiceString($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasInvoiceString() => $_has(3);
  @$pb.TagNumber(4)
  void clearInvoiceString() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get userIdentityPublicKey => $_getN(4);
  @$pb.TagNumber(5)
  set userIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUserIdentityPublicKey() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserIdentityPublicKey() => $_clearField(5);
}

class RequestedSigningCommitments extends $pb.GeneratedMessage {
  factory RequestedSigningCommitments({
    $core.Iterable<$core.MapEntry<$core.String, $2.SigningCommitment>>?
        signingNonceCommitments,
  }) {
    final result = create();
    if (signingNonceCommitments != null)
      result.signingNonceCommitments.addEntries(signingNonceCommitments);
    return result;
  }

  RequestedSigningCommitments._();

  factory RequestedSigningCommitments.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RequestedSigningCommitments.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RequestedSigningCommitments',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..m<$core.String, $2.SigningCommitment>(
        1, _omitFieldNames ? '' : 'signingNonceCommitments',
        entryClassName:
            'RequestedSigningCommitments.SigningNonceCommitmentsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $2.SigningCommitment.create,
        valueDefaultOrMaker: $2.SigningCommitment.getDefault,
        packageName: const $pb.PackageName('spark'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestedSigningCommitments clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestedSigningCommitments copyWith(
          void Function(RequestedSigningCommitments) updates) =>
      super.copyWith(
              (message) => updates(message as RequestedSigningCommitments))
          as RequestedSigningCommitments;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestedSigningCommitments create() =>
      RequestedSigningCommitments._();
  @$core.override
  RequestedSigningCommitments createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RequestedSigningCommitments getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RequestedSigningCommitments>(create);
  static RequestedSigningCommitments? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $2.SigningCommitment> get signingNonceCommitments =>
      $_getMap(0);
}

class GetSigningCommitmentsRequest extends $pb.GeneratedMessage {
  factory GetSigningCommitmentsRequest({
    $core.Iterable<$core.String>? nodeIds,
    $core.int? count,
    $core.int? nodeIdCount,
  }) {
    final result = create();
    if (nodeIds != null) result.nodeIds.addAll(nodeIds);
    if (count != null) result.count = count;
    if (nodeIdCount != null) result.nodeIdCount = nodeIdCount;
    return result;
  }

  GetSigningCommitmentsRequest._();

  factory GetSigningCommitmentsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSigningCommitmentsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSigningCommitmentsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'nodeIds')
    ..aI(2, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'nodeIdCount',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSigningCommitmentsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSigningCommitmentsRequest copyWith(
          void Function(GetSigningCommitmentsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetSigningCommitmentsRequest))
          as GetSigningCommitmentsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSigningCommitmentsRequest create() =>
      GetSigningCommitmentsRequest._();
  @$core.override
  GetSigningCommitmentsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSigningCommitmentsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSigningCommitmentsRequest>(create);
  static GetSigningCommitmentsRequest? _defaultInstance;

  /// The node IDs for which to get signing commitments.
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get nodeIds => $_getList(0);

  /// The number of signing commitments to get per node ID.
  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => $_clearField(2);

  /// Alternative to passing the node IDs: the number of node IDs for which to get signing commitments.
  /// Either `node_ids` or `node_id_count` should be passed, but not both.
  @$pb.TagNumber(3)
  $core.int get nodeIdCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set nodeIdCount($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNodeIdCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearNodeIdCount() => $_clearField(3);
}

class GetSigningCommitmentsResponse extends $pb.GeneratedMessage {
  factory GetSigningCommitmentsResponse({
    $core.Iterable<RequestedSigningCommitments>? signingCommitments,
  }) {
    final result = create();
    if (signingCommitments != null)
      result.signingCommitments.addAll(signingCommitments);
    return result;
  }

  GetSigningCommitmentsResponse._();

  factory GetSigningCommitmentsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSigningCommitmentsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSigningCommitmentsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..pPM<RequestedSigningCommitments>(
        1, _omitFieldNames ? '' : 'signingCommitments',
        subBuilder: RequestedSigningCommitments.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSigningCommitmentsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSigningCommitmentsResponse copyWith(
          void Function(GetSigningCommitmentsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetSigningCommitmentsResponse))
          as GetSigningCommitmentsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSigningCommitmentsResponse create() =>
      GetSigningCommitmentsResponse._();
  @$core.override
  GetSigningCommitmentsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSigningCommitmentsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSigningCommitmentsResponse>(create);
  static GetSigningCommitmentsResponse? _defaultInstance;

  /// A list of signing commitments for each requested node ID. The signing commitments will be
  /// ordered in the same order as the requested node IDs, repeated for the number of commitments
  /// requested. For example, if node_ids = [A, B] and count = 2, the response will contain:
  ///
  /// [commitment_A1, commitment_B1, commitment_A2, commitment_B2]
  @$pb.TagNumber(1)
  $pb.PbList<RequestedSigningCommitments> get signingCommitments =>
      $_getList(0);
}

class SigningCommitments extends $pb.GeneratedMessage {
  factory SigningCommitments({
    $core.Iterable<$core.MapEntry<$core.String, $2.SigningCommitment>>?
        signingCommitments,
  }) {
    final result = create();
    if (signingCommitments != null)
      result.signingCommitments.addEntries(signingCommitments);
    return result;
  }

  SigningCommitments._();

  factory SigningCommitments.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningCommitments.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningCommitments',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..m<$core.String, $2.SigningCommitment>(
        1, _omitFieldNames ? '' : 'signingCommitments',
        entryClassName: 'SigningCommitments.SigningCommitmentsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $2.SigningCommitment.create,
        valueDefaultOrMaker: $2.SigningCommitment.getDefault,
        packageName: const $pb.PackageName('spark'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningCommitments clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningCommitments copyWith(void Function(SigningCommitments) updates) =>
      super.copyWith((message) => updates(message as SigningCommitments))
          as SigningCommitments;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SigningCommitments create() => SigningCommitments._();
  @$core.override
  SigningCommitments createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SigningCommitments getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SigningCommitments>(create);
  static SigningCommitments? _defaultInstance;

  /// A map of signing operator ID (i.e. 000...01) to the signing commitment provided by that
  /// operator.
  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $2.SigningCommitment> get signingCommitments =>
      $_getMap(0);
}

class UserSignedRefund extends $pb.GeneratedMessage {
  factory UserSignedRefund({
    $core.String? nodeId,
    $core.List<$core.int>? refundTx,
    $core.List<$core.int>? userSignature,
    SigningCommitments? signingCommitments,
    $2.SigningCommitment? userSignatureCommitment,
    Network? network,
  }) {
    final result = create();
    if (nodeId != null) result.nodeId = nodeId;
    if (refundTx != null) result.refundTx = refundTx;
    if (userSignature != null) result.userSignature = userSignature;
    if (signingCommitments != null)
      result.signingCommitments = signingCommitments;
    if (userSignatureCommitment != null)
      result.userSignatureCommitment = userSignatureCommitment;
    if (network != null) result.network = network;
    return result;
  }

  UserSignedRefund._();

  factory UserSignedRefund.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserSignedRefund.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserSignedRefund',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nodeId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'refundTx', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'userSignature', $pb.PbFieldType.OY)
    ..aOM<SigningCommitments>(4, _omitFieldNames ? '' : 'signingCommitments',
        subBuilder: SigningCommitments.create)
    ..aOM<$2.SigningCommitment>(
        5, _omitFieldNames ? '' : 'userSignatureCommitment',
        subBuilder: $2.SigningCommitment.create)
    ..aE<Network>(6, _omitFieldNames ? '' : 'network',
        enumValues: Network.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserSignedRefund clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserSignedRefund copyWith(void Function(UserSignedRefund) updates) =>
      super.copyWith((message) => updates(message as UserSignedRefund))
          as UserSignedRefund;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserSignedRefund create() => UserSignedRefund._();
  @$core.override
  UserSignedRefund createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserSignedRefund getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserSignedRefund>(create);
  static UserSignedRefund? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nodeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set nodeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNodeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNodeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get refundTx => $_getN(1);
  @$pb.TagNumber(2)
  set refundTx($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRefundTx() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefundTx() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get userSignature => $_getN(2);
  @$pb.TagNumber(3)
  set userSignature($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserSignature() => $_clearField(3);

  @$pb.TagNumber(4)
  SigningCommitments get signingCommitments => $_getN(3);
  @$pb.TagNumber(4)
  set signingCommitments(SigningCommitments value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasSigningCommitments() => $_has(3);
  @$pb.TagNumber(4)
  void clearSigningCommitments() => $_clearField(4);
  @$pb.TagNumber(4)
  SigningCommitments ensureSigningCommitments() => $_ensure(3);

  @$pb.TagNumber(5)
  $2.SigningCommitment get userSignatureCommitment => $_getN(4);
  @$pb.TagNumber(5)
  set userSignatureCommitment($2.SigningCommitment value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasUserSignatureCommitment() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserSignatureCommitment() => $_clearField(5);
  @$pb.TagNumber(5)
  $2.SigningCommitment ensureUserSignatureCommitment() => $_ensure(4);

  @$pb.TagNumber(6)
  Network get network => $_getN(5);
  @$pb.TagNumber(6)
  set network(Network value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasNetwork() => $_has(5);
  @$pb.TagNumber(6)
  void clearNetwork() => $_clearField(6);
}

class InvoiceAmountProof extends $pb.GeneratedMessage {
  factory InvoiceAmountProof({
    $core.String? bolt11Invoice,
  }) {
    final result = create();
    if (bolt11Invoice != null) result.bolt11Invoice = bolt11Invoice;
    return result;
  }

  InvoiceAmountProof._();

  factory InvoiceAmountProof.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InvoiceAmountProof.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InvoiceAmountProof',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'bolt11Invoice')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InvoiceAmountProof clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InvoiceAmountProof copyWith(void Function(InvoiceAmountProof) updates) =>
      super.copyWith((message) => updates(message as InvoiceAmountProof))
          as InvoiceAmountProof;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InvoiceAmountProof create() => InvoiceAmountProof._();
  @$core.override
  InvoiceAmountProof createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InvoiceAmountProof getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InvoiceAmountProof>(create);
  static InvoiceAmountProof? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bolt11Invoice => $_getSZ(0);
  @$pb.TagNumber(1)
  set bolt11Invoice($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBolt11Invoice() => $_has(0);
  @$pb.TagNumber(1)
  void clearBolt11Invoice() => $_clearField(1);
}

class InvoiceAmount extends $pb.GeneratedMessage {
  factory InvoiceAmount({
    $fixnum.Int64? valueSats,
    InvoiceAmountProof? invoiceAmountProof,
  }) {
    final result = create();
    if (valueSats != null) result.valueSats = valueSats;
    if (invoiceAmountProof != null)
      result.invoiceAmountProof = invoiceAmountProof;
    return result;
  }

  InvoiceAmount._();

  factory InvoiceAmount.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InvoiceAmount.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InvoiceAmount',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'valueSats', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<InvoiceAmountProof>(2, _omitFieldNames ? '' : 'invoiceAmountProof',
        subBuilder: InvoiceAmountProof.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InvoiceAmount clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InvoiceAmount copyWith(void Function(InvoiceAmount) updates) =>
      super.copyWith((message) => updates(message as InvoiceAmount))
          as InvoiceAmount;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InvoiceAmount create() => InvoiceAmount._();
  @$core.override
  InvoiceAmount createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InvoiceAmount getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InvoiceAmount>(create);
  static InvoiceAmount? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get valueSats => $_getI64(0);
  @$pb.TagNumber(1)
  set valueSats($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValueSats() => $_has(0);
  @$pb.TagNumber(1)
  void clearValueSats() => $_clearField(1);

  @$pb.TagNumber(2)
  InvoiceAmountProof get invoiceAmountProof => $_getN(1);
  @$pb.TagNumber(2)
  set invoiceAmountProof(InvoiceAmountProof value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasInvoiceAmountProof() => $_has(1);
  @$pb.TagNumber(2)
  void clearInvoiceAmountProof() => $_clearField(2);
  @$pb.TagNumber(2)
  InvoiceAmountProof ensureInvoiceAmountProof() => $_ensure(1);
}

class InitiatePreimageSwapRequest extends $pb.GeneratedMessage {
  factory InitiatePreimageSwapRequest({
    $core.List<$core.int>? paymentHash,
    InvoiceAmount? invoiceAmount,
    InitiatePreimageSwapRequest_Reason? reason,
    StartUserSignedTransferRequest? transfer,
    $core.List<$core.int>? receiverIdentityPublicKey,
    $fixnum.Int64? feeSats,
    StartTransferRequest? transferRequest,
  }) {
    final result = create();
    if (paymentHash != null) result.paymentHash = paymentHash;
    if (invoiceAmount != null) result.invoiceAmount = invoiceAmount;
    if (reason != null) result.reason = reason;
    if (transfer != null) result.transfer = transfer;
    if (receiverIdentityPublicKey != null)
      result.receiverIdentityPublicKey = receiverIdentityPublicKey;
    if (feeSats != null) result.feeSats = feeSats;
    if (transferRequest != null) result.transferRequest = transferRequest;
    return result;
  }

  InitiatePreimageSwapRequest._();

  factory InitiatePreimageSwapRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitiatePreimageSwapRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitiatePreimageSwapRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'paymentHash', $pb.PbFieldType.OY)
    ..aOM<InvoiceAmount>(2, _omitFieldNames ? '' : 'invoiceAmount',
        subBuilder: InvoiceAmount.create)
    ..aE<InitiatePreimageSwapRequest_Reason>(3, _omitFieldNames ? '' : 'reason',
        enumValues: InitiatePreimageSwapRequest_Reason.values)
    ..aOM<StartUserSignedTransferRequest>(4, _omitFieldNames ? '' : 'transfer',
        subBuilder: StartUserSignedTransferRequest.create)
    ..a<$core.List<$core.int>>(5,
        _omitFieldNames ? '' : 'receiverIdentityPublicKey', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'feeSats', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<StartTransferRequest>(7, _omitFieldNames ? '' : 'transferRequest',
        subBuilder: StartTransferRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiatePreimageSwapRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiatePreimageSwapRequest copyWith(
          void Function(InitiatePreimageSwapRequest) updates) =>
      super.copyWith(
              (message) => updates(message as InitiatePreimageSwapRequest))
          as InitiatePreimageSwapRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitiatePreimageSwapRequest create() =>
      InitiatePreimageSwapRequest._();
  @$core.override
  InitiatePreimageSwapRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InitiatePreimageSwapRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InitiatePreimageSwapRequest>(create);
  static InitiatePreimageSwapRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get paymentHash => $_getN(0);
  @$pb.TagNumber(1)
  set paymentHash($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPaymentHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaymentHash() => $_clearField(1);

  @$pb.TagNumber(2)
  InvoiceAmount get invoiceAmount => $_getN(1);
  @$pb.TagNumber(2)
  set invoiceAmount(InvoiceAmount value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasInvoiceAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearInvoiceAmount() => $_clearField(2);
  @$pb.TagNumber(2)
  InvoiceAmount ensureInvoiceAmount() => $_ensure(1);

  @$pb.TagNumber(3)
  InitiatePreimageSwapRequest_Reason get reason => $_getN(2);
  @$pb.TagNumber(3)
  set reason(InitiatePreimageSwapRequest_Reason value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearReason() => $_clearField(3);

  @$pb.TagNumber(4)
  StartUserSignedTransferRequest get transfer => $_getN(3);
  @$pb.TagNumber(4)
  set transfer(StartUserSignedTransferRequest value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasTransfer() => $_has(3);
  @$pb.TagNumber(4)
  void clearTransfer() => $_clearField(4);
  @$pb.TagNumber(4)
  StartUserSignedTransferRequest ensureTransfer() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.List<$core.int> get receiverIdentityPublicKey => $_getN(4);
  @$pb.TagNumber(5)
  set receiverIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReceiverIdentityPublicKey() => $_has(4);
  @$pb.TagNumber(5)
  void clearReceiverIdentityPublicKey() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get feeSats => $_getI64(5);
  @$pb.TagNumber(6)
  set feeSats($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasFeeSats() => $_has(5);
  @$pb.TagNumber(6)
  void clearFeeSats() => $_clearField(6);

  @$pb.TagNumber(7)
  StartTransferRequest get transferRequest => $_getN(6);
  @$pb.TagNumber(7)
  set transferRequest(StartTransferRequest value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasTransferRequest() => $_has(6);
  @$pb.TagNumber(7)
  void clearTransferRequest() => $_clearField(7);
  @$pb.TagNumber(7)
  StartTransferRequest ensureTransferRequest() => $_ensure(6);
}

class InitiatePreimageSwapResponse extends $pb.GeneratedMessage {
  factory InitiatePreimageSwapResponse({
    $core.List<$core.int>? preimage,
    Transfer? transfer,
  }) {
    final result = create();
    if (preimage != null) result.preimage = preimage;
    if (transfer != null) result.transfer = transfer;
    return result;
  }

  InitiatePreimageSwapResponse._();

  factory InitiatePreimageSwapResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitiatePreimageSwapResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitiatePreimageSwapResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'preimage', $pb.PbFieldType.OY)
    ..aOM<Transfer>(2, _omitFieldNames ? '' : 'transfer',
        subBuilder: Transfer.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiatePreimageSwapResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiatePreimageSwapResponse copyWith(
          void Function(InitiatePreimageSwapResponse) updates) =>
      super.copyWith(
              (message) => updates(message as InitiatePreimageSwapResponse))
          as InitiatePreimageSwapResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitiatePreimageSwapResponse create() =>
      InitiatePreimageSwapResponse._();
  @$core.override
  InitiatePreimageSwapResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InitiatePreimageSwapResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InitiatePreimageSwapResponse>(create);
  static InitiatePreimageSwapResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get preimage => $_getN(0);
  @$pb.TagNumber(1)
  set preimage($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPreimage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPreimage() => $_clearField(1);

  @$pb.TagNumber(2)
  Transfer get transfer => $_getN(1);
  @$pb.TagNumber(2)
  set transfer(Transfer value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTransfer() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransfer() => $_clearField(2);
  @$pb.TagNumber(2)
  Transfer ensureTransfer() => $_ensure(1);
}

class OutPoint extends $pb.GeneratedMessage {
  factory OutPoint({
    $core.List<$core.int>? txid,
    $core.int? vout,
  }) {
    final result = create();
    if (txid != null) result.txid = txid;
    if (vout != null) result.vout = vout;
    return result;
  }

  OutPoint._();

  factory OutPoint.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OutPoint.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OutPoint',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'txid', $pb.PbFieldType.OY)
    ..aI(2, _omitFieldNames ? '' : 'vout', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutPoint clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutPoint copyWith(void Function(OutPoint) updates) =>
      super.copyWith((message) => updates(message as OutPoint)) as OutPoint;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OutPoint create() => OutPoint._();
  @$core.override
  OutPoint createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OutPoint getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OutPoint>(create);
  static OutPoint? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get txid => $_getN(0);
  @$pb.TagNumber(1)
  set txid($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTxid() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get vout => $_getIZ(1);
  @$pb.TagNumber(2)
  set vout($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVout() => $_has(1);
  @$pb.TagNumber(2)
  void clearVout() => $_clearField(2);
}

class CooperativeExitRequest extends $pb.GeneratedMessage {
  factory CooperativeExitRequest({
    StartTransferRequest? transfer,
    $core.String? exitId,
    $core.List<$core.int>? exitTxid,
    $core.List<$core.int>? connectorTx,
  }) {
    final result = create();
    if (transfer != null) result.transfer = transfer;
    if (exitId != null) result.exitId = exitId;
    if (exitTxid != null) result.exitTxid = exitTxid;
    if (connectorTx != null) result.connectorTx = connectorTx;
    return result;
  }

  CooperativeExitRequest._();

  factory CooperativeExitRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CooperativeExitRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CooperativeExitRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<StartTransferRequest>(1, _omitFieldNames ? '' : 'transfer',
        subBuilder: StartTransferRequest.create)
    ..aOS(2, _omitFieldNames ? '' : 'exitId')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'exitTxid', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'connectorTx', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CooperativeExitRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CooperativeExitRequest copyWith(
          void Function(CooperativeExitRequest) updates) =>
      super.copyWith((message) => updates(message as CooperativeExitRequest))
          as CooperativeExitRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CooperativeExitRequest create() => CooperativeExitRequest._();
  @$core.override
  CooperativeExitRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CooperativeExitRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CooperativeExitRequest>(create);
  static CooperativeExitRequest? _defaultInstance;

  @$pb.TagNumber(1)
  StartTransferRequest get transfer => $_getN(0);
  @$pb.TagNumber(1)
  set transfer(StartTransferRequest value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransfer() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransfer() => $_clearField(1);
  @$pb.TagNumber(1)
  StartTransferRequest ensureTransfer() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get exitId => $_getSZ(1);
  @$pb.TagNumber(2)
  set exitId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasExitId() => $_has(1);
  @$pb.TagNumber(2)
  void clearExitId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get exitTxid => $_getN(2);
  @$pb.TagNumber(3)
  set exitTxid($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExitTxid() => $_has(2);
  @$pb.TagNumber(3)
  void clearExitTxid() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get connectorTx => $_getN(3);
  @$pb.TagNumber(4)
  set connectorTx($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasConnectorTx() => $_has(3);
  @$pb.TagNumber(4)
  void clearConnectorTx() => $_clearField(4);
}

class CooperativeExitResponse extends $pb.GeneratedMessage {
  factory CooperativeExitResponse({
    Transfer? transfer,
    $core.Iterable<LeafRefundTxSigningResult>? signingResults,
  }) {
    final result = create();
    if (transfer != null) result.transfer = transfer;
    if (signingResults != null) result.signingResults.addAll(signingResults);
    return result;
  }

  CooperativeExitResponse._();

  factory CooperativeExitResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CooperativeExitResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CooperativeExitResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<Transfer>(1, _omitFieldNames ? '' : 'transfer',
        subBuilder: Transfer.create)
    ..pPM<LeafRefundTxSigningResult>(2, _omitFieldNames ? '' : 'signingResults',
        subBuilder: LeafRefundTxSigningResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CooperativeExitResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CooperativeExitResponse copyWith(
          void Function(CooperativeExitResponse) updates) =>
      super.copyWith((message) => updates(message as CooperativeExitResponse))
          as CooperativeExitResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CooperativeExitResponse create() => CooperativeExitResponse._();
  @$core.override
  CooperativeExitResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CooperativeExitResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CooperativeExitResponse>(create);
  static CooperativeExitResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Transfer get transfer => $_getN(0);
  @$pb.TagNumber(1)
  set transfer(Transfer value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransfer() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransfer() => $_clearField(1);
  @$pb.TagNumber(1)
  Transfer ensureTransfer() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<LeafRefundTxSigningResult> get signingResults => $_getList(1);
}

class CounterLeafSwapRequest extends $pb.GeneratedMessage {
  factory CounterLeafSwapRequest({
    StartTransferRequest? transfer,
    $core.String? swapId,
    $core.List<$core.int>? adaptorPublicKey,
    $core.List<$core.int>? directAdaptorPublicKey,
    $core.List<$core.int>? directFromCpfpAdaptorPublicKey,
  }) {
    final result = create();
    if (transfer != null) result.transfer = transfer;
    if (swapId != null) result.swapId = swapId;
    if (adaptorPublicKey != null) result.adaptorPublicKey = adaptorPublicKey;
    if (directAdaptorPublicKey != null)
      result.directAdaptorPublicKey = directAdaptorPublicKey;
    if (directFromCpfpAdaptorPublicKey != null)
      result.directFromCpfpAdaptorPublicKey = directFromCpfpAdaptorPublicKey;
    return result;
  }

  CounterLeafSwapRequest._();

  factory CounterLeafSwapRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CounterLeafSwapRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CounterLeafSwapRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<StartTransferRequest>(1, _omitFieldNames ? '' : 'transfer',
        subBuilder: StartTransferRequest.create)
    ..aOS(2, _omitFieldNames ? '' : 'swapId')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'adaptorPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'directAdaptorPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5,
        _omitFieldNames ? '' : 'directFromCpfpAdaptorPublicKey',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CounterLeafSwapRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CounterLeafSwapRequest copyWith(
          void Function(CounterLeafSwapRequest) updates) =>
      super.copyWith((message) => updates(message as CounterLeafSwapRequest))
          as CounterLeafSwapRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CounterLeafSwapRequest create() => CounterLeafSwapRequest._();
  @$core.override
  CounterLeafSwapRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CounterLeafSwapRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CounterLeafSwapRequest>(create);
  static CounterLeafSwapRequest? _defaultInstance;

  @$pb.TagNumber(1)
  StartTransferRequest get transfer => $_getN(0);
  @$pb.TagNumber(1)
  set transfer(StartTransferRequest value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransfer() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransfer() => $_clearField(1);
  @$pb.TagNumber(1)
  StartTransferRequest ensureTransfer() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get swapId => $_getSZ(1);
  @$pb.TagNumber(2)
  set swapId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSwapId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSwapId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get adaptorPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set adaptorPublicKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAdaptorPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearAdaptorPublicKey() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get directAdaptorPublicKey => $_getN(3);
  @$pb.TagNumber(4)
  set directAdaptorPublicKey($core.List<$core.int> value) =>
      $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDirectAdaptorPublicKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearDirectAdaptorPublicKey() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get directFromCpfpAdaptorPublicKey => $_getN(4);
  @$pb.TagNumber(5)
  set directFromCpfpAdaptorPublicKey($core.List<$core.int> value) =>
      $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDirectFromCpfpAdaptorPublicKey() => $_has(4);
  @$pb.TagNumber(5)
  void clearDirectFromCpfpAdaptorPublicKey() => $_clearField(5);
}

class CounterLeafSwapResponse extends $pb.GeneratedMessage {
  factory CounterLeafSwapResponse({
    Transfer? transfer,
    $core.Iterable<LeafRefundTxSigningResult>? signingResults,
  }) {
    final result = create();
    if (transfer != null) result.transfer = transfer;
    if (signingResults != null) result.signingResults.addAll(signingResults);
    return result;
  }

  CounterLeafSwapResponse._();

  factory CounterLeafSwapResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CounterLeafSwapResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CounterLeafSwapResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<Transfer>(1, _omitFieldNames ? '' : 'transfer',
        subBuilder: Transfer.create)
    ..pPM<LeafRefundTxSigningResult>(2, _omitFieldNames ? '' : 'signingResults',
        subBuilder: LeafRefundTxSigningResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CounterLeafSwapResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CounterLeafSwapResponse copyWith(
          void Function(CounterLeafSwapResponse) updates) =>
      super.copyWith((message) => updates(message as CounterLeafSwapResponse))
          as CounterLeafSwapResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CounterLeafSwapResponse create() => CounterLeafSwapResponse._();
  @$core.override
  CounterLeafSwapResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CounterLeafSwapResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CounterLeafSwapResponse>(create);
  static CounterLeafSwapResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Transfer get transfer => $_getN(0);
  @$pb.TagNumber(1)
  set transfer(Transfer value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransfer() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransfer() => $_clearField(1);
  @$pb.TagNumber(1)
  Transfer ensureTransfer() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<LeafRefundTxSigningResult> get signingResults => $_getList(1);
}

class RefreshTimelockRequest extends $pb.GeneratedMessage {
  factory RefreshTimelockRequest({
    $core.String? leafId,
    $core.List<$core.int>? ownerIdentityPublicKey,
    $core.Iterable<SigningJob>? signingJobs,
  }) {
    final result = create();
    if (leafId != null) result.leafId = leafId;
    if (ownerIdentityPublicKey != null)
      result.ownerIdentityPublicKey = ownerIdentityPublicKey;
    if (signingJobs != null) result.signingJobs.addAll(signingJobs);
    return result;
  }

  RefreshTimelockRequest._();

  factory RefreshTimelockRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RefreshTimelockRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RefreshTimelockRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'leafId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'ownerIdentityPublicKey', $pb.PbFieldType.OY)
    ..pPM<SigningJob>(3, _omitFieldNames ? '' : 'signingJobs',
        subBuilder: SigningJob.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshTimelockRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshTimelockRequest copyWith(
          void Function(RefreshTimelockRequest) updates) =>
      super.copyWith((message) => updates(message as RefreshTimelockRequest))
          as RefreshTimelockRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshTimelockRequest create() => RefreshTimelockRequest._();
  @$core.override
  RefreshTimelockRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RefreshTimelockRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshTimelockRequest>(create);
  static RefreshTimelockRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get leafId => $_getSZ(0);
  @$pb.TagNumber(1)
  set leafId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLeafId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeafId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get ownerIdentityPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set ownerIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOwnerIdentityPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerIdentityPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<SigningJob> get signingJobs => $_getList(2);
}

class RefreshTimelockSigningResult extends $pb.GeneratedMessage {
  factory RefreshTimelockSigningResult({
    SigningResult? signingResult,
    $core.List<$core.int>? verifyingKey,
  }) {
    final result = create();
    if (signingResult != null) result.signingResult = signingResult;
    if (verifyingKey != null) result.verifyingKey = verifyingKey;
    return result;
  }

  RefreshTimelockSigningResult._();

  factory RefreshTimelockSigningResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RefreshTimelockSigningResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RefreshTimelockSigningResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<SigningResult>(1, _omitFieldNames ? '' : 'signingResult',
        subBuilder: SigningResult.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'verifyingKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshTimelockSigningResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshTimelockSigningResult copyWith(
          void Function(RefreshTimelockSigningResult) updates) =>
      super.copyWith(
              (message) => updates(message as RefreshTimelockSigningResult))
          as RefreshTimelockSigningResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshTimelockSigningResult create() =>
      RefreshTimelockSigningResult._();
  @$core.override
  RefreshTimelockSigningResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RefreshTimelockSigningResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshTimelockSigningResult>(create);
  static RefreshTimelockSigningResult? _defaultInstance;

  @$pb.TagNumber(1)
  SigningResult get signingResult => $_getN(0);
  @$pb.TagNumber(1)
  set signingResult(SigningResult value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSigningResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearSigningResult() => $_clearField(1);
  @$pb.TagNumber(1)
  SigningResult ensureSigningResult() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get verifyingKey => $_getN(1);
  @$pb.TagNumber(2)
  set verifyingKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVerifyingKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearVerifyingKey() => $_clearField(2);
}

class RefreshTimelockResponse extends $pb.GeneratedMessage {
  factory RefreshTimelockResponse({
    $core.Iterable<RefreshTimelockSigningResult>? signingResults,
  }) {
    final result = create();
    if (signingResults != null) result.signingResults.addAll(signingResults);
    return result;
  }

  RefreshTimelockResponse._();

  factory RefreshTimelockResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RefreshTimelockResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RefreshTimelockResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..pPM<RefreshTimelockSigningResult>(
        1, _omitFieldNames ? '' : 'signingResults',
        subBuilder: RefreshTimelockSigningResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshTimelockResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshTimelockResponse copyWith(
          void Function(RefreshTimelockResponse) updates) =>
      super.copyWith((message) => updates(message as RefreshTimelockResponse))
          as RefreshTimelockResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshTimelockResponse create() => RefreshTimelockResponse._();
  @$core.override
  RefreshTimelockResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RefreshTimelockResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshTimelockResponse>(create);
  static RefreshTimelockResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RefreshTimelockSigningResult> get signingResults => $_getList(0);
}

class ExtendLeafRequest extends $pb.GeneratedMessage {
  factory ExtendLeafRequest({
    $core.String? leafId,
    $core.List<$core.int>? ownerIdentityPublicKey,
    SigningJob? nodeTxSigningJob,
    SigningJob? refundTxSigningJob,
    SigningJob? directNodeTxSigningJob,
    SigningJob? directRefundTxSigningJob,
    SigningJob? directFromCpfpRefundTxSigningJob,
  }) {
    final result = create();
    if (leafId != null) result.leafId = leafId;
    if (ownerIdentityPublicKey != null)
      result.ownerIdentityPublicKey = ownerIdentityPublicKey;
    if (nodeTxSigningJob != null) result.nodeTxSigningJob = nodeTxSigningJob;
    if (refundTxSigningJob != null)
      result.refundTxSigningJob = refundTxSigningJob;
    if (directNodeTxSigningJob != null)
      result.directNodeTxSigningJob = directNodeTxSigningJob;
    if (directRefundTxSigningJob != null)
      result.directRefundTxSigningJob = directRefundTxSigningJob;
    if (directFromCpfpRefundTxSigningJob != null)
      result.directFromCpfpRefundTxSigningJob =
          directFromCpfpRefundTxSigningJob;
    return result;
  }

  ExtendLeafRequest._();

  factory ExtendLeafRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExtendLeafRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExtendLeafRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'leafId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'ownerIdentityPublicKey', $pb.PbFieldType.OY)
    ..aOM<SigningJob>(3, _omitFieldNames ? '' : 'nodeTxSigningJob',
        subBuilder: SigningJob.create)
    ..aOM<SigningJob>(4, _omitFieldNames ? '' : 'refundTxSigningJob',
        subBuilder: SigningJob.create)
    ..aOM<SigningJob>(5, _omitFieldNames ? '' : 'directNodeTxSigningJob',
        subBuilder: SigningJob.create)
    ..aOM<SigningJob>(6, _omitFieldNames ? '' : 'directRefundTxSigningJob',
        subBuilder: SigningJob.create)
    ..aOM<SigningJob>(
        7, _omitFieldNames ? '' : 'directFromCpfpRefundTxSigningJob',
        subBuilder: SigningJob.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExtendLeafRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExtendLeafRequest copyWith(void Function(ExtendLeafRequest) updates) =>
      super.copyWith((message) => updates(message as ExtendLeafRequest))
          as ExtendLeafRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExtendLeafRequest create() => ExtendLeafRequest._();
  @$core.override
  ExtendLeafRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExtendLeafRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExtendLeafRequest>(create);
  static ExtendLeafRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get leafId => $_getSZ(0);
  @$pb.TagNumber(1)
  set leafId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLeafId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeafId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get ownerIdentityPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set ownerIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOwnerIdentityPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerIdentityPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  SigningJob get nodeTxSigningJob => $_getN(2);
  @$pb.TagNumber(3)
  set nodeTxSigningJob(SigningJob value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasNodeTxSigningJob() => $_has(2);
  @$pb.TagNumber(3)
  void clearNodeTxSigningJob() => $_clearField(3);
  @$pb.TagNumber(3)
  SigningJob ensureNodeTxSigningJob() => $_ensure(2);

  @$pb.TagNumber(4)
  SigningJob get refundTxSigningJob => $_getN(3);
  @$pb.TagNumber(4)
  set refundTxSigningJob(SigningJob value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRefundTxSigningJob() => $_has(3);
  @$pb.TagNumber(4)
  void clearRefundTxSigningJob() => $_clearField(4);
  @$pb.TagNumber(4)
  SigningJob ensureRefundTxSigningJob() => $_ensure(3);

  @$pb.TagNumber(5)
  SigningJob get directNodeTxSigningJob => $_getN(4);
  @$pb.TagNumber(5)
  set directNodeTxSigningJob(SigningJob value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasDirectNodeTxSigningJob() => $_has(4);
  @$pb.TagNumber(5)
  void clearDirectNodeTxSigningJob() => $_clearField(5);
  @$pb.TagNumber(5)
  SigningJob ensureDirectNodeTxSigningJob() => $_ensure(4);

  @$pb.TagNumber(6)
  SigningJob get directRefundTxSigningJob => $_getN(5);
  @$pb.TagNumber(6)
  set directRefundTxSigningJob(SigningJob value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasDirectRefundTxSigningJob() => $_has(5);
  @$pb.TagNumber(6)
  void clearDirectRefundTxSigningJob() => $_clearField(6);
  @$pb.TagNumber(6)
  SigningJob ensureDirectRefundTxSigningJob() => $_ensure(5);

  @$pb.TagNumber(7)
  SigningJob get directFromCpfpRefundTxSigningJob => $_getN(6);
  @$pb.TagNumber(7)
  set directFromCpfpRefundTxSigningJob(SigningJob value) =>
      $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasDirectFromCpfpRefundTxSigningJob() => $_has(6);
  @$pb.TagNumber(7)
  void clearDirectFromCpfpRefundTxSigningJob() => $_clearField(7);
  @$pb.TagNumber(7)
  SigningJob ensureDirectFromCpfpRefundTxSigningJob() => $_ensure(6);
}

class ExtendLeafSigningResult extends $pb.GeneratedMessage {
  factory ExtendLeafSigningResult({
    SigningResult? signingResult,
    $core.List<$core.int>? verifyingKey,
  }) {
    final result = create();
    if (signingResult != null) result.signingResult = signingResult;
    if (verifyingKey != null) result.verifyingKey = verifyingKey;
    return result;
  }

  ExtendLeafSigningResult._();

  factory ExtendLeafSigningResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExtendLeafSigningResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExtendLeafSigningResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<SigningResult>(1, _omitFieldNames ? '' : 'signingResult',
        subBuilder: SigningResult.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'verifyingKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExtendLeafSigningResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExtendLeafSigningResult copyWith(
          void Function(ExtendLeafSigningResult) updates) =>
      super.copyWith((message) => updates(message as ExtendLeafSigningResult))
          as ExtendLeafSigningResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExtendLeafSigningResult create() => ExtendLeafSigningResult._();
  @$core.override
  ExtendLeafSigningResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExtendLeafSigningResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExtendLeafSigningResult>(create);
  static ExtendLeafSigningResult? _defaultInstance;

  @$pb.TagNumber(1)
  SigningResult get signingResult => $_getN(0);
  @$pb.TagNumber(1)
  set signingResult(SigningResult value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSigningResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearSigningResult() => $_clearField(1);
  @$pb.TagNumber(1)
  SigningResult ensureSigningResult() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get verifyingKey => $_getN(1);
  @$pb.TagNumber(2)
  set verifyingKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVerifyingKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearVerifyingKey() => $_clearField(2);
}

class ExtendLeafResponse extends $pb.GeneratedMessage {
  factory ExtendLeafResponse({
    $core.String? leafId,
    ExtendLeafSigningResult? nodeTxSigningResult,
    ExtendLeafSigningResult? refundTxSigningResult,
    ExtendLeafSigningResult? directNodeTxSigningResult,
    ExtendLeafSigningResult? directRefundTxSigningResult,
    ExtendLeafSigningResult? directFromCpfpRefundTxSigningResult,
  }) {
    final result = create();
    if (leafId != null) result.leafId = leafId;
    if (nodeTxSigningResult != null)
      result.nodeTxSigningResult = nodeTxSigningResult;
    if (refundTxSigningResult != null)
      result.refundTxSigningResult = refundTxSigningResult;
    if (directNodeTxSigningResult != null)
      result.directNodeTxSigningResult = directNodeTxSigningResult;
    if (directRefundTxSigningResult != null)
      result.directRefundTxSigningResult = directRefundTxSigningResult;
    if (directFromCpfpRefundTxSigningResult != null)
      result.directFromCpfpRefundTxSigningResult =
          directFromCpfpRefundTxSigningResult;
    return result;
  }

  ExtendLeafResponse._();

  factory ExtendLeafResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExtendLeafResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExtendLeafResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'leafId')
    ..aOM<ExtendLeafSigningResult>(
        2, _omitFieldNames ? '' : 'nodeTxSigningResult',
        subBuilder: ExtendLeafSigningResult.create)
    ..aOM<ExtendLeafSigningResult>(
        3, _omitFieldNames ? '' : 'refundTxSigningResult',
        subBuilder: ExtendLeafSigningResult.create)
    ..aOM<ExtendLeafSigningResult>(
        4, _omitFieldNames ? '' : 'directNodeTxSigningResult',
        subBuilder: ExtendLeafSigningResult.create)
    ..aOM<ExtendLeafSigningResult>(
        5, _omitFieldNames ? '' : 'directRefundTxSigningResult',
        subBuilder: ExtendLeafSigningResult.create)
    ..aOM<ExtendLeafSigningResult>(
        6, _omitFieldNames ? '' : 'directFromCpfpRefundTxSigningResult',
        subBuilder: ExtendLeafSigningResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExtendLeafResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExtendLeafResponse copyWith(void Function(ExtendLeafResponse) updates) =>
      super.copyWith((message) => updates(message as ExtendLeafResponse))
          as ExtendLeafResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExtendLeafResponse create() => ExtendLeafResponse._();
  @$core.override
  ExtendLeafResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExtendLeafResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExtendLeafResponse>(create);
  static ExtendLeafResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get leafId => $_getSZ(0);
  @$pb.TagNumber(1)
  set leafId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLeafId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeafId() => $_clearField(1);

  @$pb.TagNumber(2)
  ExtendLeafSigningResult get nodeTxSigningResult => $_getN(1);
  @$pb.TagNumber(2)
  set nodeTxSigningResult(ExtendLeafSigningResult value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNodeTxSigningResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearNodeTxSigningResult() => $_clearField(2);
  @$pb.TagNumber(2)
  ExtendLeafSigningResult ensureNodeTxSigningResult() => $_ensure(1);

  @$pb.TagNumber(3)
  ExtendLeafSigningResult get refundTxSigningResult => $_getN(2);
  @$pb.TagNumber(3)
  set refundTxSigningResult(ExtendLeafSigningResult value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRefundTxSigningResult() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefundTxSigningResult() => $_clearField(3);
  @$pb.TagNumber(3)
  ExtendLeafSigningResult ensureRefundTxSigningResult() => $_ensure(2);

  @$pb.TagNumber(4)
  ExtendLeafSigningResult get directNodeTxSigningResult => $_getN(3);
  @$pb.TagNumber(4)
  set directNodeTxSigningResult(ExtendLeafSigningResult value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasDirectNodeTxSigningResult() => $_has(3);
  @$pb.TagNumber(4)
  void clearDirectNodeTxSigningResult() => $_clearField(4);
  @$pb.TagNumber(4)
  ExtendLeafSigningResult ensureDirectNodeTxSigningResult() => $_ensure(3);

  @$pb.TagNumber(5)
  ExtendLeafSigningResult get directRefundTxSigningResult => $_getN(4);
  @$pb.TagNumber(5)
  set directRefundTxSigningResult(ExtendLeafSigningResult value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasDirectRefundTxSigningResult() => $_has(4);
  @$pb.TagNumber(5)
  void clearDirectRefundTxSigningResult() => $_clearField(5);
  @$pb.TagNumber(5)
  ExtendLeafSigningResult ensureDirectRefundTxSigningResult() => $_ensure(4);

  @$pb.TagNumber(6)
  ExtendLeafSigningResult get directFromCpfpRefundTxSigningResult => $_getN(5);
  @$pb.TagNumber(6)
  set directFromCpfpRefundTxSigningResult(ExtendLeafSigningResult value) =>
      $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasDirectFromCpfpRefundTxSigningResult() => $_has(5);
  @$pb.TagNumber(6)
  void clearDirectFromCpfpRefundTxSigningResult() => $_clearField(6);
  @$pb.TagNumber(6)
  ExtendLeafSigningResult ensureDirectFromCpfpRefundTxSigningResult() =>
      $_ensure(5);
}

class AddressRequestNode extends $pb.GeneratedMessage {
  factory AddressRequestNode({
    $core.List<$core.int>? userPublicKey,
    $core.Iterable<AddressRequestNode>? children,
  }) {
    final result = create();
    if (userPublicKey != null) result.userPublicKey = userPublicKey;
    if (children != null) result.children.addAll(children);
    return result;
  }

  AddressRequestNode._();

  factory AddressRequestNode.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddressRequestNode.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddressRequestNode',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'userPublicKey', $pb.PbFieldType.OY)
    ..pPM<AddressRequestNode>(2, _omitFieldNames ? '' : 'children',
        subBuilder: AddressRequestNode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddressRequestNode clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddressRequestNode copyWith(void Function(AddressRequestNode) updates) =>
      super.copyWith((message) => updates(message as AddressRequestNode))
          as AddressRequestNode;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddressRequestNode create() => AddressRequestNode._();
  @$core.override
  AddressRequestNode createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddressRequestNode getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddressRequestNode>(create);
  static AddressRequestNode? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get userPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set userPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<AddressRequestNode> get children => $_getList(1);
}

enum PrepareTreeAddressRequest_Source { parentNodeOutput, onChainUtxo, notSet }

class PrepareTreeAddressRequest extends $pb.GeneratedMessage {
  factory PrepareTreeAddressRequest({
    NodeOutput? parentNodeOutput,
    UTXO? onChainUtxo,
    AddressRequestNode? node,
    $core.List<$core.int>? userIdentityPublicKey,
  }) {
    final result = create();
    if (parentNodeOutput != null) result.parentNodeOutput = parentNodeOutput;
    if (onChainUtxo != null) result.onChainUtxo = onChainUtxo;
    if (node != null) result.node = node;
    if (userIdentityPublicKey != null)
      result.userIdentityPublicKey = userIdentityPublicKey;
    return result;
  }

  PrepareTreeAddressRequest._();

  factory PrepareTreeAddressRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PrepareTreeAddressRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, PrepareTreeAddressRequest_Source>
      _PrepareTreeAddressRequest_SourceByTag = {
    1: PrepareTreeAddressRequest_Source.parentNodeOutput,
    2: PrepareTreeAddressRequest_Source.onChainUtxo,
    0: PrepareTreeAddressRequest_Source.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrepareTreeAddressRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<NodeOutput>(1, _omitFieldNames ? '' : 'parentNodeOutput',
        subBuilder: NodeOutput.create)
    ..aOM<UTXO>(2, _omitFieldNames ? '' : 'onChainUtxo',
        subBuilder: UTXO.create)
    ..aOM<AddressRequestNode>(3, _omitFieldNames ? '' : 'node',
        subBuilder: AddressRequestNode.create)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'userIdentityPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareTreeAddressRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareTreeAddressRequest copyWith(
          void Function(PrepareTreeAddressRequest) updates) =>
      super.copyWith((message) => updates(message as PrepareTreeAddressRequest))
          as PrepareTreeAddressRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrepareTreeAddressRequest create() => PrepareTreeAddressRequest._();
  @$core.override
  PrepareTreeAddressRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PrepareTreeAddressRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrepareTreeAddressRequest>(create);
  static PrepareTreeAddressRequest? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  PrepareTreeAddressRequest_Source whichSource() =>
      _PrepareTreeAddressRequest_SourceByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearSource() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  NodeOutput get parentNodeOutput => $_getN(0);
  @$pb.TagNumber(1)
  set parentNodeOutput(NodeOutput value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasParentNodeOutput() => $_has(0);
  @$pb.TagNumber(1)
  void clearParentNodeOutput() => $_clearField(1);
  @$pb.TagNumber(1)
  NodeOutput ensureParentNodeOutput() => $_ensure(0);

  @$pb.TagNumber(2)
  UTXO get onChainUtxo => $_getN(1);
  @$pb.TagNumber(2)
  set onChainUtxo(UTXO value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOnChainUtxo() => $_has(1);
  @$pb.TagNumber(2)
  void clearOnChainUtxo() => $_clearField(2);
  @$pb.TagNumber(2)
  UTXO ensureOnChainUtxo() => $_ensure(1);

  /// The tx on this node is to spend the source's utxo.
  /// The user's public key should already be registered with the SE for the root node.
  @$pb.TagNumber(3)
  AddressRequestNode get node => $_getN(2);
  @$pb.TagNumber(3)
  set node(AddressRequestNode value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasNode() => $_has(2);
  @$pb.TagNumber(3)
  void clearNode() => $_clearField(3);
  @$pb.TagNumber(3)
  AddressRequestNode ensureNode() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get userIdentityPublicKey => $_getN(3);
  @$pb.TagNumber(4)
  set userIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUserIdentityPublicKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserIdentityPublicKey() => $_clearField(4);
}

class AddressNode extends $pb.GeneratedMessage {
  factory AddressNode({
    Address? address,
    $core.Iterable<AddressNode>? children,
  }) {
    final result = create();
    if (address != null) result.address = address;
    if (children != null) result.children.addAll(children);
    return result;
  }

  AddressNode._();

  factory AddressNode.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddressNode.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddressNode',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<Address>(1, _omitFieldNames ? '' : 'address',
        subBuilder: Address.create)
    ..pPM<AddressNode>(2, _omitFieldNames ? '' : 'children',
        subBuilder: AddressNode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddressNode clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddressNode copyWith(void Function(AddressNode) updates) =>
      super.copyWith((message) => updates(message as AddressNode))
          as AddressNode;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddressNode create() => AddressNode._();
  @$core.override
  AddressNode createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddressNode getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddressNode>(create);
  static AddressNode? _defaultInstance;

  @$pb.TagNumber(1)
  Address get address => $_getN(0);
  @$pb.TagNumber(1)
  set address(Address value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => $_clearField(1);
  @$pb.TagNumber(1)
  Address ensureAddress() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<AddressNode> get children => $_getList(1);
}

class PrepareTreeAddressResponse extends $pb.GeneratedMessage {
  factory PrepareTreeAddressResponse({
    AddressNode? node,
  }) {
    final result = create();
    if (node != null) result.node = node;
    return result;
  }

  PrepareTreeAddressResponse._();

  factory PrepareTreeAddressResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PrepareTreeAddressResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrepareTreeAddressResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<AddressNode>(1, _omitFieldNames ? '' : 'node',
        subBuilder: AddressNode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareTreeAddressResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrepareTreeAddressResponse copyWith(
          void Function(PrepareTreeAddressResponse) updates) =>
      super.copyWith(
              (message) => updates(message as PrepareTreeAddressResponse))
          as PrepareTreeAddressResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrepareTreeAddressResponse create() => PrepareTreeAddressResponse._();
  @$core.override
  PrepareTreeAddressResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PrepareTreeAddressResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrepareTreeAddressResponse>(create);
  static PrepareTreeAddressResponse? _defaultInstance;

  @$pb.TagNumber(1)
  AddressNode get node => $_getN(0);
  @$pb.TagNumber(1)
  set node(AddressNode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasNode() => $_has(0);
  @$pb.TagNumber(1)
  void clearNode() => $_clearField(1);
  @$pb.TagNumber(1)
  AddressNode ensureNode() => $_ensure(0);
}

class CreationNode extends $pb.GeneratedMessage {
  factory CreationNode({
    SigningJob? nodeTxSigningJob,
    SigningJob? refundTxSigningJob,
    $core.Iterable<CreationNode>? children,
    SigningJob? directNodeTxSigningJob,
    SigningJob? directRefundTxSigningJob,
    SigningJob? directFromCpfpRefundTxSigningJob,
  }) {
    final result = create();
    if (nodeTxSigningJob != null) result.nodeTxSigningJob = nodeTxSigningJob;
    if (refundTxSigningJob != null)
      result.refundTxSigningJob = refundTxSigningJob;
    if (children != null) result.children.addAll(children);
    if (directNodeTxSigningJob != null)
      result.directNodeTxSigningJob = directNodeTxSigningJob;
    if (directRefundTxSigningJob != null)
      result.directRefundTxSigningJob = directRefundTxSigningJob;
    if (directFromCpfpRefundTxSigningJob != null)
      result.directFromCpfpRefundTxSigningJob =
          directFromCpfpRefundTxSigningJob;
    return result;
  }

  CreationNode._();

  factory CreationNode.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreationNode.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreationNode',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<SigningJob>(1, _omitFieldNames ? '' : 'nodeTxSigningJob',
        subBuilder: SigningJob.create)
    ..aOM<SigningJob>(2, _omitFieldNames ? '' : 'refundTxSigningJob',
        subBuilder: SigningJob.create)
    ..pPM<CreationNode>(3, _omitFieldNames ? '' : 'children',
        subBuilder: CreationNode.create)
    ..aOM<SigningJob>(4, _omitFieldNames ? '' : 'directNodeTxSigningJob',
        subBuilder: SigningJob.create)
    ..aOM<SigningJob>(5, _omitFieldNames ? '' : 'directRefundTxSigningJob',
        subBuilder: SigningJob.create)
    ..aOM<SigningJob>(
        6, _omitFieldNames ? '' : 'directFromCpfpRefundTxSigningJob',
        subBuilder: SigningJob.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreationNode clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreationNode copyWith(void Function(CreationNode) updates) =>
      super.copyWith((message) => updates(message as CreationNode))
          as CreationNode;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreationNode create() => CreationNode._();
  @$core.override
  CreationNode createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreationNode getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreationNode>(create);
  static CreationNode? _defaultInstance;

  /// This is the cpfp tx that spends the parent node's output.
  @$pb.TagNumber(1)
  SigningJob get nodeTxSigningJob => $_getN(0);
  @$pb.TagNumber(1)
  set nodeTxSigningJob(SigningJob value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasNodeTxSigningJob() => $_has(0);
  @$pb.TagNumber(1)
  void clearNodeTxSigningJob() => $_clearField(1);
  @$pb.TagNumber(1)
  SigningJob ensureNodeTxSigningJob() => $_ensure(0);

  /// The refund tx can only exist if there's no children.
  @$pb.TagNumber(2)
  SigningJob get refundTxSigningJob => $_getN(1);
  @$pb.TagNumber(2)
  set refundTxSigningJob(SigningJob value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRefundTxSigningJob() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefundTxSigningJob() => $_clearField(2);
  @$pb.TagNumber(2)
  SigningJob ensureRefundTxSigningJob() => $_ensure(1);

  /// The children will spend the output of the node's tx. Vout is the index of the child.
  @$pb.TagNumber(3)
  $pb.PbList<CreationNode> get children => $_getList(2);

  /// This is the direct tx that spends the parent node's output.
  @$pb.TagNumber(4)
  SigningJob get directNodeTxSigningJob => $_getN(3);
  @$pb.TagNumber(4)
  set directNodeTxSigningJob(SigningJob value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasDirectNodeTxSigningJob() => $_has(3);
  @$pb.TagNumber(4)
  void clearDirectNodeTxSigningJob() => $_clearField(4);
  @$pb.TagNumber(4)
  SigningJob ensureDirectNodeTxSigningJob() => $_ensure(3);

  /// The direct refund tx can only exist if there's no children.
  @$pb.TagNumber(5)
  SigningJob get directRefundTxSigningJob => $_getN(4);
  @$pb.TagNumber(5)
  set directRefundTxSigningJob(SigningJob value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasDirectRefundTxSigningJob() => $_has(4);
  @$pb.TagNumber(5)
  void clearDirectRefundTxSigningJob() => $_clearField(5);
  @$pb.TagNumber(5)
  SigningJob ensureDirectRefundTxSigningJob() => $_ensure(4);

  /// The direct from cpfp refund tx can only exist if there's no children.
  @$pb.TagNumber(6)
  SigningJob get directFromCpfpRefundTxSigningJob => $_getN(5);
  @$pb.TagNumber(6)
  set directFromCpfpRefundTxSigningJob(SigningJob value) =>
      $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasDirectFromCpfpRefundTxSigningJob() => $_has(5);
  @$pb.TagNumber(6)
  void clearDirectFromCpfpRefundTxSigningJob() => $_clearField(6);
  @$pb.TagNumber(6)
  SigningJob ensureDirectFromCpfpRefundTxSigningJob() => $_ensure(5);
}

enum CreateTreeRequest_Source { parentNodeOutput, onChainUtxo, notSet }

class CreateTreeRequest extends $pb.GeneratedMessage {
  factory CreateTreeRequest({
    NodeOutput? parentNodeOutput,
    UTXO? onChainUtxo,
    CreationNode? node,
    $core.List<$core.int>? userIdentityPublicKey,
  }) {
    final result = create();
    if (parentNodeOutput != null) result.parentNodeOutput = parentNodeOutput;
    if (onChainUtxo != null) result.onChainUtxo = onChainUtxo;
    if (node != null) result.node = node;
    if (userIdentityPublicKey != null)
      result.userIdentityPublicKey = userIdentityPublicKey;
    return result;
  }

  CreateTreeRequest._();

  factory CreateTreeRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateTreeRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, CreateTreeRequest_Source>
      _CreateTreeRequest_SourceByTag = {
    1: CreateTreeRequest_Source.parentNodeOutput,
    2: CreateTreeRequest_Source.onChainUtxo,
    0: CreateTreeRequest_Source.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateTreeRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<NodeOutput>(1, _omitFieldNames ? '' : 'parentNodeOutput',
        subBuilder: NodeOutput.create)
    ..aOM<UTXO>(2, _omitFieldNames ? '' : 'onChainUtxo',
        subBuilder: UTXO.create)
    ..aOM<CreationNode>(3, _omitFieldNames ? '' : 'node',
        subBuilder: CreationNode.create)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'userIdentityPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateTreeRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateTreeRequest copyWith(void Function(CreateTreeRequest) updates) =>
      super.copyWith((message) => updates(message as CreateTreeRequest))
          as CreateTreeRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTreeRequest create() => CreateTreeRequest._();
  @$core.override
  CreateTreeRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateTreeRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateTreeRequest>(create);
  static CreateTreeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  CreateTreeRequest_Source whichSource() =>
      _CreateTreeRequest_SourceByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearSource() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  NodeOutput get parentNodeOutput => $_getN(0);
  @$pb.TagNumber(1)
  set parentNodeOutput(NodeOutput value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasParentNodeOutput() => $_has(0);
  @$pb.TagNumber(1)
  void clearParentNodeOutput() => $_clearField(1);
  @$pb.TagNumber(1)
  NodeOutput ensureParentNodeOutput() => $_ensure(0);

  @$pb.TagNumber(2)
  UTXO get onChainUtxo => $_getN(1);
  @$pb.TagNumber(2)
  set onChainUtxo(UTXO value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOnChainUtxo() => $_has(1);
  @$pb.TagNumber(2)
  void clearOnChainUtxo() => $_clearField(2);
  @$pb.TagNumber(2)
  UTXO ensureOnChainUtxo() => $_ensure(1);

  /// The node should contain the tx that spends the source's utxo.
  @$pb.TagNumber(3)
  CreationNode get node => $_getN(2);
  @$pb.TagNumber(3)
  set node(CreationNode value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasNode() => $_has(2);
  @$pb.TagNumber(3)
  void clearNode() => $_clearField(3);
  @$pb.TagNumber(3)
  CreationNode ensureNode() => $_ensure(2);

  /// The owner of the tree.
  @$pb.TagNumber(4)
  $core.List<$core.int> get userIdentityPublicKey => $_getN(3);
  @$pb.TagNumber(4)
  set userIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUserIdentityPublicKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserIdentityPublicKey() => $_clearField(4);
}

class CreationResponseNode extends $pb.GeneratedMessage {
  factory CreationResponseNode({
    $core.String? nodeId,
    SigningResult? nodeTxSigningResult,
    SigningResult? refundTxSigningResult,
    $core.Iterable<CreationResponseNode>? children,
    SigningResult? directNodeTxSigningResult,
    SigningResult? directRefundTxSigningResult,
    SigningResult? directFromCpfpRefundTxSigningResult,
  }) {
    final result = create();
    if (nodeId != null) result.nodeId = nodeId;
    if (nodeTxSigningResult != null)
      result.nodeTxSigningResult = nodeTxSigningResult;
    if (refundTxSigningResult != null)
      result.refundTxSigningResult = refundTxSigningResult;
    if (children != null) result.children.addAll(children);
    if (directNodeTxSigningResult != null)
      result.directNodeTxSigningResult = directNodeTxSigningResult;
    if (directRefundTxSigningResult != null)
      result.directRefundTxSigningResult = directRefundTxSigningResult;
    if (directFromCpfpRefundTxSigningResult != null)
      result.directFromCpfpRefundTxSigningResult =
          directFromCpfpRefundTxSigningResult;
    return result;
  }

  CreationResponseNode._();

  factory CreationResponseNode.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreationResponseNode.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreationResponseNode',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nodeId')
    ..aOM<SigningResult>(2, _omitFieldNames ? '' : 'nodeTxSigningResult',
        subBuilder: SigningResult.create)
    ..aOM<SigningResult>(3, _omitFieldNames ? '' : 'refundTxSigningResult',
        subBuilder: SigningResult.create)
    ..pPM<CreationResponseNode>(4, _omitFieldNames ? '' : 'children',
        subBuilder: CreationResponseNode.create)
    ..aOM<SigningResult>(5, _omitFieldNames ? '' : 'directNodeTxSigningResult',
        subBuilder: SigningResult.create)
    ..aOM<SigningResult>(
        6, _omitFieldNames ? '' : 'directRefundTxSigningResult',
        subBuilder: SigningResult.create)
    ..aOM<SigningResult>(
        7, _omitFieldNames ? '' : 'directFromCpfpRefundTxSigningResult',
        subBuilder: SigningResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreationResponseNode clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreationResponseNode copyWith(void Function(CreationResponseNode) updates) =>
      super.copyWith((message) => updates(message as CreationResponseNode))
          as CreationResponseNode;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreationResponseNode create() => CreationResponseNode._();
  @$core.override
  CreationResponseNode createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreationResponseNode getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreationResponseNode>(create);
  static CreationResponseNode? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nodeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set nodeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNodeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNodeId() => $_clearField(1);

  @$pb.TagNumber(2)
  SigningResult get nodeTxSigningResult => $_getN(1);
  @$pb.TagNumber(2)
  set nodeTxSigningResult(SigningResult value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNodeTxSigningResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearNodeTxSigningResult() => $_clearField(2);
  @$pb.TagNumber(2)
  SigningResult ensureNodeTxSigningResult() => $_ensure(1);

  @$pb.TagNumber(3)
  SigningResult get refundTxSigningResult => $_getN(2);
  @$pb.TagNumber(3)
  set refundTxSigningResult(SigningResult value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRefundTxSigningResult() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefundTxSigningResult() => $_clearField(3);
  @$pb.TagNumber(3)
  SigningResult ensureRefundTxSigningResult() => $_ensure(2);

  @$pb.TagNumber(4)
  $pb.PbList<CreationResponseNode> get children => $_getList(3);

  @$pb.TagNumber(5)
  SigningResult get directNodeTxSigningResult => $_getN(4);
  @$pb.TagNumber(5)
  set directNodeTxSigningResult(SigningResult value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasDirectNodeTxSigningResult() => $_has(4);
  @$pb.TagNumber(5)
  void clearDirectNodeTxSigningResult() => $_clearField(5);
  @$pb.TagNumber(5)
  SigningResult ensureDirectNodeTxSigningResult() => $_ensure(4);

  @$pb.TagNumber(6)
  SigningResult get directRefundTxSigningResult => $_getN(5);
  @$pb.TagNumber(6)
  set directRefundTxSigningResult(SigningResult value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasDirectRefundTxSigningResult() => $_has(5);
  @$pb.TagNumber(6)
  void clearDirectRefundTxSigningResult() => $_clearField(6);
  @$pb.TagNumber(6)
  SigningResult ensureDirectRefundTxSigningResult() => $_ensure(5);

  @$pb.TagNumber(7)
  SigningResult get directFromCpfpRefundTxSigningResult => $_getN(6);
  @$pb.TagNumber(7)
  set directFromCpfpRefundTxSigningResult(SigningResult value) =>
      $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasDirectFromCpfpRefundTxSigningResult() => $_has(6);
  @$pb.TagNumber(7)
  void clearDirectFromCpfpRefundTxSigningResult() => $_clearField(7);
  @$pb.TagNumber(7)
  SigningResult ensureDirectFromCpfpRefundTxSigningResult() => $_ensure(6);
}

class CreateTreeResponse extends $pb.GeneratedMessage {
  factory CreateTreeResponse({
    CreationResponseNode? node,
  }) {
    final result = create();
    if (node != null) result.node = node;
    return result;
  }

  CreateTreeResponse._();

  factory CreateTreeResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateTreeResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateTreeResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<CreationResponseNode>(1, _omitFieldNames ? '' : 'node',
        subBuilder: CreationResponseNode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateTreeResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateTreeResponse copyWith(void Function(CreateTreeResponse) updates) =>
      super.copyWith((message) => updates(message as CreateTreeResponse))
          as CreateTreeResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTreeResponse create() => CreateTreeResponse._();
  @$core.override
  CreateTreeResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateTreeResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateTreeResponse>(create);
  static CreateTreeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  CreationResponseNode get node => $_getN(0);
  @$pb.TagNumber(1)
  set node(CreationResponseNode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasNode() => $_has(0);
  @$pb.TagNumber(1)
  void clearNode() => $_clearField(1);
  @$pb.TagNumber(1)
  CreationResponseNode ensureNode() => $_ensure(0);
}

class SigningOperatorInfo extends $pb.GeneratedMessage {
  factory SigningOperatorInfo({
    $fixnum.Int64? index,
    $core.String? identifier,
    $core.List<$core.int>? publicKey,
    $core.String? address,
  }) {
    final result = create();
    if (index != null) result.index = index;
    if (identifier != null) result.identifier = identifier;
    if (publicKey != null) result.publicKey = publicKey;
    if (address != null) result.address = address;
    return result;
  }

  SigningOperatorInfo._();

  factory SigningOperatorInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningOperatorInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningOperatorInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'index', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'identifier')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'address')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningOperatorInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningOperatorInfo copyWith(void Function(SigningOperatorInfo) updates) =>
      super.copyWith((message) => updates(message as SigningOperatorInfo))
          as SigningOperatorInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SigningOperatorInfo create() => SigningOperatorInfo._();
  @$core.override
  SigningOperatorInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SigningOperatorInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SigningOperatorInfo>(create);
  static SigningOperatorInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get index => $_getI64(0);
  @$pb.TagNumber(1)
  set index($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get identifier => $_getSZ(1);
  @$pb.TagNumber(2)
  set identifier($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdentifier() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentifier() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get publicKey => $_getN(2);
  @$pb.TagNumber(3)
  set publicKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearPublicKey() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get address => $_getSZ(3);
  @$pb.TagNumber(4)
  set address($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearAddress() => $_clearField(4);
}

class GetSigningOperatorListResponse extends $pb.GeneratedMessage {
  factory GetSigningOperatorListResponse({
    $core.Iterable<$core.MapEntry<$core.String, SigningOperatorInfo>>?
        signingOperators,
  }) {
    final result = create();
    if (signingOperators != null)
      result.signingOperators.addEntries(signingOperators);
    return result;
  }

  GetSigningOperatorListResponse._();

  factory GetSigningOperatorListResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSigningOperatorListResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSigningOperatorListResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..m<$core.String, SigningOperatorInfo>(
        1, _omitFieldNames ? '' : 'signingOperators',
        entryClassName: 'GetSigningOperatorListResponse.SigningOperatorsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: SigningOperatorInfo.create,
        valueDefaultOrMaker: SigningOperatorInfo.getDefault,
        packageName: const $pb.PackageName('spark'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSigningOperatorListResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSigningOperatorListResponse copyWith(
          void Function(GetSigningOperatorListResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetSigningOperatorListResponse))
          as GetSigningOperatorListResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSigningOperatorListResponse create() =>
      GetSigningOperatorListResponse._();
  @$core.override
  GetSigningOperatorListResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSigningOperatorListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSigningOperatorListResponse>(create);
  static GetSigningOperatorListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, SigningOperatorInfo> get signingOperators =>
      $_getMap(0);
}

class QueryUserSignedRefundsRequest extends $pb.GeneratedMessage {
  factory QueryUserSignedRefundsRequest({
    $core.List<$core.int>? paymentHash,
    $core.List<$core.int>? identityPublicKey,
  }) {
    final result = create();
    if (paymentHash != null) result.paymentHash = paymentHash;
    if (identityPublicKey != null) result.identityPublicKey = identityPublicKey;
    return result;
  }

  QueryUserSignedRefundsRequest._();

  factory QueryUserSignedRefundsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryUserSignedRefundsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryUserSignedRefundsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'paymentHash', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'identityPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryUserSignedRefundsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryUserSignedRefundsRequest copyWith(
          void Function(QueryUserSignedRefundsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as QueryUserSignedRefundsRequest))
          as QueryUserSignedRefundsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryUserSignedRefundsRequest create() =>
      QueryUserSignedRefundsRequest._();
  @$core.override
  QueryUserSignedRefundsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryUserSignedRefundsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryUserSignedRefundsRequest>(create);
  static QueryUserSignedRefundsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get paymentHash => $_getN(0);
  @$pb.TagNumber(1)
  set paymentHash($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPaymentHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaymentHash() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get identityPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set identityPublicKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdentityPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentityPublicKey() => $_clearField(2);
}

class QueryUserSignedRefundsResponse extends $pb.GeneratedMessage {
  factory QueryUserSignedRefundsResponse({
    $core.Iterable<UserSignedRefund>? userSignedRefunds,
    Transfer? transfer,
  }) {
    final result = create();
    if (userSignedRefunds != null)
      result.userSignedRefunds.addAll(userSignedRefunds);
    if (transfer != null) result.transfer = transfer;
    return result;
  }

  QueryUserSignedRefundsResponse._();

  factory QueryUserSignedRefundsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryUserSignedRefundsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryUserSignedRefundsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..pPM<UserSignedRefund>(1, _omitFieldNames ? '' : 'userSignedRefunds',
        subBuilder: UserSignedRefund.create)
    ..aOM<Transfer>(3, _omitFieldNames ? '' : 'transfer',
        subBuilder: Transfer.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryUserSignedRefundsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryUserSignedRefundsResponse copyWith(
          void Function(QueryUserSignedRefundsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as QueryUserSignedRefundsResponse))
          as QueryUserSignedRefundsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryUserSignedRefundsResponse create() =>
      QueryUserSignedRefundsResponse._();
  @$core.override
  QueryUserSignedRefundsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryUserSignedRefundsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryUserSignedRefundsResponse>(create);
  static QueryUserSignedRefundsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<UserSignedRefund> get userSignedRefunds => $_getList(0);

  @$pb.TagNumber(3)
  Transfer get transfer => $_getN(1);
  @$pb.TagNumber(3)
  set transfer(Transfer value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTransfer() => $_has(1);
  @$pb.TagNumber(3)
  void clearTransfer() => $_clearField(3);
  @$pb.TagNumber(3)
  Transfer ensureTransfer() => $_ensure(1);
}

class PreimageRequestWithTransfer extends $pb.GeneratedMessage {
  factory PreimageRequestWithTransfer({
    $core.List<$core.int>? paymentHash,
    $core.List<$core.int>? receiverIdentityPubkey,
    PreimageRequestStatus? status,
    $3.Timestamp? createdTime,
    Transfer? transfer,
    $core.List<$core.int>? preimage,
    $core.List<$core.int>? senderIdentityPubkey,
  }) {
    final result = create();
    if (paymentHash != null) result.paymentHash = paymentHash;
    if (receiverIdentityPubkey != null)
      result.receiverIdentityPubkey = receiverIdentityPubkey;
    if (status != null) result.status = status;
    if (createdTime != null) result.createdTime = createdTime;
    if (transfer != null) result.transfer = transfer;
    if (preimage != null) result.preimage = preimage;
    if (senderIdentityPubkey != null)
      result.senderIdentityPubkey = senderIdentityPubkey;
    return result;
  }

  PreimageRequestWithTransfer._();

  factory PreimageRequestWithTransfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PreimageRequestWithTransfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PreimageRequestWithTransfer',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'paymentHash', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'receiverIdentityPubkey', $pb.PbFieldType.OY)
    ..aE<PreimageRequestStatus>(3, _omitFieldNames ? '' : 'status',
        enumValues: PreimageRequestStatus.values)
    ..aOM<$3.Timestamp>(4, _omitFieldNames ? '' : 'createdTime',
        subBuilder: $3.Timestamp.create)
    ..aOM<Transfer>(5, _omitFieldNames ? '' : 'transfer',
        subBuilder: Transfer.create)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'preimage', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'senderIdentityPubkey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PreimageRequestWithTransfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PreimageRequestWithTransfer copyWith(
          void Function(PreimageRequestWithTransfer) updates) =>
      super.copyWith(
              (message) => updates(message as PreimageRequestWithTransfer))
          as PreimageRequestWithTransfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PreimageRequestWithTransfer create() =>
      PreimageRequestWithTransfer._();
  @$core.override
  PreimageRequestWithTransfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PreimageRequestWithTransfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PreimageRequestWithTransfer>(create);
  static PreimageRequestWithTransfer? _defaultInstance;

  /// Preimage request data
  @$pb.TagNumber(1)
  $core.List<$core.int> get paymentHash => $_getN(0);
  @$pb.TagNumber(1)
  set paymentHash($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPaymentHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaymentHash() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get receiverIdentityPubkey => $_getN(1);
  @$pb.TagNumber(2)
  set receiverIdentityPubkey($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReceiverIdentityPubkey() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiverIdentityPubkey() => $_clearField(2);

  @$pb.TagNumber(3)
  PreimageRequestStatus get status => $_getN(2);
  @$pb.TagNumber(3)
  set status(PreimageRequestStatus value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => $_clearField(3);

  @$pb.TagNumber(4)
  $3.Timestamp get createdTime => $_getN(3);
  @$pb.TagNumber(4)
  set createdTime($3.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasCreatedTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedTime() => $_clearField(4);
  @$pb.TagNumber(4)
  $3.Timestamp ensureCreatedTime() => $_ensure(3);

  /// Associated transfer (if exists)
  @$pb.TagNumber(5)
  Transfer get transfer => $_getN(4);
  @$pb.TagNumber(5)
  set transfer(Transfer value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasTransfer() => $_has(4);
  @$pb.TagNumber(5)
  void clearTransfer() => $_clearField(5);
  @$pb.TagNumber(5)
  Transfer ensureTransfer() => $_ensure(4);

  /// Preimage data (if available)
  @$pb.TagNumber(6)
  $core.List<$core.int> get preimage => $_getN(5);
  @$pb.TagNumber(6)
  set preimage($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPreimage() => $_has(5);
  @$pb.TagNumber(6)
  void clearPreimage() => $_clearField(6);

  /// The identity public key of the sender can potentially be null for old preimage requests.
  @$pb.TagNumber(7)
  $core.List<$core.int> get senderIdentityPubkey => $_getN(6);
  @$pb.TagNumber(7)
  set senderIdentityPubkey($core.List<$core.int> value) => $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSenderIdentityPubkey() => $_has(6);
  @$pb.TagNumber(7)
  void clearSenderIdentityPubkey() => $_clearField(7);
}

class QueryHtlcRequest extends $pb.GeneratedMessage {
  factory QueryHtlcRequest({
    $core.Iterable<$core.List<$core.int>>? paymentHashes,
    $core.List<$core.int>? identityPublicKey,
    PreimageRequestStatus? status,
    $fixnum.Int64? limit,
    $fixnum.Int64? offset,
    $core.Iterable<$core.String>? transferIds,
    PreimageRequestRole? matchRole,
  }) {
    final result = create();
    if (paymentHashes != null) result.paymentHashes.addAll(paymentHashes);
    if (identityPublicKey != null) result.identityPublicKey = identityPublicKey;
    if (status != null) result.status = status;
    if (limit != null) result.limit = limit;
    if (offset != null) result.offset = offset;
    if (transferIds != null) result.transferIds.addAll(transferIds);
    if (matchRole != null) result.matchRole = matchRole;
    return result;
  }

  QueryHtlcRequest._();

  factory QueryHtlcRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryHtlcRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryHtlcRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..p<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'paymentHashes', $pb.PbFieldType.PY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'identityPublicKey', $pb.PbFieldType.OY)
    ..aE<PreimageRequestStatus>(3, _omitFieldNames ? '' : 'status',
        enumValues: PreimageRequestStatus.values)
    ..aInt64(4, _omitFieldNames ? '' : 'limit')
    ..aInt64(5, _omitFieldNames ? '' : 'offset')
    ..pPS(6, _omitFieldNames ? '' : 'transferIds')
    ..aE<PreimageRequestRole>(7, _omitFieldNames ? '' : 'matchRole',
        enumValues: PreimageRequestRole.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryHtlcRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryHtlcRequest copyWith(void Function(QueryHtlcRequest) updates) =>
      super.copyWith((message) => updates(message as QueryHtlcRequest))
          as QueryHtlcRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryHtlcRequest create() => QueryHtlcRequest._();
  @$core.override
  QueryHtlcRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryHtlcRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryHtlcRequest>(create);
  static QueryHtlcRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.List<$core.int>> get paymentHashes => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get identityPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set identityPublicKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdentityPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentityPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  PreimageRequestStatus get status => $_getN(2);
  @$pb.TagNumber(3)
  set status(PreimageRequestStatus value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get limit => $_getI64(3);
  @$pb.TagNumber(4)
  set limit($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearLimit() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get offset => $_getI64(4);
  @$pb.TagNumber(5)
  set offset($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOffset() => $_has(4);
  @$pb.TagNumber(5)
  void clearOffset() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get transferIds => $_getList(5);

  @$pb.TagNumber(7)
  PreimageRequestRole get matchRole => $_getN(6);
  @$pb.TagNumber(7)
  set matchRole(PreimageRequestRole value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasMatchRole() => $_has(6);
  @$pb.TagNumber(7)
  void clearMatchRole() => $_clearField(7);
}

class QueryHtlcResponse extends $pb.GeneratedMessage {
  factory QueryHtlcResponse({
    $core.Iterable<PreimageRequestWithTransfer>? preimageRequests,
    $fixnum.Int64? offset,
  }) {
    final result = create();
    if (preimageRequests != null)
      result.preimageRequests.addAll(preimageRequests);
    if (offset != null) result.offset = offset;
    return result;
  }

  QueryHtlcResponse._();

  factory QueryHtlcResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryHtlcResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryHtlcResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..pPM<PreimageRequestWithTransfer>(
        1, _omitFieldNames ? '' : 'preimageRequests',
        subBuilder: PreimageRequestWithTransfer.create)
    ..aInt64(2, _omitFieldNames ? '' : 'offset')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryHtlcResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryHtlcResponse copyWith(void Function(QueryHtlcResponse) updates) =>
      super.copyWith((message) => updates(message as QueryHtlcResponse))
          as QueryHtlcResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryHtlcResponse create() => QueryHtlcResponse._();
  @$core.override
  QueryHtlcResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryHtlcResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryHtlcResponse>(create);
  static QueryHtlcResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<PreimageRequestWithTransfer> get preimageRequests => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get offset => $_getI64(1);
  @$pb.TagNumber(2)
  set offset($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => $_clearField(2);
}

class ProvidePreimageRequest extends $pb.GeneratedMessage {
  factory ProvidePreimageRequest({
    $core.List<$core.int>? paymentHash,
    $core.List<$core.int>? preimage,
    $core.List<$core.int>? identityPublicKey,
  }) {
    final result = create();
    if (paymentHash != null) result.paymentHash = paymentHash;
    if (preimage != null) result.preimage = preimage;
    if (identityPublicKey != null) result.identityPublicKey = identityPublicKey;
    return result;
  }

  ProvidePreimageRequest._();

  factory ProvidePreimageRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProvidePreimageRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProvidePreimageRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'paymentHash', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'preimage', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'identityPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProvidePreimageRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProvidePreimageRequest copyWith(
          void Function(ProvidePreimageRequest) updates) =>
      super.copyWith((message) => updates(message as ProvidePreimageRequest))
          as ProvidePreimageRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProvidePreimageRequest create() => ProvidePreimageRequest._();
  @$core.override
  ProvidePreimageRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProvidePreimageRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProvidePreimageRequest>(create);
  static ProvidePreimageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get paymentHash => $_getN(0);
  @$pb.TagNumber(1)
  set paymentHash($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPaymentHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaymentHash() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get preimage => $_getN(1);
  @$pb.TagNumber(2)
  set preimage($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPreimage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreimage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get identityPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set identityPublicKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIdentityPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearIdentityPublicKey() => $_clearField(3);
}

class ProvidePreimageResponse extends $pb.GeneratedMessage {
  factory ProvidePreimageResponse({
    Transfer? transfer,
  }) {
    final result = create();
    if (transfer != null) result.transfer = transfer;
    return result;
  }

  ProvidePreimageResponse._();

  factory ProvidePreimageResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProvidePreimageResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProvidePreimageResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<Transfer>(1, _omitFieldNames ? '' : 'transfer',
        subBuilder: Transfer.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProvidePreimageResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProvidePreimageResponse copyWith(
          void Function(ProvidePreimageResponse) updates) =>
      super.copyWith((message) => updates(message as ProvidePreimageResponse))
          as ProvidePreimageResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProvidePreimageResponse create() => ProvidePreimageResponse._();
  @$core.override
  ProvidePreimageResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProvidePreimageResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProvidePreimageResponse>(create);
  static ProvidePreimageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Transfer get transfer => $_getN(0);
  @$pb.TagNumber(1)
  set transfer(Transfer value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransfer() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransfer() => $_clearField(1);
  @$pb.TagNumber(1)
  Transfer ensureTransfer() => $_ensure(0);
}

class QueryPreimageRequest extends $pb.GeneratedMessage {
  factory QueryPreimageRequest({
    $core.List<$core.int>? paymentHash,
    $core.List<$core.int>? receiverIdentityPubkey,
  }) {
    final result = create();
    if (paymentHash != null) result.paymentHash = paymentHash;
    if (receiverIdentityPubkey != null)
      result.receiverIdentityPubkey = receiverIdentityPubkey;
    return result;
  }

  QueryPreimageRequest._();

  factory QueryPreimageRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryPreimageRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryPreimageRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'paymentHash', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'receiverIdentityPubkey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryPreimageRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryPreimageRequest copyWith(void Function(QueryPreimageRequest) updates) =>
      super.copyWith((message) => updates(message as QueryPreimageRequest))
          as QueryPreimageRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryPreimageRequest create() => QueryPreimageRequest._();
  @$core.override
  QueryPreimageRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryPreimageRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryPreimageRequest>(create);
  static QueryPreimageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get paymentHash => $_getN(0);
  @$pb.TagNumber(1)
  set paymentHash($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPaymentHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaymentHash() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get receiverIdentityPubkey => $_getN(1);
  @$pb.TagNumber(2)
  set receiverIdentityPubkey($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReceiverIdentityPubkey() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiverIdentityPubkey() => $_clearField(2);
}

class QueryPreimageResponse extends $pb.GeneratedMessage {
  factory QueryPreimageResponse({
    $core.List<$core.int>? preimage,
  }) {
    final result = create();
    if (preimage != null) result.preimage = preimage;
    return result;
  }

  QueryPreimageResponse._();

  factory QueryPreimageResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryPreimageResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryPreimageResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'preimage', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryPreimageResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryPreimageResponse copyWith(
          void Function(QueryPreimageResponse) updates) =>
      super.copyWith((message) => updates(message as QueryPreimageResponse))
          as QueryPreimageResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryPreimageResponse create() => QueryPreimageResponse._();
  @$core.override
  QueryPreimageResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryPreimageResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryPreimageResponse>(create);
  static QueryPreimageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get preimage => $_getN(0);
  @$pb.TagNumber(1)
  set preimage($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPreimage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPreimage() => $_clearField(1);
}

class TreeNodeIds extends $pb.GeneratedMessage {
  factory TreeNodeIds({
    $core.Iterable<$core.String>? nodeIds,
  }) {
    final result = create();
    if (nodeIds != null) result.nodeIds.addAll(nodeIds);
    return result;
  }

  TreeNodeIds._();

  factory TreeNodeIds.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TreeNodeIds.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TreeNodeIds',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'nodeIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TreeNodeIds clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TreeNodeIds copyWith(void Function(TreeNodeIds) updates) =>
      super.copyWith((message) => updates(message as TreeNodeIds))
          as TreeNodeIds;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TreeNodeIds create() => TreeNodeIds._();
  @$core.override
  TreeNodeIds createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TreeNodeIds getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TreeNodeIds>(create);
  static TreeNodeIds? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get nodeIds => $_getList(0);
}

enum QueryNodesRequest_Source { ownerIdentityPubkey, nodeIds, notSet }

class QueryNodesRequest extends $pb.GeneratedMessage {
  factory QueryNodesRequest({
    $core.List<$core.int>? ownerIdentityPubkey,
    TreeNodeIds? nodeIds,
    $core.bool? includeParents,
    $fixnum.Int64? limit,
    $fixnum.Int64? offset,
    Network? network,
    $core.Iterable<TreeNodeStatus>? statuses,
  }) {
    final result = create();
    if (ownerIdentityPubkey != null)
      result.ownerIdentityPubkey = ownerIdentityPubkey;
    if (nodeIds != null) result.nodeIds = nodeIds;
    if (includeParents != null) result.includeParents = includeParents;
    if (limit != null) result.limit = limit;
    if (offset != null) result.offset = offset;
    if (network != null) result.network = network;
    if (statuses != null) result.statuses.addAll(statuses);
    return result;
  }

  QueryNodesRequest._();

  factory QueryNodesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryNodesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, QueryNodesRequest_Source>
      _QueryNodesRequest_SourceByTag = {
    1: QueryNodesRequest_Source.ownerIdentityPubkey,
    2: QueryNodesRequest_Source.nodeIds,
    0: QueryNodesRequest_Source.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryNodesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'ownerIdentityPubkey', $pb.PbFieldType.OY)
    ..aOM<TreeNodeIds>(2, _omitFieldNames ? '' : 'nodeIds',
        subBuilder: TreeNodeIds.create)
    ..aOB(3, _omitFieldNames ? '' : 'includeParents')
    ..aInt64(4, _omitFieldNames ? '' : 'limit')
    ..aInt64(5, _omitFieldNames ? '' : 'offset')
    ..aE<Network>(6, _omitFieldNames ? '' : 'network',
        enumValues: Network.values)
    ..pc<TreeNodeStatus>(
        7, _omitFieldNames ? '' : 'statuses', $pb.PbFieldType.KE,
        valueOf: TreeNodeStatus.valueOf,
        enumValues: TreeNodeStatus.values,
        defaultEnumValue: TreeNodeStatus.TREE_NODE_STATUS_CREATING)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryNodesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryNodesRequest copyWith(void Function(QueryNodesRequest) updates) =>
      super.copyWith((message) => updates(message as QueryNodesRequest))
          as QueryNodesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryNodesRequest create() => QueryNodesRequest._();
  @$core.override
  QueryNodesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryNodesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryNodesRequest>(create);
  static QueryNodesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  QueryNodesRequest_Source whichSource() =>
      _QueryNodesRequest_SourceByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearSource() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerIdentityPubkey => $_getN(0);
  @$pb.TagNumber(1)
  set ownerIdentityPubkey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerIdentityPubkey() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerIdentityPubkey() => $_clearField(1);

  @$pb.TagNumber(2)
  TreeNodeIds get nodeIds => $_getN(1);
  @$pb.TagNumber(2)
  set nodeIds(TreeNodeIds value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNodeIds() => $_has(1);
  @$pb.TagNumber(2)
  void clearNodeIds() => $_clearField(2);
  @$pb.TagNumber(2)
  TreeNodeIds ensureNodeIds() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get includeParents => $_getBF(2);
  @$pb.TagNumber(3)
  set includeParents($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIncludeParents() => $_has(2);
  @$pb.TagNumber(3)
  void clearIncludeParents() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get limit => $_getI64(3);
  @$pb.TagNumber(4)
  set limit($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearLimit() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get offset => $_getI64(4);
  @$pb.TagNumber(5)
  set offset($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOffset() => $_has(4);
  @$pb.TagNumber(5)
  void clearOffset() => $_clearField(5);

  @$pb.TagNumber(6)
  Network get network => $_getN(5);
  @$pb.TagNumber(6)
  set network(Network value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasNetwork() => $_has(5);
  @$pb.TagNumber(6)
  void clearNetwork() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbList<TreeNodeStatus> get statuses => $_getList(6);
}

class QueryNodesResponse extends $pb.GeneratedMessage {
  factory QueryNodesResponse({
    $core.Iterable<$core.MapEntry<$core.String, TreeNode>>? nodes,
    $fixnum.Int64? offset,
  }) {
    final result = create();
    if (nodes != null) result.nodes.addEntries(nodes);
    if (offset != null) result.offset = offset;
    return result;
  }

  QueryNodesResponse._();

  factory QueryNodesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryNodesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryNodesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..m<$core.String, TreeNode>(1, _omitFieldNames ? '' : 'nodes',
        entryClassName: 'QueryNodesResponse.NodesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: TreeNode.create,
        valueDefaultOrMaker: TreeNode.getDefault,
        packageName: const $pb.PackageName('spark'))
    ..aInt64(2, _omitFieldNames ? '' : 'offset')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryNodesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryNodesResponse copyWith(void Function(QueryNodesResponse) updates) =>
      super.copyWith((message) => updates(message as QueryNodesResponse))
          as QueryNodesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryNodesResponse create() => QueryNodesResponse._();
  @$core.override
  QueryNodesResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryNodesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryNodesResponse>(create);
  static QueryNodesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, TreeNode> get nodes => $_getMap(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get offset => $_getI64(1);
  @$pb.TagNumber(2)
  set offset($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => $_clearField(2);
}

class CancelTransferRequest extends $pb.GeneratedMessage {
  factory CancelTransferRequest({
    $core.String? transferId,
    $core.List<$core.int>? senderIdentityPublicKey,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (senderIdentityPublicKey != null)
      result.senderIdentityPublicKey = senderIdentityPublicKey;
    return result;
  }

  CancelTransferRequest._();

  factory CancelTransferRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CancelTransferRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelTransferRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'senderIdentityPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelTransferRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelTransferRequest copyWith(
          void Function(CancelTransferRequest) updates) =>
      super.copyWith((message) => updates(message as CancelTransferRequest))
          as CancelTransferRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelTransferRequest create() => CancelTransferRequest._();
  @$core.override
  CancelTransferRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CancelTransferRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelTransferRequest>(create);
  static CancelTransferRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get senderIdentityPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set senderIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSenderIdentityPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearSenderIdentityPublicKey() => $_clearField(2);
}

class CancelTransferResponse extends $pb.GeneratedMessage {
  factory CancelTransferResponse({
    Transfer? transfer,
  }) {
    final result = create();
    if (transfer != null) result.transfer = transfer;
    return result;
  }

  CancelTransferResponse._();

  factory CancelTransferResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CancelTransferResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelTransferResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<Transfer>(1, _omitFieldNames ? '' : 'transfer',
        subBuilder: Transfer.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelTransferResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelTransferResponse copyWith(
          void Function(CancelTransferResponse) updates) =>
      super.copyWith((message) => updates(message as CancelTransferResponse))
          as CancelTransferResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelTransferResponse create() => CancelTransferResponse._();
  @$core.override
  CancelTransferResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CancelTransferResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelTransferResponse>(create);
  static CancelTransferResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Transfer get transfer => $_getN(0);
  @$pb.TagNumber(1)
  set transfer(Transfer value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransfer() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransfer() => $_clearField(1);
  @$pb.TagNumber(1)
  Transfer ensureTransfer() => $_ensure(0);
}

/// *
///  Returns a list of addresses that can be used in express deposit flow.
///  Excludes static deposit addresses.
class QueryUnusedDepositAddressesRequest extends $pb.GeneratedMessage {
  factory QueryUnusedDepositAddressesRequest({
    $core.List<$core.int>? identityPublicKey,
    Network? network,
    $fixnum.Int64? limit,
    $fixnum.Int64? offset,
  }) {
    final result = create();
    if (identityPublicKey != null) result.identityPublicKey = identityPublicKey;
    if (network != null) result.network = network;
    if (limit != null) result.limit = limit;
    if (offset != null) result.offset = offset;
    return result;
  }

  QueryUnusedDepositAddressesRequest._();

  factory QueryUnusedDepositAddressesRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryUnusedDepositAddressesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryUnusedDepositAddressesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'identityPublicKey', $pb.PbFieldType.OY)
    ..aE<Network>(2, _omitFieldNames ? '' : 'network',
        enumValues: Network.values)
    ..aInt64(3, _omitFieldNames ? '' : 'limit')
    ..aInt64(4, _omitFieldNames ? '' : 'offset')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryUnusedDepositAddressesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryUnusedDepositAddressesRequest copyWith(
          void Function(QueryUnusedDepositAddressesRequest) updates) =>
      super.copyWith((message) =>
              updates(message as QueryUnusedDepositAddressesRequest))
          as QueryUnusedDepositAddressesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryUnusedDepositAddressesRequest create() =>
      QueryUnusedDepositAddressesRequest._();
  @$core.override
  QueryUnusedDepositAddressesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryUnusedDepositAddressesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryUnusedDepositAddressesRequest>(
          create);
  static QueryUnusedDepositAddressesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get identityPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set identityPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentityPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentityPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  Network get network => $_getN(1);
  @$pb.TagNumber(2)
  set network(Network value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNetwork() => $_has(1);
  @$pb.TagNumber(2)
  void clearNetwork() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get limit => $_getI64(2);
  @$pb.TagNumber(3)
  set limit($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimit() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get offset => $_getI64(3);
  @$pb.TagNumber(4)
  set offset($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOffset() => $_has(3);
  @$pb.TagNumber(4)
  void clearOffset() => $_clearField(4);
}

class QueryStaticDepositAddressesRequest extends $pb.GeneratedMessage {
  factory QueryStaticDepositAddressesRequest({
    $core.List<$core.int>? identityPublicKey,
    Network? network,
    $fixnum.Int64? limit,
    $fixnum.Int64? offset,
    $core.String? depositAddress,
    HashVariant? hashVariant,
  }) {
    final result = create();
    if (identityPublicKey != null) result.identityPublicKey = identityPublicKey;
    if (network != null) result.network = network;
    if (limit != null) result.limit = limit;
    if (offset != null) result.offset = offset;
    if (depositAddress != null) result.depositAddress = depositAddress;
    if (hashVariant != null) result.hashVariant = hashVariant;
    return result;
  }

  QueryStaticDepositAddressesRequest._();

  factory QueryStaticDepositAddressesRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryStaticDepositAddressesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryStaticDepositAddressesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'identityPublicKey', $pb.PbFieldType.OY)
    ..aE<Network>(2, _omitFieldNames ? '' : 'network',
        enumValues: Network.values)
    ..aInt64(4, _omitFieldNames ? '' : 'limit')
    ..aInt64(5, _omitFieldNames ? '' : 'offset')
    ..aOS(6, _omitFieldNames ? '' : 'depositAddress')
    ..aE<HashVariant>(7, _omitFieldNames ? '' : 'hashVariant',
        enumValues: HashVariant.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryStaticDepositAddressesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryStaticDepositAddressesRequest copyWith(
          void Function(QueryStaticDepositAddressesRequest) updates) =>
      super.copyWith((message) =>
              updates(message as QueryStaticDepositAddressesRequest))
          as QueryStaticDepositAddressesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryStaticDepositAddressesRequest create() =>
      QueryStaticDepositAddressesRequest._();
  @$core.override
  QueryStaticDepositAddressesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryStaticDepositAddressesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryStaticDepositAddressesRequest>(
          create);
  static QueryStaticDepositAddressesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get identityPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set identityPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentityPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentityPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  Network get network => $_getN(1);
  @$pb.TagNumber(2)
  set network(Network value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNetwork() => $_has(1);
  @$pb.TagNumber(2)
  void clearNetwork() => $_clearField(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get limit => $_getI64(2);
  @$pb.TagNumber(4)
  set limit($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(4)
  $core.bool hasLimit() => $_has(2);
  @$pb.TagNumber(4)
  void clearLimit() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get offset => $_getI64(3);
  @$pb.TagNumber(5)
  set offset($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(5)
  $core.bool hasOffset() => $_has(3);
  @$pb.TagNumber(5)
  void clearOffset() => $_clearField(5);

  /// Optional filter. When specified, only the DepositAddress with this address is returned.
  @$pb.TagNumber(6)
  $core.String get depositAddress => $_getSZ(4);
  @$pb.TagNumber(6)
  set depositAddress($core.String value) => $_setString(4, value);
  @$pb.TagNumber(6)
  $core.bool hasDepositAddress() => $_has(4);
  @$pb.TagNumber(6)
  void clearDepositAddress() => $_clearField(6);

  /// The hash variant to use for computing the proof of possession message hash.
  @$pb.TagNumber(7)
  HashVariant get hashVariant => $_getN(5);
  @$pb.TagNumber(7)
  set hashVariant(HashVariant value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasHashVariant() => $_has(5);
  @$pb.TagNumber(7)
  void clearHashVariant() => $_clearField(7);
}

class DepositAddressQueryResult extends $pb.GeneratedMessage {
  factory DepositAddressQueryResult({
    $core.String? depositAddress,
    $core.List<$core.int>? userSigningPublicKey,
    $core.List<$core.int>? verifyingPublicKey,
    $core.String? leafId,
    DepositAddressProof? proofOfPossession,
  }) {
    final result = create();
    if (depositAddress != null) result.depositAddress = depositAddress;
    if (userSigningPublicKey != null)
      result.userSigningPublicKey = userSigningPublicKey;
    if (verifyingPublicKey != null)
      result.verifyingPublicKey = verifyingPublicKey;
    if (leafId != null) result.leafId = leafId;
    if (proofOfPossession != null) result.proofOfPossession = proofOfPossession;
    return result;
  }

  DepositAddressQueryResult._();

  factory DepositAddressQueryResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DepositAddressQueryResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DepositAddressQueryResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'depositAddress')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'userSigningPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'verifyingPublicKey', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'leafId')
    ..aOM<DepositAddressProof>(5, _omitFieldNames ? '' : 'proofOfPossession',
        subBuilder: DepositAddressProof.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DepositAddressQueryResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DepositAddressQueryResult copyWith(
          void Function(DepositAddressQueryResult) updates) =>
      super.copyWith((message) => updates(message as DepositAddressQueryResult))
          as DepositAddressQueryResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DepositAddressQueryResult create() => DepositAddressQueryResult._();
  @$core.override
  DepositAddressQueryResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DepositAddressQueryResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DepositAddressQueryResult>(create);
  static DepositAddressQueryResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get depositAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set depositAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDepositAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearDepositAddress() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get userSigningPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set userSigningPublicKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserSigningPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserSigningPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get verifyingPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set verifyingPublicKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVerifyingPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearVerifyingPublicKey() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get leafId => $_getSZ(3);
  @$pb.TagNumber(4)
  set leafId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLeafId() => $_has(3);
  @$pb.TagNumber(4)
  void clearLeafId() => $_clearField(4);

  @$pb.TagNumber(5)
  DepositAddressProof get proofOfPossession => $_getN(4);
  @$pb.TagNumber(5)
  set proofOfPossession(DepositAddressProof value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasProofOfPossession() => $_has(4);
  @$pb.TagNumber(5)
  void clearProofOfPossession() => $_clearField(5);
  @$pb.TagNumber(5)
  DepositAddressProof ensureProofOfPossession() => $_ensure(4);
}

class QueryUnusedDepositAddressesResponse extends $pb.GeneratedMessage {
  factory QueryUnusedDepositAddressesResponse({
    $core.Iterable<DepositAddressQueryResult>? depositAddresses,
    $fixnum.Int64? offset,
  }) {
    final result = create();
    if (depositAddresses != null)
      result.depositAddresses.addAll(depositAddresses);
    if (offset != null) result.offset = offset;
    return result;
  }

  QueryUnusedDepositAddressesResponse._();

  factory QueryUnusedDepositAddressesResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryUnusedDepositAddressesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryUnusedDepositAddressesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..pPM<DepositAddressQueryResult>(
        1, _omitFieldNames ? '' : 'depositAddresses',
        subBuilder: DepositAddressQueryResult.create)
    ..aInt64(2, _omitFieldNames ? '' : 'offset')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryUnusedDepositAddressesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryUnusedDepositAddressesResponse copyWith(
          void Function(QueryUnusedDepositAddressesResponse) updates) =>
      super.copyWith((message) =>
              updates(message as QueryUnusedDepositAddressesResponse))
          as QueryUnusedDepositAddressesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryUnusedDepositAddressesResponse create() =>
      QueryUnusedDepositAddressesResponse._();
  @$core.override
  QueryUnusedDepositAddressesResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryUnusedDepositAddressesResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          QueryUnusedDepositAddressesResponse>(create);
  static QueryUnusedDepositAddressesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<DepositAddressQueryResult> get depositAddresses => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get offset => $_getI64(1);
  @$pb.TagNumber(2)
  set offset($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => $_clearField(2);
}

class QueryStaticDepositAddressesResponse extends $pb.GeneratedMessage {
  factory QueryStaticDepositAddressesResponse({
    $core.Iterable<DepositAddressQueryResult>? depositAddresses,
  }) {
    final result = create();
    if (depositAddresses != null)
      result.depositAddresses.addAll(depositAddresses);
    return result;
  }

  QueryStaticDepositAddressesResponse._();

  factory QueryStaticDepositAddressesResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryStaticDepositAddressesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryStaticDepositAddressesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..pPM<DepositAddressQueryResult>(
        1, _omitFieldNames ? '' : 'depositAddresses',
        subBuilder: DepositAddressQueryResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryStaticDepositAddressesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryStaticDepositAddressesResponse copyWith(
          void Function(QueryStaticDepositAddressesResponse) updates) =>
      super.copyWith((message) =>
              updates(message as QueryStaticDepositAddressesResponse))
          as QueryStaticDepositAddressesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryStaticDepositAddressesResponse create() =>
      QueryStaticDepositAddressesResponse._();
  @$core.override
  QueryStaticDepositAddressesResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryStaticDepositAddressesResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          QueryStaticDepositAddressesResponse>(create);
  static QueryStaticDepositAddressesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<DepositAddressQueryResult> get depositAddresses => $_getList(0);
}

class QueryBalanceRequest extends $pb.GeneratedMessage {
  factory QueryBalanceRequest({
    $core.List<$core.int>? identityPublicKey,
    Network? network,
  }) {
    final result = create();
    if (identityPublicKey != null) result.identityPublicKey = identityPublicKey;
    if (network != null) result.network = network;
    return result;
  }

  QueryBalanceRequest._();

  factory QueryBalanceRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryBalanceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryBalanceRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'identityPublicKey', $pb.PbFieldType.OY)
    ..aE<Network>(2, _omitFieldNames ? '' : 'network',
        enumValues: Network.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryBalanceRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryBalanceRequest copyWith(void Function(QueryBalanceRequest) updates) =>
      super.copyWith((message) => updates(message as QueryBalanceRequest))
          as QueryBalanceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryBalanceRequest create() => QueryBalanceRequest._();
  @$core.override
  QueryBalanceRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryBalanceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryBalanceRequest>(create);
  static QueryBalanceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get identityPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set identityPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentityPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentityPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  Network get network => $_getN(1);
  @$pb.TagNumber(2)
  set network(Network value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNetwork() => $_has(1);
  @$pb.TagNumber(2)
  void clearNetwork() => $_clearField(2);
}

class QueryBalanceResponse extends $pb.GeneratedMessage {
  factory QueryBalanceResponse({
    $fixnum.Int64? balance,
    $core.Iterable<$core.MapEntry<$core.String, $fixnum.Int64>>? nodeBalances,
  }) {
    final result = create();
    if (balance != null) result.balance = balance;
    if (nodeBalances != null) result.nodeBalances.addEntries(nodeBalances);
    return result;
  }

  QueryBalanceResponse._();

  factory QueryBalanceResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryBalanceResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryBalanceResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'balance', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..m<$core.String, $fixnum.Int64>(2, _omitFieldNames ? '' : 'nodeBalances',
        entryClassName: 'QueryBalanceResponse.NodeBalancesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OU6,
        packageName: const $pb.PackageName('spark'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryBalanceResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryBalanceResponse copyWith(void Function(QueryBalanceResponse) updates) =>
      super.copyWith((message) => updates(message as QueryBalanceResponse))
          as QueryBalanceResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryBalanceResponse create() => QueryBalanceResponse._();
  @$core.override
  QueryBalanceResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryBalanceResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryBalanceResponse>(create);
  static QueryBalanceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get balance => $_getI64(0);
  @$pb.TagNumber(1)
  set balance($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBalance() => $_has(0);
  @$pb.TagNumber(1)
  void clearBalance() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $fixnum.Int64> get nodeBalances => $_getMap(1);
}

class SparkAddress extends $pb.GeneratedMessage {
  factory SparkAddress({
    $core.List<$core.int>? identityPublicKey,
    SparkInvoiceFields? sparkInvoiceFields,
    $core.List<$core.int>? signature,
  }) {
    final result = create();
    if (identityPublicKey != null) result.identityPublicKey = identityPublicKey;
    if (sparkInvoiceFields != null)
      result.sparkInvoiceFields = sparkInvoiceFields;
    if (signature != null) result.signature = signature;
    return result;
  }

  SparkAddress._();

  factory SparkAddress.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SparkAddress.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SparkAddress',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'identityPublicKey', $pb.PbFieldType.OY)
    ..aOM<SparkInvoiceFields>(2, _omitFieldNames ? '' : 'sparkInvoiceFields',
        subBuilder: SparkInvoiceFields.create)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SparkAddress clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SparkAddress copyWith(void Function(SparkAddress) updates) =>
      super.copyWith((message) => updates(message as SparkAddress))
          as SparkAddress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SparkAddress create() => SparkAddress._();
  @$core.override
  SparkAddress createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SparkAddress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SparkAddress>(create);
  static SparkAddress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get identityPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set identityPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentityPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentityPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  SparkInvoiceFields get sparkInvoiceFields => $_getN(1);
  @$pb.TagNumber(2)
  set sparkInvoiceFields(SparkInvoiceFields value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSparkInvoiceFields() => $_has(1);
  @$pb.TagNumber(2)
  void clearSparkInvoiceFields() => $_clearField(2);
  @$pb.TagNumber(2)
  SparkInvoiceFields ensureSparkInvoiceFields() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get signature => $_getN(2);
  @$pb.TagNumber(3)
  set signature($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearSignature() => $_clearField(3);
}

enum SparkInvoiceFields_PaymentType { tokensPayment, satsPayment, notSet }

class SparkInvoiceFields extends $pb.GeneratedMessage {
  factory SparkInvoiceFields({
    $core.int? version,
    $core.List<$core.int>? id,
    TokensPayment? tokensPayment,
    SatsPayment? satsPayment,
    $core.String? memo,
    $core.List<$core.int>? senderPublicKey,
    $3.Timestamp? expiryTime,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (id != null) result.id = id;
    if (tokensPayment != null) result.tokensPayment = tokensPayment;
    if (satsPayment != null) result.satsPayment = satsPayment;
    if (memo != null) result.memo = memo;
    if (senderPublicKey != null) result.senderPublicKey = senderPublicKey;
    if (expiryTime != null) result.expiryTime = expiryTime;
    return result;
  }

  SparkInvoiceFields._();

  factory SparkInvoiceFields.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SparkInvoiceFields.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SparkInvoiceFields_PaymentType>
      _SparkInvoiceFields_PaymentTypeByTag = {
    3: SparkInvoiceFields_PaymentType.tokensPayment,
    4: SparkInvoiceFields_PaymentType.satsPayment,
    0: SparkInvoiceFields_PaymentType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SparkInvoiceFields',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..aI(1, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..aOM<TokensPayment>(3, _omitFieldNames ? '' : 'tokensPayment',
        subBuilder: TokensPayment.create)
    ..aOM<SatsPayment>(4, _omitFieldNames ? '' : 'satsPayment',
        subBuilder: SatsPayment.create)
    ..aOS(5, _omitFieldNames ? '' : 'memo')
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'senderPublicKey', $pb.PbFieldType.OY)
    ..aOM<$3.Timestamp>(7, _omitFieldNames ? '' : 'expiryTime',
        subBuilder: $3.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SparkInvoiceFields clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SparkInvoiceFields copyWith(void Function(SparkInvoiceFields) updates) =>
      super.copyWith((message) => updates(message as SparkInvoiceFields))
          as SparkInvoiceFields;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SparkInvoiceFields create() => SparkInvoiceFields._();
  @$core.override
  SparkInvoiceFields createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SparkInvoiceFields getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SparkInvoiceFields>(create);
  static SparkInvoiceFields? _defaultInstance;

  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  SparkInvoiceFields_PaymentType whichPaymentType() =>
      _SparkInvoiceFields_PaymentTypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearPaymentType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get id => $_getN(1);
  @$pb.TagNumber(2)
  set id($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);

  @$pb.TagNumber(3)
  TokensPayment get tokensPayment => $_getN(2);
  @$pb.TagNumber(3)
  set tokensPayment(TokensPayment value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTokensPayment() => $_has(2);
  @$pb.TagNumber(3)
  void clearTokensPayment() => $_clearField(3);
  @$pb.TagNumber(3)
  TokensPayment ensureTokensPayment() => $_ensure(2);

  @$pb.TagNumber(4)
  SatsPayment get satsPayment => $_getN(3);
  @$pb.TagNumber(4)
  set satsPayment(SatsPayment value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasSatsPayment() => $_has(3);
  @$pb.TagNumber(4)
  void clearSatsPayment() => $_clearField(4);
  @$pb.TagNumber(4)
  SatsPayment ensureSatsPayment() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get memo => $_getSZ(4);
  @$pb.TagNumber(5)
  set memo($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMemo() => $_has(4);
  @$pb.TagNumber(5)
  void clearMemo() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get senderPublicKey => $_getN(5);
  @$pb.TagNumber(6)
  set senderPublicKey($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasSenderPublicKey() => $_has(5);
  @$pb.TagNumber(6)
  void clearSenderPublicKey() => $_clearField(6);

  @$pb.TagNumber(7)
  $3.Timestamp get expiryTime => $_getN(6);
  @$pb.TagNumber(7)
  set expiryTime($3.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasExpiryTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearExpiryTime() => $_clearField(7);
  @$pb.TagNumber(7)
  $3.Timestamp ensureExpiryTime() => $_ensure(6);
}

class SatsPayment extends $pb.GeneratedMessage {
  factory SatsPayment({
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (amount != null) result.amount = amount;
    return result;
  }

  SatsPayment._();

  factory SatsPayment.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SatsPayment.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SatsPayment',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SatsPayment clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SatsPayment copyWith(void Function(SatsPayment) updates) =>
      super.copyWith((message) => updates(message as SatsPayment))
          as SatsPayment;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SatsPayment create() => SatsPayment._();
  @$core.override
  SatsPayment createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SatsPayment getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SatsPayment>(create);
  static SatsPayment? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => $_clearField(1);
}

class TokensPayment extends $pb.GeneratedMessage {
  factory TokensPayment({
    $core.List<$core.int>? tokenIdentifier,
    $core.List<$core.int>? amount,
  }) {
    final result = create();
    if (tokenIdentifier != null) result.tokenIdentifier = tokenIdentifier;
    if (amount != null) result.amount = amount;
    return result;
  }

  TokensPayment._();

  factory TokensPayment.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokensPayment.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokensPayment',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'tokenIdentifier', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokensPayment clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokensPayment copyWith(void Function(TokensPayment) updates) =>
      super.copyWith((message) => updates(message as TokensPayment))
          as TokensPayment;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokensPayment create() => TokensPayment._();
  @$core.override
  TokensPayment createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokensPayment getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokensPayment>(create);
  static TokensPayment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get tokenIdentifier => $_getN(0);
  @$pb.TagNumber(1)
  set tokenIdentifier($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTokenIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearTokenIdentifier() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get amount => $_getN(1);
  @$pb.TagNumber(2)
  set amount($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);
}

class InitiateStaticDepositUtxoRefundRequest extends $pb.GeneratedMessage {
  factory InitiateStaticDepositUtxoRefundRequest({
    UTXO? onChainUtxo,
    SigningJob? refundTxSigningJob,
    $core.List<$core.int>? userSignature,
    HashVariant? hashVariant,
  }) {
    final result = create();
    if (onChainUtxo != null) result.onChainUtxo = onChainUtxo;
    if (refundTxSigningJob != null)
      result.refundTxSigningJob = refundTxSigningJob;
    if (userSignature != null) result.userSignature = userSignature;
    if (hashVariant != null) result.hashVariant = hashVariant;
    return result;
  }

  InitiateStaticDepositUtxoRefundRequest._();

  factory InitiateStaticDepositUtxoRefundRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitiateStaticDepositUtxoRefundRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitiateStaticDepositUtxoRefundRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<UTXO>(1, _omitFieldNames ? '' : 'onChainUtxo',
        subBuilder: UTXO.create)
    ..aOM<SigningJob>(3, _omitFieldNames ? '' : 'refundTxSigningJob',
        subBuilder: SigningJob.create)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'userSignature', $pb.PbFieldType.OY)
    ..aE<HashVariant>(5, _omitFieldNames ? '' : 'hashVariant',
        enumValues: HashVariant.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateStaticDepositUtxoRefundRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateStaticDepositUtxoRefundRequest copyWith(
          void Function(InitiateStaticDepositUtxoRefundRequest) updates) =>
      super.copyWith((message) =>
              updates(message as InitiateStaticDepositUtxoRefundRequest))
          as InitiateStaticDepositUtxoRefundRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitiateStaticDepositUtxoRefundRequest create() =>
      InitiateStaticDepositUtxoRefundRequest._();
  @$core.override
  InitiateStaticDepositUtxoRefundRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InitiateStaticDepositUtxoRefundRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          InitiateStaticDepositUtxoRefundRequest>(create);
  static InitiateStaticDepositUtxoRefundRequest? _defaultInstance;

  @$pb.TagNumber(1)
  UTXO get onChainUtxo => $_getN(0);
  @$pb.TagNumber(1)
  set onChainUtxo(UTXO value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOnChainUtxo() => $_has(0);
  @$pb.TagNumber(1)
  void clearOnChainUtxo() => $_clearField(1);
  @$pb.TagNumber(1)
  UTXO ensureOnChainUtxo() => $_ensure(0);

  /// A package that is used for signing L1 Bitcoin transactions using FROST.
  /// SE consumes it to return SigningResult structure, that is used by the user to
  /// construct the final signature for the refund Bitcoin transaction.
  @$pb.TagNumber(3)
  SigningJob get refundTxSigningJob => $_getN(1);
  @$pb.TagNumber(3)
  set refundTxSigningJob(SigningJob value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRefundTxSigningJob() => $_has(1);
  @$pb.TagNumber(3)
  void clearRefundTxSigningJob() => $_clearField(3);
  @$pb.TagNumber(3)
  SigningJob ensureRefundTxSigningJob() => $_ensure(1);

  /// Signature of a user statement that authorises the SE to initiate a static
  /// deposit utxo refund to the user.
  ///
  /// The user statement is constructed by concatenating the following fields in order:
  /// 1. Action name: "claim_static_deposit" (UTF-8 string)
  /// 2. Network: lowercase network name (e.g., "bitcoin", "testnet") (UTF-8 string)
  /// 3. Transaction ID: hex-encoded UTXO transaction ID (UTF-8 string)
  /// 4. Output index: UTXO output index (vout) as 4-byte unsigned integer (little-endian)
  /// 5. Request type: 2 for refund (1-byte unsigned integer, little-endian)
  /// 6. Credit amount: amount of satoshis to credit as 8-byte unsigned integer (little-endian)
  /// 7. Signing payload: sighash of spend transaction (UTF-8 string)
  ///
  /// The concatenated payload is then hashed with SHA-256, and the resulting hash
  /// is signed using ECDSA with the user's identity private key to produce this signature.
  @$pb.TagNumber(4)
  $core.List<$core.int> get userSignature => $_getN(2);
  @$pb.TagNumber(4)
  set userSignature($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(4)
  $core.bool hasUserSignature() => $_has(2);
  @$pb.TagNumber(4)
  void clearUserSignature() => $_clearField(4);

  /// Optional: which hash variant was used to create user_signature.
  @$pb.TagNumber(5)
  HashVariant get hashVariant => $_getN(3);
  @$pb.TagNumber(5)
  set hashVariant(HashVariant value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasHashVariant() => $_has(3);
  @$pb.TagNumber(5)
  void clearHashVariant() => $_clearField(5);
}

class InitiateStaticDepositUtxoRefundResponse extends $pb.GeneratedMessage {
  factory InitiateStaticDepositUtxoRefundResponse({
    SigningResult? refundTxSigningResult,
    DepositAddressQueryResult? depositAddress,
  }) {
    final result = create();
    if (refundTxSigningResult != null)
      result.refundTxSigningResult = refundTxSigningResult;
    if (depositAddress != null) result.depositAddress = depositAddress;
    return result;
  }

  InitiateStaticDepositUtxoRefundResponse._();

  factory InitiateStaticDepositUtxoRefundResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitiateStaticDepositUtxoRefundResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitiateStaticDepositUtxoRefundResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<SigningResult>(1, _omitFieldNames ? '' : 'refundTxSigningResult',
        subBuilder: SigningResult.create)
    ..aOM<DepositAddressQueryResult>(2, _omitFieldNames ? '' : 'depositAddress',
        subBuilder: DepositAddressQueryResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateStaticDepositUtxoRefundResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateStaticDepositUtxoRefundResponse copyWith(
          void Function(InitiateStaticDepositUtxoRefundResponse) updates) =>
      super.copyWith((message) =>
              updates(message as InitiateStaticDepositUtxoRefundResponse))
          as InitiateStaticDepositUtxoRefundResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitiateStaticDepositUtxoRefundResponse create() =>
      InitiateStaticDepositUtxoRefundResponse._();
  @$core.override
  InitiateStaticDepositUtxoRefundResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InitiateStaticDepositUtxoRefundResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          InitiateStaticDepositUtxoRefundResponse>(create);
  static InitiateStaticDepositUtxoRefundResponse? _defaultInstance;

  /// The FROST signing results which must be aggregated by the user to complete signing
  @$pb.TagNumber(1)
  SigningResult get refundTxSigningResult => $_getN(0);
  @$pb.TagNumber(1)
  set refundTxSigningResult(SigningResult value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRefundTxSigningResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefundTxSigningResult() => $_clearField(1);
  @$pb.TagNumber(1)
  SigningResult ensureRefundTxSigningResult() => $_ensure(0);

  @$pb.TagNumber(2)
  DepositAddressQueryResult get depositAddress => $_getN(1);
  @$pb.TagNumber(2)
  set depositAddress(DepositAddressQueryResult value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDepositAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearDepositAddress() => $_clearField(2);
  @$pb.TagNumber(2)
  DepositAddressQueryResult ensureDepositAddress() => $_ensure(1);
}

enum InitiateUtxoSwapRequest_Amount { creditAmountSats, maxFeeSats, notSet }

class InitiateUtxoSwapRequest extends $pb.GeneratedMessage {
  factory InitiateUtxoSwapRequest({
    UTXO? onChainUtxo,
    UtxoSwapRequestType? requestType,
    $fixnum.Int64? creditAmountSats,
    $fixnum.Int64? maxFeeSats,
    $core.List<$core.int>? sspSignature,
    $core.List<$core.int>? userSignature,
    StartTransferRequest? transfer,
    SigningJob? spendTxSigningJob,
  }) {
    final result = create();
    if (onChainUtxo != null) result.onChainUtxo = onChainUtxo;
    if (requestType != null) result.requestType = requestType;
    if (creditAmountSats != null) result.creditAmountSats = creditAmountSats;
    if (maxFeeSats != null) result.maxFeeSats = maxFeeSats;
    if (sspSignature != null) result.sspSignature = sspSignature;
    if (userSignature != null) result.userSignature = userSignature;
    if (transfer != null) result.transfer = transfer;
    if (spendTxSigningJob != null) result.spendTxSigningJob = spendTxSigningJob;
    return result;
  }

  InitiateUtxoSwapRequest._();

  factory InitiateUtxoSwapRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitiateUtxoSwapRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, InitiateUtxoSwapRequest_Amount>
      _InitiateUtxoSwapRequest_AmountByTag = {
    3: InitiateUtxoSwapRequest_Amount.creditAmountSats,
    4: InitiateUtxoSwapRequest_Amount.maxFeeSats,
    0: InitiateUtxoSwapRequest_Amount.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitiateUtxoSwapRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..aOM<UTXO>(1, _omitFieldNames ? '' : 'onChainUtxo',
        subBuilder: UTXO.create)
    ..aE<UtxoSwapRequestType>(2, _omitFieldNames ? '' : 'requestType',
        enumValues: UtxoSwapRequestType.values)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'creditAmountSats', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'maxFeeSats', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'sspSignature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'userSignature', $pb.PbFieldType.OY)
    ..aOM<StartTransferRequest>(7, _omitFieldNames ? '' : 'transfer',
        subBuilder: StartTransferRequest.create)
    ..aOM<SigningJob>(8, _omitFieldNames ? '' : 'spendTxSigningJob',
        subBuilder: SigningJob.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateUtxoSwapRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateUtxoSwapRequest copyWith(
          void Function(InitiateUtxoSwapRequest) updates) =>
      super.copyWith((message) => updates(message as InitiateUtxoSwapRequest))
          as InitiateUtxoSwapRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitiateUtxoSwapRequest create() => InitiateUtxoSwapRequest._();
  @$core.override
  InitiateUtxoSwapRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InitiateUtxoSwapRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InitiateUtxoSwapRequest>(create);
  static InitiateUtxoSwapRequest? _defaultInstance;

  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  InitiateUtxoSwapRequest_Amount whichAmount() =>
      _InitiateUtxoSwapRequest_AmountByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearAmount() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  UTXO get onChainUtxo => $_getN(0);
  @$pb.TagNumber(1)
  set onChainUtxo(UTXO value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOnChainUtxo() => $_has(0);
  @$pb.TagNumber(1)
  void clearOnChainUtxo() => $_clearField(1);
  @$pb.TagNumber(1)
  UTXO ensureOnChainUtxo() => $_ensure(0);

  @$pb.TagNumber(2)
  UtxoSwapRequestType get requestType => $_getN(1);
  @$pb.TagNumber(2)
  set requestType(UtxoSwapRequestType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRequestType() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequestType() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get creditAmountSats => $_getI64(2);
  @$pb.TagNumber(3)
  set creditAmountSats($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCreditAmountSats() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreditAmountSats() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get maxFeeSats => $_getI64(3);
  @$pb.TagNumber(4)
  set maxFeeSats($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMaxFeeSats() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxFeeSats() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get sspSignature => $_getN(4);
  @$pb.TagNumber(5)
  set sspSignature($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSspSignature() => $_has(4);
  @$pb.TagNumber(5)
  void clearSspSignature() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get userSignature => $_getN(5);
  @$pb.TagNumber(6)
  set userSignature($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasUserSignature() => $_has(5);
  @$pb.TagNumber(6)
  void clearUserSignature() => $_clearField(6);

  @$pb.TagNumber(7)
  StartTransferRequest get transfer => $_getN(6);
  @$pb.TagNumber(7)
  set transfer(StartTransferRequest value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasTransfer() => $_has(6);
  @$pb.TagNumber(7)
  void clearTransfer() => $_clearField(7);
  @$pb.TagNumber(7)
  StartTransferRequest ensureTransfer() => $_ensure(6);

  @$pb.TagNumber(8)
  SigningJob get spendTxSigningJob => $_getN(7);
  @$pb.TagNumber(8)
  set spendTxSigningJob(SigningJob value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasSpendTxSigningJob() => $_has(7);
  @$pb.TagNumber(8)
  void clearSpendTxSigningJob() => $_clearField(8);
  @$pb.TagNumber(8)
  SigningJob ensureSpendTxSigningJob() => $_ensure(7);
}

class InitiateUtxoSwapResponse extends $pb.GeneratedMessage {
  factory InitiateUtxoSwapResponse({
    SigningResult? spendTxSigningResult,
    Transfer? transfer,
    DepositAddressQueryResult? depositAddress,
  }) {
    final result = create();
    if (spendTxSigningResult != null)
      result.spendTxSigningResult = spendTxSigningResult;
    if (transfer != null) result.transfer = transfer;
    if (depositAddress != null) result.depositAddress = depositAddress;
    return result;
  }

  InitiateUtxoSwapResponse._();

  factory InitiateUtxoSwapResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitiateUtxoSwapResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitiateUtxoSwapResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<SigningResult>(1, _omitFieldNames ? '' : 'spendTxSigningResult',
        subBuilder: SigningResult.create)
    ..aOM<Transfer>(2, _omitFieldNames ? '' : 'transfer',
        subBuilder: Transfer.create)
    ..aOM<DepositAddressQueryResult>(3, _omitFieldNames ? '' : 'depositAddress',
        subBuilder: DepositAddressQueryResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateUtxoSwapResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateUtxoSwapResponse copyWith(
          void Function(InitiateUtxoSwapResponse) updates) =>
      super.copyWith((message) => updates(message as InitiateUtxoSwapResponse))
          as InitiateUtxoSwapResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitiateUtxoSwapResponse create() => InitiateUtxoSwapResponse._();
  @$core.override
  InitiateUtxoSwapResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InitiateUtxoSwapResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InitiateUtxoSwapResponse>(create);
  static InitiateUtxoSwapResponse? _defaultInstance;

  @$pb.TagNumber(1)
  SigningResult get spendTxSigningResult => $_getN(0);
  @$pb.TagNumber(1)
  set spendTxSigningResult(SigningResult value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSpendTxSigningResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearSpendTxSigningResult() => $_clearField(1);
  @$pb.TagNumber(1)
  SigningResult ensureSpendTxSigningResult() => $_ensure(0);

  @$pb.TagNumber(2)
  Transfer get transfer => $_getN(1);
  @$pb.TagNumber(2)
  set transfer(Transfer value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTransfer() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransfer() => $_clearField(2);
  @$pb.TagNumber(2)
  Transfer ensureTransfer() => $_ensure(1);

  @$pb.TagNumber(3)
  DepositAddressQueryResult get depositAddress => $_getN(2);
  @$pb.TagNumber(3)
  set depositAddress(DepositAddressQueryResult value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDepositAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearDepositAddress() => $_clearField(3);
  @$pb.TagNumber(3)
  DepositAddressQueryResult ensureDepositAddress() => $_ensure(2);
}

class ExitingTree extends $pb.GeneratedMessage {
  factory ExitingTree({
    $core.String? treeId,
    $2.SigningCommitment? userSigningCommitment,
    $core.int? vin,
  }) {
    final result = create();
    if (treeId != null) result.treeId = treeId;
    if (userSigningCommitment != null)
      result.userSigningCommitment = userSigningCommitment;
    if (vin != null) result.vin = vin;
    return result;
  }

  ExitingTree._();

  factory ExitingTree.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExitingTree.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExitingTree',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'treeId')
    ..aOM<$2.SigningCommitment>(
        2, _omitFieldNames ? '' : 'userSigningCommitment',
        subBuilder: $2.SigningCommitment.create)
    ..aI(3, _omitFieldNames ? '' : 'vin', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExitingTree clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExitingTree copyWith(void Function(ExitingTree) updates) =>
      super.copyWith((message) => updates(message as ExitingTree))
          as ExitingTree;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExitingTree create() => ExitingTree._();
  @$core.override
  ExitingTree createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExitingTree getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExitingTree>(create);
  static ExitingTree? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get treeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set treeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTreeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTreeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $2.SigningCommitment get userSigningCommitment => $_getN(1);
  @$pb.TagNumber(2)
  set userSigningCommitment($2.SigningCommitment value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUserSigningCommitment() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserSigningCommitment() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.SigningCommitment ensureUserSigningCommitment() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get vin => $_getIZ(2);
  @$pb.TagNumber(3)
  set vin($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVin() => $_has(2);
  @$pb.TagNumber(3)
  void clearVin() => $_clearField(3);
}

class ExitSingleNodeTreeSigningResult extends $pb.GeneratedMessage {
  factory ExitSingleNodeTreeSigningResult({
    $core.String? treeId,
    SigningResult? signingResult,
    $core.List<$core.int>? verifyingKey,
  }) {
    final result = create();
    if (treeId != null) result.treeId = treeId;
    if (signingResult != null) result.signingResult = signingResult;
    if (verifyingKey != null) result.verifyingKey = verifyingKey;
    return result;
  }

  ExitSingleNodeTreeSigningResult._();

  factory ExitSingleNodeTreeSigningResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExitSingleNodeTreeSigningResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExitSingleNodeTreeSigningResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'treeId')
    ..aOM<SigningResult>(2, _omitFieldNames ? '' : 'signingResult',
        subBuilder: SigningResult.create)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'verifyingKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExitSingleNodeTreeSigningResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExitSingleNodeTreeSigningResult copyWith(
          void Function(ExitSingleNodeTreeSigningResult) updates) =>
      super.copyWith(
              (message) => updates(message as ExitSingleNodeTreeSigningResult))
          as ExitSingleNodeTreeSigningResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExitSingleNodeTreeSigningResult create() =>
      ExitSingleNodeTreeSigningResult._();
  @$core.override
  ExitSingleNodeTreeSigningResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExitSingleNodeTreeSigningResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExitSingleNodeTreeSigningResult>(
          create);
  static ExitSingleNodeTreeSigningResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get treeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set treeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTreeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTreeId() => $_clearField(1);

  @$pb.TagNumber(2)
  SigningResult get signingResult => $_getN(1);
  @$pb.TagNumber(2)
  set signingResult(SigningResult value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSigningResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearSigningResult() => $_clearField(2);
  @$pb.TagNumber(2)
  SigningResult ensureSigningResult() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get verifyingKey => $_getN(2);
  @$pb.TagNumber(3)
  set verifyingKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVerifyingKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearVerifyingKey() => $_clearField(3);
}

class BitcoinTransactionOutput extends $pb.GeneratedMessage {
  factory BitcoinTransactionOutput({
    $fixnum.Int64? value,
    $core.List<$core.int>? pkScript,
  }) {
    final result = create();
    if (value != null) result.value = value;
    if (pkScript != null) result.pkScript = pkScript;
    return result;
  }

  BitcoinTransactionOutput._();

  factory BitcoinTransactionOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BitcoinTransactionOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BitcoinTransactionOutput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'value')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'pkScript', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BitcoinTransactionOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BitcoinTransactionOutput copyWith(
          void Function(BitcoinTransactionOutput) updates) =>
      super.copyWith((message) => updates(message as BitcoinTransactionOutput))
          as BitcoinTransactionOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BitcoinTransactionOutput create() => BitcoinTransactionOutput._();
  @$core.override
  BitcoinTransactionOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BitcoinTransactionOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BitcoinTransactionOutput>(create);
  static BitcoinTransactionOutput? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get value => $_getI64(0);
  @$pb.TagNumber(1)
  set value($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get pkScript => $_getN(1);
  @$pb.TagNumber(2)
  set pkScript($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPkScript() => $_has(1);
  @$pb.TagNumber(2)
  void clearPkScript() => $_clearField(2);
}

class ExitSingleNodeTreesRequest extends $pb.GeneratedMessage {
  factory ExitSingleNodeTreesRequest({
    $core.List<$core.int>? ownerIdentityPublicKey,
    $core.Iterable<ExitingTree>? exitingTrees,
    $core.List<$core.int>? rawTx,
    $core.Iterable<BitcoinTransactionOutput>? previousOutputs,
  }) {
    final result = create();
    if (ownerIdentityPublicKey != null)
      result.ownerIdentityPublicKey = ownerIdentityPublicKey;
    if (exitingTrees != null) result.exitingTrees.addAll(exitingTrees);
    if (rawTx != null) result.rawTx = rawTx;
    if (previousOutputs != null) result.previousOutputs.addAll(previousOutputs);
    return result;
  }

  ExitSingleNodeTreesRequest._();

  factory ExitSingleNodeTreesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExitSingleNodeTreesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExitSingleNodeTreesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'ownerIdentityPublicKey', $pb.PbFieldType.OY)
    ..pPM<ExitingTree>(2, _omitFieldNames ? '' : 'exitingTrees',
        subBuilder: ExitingTree.create)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'rawTx', $pb.PbFieldType.OY)
    ..pPM<BitcoinTransactionOutput>(4, _omitFieldNames ? '' : 'previousOutputs',
        subBuilder: BitcoinTransactionOutput.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExitSingleNodeTreesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExitSingleNodeTreesRequest copyWith(
          void Function(ExitSingleNodeTreesRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ExitSingleNodeTreesRequest))
          as ExitSingleNodeTreesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExitSingleNodeTreesRequest create() => ExitSingleNodeTreesRequest._();
  @$core.override
  ExitSingleNodeTreesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExitSingleNodeTreesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExitSingleNodeTreesRequest>(create);
  static ExitSingleNodeTreesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerIdentityPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set ownerIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerIdentityPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerIdentityPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<ExitingTree> get exitingTrees => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get rawTx => $_getN(2);
  @$pb.TagNumber(3)
  set rawTx($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRawTx() => $_has(2);
  @$pb.TagNumber(3)
  void clearRawTx() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<BitcoinTransactionOutput> get previousOutputs => $_getList(3);
}

class ExitSingleNodeTreesResponse extends $pb.GeneratedMessage {
  factory ExitSingleNodeTreesResponse({
    $core.Iterable<ExitSingleNodeTreeSigningResult>? signingResults,
  }) {
    final result = create();
    if (signingResults != null) result.signingResults.addAll(signingResults);
    return result;
  }

  ExitSingleNodeTreesResponse._();

  factory ExitSingleNodeTreesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExitSingleNodeTreesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExitSingleNodeTreesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..pPM<ExitSingleNodeTreeSigningResult>(
        1, _omitFieldNames ? '' : 'signingResults',
        subBuilder: ExitSingleNodeTreeSigningResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExitSingleNodeTreesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExitSingleNodeTreesResponse copyWith(
          void Function(ExitSingleNodeTreesResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ExitSingleNodeTreesResponse))
          as ExitSingleNodeTreesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExitSingleNodeTreesResponse create() =>
      ExitSingleNodeTreesResponse._();
  @$core.override
  ExitSingleNodeTreesResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExitSingleNodeTreesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExitSingleNodeTreesResponse>(create);
  static ExitSingleNodeTreesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ExitSingleNodeTreeSigningResult> get signingResults =>
      $_getList(0);
}

class QueryNodesDistributionRequest extends $pb.GeneratedMessage {
  factory QueryNodesDistributionRequest({
    $core.List<$core.int>? ownerIdentityPublicKey,
  }) {
    final result = create();
    if (ownerIdentityPublicKey != null)
      result.ownerIdentityPublicKey = ownerIdentityPublicKey;
    return result;
  }

  QueryNodesDistributionRequest._();

  factory QueryNodesDistributionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryNodesDistributionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryNodesDistributionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'ownerIdentityPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryNodesDistributionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryNodesDistributionRequest copyWith(
          void Function(QueryNodesDistributionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as QueryNodesDistributionRequest))
          as QueryNodesDistributionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryNodesDistributionRequest create() =>
      QueryNodesDistributionRequest._();
  @$core.override
  QueryNodesDistributionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryNodesDistributionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryNodesDistributionRequest>(create);
  static QueryNodesDistributionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerIdentityPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set ownerIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerIdentityPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerIdentityPublicKey() => $_clearField(1);
}

class QueryNodesDistributionResponse extends $pb.GeneratedMessage {
  factory QueryNodesDistributionResponse({
    $core.Iterable<$core.MapEntry<$fixnum.Int64, $fixnum.Int64>>?
        nodeDistribution,
  }) {
    final result = create();
    if (nodeDistribution != null)
      result.nodeDistribution.addEntries(nodeDistribution);
    return result;
  }

  QueryNodesDistributionResponse._();

  factory QueryNodesDistributionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryNodesDistributionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryNodesDistributionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..m<$fixnum.Int64, $fixnum.Int64>(
        1, _omitFieldNames ? '' : 'nodeDistribution',
        entryClassName: 'QueryNodesDistributionResponse.NodeDistributionEntry',
        keyFieldType: $pb.PbFieldType.OU6,
        valueFieldType: $pb.PbFieldType.OU6,
        packageName: const $pb.PackageName('spark'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryNodesDistributionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryNodesDistributionResponse copyWith(
          void Function(QueryNodesDistributionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as QueryNodesDistributionResponse))
          as QueryNodesDistributionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryNodesDistributionResponse create() =>
      QueryNodesDistributionResponse._();
  @$core.override
  QueryNodesDistributionResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryNodesDistributionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryNodesDistributionResponse>(create);
  static QueryNodesDistributionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$fixnum.Int64, $fixnum.Int64> get nodeDistribution => $_getMap(0);
}

class QueryNodesByValueRequest extends $pb.GeneratedMessage {
  factory QueryNodesByValueRequest({
    $core.List<$core.int>? ownerIdentityPublicKey,
    $fixnum.Int64? value,
    $fixnum.Int64? offset,
    $fixnum.Int64? limit,
  }) {
    final result = create();
    if (ownerIdentityPublicKey != null)
      result.ownerIdentityPublicKey = ownerIdentityPublicKey;
    if (value != null) result.value = value;
    if (offset != null) result.offset = offset;
    if (limit != null) result.limit = limit;
    return result;
  }

  QueryNodesByValueRequest._();

  factory QueryNodesByValueRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryNodesByValueRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryNodesByValueRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'ownerIdentityPublicKey', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'value')
    ..aInt64(3, _omitFieldNames ? '' : 'offset')
    ..aInt64(4, _omitFieldNames ? '' : 'limit')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryNodesByValueRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryNodesByValueRequest copyWith(
          void Function(QueryNodesByValueRequest) updates) =>
      super.copyWith((message) => updates(message as QueryNodesByValueRequest))
          as QueryNodesByValueRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryNodesByValueRequest create() => QueryNodesByValueRequest._();
  @$core.override
  QueryNodesByValueRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryNodesByValueRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryNodesByValueRequest>(create);
  static QueryNodesByValueRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerIdentityPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set ownerIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerIdentityPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerIdentityPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get value => $_getI64(1);
  @$pb.TagNumber(2)
  set value($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get offset => $_getI64(2);
  @$pb.TagNumber(3)
  set offset($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get limit => $_getI64(3);
  @$pb.TagNumber(4)
  set limit($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearLimit() => $_clearField(4);
}

class QueryNodesByValueResponse extends $pb.GeneratedMessage {
  factory QueryNodesByValueResponse({
    $core.Iterable<$core.MapEntry<$core.String, TreeNode>>? nodes,
    $fixnum.Int64? offset,
  }) {
    final result = create();
    if (nodes != null) result.nodes.addEntries(nodes);
    if (offset != null) result.offset = offset;
    return result;
  }

  QueryNodesByValueResponse._();

  factory QueryNodesByValueResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryNodesByValueResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryNodesByValueResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..m<$core.String, TreeNode>(1, _omitFieldNames ? '' : 'nodes',
        entryClassName: 'QueryNodesByValueResponse.NodesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: TreeNode.create,
        valueDefaultOrMaker: TreeNode.getDefault,
        packageName: const $pb.PackageName('spark'))
    ..aInt64(2, _omitFieldNames ? '' : 'offset')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryNodesByValueResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryNodesByValueResponse copyWith(
          void Function(QueryNodesByValueResponse) updates) =>
      super.copyWith((message) => updates(message as QueryNodesByValueResponse))
          as QueryNodesByValueResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryNodesByValueResponse create() => QueryNodesByValueResponse._();
  @$core.override
  QueryNodesByValueResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryNodesByValueResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryNodesByValueResponse>(create);
  static QueryNodesByValueResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, TreeNode> get nodes => $_getMap(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get offset => $_getI64(1);
  @$pb.TagNumber(2)
  set offset($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => $_clearField(2);
}

class GetUtxosForAddressRequest extends $pb.GeneratedMessage {
  factory GetUtxosForAddressRequest({
    $core.String? address,
    $fixnum.Int64? offset,
    $fixnum.Int64? limit,
    Network? network,
    $core.bool? excludeClaimed,
  }) {
    final result = create();
    if (address != null) result.address = address;
    if (offset != null) result.offset = offset;
    if (limit != null) result.limit = limit;
    if (network != null) result.network = network;
    if (excludeClaimed != null) result.excludeClaimed = excludeClaimed;
    return result;
  }

  GetUtxosForAddressRequest._();

  factory GetUtxosForAddressRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUtxosForAddressRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUtxosForAddressRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aE<Network>(4, _omitFieldNames ? '' : 'network',
        enumValues: Network.values)
    ..aOB(5, _omitFieldNames ? '' : 'excludeClaimed')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUtxosForAddressRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUtxosForAddressRequest copyWith(
          void Function(GetUtxosForAddressRequest) updates) =>
      super.copyWith((message) => updates(message as GetUtxosForAddressRequest))
          as GetUtxosForAddressRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUtxosForAddressRequest create() => GetUtxosForAddressRequest._();
  @$core.override
  GetUtxosForAddressRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetUtxosForAddressRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUtxosForAddressRequest>(create);
  static GetUtxosForAddressRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get offset => $_getI64(1);
  @$pb.TagNumber(2)
  set offset($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get limit => $_getI64(2);
  @$pb.TagNumber(3)
  set limit($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimit() => $_clearField(3);

  @$pb.TagNumber(4)
  Network get network => $_getN(3);
  @$pb.TagNumber(4)
  set network(Network value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasNetwork() => $_has(3);
  @$pb.TagNumber(4)
  void clearNetwork() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get excludeClaimed => $_getBF(4);
  @$pb.TagNumber(5)
  set excludeClaimed($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasExcludeClaimed() => $_has(4);
  @$pb.TagNumber(5)
  void clearExcludeClaimed() => $_clearField(5);
}

class GetUtxosForAddressResponse extends $pb.GeneratedMessage {
  factory GetUtxosForAddressResponse({
    $core.Iterable<UTXO>? utxos,
    $fixnum.Int64? offset,
  }) {
    final result = create();
    if (utxos != null) result.utxos.addAll(utxos);
    if (offset != null) result.offset = offset;
    return result;
  }

  GetUtxosForAddressResponse._();

  factory GetUtxosForAddressResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUtxosForAddressResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUtxosForAddressResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..pPM<UTXO>(1, _omitFieldNames ? '' : 'utxos', subBuilder: UTXO.create)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUtxosForAddressResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUtxosForAddressResponse copyWith(
          void Function(GetUtxosForAddressResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetUtxosForAddressResponse))
          as GetUtxosForAddressResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUtxosForAddressResponse create() => GetUtxosForAddressResponse._();
  @$core.override
  GetUtxosForAddressResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetUtxosForAddressResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUtxosForAddressResponse>(create);
  static GetUtxosForAddressResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<UTXO> get utxos => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get offset => $_getI64(1);
  @$pb.TagNumber(2)
  set offset($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => $_clearField(2);
}

class GetUtxosForIdentityRequest extends $pb.GeneratedMessage {
  factory GetUtxosForIdentityRequest({
    $core.List<$core.int>? identityPublicKey,
    Network? network,
    $core.bool? excludeClaimed,
    PageRequest? page,
    $core.bool? includePending,
  }) {
    final result = create();
    if (identityPublicKey != null) result.identityPublicKey = identityPublicKey;
    if (network != null) result.network = network;
    if (excludeClaimed != null) result.excludeClaimed = excludeClaimed;
    if (page != null) result.page = page;
    if (includePending != null) result.includePending = includePending;
    return result;
  }

  GetUtxosForIdentityRequest._();

  factory GetUtxosForIdentityRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUtxosForIdentityRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUtxosForIdentityRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'identityPublicKey', $pb.PbFieldType.OY)
    ..aE<Network>(2, _omitFieldNames ? '' : 'network',
        enumValues: Network.values)
    ..aOB(3, _omitFieldNames ? '' : 'excludeClaimed')
    ..aOM<PageRequest>(4, _omitFieldNames ? '' : 'page',
        subBuilder: PageRequest.create)
    ..aOB(5, _omitFieldNames ? '' : 'includePending')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUtxosForIdentityRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUtxosForIdentityRequest copyWith(
          void Function(GetUtxosForIdentityRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetUtxosForIdentityRequest))
          as GetUtxosForIdentityRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUtxosForIdentityRequest create() => GetUtxosForIdentityRequest._();
  @$core.override
  GetUtxosForIdentityRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetUtxosForIdentityRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUtxosForIdentityRequest>(create);
  static GetUtxosForIdentityRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get identityPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set identityPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentityPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentityPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  Network get network => $_getN(1);
  @$pb.TagNumber(2)
  set network(Network value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNetwork() => $_has(1);
  @$pb.TagNumber(2)
  void clearNetwork() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get excludeClaimed => $_getBF(2);
  @$pb.TagNumber(3)
  set excludeClaimed($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExcludeClaimed() => $_has(2);
  @$pb.TagNumber(3)
  void clearExcludeClaimed() => $_clearField(3);

  @$pb.TagNumber(4)
  PageRequest get page => $_getN(3);
  @$pb.TagNumber(4)
  set page(PageRequest value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPage() => $_has(3);
  @$pb.TagNumber(4)
  void clearPage() => $_clearField(4);
  @$pb.TagNumber(4)
  PageRequest ensurePage() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.bool get includePending => $_getBF(4);
  @$pb.TagNumber(5)
  set includePending($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIncludePending() => $_has(4);
  @$pb.TagNumber(5)
  void clearIncludePending() => $_clearField(5);
}

class GetUtxosForIdentityResponse extends $pb.GeneratedMessage {
  factory GetUtxosForIdentityResponse({
    $core.Iterable<AddressedUtxo>? utxos,
    PageResponse? page,
  }) {
    final result = create();
    if (utxos != null) result.utxos.addAll(utxos);
    if (page != null) result.page = page;
    return result;
  }

  GetUtxosForIdentityResponse._();

  factory GetUtxosForIdentityResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUtxosForIdentityResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUtxosForIdentityResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..pPM<AddressedUtxo>(1, _omitFieldNames ? '' : 'utxos',
        subBuilder: AddressedUtxo.create)
    ..aOM<PageResponse>(2, _omitFieldNames ? '' : 'page',
        subBuilder: PageResponse.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUtxosForIdentityResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUtxosForIdentityResponse copyWith(
          void Function(GetUtxosForIdentityResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetUtxosForIdentityResponse))
          as GetUtxosForIdentityResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUtxosForIdentityResponse create() =>
      GetUtxosForIdentityResponse._();
  @$core.override
  GetUtxosForIdentityResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetUtxosForIdentityResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUtxosForIdentityResponse>(create);
  static GetUtxosForIdentityResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<AddressedUtxo> get utxos => $_getList(0);

  @$pb.TagNumber(2)
  PageResponse get page => $_getN(1);
  @$pb.TagNumber(2)
  set page(PageResponse value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);
  @$pb.TagNumber(2)
  PageResponse ensurePage() => $_ensure(1);
}

class QuerySparkInvoicesRequest extends $pb.GeneratedMessage {
  factory QuerySparkInvoicesRequest({
    $fixnum.Int64? limit,
    $fixnum.Int64? offset,
    $core.Iterable<$core.String>? invoice,
  }) {
    final result = create();
    if (limit != null) result.limit = limit;
    if (offset != null) result.offset = offset;
    if (invoice != null) result.invoice.addAll(invoice);
    return result;
  }

  QuerySparkInvoicesRequest._();

  factory QuerySparkInvoicesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuerySparkInvoicesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuerySparkInvoicesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'limit')
    ..aInt64(2, _omitFieldNames ? '' : 'offset')
    ..pPS(3, _omitFieldNames ? '' : 'invoice')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuerySparkInvoicesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuerySparkInvoicesRequest copyWith(
          void Function(QuerySparkInvoicesRequest) updates) =>
      super.copyWith((message) => updates(message as QuerySparkInvoicesRequest))
          as QuerySparkInvoicesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuerySparkInvoicesRequest create() => QuerySparkInvoicesRequest._();
  @$core.override
  QuerySparkInvoicesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuerySparkInvoicesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuerySparkInvoicesRequest>(create);
  static QuerySparkInvoicesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get limit => $_getI64(0);
  @$pb.TagNumber(1)
  set limit($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimit() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get offset => $_getI64(1);
  @$pb.TagNumber(2)
  set offset($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => $_clearField(2);

  /// returns the status for the provided list of spark invoices.
  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get invoice => $_getList(2);
}

class QuerySparkInvoicesResponse extends $pb.GeneratedMessage {
  factory QuerySparkInvoicesResponse({
    $fixnum.Int64? offset,
    $core.Iterable<InvoiceResponse>? invoiceStatuses,
  }) {
    final result = create();
    if (offset != null) result.offset = offset;
    if (invoiceStatuses != null) result.invoiceStatuses.addAll(invoiceStatuses);
    return result;
  }

  QuerySparkInvoicesResponse._();

  factory QuerySparkInvoicesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuerySparkInvoicesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuerySparkInvoicesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'offset')
    ..pPM<InvoiceResponse>(2, _omitFieldNames ? '' : 'invoiceStatuses',
        subBuilder: InvoiceResponse.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuerySparkInvoicesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuerySparkInvoicesResponse copyWith(
          void Function(QuerySparkInvoicesResponse) updates) =>
      super.copyWith(
              (message) => updates(message as QuerySparkInvoicesResponse))
          as QuerySparkInvoicesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuerySparkInvoicesResponse create() => QuerySparkInvoicesResponse._();
  @$core.override
  QuerySparkInvoicesResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuerySparkInvoicesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuerySparkInvoicesResponse>(create);
  static QuerySparkInvoicesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get offset => $_getI64(0);
  @$pb.TagNumber(1)
  set offset($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOffset() => $_has(0);
  @$pb.TagNumber(1)
  void clearOffset() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<InvoiceResponse> get invoiceStatuses => $_getList(1);
}

enum InvoiceResponse_TransferType { satsTransfer, tokenTransfer, notSet }

class InvoiceResponse extends $pb.GeneratedMessage {
  factory InvoiceResponse({
    $core.String? invoice,
    InvoiceStatus? status,
    SatsTransfer? satsTransfer,
    TokenTransfer? tokenTransfer,
  }) {
    final result = create();
    if (invoice != null) result.invoice = invoice;
    if (status != null) result.status = status;
    if (satsTransfer != null) result.satsTransfer = satsTransfer;
    if (tokenTransfer != null) result.tokenTransfer = tokenTransfer;
    return result;
  }

  InvoiceResponse._();

  factory InvoiceResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InvoiceResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, InvoiceResponse_TransferType>
      _InvoiceResponse_TransferTypeByTag = {
    3: InvoiceResponse_TransferType.satsTransfer,
    4: InvoiceResponse_TransferType.tokenTransfer,
    0: InvoiceResponse_TransferType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InvoiceResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..aOS(1, _omitFieldNames ? '' : 'invoice')
    ..aE<InvoiceStatus>(2, _omitFieldNames ? '' : 'status',
        enumValues: InvoiceStatus.values)
    ..aOM<SatsTransfer>(3, _omitFieldNames ? '' : 'satsTransfer',
        subBuilder: SatsTransfer.create)
    ..aOM<TokenTransfer>(4, _omitFieldNames ? '' : 'tokenTransfer',
        subBuilder: TokenTransfer.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InvoiceResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InvoiceResponse copyWith(void Function(InvoiceResponse) updates) =>
      super.copyWith((message) => updates(message as InvoiceResponse))
          as InvoiceResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InvoiceResponse create() => InvoiceResponse._();
  @$core.override
  InvoiceResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InvoiceResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InvoiceResponse>(create);
  static InvoiceResponse? _defaultInstance;

  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  InvoiceResponse_TransferType whichTransferType() =>
      _InvoiceResponse_TransferTypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearTransferType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get invoice => $_getSZ(0);
  @$pb.TagNumber(1)
  set invoice($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInvoice() => $_has(0);
  @$pb.TagNumber(1)
  void clearInvoice() => $_clearField(1);

  @$pb.TagNumber(2)
  InvoiceStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(InvoiceStatus value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  SatsTransfer get satsTransfer => $_getN(2);
  @$pb.TagNumber(3)
  set satsTransfer(SatsTransfer value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSatsTransfer() => $_has(2);
  @$pb.TagNumber(3)
  void clearSatsTransfer() => $_clearField(3);
  @$pb.TagNumber(3)
  SatsTransfer ensureSatsTransfer() => $_ensure(2);

  @$pb.TagNumber(4)
  TokenTransfer get tokenTransfer => $_getN(3);
  @$pb.TagNumber(4)
  set tokenTransfer(TokenTransfer value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasTokenTransfer() => $_has(3);
  @$pb.TagNumber(4)
  void clearTokenTransfer() => $_clearField(4);
  @$pb.TagNumber(4)
  TokenTransfer ensureTokenTransfer() => $_ensure(3);
}

class SatsTransfer extends $pb.GeneratedMessage {
  factory SatsTransfer({
    $core.List<$core.int>? transferId,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    return result;
  }

  SatsTransfer._();

  factory SatsTransfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SatsTransfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SatsTransfer',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'transferId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SatsTransfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SatsTransfer copyWith(void Function(SatsTransfer) updates) =>
      super.copyWith((message) => updates(message as SatsTransfer))
          as SatsTransfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SatsTransfer create() => SatsTransfer._();
  @$core.override
  SatsTransfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SatsTransfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SatsTransfer>(create);
  static SatsTransfer? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get transferId => $_getN(0);
  @$pb.TagNumber(1)
  set transferId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);
}

class TokenTransfer extends $pb.GeneratedMessage {
  factory TokenTransfer({
    $core.List<$core.int>? finalTokenTransactionHash,
  }) {
    final result = create();
    if (finalTokenTransactionHash != null)
      result.finalTokenTransactionHash = finalTokenTransactionHash;
    return result;
  }

  TokenTransfer._();

  factory TokenTransfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenTransfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenTransfer',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1,
        _omitFieldNames ? '' : 'finalTokenTransactionHash', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenTransfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenTransfer copyWith(void Function(TokenTransfer) updates) =>
      super.copyWith((message) => updates(message as TokenTransfer))
          as TokenTransfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenTransfer create() => TokenTransfer._();
  @$core.override
  TokenTransfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenTransfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenTransfer>(create);
  static TokenTransfer? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get finalTokenTransactionHash => $_getN(0);
  @$pb.TagNumber(1)
  set finalTokenTransactionHash($core.List<$core.int> value) =>
      $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFinalTokenTransactionHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearFinalTokenTransactionHash() => $_clearField(1);
}

class InitiateSwapPrimaryTransferRequest extends $pb.GeneratedMessage {
  factory InitiateSwapPrimaryTransferRequest({
    StartTransferRequest? transfer,
    AdaptorPublicKeyPackage? adaptorPublicKeys,
  }) {
    final result = create();
    if (transfer != null) result.transfer = transfer;
    if (adaptorPublicKeys != null) result.adaptorPublicKeys = adaptorPublicKeys;
    return result;
  }

  InitiateSwapPrimaryTransferRequest._();

  factory InitiateSwapPrimaryTransferRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitiateSwapPrimaryTransferRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitiateSwapPrimaryTransferRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<StartTransferRequest>(1, _omitFieldNames ? '' : 'transfer',
        subBuilder: StartTransferRequest.create)
    ..aOM<AdaptorPublicKeyPackage>(
        2, _omitFieldNames ? '' : 'adaptorPublicKeys',
        subBuilder: AdaptorPublicKeyPackage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateSwapPrimaryTransferRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateSwapPrimaryTransferRequest copyWith(
          void Function(InitiateSwapPrimaryTransferRequest) updates) =>
      super.copyWith((message) =>
              updates(message as InitiateSwapPrimaryTransferRequest))
          as InitiateSwapPrimaryTransferRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitiateSwapPrimaryTransferRequest create() =>
      InitiateSwapPrimaryTransferRequest._();
  @$core.override
  InitiateSwapPrimaryTransferRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InitiateSwapPrimaryTransferRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InitiateSwapPrimaryTransferRequest>(
          create);
  static InitiateSwapPrimaryTransferRequest? _defaultInstance;

  /// Transfer with refunds and key tweaks signed
  @$pb.TagNumber(1)
  StartTransferRequest get transfer => $_getN(0);
  @$pb.TagNumber(1)
  set transfer(StartTransferRequest value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransfer() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransfer() => $_clearField(1);
  @$pb.TagNumber(1)
  StartTransferRequest ensureTransfer() => $_ensure(0);

  /// Adaptor public keys to verify the signatures of refunds for the primary
  /// transfer in the swap
  @$pb.TagNumber(2)
  AdaptorPublicKeyPackage get adaptorPublicKeys => $_getN(1);
  @$pb.TagNumber(2)
  set adaptorPublicKeys(AdaptorPublicKeyPackage value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasAdaptorPublicKeys() => $_has(1);
  @$pb.TagNumber(2)
  void clearAdaptorPublicKeys() => $_clearField(2);
  @$pb.TagNumber(2)
  AdaptorPublicKeyPackage ensureAdaptorPublicKeys() => $_ensure(1);
}

class InitiateSwapPrimaryTransferResponse extends $pb.GeneratedMessage {
  factory InitiateSwapPrimaryTransferResponse({
    Transfer? transfer,
    $core.Iterable<LeafRefundTxSigningResult>? signingResults,
  }) {
    final result = create();
    if (transfer != null) result.transfer = transfer;
    if (signingResults != null) result.signingResults.addAll(signingResults);
    return result;
  }

  InitiateSwapPrimaryTransferResponse._();

  factory InitiateSwapPrimaryTransferResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitiateSwapPrimaryTransferResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitiateSwapPrimaryTransferResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<Transfer>(1, _omitFieldNames ? '' : 'transfer',
        subBuilder: Transfer.create)
    ..pPM<LeafRefundTxSigningResult>(2, _omitFieldNames ? '' : 'signingResults',
        subBuilder: LeafRefundTxSigningResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateSwapPrimaryTransferResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiateSwapPrimaryTransferResponse copyWith(
          void Function(InitiateSwapPrimaryTransferResponse) updates) =>
      super.copyWith((message) =>
              updates(message as InitiateSwapPrimaryTransferResponse))
          as InitiateSwapPrimaryTransferResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitiateSwapPrimaryTransferResponse create() =>
      InitiateSwapPrimaryTransferResponse._();
  @$core.override
  InitiateSwapPrimaryTransferResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InitiateSwapPrimaryTransferResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          InitiateSwapPrimaryTransferResponse>(create);
  static InitiateSwapPrimaryTransferResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Transfer get transfer => $_getN(0);
  @$pb.TagNumber(1)
  set transfer(Transfer value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransfer() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransfer() => $_clearField(1);
  @$pb.TagNumber(1)
  Transfer ensureTransfer() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<LeafRefundTxSigningResult> get signingResults => $_getList(1);
}

/// Adaptor public key is derived from the secret `t` using formula:
/// ```text
/// T = t * G
/// ```
class AdaptorPublicKeyPackage extends $pb.GeneratedMessage {
  factory AdaptorPublicKeyPackage({
    $core.List<$core.int>? adaptorPublicKey,
    $core.List<$core.int>? directAdaptorPublicKey,
    $core.List<$core.int>? directFromCpfpAdaptorPublicKey,
  }) {
    final result = create();
    if (adaptorPublicKey != null) result.adaptorPublicKey = adaptorPublicKey;
    if (directAdaptorPublicKey != null)
      result.directAdaptorPublicKey = directAdaptorPublicKey;
    if (directFromCpfpAdaptorPublicKey != null)
      result.directFromCpfpAdaptorPublicKey = directFromCpfpAdaptorPublicKey;
    return result;
  }

  AdaptorPublicKeyPackage._();

  factory AdaptorPublicKeyPackage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AdaptorPublicKeyPackage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AdaptorPublicKeyPackage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'adaptorPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'directAdaptorPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3,
        _omitFieldNames ? '' : 'directFromCpfpAdaptorPublicKey',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AdaptorPublicKeyPackage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AdaptorPublicKeyPackage copyWith(
          void Function(AdaptorPublicKeyPackage) updates) =>
      super.copyWith((message) => updates(message as AdaptorPublicKeyPackage))
          as AdaptorPublicKeyPackage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdaptorPublicKeyPackage create() => AdaptorPublicKeyPackage._();
  @$core.override
  AdaptorPublicKeyPackage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AdaptorPublicKeyPackage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AdaptorPublicKeyPackage>(create);
  static AdaptorPublicKeyPackage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get adaptorPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set adaptorPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAdaptorPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearAdaptorPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get directAdaptorPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set directAdaptorPublicKey($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDirectAdaptorPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearDirectAdaptorPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get directFromCpfpAdaptorPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set directFromCpfpAdaptorPublicKey($core.List<$core.int> value) =>
      $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDirectFromCpfpAdaptorPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearDirectFromCpfpAdaptorPublicKey() => $_clearField(3);
}

class WalletSetting extends $pb.GeneratedMessage {
  factory WalletSetting({
    $core.List<$core.int>? ownerIdentityPublicKey,
    $core.bool? privateEnabled,
    $core.List<$core.int>? masterIdentityPublicKey,
  }) {
    final result = create();
    if (ownerIdentityPublicKey != null)
      result.ownerIdentityPublicKey = ownerIdentityPublicKey;
    if (privateEnabled != null) result.privateEnabled = privateEnabled;
    if (masterIdentityPublicKey != null)
      result.masterIdentityPublicKey = masterIdentityPublicKey;
    return result;
  }

  WalletSetting._();

  factory WalletSetting.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WalletSetting.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WalletSetting',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'ownerIdentityPublicKey', $pb.PbFieldType.OY)
    ..aOB(2, _omitFieldNames ? '' : 'privateEnabled')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'masterIdentityPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WalletSetting clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WalletSetting copyWith(void Function(WalletSetting) updates) =>
      super.copyWith((message) => updates(message as WalletSetting))
          as WalletSetting;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WalletSetting create() => WalletSetting._();
  @$core.override
  WalletSetting createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WalletSetting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WalletSetting>(create);
  static WalletSetting? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerIdentityPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set ownerIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerIdentityPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerIdentityPublicKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get privateEnabled => $_getBF(1);
  @$pb.TagNumber(2)
  set privateEnabled($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPrivateEnabled() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrivateEnabled() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get masterIdentityPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set masterIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMasterIdentityPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearMasterIdentityPublicKey() => $_clearField(3);
}

enum UpdateWalletSettingRequest_MasterIdentityPublicKey {
  setMasterIdentityPublicKey,
  clearMasterIdentityPublicKey,
  notSet
}

class UpdateWalletSettingRequest extends $pb.GeneratedMessage {
  factory UpdateWalletSettingRequest({
    $core.bool? privateEnabled,
    $core.List<$core.int>? setMasterIdentityPublicKey,
    $core.bool? clearMasterIdentityPublicKey,
  }) {
    final result = create();
    if (privateEnabled != null) result.privateEnabled = privateEnabled;
    if (setMasterIdentityPublicKey != null)
      result.setMasterIdentityPublicKey = setMasterIdentityPublicKey;
    if (clearMasterIdentityPublicKey != null)
      result.clearMasterIdentityPublicKey = clearMasterIdentityPublicKey;
    return result;
  }

  UpdateWalletSettingRequest._();

  factory UpdateWalletSettingRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateWalletSettingRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core
      .Map<$core.int, UpdateWalletSettingRequest_MasterIdentityPublicKey>
      _UpdateWalletSettingRequest_MasterIdentityPublicKeyByTag = {
    2: UpdateWalletSettingRequest_MasterIdentityPublicKey
        .setMasterIdentityPublicKey,
    3: UpdateWalletSettingRequest_MasterIdentityPublicKey
        .clearMasterIdentityPublicKey,
    0: UpdateWalletSettingRequest_MasterIdentityPublicKey.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateWalletSettingRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..aOB(1, _omitFieldNames ? '' : 'privateEnabled')
    ..a<$core.List<$core.int>>(2,
        _omitFieldNames ? '' : 'setMasterIdentityPublicKey', $pb.PbFieldType.OY)
    ..aOB(3, _omitFieldNames ? '' : 'clearMasterIdentityPublicKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateWalletSettingRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateWalletSettingRequest copyWith(
          void Function(UpdateWalletSettingRequest) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateWalletSettingRequest))
          as UpdateWalletSettingRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateWalletSettingRequest create() => UpdateWalletSettingRequest._();
  @$core.override
  UpdateWalletSettingRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateWalletSettingRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateWalletSettingRequest>(create);
  static UpdateWalletSettingRequest? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  UpdateWalletSettingRequest_MasterIdentityPublicKey
      whichMasterIdentityPublicKey_() =>
          _UpdateWalletSettingRequest_MasterIdentityPublicKeyByTag[
              $_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearMasterIdentityPublicKey_() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.bool get privateEnabled => $_getBF(0);
  @$pb.TagNumber(1)
  set privateEnabled($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPrivateEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateEnabled() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get setMasterIdentityPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set setMasterIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSetMasterIdentityPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearSetMasterIdentityPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get clearMasterIdentityPublicKey => $_getBF(2);
  @$pb.TagNumber(3)
  set clearMasterIdentityPublicKey($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasClearMasterIdentityPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearClearMasterIdentityPublicKey() => $_clearField(3);
}

class UpdateWalletSettingResponse extends $pb.GeneratedMessage {
  factory UpdateWalletSettingResponse({
    WalletSetting? walletSetting,
  }) {
    final result = create();
    if (walletSetting != null) result.walletSetting = walletSetting;
    return result;
  }

  UpdateWalletSettingResponse._();

  factory UpdateWalletSettingResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateWalletSettingResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateWalletSettingResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<WalletSetting>(1, _omitFieldNames ? '' : 'walletSetting',
        subBuilder: WalletSetting.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateWalletSettingResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateWalletSettingResponse copyWith(
          void Function(UpdateWalletSettingResponse) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateWalletSettingResponse))
          as UpdateWalletSettingResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateWalletSettingResponse create() =>
      UpdateWalletSettingResponse._();
  @$core.override
  UpdateWalletSettingResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateWalletSettingResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateWalletSettingResponse>(create);
  static UpdateWalletSettingResponse? _defaultInstance;

  @$pb.TagNumber(1)
  WalletSetting get walletSetting => $_getN(0);
  @$pb.TagNumber(1)
  set walletSetting(WalletSetting value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasWalletSetting() => $_has(0);
  @$pb.TagNumber(1)
  void clearWalletSetting() => $_clearField(1);
  @$pb.TagNumber(1)
  WalletSetting ensureWalletSetting() => $_ensure(0);
}

class QueryWalletSettingRequest extends $pb.GeneratedMessage {
  factory QueryWalletSettingRequest() => create();

  QueryWalletSettingRequest._();

  factory QueryWalletSettingRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryWalletSettingRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryWalletSettingRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryWalletSettingRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryWalletSettingRequest copyWith(
          void Function(QueryWalletSettingRequest) updates) =>
      super.copyWith((message) => updates(message as QueryWalletSettingRequest))
          as QueryWalletSettingRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryWalletSettingRequest create() => QueryWalletSettingRequest._();
  @$core.override
  QueryWalletSettingRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryWalletSettingRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryWalletSettingRequest>(create);
  static QueryWalletSettingRequest? _defaultInstance;
}

class QueryWalletSettingResponse extends $pb.GeneratedMessage {
  factory QueryWalletSettingResponse({
    WalletSetting? walletSetting,
  }) {
    final result = create();
    if (walletSetting != null) result.walletSetting = walletSetting;
    return result;
  }

  QueryWalletSettingResponse._();

  factory QueryWalletSettingResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryWalletSettingResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryWalletSettingResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOM<WalletSetting>(1, _omitFieldNames ? '' : 'walletSetting',
        subBuilder: WalletSetting.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryWalletSettingResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryWalletSettingResponse copyWith(
          void Function(QueryWalletSettingResponse) updates) =>
      super.copyWith(
              (message) => updates(message as QueryWalletSettingResponse))
          as QueryWalletSettingResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryWalletSettingResponse create() => QueryWalletSettingResponse._();
  @$core.override
  QueryWalletSettingResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryWalletSettingResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryWalletSettingResponse>(create);
  static QueryWalletSettingResponse? _defaultInstance;

  @$pb.TagNumber(1)
  WalletSetting get walletSetting => $_getN(0);
  @$pb.TagNumber(1)
  set walletSetting(WalletSetting value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasWalletSetting() => $_has(0);
  @$pb.TagNumber(1)
  void clearWalletSetting() => $_clearField(1);
  @$pb.TagNumber(1)
  WalletSetting ensureWalletSetting() => $_ensure(0);
}

class QuerySparkTransactionVolumesRequest extends $pb.GeneratedMessage {
  factory QuerySparkTransactionVolumesRequest({
    $core.String? startDate,
    $core.String? endDate,
    $core.Iterable<SparkTransactionType>? transactionTypes,
    Network? network,
  }) {
    final result = create();
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    if (transactionTypes != null)
      result.transactionTypes.addAll(transactionTypes);
    if (network != null) result.network = network;
    return result;
  }

  QuerySparkTransactionVolumesRequest._();

  factory QuerySparkTransactionVolumesRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuerySparkTransactionVolumesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuerySparkTransactionVolumesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'startDate')
    ..aOS(2, _omitFieldNames ? '' : 'endDate')
    ..pc<SparkTransactionType>(
        3, _omitFieldNames ? '' : 'transactionTypes', $pb.PbFieldType.KE,
        valueOf: SparkTransactionType.valueOf,
        enumValues: SparkTransactionType.values,
        defaultEnumValue:
            SparkTransactionType.SPARK_TRANSACTION_TYPE_UNSPECIFIED)
    ..aE<Network>(4, _omitFieldNames ? '' : 'network',
        enumValues: Network.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuerySparkTransactionVolumesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuerySparkTransactionVolumesRequest copyWith(
          void Function(QuerySparkTransactionVolumesRequest) updates) =>
      super.copyWith((message) =>
              updates(message as QuerySparkTransactionVolumesRequest))
          as QuerySparkTransactionVolumesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuerySparkTransactionVolumesRequest create() =>
      QuerySparkTransactionVolumesRequest._();
  @$core.override
  QuerySparkTransactionVolumesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuerySparkTransactionVolumesRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          QuerySparkTransactionVolumesRequest>(create);
  static QuerySparkTransactionVolumesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get startDate => $_getSZ(0);
  @$pb.TagNumber(1)
  set startDate($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStartDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartDate() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get endDate => $_getSZ(1);
  @$pb.TagNumber(2)
  set endDate($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEndDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndDate() => $_clearField(2);

  /// If empty, results include all transaction types. Otherwise results are
  /// scoped to the listed types (e.g. [LIGHTNING_SEND, LIGHTNING_RECEIVE]).
  @$pb.TagNumber(3)
  $pb.PbList<SparkTransactionType> get transactionTypes => $_getList(2);

  /// If unset, results include all networks. When set, results are scoped to that
  /// single network. All defined networks (MAINNET, REGTEST, TESTNET, SIGNET) are allowed.
  @$pb.TagNumber(4)
  Network get network => $_getN(3);
  @$pb.TagNumber(4)
  set network(Network value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasNetwork() => $_has(3);
  @$pb.TagNumber(4)
  void clearNetwork() => $_clearField(4);
}

class SparkTransactionVolume extends $pb.GeneratedMessage {
  factory SparkTransactionVolume({
    SparkTransactionType? transactionType,
    $fixnum.Int64? volumeSats,
    $fixnum.Int64? transactionCount,
  }) {
    final result = create();
    if (transactionType != null) result.transactionType = transactionType;
    if (volumeSats != null) result.volumeSats = volumeSats;
    if (transactionCount != null) result.transactionCount = transactionCount;
    return result;
  }

  SparkTransactionVolume._();

  factory SparkTransactionVolume.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SparkTransactionVolume.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SparkTransactionVolume',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aE<SparkTransactionType>(1, _omitFieldNames ? '' : 'transactionType',
        enumValues: SparkTransactionType.values)
    ..aInt64(2, _omitFieldNames ? '' : 'volumeSats')
    ..aInt64(3, _omitFieldNames ? '' : 'transactionCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SparkTransactionVolume clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SparkTransactionVolume copyWith(
          void Function(SparkTransactionVolume) updates) =>
      super.copyWith((message) => updates(message as SparkTransactionVolume))
          as SparkTransactionVolume;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SparkTransactionVolume create() => SparkTransactionVolume._();
  @$core.override
  SparkTransactionVolume createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SparkTransactionVolume getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SparkTransactionVolume>(create);
  static SparkTransactionVolume? _defaultInstance;

  @$pb.TagNumber(1)
  SparkTransactionType get transactionType => $_getN(0);
  @$pb.TagNumber(1)
  set transactionType(SparkTransactionType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransactionType() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionType() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get volumeSats => $_getI64(1);
  @$pb.TagNumber(2)
  set volumeSats($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVolumeSats() => $_has(1);
  @$pb.TagNumber(2)
  void clearVolumeSats() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get transactionCount => $_getI64(2);
  @$pb.TagNumber(3)
  set transactionCount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTransactionCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransactionCount() => $_clearField(3);
}

class QuerySparkTransactionVolumesResponse extends $pb.GeneratedMessage {
  factory QuerySparkTransactionVolumesResponse({
    $core.String? partnerId,
    $core.String? label,
    $core.String? startDate,
    $core.String? endDate,
    $core.Iterable<SparkTransactionVolume>? transactionTypes,
    $fixnum.Int64? totalVolumeSats,
    $fixnum.Int64? totalTransactionCount,
  }) {
    final result = create();
    if (partnerId != null) result.partnerId = partnerId;
    if (label != null) result.label = label;
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    if (transactionTypes != null)
      result.transactionTypes.addAll(transactionTypes);
    if (totalVolumeSats != null) result.totalVolumeSats = totalVolumeSats;
    if (totalTransactionCount != null)
      result.totalTransactionCount = totalTransactionCount;
    return result;
  }

  QuerySparkTransactionVolumesResponse._();

  factory QuerySparkTransactionVolumesResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuerySparkTransactionVolumesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuerySparkTransactionVolumesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'spark'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'partnerId')
    ..aOS(2, _omitFieldNames ? '' : 'label')
    ..aOS(3, _omitFieldNames ? '' : 'startDate')
    ..aOS(4, _omitFieldNames ? '' : 'endDate')
    ..pPM<SparkTransactionVolume>(5, _omitFieldNames ? '' : 'transactionTypes',
        subBuilder: SparkTransactionVolume.create)
    ..aInt64(6, _omitFieldNames ? '' : 'totalVolumeSats')
    ..aInt64(7, _omitFieldNames ? '' : 'totalTransactionCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuerySparkTransactionVolumesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuerySparkTransactionVolumesResponse copyWith(
          void Function(QuerySparkTransactionVolumesResponse) updates) =>
      super.copyWith((message) =>
              updates(message as QuerySparkTransactionVolumesResponse))
          as QuerySparkTransactionVolumesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuerySparkTransactionVolumesResponse create() =>
      QuerySparkTransactionVolumesResponse._();
  @$core.override
  QuerySparkTransactionVolumesResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuerySparkTransactionVolumesResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          QuerySparkTransactionVolumesResponse>(create);
  static QuerySparkTransactionVolumesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get partnerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set partnerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPartnerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPartnerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get label => $_getSZ(1);
  @$pb.TagNumber(2)
  set label($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLabel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLabel() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get startDate => $_getSZ(2);
  @$pb.TagNumber(3)
  set startDate($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStartDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartDate() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get endDate => $_getSZ(3);
  @$pb.TagNumber(4)
  set endDate($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEndDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndDate() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<SparkTransactionVolume> get transactionTypes => $_getList(4);

  @$pb.TagNumber(6)
  $fixnum.Int64 get totalVolumeSats => $_getI64(5);
  @$pb.TagNumber(6)
  set totalVolumeSats($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTotalVolumeSats() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalVolumeSats() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get totalTransactionCount => $_getI64(6);
  @$pb.TagNumber(7)
  set totalTransactionCount($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTotalTransactionCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalTransactionCount() => $_clearField(7);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
