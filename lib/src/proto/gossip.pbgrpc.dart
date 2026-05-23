// This is a generated file - do not edit.
//
// Generated from gossip.proto.

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

import 'gossip.pb.dart' as $0;

export 'gossip.pb.dart';

@$pb.GrpcServiceName('gossip.GossipService')
class GossipServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  GossipServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.Empty> gossip(
    $0.GossipMessage request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$gossip, request, options: options);
  }

  // method descriptors

  static final _$gossip = $grpc.ClientMethod<$0.GossipMessage, $1.Empty>(
      '/gossip.GossipService/gossip',
      ($0.GossipMessage value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
}

@$pb.GrpcServiceName('gossip.GossipService')
abstract class GossipServiceBase extends $grpc.Service {
  $core.String get $name => 'gossip.GossipService';

  GossipServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GossipMessage, $1.Empty>(
        'gossip',
        gossip_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GossipMessage.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.Empty> gossip_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.GossipMessage> $request) async {
    return gossip($call, await $request);
  }

  $async.Future<$1.Empty> gossip(
      $grpc.ServiceCall call, $0.GossipMessage request);
}
