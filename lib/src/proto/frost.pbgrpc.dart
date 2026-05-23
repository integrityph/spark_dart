// This is a generated file - do not edit.
//
// Generated from frost.proto.

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

import 'frost.pb.dart' as $0;

export 'frost.pb.dart';

@$pb.GrpcServiceName('frost.FrostService')
class FrostServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  FrostServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.EchoResponse> echo(
    $0.EchoRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$echo, request, options: options);
  }

  $grpc.ResponseFuture<$0.DkgRound1Response> dkg_round1(
    $0.DkgRound1Request request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$dkg_round1, request, options: options);
  }

  $grpc.ResponseFuture<$0.DkgRound2Response> dkg_round2(
    $0.DkgRound2Request request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$dkg_round2, request, options: options);
  }

  $grpc.ResponseFuture<$0.DkgRound3Response> dkg_round3(
    $0.DkgRound3Request request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$dkg_round3, request, options: options);
  }

  $grpc.ResponseFuture<$0.FrostNonceResponse> frost_nonce(
    $0.FrostNonceRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$frost_nonce, request, options: options);
  }

  $grpc.ResponseFuture<$0.SignFrostResponse> sign_frost(
    $0.SignFrostRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$sign_frost, request, options: options);
  }

  $grpc.ResponseFuture<$0.AggregateFrostResponse> aggregate_frost(
    $0.AggregateFrostRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$aggregate_frost, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> validate_signature_share(
    $0.ValidateSignatureShareRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$validate_signature_share, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.SignFrostResponse> sign_frost_v2(
    $0.SignFrostRequestV2 request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$sign_frost_v2, request, options: options);
  }

  $grpc.ResponseFuture<$0.AggregateFrostResponse> aggregate_frost_v2(
    $0.AggregateFrostRequestV2 request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$aggregate_frost_v2, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> validate_signature_share_v2(
    $0.ValidateSignatureShareRequestV2 request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$validate_signature_share_v2, request,
        options: options);
  }

  // method descriptors

  static final _$echo = $grpc.ClientMethod<$0.EchoRequest, $0.EchoResponse>(
      '/frost.FrostService/echo',
      ($0.EchoRequest value) => value.writeToBuffer(),
      $0.EchoResponse.fromBuffer);
  static final _$dkg_round1 =
      $grpc.ClientMethod<$0.DkgRound1Request, $0.DkgRound1Response>(
          '/frost.FrostService/dkg_round1',
          ($0.DkgRound1Request value) => value.writeToBuffer(),
          $0.DkgRound1Response.fromBuffer);
  static final _$dkg_round2 =
      $grpc.ClientMethod<$0.DkgRound2Request, $0.DkgRound2Response>(
          '/frost.FrostService/dkg_round2',
          ($0.DkgRound2Request value) => value.writeToBuffer(),
          $0.DkgRound2Response.fromBuffer);
  static final _$dkg_round3 =
      $grpc.ClientMethod<$0.DkgRound3Request, $0.DkgRound3Response>(
          '/frost.FrostService/dkg_round3',
          ($0.DkgRound3Request value) => value.writeToBuffer(),
          $0.DkgRound3Response.fromBuffer);
  static final _$frost_nonce =
      $grpc.ClientMethod<$0.FrostNonceRequest, $0.FrostNonceResponse>(
          '/frost.FrostService/frost_nonce',
          ($0.FrostNonceRequest value) => value.writeToBuffer(),
          $0.FrostNonceResponse.fromBuffer);
  static final _$sign_frost =
      $grpc.ClientMethod<$0.SignFrostRequest, $0.SignFrostResponse>(
          '/frost.FrostService/sign_frost',
          ($0.SignFrostRequest value) => value.writeToBuffer(),
          $0.SignFrostResponse.fromBuffer);
  static final _$aggregate_frost =
      $grpc.ClientMethod<$0.AggregateFrostRequest, $0.AggregateFrostResponse>(
          '/frost.FrostService/aggregate_frost',
          ($0.AggregateFrostRequest value) => value.writeToBuffer(),
          $0.AggregateFrostResponse.fromBuffer);
  static final _$validate_signature_share =
      $grpc.ClientMethod<$0.ValidateSignatureShareRequest, $1.Empty>(
          '/frost.FrostService/validate_signature_share',
          ($0.ValidateSignatureShareRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$sign_frost_v2 =
      $grpc.ClientMethod<$0.SignFrostRequestV2, $0.SignFrostResponse>(
          '/frost.FrostService/sign_frost_v2',
          ($0.SignFrostRequestV2 value) => value.writeToBuffer(),
          $0.SignFrostResponse.fromBuffer);
  static final _$aggregate_frost_v2 =
      $grpc.ClientMethod<$0.AggregateFrostRequestV2, $0.AggregateFrostResponse>(
          '/frost.FrostService/aggregate_frost_v2',
          ($0.AggregateFrostRequestV2 value) => value.writeToBuffer(),
          $0.AggregateFrostResponse.fromBuffer);
  static final _$validate_signature_share_v2 =
      $grpc.ClientMethod<$0.ValidateSignatureShareRequestV2, $1.Empty>(
          '/frost.FrostService/validate_signature_share_v2',
          ($0.ValidateSignatureShareRequestV2 value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
}

@$pb.GrpcServiceName('frost.FrostService')
abstract class FrostServiceBase extends $grpc.Service {
  $core.String get $name => 'frost.FrostService';

  FrostServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.EchoRequest, $0.EchoResponse>(
        'echo',
        echo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EchoRequest.fromBuffer(value),
        ($0.EchoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DkgRound1Request, $0.DkgRound1Response>(
        'dkg_round1',
        dkg_round1_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DkgRound1Request.fromBuffer(value),
        ($0.DkgRound1Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DkgRound2Request, $0.DkgRound2Response>(
        'dkg_round2',
        dkg_round2_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DkgRound2Request.fromBuffer(value),
        ($0.DkgRound2Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DkgRound3Request, $0.DkgRound3Response>(
        'dkg_round3',
        dkg_round3_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DkgRound3Request.fromBuffer(value),
        ($0.DkgRound3Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FrostNonceRequest, $0.FrostNonceResponse>(
        'frost_nonce',
        frost_nonce_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FrostNonceRequest.fromBuffer(value),
        ($0.FrostNonceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SignFrostRequest, $0.SignFrostResponse>(
        'sign_frost',
        sign_frost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignFrostRequest.fromBuffer(value),
        ($0.SignFrostResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AggregateFrostRequest,
            $0.AggregateFrostResponse>(
        'aggregate_frost',
        aggregate_frost_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AggregateFrostRequest.fromBuffer(value),
        ($0.AggregateFrostResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ValidateSignatureShareRequest, $1.Empty>(
        'validate_signature_share',
        validate_signature_share_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ValidateSignatureShareRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SignFrostRequestV2, $0.SignFrostResponse>(
        'sign_frost_v2',
        sign_frost_v2_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SignFrostRequestV2.fromBuffer(value),
        ($0.SignFrostResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AggregateFrostRequestV2,
            $0.AggregateFrostResponse>(
        'aggregate_frost_v2',
        aggregate_frost_v2_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AggregateFrostRequestV2.fromBuffer(value),
        ($0.AggregateFrostResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ValidateSignatureShareRequestV2, $1.Empty>(
            'validate_signature_share_v2',
            validate_signature_share_v2_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ValidateSignatureShareRequestV2.fromBuffer(value),
            ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.EchoResponse> echo_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.EchoRequest> $request) async {
    return echo($call, await $request);
  }

  $async.Future<$0.EchoResponse> echo(
      $grpc.ServiceCall call, $0.EchoRequest request);

  $async.Future<$0.DkgRound1Response> dkg_round1_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DkgRound1Request> $request) async {
    return dkg_round1($call, await $request);
  }

  $async.Future<$0.DkgRound1Response> dkg_round1(
      $grpc.ServiceCall call, $0.DkgRound1Request request);

  $async.Future<$0.DkgRound2Response> dkg_round2_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DkgRound2Request> $request) async {
    return dkg_round2($call, await $request);
  }

  $async.Future<$0.DkgRound2Response> dkg_round2(
      $grpc.ServiceCall call, $0.DkgRound2Request request);

  $async.Future<$0.DkgRound3Response> dkg_round3_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DkgRound3Request> $request) async {
    return dkg_round3($call, await $request);
  }

  $async.Future<$0.DkgRound3Response> dkg_round3(
      $grpc.ServiceCall call, $0.DkgRound3Request request);

  $async.Future<$0.FrostNonceResponse> frost_nonce_Pre($grpc.ServiceCall $call,
      $async.Future<$0.FrostNonceRequest> $request) async {
    return frost_nonce($call, await $request);
  }

  $async.Future<$0.FrostNonceResponse> frost_nonce(
      $grpc.ServiceCall call, $0.FrostNonceRequest request);

  $async.Future<$0.SignFrostResponse> sign_frost_Pre($grpc.ServiceCall $call,
      $async.Future<$0.SignFrostRequest> $request) async {
    return sign_frost($call, await $request);
  }

  $async.Future<$0.SignFrostResponse> sign_frost(
      $grpc.ServiceCall call, $0.SignFrostRequest request);

  $async.Future<$0.AggregateFrostResponse> aggregate_frost_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.AggregateFrostRequest> $request) async {
    return aggregate_frost($call, await $request);
  }

  $async.Future<$0.AggregateFrostResponse> aggregate_frost(
      $grpc.ServiceCall call, $0.AggregateFrostRequest request);

  $async.Future<$1.Empty> validate_signature_share_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ValidateSignatureShareRequest> $request) async {
    return validate_signature_share($call, await $request);
  }

  $async.Future<$1.Empty> validate_signature_share(
      $grpc.ServiceCall call, $0.ValidateSignatureShareRequest request);

  $async.Future<$0.SignFrostResponse> sign_frost_v2_Pre($grpc.ServiceCall $call,
      $async.Future<$0.SignFrostRequestV2> $request) async {
    return sign_frost_v2($call, await $request);
  }

  $async.Future<$0.SignFrostResponse> sign_frost_v2(
      $grpc.ServiceCall call, $0.SignFrostRequestV2 request);

  $async.Future<$0.AggregateFrostResponse> aggregate_frost_v2_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.AggregateFrostRequestV2> $request) async {
    return aggregate_frost_v2($call, await $request);
  }

  $async.Future<$0.AggregateFrostResponse> aggregate_frost_v2(
      $grpc.ServiceCall call, $0.AggregateFrostRequestV2 request);

  $async.Future<$1.Empty> validate_signature_share_v2_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ValidateSignatureShareRequestV2> $request) async {
    return validate_signature_share_v2($call, await $request);
  }

  $async.Future<$1.Empty> validate_signature_share_v2(
      $grpc.ServiceCall call, $0.ValidateSignatureShareRequestV2 request);
}
