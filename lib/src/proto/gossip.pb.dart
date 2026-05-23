// This is a generated file - do not edit.
//
// Generated from gossip.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/any.pb.dart' as $5;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $4;

import 'gossip.pbenum.dart';
import 'spark.pb.dart' as $2;
import 'spark_internal.pb.dart' as $3;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'gossip.pbenum.dart';

enum GossipMessage_Message {
  cancelTransfer,
  settleSenderKeyTweak,
  rollbackTransfer,
  markTreesExited,
  finalizeTreeCreation,
  finalizeTransfer,
  finalizeRefreshTimelock,
  finalizeExtendLeaf,
  rollbackUtxoSwap,
  depositCleanup,
  preimage,
  finalizeRefundTimelock,
  finalizeNodeTimelock,
  settleSwapKeyTweak,
  updateWalletSetting,
  archiveStaticDepositAddress,
  rollbackInstantUtxoSwap,
  finalizeTransferReceiver,
  finalizeTreeNode,
  consensusCommit,
  consensusRollback,
  notSet
}

class GossipMessage extends $pb.GeneratedMessage {
  factory GossipMessage({
    $core.String? messageId,
    GossipMessageCancelTransfer? cancelTransfer,
    GossipMessageSettleSenderKeyTweak? settleSenderKeyTweak,
    GossipMessageRollbackTransfer? rollbackTransfer,
    GossipMessageMarkTreesExited? markTreesExited,
    GossipMessageFinalizeTreeCreation? finalizeTreeCreation,
    GossipMessageFinalizeTransfer? finalizeTransfer,
    @$core.Deprecated('This field is deprecated.')
    GossipMessageFinalizeRefreshTimelock? finalizeRefreshTimelock,
    @$core.Deprecated('This field is deprecated.')
    GossipMessageFinalizeExtendLeaf? finalizeExtendLeaf,
    GossipMessageRollbackUtxoSwap? rollbackUtxoSwap,
    GossipMessageDepositCleanup? depositCleanup,
    GossipMessagePreimage? preimage,
    GossipMessageFinalizeRenewRefundTimelock? finalizeRefundTimelock,
    GossipMessageFinalizeRenewNodeTimelock? finalizeNodeTimelock,
    GossipMessageSettleSwapKeyTweak? settleSwapKeyTweak,
    GossipMessageUpdateWalletSetting? updateWalletSetting,
    GossipMessageArchiveStaticDepositAddress? archiveStaticDepositAddress,
    GossipMessageRollbackInstantUtxoSwap? rollbackInstantUtxoSwap,
    GossipMessageFinalizeTransferReceiver? finalizeTransferReceiver,
    GossipMessageFinalizeTreeNode? finalizeTreeNode,
    GossipMessageConsensusCommit? consensusCommit,
    GossipMessageConsensusRollback? consensusRollback,
  }) {
    final result = create();
    if (messageId != null) result.messageId = messageId;
    if (cancelTransfer != null) result.cancelTransfer = cancelTransfer;
    if (settleSenderKeyTweak != null)
      result.settleSenderKeyTweak = settleSenderKeyTweak;
    if (rollbackTransfer != null) result.rollbackTransfer = rollbackTransfer;
    if (markTreesExited != null) result.markTreesExited = markTreesExited;
    if (finalizeTreeCreation != null)
      result.finalizeTreeCreation = finalizeTreeCreation;
    if (finalizeTransfer != null) result.finalizeTransfer = finalizeTransfer;
    if (finalizeRefreshTimelock != null)
      result.finalizeRefreshTimelock = finalizeRefreshTimelock;
    if (finalizeExtendLeaf != null)
      result.finalizeExtendLeaf = finalizeExtendLeaf;
    if (rollbackUtxoSwap != null) result.rollbackUtxoSwap = rollbackUtxoSwap;
    if (depositCleanup != null) result.depositCleanup = depositCleanup;
    if (preimage != null) result.preimage = preimage;
    if (finalizeRefundTimelock != null)
      result.finalizeRefundTimelock = finalizeRefundTimelock;
    if (finalizeNodeTimelock != null)
      result.finalizeNodeTimelock = finalizeNodeTimelock;
    if (settleSwapKeyTweak != null)
      result.settleSwapKeyTweak = settleSwapKeyTweak;
    if (updateWalletSetting != null)
      result.updateWalletSetting = updateWalletSetting;
    if (archiveStaticDepositAddress != null)
      result.archiveStaticDepositAddress = archiveStaticDepositAddress;
    if (rollbackInstantUtxoSwap != null)
      result.rollbackInstantUtxoSwap = rollbackInstantUtxoSwap;
    if (finalizeTransferReceiver != null)
      result.finalizeTransferReceiver = finalizeTransferReceiver;
    if (finalizeTreeNode != null) result.finalizeTreeNode = finalizeTreeNode;
    if (consensusCommit != null) result.consensusCommit = consensusCommit;
    if (consensusRollback != null) result.consensusRollback = consensusRollback;
    return result;
  }

  GossipMessage._();

  factory GossipMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, GossipMessage_Message>
      _GossipMessage_MessageByTag = {
    2: GossipMessage_Message.cancelTransfer,
    4: GossipMessage_Message.settleSenderKeyTweak,
    5: GossipMessage_Message.rollbackTransfer,
    6: GossipMessage_Message.markTreesExited,
    7: GossipMessage_Message.finalizeTreeCreation,
    8: GossipMessage_Message.finalizeTransfer,
    9: GossipMessage_Message.finalizeRefreshTimelock,
    10: GossipMessage_Message.finalizeExtendLeaf,
    11: GossipMessage_Message.rollbackUtxoSwap,
    12: GossipMessage_Message.depositCleanup,
    13: GossipMessage_Message.preimage,
    14: GossipMessage_Message.finalizeRefundTimelock,
    15: GossipMessage_Message.finalizeNodeTimelock,
    16: GossipMessage_Message.settleSwapKeyTweak,
    17: GossipMessage_Message.updateWalletSetting,
    18: GossipMessage_Message.archiveStaticDepositAddress,
    19: GossipMessage_Message.rollbackInstantUtxoSwap,
    20: GossipMessage_Message.finalizeTransferReceiver,
    21: GossipMessage_Message.finalizeTreeNode,
    22: GossipMessage_Message.consensusCommit,
    23: GossipMessage_Message.consensusRollback,
    0: GossipMessage_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..oo(0, [
      2,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23
    ])
    ..aOS(1, _omitFieldNames ? '' : 'messageId')
    ..aOM<GossipMessageCancelTransfer>(
        2, _omitFieldNames ? '' : 'cancelTransfer',
        subBuilder: GossipMessageCancelTransfer.create)
    ..aOM<GossipMessageSettleSenderKeyTweak>(
        4, _omitFieldNames ? '' : 'settleSenderKeyTweak',
        subBuilder: GossipMessageSettleSenderKeyTweak.create)
    ..aOM<GossipMessageRollbackTransfer>(
        5, _omitFieldNames ? '' : 'rollbackTransfer',
        subBuilder: GossipMessageRollbackTransfer.create)
    ..aOM<GossipMessageMarkTreesExited>(
        6, _omitFieldNames ? '' : 'markTreesExited',
        subBuilder: GossipMessageMarkTreesExited.create)
    ..aOM<GossipMessageFinalizeTreeCreation>(
        7, _omitFieldNames ? '' : 'finalizeTreeCreation',
        subBuilder: GossipMessageFinalizeTreeCreation.create)
    ..aOM<GossipMessageFinalizeTransfer>(
        8, _omitFieldNames ? '' : 'finalizeTransfer',
        subBuilder: GossipMessageFinalizeTransfer.create)
    ..aOM<GossipMessageFinalizeRefreshTimelock>(
        9, _omitFieldNames ? '' : 'finalizeRefreshTimelock',
        subBuilder: GossipMessageFinalizeRefreshTimelock.create)
    ..aOM<GossipMessageFinalizeExtendLeaf>(
        10, _omitFieldNames ? '' : 'finalizeExtendLeaf',
        subBuilder: GossipMessageFinalizeExtendLeaf.create)
    ..aOM<GossipMessageRollbackUtxoSwap>(
        11, _omitFieldNames ? '' : 'rollbackUtxoSwap',
        subBuilder: GossipMessageRollbackUtxoSwap.create)
    ..aOM<GossipMessageDepositCleanup>(
        12, _omitFieldNames ? '' : 'depositCleanup',
        subBuilder: GossipMessageDepositCleanup.create)
    ..aOM<GossipMessagePreimage>(13, _omitFieldNames ? '' : 'preimage',
        subBuilder: GossipMessagePreimage.create)
    ..aOM<GossipMessageFinalizeRenewRefundTimelock>(
        14, _omitFieldNames ? '' : 'finalizeRefundTimelock',
        subBuilder: GossipMessageFinalizeRenewRefundTimelock.create)
    ..aOM<GossipMessageFinalizeRenewNodeTimelock>(
        15, _omitFieldNames ? '' : 'finalizeNodeTimelock',
        subBuilder: GossipMessageFinalizeRenewNodeTimelock.create)
    ..aOM<GossipMessageSettleSwapKeyTweak>(
        16, _omitFieldNames ? '' : 'settleSwapKeyTweak',
        subBuilder: GossipMessageSettleSwapKeyTweak.create)
    ..aOM<GossipMessageUpdateWalletSetting>(
        17, _omitFieldNames ? '' : 'updateWalletSetting',
        subBuilder: GossipMessageUpdateWalletSetting.create)
    ..aOM<GossipMessageArchiveStaticDepositAddress>(
        18, _omitFieldNames ? '' : 'archiveStaticDepositAddress',
        subBuilder: GossipMessageArchiveStaticDepositAddress.create)
    ..aOM<GossipMessageRollbackInstantUtxoSwap>(
        19, _omitFieldNames ? '' : 'rollbackInstantUtxoSwap',
        subBuilder: GossipMessageRollbackInstantUtxoSwap.create)
    ..aOM<GossipMessageFinalizeTransferReceiver>(
        20, _omitFieldNames ? '' : 'finalizeTransferReceiver',
        subBuilder: GossipMessageFinalizeTransferReceiver.create)
    ..aOM<GossipMessageFinalizeTreeNode>(
        21, _omitFieldNames ? '' : 'finalizeTreeNode',
        subBuilder: GossipMessageFinalizeTreeNode.create)
    ..aOM<GossipMessageConsensusCommit>(
        22, _omitFieldNames ? '' : 'consensusCommit',
        subBuilder: GossipMessageConsensusCommit.create)
    ..aOM<GossipMessageConsensusRollback>(
        23, _omitFieldNames ? '' : 'consensusRollback',
        subBuilder: GossipMessageConsensusRollback.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessage copyWith(void Function(GossipMessage) updates) =>
      super.copyWith((message) => updates(message as GossipMessage))
          as GossipMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessage create() => GossipMessage._();
  @$core.override
  GossipMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GossipMessage>(create);
  static GossipMessage? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  @$pb.TagNumber(18)
  @$pb.TagNumber(19)
  @$pb.TagNumber(20)
  @$pb.TagNumber(21)
  @$pb.TagNumber(22)
  @$pb.TagNumber(23)
  GossipMessage_Message whichMessage() =>
      _GossipMessage_MessageByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  @$pb.TagNumber(18)
  @$pb.TagNumber(19)
  @$pb.TagNumber(20)
  @$pb.TagNumber(21)
  @$pb.TagNumber(22)
  @$pb.TagNumber(23)
  void clearMessage() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get messageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set messageId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => $_clearField(1);

  @$pb.TagNumber(2)
  GossipMessageCancelTransfer get cancelTransfer => $_getN(1);
  @$pb.TagNumber(2)
  set cancelTransfer(GossipMessageCancelTransfer value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCancelTransfer() => $_has(1);
  @$pb.TagNumber(2)
  void clearCancelTransfer() => $_clearField(2);
  @$pb.TagNumber(2)
  GossipMessageCancelTransfer ensureCancelTransfer() => $_ensure(1);

  @$pb.TagNumber(4)
  GossipMessageSettleSenderKeyTweak get settleSenderKeyTweak => $_getN(2);
  @$pb.TagNumber(4)
  set settleSenderKeyTweak(GossipMessageSettleSenderKeyTweak value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasSettleSenderKeyTweak() => $_has(2);
  @$pb.TagNumber(4)
  void clearSettleSenderKeyTweak() => $_clearField(4);
  @$pb.TagNumber(4)
  GossipMessageSettleSenderKeyTweak ensureSettleSenderKeyTweak() => $_ensure(2);

  @$pb.TagNumber(5)
  GossipMessageRollbackTransfer get rollbackTransfer => $_getN(3);
  @$pb.TagNumber(5)
  set rollbackTransfer(GossipMessageRollbackTransfer value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasRollbackTransfer() => $_has(3);
  @$pb.TagNumber(5)
  void clearRollbackTransfer() => $_clearField(5);
  @$pb.TagNumber(5)
  GossipMessageRollbackTransfer ensureRollbackTransfer() => $_ensure(3);

  @$pb.TagNumber(6)
  GossipMessageMarkTreesExited get markTreesExited => $_getN(4);
  @$pb.TagNumber(6)
  set markTreesExited(GossipMessageMarkTreesExited value) =>
      $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasMarkTreesExited() => $_has(4);
  @$pb.TagNumber(6)
  void clearMarkTreesExited() => $_clearField(6);
  @$pb.TagNumber(6)
  GossipMessageMarkTreesExited ensureMarkTreesExited() => $_ensure(4);

  @$pb.TagNumber(7)
  GossipMessageFinalizeTreeCreation get finalizeTreeCreation => $_getN(5);
  @$pb.TagNumber(7)
  set finalizeTreeCreation(GossipMessageFinalizeTreeCreation value) =>
      $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasFinalizeTreeCreation() => $_has(5);
  @$pb.TagNumber(7)
  void clearFinalizeTreeCreation() => $_clearField(7);
  @$pb.TagNumber(7)
  GossipMessageFinalizeTreeCreation ensureFinalizeTreeCreation() => $_ensure(5);

  @$pb.TagNumber(8)
  GossipMessageFinalizeTransfer get finalizeTransfer => $_getN(6);
  @$pb.TagNumber(8)
  set finalizeTransfer(GossipMessageFinalizeTransfer value) =>
      $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasFinalizeTransfer() => $_has(6);
  @$pb.TagNumber(8)
  void clearFinalizeTransfer() => $_clearField(8);
  @$pb.TagNumber(8)
  GossipMessageFinalizeTransfer ensureFinalizeTransfer() => $_ensure(6);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  GossipMessageFinalizeRefreshTimelock get finalizeRefreshTimelock => $_getN(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  set finalizeRefreshTimelock(GossipMessageFinalizeRefreshTimelock value) =>
      $_setField(9, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  $core.bool hasFinalizeRefreshTimelock() => $_has(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  void clearFinalizeRefreshTimelock() => $_clearField(9);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  GossipMessageFinalizeRefreshTimelock ensureFinalizeRefreshTimelock() =>
      $_ensure(7);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  GossipMessageFinalizeExtendLeaf get finalizeExtendLeaf => $_getN(8);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  set finalizeExtendLeaf(GossipMessageFinalizeExtendLeaf value) =>
      $_setField(10, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  $core.bool hasFinalizeExtendLeaf() => $_has(8);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  void clearFinalizeExtendLeaf() => $_clearField(10);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  GossipMessageFinalizeExtendLeaf ensureFinalizeExtendLeaf() => $_ensure(8);

  @$pb.TagNumber(11)
  GossipMessageRollbackUtxoSwap get rollbackUtxoSwap => $_getN(9);
  @$pb.TagNumber(11)
  set rollbackUtxoSwap(GossipMessageRollbackUtxoSwap value) =>
      $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasRollbackUtxoSwap() => $_has(9);
  @$pb.TagNumber(11)
  void clearRollbackUtxoSwap() => $_clearField(11);
  @$pb.TagNumber(11)
  GossipMessageRollbackUtxoSwap ensureRollbackUtxoSwap() => $_ensure(9);

  @$pb.TagNumber(12)
  GossipMessageDepositCleanup get depositCleanup => $_getN(10);
  @$pb.TagNumber(12)
  set depositCleanup(GossipMessageDepositCleanup value) =>
      $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasDepositCleanup() => $_has(10);
  @$pb.TagNumber(12)
  void clearDepositCleanup() => $_clearField(12);
  @$pb.TagNumber(12)
  GossipMessageDepositCleanup ensureDepositCleanup() => $_ensure(10);

  @$pb.TagNumber(13)
  GossipMessagePreimage get preimage => $_getN(11);
  @$pb.TagNumber(13)
  set preimage(GossipMessagePreimage value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasPreimage() => $_has(11);
  @$pb.TagNumber(13)
  void clearPreimage() => $_clearField(13);
  @$pb.TagNumber(13)
  GossipMessagePreimage ensurePreimage() => $_ensure(11);

  @$pb.TagNumber(14)
  GossipMessageFinalizeRenewRefundTimelock get finalizeRefundTimelock =>
      $_getN(12);
  @$pb.TagNumber(14)
  set finalizeRefundTimelock(GossipMessageFinalizeRenewRefundTimelock value) =>
      $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasFinalizeRefundTimelock() => $_has(12);
  @$pb.TagNumber(14)
  void clearFinalizeRefundTimelock() => $_clearField(14);
  @$pb.TagNumber(14)
  GossipMessageFinalizeRenewRefundTimelock ensureFinalizeRefundTimelock() =>
      $_ensure(12);

  @$pb.TagNumber(15)
  GossipMessageFinalizeRenewNodeTimelock get finalizeNodeTimelock => $_getN(13);
  @$pb.TagNumber(15)
  set finalizeNodeTimelock(GossipMessageFinalizeRenewNodeTimelock value) =>
      $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasFinalizeNodeTimelock() => $_has(13);
  @$pb.TagNumber(15)
  void clearFinalizeNodeTimelock() => $_clearField(15);
  @$pb.TagNumber(15)
  GossipMessageFinalizeRenewNodeTimelock ensureFinalizeNodeTimelock() =>
      $_ensure(13);

  @$pb.TagNumber(16)
  GossipMessageSettleSwapKeyTweak get settleSwapKeyTweak => $_getN(14);
  @$pb.TagNumber(16)
  set settleSwapKeyTweak(GossipMessageSettleSwapKeyTweak value) =>
      $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasSettleSwapKeyTweak() => $_has(14);
  @$pb.TagNumber(16)
  void clearSettleSwapKeyTweak() => $_clearField(16);
  @$pb.TagNumber(16)
  GossipMessageSettleSwapKeyTweak ensureSettleSwapKeyTweak() => $_ensure(14);

  @$pb.TagNumber(17)
  GossipMessageUpdateWalletSetting get updateWalletSetting => $_getN(15);
  @$pb.TagNumber(17)
  set updateWalletSetting(GossipMessageUpdateWalletSetting value) =>
      $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasUpdateWalletSetting() => $_has(15);
  @$pb.TagNumber(17)
  void clearUpdateWalletSetting() => $_clearField(17);
  @$pb.TagNumber(17)
  GossipMessageUpdateWalletSetting ensureUpdateWalletSetting() => $_ensure(15);

  @$pb.TagNumber(18)
  GossipMessageArchiveStaticDepositAddress get archiveStaticDepositAddress =>
      $_getN(16);
  @$pb.TagNumber(18)
  set archiveStaticDepositAddress(
          GossipMessageArchiveStaticDepositAddress value) =>
      $_setField(18, value);
  @$pb.TagNumber(18)
  $core.bool hasArchiveStaticDepositAddress() => $_has(16);
  @$pb.TagNumber(18)
  void clearArchiveStaticDepositAddress() => $_clearField(18);
  @$pb.TagNumber(18)
  GossipMessageArchiveStaticDepositAddress
      ensureArchiveStaticDepositAddress() => $_ensure(16);

  @$pb.TagNumber(19)
  GossipMessageRollbackInstantUtxoSwap get rollbackInstantUtxoSwap =>
      $_getN(17);
  @$pb.TagNumber(19)
  set rollbackInstantUtxoSwap(GossipMessageRollbackInstantUtxoSwap value) =>
      $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasRollbackInstantUtxoSwap() => $_has(17);
  @$pb.TagNumber(19)
  void clearRollbackInstantUtxoSwap() => $_clearField(19);
  @$pb.TagNumber(19)
  GossipMessageRollbackInstantUtxoSwap ensureRollbackInstantUtxoSwap() =>
      $_ensure(17);

  @$pb.TagNumber(20)
  GossipMessageFinalizeTransferReceiver get finalizeTransferReceiver =>
      $_getN(18);
  @$pb.TagNumber(20)
  set finalizeTransferReceiver(GossipMessageFinalizeTransferReceiver value) =>
      $_setField(20, value);
  @$pb.TagNumber(20)
  $core.bool hasFinalizeTransferReceiver() => $_has(18);
  @$pb.TagNumber(20)
  void clearFinalizeTransferReceiver() => $_clearField(20);
  @$pb.TagNumber(20)
  GossipMessageFinalizeTransferReceiver ensureFinalizeTransferReceiver() =>
      $_ensure(18);

  @$pb.TagNumber(21)
  GossipMessageFinalizeTreeNode get finalizeTreeNode => $_getN(19);
  @$pb.TagNumber(21)
  set finalizeTreeNode(GossipMessageFinalizeTreeNode value) =>
      $_setField(21, value);
  @$pb.TagNumber(21)
  $core.bool hasFinalizeTreeNode() => $_has(19);
  @$pb.TagNumber(21)
  void clearFinalizeTreeNode() => $_clearField(21);
  @$pb.TagNumber(21)
  GossipMessageFinalizeTreeNode ensureFinalizeTreeNode() => $_ensure(19);

  @$pb.TagNumber(22)
  GossipMessageConsensusCommit get consensusCommit => $_getN(20);
  @$pb.TagNumber(22)
  set consensusCommit(GossipMessageConsensusCommit value) =>
      $_setField(22, value);
  @$pb.TagNumber(22)
  $core.bool hasConsensusCommit() => $_has(20);
  @$pb.TagNumber(22)
  void clearConsensusCommit() => $_clearField(22);
  @$pb.TagNumber(22)
  GossipMessageConsensusCommit ensureConsensusCommit() => $_ensure(20);

  @$pb.TagNumber(23)
  GossipMessageConsensusRollback get consensusRollback => $_getN(21);
  @$pb.TagNumber(23)
  set consensusRollback(GossipMessageConsensusRollback value) =>
      $_setField(23, value);
  @$pb.TagNumber(23)
  $core.bool hasConsensusRollback() => $_has(21);
  @$pb.TagNumber(23)
  void clearConsensusRollback() => $_clearField(23);
  @$pb.TagNumber(23)
  GossipMessageConsensusRollback ensureConsensusRollback() => $_ensure(21);
}

class GossipMessageCancelTransfer extends $pb.GeneratedMessage {
  factory GossipMessageCancelTransfer({
    $core.String? transferId,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    return result;
  }

  GossipMessageCancelTransfer._();

  factory GossipMessageCancelTransfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessageCancelTransfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessageCancelTransfer',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageCancelTransfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageCancelTransfer copyWith(
          void Function(GossipMessageCancelTransfer) updates) =>
      super.copyWith(
              (message) => updates(message as GossipMessageCancelTransfer))
          as GossipMessageCancelTransfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessageCancelTransfer create() =>
      GossipMessageCancelTransfer._();
  @$core.override
  GossipMessageCancelTransfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessageCancelTransfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GossipMessageCancelTransfer>(create);
  static GossipMessageCancelTransfer? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);
}

/// Rolling back a transfer reverts it to its initial state. Only transfers that
/// have not been key-tweaked by the sender are eligible for rollback.
class GossipMessageRollbackTransfer extends $pb.GeneratedMessage {
  factory GossipMessageRollbackTransfer({
    $core.String? transferId,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    return result;
  }

  GossipMessageRollbackTransfer._();

  factory GossipMessageRollbackTransfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessageRollbackTransfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessageRollbackTransfer',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageRollbackTransfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageRollbackTransfer copyWith(
          void Function(GossipMessageRollbackTransfer) updates) =>
      super.copyWith(
              (message) => updates(message as GossipMessageRollbackTransfer))
          as GossipMessageRollbackTransfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessageRollbackTransfer create() =>
      GossipMessageRollbackTransfer._();
  @$core.override
  GossipMessageRollbackTransfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessageRollbackTransfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GossipMessageRollbackTransfer>(create);
  static GossipMessageRollbackTransfer? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);
}

class GossipMessageSettleSenderKeyTweak extends $pb.GeneratedMessage {
  factory GossipMessageSettleSenderKeyTweak({
    $core.String? transferId,
    $core.Iterable<$core.MapEntry<$core.String, $2.SecretProof>>?
        senderKeyTweakProofs,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (senderKeyTweakProofs != null)
      result.senderKeyTweakProofs.addEntries(senderKeyTweakProofs);
    return result;
  }

  GossipMessageSettleSenderKeyTweak._();

  factory GossipMessageSettleSenderKeyTweak.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessageSettleSenderKeyTweak.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessageSettleSenderKeyTweak',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..m<$core.String, $2.SecretProof>(
        2, _omitFieldNames ? '' : 'senderKeyTweakProofs',
        entryClassName:
            'GossipMessageSettleSenderKeyTweak.SenderKeyTweakProofsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $2.SecretProof.create,
        valueDefaultOrMaker: $2.SecretProof.getDefault,
        packageName: const $pb.PackageName('gossip'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageSettleSenderKeyTweak clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageSettleSenderKeyTweak copyWith(
          void Function(GossipMessageSettleSenderKeyTweak) updates) =>
      super.copyWith((message) =>
              updates(message as GossipMessageSettleSenderKeyTweak))
          as GossipMessageSettleSenderKeyTweak;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessageSettleSenderKeyTweak create() =>
      GossipMessageSettleSenderKeyTweak._();
  @$core.override
  GossipMessageSettleSenderKeyTweak createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessageSettleSenderKeyTweak getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GossipMessageSettleSenderKeyTweak>(
          create);
  static GossipMessageSettleSenderKeyTweak? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  /// The key tweak proofs for the leaves that this message is to commit.
  /// This is a safe guard to ensure that we can detect mismatch key tweaks, but if the proofs
  /// don't match, there's no way to recover at this point.
  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $2.SecretProof> get senderKeyTweakProofs =>
      $_getMap(1);
}

class GossipMessageMarkTreesExited extends $pb.GeneratedMessage {
  factory GossipMessageMarkTreesExited({
    $core.Iterable<$core.String>? treeIds,
  }) {
    final result = create();
    if (treeIds != null) result.treeIds.addAll(treeIds);
    return result;
  }

  GossipMessageMarkTreesExited._();

  factory GossipMessageMarkTreesExited.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessageMarkTreesExited.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessageMarkTreesExited',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'treeIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageMarkTreesExited clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageMarkTreesExited copyWith(
          void Function(GossipMessageMarkTreesExited) updates) =>
      super.copyWith(
              (message) => updates(message as GossipMessageMarkTreesExited))
          as GossipMessageMarkTreesExited;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessageMarkTreesExited create() =>
      GossipMessageMarkTreesExited._();
  @$core.override
  GossipMessageMarkTreesExited createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessageMarkTreesExited getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GossipMessageMarkTreesExited>(create);
  static GossipMessageMarkTreesExited? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get treeIds => $_getList(0);
}

class GossipMessageFinalizeTreeCreation extends $pb.GeneratedMessage {
  factory GossipMessageFinalizeTreeCreation({
    $core.Iterable<$3.TreeNode>? internalNodes,
    $2.Network? protoNetwork,
  }) {
    final result = create();
    if (internalNodes != null) result.internalNodes.addAll(internalNodes);
    if (protoNetwork != null) result.protoNetwork = protoNetwork;
    return result;
  }

  GossipMessageFinalizeTreeCreation._();

  factory GossipMessageFinalizeTreeCreation.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessageFinalizeTreeCreation.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessageFinalizeTreeCreation',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..pPM<$3.TreeNode>(1, _omitFieldNames ? '' : 'internalNodes',
        subBuilder: $3.TreeNode.create)
    ..aE<$2.Network>(2, _omitFieldNames ? '' : 'protoNetwork',
        enumValues: $2.Network.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageFinalizeTreeCreation clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageFinalizeTreeCreation copyWith(
          void Function(GossipMessageFinalizeTreeCreation) updates) =>
      super.copyWith((message) =>
              updates(message as GossipMessageFinalizeTreeCreation))
          as GossipMessageFinalizeTreeCreation;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessageFinalizeTreeCreation create() =>
      GossipMessageFinalizeTreeCreation._();
  @$core.override
  GossipMessageFinalizeTreeCreation createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessageFinalizeTreeCreation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GossipMessageFinalizeTreeCreation>(
          create);
  static GossipMessageFinalizeTreeCreation? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$3.TreeNode> get internalNodes => $_getList(0);

  @$pb.TagNumber(2)
  $2.Network get protoNetwork => $_getN(1);
  @$pb.TagNumber(2)
  set protoNetwork($2.Network value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasProtoNetwork() => $_has(1);
  @$pb.TagNumber(2)
  void clearProtoNetwork() => $_clearField(2);
}

class GossipMessageFinalizeTransfer extends $pb.GeneratedMessage {
  factory GossipMessageFinalizeTransfer({
    $core.String? transferId,
    $core.Iterable<$3.TreeNode>? internalNodes,
    $4.Timestamp? completionTimestamp,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (internalNodes != null) result.internalNodes.addAll(internalNodes);
    if (completionTimestamp != null)
      result.completionTimestamp = completionTimestamp;
    return result;
  }

  GossipMessageFinalizeTransfer._();

  factory GossipMessageFinalizeTransfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessageFinalizeTransfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessageFinalizeTransfer',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..pPM<$3.TreeNode>(2, _omitFieldNames ? '' : 'internalNodes',
        subBuilder: $3.TreeNode.create)
    ..aOM<$4.Timestamp>(3, _omitFieldNames ? '' : 'completionTimestamp',
        subBuilder: $4.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageFinalizeTransfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageFinalizeTransfer copyWith(
          void Function(GossipMessageFinalizeTransfer) updates) =>
      super.copyWith(
              (message) => updates(message as GossipMessageFinalizeTransfer))
          as GossipMessageFinalizeTransfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessageFinalizeTransfer create() =>
      GossipMessageFinalizeTransfer._();
  @$core.override
  GossipMessageFinalizeTransfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessageFinalizeTransfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GossipMessageFinalizeTransfer>(create);
  static GossipMessageFinalizeTransfer? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$3.TreeNode> get internalNodes => $_getList(1);

  @$pb.TagNumber(3)
  $4.Timestamp get completionTimestamp => $_getN(2);
  @$pb.TagNumber(3)
  set completionTimestamp($4.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCompletionTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearCompletionTimestamp() => $_clearField(3);
  @$pb.TagNumber(3)
  $4.Timestamp ensureCompletionTimestamp() => $_ensure(2);
}

/// FinalizeTransferReceiver is sent when an individual receiver completes their
/// claim in a MIMO transfer. It carries the receiver's tree node updates and
/// marks that receiver as Completed on non-coordinator SOs.
class GossipMessageFinalizeTransferReceiver extends $pb.GeneratedMessage {
  factory GossipMessageFinalizeTransferReceiver({
    $core.String? transferId,
    $core.List<$core.int>? receiverIdentityPublicKey,
    $core.Iterable<$3.TreeNode>? internalNodes,
    $4.Timestamp? completionTimestamp,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (receiverIdentityPublicKey != null)
      result.receiverIdentityPublicKey = receiverIdentityPublicKey;
    if (internalNodes != null) result.internalNodes.addAll(internalNodes);
    if (completionTimestamp != null)
      result.completionTimestamp = completionTimestamp;
    return result;
  }

  GossipMessageFinalizeTransferReceiver._();

  factory GossipMessageFinalizeTransferReceiver.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessageFinalizeTransferReceiver.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessageFinalizeTransferReceiver',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..a<$core.List<$core.int>>(2,
        _omitFieldNames ? '' : 'receiverIdentityPublicKey', $pb.PbFieldType.OY)
    ..pPM<$3.TreeNode>(3, _omitFieldNames ? '' : 'internalNodes',
        subBuilder: $3.TreeNode.create)
    ..aOM<$4.Timestamp>(4, _omitFieldNames ? '' : 'completionTimestamp',
        subBuilder: $4.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageFinalizeTransferReceiver clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageFinalizeTransferReceiver copyWith(
          void Function(GossipMessageFinalizeTransferReceiver) updates) =>
      super.copyWith((message) =>
              updates(message as GossipMessageFinalizeTransferReceiver))
          as GossipMessageFinalizeTransferReceiver;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessageFinalizeTransferReceiver create() =>
      GossipMessageFinalizeTransferReceiver._();
  @$core.override
  GossipMessageFinalizeTransferReceiver createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessageFinalizeTransferReceiver getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GossipMessageFinalizeTransferReceiver>(create);
  static GossipMessageFinalizeTransferReceiver? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get receiverIdentityPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set receiverIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReceiverIdentityPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiverIdentityPublicKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$3.TreeNode> get internalNodes => $_getList(2);

  @$pb.TagNumber(4)
  $4.Timestamp get completionTimestamp => $_getN(3);
  @$pb.TagNumber(4)
  set completionTimestamp($4.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasCompletionTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearCompletionTimestamp() => $_clearField(4);
  @$pb.TagNumber(4)
  $4.Timestamp ensureCompletionTimestamp() => $_ensure(3);
}

class GossipMessageFinalizeRefreshTimelock extends $pb.GeneratedMessage {
  factory GossipMessageFinalizeRefreshTimelock({
    $core.Iterable<$3.TreeNode>? internalNodes,
  }) {
    final result = create();
    if (internalNodes != null) result.internalNodes.addAll(internalNodes);
    return result;
  }

  GossipMessageFinalizeRefreshTimelock._();

  factory GossipMessageFinalizeRefreshTimelock.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessageFinalizeRefreshTimelock.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessageFinalizeRefreshTimelock',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..pPM<$3.TreeNode>(1, _omitFieldNames ? '' : 'internalNodes',
        subBuilder: $3.TreeNode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageFinalizeRefreshTimelock clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageFinalizeRefreshTimelock copyWith(
          void Function(GossipMessageFinalizeRefreshTimelock) updates) =>
      super.copyWith((message) =>
              updates(message as GossipMessageFinalizeRefreshTimelock))
          as GossipMessageFinalizeRefreshTimelock;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessageFinalizeRefreshTimelock create() =>
      GossipMessageFinalizeRefreshTimelock._();
  @$core.override
  GossipMessageFinalizeRefreshTimelock createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessageFinalizeRefreshTimelock getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GossipMessageFinalizeRefreshTimelock>(create);
  static GossipMessageFinalizeRefreshTimelock? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$3.TreeNode> get internalNodes => $_getList(0);
}

class GossipMessageFinalizeExtendLeaf extends $pb.GeneratedMessage {
  factory GossipMessageFinalizeExtendLeaf({
    $core.Iterable<$3.TreeNode>? internalNodes,
  }) {
    final result = create();
    if (internalNodes != null) result.internalNodes.addAll(internalNodes);
    return result;
  }

  GossipMessageFinalizeExtendLeaf._();

  factory GossipMessageFinalizeExtendLeaf.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessageFinalizeExtendLeaf.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessageFinalizeExtendLeaf',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..pPM<$3.TreeNode>(1, _omitFieldNames ? '' : 'internalNodes',
        subBuilder: $3.TreeNode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageFinalizeExtendLeaf clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageFinalizeExtendLeaf copyWith(
          void Function(GossipMessageFinalizeExtendLeaf) updates) =>
      super.copyWith(
              (message) => updates(message as GossipMessageFinalizeExtendLeaf))
          as GossipMessageFinalizeExtendLeaf;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessageFinalizeExtendLeaf create() =>
      GossipMessageFinalizeExtendLeaf._();
  @$core.override
  GossipMessageFinalizeExtendLeaf createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessageFinalizeExtendLeaf getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GossipMessageFinalizeExtendLeaf>(
          create);
  static GossipMessageFinalizeExtendLeaf? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$3.TreeNode> get internalNodes => $_getList(0);
}

class GossipMessageFinalizeRenewRefundTimelock extends $pb.GeneratedMessage {
  factory GossipMessageFinalizeRenewRefundTimelock({
    $3.TreeNode? node,
  }) {
    final result = create();
    if (node != null) result.node = node;
    return result;
  }

  GossipMessageFinalizeRenewRefundTimelock._();

  factory GossipMessageFinalizeRenewRefundTimelock.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessageFinalizeRenewRefundTimelock.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessageFinalizeRenewRefundTimelock',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..aOM<$3.TreeNode>(1, _omitFieldNames ? '' : 'node',
        subBuilder: $3.TreeNode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageFinalizeRenewRefundTimelock clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageFinalizeRenewRefundTimelock copyWith(
          void Function(GossipMessageFinalizeRenewRefundTimelock) updates) =>
      super.copyWith((message) =>
              updates(message as GossipMessageFinalizeRenewRefundTimelock))
          as GossipMessageFinalizeRenewRefundTimelock;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessageFinalizeRenewRefundTimelock create() =>
      GossipMessageFinalizeRenewRefundTimelock._();
  @$core.override
  GossipMessageFinalizeRenewRefundTimelock createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessageFinalizeRenewRefundTimelock getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GossipMessageFinalizeRenewRefundTimelock>(create);
  static GossipMessageFinalizeRenewRefundTimelock? _defaultInstance;

  @$pb.TagNumber(1)
  $3.TreeNode get node => $_getN(0);
  @$pb.TagNumber(1)
  set node($3.TreeNode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasNode() => $_has(0);
  @$pb.TagNumber(1)
  void clearNode() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.TreeNode ensureNode() => $_ensure(0);
}

class GossipMessageFinalizeRenewNodeTimelock extends $pb.GeneratedMessage {
  factory GossipMessageFinalizeRenewNodeTimelock({
    $3.TreeNode? splitNode,
    $3.TreeNode? node,
  }) {
    final result = create();
    if (splitNode != null) result.splitNode = splitNode;
    if (node != null) result.node = node;
    return result;
  }

  GossipMessageFinalizeRenewNodeTimelock._();

  factory GossipMessageFinalizeRenewNodeTimelock.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessageFinalizeRenewNodeTimelock.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessageFinalizeRenewNodeTimelock',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..aOM<$3.TreeNode>(1, _omitFieldNames ? '' : 'splitNode',
        subBuilder: $3.TreeNode.create)
    ..aOM<$3.TreeNode>(2, _omitFieldNames ? '' : 'node',
        subBuilder: $3.TreeNode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageFinalizeRenewNodeTimelock clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageFinalizeRenewNodeTimelock copyWith(
          void Function(GossipMessageFinalizeRenewNodeTimelock) updates) =>
      super.copyWith((message) =>
              updates(message as GossipMessageFinalizeRenewNodeTimelock))
          as GossipMessageFinalizeRenewNodeTimelock;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessageFinalizeRenewNodeTimelock create() =>
      GossipMessageFinalizeRenewNodeTimelock._();
  @$core.override
  GossipMessageFinalizeRenewNodeTimelock createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessageFinalizeRenewNodeTimelock getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GossipMessageFinalizeRenewNodeTimelock>(create);
  static GossipMessageFinalizeRenewNodeTimelock? _defaultInstance;

  @$pb.TagNumber(1)
  $3.TreeNode get splitNode => $_getN(0);
  @$pb.TagNumber(1)
  set splitNode($3.TreeNode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSplitNode() => $_has(0);
  @$pb.TagNumber(1)
  void clearSplitNode() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.TreeNode ensureSplitNode() => $_ensure(0);

  @$pb.TagNumber(2)
  $3.TreeNode get node => $_getN(1);
  @$pb.TagNumber(2)
  set node($3.TreeNode value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNode() => $_has(1);
  @$pb.TagNumber(2)
  void clearNode() => $_clearField(2);
  @$pb.TagNumber(2)
  $3.TreeNode ensureNode() => $_ensure(1);
}

/// Rollback UTXO swap is called when Create UTXO swap transaction failed to
/// fully complete. This reverts the state back to before the swap, allowing the
/// user to initiate the UTXO swap again.
class GossipMessageRollbackUtxoSwap extends $pb.GeneratedMessage {
  factory GossipMessageRollbackUtxoSwap({
    $2.UTXO? onChainUtxo,
    $core.List<$core.int>? signature,
    $core.List<$core.int>? coordinatorPublicKey,
  }) {
    final result = create();
    if (onChainUtxo != null) result.onChainUtxo = onChainUtxo;
    if (signature != null) result.signature = signature;
    if (coordinatorPublicKey != null)
      result.coordinatorPublicKey = coordinatorPublicKey;
    return result;
  }

  GossipMessageRollbackUtxoSwap._();

  factory GossipMessageRollbackUtxoSwap.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessageRollbackUtxoSwap.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessageRollbackUtxoSwap',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..aOM<$2.UTXO>(1, _omitFieldNames ? '' : 'onChainUtxo',
        subBuilder: $2.UTXO.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'coordinatorPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageRollbackUtxoSwap clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageRollbackUtxoSwap copyWith(
          void Function(GossipMessageRollbackUtxoSwap) updates) =>
      super.copyWith(
              (message) => updates(message as GossipMessageRollbackUtxoSwap))
          as GossipMessageRollbackUtxoSwap;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessageRollbackUtxoSwap create() =>
      GossipMessageRollbackUtxoSwap._();
  @$core.override
  GossipMessageRollbackUtxoSwap createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessageRollbackUtxoSwap getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GossipMessageRollbackUtxoSwap>(create);
  static GossipMessageRollbackUtxoSwap? _defaultInstance;

  /// UTXO swap is identified by UTXO
  @$pb.TagNumber(1)
  $2.UTXO get onChainUtxo => $_getN(0);
  @$pb.TagNumber(1)
  set onChainUtxo($2.UTXO value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOnChainUtxo() => $_has(0);
  @$pb.TagNumber(1)
  void clearOnChainUtxo() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.UTXO ensureOnChainUtxo() => $_ensure(0);

  /// Signature of the Coordinator that started the Create UTXO swap transaction
  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);

  /// Identity key of the Coordinator
  @$pb.TagNumber(3)
  $core.List<$core.int> get coordinatorPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set coordinatorPublicKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCoordinatorPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearCoordinatorPublicKey() => $_clearField(3);
}

/// Rollback UTXO swap is called when Create UTXO swap transaction failed to
/// fully complete. This reverts the state back to before the swap, allowing the
/// user to initiate the UTXO swap again.
class GossipMessageRollbackInstantUtxoSwap extends $pb.GeneratedMessage {
  factory GossipMessageRollbackInstantUtxoSwap({
    $2.UTXO? onChainUtxo,
    $core.List<$core.int>? signature,
    $core.List<$core.int>? coordinatorPublicKey,
    $core.Iterable<$2.UtxoSwapStatus>? rollbackFromStatuses,
    $2.UtxoSwapStatus? rollbackToStatus,
  }) {
    final result = create();
    if (onChainUtxo != null) result.onChainUtxo = onChainUtxo;
    if (signature != null) result.signature = signature;
    if (coordinatorPublicKey != null)
      result.coordinatorPublicKey = coordinatorPublicKey;
    if (rollbackFromStatuses != null)
      result.rollbackFromStatuses.addAll(rollbackFromStatuses);
    if (rollbackToStatus != null) result.rollbackToStatus = rollbackToStatus;
    return result;
  }

  GossipMessageRollbackInstantUtxoSwap._();

  factory GossipMessageRollbackInstantUtxoSwap.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessageRollbackInstantUtxoSwap.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessageRollbackInstantUtxoSwap',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..aOM<$2.UTXO>(1, _omitFieldNames ? '' : 'onChainUtxo',
        subBuilder: $2.UTXO.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'coordinatorPublicKey', $pb.PbFieldType.OY)
    ..pc<$2.UtxoSwapStatus>(
        4, _omitFieldNames ? '' : 'rollbackFromStatuses', $pb.PbFieldType.KE,
        valueOf: $2.UtxoSwapStatus.valueOf,
        enumValues: $2.UtxoSwapStatus.values,
        defaultEnumValue: $2.UtxoSwapStatus.UTXO_SWAP_STATUS_UNSPECIFIED)
    ..aE<$2.UtxoSwapStatus>(5, _omitFieldNames ? '' : 'rollbackToStatus',
        enumValues: $2.UtxoSwapStatus.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageRollbackInstantUtxoSwap clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageRollbackInstantUtxoSwap copyWith(
          void Function(GossipMessageRollbackInstantUtxoSwap) updates) =>
      super.copyWith((message) =>
              updates(message as GossipMessageRollbackInstantUtxoSwap))
          as GossipMessageRollbackInstantUtxoSwap;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessageRollbackInstantUtxoSwap create() =>
      GossipMessageRollbackInstantUtxoSwap._();
  @$core.override
  GossipMessageRollbackInstantUtxoSwap createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessageRollbackInstantUtxoSwap getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GossipMessageRollbackInstantUtxoSwap>(create);
  static GossipMessageRollbackInstantUtxoSwap? _defaultInstance;

  /// UTXO swap is identified by UTXO
  @$pb.TagNumber(1)
  $2.UTXO get onChainUtxo => $_getN(0);
  @$pb.TagNumber(1)
  set onChainUtxo($2.UTXO value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOnChainUtxo() => $_has(0);
  @$pb.TagNumber(1)
  void clearOnChainUtxo() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.UTXO ensureOnChainUtxo() => $_ensure(0);

  /// Signature of the Coordinator that started the Create UTXO swap transaction
  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);

  /// Identity key of the Coordinator
  @$pb.TagNumber(3)
  $core.List<$core.int> get coordinatorPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set coordinatorPublicKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCoordinatorPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearCoordinatorPublicKey() => $_clearField(3);

  /// Statuses that are ok to rollback from
  @$pb.TagNumber(4)
  $pb.PbList<$2.UtxoSwapStatus> get rollbackFromStatuses => $_getList(3);

  /// Status that we want to rollback to
  @$pb.TagNumber(5)
  $2.UtxoSwapStatus get rollbackToStatus => $_getN(4);
  @$pb.TagNumber(5)
  set rollbackToStatus($2.UtxoSwapStatus value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasRollbackToStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearRollbackToStatus() => $_clearField(5);
}

class GossipMessageDepositCleanup extends $pb.GeneratedMessage {
  factory GossipMessageDepositCleanup({
    $core.String? treeId,
  }) {
    final result = create();
    if (treeId != null) result.treeId = treeId;
    return result;
  }

  GossipMessageDepositCleanup._();

  factory GossipMessageDepositCleanup.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessageDepositCleanup.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessageDepositCleanup',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'treeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageDepositCleanup clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageDepositCleanup copyWith(
          void Function(GossipMessageDepositCleanup) updates) =>
      super.copyWith(
              (message) => updates(message as GossipMessageDepositCleanup))
          as GossipMessageDepositCleanup;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessageDepositCleanup create() =>
      GossipMessageDepositCleanup._();
  @$core.override
  GossipMessageDepositCleanup createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessageDepositCleanup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GossipMessageDepositCleanup>(create);
  static GossipMessageDepositCleanup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get treeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set treeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTreeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTreeId() => $_clearField(1);
}

class GossipMessagePreimage extends $pb.GeneratedMessage {
  factory GossipMessagePreimage({
    $core.List<$core.int>? preimage,
    $core.List<$core.int>? paymentHash,
  }) {
    final result = create();
    if (preimage != null) result.preimage = preimage;
    if (paymentHash != null) result.paymentHash = paymentHash;
    return result;
  }

  GossipMessagePreimage._();

  factory GossipMessagePreimage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessagePreimage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessagePreimage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'preimage', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'paymentHash', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessagePreimage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessagePreimage copyWith(
          void Function(GossipMessagePreimage) updates) =>
      super.copyWith((message) => updates(message as GossipMessagePreimage))
          as GossipMessagePreimage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessagePreimage create() => GossipMessagePreimage._();
  @$core.override
  GossipMessagePreimage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessagePreimage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GossipMessagePreimage>(create);
  static GossipMessagePreimage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get preimage => $_getN(0);
  @$pb.TagNumber(1)
  set preimage($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPreimage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPreimage() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get paymentHash => $_getN(1);
  @$pb.TagNumber(2)
  set paymentHash($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPaymentHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearPaymentHash() => $_clearField(2);
}

/// SettleSwapKeyTweak is called in Swap V3 flow when a counter transfer is
/// created to settle both primary and counter transfer key tweaks atomically in the
/// same DB transaction.
class GossipMessageSettleSwapKeyTweak extends $pb.GeneratedMessage {
  factory GossipMessageSettleSwapKeyTweak({
    $core.String? counterTransferId,
  }) {
    final result = create();
    if (counterTransferId != null) result.counterTransferId = counterTransferId;
    return result;
  }

  GossipMessageSettleSwapKeyTweak._();

  factory GossipMessageSettleSwapKeyTweak.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessageSettleSwapKeyTweak.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessageSettleSwapKeyTweak',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'counterTransferId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageSettleSwapKeyTweak clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageSettleSwapKeyTweak copyWith(
          void Function(GossipMessageSettleSwapKeyTweak) updates) =>
      super.copyWith(
              (message) => updates(message as GossipMessageSettleSwapKeyTweak))
          as GossipMessageSettleSwapKeyTweak;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessageSettleSwapKeyTweak create() =>
      GossipMessageSettleSwapKeyTweak._();
  @$core.override
  GossipMessageSettleSwapKeyTweak createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessageSettleSwapKeyTweak getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GossipMessageSettleSwapKeyTweak>(
          create);
  static GossipMessageSettleSwapKeyTweak? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get counterTransferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set counterTransferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCounterTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCounterTransferId() => $_clearField(1);
}

enum GossipMessageUpdateWalletSetting_MasterIdentityPublicKey {
  setMasterIdentityPublicKey,
  clearMasterIdentityPublicKey,
  notSet
}

class GossipMessageUpdateWalletSetting extends $pb.GeneratedMessage {
  factory GossipMessageUpdateWalletSetting({
    $core.List<$core.int>? ownerIdentityPublicKey,
    $core.bool? privateEnabled,
    $core.List<$core.int>? setMasterIdentityPublicKey,
    $core.bool? clearMasterIdentityPublicKey,
  }) {
    final result = create();
    if (ownerIdentityPublicKey != null)
      result.ownerIdentityPublicKey = ownerIdentityPublicKey;
    if (privateEnabled != null) result.privateEnabled = privateEnabled;
    if (setMasterIdentityPublicKey != null)
      result.setMasterIdentityPublicKey = setMasterIdentityPublicKey;
    if (clearMasterIdentityPublicKey != null)
      result.clearMasterIdentityPublicKey = clearMasterIdentityPublicKey;
    return result;
  }

  GossipMessageUpdateWalletSetting._();

  factory GossipMessageUpdateWalletSetting.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessageUpdateWalletSetting.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core
      .Map<$core.int, GossipMessageUpdateWalletSetting_MasterIdentityPublicKey>
      _GossipMessageUpdateWalletSetting_MasterIdentityPublicKeyByTag = {
    3: GossipMessageUpdateWalletSetting_MasterIdentityPublicKey
        .setMasterIdentityPublicKey,
    4: GossipMessageUpdateWalletSetting_MasterIdentityPublicKey
        .clearMasterIdentityPublicKey,
    0: GossipMessageUpdateWalletSetting_MasterIdentityPublicKey.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessageUpdateWalletSetting',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'ownerIdentityPublicKey', $pb.PbFieldType.OY)
    ..aOB(2, _omitFieldNames ? '' : 'privateEnabled')
    ..a<$core.List<$core.int>>(3,
        _omitFieldNames ? '' : 'setMasterIdentityPublicKey', $pb.PbFieldType.OY)
    ..aOB(4, _omitFieldNames ? '' : 'clearMasterIdentityPublicKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageUpdateWalletSetting clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageUpdateWalletSetting copyWith(
          void Function(GossipMessageUpdateWalletSetting) updates) =>
      super.copyWith(
              (message) => updates(message as GossipMessageUpdateWalletSetting))
          as GossipMessageUpdateWalletSetting;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessageUpdateWalletSetting create() =>
      GossipMessageUpdateWalletSetting._();
  @$core.override
  GossipMessageUpdateWalletSetting createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessageUpdateWalletSetting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GossipMessageUpdateWalletSetting>(
          create);
  static GossipMessageUpdateWalletSetting? _defaultInstance;

  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  GossipMessageUpdateWalletSetting_MasterIdentityPublicKey
      whichMasterIdentityPublicKey_() =>
          _GossipMessageUpdateWalletSetting_MasterIdentityPublicKeyByTag[
              $_whichOneof(0)]!;
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearMasterIdentityPublicKey_() => $_clearField($_whichOneof(0));

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
  $core.List<$core.int> get setMasterIdentityPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set setMasterIdentityPublicKey($core.List<$core.int> value) =>
      $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSetMasterIdentityPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearSetMasterIdentityPublicKey() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get clearMasterIdentityPublicKey => $_getBF(3);
  @$pb.TagNumber(4)
  set clearMasterIdentityPublicKey($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasClearMasterIdentityPublicKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearClearMasterIdentityPublicKey() => $_clearField(4);
}

/// Archives a specific static deposit address for a user during address rotation.
/// This marks the old address as archived (is_default=false) on all SOs.
/// Archived addresses are still queryable and able to accept deposits.
/// The coordinator signs this operation to prevent unauthorized archiving by rogue SOs.
class GossipMessageArchiveStaticDepositAddress extends $pb.GeneratedMessage {
  factory GossipMessageArchiveStaticDepositAddress({
    $core.List<$core.int>? ownerIdentityPublicKey,
    $2.Network? network,
    $core.String? address,
    $core.List<$core.int>? signature,
    $core.List<$core.int>? coordinatorPublicKey,
  }) {
    final result = create();
    if (ownerIdentityPublicKey != null)
      result.ownerIdentityPublicKey = ownerIdentityPublicKey;
    if (network != null) result.network = network;
    if (address != null) result.address = address;
    if (signature != null) result.signature = signature;
    if (coordinatorPublicKey != null)
      result.coordinatorPublicKey = coordinatorPublicKey;
    return result;
  }

  GossipMessageArchiveStaticDepositAddress._();

  factory GossipMessageArchiveStaticDepositAddress.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessageArchiveStaticDepositAddress.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessageArchiveStaticDepositAddress',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'ownerIdentityPublicKey', $pb.PbFieldType.OY)
    ..aE<$2.Network>(2, _omitFieldNames ? '' : 'network',
        enumValues: $2.Network.values)
    ..aOS(3, _omitFieldNames ? '' : 'address')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'coordinatorPublicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageArchiveStaticDepositAddress clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageArchiveStaticDepositAddress copyWith(
          void Function(GossipMessageArchiveStaticDepositAddress) updates) =>
      super.copyWith((message) =>
              updates(message as GossipMessageArchiveStaticDepositAddress))
          as GossipMessageArchiveStaticDepositAddress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessageArchiveStaticDepositAddress create() =>
      GossipMessageArchiveStaticDepositAddress._();
  @$core.override
  GossipMessageArchiveStaticDepositAddress createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessageArchiveStaticDepositAddress getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GossipMessageArchiveStaticDepositAddress>(create);
  static GossipMessageArchiveStaticDepositAddress? _defaultInstance;

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
  $2.Network get network => $_getN(1);
  @$pb.TagNumber(2)
  set network($2.Network value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNetwork() => $_has(1);
  @$pb.TagNumber(2)
  void clearNetwork() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get address => $_getSZ(2);
  @$pb.TagNumber(3)
  set address($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddress() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get signature => $_getN(3);
  @$pb.TagNumber(4)
  set signature($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSignature() => $_has(3);
  @$pb.TagNumber(4)
  void clearSignature() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get coordinatorPublicKey => $_getN(4);
  @$pb.TagNumber(5)
  set coordinatorPublicKey($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCoordinatorPublicKey() => $_has(4);
  @$pb.TagNumber(5)
  void clearCoordinatorPublicKey() => $_clearField(5);
}

class GossipMessageFinalizeTreeNode extends $pb.GeneratedMessage {
  factory GossipMessageFinalizeTreeNode({
    $core.Iterable<$3.TreeNode>? nodes,
  }) {
    final result = create();
    if (nodes != null) result.nodes.addAll(nodes);
    return result;
  }

  GossipMessageFinalizeTreeNode._();

  factory GossipMessageFinalizeTreeNode.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessageFinalizeTreeNode.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessageFinalizeTreeNode',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..pPM<$3.TreeNode>(1, _omitFieldNames ? '' : 'nodes',
        subBuilder: $3.TreeNode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageFinalizeTreeNode clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageFinalizeTreeNode copyWith(
          void Function(GossipMessageFinalizeTreeNode) updates) =>
      super.copyWith(
              (message) => updates(message as GossipMessageFinalizeTreeNode))
          as GossipMessageFinalizeTreeNode;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessageFinalizeTreeNode create() =>
      GossipMessageFinalizeTreeNode._();
  @$core.override
  GossipMessageFinalizeTreeNode createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessageFinalizeTreeNode getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GossipMessageFinalizeTreeNode>(create);
  static GossipMessageFinalizeTreeNode? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$3.TreeNode> get nodes => $_getList(0);
}

/// GossipMessageConsensusCommit delivers the commit phase of a consensus operation.
/// The op_type identifies the domain flow, and operation carries the serialized
/// domain-specific proto payload for the flow's commit logic.
class GossipMessageConsensusCommit extends $pb.GeneratedMessage {
  factory GossipMessageConsensusCommit({
    ConsensusOperationType? opType,
    $5.Any? operation,
  }) {
    final result = create();
    if (opType != null) result.opType = opType;
    if (operation != null) result.operation = operation;
    return result;
  }

  GossipMessageConsensusCommit._();

  factory GossipMessageConsensusCommit.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessageConsensusCommit.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessageConsensusCommit',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..aE<ConsensusOperationType>(1, _omitFieldNames ? '' : 'opType',
        enumValues: ConsensusOperationType.values)
    ..aOM<$5.Any>(2, _omitFieldNames ? '' : 'operation',
        subBuilder: $5.Any.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageConsensusCommit clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageConsensusCommit copyWith(
          void Function(GossipMessageConsensusCommit) updates) =>
      super.copyWith(
              (message) => updates(message as GossipMessageConsensusCommit))
          as GossipMessageConsensusCommit;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessageConsensusCommit create() =>
      GossipMessageConsensusCommit._();
  @$core.override
  GossipMessageConsensusCommit createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessageConsensusCommit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GossipMessageConsensusCommit>(create);
  static GossipMessageConsensusCommit? _defaultInstance;

  @$pb.TagNumber(1)
  ConsensusOperationType get opType => $_getN(0);
  @$pb.TagNumber(1)
  set opType(ConsensusOperationType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOpType() => $_has(0);
  @$pb.TagNumber(1)
  void clearOpType() => $_clearField(1);

  /// Domain-specific proto message for the commit phase.
  @$pb.TagNumber(2)
  $5.Any get operation => $_getN(1);
  @$pb.TagNumber(2)
  set operation($5.Any value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOperation() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperation() => $_clearField(2);
  @$pb.TagNumber(2)
  $5.Any ensureOperation() => $_ensure(1);
}

/// GossipMessageConsensusRollback delivers the rollback phase of a consensus operation.
/// The op_type identifies the domain flow, and operation carries the serialized
/// domain-specific proto payload for the flow's rollback logic.
class GossipMessageConsensusRollback extends $pb.GeneratedMessage {
  factory GossipMessageConsensusRollback({
    ConsensusOperationType? opType,
    $5.Any? operation,
  }) {
    final result = create();
    if (opType != null) result.opType = opType;
    if (operation != null) result.operation = operation;
    return result;
  }

  GossipMessageConsensusRollback._();

  factory GossipMessageConsensusRollback.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GossipMessageConsensusRollback.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GossipMessageConsensusRollback',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gossip'),
      createEmptyInstance: create)
    ..aE<ConsensusOperationType>(1, _omitFieldNames ? '' : 'opType',
        enumValues: ConsensusOperationType.values)
    ..aOM<$5.Any>(2, _omitFieldNames ? '' : 'operation',
        subBuilder: $5.Any.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageConsensusRollback clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GossipMessageConsensusRollback copyWith(
          void Function(GossipMessageConsensusRollback) updates) =>
      super.copyWith(
              (message) => updates(message as GossipMessageConsensusRollback))
          as GossipMessageConsensusRollback;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GossipMessageConsensusRollback create() =>
      GossipMessageConsensusRollback._();
  @$core.override
  GossipMessageConsensusRollback createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GossipMessageConsensusRollback getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GossipMessageConsensusRollback>(create);
  static GossipMessageConsensusRollback? _defaultInstance;

  @$pb.TagNumber(1)
  ConsensusOperationType get opType => $_getN(0);
  @$pb.TagNumber(1)
  set opType(ConsensusOperationType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOpType() => $_has(0);
  @$pb.TagNumber(1)
  void clearOpType() => $_clearField(1);

  /// Domain-specific proto message for the rollback phase.
  @$pb.TagNumber(2)
  $5.Any get operation => $_getN(1);
  @$pb.TagNumber(2)
  set operation($5.Any value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOperation() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperation() => $_clearField(2);
  @$pb.TagNumber(2)
  $5.Any ensureOperation() => $_ensure(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
