// This is a generated file - do not edit.
//
// Generated from spark_token.proto.

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

import 'spark_token.pb.dart' as $0;

export 'spark_token.pb.dart';

@$pb.GrpcServiceName('spark_token.SparkTokenService')
class SparkTokenServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  SparkTokenServiceClient(super.channel, {super.options, super.interceptors});

  /// Start process to create final token transaction with all inputs required
  /// from user and SOs (including revocation secret commitment)
  $grpc.ResponseFuture<$0.StartTransactionResponse> start_transaction(
    $0.StartTransactionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$start_transaction, request, options: options);
  }

  /// Complete the transaction and commit it with all SOs. This will be
  /// coordinated by one SO.
  $grpc.ResponseFuture<$0.CommitTransactionResponse> commit_transaction(
    $0.CommitTransactionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$commit_transaction, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryTokenMetadataResponse> query_token_metadata(
    $0.QueryTokenMetadataRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$query_token_metadata, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryTokenTransactionsResponse>
      query_token_transactions(
    $0.QueryTokenTransactionsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$query_token_transactions, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.QueryTokenOutputsResponse> query_token_outputs(
    $0.QueryTokenOutputsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$query_token_outputs, request, options: options);
  }

  $grpc.ResponseFuture<$0.FreezeTokensResponse> freeze_tokens(
    $0.FreezeTokensRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$freeze_tokens, request, options: options);
  }

  /// Replaces start_transaction and commit_transaction in single phase transaction flow.
  $grpc.ResponseFuture<$0.BroadcastTransactionResponse> broadcast_transaction(
    $0.BroadcastTransactionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$broadcast_transaction, request, options: options);
  }

  // method descriptors

  static final _$start_transaction = $grpc.ClientMethod<
          $0.StartTransactionRequest, $0.StartTransactionResponse>(
      '/spark_token.SparkTokenService/start_transaction',
      ($0.StartTransactionRequest value) => value.writeToBuffer(),
      $0.StartTransactionResponse.fromBuffer);
  static final _$commit_transaction = $grpc.ClientMethod<
          $0.CommitTransactionRequest, $0.CommitTransactionResponse>(
      '/spark_token.SparkTokenService/commit_transaction',
      ($0.CommitTransactionRequest value) => value.writeToBuffer(),
      $0.CommitTransactionResponse.fromBuffer);
  static final _$query_token_metadata = $grpc.ClientMethod<
          $0.QueryTokenMetadataRequest, $0.QueryTokenMetadataResponse>(
      '/spark_token.SparkTokenService/query_token_metadata',
      ($0.QueryTokenMetadataRequest value) => value.writeToBuffer(),
      $0.QueryTokenMetadataResponse.fromBuffer);
  static final _$query_token_transactions = $grpc.ClientMethod<
          $0.QueryTokenTransactionsRequest, $0.QueryTokenTransactionsResponse>(
      '/spark_token.SparkTokenService/query_token_transactions',
      ($0.QueryTokenTransactionsRequest value) => value.writeToBuffer(),
      $0.QueryTokenTransactionsResponse.fromBuffer);
  static final _$query_token_outputs = $grpc.ClientMethod<
          $0.QueryTokenOutputsRequest, $0.QueryTokenOutputsResponse>(
      '/spark_token.SparkTokenService/query_token_outputs',
      ($0.QueryTokenOutputsRequest value) => value.writeToBuffer(),
      $0.QueryTokenOutputsResponse.fromBuffer);
  static final _$freeze_tokens =
      $grpc.ClientMethod<$0.FreezeTokensRequest, $0.FreezeTokensResponse>(
          '/spark_token.SparkTokenService/freeze_tokens',
          ($0.FreezeTokensRequest value) => value.writeToBuffer(),
          $0.FreezeTokensResponse.fromBuffer);
  static final _$broadcast_transaction = $grpc.ClientMethod<
          $0.BroadcastTransactionRequest, $0.BroadcastTransactionResponse>(
      '/spark_token.SparkTokenService/broadcast_transaction',
      ($0.BroadcastTransactionRequest value) => value.writeToBuffer(),
      $0.BroadcastTransactionResponse.fromBuffer);
}

@$pb.GrpcServiceName('spark_token.SparkTokenService')
abstract class SparkTokenServiceBase extends $grpc.Service {
  $core.String get $name => 'spark_token.SparkTokenService';

  SparkTokenServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.StartTransactionRequest,
            $0.StartTransactionResponse>(
        'start_transaction',
        start_transaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.StartTransactionRequest.fromBuffer(value),
        ($0.StartTransactionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CommitTransactionRequest,
            $0.CommitTransactionResponse>(
        'commit_transaction',
        commit_transaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CommitTransactionRequest.fromBuffer(value),
        ($0.CommitTransactionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryTokenMetadataRequest,
            $0.QueryTokenMetadataResponse>(
        'query_token_metadata',
        query_token_metadata_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryTokenMetadataRequest.fromBuffer(value),
        ($0.QueryTokenMetadataResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryTokenTransactionsRequest,
            $0.QueryTokenTransactionsResponse>(
        'query_token_transactions',
        query_token_transactions_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryTokenTransactionsRequest.fromBuffer(value),
        ($0.QueryTokenTransactionsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryTokenOutputsRequest,
            $0.QueryTokenOutputsResponse>(
        'query_token_outputs',
        query_token_outputs_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryTokenOutputsRequest.fromBuffer(value),
        ($0.QueryTokenOutputsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.FreezeTokensRequest, $0.FreezeTokensResponse>(
            'freeze_tokens',
            freeze_tokens_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.FreezeTokensRequest.fromBuffer(value),
            ($0.FreezeTokensResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BroadcastTransactionRequest,
            $0.BroadcastTransactionResponse>(
        'broadcast_transaction',
        broadcast_transaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.BroadcastTransactionRequest.fromBuffer(value),
        ($0.BroadcastTransactionResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.StartTransactionResponse> start_transaction_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.StartTransactionRequest> $request) async {
    return start_transaction($call, await $request);
  }

  $async.Future<$0.StartTransactionResponse> start_transaction(
      $grpc.ServiceCall call, $0.StartTransactionRequest request);

  $async.Future<$0.CommitTransactionResponse> commit_transaction_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CommitTransactionRequest> $request) async {
    return commit_transaction($call, await $request);
  }

  $async.Future<$0.CommitTransactionResponse> commit_transaction(
      $grpc.ServiceCall call, $0.CommitTransactionRequest request);

  $async.Future<$0.QueryTokenMetadataResponse> query_token_metadata_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.QueryTokenMetadataRequest> $request) async {
    return query_token_metadata($call, await $request);
  }

  $async.Future<$0.QueryTokenMetadataResponse> query_token_metadata(
      $grpc.ServiceCall call, $0.QueryTokenMetadataRequest request);

  $async.Future<$0.QueryTokenTransactionsResponse> query_token_transactions_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.QueryTokenTransactionsRequest> $request) async {
    return query_token_transactions($call, await $request);
  }

  $async.Future<$0.QueryTokenTransactionsResponse> query_token_transactions(
      $grpc.ServiceCall call, $0.QueryTokenTransactionsRequest request);

  $async.Future<$0.QueryTokenOutputsResponse> query_token_outputs_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.QueryTokenOutputsRequest> $request) async {
    return query_token_outputs($call, await $request);
  }

  $async.Future<$0.QueryTokenOutputsResponse> query_token_outputs(
      $grpc.ServiceCall call, $0.QueryTokenOutputsRequest request);

  $async.Future<$0.FreezeTokensResponse> freeze_tokens_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.FreezeTokensRequest> $request) async {
    return freeze_tokens($call, await $request);
  }

  $async.Future<$0.FreezeTokensResponse> freeze_tokens(
      $grpc.ServiceCall call, $0.FreezeTokensRequest request);

  $async.Future<$0.BroadcastTransactionResponse> broadcast_transaction_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.BroadcastTransactionRequest> $request) async {
    return broadcast_transaction($call, await $request);
  }

  $async.Future<$0.BroadcastTransactionResponse> broadcast_transaction(
      $grpc.ServiceCall call, $0.BroadcastTransactionRequest request);
}
