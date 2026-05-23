// This is a generated file - do not edit.
//
// Generated from dkg.proto.

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

import 'dkg.pb.dart' as $0;

export 'dkg.pb.dart';

///
///  Distributed Key Generation Service
///
///  This service is used to coordinate the Distributed Key Generation protocol for each participant
///  signing operator in a batch.
@$pb.GrpcServiceName('dkg.DKGService')
class DKGServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  DKGServiceClient(super.channel, {super.options, super.interceptors});

  ///
  ///  Start the Distributed Key Generation protocol for a participant.
  ///
  ///  This call will be made by a signing operator to the DKG coordinator to start the DKG
  ///  protocol.
  $grpc.ResponseFuture<$1.Empty> start_dkg(
    $0.StartDkgRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$start_dkg, request, options: options);
  }

  ///
  ///  Initiate the Distributed Key Generation protocol for a participant.
  ///
  ///  This will be called by the coordinator to initiate the DKG protocol. The call will be made
  ///  to each participant in the signing group.
  ///
  ///  This will return the round1 package for the participant.
  $grpc.ResponseFuture<$0.InitiateDkgResponse> initiate_dkg(
    $0.InitiateDkgRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$initiate_dkg, request, options: options);
  }

  ///
  ///  Deliver round 1 packages to participants
  ///
  ///  This will be called by the coordinator to deliver the round1 packages to the participants,
  ///  after the coordinator has received the round1 packages from all participants.
  ///
  ///  This will return the signature on the hash of the round1 packages by the participant to
  ///  ensure integrity of the packages.
  $grpc.ResponseFuture<$0.Round1PackagesResponse> round1_packages(
    $0.Round1PackagesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$round1_packages, request, options: options);
  }

  ///
  ///  Deliver all round 1 package siganture to participants
  ///
  ///  This will be called by the coordinator to deliver the round1 package signatures to the
  ///  participants, after the coordinator has received the round1 package signatures from all
  ///  participants.
  ///
  ///  This will return the result of the validation of the round1 package signatures by the
  ///  participants.
  $grpc.ResponseFuture<$0.Round1SignatureResponse> round1_signature(
    $0.Round1SignatureRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$round1_signature, request, options: options);
  }

  ///
  ///  Deliver round 2 packages to participants
  ///
  ///  This will be called by each participant to deliver the round2 packages to the other
  ///  participants. After received all round2 packages from all participants, the participant will
  ///  be able to generate the shared secret by calling round3.
  ///
  ///  This will return the acknowledgement of the round2 packages by the participant.
  $grpc.ResponseFuture<$0.Round2PackagesResponse> round2_packages(
    $0.Round2PackagesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$round2_packages, request, options: options);
  }

  ///
  ///  Round confirmation
  ///
  ///  After round 3 has completed, the coordinator asks each participant which
  ///  of the provided key IDs are present and AVAILABLE. The coordinator then
  ///  marks only the keys that are available on ALL participants as AVAILABLE.
  ///
  ///  Always returns OK with a list of available/unavailable keys. The cron job
  ///  retries periodically to catch keys that become available later.
  $grpc.ResponseFuture<$0.RoundConfirmationResponse> round_confirmation(
    $0.RoundConfirmationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$round_confirmation, request, options: options);
  }

  // method descriptors

  static final _$start_dkg = $grpc.ClientMethod<$0.StartDkgRequest, $1.Empty>(
      '/dkg.DKGService/start_dkg',
      ($0.StartDkgRequest value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
  static final _$initiate_dkg =
      $grpc.ClientMethod<$0.InitiateDkgRequest, $0.InitiateDkgResponse>(
          '/dkg.DKGService/initiate_dkg',
          ($0.InitiateDkgRequest value) => value.writeToBuffer(),
          $0.InitiateDkgResponse.fromBuffer);
  static final _$round1_packages =
      $grpc.ClientMethod<$0.Round1PackagesRequest, $0.Round1PackagesResponse>(
          '/dkg.DKGService/round1_packages',
          ($0.Round1PackagesRequest value) => value.writeToBuffer(),
          $0.Round1PackagesResponse.fromBuffer);
  static final _$round1_signature =
      $grpc.ClientMethod<$0.Round1SignatureRequest, $0.Round1SignatureResponse>(
          '/dkg.DKGService/round1_signature',
          ($0.Round1SignatureRequest value) => value.writeToBuffer(),
          $0.Round1SignatureResponse.fromBuffer);
  static final _$round2_packages =
      $grpc.ClientMethod<$0.Round2PackagesRequest, $0.Round2PackagesResponse>(
          '/dkg.DKGService/round2_packages',
          ($0.Round2PackagesRequest value) => value.writeToBuffer(),
          $0.Round2PackagesResponse.fromBuffer);
  static final _$round_confirmation = $grpc.ClientMethod<
          $0.RoundConfirmationRequest, $0.RoundConfirmationResponse>(
      '/dkg.DKGService/round_confirmation',
      ($0.RoundConfirmationRequest value) => value.writeToBuffer(),
      $0.RoundConfirmationResponse.fromBuffer);
}

@$pb.GrpcServiceName('dkg.DKGService')
abstract class DKGServiceBase extends $grpc.Service {
  $core.String get $name => 'dkg.DKGService';

  DKGServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.StartDkgRequest, $1.Empty>(
        'start_dkg',
        start_dkg_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.StartDkgRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.InitiateDkgRequest, $0.InitiateDkgResponse>(
            'initiate_dkg',
            initiate_dkg_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.InitiateDkgRequest.fromBuffer(value),
            ($0.InitiateDkgResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Round1PackagesRequest,
            $0.Round1PackagesResponse>(
        'round1_packages',
        round1_packages_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.Round1PackagesRequest.fromBuffer(value),
        ($0.Round1PackagesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Round1SignatureRequest,
            $0.Round1SignatureResponse>(
        'round1_signature',
        round1_signature_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.Round1SignatureRequest.fromBuffer(value),
        ($0.Round1SignatureResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Round2PackagesRequest,
            $0.Round2PackagesResponse>(
        'round2_packages',
        round2_packages_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.Round2PackagesRequest.fromBuffer(value),
        ($0.Round2PackagesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RoundConfirmationRequest,
            $0.RoundConfirmationResponse>(
        'round_confirmation',
        round_confirmation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RoundConfirmationRequest.fromBuffer(value),
        ($0.RoundConfirmationResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.Empty> start_dkg_Pre($grpc.ServiceCall $call,
      $async.Future<$0.StartDkgRequest> $request) async {
    return start_dkg($call, await $request);
  }

  $async.Future<$1.Empty> start_dkg(
      $grpc.ServiceCall call, $0.StartDkgRequest request);

  $async.Future<$0.InitiateDkgResponse> initiate_dkg_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.InitiateDkgRequest> $request) async {
    return initiate_dkg($call, await $request);
  }

  $async.Future<$0.InitiateDkgResponse> initiate_dkg(
      $grpc.ServiceCall call, $0.InitiateDkgRequest request);

  $async.Future<$0.Round1PackagesResponse> round1_packages_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.Round1PackagesRequest> $request) async {
    return round1_packages($call, await $request);
  }

  $async.Future<$0.Round1PackagesResponse> round1_packages(
      $grpc.ServiceCall call, $0.Round1PackagesRequest request);

  $async.Future<$0.Round1SignatureResponse> round1_signature_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.Round1SignatureRequest> $request) async {
    return round1_signature($call, await $request);
  }

  $async.Future<$0.Round1SignatureResponse> round1_signature(
      $grpc.ServiceCall call, $0.Round1SignatureRequest request);

  $async.Future<$0.Round2PackagesResponse> round2_packages_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.Round2PackagesRequest> $request) async {
    return round2_packages($call, await $request);
  }

  $async.Future<$0.Round2PackagesResponse> round2_packages(
      $grpc.ServiceCall call, $0.Round2PackagesRequest request);

  $async.Future<$0.RoundConfirmationResponse> round_confirmation_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.RoundConfirmationRequest> $request) async {
    return round_confirmation($call, await $request);
  }

  $async.Future<$0.RoundConfirmationResponse> round_confirmation(
      $grpc.ServiceCall call, $0.RoundConfirmationRequest request);
}
