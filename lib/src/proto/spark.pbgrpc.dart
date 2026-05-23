// This is a generated file - do not edit.
//
// Generated from spark.proto.

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

import 'spark.pb.dart' as $0;

export 'spark.pb.dart';

@$pb.GrpcServiceName('spark.SparkService')
class SparkServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  SparkServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.GenerateDepositAddressResponse>
      generate_deposit_address(
    $0.GenerateDepositAddressRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$generate_deposit_address, request,
        options: options);
  }

  /// Generates a new static deposit address of the user or returns the existing one for the specified network.
  $grpc.ResponseFuture<$0.GenerateStaticDepositAddressResponse>
      generate_static_deposit_address(
    $0.GenerateStaticDepositAddressRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$generate_static_deposit_address, request,
        options: options);
  }

  /// Archives the current default static deposit address and generates a new one for the user.
  $grpc.ResponseFuture<$0.RotateStaticDepositAddressResponse>
      rotate_static_deposit_address(
    $0.RotateStaticDepositAddressRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$rotate_static_deposit_address, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.StartDepositTreeCreationResponse>
      start_deposit_tree_creation(
    $0.StartDepositTreeCreationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$start_deposit_tree_creation, request,
        options: options);
  }

  /// Creates a deposit tree with the commitments from get_signing_commitments, after they are signed. Fails if the tree already exists.
  $grpc.ResponseFuture<$0.FinalizeDepositTreeCreationResponse>
      finalize_deposit_tree_creation(
    $0.FinalizeDepositTreeCreationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$finalize_deposit_tree_creation, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.FinalizeTransferResponse>
      finalize_transfer_with_transfer_package(
    $0.FinalizeTransferWithTransferPackageRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$finalize_transfer_with_transfer_package, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.QueryTransfersResponse> query_pending_transfers(
    $0.TransferFilter request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$query_pending_transfers, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.QueryTransfersResponse> query_all_transfers(
    $0.TransferFilter request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$query_all_transfers, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> claim_transfer_tweak_keys(
    $0.ClaimTransferTweakKeysRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$claim_transfer_tweak_keys, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.Empty> store_preimage_share(
    $0.StorePreimageShareRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$store_preimage_share, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> store_preimage_share_v2(
    $0.StorePreimageShareV2Request request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$store_preimage_share_v2, request,
        options: options);
  }

  /// Gets a specified number of signing commmitments for a set of nodes, which can be used as
  /// part of a transfer package.
  $grpc.ResponseFuture<$0.GetSigningCommitmentsResponse>
      get_signing_commitments(
    $0.GetSigningCommitmentsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$get_signing_commitments, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.ProvidePreimageResponse> provide_preimage(
    $0.ProvidePreimageRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$provide_preimage, request, options: options);
  }

  /// Used to check if a user has provided the preimage for a HODL invoice in lightning receive flow.
  $grpc.ResponseFuture<$0.QueryPreimageResponse> query_preimage(
    $0.QueryPreimageRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$query_preimage, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryHtlcResponse> query_htlc(
    $0.QueryHtlcRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$query_htlc, request, options: options);
  }

  /// Resets the timelocks for a leaf's transactions. Can be used to reset the
  /// refund transaction timelock for a leaf (when the node transaction
  /// timelock is still > 300) or reset the node and refund transaction
  /// timelock. Returns an error if a leaf is not yet eligible to renew the
  /// timelocks, see RenewLeafRequest for more details.
  $grpc.ResponseFuture<$0.RenewLeafResponse> renew_leaf(
    $0.RenewLeafRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$renew_leaf, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetSigningOperatorListResponse>
      get_signing_operator_list(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$get_signing_operator_list, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.QueryNodesResponse> query_nodes(
    $0.QueryNodesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$query_nodes, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryBalanceResponse> query_balance(
    $0.QueryBalanceRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$query_balance, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryUserSignedRefundsResponse>
      query_user_signed_refunds(
    $0.QueryUserSignedRefundsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$query_user_signed_refunds, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.QueryUnusedDepositAddressesResponse>
      query_unused_deposit_addresses(
    $0.QueryUnusedDepositAddressesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$query_unused_deposit_addresses, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.QueryStaticDepositAddressesResponse>
      query_static_deposit_addresses(
    $0.QueryStaticDepositAddressesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$query_static_deposit_addresses, request,
        options: options);
  }

  $grpc.ResponseStream<$0.SubscribeToEventsResponse> subscribe_to_events(
    $0.SubscribeToEventsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(
        _$subscribe_to_events, $async.Stream.fromIterable([request]),
        options: options);
  }

  /// Signs the provided refund transaction which spends the UTXO from a static
  /// deposit address. If successful, the UTXO will no longer be available to claim on
  /// the Spark network, and the refund transaction must be broadcasted on L1 to claim
  /// the funds. Returns an error if the UTXO has already been claimed.
  $grpc.ResponseFuture<$0.InitiateStaticDepositUtxoRefundResponse>
      initiate_static_deposit_utxo_refund(
    $0.InitiateStaticDepositUtxoRefundRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$initiate_static_deposit_utxo_refund, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.ExitSingleNodeTreesResponse> exit_single_node_trees(
    $0.ExitSingleNodeTreesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$exit_single_node_trees, request,
        options: options);
  }

  /// The following endpoints enforce inclusion of Direct Transactions used
  /// for unilateral exits
  $grpc.ResponseFuture<$0.CooperativeExitResponse> cooperative_exit_v2(
    $0.CooperativeExitRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$cooperative_exit_v2, request, options: options);
  }

  $grpc.ResponseFuture<$0.ClaimTransferSignRefundsResponse>
      claim_transfer_sign_refunds_v2(
    $0.ClaimTransferSignRefundsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$claim_transfer_sign_refunds_v2, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.FinalizeNodeSignaturesResponse>
      finalize_node_signatures_v2(
    $0.FinalizeNodeSignaturesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$finalize_node_signatures_v2, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.InitiatePreimageSwapResponse>
      initiate_preimage_swap_v2(
    $0.InitiatePreimageSwapRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$initiate_preimage_swap_v2, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.InitiatePreimageSwapResponse>
      initiate_preimage_swap_v3(
    $0.InitiatePreimageSwapRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$initiate_preimage_swap_v3, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.StartTransferResponse> start_leaf_swap_v2(
    $0.StartTransferRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$start_leaf_swap_v2, request, options: options);
  }

  $grpc.ResponseFuture<$0.StartTransferResponse> start_transfer_v2(
    $0.StartTransferRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$start_transfer_v2, request, options: options);
  }

  $grpc.ResponseFuture<$0.StartTransferResponse> start_transfer_v3(
    $0.StartTransferV3Request request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$start_transfer_v3, request, options: options);
  }

  $grpc.ResponseFuture<$0.ClaimTransferResponse> claim_transfer(
    $0.ClaimTransferRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$claim_transfer, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetUtxosForAddressResponse> get_utxos_for_address(
    $0.GetUtxosForAddressRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$get_utxos_for_address, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetUtxosForIdentityResponse> get_utxos_for_identity(
    $0.GetUtxosForIdentityRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$get_utxos_for_identity, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.QuerySparkInvoicesResponse> query_spark_invoices(
    $0.QuerySparkInvoicesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$query_spark_invoices, request, options: options);
  }

  /// Inititiates a primary transfer in a Swap V3 protocol. The sender submits the
  /// transfer package, but the SOs will not tweak the keys at this stage of the flow.
  /// It will be done later, when the SSP initiates a counter swap.
  $grpc.ResponseFuture<$0.InitiateSwapPrimaryTransferResponse>
      initiate_swap_primary_transfer(
    $0.InitiateSwapPrimaryTransferRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$initiate_swap_primary_transfer, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.UpdateWalletSettingResponse> update_wallet_setting(
    $0.UpdateWalletSettingRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$update_wallet_setting, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryWalletSettingResponse> query_wallet_setting(
    $0.QueryWalletSettingRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$query_wallet_setting, request, options: options);
  }

  $grpc.ResponseFuture<$0.QuerySparkTransactionVolumesResponse>
      query_spark_transaction_volumes(
    $0.QuerySparkTransactionVolumesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$query_spark_transaction_volumes, request,
        options: options);
  }

  // method descriptors

  static final _$generate_deposit_address = $grpc.ClientMethod<
          $0.GenerateDepositAddressRequest, $0.GenerateDepositAddressResponse>(
      '/spark.SparkService/generate_deposit_address',
      ($0.GenerateDepositAddressRequest value) => value.writeToBuffer(),
      $0.GenerateDepositAddressResponse.fromBuffer);
  static final _$generate_static_deposit_address = $grpc.ClientMethod<
          $0.GenerateStaticDepositAddressRequest,
          $0.GenerateStaticDepositAddressResponse>(
      '/spark.SparkService/generate_static_deposit_address',
      ($0.GenerateStaticDepositAddressRequest value) => value.writeToBuffer(),
      $0.GenerateStaticDepositAddressResponse.fromBuffer);
  static final _$rotate_static_deposit_address = $grpc.ClientMethod<
          $0.RotateStaticDepositAddressRequest,
          $0.RotateStaticDepositAddressResponse>(
      '/spark.SparkService/rotate_static_deposit_address',
      ($0.RotateStaticDepositAddressRequest value) => value.writeToBuffer(),
      $0.RotateStaticDepositAddressResponse.fromBuffer);
  static final _$start_deposit_tree_creation = $grpc.ClientMethod<
          $0.StartDepositTreeCreationRequest,
          $0.StartDepositTreeCreationResponse>(
      '/spark.SparkService/start_deposit_tree_creation',
      ($0.StartDepositTreeCreationRequest value) => value.writeToBuffer(),
      $0.StartDepositTreeCreationResponse.fromBuffer);
  static final _$finalize_deposit_tree_creation = $grpc.ClientMethod<
          $0.FinalizeDepositTreeCreationRequest,
          $0.FinalizeDepositTreeCreationResponse>(
      '/spark.SparkService/finalize_deposit_tree_creation',
      ($0.FinalizeDepositTreeCreationRequest value) => value.writeToBuffer(),
      $0.FinalizeDepositTreeCreationResponse.fromBuffer);
  static final _$finalize_transfer_with_transfer_package = $grpc.ClientMethod<
          $0.FinalizeTransferWithTransferPackageRequest,
          $0.FinalizeTransferResponse>(
      '/spark.SparkService/finalize_transfer_with_transfer_package',
      ($0.FinalizeTransferWithTransferPackageRequest value) =>
          value.writeToBuffer(),
      $0.FinalizeTransferResponse.fromBuffer);
  static final _$query_pending_transfers =
      $grpc.ClientMethod<$0.TransferFilter, $0.QueryTransfersResponse>(
          '/spark.SparkService/query_pending_transfers',
          ($0.TransferFilter value) => value.writeToBuffer(),
          $0.QueryTransfersResponse.fromBuffer);
  static final _$query_all_transfers =
      $grpc.ClientMethod<$0.TransferFilter, $0.QueryTransfersResponse>(
          '/spark.SparkService/query_all_transfers',
          ($0.TransferFilter value) => value.writeToBuffer(),
          $0.QueryTransfersResponse.fromBuffer);
  static final _$claim_transfer_tweak_keys =
      $grpc.ClientMethod<$0.ClaimTransferTweakKeysRequest, $1.Empty>(
          '/spark.SparkService/claim_transfer_tweak_keys',
          ($0.ClaimTransferTweakKeysRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$store_preimage_share =
      $grpc.ClientMethod<$0.StorePreimageShareRequest, $1.Empty>(
          '/spark.SparkService/store_preimage_share',
          ($0.StorePreimageShareRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$store_preimage_share_v2 =
      $grpc.ClientMethod<$0.StorePreimageShareV2Request, $1.Empty>(
          '/spark.SparkService/store_preimage_share_v2',
          ($0.StorePreimageShareV2Request value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$get_signing_commitments = $grpc.ClientMethod<
          $0.GetSigningCommitmentsRequest, $0.GetSigningCommitmentsResponse>(
      '/spark.SparkService/get_signing_commitments',
      ($0.GetSigningCommitmentsRequest value) => value.writeToBuffer(),
      $0.GetSigningCommitmentsResponse.fromBuffer);
  static final _$provide_preimage =
      $grpc.ClientMethod<$0.ProvidePreimageRequest, $0.ProvidePreimageResponse>(
          '/spark.SparkService/provide_preimage',
          ($0.ProvidePreimageRequest value) => value.writeToBuffer(),
          $0.ProvidePreimageResponse.fromBuffer);
  static final _$query_preimage =
      $grpc.ClientMethod<$0.QueryPreimageRequest, $0.QueryPreimageResponse>(
          '/spark.SparkService/query_preimage',
          ($0.QueryPreimageRequest value) => value.writeToBuffer(),
          $0.QueryPreimageResponse.fromBuffer);
  static final _$query_htlc =
      $grpc.ClientMethod<$0.QueryHtlcRequest, $0.QueryHtlcResponse>(
          '/spark.SparkService/query_htlc',
          ($0.QueryHtlcRequest value) => value.writeToBuffer(),
          $0.QueryHtlcResponse.fromBuffer);
  static final _$renew_leaf =
      $grpc.ClientMethod<$0.RenewLeafRequest, $0.RenewLeafResponse>(
          '/spark.SparkService/renew_leaf',
          ($0.RenewLeafRequest value) => value.writeToBuffer(),
          $0.RenewLeafResponse.fromBuffer);
  static final _$get_signing_operator_list =
      $grpc.ClientMethod<$1.Empty, $0.GetSigningOperatorListResponse>(
          '/spark.SparkService/get_signing_operator_list',
          ($1.Empty value) => value.writeToBuffer(),
          $0.GetSigningOperatorListResponse.fromBuffer);
  static final _$query_nodes =
      $grpc.ClientMethod<$0.QueryNodesRequest, $0.QueryNodesResponse>(
          '/spark.SparkService/query_nodes',
          ($0.QueryNodesRequest value) => value.writeToBuffer(),
          $0.QueryNodesResponse.fromBuffer);
  static final _$query_balance =
      $grpc.ClientMethod<$0.QueryBalanceRequest, $0.QueryBalanceResponse>(
          '/spark.SparkService/query_balance',
          ($0.QueryBalanceRequest value) => value.writeToBuffer(),
          $0.QueryBalanceResponse.fromBuffer);
  static final _$query_user_signed_refunds = $grpc.ClientMethod<
          $0.QueryUserSignedRefundsRequest, $0.QueryUserSignedRefundsResponse>(
      '/spark.SparkService/query_user_signed_refunds',
      ($0.QueryUserSignedRefundsRequest value) => value.writeToBuffer(),
      $0.QueryUserSignedRefundsResponse.fromBuffer);
  static final _$query_unused_deposit_addresses = $grpc.ClientMethod<
          $0.QueryUnusedDepositAddressesRequest,
          $0.QueryUnusedDepositAddressesResponse>(
      '/spark.SparkService/query_unused_deposit_addresses',
      ($0.QueryUnusedDepositAddressesRequest value) => value.writeToBuffer(),
      $0.QueryUnusedDepositAddressesResponse.fromBuffer);
  static final _$query_static_deposit_addresses = $grpc.ClientMethod<
          $0.QueryStaticDepositAddressesRequest,
          $0.QueryStaticDepositAddressesResponse>(
      '/spark.SparkService/query_static_deposit_addresses',
      ($0.QueryStaticDepositAddressesRequest value) => value.writeToBuffer(),
      $0.QueryStaticDepositAddressesResponse.fromBuffer);
  static final _$subscribe_to_events = $grpc.ClientMethod<
          $0.SubscribeToEventsRequest, $0.SubscribeToEventsResponse>(
      '/spark.SparkService/subscribe_to_events',
      ($0.SubscribeToEventsRequest value) => value.writeToBuffer(),
      $0.SubscribeToEventsResponse.fromBuffer);
  static final _$initiate_static_deposit_utxo_refund = $grpc.ClientMethod<
          $0.InitiateStaticDepositUtxoRefundRequest,
          $0.InitiateStaticDepositUtxoRefundResponse>(
      '/spark.SparkService/initiate_static_deposit_utxo_refund',
      ($0.InitiateStaticDepositUtxoRefundRequest value) =>
          value.writeToBuffer(),
      $0.InitiateStaticDepositUtxoRefundResponse.fromBuffer);
  static final _$exit_single_node_trees = $grpc.ClientMethod<
          $0.ExitSingleNodeTreesRequest, $0.ExitSingleNodeTreesResponse>(
      '/spark.SparkService/exit_single_node_trees',
      ($0.ExitSingleNodeTreesRequest value) => value.writeToBuffer(),
      $0.ExitSingleNodeTreesResponse.fromBuffer);
  static final _$cooperative_exit_v2 =
      $grpc.ClientMethod<$0.CooperativeExitRequest, $0.CooperativeExitResponse>(
          '/spark.SparkService/cooperative_exit_v2',
          ($0.CooperativeExitRequest value) => value.writeToBuffer(),
          $0.CooperativeExitResponse.fromBuffer);
  static final _$claim_transfer_sign_refunds_v2 = $grpc.ClientMethod<
          $0.ClaimTransferSignRefundsRequest,
          $0.ClaimTransferSignRefundsResponse>(
      '/spark.SparkService/claim_transfer_sign_refunds_v2',
      ($0.ClaimTransferSignRefundsRequest value) => value.writeToBuffer(),
      $0.ClaimTransferSignRefundsResponse.fromBuffer);
  static final _$finalize_node_signatures_v2 = $grpc.ClientMethod<
          $0.FinalizeNodeSignaturesRequest, $0.FinalizeNodeSignaturesResponse>(
      '/spark.SparkService/finalize_node_signatures_v2',
      ($0.FinalizeNodeSignaturesRequest value) => value.writeToBuffer(),
      $0.FinalizeNodeSignaturesResponse.fromBuffer);
  static final _$initiate_preimage_swap_v2 = $grpc.ClientMethod<
          $0.InitiatePreimageSwapRequest, $0.InitiatePreimageSwapResponse>(
      '/spark.SparkService/initiate_preimage_swap_v2',
      ($0.InitiatePreimageSwapRequest value) => value.writeToBuffer(),
      $0.InitiatePreimageSwapResponse.fromBuffer);
  static final _$initiate_preimage_swap_v3 = $grpc.ClientMethod<
          $0.InitiatePreimageSwapRequest, $0.InitiatePreimageSwapResponse>(
      '/spark.SparkService/initiate_preimage_swap_v3',
      ($0.InitiatePreimageSwapRequest value) => value.writeToBuffer(),
      $0.InitiatePreimageSwapResponse.fromBuffer);
  static final _$start_leaf_swap_v2 =
      $grpc.ClientMethod<$0.StartTransferRequest, $0.StartTransferResponse>(
          '/spark.SparkService/start_leaf_swap_v2',
          ($0.StartTransferRequest value) => value.writeToBuffer(),
          $0.StartTransferResponse.fromBuffer);
  static final _$start_transfer_v2 =
      $grpc.ClientMethod<$0.StartTransferRequest, $0.StartTransferResponse>(
          '/spark.SparkService/start_transfer_v2',
          ($0.StartTransferRequest value) => value.writeToBuffer(),
          $0.StartTransferResponse.fromBuffer);
  static final _$start_transfer_v3 =
      $grpc.ClientMethod<$0.StartTransferV3Request, $0.StartTransferResponse>(
          '/spark.SparkService/start_transfer_v3',
          ($0.StartTransferV3Request value) => value.writeToBuffer(),
          $0.StartTransferResponse.fromBuffer);
  static final _$claim_transfer =
      $grpc.ClientMethod<$0.ClaimTransferRequest, $0.ClaimTransferResponse>(
          '/spark.SparkService/claim_transfer',
          ($0.ClaimTransferRequest value) => value.writeToBuffer(),
          $0.ClaimTransferResponse.fromBuffer);
  static final _$get_utxos_for_address = $grpc.ClientMethod<
          $0.GetUtxosForAddressRequest, $0.GetUtxosForAddressResponse>(
      '/spark.SparkService/get_utxos_for_address',
      ($0.GetUtxosForAddressRequest value) => value.writeToBuffer(),
      $0.GetUtxosForAddressResponse.fromBuffer);
  static final _$get_utxos_for_identity = $grpc.ClientMethod<
          $0.GetUtxosForIdentityRequest, $0.GetUtxosForIdentityResponse>(
      '/spark.SparkService/get_utxos_for_identity',
      ($0.GetUtxosForIdentityRequest value) => value.writeToBuffer(),
      $0.GetUtxosForIdentityResponse.fromBuffer);
  static final _$query_spark_invoices = $grpc.ClientMethod<
          $0.QuerySparkInvoicesRequest, $0.QuerySparkInvoicesResponse>(
      '/spark.SparkService/query_spark_invoices',
      ($0.QuerySparkInvoicesRequest value) => value.writeToBuffer(),
      $0.QuerySparkInvoicesResponse.fromBuffer);
  static final _$initiate_swap_primary_transfer = $grpc.ClientMethod<
          $0.InitiateSwapPrimaryTransferRequest,
          $0.InitiateSwapPrimaryTransferResponse>(
      '/spark.SparkService/initiate_swap_primary_transfer',
      ($0.InitiateSwapPrimaryTransferRequest value) => value.writeToBuffer(),
      $0.InitiateSwapPrimaryTransferResponse.fromBuffer);
  static final _$update_wallet_setting = $grpc.ClientMethod<
          $0.UpdateWalletSettingRequest, $0.UpdateWalletSettingResponse>(
      '/spark.SparkService/update_wallet_setting',
      ($0.UpdateWalletSettingRequest value) => value.writeToBuffer(),
      $0.UpdateWalletSettingResponse.fromBuffer);
  static final _$query_wallet_setting = $grpc.ClientMethod<
          $0.QueryWalletSettingRequest, $0.QueryWalletSettingResponse>(
      '/spark.SparkService/query_wallet_setting',
      ($0.QueryWalletSettingRequest value) => value.writeToBuffer(),
      $0.QueryWalletSettingResponse.fromBuffer);
  static final _$query_spark_transaction_volumes = $grpc.ClientMethod<
          $0.QuerySparkTransactionVolumesRequest,
          $0.QuerySparkTransactionVolumesResponse>(
      '/spark.SparkService/query_spark_transaction_volumes',
      ($0.QuerySparkTransactionVolumesRequest value) => value.writeToBuffer(),
      $0.QuerySparkTransactionVolumesResponse.fromBuffer);
}

@$pb.GrpcServiceName('spark.SparkService')
abstract class SparkServiceBase extends $grpc.Service {
  $core.String get $name => 'spark.SparkService';

  SparkServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GenerateDepositAddressRequest,
            $0.GenerateDepositAddressResponse>(
        'generate_deposit_address',
        generate_deposit_address_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GenerateDepositAddressRequest.fromBuffer(value),
        ($0.GenerateDepositAddressResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GenerateStaticDepositAddressRequest,
            $0.GenerateStaticDepositAddressResponse>(
        'generate_static_deposit_address',
        generate_static_deposit_address_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GenerateStaticDepositAddressRequest.fromBuffer(value),
        ($0.GenerateStaticDepositAddressResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RotateStaticDepositAddressRequest,
            $0.RotateStaticDepositAddressResponse>(
        'rotate_static_deposit_address',
        rotate_static_deposit_address_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RotateStaticDepositAddressRequest.fromBuffer(value),
        ($0.RotateStaticDepositAddressResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StartDepositTreeCreationRequest,
            $0.StartDepositTreeCreationResponse>(
        'start_deposit_tree_creation',
        start_deposit_tree_creation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.StartDepositTreeCreationRequest.fromBuffer(value),
        ($0.StartDepositTreeCreationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FinalizeDepositTreeCreationRequest,
            $0.FinalizeDepositTreeCreationResponse>(
        'finalize_deposit_tree_creation',
        finalize_deposit_tree_creation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FinalizeDepositTreeCreationRequest.fromBuffer(value),
        ($0.FinalizeDepositTreeCreationResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<
            $0.FinalizeTransferWithTransferPackageRequest,
            $0.FinalizeTransferResponse>(
        'finalize_transfer_with_transfer_package',
        finalize_transfer_with_transfer_package_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FinalizeTransferWithTransferPackageRequest.fromBuffer(value),
        ($0.FinalizeTransferResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.TransferFilter, $0.QueryTransfersResponse>(
            'query_pending_transfers',
            query_pending_transfers_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.TransferFilter.fromBuffer(value),
            ($0.QueryTransfersResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.TransferFilter, $0.QueryTransfersResponse>(
            'query_all_transfers',
            query_all_transfers_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.TransferFilter.fromBuffer(value),
            ($0.QueryTransfersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ClaimTransferTweakKeysRequest, $1.Empty>(
        'claim_transfer_tweak_keys',
        claim_transfer_tweak_keys_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ClaimTransferTweakKeysRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StorePreimageShareRequest, $1.Empty>(
        'store_preimage_share',
        store_preimage_share_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.StorePreimageShareRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StorePreimageShareV2Request, $1.Empty>(
        'store_preimage_share_v2',
        store_preimage_share_v2_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.StorePreimageShareV2Request.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetSigningCommitmentsRequest,
            $0.GetSigningCommitmentsResponse>(
        'get_signing_commitments',
        get_signing_commitments_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetSigningCommitmentsRequest.fromBuffer(value),
        ($0.GetSigningCommitmentsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ProvidePreimageRequest,
            $0.ProvidePreimageResponse>(
        'provide_preimage',
        provide_preimage_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ProvidePreimageRequest.fromBuffer(value),
        ($0.ProvidePreimageResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.QueryPreimageRequest, $0.QueryPreimageResponse>(
            'query_preimage',
            query_preimage_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.QueryPreimageRequest.fromBuffer(value),
            ($0.QueryPreimageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryHtlcRequest, $0.QueryHtlcResponse>(
        'query_htlc',
        query_htlc_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.QueryHtlcRequest.fromBuffer(value),
        ($0.QueryHtlcResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RenewLeafRequest, $0.RenewLeafResponse>(
        'renew_leaf',
        renew_leaf_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RenewLeafRequest.fromBuffer(value),
        ($0.RenewLeafResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.GetSigningOperatorListResponse>(
        'get_signing_operator_list',
        get_signing_operator_list_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.GetSigningOperatorListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryNodesRequest, $0.QueryNodesResponse>(
        'query_nodes',
        query_nodes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.QueryNodesRequest.fromBuffer(value),
        ($0.QueryNodesResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.QueryBalanceRequest, $0.QueryBalanceResponse>(
            'query_balance',
            query_balance_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.QueryBalanceRequest.fromBuffer(value),
            ($0.QueryBalanceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryUserSignedRefundsRequest,
            $0.QueryUserSignedRefundsResponse>(
        'query_user_signed_refunds',
        query_user_signed_refunds_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryUserSignedRefundsRequest.fromBuffer(value),
        ($0.QueryUserSignedRefundsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryUnusedDepositAddressesRequest,
            $0.QueryUnusedDepositAddressesResponse>(
        'query_unused_deposit_addresses',
        query_unused_deposit_addresses_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryUnusedDepositAddressesRequest.fromBuffer(value),
        ($0.QueryUnusedDepositAddressesResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryStaticDepositAddressesRequest,
            $0.QueryStaticDepositAddressesResponse>(
        'query_static_deposit_addresses',
        query_static_deposit_addresses_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryStaticDepositAddressesRequest.fromBuffer(value),
        ($0.QueryStaticDepositAddressesResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SubscribeToEventsRequest,
            $0.SubscribeToEventsResponse>(
        'subscribe_to_events',
        subscribe_to_events_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.SubscribeToEventsRequest.fromBuffer(value),
        ($0.SubscribeToEventsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InitiateStaticDepositUtxoRefundRequest,
            $0.InitiateStaticDepositUtxoRefundResponse>(
        'initiate_static_deposit_utxo_refund',
        initiate_static_deposit_utxo_refund_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.InitiateStaticDepositUtxoRefundRequest.fromBuffer(value),
        ($0.InitiateStaticDepositUtxoRefundResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ExitSingleNodeTreesRequest,
            $0.ExitSingleNodeTreesResponse>(
        'exit_single_node_trees',
        exit_single_node_trees_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ExitSingleNodeTreesRequest.fromBuffer(value),
        ($0.ExitSingleNodeTreesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CooperativeExitRequest,
            $0.CooperativeExitResponse>(
        'cooperative_exit_v2',
        cooperative_exit_v2_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CooperativeExitRequest.fromBuffer(value),
        ($0.CooperativeExitResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ClaimTransferSignRefundsRequest,
            $0.ClaimTransferSignRefundsResponse>(
        'claim_transfer_sign_refunds_v2',
        claim_transfer_sign_refunds_v2_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ClaimTransferSignRefundsRequest.fromBuffer(value),
        ($0.ClaimTransferSignRefundsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FinalizeNodeSignaturesRequest,
            $0.FinalizeNodeSignaturesResponse>(
        'finalize_node_signatures_v2',
        finalize_node_signatures_v2_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FinalizeNodeSignaturesRequest.fromBuffer(value),
        ($0.FinalizeNodeSignaturesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InitiatePreimageSwapRequest,
            $0.InitiatePreimageSwapResponse>(
        'initiate_preimage_swap_v2',
        initiate_preimage_swap_v2_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.InitiatePreimageSwapRequest.fromBuffer(value),
        ($0.InitiatePreimageSwapResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InitiatePreimageSwapRequest,
            $0.InitiatePreimageSwapResponse>(
        'initiate_preimage_swap_v3',
        initiate_preimage_swap_v3_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.InitiatePreimageSwapRequest.fromBuffer(value),
        ($0.InitiatePreimageSwapResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.StartTransferRequest, $0.StartTransferResponse>(
            'start_leaf_swap_v2',
            start_leaf_swap_v2_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.StartTransferRequest.fromBuffer(value),
            ($0.StartTransferResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.StartTransferRequest, $0.StartTransferResponse>(
            'start_transfer_v2',
            start_transfer_v2_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.StartTransferRequest.fromBuffer(value),
            ($0.StartTransferResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StartTransferV3Request,
            $0.StartTransferResponse>(
        'start_transfer_v3',
        start_transfer_v3_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.StartTransferV3Request.fromBuffer(value),
        ($0.StartTransferResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ClaimTransferRequest, $0.ClaimTransferResponse>(
            'claim_transfer',
            claim_transfer_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ClaimTransferRequest.fromBuffer(value),
            ($0.ClaimTransferResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetUtxosForAddressRequest,
            $0.GetUtxosForAddressResponse>(
        'get_utxos_for_address',
        get_utxos_for_address_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetUtxosForAddressRequest.fromBuffer(value),
        ($0.GetUtxosForAddressResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetUtxosForIdentityRequest,
            $0.GetUtxosForIdentityResponse>(
        'get_utxos_for_identity',
        get_utxos_for_identity_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetUtxosForIdentityRequest.fromBuffer(value),
        ($0.GetUtxosForIdentityResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QuerySparkInvoicesRequest,
            $0.QuerySparkInvoicesResponse>(
        'query_spark_invoices',
        query_spark_invoices_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QuerySparkInvoicesRequest.fromBuffer(value),
        ($0.QuerySparkInvoicesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InitiateSwapPrimaryTransferRequest,
            $0.InitiateSwapPrimaryTransferResponse>(
        'initiate_swap_primary_transfer',
        initiate_swap_primary_transfer_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.InitiateSwapPrimaryTransferRequest.fromBuffer(value),
        ($0.InitiateSwapPrimaryTransferResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateWalletSettingRequest,
            $0.UpdateWalletSettingResponse>(
        'update_wallet_setting',
        update_wallet_setting_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateWalletSettingRequest.fromBuffer(value),
        ($0.UpdateWalletSettingResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryWalletSettingRequest,
            $0.QueryWalletSettingResponse>(
        'query_wallet_setting',
        query_wallet_setting_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryWalletSettingRequest.fromBuffer(value),
        ($0.QueryWalletSettingResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QuerySparkTransactionVolumesRequest,
            $0.QuerySparkTransactionVolumesResponse>(
        'query_spark_transaction_volumes',
        query_spark_transaction_volumes_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QuerySparkTransactionVolumesRequest.fromBuffer(value),
        ($0.QuerySparkTransactionVolumesResponse value) =>
            value.writeToBuffer()));
  }

  $async.Future<$0.GenerateDepositAddressResponse> generate_deposit_address_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GenerateDepositAddressRequest> $request) async {
    return generate_deposit_address($call, await $request);
  }

  $async.Future<$0.GenerateDepositAddressResponse> generate_deposit_address(
      $grpc.ServiceCall call, $0.GenerateDepositAddressRequest request);

  $async.Future<$0.GenerateStaticDepositAddressResponse>
      generate_static_deposit_address_Pre(
          $grpc.ServiceCall $call,
          $async.Future<$0.GenerateStaticDepositAddressRequest>
              $request) async {
    return generate_static_deposit_address($call, await $request);
  }

  $async.Future<$0.GenerateStaticDepositAddressResponse>
      generate_static_deposit_address($grpc.ServiceCall call,
          $0.GenerateStaticDepositAddressRequest request);

  $async.Future<$0.RotateStaticDepositAddressResponse>
      rotate_static_deposit_address_Pre($grpc.ServiceCall $call,
          $async.Future<$0.RotateStaticDepositAddressRequest> $request) async {
    return rotate_static_deposit_address($call, await $request);
  }

  $async.Future<$0.RotateStaticDepositAddressResponse>
      rotate_static_deposit_address(
          $grpc.ServiceCall call, $0.RotateStaticDepositAddressRequest request);

  $async.Future<$0.StartDepositTreeCreationResponse>
      start_deposit_tree_creation_Pre($grpc.ServiceCall $call,
          $async.Future<$0.StartDepositTreeCreationRequest> $request) async {
    return start_deposit_tree_creation($call, await $request);
  }

  $async.Future<$0.StartDepositTreeCreationResponse>
      start_deposit_tree_creation(
          $grpc.ServiceCall call, $0.StartDepositTreeCreationRequest request);

  $async.Future<$0.FinalizeDepositTreeCreationResponse>
      finalize_deposit_tree_creation_Pre($grpc.ServiceCall $call,
          $async.Future<$0.FinalizeDepositTreeCreationRequest> $request) async {
    return finalize_deposit_tree_creation($call, await $request);
  }

  $async.Future<$0.FinalizeDepositTreeCreationResponse>
      finalize_deposit_tree_creation($grpc.ServiceCall call,
          $0.FinalizeDepositTreeCreationRequest request);

  $async.Future<$0.FinalizeTransferResponse>
      finalize_transfer_with_transfer_package_Pre(
          $grpc.ServiceCall $call,
          $async.Future<$0.FinalizeTransferWithTransferPackageRequest>
              $request) async {
    return finalize_transfer_with_transfer_package($call, await $request);
  }

  $async.Future<$0.FinalizeTransferResponse>
      finalize_transfer_with_transfer_package($grpc.ServiceCall call,
          $0.FinalizeTransferWithTransferPackageRequest request);

  $async.Future<$0.QueryTransfersResponse> query_pending_transfers_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.TransferFilter> $request) async {
    return query_pending_transfers($call, await $request);
  }

  $async.Future<$0.QueryTransfersResponse> query_pending_transfers(
      $grpc.ServiceCall call, $0.TransferFilter request);

  $async.Future<$0.QueryTransfersResponse> query_all_transfers_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.TransferFilter> $request) async {
    return query_all_transfers($call, await $request);
  }

  $async.Future<$0.QueryTransfersResponse> query_all_transfers(
      $grpc.ServiceCall call, $0.TransferFilter request);

  $async.Future<$1.Empty> claim_transfer_tweak_keys_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ClaimTransferTweakKeysRequest> $request) async {
    return claim_transfer_tweak_keys($call, await $request);
  }

  $async.Future<$1.Empty> claim_transfer_tweak_keys(
      $grpc.ServiceCall call, $0.ClaimTransferTweakKeysRequest request);

  $async.Future<$1.Empty> store_preimage_share_Pre($grpc.ServiceCall $call,
      $async.Future<$0.StorePreimageShareRequest> $request) async {
    return store_preimage_share($call, await $request);
  }

  $async.Future<$1.Empty> store_preimage_share(
      $grpc.ServiceCall call, $0.StorePreimageShareRequest request);

  $async.Future<$1.Empty> store_preimage_share_v2_Pre($grpc.ServiceCall $call,
      $async.Future<$0.StorePreimageShareV2Request> $request) async {
    return store_preimage_share_v2($call, await $request);
  }

  $async.Future<$1.Empty> store_preimage_share_v2(
      $grpc.ServiceCall call, $0.StorePreimageShareV2Request request);

  $async.Future<$0.GetSigningCommitmentsResponse> get_signing_commitments_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetSigningCommitmentsRequest> $request) async {
    return get_signing_commitments($call, await $request);
  }

  $async.Future<$0.GetSigningCommitmentsResponse> get_signing_commitments(
      $grpc.ServiceCall call, $0.GetSigningCommitmentsRequest request);

  $async.Future<$0.ProvidePreimageResponse> provide_preimage_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ProvidePreimageRequest> $request) async {
    return provide_preimage($call, await $request);
  }

  $async.Future<$0.ProvidePreimageResponse> provide_preimage(
      $grpc.ServiceCall call, $0.ProvidePreimageRequest request);

  $async.Future<$0.QueryPreimageResponse> query_preimage_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.QueryPreimageRequest> $request) async {
    return query_preimage($call, await $request);
  }

  $async.Future<$0.QueryPreimageResponse> query_preimage(
      $grpc.ServiceCall call, $0.QueryPreimageRequest request);

  $async.Future<$0.QueryHtlcResponse> query_htlc_Pre($grpc.ServiceCall $call,
      $async.Future<$0.QueryHtlcRequest> $request) async {
    return query_htlc($call, await $request);
  }

  $async.Future<$0.QueryHtlcResponse> query_htlc(
      $grpc.ServiceCall call, $0.QueryHtlcRequest request);

  $async.Future<$0.RenewLeafResponse> renew_leaf_Pre($grpc.ServiceCall $call,
      $async.Future<$0.RenewLeafRequest> $request) async {
    return renew_leaf($call, await $request);
  }

  $async.Future<$0.RenewLeafResponse> renew_leaf(
      $grpc.ServiceCall call, $0.RenewLeafRequest request);

  $async.Future<$0.GetSigningOperatorListResponse>
      get_signing_operator_list_Pre(
          $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return get_signing_operator_list($call, await $request);
  }

  $async.Future<$0.GetSigningOperatorListResponse> get_signing_operator_list(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$0.QueryNodesResponse> query_nodes_Pre($grpc.ServiceCall $call,
      $async.Future<$0.QueryNodesRequest> $request) async {
    return query_nodes($call, await $request);
  }

  $async.Future<$0.QueryNodesResponse> query_nodes(
      $grpc.ServiceCall call, $0.QueryNodesRequest request);

  $async.Future<$0.QueryBalanceResponse> query_balance_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.QueryBalanceRequest> $request) async {
    return query_balance($call, await $request);
  }

  $async.Future<$0.QueryBalanceResponse> query_balance(
      $grpc.ServiceCall call, $0.QueryBalanceRequest request);

  $async.Future<$0.QueryUserSignedRefundsResponse>
      query_user_signed_refunds_Pre($grpc.ServiceCall $call,
          $async.Future<$0.QueryUserSignedRefundsRequest> $request) async {
    return query_user_signed_refunds($call, await $request);
  }

  $async.Future<$0.QueryUserSignedRefundsResponse> query_user_signed_refunds(
      $grpc.ServiceCall call, $0.QueryUserSignedRefundsRequest request);

  $async.Future<$0.QueryUnusedDepositAddressesResponse>
      query_unused_deposit_addresses_Pre($grpc.ServiceCall $call,
          $async.Future<$0.QueryUnusedDepositAddressesRequest> $request) async {
    return query_unused_deposit_addresses($call, await $request);
  }

  $async.Future<$0.QueryUnusedDepositAddressesResponse>
      query_unused_deposit_addresses($grpc.ServiceCall call,
          $0.QueryUnusedDepositAddressesRequest request);

  $async.Future<$0.QueryStaticDepositAddressesResponse>
      query_static_deposit_addresses_Pre($grpc.ServiceCall $call,
          $async.Future<$0.QueryStaticDepositAddressesRequest> $request) async {
    return query_static_deposit_addresses($call, await $request);
  }

  $async.Future<$0.QueryStaticDepositAddressesResponse>
      query_static_deposit_addresses($grpc.ServiceCall call,
          $0.QueryStaticDepositAddressesRequest request);

  $async.Stream<$0.SubscribeToEventsResponse> subscribe_to_events_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.SubscribeToEventsRequest> $request) async* {
    yield* subscribe_to_events($call, await $request);
  }

  $async.Stream<$0.SubscribeToEventsResponse> subscribe_to_events(
      $grpc.ServiceCall call, $0.SubscribeToEventsRequest request);

  $async.Future<$0.InitiateStaticDepositUtxoRefundResponse>
      initiate_static_deposit_utxo_refund_Pre(
          $grpc.ServiceCall $call,
          $async.Future<$0.InitiateStaticDepositUtxoRefundRequest>
              $request) async {
    return initiate_static_deposit_utxo_refund($call, await $request);
  }

  $async.Future<$0.InitiateStaticDepositUtxoRefundResponse>
      initiate_static_deposit_utxo_refund($grpc.ServiceCall call,
          $0.InitiateStaticDepositUtxoRefundRequest request);

  $async.Future<$0.ExitSingleNodeTreesResponse> exit_single_node_trees_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ExitSingleNodeTreesRequest> $request) async {
    return exit_single_node_trees($call, await $request);
  }

  $async.Future<$0.ExitSingleNodeTreesResponse> exit_single_node_trees(
      $grpc.ServiceCall call, $0.ExitSingleNodeTreesRequest request);

  $async.Future<$0.CooperativeExitResponse> cooperative_exit_v2_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CooperativeExitRequest> $request) async {
    return cooperative_exit_v2($call, await $request);
  }

  $async.Future<$0.CooperativeExitResponse> cooperative_exit_v2(
      $grpc.ServiceCall call, $0.CooperativeExitRequest request);

  $async.Future<$0.ClaimTransferSignRefundsResponse>
      claim_transfer_sign_refunds_v2_Pre($grpc.ServiceCall $call,
          $async.Future<$0.ClaimTransferSignRefundsRequest> $request) async {
    return claim_transfer_sign_refunds_v2($call, await $request);
  }

  $async.Future<$0.ClaimTransferSignRefundsResponse>
      claim_transfer_sign_refunds_v2(
          $grpc.ServiceCall call, $0.ClaimTransferSignRefundsRequest request);

  $async.Future<$0.FinalizeNodeSignaturesResponse>
      finalize_node_signatures_v2_Pre($grpc.ServiceCall $call,
          $async.Future<$0.FinalizeNodeSignaturesRequest> $request) async {
    return finalize_node_signatures_v2($call, await $request);
  }

  $async.Future<$0.FinalizeNodeSignaturesResponse> finalize_node_signatures_v2(
      $grpc.ServiceCall call, $0.FinalizeNodeSignaturesRequest request);

  $async.Future<$0.InitiatePreimageSwapResponse> initiate_preimage_swap_v2_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.InitiatePreimageSwapRequest> $request) async {
    return initiate_preimage_swap_v2($call, await $request);
  }

  $async.Future<$0.InitiatePreimageSwapResponse> initiate_preimage_swap_v2(
      $grpc.ServiceCall call, $0.InitiatePreimageSwapRequest request);

  $async.Future<$0.InitiatePreimageSwapResponse> initiate_preimage_swap_v3_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.InitiatePreimageSwapRequest> $request) async {
    return initiate_preimage_swap_v3($call, await $request);
  }

  $async.Future<$0.InitiatePreimageSwapResponse> initiate_preimage_swap_v3(
      $grpc.ServiceCall call, $0.InitiatePreimageSwapRequest request);

  $async.Future<$0.StartTransferResponse> start_leaf_swap_v2_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.StartTransferRequest> $request) async {
    return start_leaf_swap_v2($call, await $request);
  }

  $async.Future<$0.StartTransferResponse> start_leaf_swap_v2(
      $grpc.ServiceCall call, $0.StartTransferRequest request);

  $async.Future<$0.StartTransferResponse> start_transfer_v2_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.StartTransferRequest> $request) async {
    return start_transfer_v2($call, await $request);
  }

  $async.Future<$0.StartTransferResponse> start_transfer_v2(
      $grpc.ServiceCall call, $0.StartTransferRequest request);

  $async.Future<$0.StartTransferResponse> start_transfer_v3_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.StartTransferV3Request> $request) async {
    return start_transfer_v3($call, await $request);
  }

  $async.Future<$0.StartTransferResponse> start_transfer_v3(
      $grpc.ServiceCall call, $0.StartTransferV3Request request);

  $async.Future<$0.ClaimTransferResponse> claim_transfer_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ClaimTransferRequest> $request) async {
    return claim_transfer($call, await $request);
  }

  $async.Future<$0.ClaimTransferResponse> claim_transfer(
      $grpc.ServiceCall call, $0.ClaimTransferRequest request);

  $async.Future<$0.GetUtxosForAddressResponse> get_utxos_for_address_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetUtxosForAddressRequest> $request) async {
    return get_utxos_for_address($call, await $request);
  }

  $async.Future<$0.GetUtxosForAddressResponse> get_utxos_for_address(
      $grpc.ServiceCall call, $0.GetUtxosForAddressRequest request);

  $async.Future<$0.GetUtxosForIdentityResponse> get_utxos_for_identity_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetUtxosForIdentityRequest> $request) async {
    return get_utxos_for_identity($call, await $request);
  }

  $async.Future<$0.GetUtxosForIdentityResponse> get_utxos_for_identity(
      $grpc.ServiceCall call, $0.GetUtxosForIdentityRequest request);

  $async.Future<$0.QuerySparkInvoicesResponse> query_spark_invoices_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.QuerySparkInvoicesRequest> $request) async {
    return query_spark_invoices($call, await $request);
  }

  $async.Future<$0.QuerySparkInvoicesResponse> query_spark_invoices(
      $grpc.ServiceCall call, $0.QuerySparkInvoicesRequest request);

  $async.Future<$0.InitiateSwapPrimaryTransferResponse>
      initiate_swap_primary_transfer_Pre($grpc.ServiceCall $call,
          $async.Future<$0.InitiateSwapPrimaryTransferRequest> $request) async {
    return initiate_swap_primary_transfer($call, await $request);
  }

  $async.Future<$0.InitiateSwapPrimaryTransferResponse>
      initiate_swap_primary_transfer($grpc.ServiceCall call,
          $0.InitiateSwapPrimaryTransferRequest request);

  $async.Future<$0.UpdateWalletSettingResponse> update_wallet_setting_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.UpdateWalletSettingRequest> $request) async {
    return update_wallet_setting($call, await $request);
  }

  $async.Future<$0.UpdateWalletSettingResponse> update_wallet_setting(
      $grpc.ServiceCall call, $0.UpdateWalletSettingRequest request);

  $async.Future<$0.QueryWalletSettingResponse> query_wallet_setting_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.QueryWalletSettingRequest> $request) async {
    return query_wallet_setting($call, await $request);
  }

  $async.Future<$0.QueryWalletSettingResponse> query_wallet_setting(
      $grpc.ServiceCall call, $0.QueryWalletSettingRequest request);

  $async.Future<$0.QuerySparkTransactionVolumesResponse>
      query_spark_transaction_volumes_Pre(
          $grpc.ServiceCall $call,
          $async.Future<$0.QuerySparkTransactionVolumesRequest>
              $request) async {
    return query_spark_transaction_volumes($call, await $request);
  }

  $async.Future<$0.QuerySparkTransactionVolumesResponse>
      query_spark_transaction_volumes($grpc.ServiceCall call,
          $0.QuerySparkTransactionVolumesRequest request);
}
