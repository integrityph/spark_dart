// This is a generated file - do not edit.
//
// Generated from mock.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart' as $1;

import 'mock.pb.dart' as $0;

export 'mock.pb.dart';

@$pb.GrpcServiceName('mock.MockService')
class MockServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  MockServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.Empty> clean_up_preimage_share(
    $0.CleanUpPreimageShareRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$clean_up_preimage_share, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.Empty> update_nodes_status(
    $0.UpdateNodesStatusRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$update_nodes_status, request, options: options);
  }

  /// Triggers the execution of a scheduled task immediately by name. Used by hermetic tests
  $grpc.ResponseFuture<$1.Empty> trigger_task(
    $0.TriggerTaskRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$trigger_task, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryPreimageShareResponse> query_preimage_share(
    $0.QueryPreimageShareRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$query_preimage_share, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> modify_node_timelock(
    $0.ModifyNodeTimelockRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$modify_node_timelock, request, options: options);
  }

  // method descriptors

  static final _$clean_up_preimage_share =
      $grpc.ClientMethod<$0.CleanUpPreimageShareRequest, $1.Empty>(
          '/mock.MockService/clean_up_preimage_share',
          ($0.CleanUpPreimageShareRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$update_nodes_status =
      $grpc.ClientMethod<$0.UpdateNodesStatusRequest, $1.Empty>(
          '/mock.MockService/update_nodes_status',
          ($0.UpdateNodesStatusRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$trigger_task =
      $grpc.ClientMethod<$0.TriggerTaskRequest, $1.Empty>(
          '/mock.MockService/trigger_task',
          ($0.TriggerTaskRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$query_preimage_share = $grpc.ClientMethod<
          $0.QueryPreimageShareRequest, $0.QueryPreimageShareResponse>(
      '/mock.MockService/query_preimage_share',
      ($0.QueryPreimageShareRequest value) => value.writeToBuffer(),
      $0.QueryPreimageShareResponse.fromBuffer);
  static final _$modify_node_timelock =
      $grpc.ClientMethod<$0.ModifyNodeTimelockRequest, $1.Empty>(
          '/mock.MockService/modify_node_timelock',
          ($0.ModifyNodeTimelockRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
}

@$pb.GrpcServiceName('mock.MockService')
abstract class MockServiceBase extends $grpc.Service {
  $core.String get $name => 'mock.MockService';

  MockServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CleanUpPreimageShareRequest, $1.Empty>(
        'clean_up_preimage_share',
        clean_up_preimage_share_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CleanUpPreimageShareRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateNodesStatusRequest, $1.Empty>(
        'update_nodes_status',
        update_nodes_status_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateNodesStatusRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TriggerTaskRequest, $1.Empty>(
        'trigger_task',
        trigger_task_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.TriggerTaskRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryPreimageShareRequest,
            $0.QueryPreimageShareResponse>(
        'query_preimage_share',
        query_preimage_share_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryPreimageShareRequest.fromBuffer(value),
        ($0.QueryPreimageShareResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ModifyNodeTimelockRequest, $1.Empty>(
        'modify_node_timelock',
        modify_node_timelock_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ModifyNodeTimelockRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.Empty> clean_up_preimage_share_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CleanUpPreimageShareRequest> $request) async {
    return clean_up_preimage_share($call, await $request);
  }

  $async.Future<$1.Empty> clean_up_preimage_share(
      $grpc.ServiceCall call, $0.CleanUpPreimageShareRequest request);

  $async.Future<$1.Empty> update_nodes_status_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UpdateNodesStatusRequest> $request) async {
    return update_nodes_status($call, await $request);
  }

  $async.Future<$1.Empty> update_nodes_status(
      $grpc.ServiceCall call, $0.UpdateNodesStatusRequest request);

  $async.Future<$1.Empty> trigger_task_Pre($grpc.ServiceCall $call,
      $async.Future<$0.TriggerTaskRequest> $request) async {
    return trigger_task($call, await $request);
  }

  $async.Future<$1.Empty> trigger_task(
      $grpc.ServiceCall call, $0.TriggerTaskRequest request);

  $async.Future<$0.QueryPreimageShareResponse> query_preimage_share_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.QueryPreimageShareRequest> $request) async {
    return query_preimage_share($call, await $request);
  }

  $async.Future<$0.QueryPreimageShareResponse> query_preimage_share(
      $grpc.ServiceCall call, $0.QueryPreimageShareRequest request);

  $async.Future<$1.Empty> modify_node_timelock_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ModifyNodeTimelockRequest> $request) async {
    return modify_node_timelock($call, await $request);
  }

  $async.Future<$1.Empty> modify_node_timelock(
      $grpc.ServiceCall call, $0.ModifyNodeTimelockRequest request);
}
