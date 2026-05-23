// This is a generated file - do not edit.
//
// Generated from spark_internal.proto.

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

import 'spark.pb.dart' as $2;
import 'spark_internal.pb.dart' as $0;

export 'spark_internal.pb.dart';

@$pb.GrpcServiceName('spark_internal.SparkInternalService')
class SparkInternalServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  SparkInternalServiceClient(super.channel,
      {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.Empty> mark_keyshares_as_used(
    $0.MarkKeysharesAsUsedRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$mark_keyshares_as_used, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.MarkKeyshareForDepositAddressResponse>
      mark_keyshare_for_deposit_address(
    $0.MarkKeyshareForDepositAddressRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$mark_keyshare_for_deposit_address, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.Empty> reserve_entity_dkg_key(
    $0.ReserveEntityDkgKeyRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$reserve_entity_dkg_key, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.Empty> finalize_tree_creation(
    $0.FinalizeTreeCreationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$finalize_tree_creation, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.FrostRound1Response> frost_round1(
    $0.FrostRound1Request request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$frost_round1, request, options: options);
  }

  $grpc.ResponseFuture<$0.FrostRound2Response> frost_round2(
    $0.FrostRound2Request request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$frost_round2, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> finalize_transfer(
    $0.FinalizeTransferRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$finalize_transfer, request, options: options);
  }

  @$core.Deprecated('This method is deprecated')
  $grpc.ResponseFuture<$1.Empty> finalize_refresh_timelock(
    $0.FinalizeRefreshTimelockRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$finalize_refresh_timelock, request,
        options: options);
  }

  @$core.Deprecated('This method is deprecated')
  $grpc.ResponseFuture<$1.Empty> finalize_extend_leaf(
    $0.FinalizeExtendLeafRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$finalize_extend_leaf, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> finalize_renew_refund_timelock(
    $0.FinalizeRenewRefundTimelockRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$finalize_renew_refund_timelock, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.Empty> finalize_renew_node_timelock(
    $0.FinalizeRenewNodeTimelockRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$finalize_renew_node_timelock, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.Empty> node_available_for_renew(
    $0.NodeAvailableForRenewRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$node_available_for_renew, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.InitiatePreimageSwapResponse> initiate_preimage_swap(
    $2.InitiatePreimageSwapRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$initiate_preimage_swap, request,
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

  $grpc.ResponseFuture<$1.Empty> provide_preimage(
    $0.ProvidePreimageRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$provide_preimage, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> update_preimage_request(
    $0.UpdatePreimageRequestRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$update_preimage_request, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.Empty> store_preimage_share(
    $2.StorePreimageShareV2Request request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$store_preimage_share, request, options: options);
  }

  $grpc.ResponseFuture<$0.PrepareTreeAddressResponse> prepare_tree_address(
    $0.PrepareTreeAddressRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$prepare_tree_address, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> initiate_transfer(
    $0.InitiateTransferRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$initiate_transfer, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> initiate_transfer_v2(
    $0.InitiateTransferV2Request request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$initiate_transfer_v2, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deliver_sender_key_tweak(
    $0.DeliverSenderKeyTweakRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deliver_sender_key_tweak, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.Empty> initiate_cooperative_exit(
    $0.InitiateCooperativeExitRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$initiate_cooperative_exit, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.Empty> initiate_settle_receiver_key_tweak(
    $0.InitiateSettleReceiverKeyTweakRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$initiate_settle_receiver_key_tweak, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.Empty> settle_receiver_key_tweak(
    $0.SettleReceiverKeyTweakRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$settle_receiver_key_tweak, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.Empty> settle_sender_key_tweak(
    $0.SettleSenderKeyTweakRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$settle_sender_key_tweak, request,
        options: options);
  }

  /// Create UTXO swap record to claim UTXO by SSP in the static deposit flow
  $grpc.ResponseFuture<$0.CreateStaticDepositUtxoSwapResponse>
      create_static_deposit_utxo_swap(
    $0.CreateStaticDepositUtxoSwapRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$create_static_deposit_utxo_swap, request,
        options: options);
  }

  /// Create UTXO swap record to refund UTXO to the user in the static deposit flow
  $grpc.ResponseFuture<$0.CreateStaticDepositUtxoRefundResponse>
      create_static_deposit_utxo_refund(
    $0.CreateStaticDepositUtxoRefundRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$create_static_deposit_utxo_refund, request,
        options: options);
  }

  /// Create instant static deposit UTXO swap record across all SOs
  $grpc.ResponseFuture<$0.CreateInstantStaticDepositUtxoSwapResponse>
      create_instant_static_deposit_utxo_swap(
    $0.CreateInstantStaticDepositUtxoSwapRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$create_instant_static_deposit_utxo_swap, request,
        options: options);
  }

  /// Save utxo for an instant static deposit across all SOs
  $grpc.ResponseFuture<$0.SaveUtxoForInstantStaticDepositResponse>
      save_utxo_for_instant_static_deposit(
    $0.SaveUtxoForInstantStaticDepositRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$save_utxo_for_instant_static_deposit, request,
        options: options);
  }

  /// Link transfer edge to utxo swap on non-coordinator SOs (used by instant static deposits)
  $grpc.ResponseFuture<$0.LinkUtxoSwapTransferResponse> link_utxo_swap_transfer(
    $0.LinkUtxoSwapTransferRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$link_utxo_swap_transfer, request,
        options: options);
  }

  /// Internal method to cancel a swap for other SOs if one of them failed to ack it
  $grpc.ResponseFuture<$0.RollbackUtxoSwapResponse> rollback_utxo_swap(
    $0.RollbackUtxoSwapRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$rollback_utxo_swap, request, options: options);
  }

  /// Internal method to cancel an instant UTXO swap for other SOs if one of them failed to ack it
  $grpc.ResponseFuture<$0.RollbackInstantUtxoSwapResponse>
      rollback_instant_utxo_swap(
    $0.RollbackInstantUtxoSwapRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$rollback_instant_utxo_swap, request,
        options: options);
  }

  /// Internal method to mark a swap as COMPLETE in all SOs
  $grpc.ResponseFuture<$0.UtxoSwapCompletedResponse> utxo_swap_completed(
    $0.UtxoSwapCompletedRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$utxo_swap_completed, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryLeafSigningPubkeysResponse>
      query_leaf_signing_pubkeys(
    $0.QueryLeafSigningPubkeysRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$query_leaf_signing_pubkeys, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.Empty> resolve_leaf_investigation(
    $0.ResolveLeafInvestigationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$resolve_leaf_investigation, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.Empty> fix_keyshare(
    $0.FixKeyshareRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$fix_keyshare, request, options: options);
  }

  $grpc.ResponseFuture<$0.FixKeyshareRound1Response> fix_keyshare_round1(
    $0.FixKeyshareRound1Request request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$fix_keyshare_round1, request, options: options);
  }

  $grpc.ResponseFuture<$0.FixKeyshareRound2Response> fix_keyshare_round2(
    $0.FixKeyshareRound2Request request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$fix_keyshare_round2, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetTransfersResponse> get_transfers(
    $0.GetTransfersRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$get_transfers, request, options: options);
  }

  /// Generate proofs of possession for a static deposit address.
  /// The client can use them to validate that all SOs know about this address.
  /// The coordinator can use them to validate if an address was created correctly.
  $grpc.ResponseFuture<$0.GenerateStaticDepositAddressProofsResponse>
      generate_static_deposit_address_proofs(
    $0.GenerateStaticDepositAddressProofsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$generate_static_deposit_address_proofs, request,
        options: options);
  }

  /// This method fixes bad leaves by querying a designated "good" SO for its
  /// leaves, and copying it over to this SO's DB.
  $grpc.ResponseFuture<$1.Empty> sync_node(
    $0.SyncNodeRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$sync_node, request, options: options);
  }

  /// ConsensusPrepare is the generic prepare RPC for the 2PC consensus engine.
  /// The coordinator fans this out to all participants during Execute.
  /// Each participant dispatches to the appropriate FlowHandler.Prepare based on op_type.
  $grpc.ResponseFuture<$0.ConsensusPrepareResponse> consensus_prepare(
    $0.ConsensusPrepareRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$consensus_prepare, request, options: options);
  }

  // method descriptors

  static final _$mark_keyshares_as_used =
      $grpc.ClientMethod<$0.MarkKeysharesAsUsedRequest, $1.Empty>(
          '/spark_internal.SparkInternalService/mark_keyshares_as_used',
          ($0.MarkKeysharesAsUsedRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$mark_keyshare_for_deposit_address = $grpc.ClientMethod<
          $0.MarkKeyshareForDepositAddressRequest,
          $0.MarkKeyshareForDepositAddressResponse>(
      '/spark_internal.SparkInternalService/mark_keyshare_for_deposit_address',
      ($0.MarkKeyshareForDepositAddressRequest value) => value.writeToBuffer(),
      $0.MarkKeyshareForDepositAddressResponse.fromBuffer);
  static final _$reserve_entity_dkg_key =
      $grpc.ClientMethod<$0.ReserveEntityDkgKeyRequest, $1.Empty>(
          '/spark_internal.SparkInternalService/reserve_entity_dkg_key',
          ($0.ReserveEntityDkgKeyRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$finalize_tree_creation =
      $grpc.ClientMethod<$0.FinalizeTreeCreationRequest, $1.Empty>(
          '/spark_internal.SparkInternalService/finalize_tree_creation',
          ($0.FinalizeTreeCreationRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$frost_round1 =
      $grpc.ClientMethod<$0.FrostRound1Request, $0.FrostRound1Response>(
          '/spark_internal.SparkInternalService/frost_round1',
          ($0.FrostRound1Request value) => value.writeToBuffer(),
          $0.FrostRound1Response.fromBuffer);
  static final _$frost_round2 =
      $grpc.ClientMethod<$0.FrostRound2Request, $0.FrostRound2Response>(
          '/spark_internal.SparkInternalService/frost_round2',
          ($0.FrostRound2Request value) => value.writeToBuffer(),
          $0.FrostRound2Response.fromBuffer);
  static final _$finalize_transfer =
      $grpc.ClientMethod<$0.FinalizeTransferRequest, $1.Empty>(
          '/spark_internal.SparkInternalService/finalize_transfer',
          ($0.FinalizeTransferRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$finalize_refresh_timelock =
      $grpc.ClientMethod<$0.FinalizeRefreshTimelockRequest, $1.Empty>(
          '/spark_internal.SparkInternalService/finalize_refresh_timelock',
          ($0.FinalizeRefreshTimelockRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$finalize_extend_leaf =
      $grpc.ClientMethod<$0.FinalizeExtendLeafRequest, $1.Empty>(
          '/spark_internal.SparkInternalService/finalize_extend_leaf',
          ($0.FinalizeExtendLeafRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$finalize_renew_refund_timelock =
      $grpc.ClientMethod<$0.FinalizeRenewRefundTimelockRequest, $1.Empty>(
          '/spark_internal.SparkInternalService/finalize_renew_refund_timelock',
          ($0.FinalizeRenewRefundTimelockRequest value) =>
              value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$finalize_renew_node_timelock =
      $grpc.ClientMethod<$0.FinalizeRenewNodeTimelockRequest, $1.Empty>(
          '/spark_internal.SparkInternalService/finalize_renew_node_timelock',
          ($0.FinalizeRenewNodeTimelockRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$node_available_for_renew =
      $grpc.ClientMethod<$0.NodeAvailableForRenewRequest, $1.Empty>(
          '/spark_internal.SparkInternalService/node_available_for_renew',
          ($0.NodeAvailableForRenewRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$initiate_preimage_swap = $grpc.ClientMethod<
          $2.InitiatePreimageSwapRequest, $0.InitiatePreimageSwapResponse>(
      '/spark_internal.SparkInternalService/initiate_preimage_swap',
      ($2.InitiatePreimageSwapRequest value) => value.writeToBuffer(),
      $0.InitiatePreimageSwapResponse.fromBuffer);
  static final _$initiate_preimage_swap_v2 = $grpc.ClientMethod<
          $0.InitiatePreimageSwapRequest, $0.InitiatePreimageSwapResponse>(
      '/spark_internal.SparkInternalService/initiate_preimage_swap_v2',
      ($0.InitiatePreimageSwapRequest value) => value.writeToBuffer(),
      $0.InitiatePreimageSwapResponse.fromBuffer);
  static final _$provide_preimage =
      $grpc.ClientMethod<$0.ProvidePreimageRequest, $1.Empty>(
          '/spark_internal.SparkInternalService/provide_preimage',
          ($0.ProvidePreimageRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$update_preimage_request =
      $grpc.ClientMethod<$0.UpdatePreimageRequestRequest, $1.Empty>(
          '/spark_internal.SparkInternalService/update_preimage_request',
          ($0.UpdatePreimageRequestRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$store_preimage_share =
      $grpc.ClientMethod<$2.StorePreimageShareV2Request, $1.Empty>(
          '/spark_internal.SparkInternalService/store_preimage_share',
          ($2.StorePreimageShareV2Request value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$prepare_tree_address = $grpc.ClientMethod<
          $0.PrepareTreeAddressRequest, $0.PrepareTreeAddressResponse>(
      '/spark_internal.SparkInternalService/prepare_tree_address',
      ($0.PrepareTreeAddressRequest value) => value.writeToBuffer(),
      $0.PrepareTreeAddressResponse.fromBuffer);
  static final _$initiate_transfer =
      $grpc.ClientMethod<$0.InitiateTransferRequest, $1.Empty>(
          '/spark_internal.SparkInternalService/initiate_transfer',
          ($0.InitiateTransferRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$initiate_transfer_v2 =
      $grpc.ClientMethod<$0.InitiateTransferV2Request, $1.Empty>(
          '/spark_internal.SparkInternalService/initiate_transfer_v2',
          ($0.InitiateTransferV2Request value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$deliver_sender_key_tweak =
      $grpc.ClientMethod<$0.DeliverSenderKeyTweakRequest, $1.Empty>(
          '/spark_internal.SparkInternalService/deliver_sender_key_tweak',
          ($0.DeliverSenderKeyTweakRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$initiate_cooperative_exit =
      $grpc.ClientMethod<$0.InitiateCooperativeExitRequest, $1.Empty>(
          '/spark_internal.SparkInternalService/initiate_cooperative_exit',
          ($0.InitiateCooperativeExitRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$initiate_settle_receiver_key_tweak = $grpc.ClientMethod<
          $0.InitiateSettleReceiverKeyTweakRequest, $1.Empty>(
      '/spark_internal.SparkInternalService/initiate_settle_receiver_key_tweak',
      ($0.InitiateSettleReceiverKeyTweakRequest value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
  static final _$settle_receiver_key_tweak =
      $grpc.ClientMethod<$0.SettleReceiverKeyTweakRequest, $1.Empty>(
          '/spark_internal.SparkInternalService/settle_receiver_key_tweak',
          ($0.SettleReceiverKeyTweakRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$settle_sender_key_tweak =
      $grpc.ClientMethod<$0.SettleSenderKeyTweakRequest, $1.Empty>(
          '/spark_internal.SparkInternalService/settle_sender_key_tweak',
          ($0.SettleSenderKeyTweakRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$create_static_deposit_utxo_swap = $grpc.ClientMethod<
          $0.CreateStaticDepositUtxoSwapRequest,
          $0.CreateStaticDepositUtxoSwapResponse>(
      '/spark_internal.SparkInternalService/create_static_deposit_utxo_swap',
      ($0.CreateStaticDepositUtxoSwapRequest value) => value.writeToBuffer(),
      $0.CreateStaticDepositUtxoSwapResponse.fromBuffer);
  static final _$create_static_deposit_utxo_refund = $grpc.ClientMethod<
          $0.CreateStaticDepositUtxoRefundRequest,
          $0.CreateStaticDepositUtxoRefundResponse>(
      '/spark_internal.SparkInternalService/create_static_deposit_utxo_refund',
      ($0.CreateStaticDepositUtxoRefundRequest value) => value.writeToBuffer(),
      $0.CreateStaticDepositUtxoRefundResponse.fromBuffer);
  static final _$create_instant_static_deposit_utxo_swap = $grpc.ClientMethod<
          $0.CreateInstantStaticDepositUtxoSwapRequest,
          $0.CreateInstantStaticDepositUtxoSwapResponse>(
      '/spark_internal.SparkInternalService/create_instant_static_deposit_utxo_swap',
      ($0.CreateInstantStaticDepositUtxoSwapRequest value) =>
          value.writeToBuffer(),
      $0.CreateInstantStaticDepositUtxoSwapResponse.fromBuffer);
  static final _$save_utxo_for_instant_static_deposit = $grpc.ClientMethod<
          $0.SaveUtxoForInstantStaticDepositRequest,
          $0.SaveUtxoForInstantStaticDepositResponse>(
      '/spark_internal.SparkInternalService/save_utxo_for_instant_static_deposit',
      ($0.SaveUtxoForInstantStaticDepositRequest value) =>
          value.writeToBuffer(),
      $0.SaveUtxoForInstantStaticDepositResponse.fromBuffer);
  static final _$link_utxo_swap_transfer = $grpc.ClientMethod<
          $0.LinkUtxoSwapTransferRequest, $0.LinkUtxoSwapTransferResponse>(
      '/spark_internal.SparkInternalService/link_utxo_swap_transfer',
      ($0.LinkUtxoSwapTransferRequest value) => value.writeToBuffer(),
      $0.LinkUtxoSwapTransferResponse.fromBuffer);
  static final _$rollback_utxo_swap = $grpc.ClientMethod<
          $0.RollbackUtxoSwapRequest, $0.RollbackUtxoSwapResponse>(
      '/spark_internal.SparkInternalService/rollback_utxo_swap',
      ($0.RollbackUtxoSwapRequest value) => value.writeToBuffer(),
      $0.RollbackUtxoSwapResponse.fromBuffer);
  static final _$rollback_instant_utxo_swap = $grpc.ClientMethod<
          $0.RollbackInstantUtxoSwapRequest,
          $0.RollbackInstantUtxoSwapResponse>(
      '/spark_internal.SparkInternalService/rollback_instant_utxo_swap',
      ($0.RollbackInstantUtxoSwapRequest value) => value.writeToBuffer(),
      $0.RollbackInstantUtxoSwapResponse.fromBuffer);
  static final _$utxo_swap_completed = $grpc.ClientMethod<
          $0.UtxoSwapCompletedRequest, $0.UtxoSwapCompletedResponse>(
      '/spark_internal.SparkInternalService/utxo_swap_completed',
      ($0.UtxoSwapCompletedRequest value) => value.writeToBuffer(),
      $0.UtxoSwapCompletedResponse.fromBuffer);
  static final _$query_leaf_signing_pubkeys = $grpc.ClientMethod<
          $0.QueryLeafSigningPubkeysRequest,
          $0.QueryLeafSigningPubkeysResponse>(
      '/spark_internal.SparkInternalService/query_leaf_signing_pubkeys',
      ($0.QueryLeafSigningPubkeysRequest value) => value.writeToBuffer(),
      $0.QueryLeafSigningPubkeysResponse.fromBuffer);
  static final _$resolve_leaf_investigation =
      $grpc.ClientMethod<$0.ResolveLeafInvestigationRequest, $1.Empty>(
          '/spark_internal.SparkInternalService/resolve_leaf_investigation',
          ($0.ResolveLeafInvestigationRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$fix_keyshare =
      $grpc.ClientMethod<$0.FixKeyshareRequest, $1.Empty>(
          '/spark_internal.SparkInternalService/fix_keyshare',
          ($0.FixKeyshareRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$fix_keyshare_round1 = $grpc.ClientMethod<
          $0.FixKeyshareRound1Request, $0.FixKeyshareRound1Response>(
      '/spark_internal.SparkInternalService/fix_keyshare_round1',
      ($0.FixKeyshareRound1Request value) => value.writeToBuffer(),
      $0.FixKeyshareRound1Response.fromBuffer);
  static final _$fix_keyshare_round2 = $grpc.ClientMethod<
          $0.FixKeyshareRound2Request, $0.FixKeyshareRound2Response>(
      '/spark_internal.SparkInternalService/fix_keyshare_round2',
      ($0.FixKeyshareRound2Request value) => value.writeToBuffer(),
      $0.FixKeyshareRound2Response.fromBuffer);
  static final _$get_transfers =
      $grpc.ClientMethod<$0.GetTransfersRequest, $0.GetTransfersResponse>(
          '/spark_internal.SparkInternalService/get_transfers',
          ($0.GetTransfersRequest value) => value.writeToBuffer(),
          $0.GetTransfersResponse.fromBuffer);
  static final _$generate_static_deposit_address_proofs = $grpc.ClientMethod<
          $0.GenerateStaticDepositAddressProofsRequest,
          $0.GenerateStaticDepositAddressProofsResponse>(
      '/spark_internal.SparkInternalService/generate_static_deposit_address_proofs',
      ($0.GenerateStaticDepositAddressProofsRequest value) =>
          value.writeToBuffer(),
      $0.GenerateStaticDepositAddressProofsResponse.fromBuffer);
  static final _$sync_node = $grpc.ClientMethod<$0.SyncNodeRequest, $1.Empty>(
      '/spark_internal.SparkInternalService/sync_node',
      ($0.SyncNodeRequest value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
  static final _$consensus_prepare = $grpc.ClientMethod<
          $0.ConsensusPrepareRequest, $0.ConsensusPrepareResponse>(
      '/spark_internal.SparkInternalService/consensus_prepare',
      ($0.ConsensusPrepareRequest value) => value.writeToBuffer(),
      $0.ConsensusPrepareResponse.fromBuffer);
}

@$pb.GrpcServiceName('spark_internal.SparkInternalService')
abstract class SparkInternalServiceBase extends $grpc.Service {
  $core.String get $name => 'spark_internal.SparkInternalService';

  SparkInternalServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.MarkKeysharesAsUsedRequest, $1.Empty>(
        'mark_keyshares_as_used',
        mark_keyshares_as_used_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MarkKeysharesAsUsedRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MarkKeyshareForDepositAddressRequest,
            $0.MarkKeyshareForDepositAddressResponse>(
        'mark_keyshare_for_deposit_address',
        mark_keyshare_for_deposit_address_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MarkKeyshareForDepositAddressRequest.fromBuffer(value),
        ($0.MarkKeyshareForDepositAddressResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReserveEntityDkgKeyRequest, $1.Empty>(
        'reserve_entity_dkg_key',
        reserve_entity_dkg_key_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ReserveEntityDkgKeyRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FinalizeTreeCreationRequest, $1.Empty>(
        'finalize_tree_creation',
        finalize_tree_creation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FinalizeTreeCreationRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.FrostRound1Request, $0.FrostRound1Response>(
            'frost_round1',
            frost_round1_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.FrostRound1Request.fromBuffer(value),
            ($0.FrostRound1Response value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.FrostRound2Request, $0.FrostRound2Response>(
            'frost_round2',
            frost_round2_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.FrostRound2Request.fromBuffer(value),
            ($0.FrostRound2Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FinalizeTransferRequest, $1.Empty>(
        'finalize_transfer',
        finalize_transfer_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FinalizeTransferRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FinalizeRefreshTimelockRequest, $1.Empty>(
        'finalize_refresh_timelock',
        finalize_refresh_timelock_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FinalizeRefreshTimelockRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FinalizeExtendLeafRequest, $1.Empty>(
        'finalize_extend_leaf',
        finalize_extend_leaf_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FinalizeExtendLeafRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.FinalizeRenewRefundTimelockRequest, $1.Empty>(
            'finalize_renew_refund_timelock',
            finalize_renew_refund_timelock_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.FinalizeRenewRefundTimelockRequest.fromBuffer(value),
            ($1.Empty value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.FinalizeRenewNodeTimelockRequest, $1.Empty>(
            'finalize_renew_node_timelock',
            finalize_renew_node_timelock_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.FinalizeRenewNodeTimelockRequest.fromBuffer(value),
            ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.NodeAvailableForRenewRequest, $1.Empty>(
        'node_available_for_renew',
        node_available_for_renew_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.NodeAvailableForRenewRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.InitiatePreimageSwapRequest,
            $0.InitiatePreimageSwapResponse>(
        'initiate_preimage_swap',
        initiate_preimage_swap_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.InitiatePreimageSwapRequest.fromBuffer(value),
        ($0.InitiatePreimageSwapResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InitiatePreimageSwapRequest,
            $0.InitiatePreimageSwapResponse>(
        'initiate_preimage_swap_v2',
        initiate_preimage_swap_v2_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.InitiatePreimageSwapRequest.fromBuffer(value),
        ($0.InitiatePreimageSwapResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ProvidePreimageRequest, $1.Empty>(
        'provide_preimage',
        provide_preimage_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ProvidePreimageRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdatePreimageRequestRequest, $1.Empty>(
        'update_preimage_request',
        update_preimage_request_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdatePreimageRequestRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.StorePreimageShareV2Request, $1.Empty>(
        'store_preimage_share',
        store_preimage_share_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.StorePreimageShareV2Request.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PrepareTreeAddressRequest,
            $0.PrepareTreeAddressResponse>(
        'prepare_tree_address',
        prepare_tree_address_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.PrepareTreeAddressRequest.fromBuffer(value),
        ($0.PrepareTreeAddressResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InitiateTransferRequest, $1.Empty>(
        'initiate_transfer',
        initiate_transfer_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.InitiateTransferRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InitiateTransferV2Request, $1.Empty>(
        'initiate_transfer_v2',
        initiate_transfer_v2_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.InitiateTransferV2Request.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeliverSenderKeyTweakRequest, $1.Empty>(
        'deliver_sender_key_tweak',
        deliver_sender_key_tweak_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeliverSenderKeyTweakRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InitiateCooperativeExitRequest, $1.Empty>(
        'initiate_cooperative_exit',
        initiate_cooperative_exit_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.InitiateCooperativeExitRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.InitiateSettleReceiverKeyTweakRequest, $1.Empty>(
            'initiate_settle_receiver_key_tweak',
            initiate_settle_receiver_key_tweak_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.InitiateSettleReceiverKeyTweakRequest.fromBuffer(value),
            ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SettleReceiverKeyTweakRequest, $1.Empty>(
        'settle_receiver_key_tweak',
        settle_receiver_key_tweak_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SettleReceiverKeyTweakRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SettleSenderKeyTweakRequest, $1.Empty>(
        'settle_sender_key_tweak',
        settle_sender_key_tweak_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SettleSenderKeyTweakRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateStaticDepositUtxoSwapRequest,
            $0.CreateStaticDepositUtxoSwapResponse>(
        'create_static_deposit_utxo_swap',
        create_static_deposit_utxo_swap_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateStaticDepositUtxoSwapRequest.fromBuffer(value),
        ($0.CreateStaticDepositUtxoSwapResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateStaticDepositUtxoRefundRequest,
            $0.CreateStaticDepositUtxoRefundResponse>(
        'create_static_deposit_utxo_refund',
        create_static_deposit_utxo_refund_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateStaticDepositUtxoRefundRequest.fromBuffer(value),
        ($0.CreateStaticDepositUtxoRefundResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateInstantStaticDepositUtxoSwapRequest,
            $0.CreateInstantStaticDepositUtxoSwapResponse>(
        'create_instant_static_deposit_utxo_swap',
        create_instant_static_deposit_utxo_swap_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateInstantStaticDepositUtxoSwapRequest.fromBuffer(value),
        ($0.CreateInstantStaticDepositUtxoSwapResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SaveUtxoForInstantStaticDepositRequest,
            $0.SaveUtxoForInstantStaticDepositResponse>(
        'save_utxo_for_instant_static_deposit',
        save_utxo_for_instant_static_deposit_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SaveUtxoForInstantStaticDepositRequest.fromBuffer(value),
        ($0.SaveUtxoForInstantStaticDepositResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LinkUtxoSwapTransferRequest,
            $0.LinkUtxoSwapTransferResponse>(
        'link_utxo_swap_transfer',
        link_utxo_swap_transfer_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.LinkUtxoSwapTransferRequest.fromBuffer(value),
        ($0.LinkUtxoSwapTransferResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RollbackUtxoSwapRequest,
            $0.RollbackUtxoSwapResponse>(
        'rollback_utxo_swap',
        rollback_utxo_swap_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RollbackUtxoSwapRequest.fromBuffer(value),
        ($0.RollbackUtxoSwapResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RollbackInstantUtxoSwapRequest,
            $0.RollbackInstantUtxoSwapResponse>(
        'rollback_instant_utxo_swap',
        rollback_instant_utxo_swap_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RollbackInstantUtxoSwapRequest.fromBuffer(value),
        ($0.RollbackInstantUtxoSwapResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UtxoSwapCompletedRequest,
            $0.UtxoSwapCompletedResponse>(
        'utxo_swap_completed',
        utxo_swap_completed_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UtxoSwapCompletedRequest.fromBuffer(value),
        ($0.UtxoSwapCompletedResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryLeafSigningPubkeysRequest,
            $0.QueryLeafSigningPubkeysResponse>(
        'query_leaf_signing_pubkeys',
        query_leaf_signing_pubkeys_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryLeafSigningPubkeysRequest.fromBuffer(value),
        ($0.QueryLeafSigningPubkeysResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ResolveLeafInvestigationRequest, $1.Empty>(
            'resolve_leaf_investigation',
            resolve_leaf_investigation_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ResolveLeafInvestigationRequest.fromBuffer(value),
            ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FixKeyshareRequest, $1.Empty>(
        'fix_keyshare',
        fix_keyshare_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FixKeyshareRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FixKeyshareRound1Request,
            $0.FixKeyshareRound1Response>(
        'fix_keyshare_round1',
        fix_keyshare_round1_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FixKeyshareRound1Request.fromBuffer(value),
        ($0.FixKeyshareRound1Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FixKeyshareRound2Request,
            $0.FixKeyshareRound2Response>(
        'fix_keyshare_round2',
        fix_keyshare_round2_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FixKeyshareRound2Request.fromBuffer(value),
        ($0.FixKeyshareRound2Response value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetTransfersRequest, $0.GetTransfersResponse>(
            'get_transfers',
            get_transfers_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetTransfersRequest.fromBuffer(value),
            ($0.GetTransfersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GenerateStaticDepositAddressProofsRequest,
            $0.GenerateStaticDepositAddressProofsResponse>(
        'generate_static_deposit_address_proofs',
        generate_static_deposit_address_proofs_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GenerateStaticDepositAddressProofsRequest.fromBuffer(value),
        ($0.GenerateStaticDepositAddressProofsResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SyncNodeRequest, $1.Empty>(
        'sync_node',
        sync_node_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SyncNodeRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ConsensusPrepareRequest,
            $0.ConsensusPrepareResponse>(
        'consensus_prepare',
        consensus_prepare_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ConsensusPrepareRequest.fromBuffer(value),
        ($0.ConsensusPrepareResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.Empty> mark_keyshares_as_used_Pre($grpc.ServiceCall $call,
      $async.Future<$0.MarkKeysharesAsUsedRequest> $request) async {
    return mark_keyshares_as_used($call, await $request);
  }

  $async.Future<$1.Empty> mark_keyshares_as_used(
      $grpc.ServiceCall call, $0.MarkKeysharesAsUsedRequest request);

  $async.Future<$0.MarkKeyshareForDepositAddressResponse>
      mark_keyshare_for_deposit_address_Pre(
          $grpc.ServiceCall $call,
          $async.Future<$0.MarkKeyshareForDepositAddressRequest>
              $request) async {
    return mark_keyshare_for_deposit_address($call, await $request);
  }

  $async.Future<$0.MarkKeyshareForDepositAddressResponse>
      mark_keyshare_for_deposit_address($grpc.ServiceCall call,
          $0.MarkKeyshareForDepositAddressRequest request);

  $async.Future<$1.Empty> reserve_entity_dkg_key_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ReserveEntityDkgKeyRequest> $request) async {
    return reserve_entity_dkg_key($call, await $request);
  }

  $async.Future<$1.Empty> reserve_entity_dkg_key(
      $grpc.ServiceCall call, $0.ReserveEntityDkgKeyRequest request);

  $async.Future<$1.Empty> finalize_tree_creation_Pre($grpc.ServiceCall $call,
      $async.Future<$0.FinalizeTreeCreationRequest> $request) async {
    return finalize_tree_creation($call, await $request);
  }

  $async.Future<$1.Empty> finalize_tree_creation(
      $grpc.ServiceCall call, $0.FinalizeTreeCreationRequest request);

  $async.Future<$0.FrostRound1Response> frost_round1_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.FrostRound1Request> $request) async {
    return frost_round1($call, await $request);
  }

  $async.Future<$0.FrostRound1Response> frost_round1(
      $grpc.ServiceCall call, $0.FrostRound1Request request);

  $async.Future<$0.FrostRound2Response> frost_round2_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.FrostRound2Request> $request) async {
    return frost_round2($call, await $request);
  }

  $async.Future<$0.FrostRound2Response> frost_round2(
      $grpc.ServiceCall call, $0.FrostRound2Request request);

  $async.Future<$1.Empty> finalize_transfer_Pre($grpc.ServiceCall $call,
      $async.Future<$0.FinalizeTransferRequest> $request) async {
    return finalize_transfer($call, await $request);
  }

  $async.Future<$1.Empty> finalize_transfer(
      $grpc.ServiceCall call, $0.FinalizeTransferRequest request);

  $async.Future<$1.Empty> finalize_refresh_timelock_Pre($grpc.ServiceCall $call,
      $async.Future<$0.FinalizeRefreshTimelockRequest> $request) async {
    return finalize_refresh_timelock($call, await $request);
  }

  $async.Future<$1.Empty> finalize_refresh_timelock(
      $grpc.ServiceCall call, $0.FinalizeRefreshTimelockRequest request);

  $async.Future<$1.Empty> finalize_extend_leaf_Pre($grpc.ServiceCall $call,
      $async.Future<$0.FinalizeExtendLeafRequest> $request) async {
    return finalize_extend_leaf($call, await $request);
  }

  $async.Future<$1.Empty> finalize_extend_leaf(
      $grpc.ServiceCall call, $0.FinalizeExtendLeafRequest request);

  $async.Future<$1.Empty> finalize_renew_refund_timelock_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.FinalizeRenewRefundTimelockRequest> $request) async {
    return finalize_renew_refund_timelock($call, await $request);
  }

  $async.Future<$1.Empty> finalize_renew_refund_timelock(
      $grpc.ServiceCall call, $0.FinalizeRenewRefundTimelockRequest request);

  $async.Future<$1.Empty> finalize_renew_node_timelock_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.FinalizeRenewNodeTimelockRequest> $request) async {
    return finalize_renew_node_timelock($call, await $request);
  }

  $async.Future<$1.Empty> finalize_renew_node_timelock(
      $grpc.ServiceCall call, $0.FinalizeRenewNodeTimelockRequest request);

  $async.Future<$1.Empty> node_available_for_renew_Pre($grpc.ServiceCall $call,
      $async.Future<$0.NodeAvailableForRenewRequest> $request) async {
    return node_available_for_renew($call, await $request);
  }

  $async.Future<$1.Empty> node_available_for_renew(
      $grpc.ServiceCall call, $0.NodeAvailableForRenewRequest request);

  $async.Future<$0.InitiatePreimageSwapResponse> initiate_preimage_swap_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$2.InitiatePreimageSwapRequest> $request) async {
    return initiate_preimage_swap($call, await $request);
  }

  $async.Future<$0.InitiatePreimageSwapResponse> initiate_preimage_swap(
      $grpc.ServiceCall call, $2.InitiatePreimageSwapRequest request);

  $async.Future<$0.InitiatePreimageSwapResponse> initiate_preimage_swap_v2_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.InitiatePreimageSwapRequest> $request) async {
    return initiate_preimage_swap_v2($call, await $request);
  }

  $async.Future<$0.InitiatePreimageSwapResponse> initiate_preimage_swap_v2(
      $grpc.ServiceCall call, $0.InitiatePreimageSwapRequest request);

  $async.Future<$1.Empty> provide_preimage_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ProvidePreimageRequest> $request) async {
    return provide_preimage($call, await $request);
  }

  $async.Future<$1.Empty> provide_preimage(
      $grpc.ServiceCall call, $0.ProvidePreimageRequest request);

  $async.Future<$1.Empty> update_preimage_request_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UpdatePreimageRequestRequest> $request) async {
    return update_preimage_request($call, await $request);
  }

  $async.Future<$1.Empty> update_preimage_request(
      $grpc.ServiceCall call, $0.UpdatePreimageRequestRequest request);

  $async.Future<$1.Empty> store_preimage_share_Pre($grpc.ServiceCall $call,
      $async.Future<$2.StorePreimageShareV2Request> $request) async {
    return store_preimage_share($call, await $request);
  }

  $async.Future<$1.Empty> store_preimage_share(
      $grpc.ServiceCall call, $2.StorePreimageShareV2Request request);

  $async.Future<$0.PrepareTreeAddressResponse> prepare_tree_address_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.PrepareTreeAddressRequest> $request) async {
    return prepare_tree_address($call, await $request);
  }

  $async.Future<$0.PrepareTreeAddressResponse> prepare_tree_address(
      $grpc.ServiceCall call, $0.PrepareTreeAddressRequest request);

  $async.Future<$1.Empty> initiate_transfer_Pre($grpc.ServiceCall $call,
      $async.Future<$0.InitiateTransferRequest> $request) async {
    return initiate_transfer($call, await $request);
  }

  $async.Future<$1.Empty> initiate_transfer(
      $grpc.ServiceCall call, $0.InitiateTransferRequest request);

  $async.Future<$1.Empty> initiate_transfer_v2_Pre($grpc.ServiceCall $call,
      $async.Future<$0.InitiateTransferV2Request> $request) async {
    return initiate_transfer_v2($call, await $request);
  }

  $async.Future<$1.Empty> initiate_transfer_v2(
      $grpc.ServiceCall call, $0.InitiateTransferV2Request request);

  $async.Future<$1.Empty> deliver_sender_key_tweak_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DeliverSenderKeyTweakRequest> $request) async {
    return deliver_sender_key_tweak($call, await $request);
  }

  $async.Future<$1.Empty> deliver_sender_key_tweak(
      $grpc.ServiceCall call, $0.DeliverSenderKeyTweakRequest request);

  $async.Future<$1.Empty> initiate_cooperative_exit_Pre($grpc.ServiceCall $call,
      $async.Future<$0.InitiateCooperativeExitRequest> $request) async {
    return initiate_cooperative_exit($call, await $request);
  }

  $async.Future<$1.Empty> initiate_cooperative_exit(
      $grpc.ServiceCall call, $0.InitiateCooperativeExitRequest request);

  $async.Future<$1.Empty> initiate_settle_receiver_key_tweak_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.InitiateSettleReceiverKeyTweakRequest> $request) async {
    return initiate_settle_receiver_key_tweak($call, await $request);
  }

  $async.Future<$1.Empty> initiate_settle_receiver_key_tweak(
      $grpc.ServiceCall call, $0.InitiateSettleReceiverKeyTweakRequest request);

  $async.Future<$1.Empty> settle_receiver_key_tweak_Pre($grpc.ServiceCall $call,
      $async.Future<$0.SettleReceiverKeyTweakRequest> $request) async {
    return settle_receiver_key_tweak($call, await $request);
  }

  $async.Future<$1.Empty> settle_receiver_key_tweak(
      $grpc.ServiceCall call, $0.SettleReceiverKeyTweakRequest request);

  $async.Future<$1.Empty> settle_sender_key_tweak_Pre($grpc.ServiceCall $call,
      $async.Future<$0.SettleSenderKeyTweakRequest> $request) async {
    return settle_sender_key_tweak($call, await $request);
  }

  $async.Future<$1.Empty> settle_sender_key_tweak(
      $grpc.ServiceCall call, $0.SettleSenderKeyTweakRequest request);

  $async.Future<$0.CreateStaticDepositUtxoSwapResponse>
      create_static_deposit_utxo_swap_Pre($grpc.ServiceCall $call,
          $async.Future<$0.CreateStaticDepositUtxoSwapRequest> $request) async {
    return create_static_deposit_utxo_swap($call, await $request);
  }

  $async.Future<$0.CreateStaticDepositUtxoSwapResponse>
      create_static_deposit_utxo_swap($grpc.ServiceCall call,
          $0.CreateStaticDepositUtxoSwapRequest request);

  $async.Future<$0.CreateStaticDepositUtxoRefundResponse>
      create_static_deposit_utxo_refund_Pre(
          $grpc.ServiceCall $call,
          $async.Future<$0.CreateStaticDepositUtxoRefundRequest>
              $request) async {
    return create_static_deposit_utxo_refund($call, await $request);
  }

  $async.Future<$0.CreateStaticDepositUtxoRefundResponse>
      create_static_deposit_utxo_refund($grpc.ServiceCall call,
          $0.CreateStaticDepositUtxoRefundRequest request);

  $async.Future<$0.CreateInstantStaticDepositUtxoSwapResponse>
      create_instant_static_deposit_utxo_swap_Pre(
          $grpc.ServiceCall $call,
          $async.Future<$0.CreateInstantStaticDepositUtxoSwapRequest>
              $request) async {
    return create_instant_static_deposit_utxo_swap($call, await $request);
  }

  $async.Future<$0.CreateInstantStaticDepositUtxoSwapResponse>
      create_instant_static_deposit_utxo_swap($grpc.ServiceCall call,
          $0.CreateInstantStaticDepositUtxoSwapRequest request);

  $async.Future<$0.SaveUtxoForInstantStaticDepositResponse>
      save_utxo_for_instant_static_deposit_Pre(
          $grpc.ServiceCall $call,
          $async.Future<$0.SaveUtxoForInstantStaticDepositRequest>
              $request) async {
    return save_utxo_for_instant_static_deposit($call, await $request);
  }

  $async.Future<$0.SaveUtxoForInstantStaticDepositResponse>
      save_utxo_for_instant_static_deposit($grpc.ServiceCall call,
          $0.SaveUtxoForInstantStaticDepositRequest request);

  $async.Future<$0.LinkUtxoSwapTransferResponse> link_utxo_swap_transfer_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.LinkUtxoSwapTransferRequest> $request) async {
    return link_utxo_swap_transfer($call, await $request);
  }

  $async.Future<$0.LinkUtxoSwapTransferResponse> link_utxo_swap_transfer(
      $grpc.ServiceCall call, $0.LinkUtxoSwapTransferRequest request);

  $async.Future<$0.RollbackUtxoSwapResponse> rollback_utxo_swap_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.RollbackUtxoSwapRequest> $request) async {
    return rollback_utxo_swap($call, await $request);
  }

  $async.Future<$0.RollbackUtxoSwapResponse> rollback_utxo_swap(
      $grpc.ServiceCall call, $0.RollbackUtxoSwapRequest request);

  $async.Future<$0.RollbackInstantUtxoSwapResponse>
      rollback_instant_utxo_swap_Pre($grpc.ServiceCall $call,
          $async.Future<$0.RollbackInstantUtxoSwapRequest> $request) async {
    return rollback_instant_utxo_swap($call, await $request);
  }

  $async.Future<$0.RollbackInstantUtxoSwapResponse> rollback_instant_utxo_swap(
      $grpc.ServiceCall call, $0.RollbackInstantUtxoSwapRequest request);

  $async.Future<$0.UtxoSwapCompletedResponse> utxo_swap_completed_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.UtxoSwapCompletedRequest> $request) async {
    return utxo_swap_completed($call, await $request);
  }

  $async.Future<$0.UtxoSwapCompletedResponse> utxo_swap_completed(
      $grpc.ServiceCall call, $0.UtxoSwapCompletedRequest request);

  $async.Future<$0.QueryLeafSigningPubkeysResponse>
      query_leaf_signing_pubkeys_Pre($grpc.ServiceCall $call,
          $async.Future<$0.QueryLeafSigningPubkeysRequest> $request) async {
    return query_leaf_signing_pubkeys($call, await $request);
  }

  $async.Future<$0.QueryLeafSigningPubkeysResponse> query_leaf_signing_pubkeys(
      $grpc.ServiceCall call, $0.QueryLeafSigningPubkeysRequest request);

  $async.Future<$1.Empty> resolve_leaf_investigation_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ResolveLeafInvestigationRequest> $request) async {
    return resolve_leaf_investigation($call, await $request);
  }

  $async.Future<$1.Empty> resolve_leaf_investigation(
      $grpc.ServiceCall call, $0.ResolveLeafInvestigationRequest request);

  $async.Future<$1.Empty> fix_keyshare_Pre($grpc.ServiceCall $call,
      $async.Future<$0.FixKeyshareRequest> $request) async {
    return fix_keyshare($call, await $request);
  }

  $async.Future<$1.Empty> fix_keyshare(
      $grpc.ServiceCall call, $0.FixKeyshareRequest request);

  $async.Future<$0.FixKeyshareRound1Response> fix_keyshare_round1_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.FixKeyshareRound1Request> $request) async {
    return fix_keyshare_round1($call, await $request);
  }

  $async.Future<$0.FixKeyshareRound1Response> fix_keyshare_round1(
      $grpc.ServiceCall call, $0.FixKeyshareRound1Request request);

  $async.Future<$0.FixKeyshareRound2Response> fix_keyshare_round2_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.FixKeyshareRound2Request> $request) async {
    return fix_keyshare_round2($call, await $request);
  }

  $async.Future<$0.FixKeyshareRound2Response> fix_keyshare_round2(
      $grpc.ServiceCall call, $0.FixKeyshareRound2Request request);

  $async.Future<$0.GetTransfersResponse> get_transfers_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetTransfersRequest> $request) async {
    return get_transfers($call, await $request);
  }

  $async.Future<$0.GetTransfersResponse> get_transfers(
      $grpc.ServiceCall call, $0.GetTransfersRequest request);

  $async.Future<$0.GenerateStaticDepositAddressProofsResponse>
      generate_static_deposit_address_proofs_Pre(
          $grpc.ServiceCall $call,
          $async.Future<$0.GenerateStaticDepositAddressProofsRequest>
              $request) async {
    return generate_static_deposit_address_proofs($call, await $request);
  }

  $async.Future<$0.GenerateStaticDepositAddressProofsResponse>
      generate_static_deposit_address_proofs($grpc.ServiceCall call,
          $0.GenerateStaticDepositAddressProofsRequest request);

  $async.Future<$1.Empty> sync_node_Pre($grpc.ServiceCall $call,
      $async.Future<$0.SyncNodeRequest> $request) async {
    return sync_node($call, await $request);
  }

  $async.Future<$1.Empty> sync_node(
      $grpc.ServiceCall call, $0.SyncNodeRequest request);

  $async.Future<$0.ConsensusPrepareResponse> consensus_prepare_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ConsensusPrepareRequest> $request) async {
    return consensus_prepare($call, await $request);
  }

  $async.Future<$0.ConsensusPrepareResponse> consensus_prepare(
      $grpc.ServiceCall call, $0.ConsensusPrepareRequest request);
}
