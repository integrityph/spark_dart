// This is a generated file - do not edit.
//
// Generated from spark_token_internal.proto.

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

import 'spark_token_internal.pb.dart' as $0;

export 'spark_token_internal.pb.dart';

@$pb.GrpcServiceName('spark_token.SparkTokenInternalService')
class SparkTokenInternalServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  SparkTokenInternalServiceClient(super.channel,
      {super.options, super.interceptors});

  /// Validate input and prepare transaction (SO-to-SO)
  $grpc.ResponseFuture<$0.PrepareTransactionResponse> prepare_transaction(
    $0.PrepareTransactionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$prepare_transaction, request, options: options);
  }

  /// Sign the token transaction from coordination
  $grpc.ResponseFuture<$0.SignTokenTransactionFromCoordinationResponse>
      sign_token_transaction_from_coordination(
    $0.SignTokenTransactionFromCoordinationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$sign_token_transaction_from_coordination, request,
        options: options);
  }

  /// Exchange revocation secrets between SOs after all signatures are gathered
  /// Once an SO has all the revocation secret shares, it can finalize the
  /// transaction.
  $grpc.ResponseFuture<$0.ExchangeRevocationSecretsSharesResponse>
      exchange_revocation_secrets_shares(
    $0.ExchangeRevocationSecretsSharesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$exchange_revocation_secrets_shares, request,
        options: options);
  }

  /// Create and Sign a token transaction on non-coordinator operators (V3+).
  $grpc.ResponseFuture<$0.SignTokenTransactionResponse> sign_token_transaction(
    $0.SignTokenTransactionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$sign_token_transaction, request,
        options: options);
  }

  /// Internal freeze tokens (SO-to-SO coordination)
  $grpc.ResponseFuture<$0.InternalFreezeTokensResponse> internal_freeze_tokens(
    $0.InternalFreezeTokensRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$internal_freeze_tokens, request,
        options: options);
  }

  // method descriptors

  static final _$prepare_transaction = $grpc.ClientMethod<
          $0.PrepareTransactionRequest, $0.PrepareTransactionResponse>(
      '/spark_token.SparkTokenInternalService/prepare_transaction',
      ($0.PrepareTransactionRequest value) => value.writeToBuffer(),
      $0.PrepareTransactionResponse.fromBuffer);
  static final _$sign_token_transaction_from_coordination = $grpc.ClientMethod<
          $0.SignTokenTransactionFromCoordinationRequest,
          $0.SignTokenTransactionFromCoordinationResponse>(
      '/spark_token.SparkTokenInternalService/sign_token_transaction_from_coordination',
      ($0.SignTokenTransactionFromCoordinationRequest value) =>
          value.writeToBuffer(),
      $0.SignTokenTransactionFromCoordinationResponse.fromBuffer);
  static final _$exchange_revocation_secrets_shares = $grpc.ClientMethod<
          $0.ExchangeRevocationSecretsSharesRequest,
          $0.ExchangeRevocationSecretsSharesResponse>(
      '/spark_token.SparkTokenInternalService/exchange_revocation_secrets_shares',
      ($0.ExchangeRevocationSecretsSharesRequest value) =>
          value.writeToBuffer(),
      $0.ExchangeRevocationSecretsSharesResponse.fromBuffer);
  static final _$sign_token_transaction = $grpc.ClientMethod<
          $0.SignTokenTransactionRequest, $0.SignTokenTransactionResponse>(
      '/spark_token.SparkTokenInternalService/sign_token_transaction',
      ($0.SignTokenTransactionRequest value) => value.writeToBuffer(),
      $0.SignTokenTransactionResponse.fromBuffer);
  static final _$internal_freeze_tokens = $grpc.ClientMethod<
          $0.InternalFreezeTokensRequest, $0.InternalFreezeTokensResponse>(
      '/spark_token.SparkTokenInternalService/internal_freeze_tokens',
      ($0.InternalFreezeTokensRequest value) => value.writeToBuffer(),
      $0.InternalFreezeTokensResponse.fromBuffer);
}

@$pb.GrpcServiceName('spark_token.SparkTokenInternalService')
abstract class SparkTokenInternalServiceBase extends $grpc.Service {
  $core.String get $name => 'spark_token.SparkTokenInternalService';

  SparkTokenInternalServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.PrepareTransactionRequest,
            $0.PrepareTransactionResponse>(
        'prepare_transaction',
        prepare_transaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.PrepareTransactionRequest.fromBuffer(value),
        ($0.PrepareTransactionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<
            $0.SignTokenTransactionFromCoordinationRequest,
            $0.SignTokenTransactionFromCoordinationResponse>(
        'sign_token_transaction_from_coordination',
        sign_token_transaction_from_coordination_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SignTokenTransactionFromCoordinationRequest.fromBuffer(value),
        ($0.SignTokenTransactionFromCoordinationResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ExchangeRevocationSecretsSharesRequest,
            $0.ExchangeRevocationSecretsSharesResponse>(
        'exchange_revocation_secrets_shares',
        exchange_revocation_secrets_shares_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ExchangeRevocationSecretsSharesRequest.fromBuffer(value),
        ($0.ExchangeRevocationSecretsSharesResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SignTokenTransactionRequest,
            $0.SignTokenTransactionResponse>(
        'sign_token_transaction',
        sign_token_transaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SignTokenTransactionRequest.fromBuffer(value),
        ($0.SignTokenTransactionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InternalFreezeTokensRequest,
            $0.InternalFreezeTokensResponse>(
        'internal_freeze_tokens',
        internal_freeze_tokens_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.InternalFreezeTokensRequest.fromBuffer(value),
        ($0.InternalFreezeTokensResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.PrepareTransactionResponse> prepare_transaction_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.PrepareTransactionRequest> $request) async {
    return prepare_transaction($call, await $request);
  }

  $async.Future<$0.PrepareTransactionResponse> prepare_transaction(
      $grpc.ServiceCall call, $0.PrepareTransactionRequest request);

  $async.Future<$0.SignTokenTransactionFromCoordinationResponse>
      sign_token_transaction_from_coordination_Pre(
          $grpc.ServiceCall $call,
          $async.Future<$0.SignTokenTransactionFromCoordinationRequest>
              $request) async {
    return sign_token_transaction_from_coordination($call, await $request);
  }

  $async.Future<$0.SignTokenTransactionFromCoordinationResponse>
      sign_token_transaction_from_coordination($grpc.ServiceCall call,
          $0.SignTokenTransactionFromCoordinationRequest request);

  $async.Future<$0.ExchangeRevocationSecretsSharesResponse>
      exchange_revocation_secrets_shares_Pre(
          $grpc.ServiceCall $call,
          $async.Future<$0.ExchangeRevocationSecretsSharesRequest>
              $request) async {
    return exchange_revocation_secrets_shares($call, await $request);
  }

  $async.Future<$0.ExchangeRevocationSecretsSharesResponse>
      exchange_revocation_secrets_shares($grpc.ServiceCall call,
          $0.ExchangeRevocationSecretsSharesRequest request);

  $async.Future<$0.SignTokenTransactionResponse> sign_token_transaction_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.SignTokenTransactionRequest> $request) async {
    return sign_token_transaction($call, await $request);
  }

  $async.Future<$0.SignTokenTransactionResponse> sign_token_transaction(
      $grpc.ServiceCall call, $0.SignTokenTransactionRequest request);

  $async.Future<$0.InternalFreezeTokensResponse> internal_freeze_tokens_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.InternalFreezeTokensRequest> $request) async {
    return internal_freeze_tokens($call, await $request);
  }

  $async.Future<$0.InternalFreezeTokensResponse> internal_freeze_tokens(
      $grpc.ServiceCall call, $0.InternalFreezeTokensRequest request);
}
