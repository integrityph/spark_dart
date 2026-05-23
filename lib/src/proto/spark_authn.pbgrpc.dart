// This is a generated file - do not edit.
//
// Generated from spark_authn.proto.

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

import 'spark_authn.pb.dart' as $0;

export 'spark_authn.pb.dart';

@$pb.GrpcServiceName('spark_authn.SparkAuthnService')
class SparkAuthnServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  SparkAuthnServiceClient(super.channel, {super.options, super.interceptors});

  /// Request a new authentication challenge for a public key
  $grpc.ResponseFuture<$0.GetChallengeResponse> get_challenge(
    $0.GetChallengeRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$get_challenge, request, options: options);
  }

  /// Verify a signed challenge and return a session token
  $grpc.ResponseFuture<$0.VerifyChallengeResponse> verify_challenge(
    $0.VerifyChallengeRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$verify_challenge, request, options: options);
  }

  // method descriptors

  static final _$get_challenge =
      $grpc.ClientMethod<$0.GetChallengeRequest, $0.GetChallengeResponse>(
          '/spark_authn.SparkAuthnService/get_challenge',
          ($0.GetChallengeRequest value) => value.writeToBuffer(),
          $0.GetChallengeResponse.fromBuffer);
  static final _$verify_challenge =
      $grpc.ClientMethod<$0.VerifyChallengeRequest, $0.VerifyChallengeResponse>(
          '/spark_authn.SparkAuthnService/verify_challenge',
          ($0.VerifyChallengeRequest value) => value.writeToBuffer(),
          $0.VerifyChallengeResponse.fromBuffer);
}

@$pb.GrpcServiceName('spark_authn.SparkAuthnService')
abstract class SparkAuthnServiceBase extends $grpc.Service {
  $core.String get $name => 'spark_authn.SparkAuthnService';

  SparkAuthnServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.GetChallengeRequest, $0.GetChallengeResponse>(
            'get_challenge',
            get_challenge_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetChallengeRequest.fromBuffer(value),
            ($0.GetChallengeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VerifyChallengeRequest,
            $0.VerifyChallengeResponse>(
        'verify_challenge',
        verify_challenge_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.VerifyChallengeRequest.fromBuffer(value),
        ($0.VerifyChallengeResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetChallengeResponse> get_challenge_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetChallengeRequest> $request) async {
    return get_challenge($call, await $request);
  }

  $async.Future<$0.GetChallengeResponse> get_challenge(
      $grpc.ServiceCall call, $0.GetChallengeRequest request);

  $async.Future<$0.VerifyChallengeResponse> verify_challenge_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.VerifyChallengeRequest> $request) async {
    return verify_challenge($call, await $request);
  }

  $async.Future<$0.VerifyChallengeResponse> verify_challenge(
      $grpc.ServiceCall call, $0.VerifyChallengeRequest request);
}
