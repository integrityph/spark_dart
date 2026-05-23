// This is a generated file - do not edit.
//
// Generated from spark.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// *
///  Network is the network type of the bitcoin network.
class Network extends $pb.ProtobufEnum {
  static const Network UNSPECIFIED =
      Network._(0, _omitEnumNames ? '' : 'UNSPECIFIED');
  static const Network MAINNET = Network._(1, _omitEnumNames ? '' : 'MAINNET');
  static const Network REGTEST = Network._(2, _omitEnumNames ? '' : 'REGTEST');
  static const Network TESTNET = Network._(3, _omitEnumNames ? '' : 'TESTNET');
  static const Network SIGNET = Network._(4, _omitEnumNames ? '' : 'SIGNET');

  static const $core.List<Network> values = <Network>[
    UNSPECIFIED,
    MAINNET,
    REGTEST,
    TESTNET,
    SIGNET,
  ];

  static final $core.List<Network?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static Network? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Network._(super.value, super.name);
}

class Direction extends $pb.ProtobufEnum {
  static const Direction NEXT = Direction._(0, _omitEnumNames ? '' : 'NEXT');
  static const Direction PREVIOUS =
      Direction._(1, _omitEnumNames ? '' : 'PREVIOUS');

  static const $core.List<Direction> values = <Direction>[
    NEXT,
    PREVIOUS,
  ];

  static final $core.List<Direction?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static Direction? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Direction._(super.value, super.name);
}

class TransferStatus extends $pb.ProtobufEnum {
  static const TransferStatus TRANSFER_STATUS_SENDER_INITIATED =
      TransferStatus._(
          0, _omitEnumNames ? '' : 'TRANSFER_STATUS_SENDER_INITIATED');
  static const TransferStatus TRANSFER_STATUS_SENDER_KEY_TWEAK_PENDING =
      TransferStatus._(
          1, _omitEnumNames ? '' : 'TRANSFER_STATUS_SENDER_KEY_TWEAK_PENDING');
  static const TransferStatus TRANSFER_STATUS_SENDER_KEY_TWEAKED =
      TransferStatus._(
          2, _omitEnumNames ? '' : 'TRANSFER_STATUS_SENDER_KEY_TWEAKED');
  static const TransferStatus TRANSFER_STATUS_RECEIVER_KEY_TWEAKED =
      TransferStatus._(
          3, _omitEnumNames ? '' : 'TRANSFER_STATUS_RECEIVER_KEY_TWEAKED');
  static const TransferStatus TRANSFER_STATUS_RECEIVER_REFUND_SIGNED =
      TransferStatus._(
          4, _omitEnumNames ? '' : 'TRANSFER_STATUS_RECEIVER_REFUND_SIGNED');
  static const TransferStatus TRANSFER_STATUS_COMPLETED =
      TransferStatus._(5, _omitEnumNames ? '' : 'TRANSFER_STATUS_COMPLETED');
  static const TransferStatus TRANSFER_STATUS_EXPIRED =
      TransferStatus._(6, _omitEnumNames ? '' : 'TRANSFER_STATUS_EXPIRED');
  static const TransferStatus TRANSFER_STATUS_RETURNED =
      TransferStatus._(7, _omitEnumNames ? '' : 'TRANSFER_STATUS_RETURNED');
  static const TransferStatus TRANSFER_STATUS_SENDER_INITIATED_COORDINATOR =
      TransferStatus._(8,
          _omitEnumNames ? '' : 'TRANSFER_STATUS_SENDER_INITIATED_COORDINATOR');
  static const TransferStatus TRANSFER_STATUS_RECEIVER_KEY_TWEAK_LOCKED =
      TransferStatus._(
          9, _omitEnumNames ? '' : 'TRANSFER_STATUS_RECEIVER_KEY_TWEAK_LOCKED');
  static const TransferStatus TRANSFER_STATUS_RECEIVER_KEY_TWEAK_APPLIED =
      TransferStatus._(10,
          _omitEnumNames ? '' : 'TRANSFER_STATUS_RECEIVER_KEY_TWEAK_APPLIED');
  static const TransferStatus TRANSFER_STATUS_APPLYING_SENDER_KEY_TWEAK =
      TransferStatus._(11,
          _omitEnumNames ? '' : 'TRANSFER_STATUS_APPLYING_SENDER_KEY_TWEAK');

  static const $core.List<TransferStatus> values = <TransferStatus>[
    TRANSFER_STATUS_SENDER_INITIATED,
    TRANSFER_STATUS_SENDER_KEY_TWEAK_PENDING,
    TRANSFER_STATUS_SENDER_KEY_TWEAKED,
    TRANSFER_STATUS_RECEIVER_KEY_TWEAKED,
    TRANSFER_STATUS_RECEIVER_REFUND_SIGNED,
    TRANSFER_STATUS_COMPLETED,
    TRANSFER_STATUS_EXPIRED,
    TRANSFER_STATUS_RETURNED,
    TRANSFER_STATUS_SENDER_INITIATED_COORDINATOR,
    TRANSFER_STATUS_RECEIVER_KEY_TWEAK_LOCKED,
    TRANSFER_STATUS_RECEIVER_KEY_TWEAK_APPLIED,
    TRANSFER_STATUS_APPLYING_SENDER_KEY_TWEAK,
  ];

  static final $core.List<TransferStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 11);
  static TransferStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TransferStatus._(super.value, super.name);
}

class TransferType extends $pb.ProtobufEnum {
  static const TransferType PREIMAGE_SWAP =
      TransferType._(0, _omitEnumNames ? '' : 'PREIMAGE_SWAP');
  static const TransferType COOPERATIVE_EXIT =
      TransferType._(1, _omitEnumNames ? '' : 'COOPERATIVE_EXIT');
  static const TransferType TRANSFER =
      TransferType._(2, _omitEnumNames ? '' : 'TRANSFER');
  static const TransferType UTXO_SWAP =
      TransferType._(3, _omitEnumNames ? '' : 'UTXO_SWAP');
  static const TransferType SWAP =
      TransferType._(30, _omitEnumNames ? '' : 'SWAP');
  static const TransferType COUNTER_SWAP =
      TransferType._(40, _omitEnumNames ? '' : 'COUNTER_SWAP');
  static const TransferType PRIMARY_SWAP_V3 =
      TransferType._(4, _omitEnumNames ? '' : 'PRIMARY_SWAP_V3');
  static const TransferType COUNTER_SWAP_V3 =
      TransferType._(5, _omitEnumNames ? '' : 'COUNTER_SWAP_V3');

  static const $core.List<TransferType> values = <TransferType>[
    PREIMAGE_SWAP,
    COOPERATIVE_EXIT,
    TRANSFER,
    UTXO_SWAP,
    SWAP,
    COUNTER_SWAP,
    PRIMARY_SWAP_V3,
    COUNTER_SWAP_V3,
  ];

  static final $core.Map<$core.int, TransferType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static TransferType? valueOf($core.int value) => _byValue[value];

  const TransferType._(super.value, super.name);
}

class Order extends $pb.ProtobufEnum {
  static const Order DESCENDING =
      Order._(0, _omitEnumNames ? '' : 'DESCENDING');
  static const Order ASCENDING = Order._(1, _omitEnumNames ? '' : 'ASCENDING');

  static const $core.List<Order> values = <Order>[
    DESCENDING,
    ASCENDING,
  ];

  static final $core.List<Order?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static Order? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Order._(super.value, super.name);
}

class PreimageRequestStatus extends $pb.ProtobufEnum {
  static const PreimageRequestStatus
      PREIMAGE_REQUEST_STATUS_WAITING_FOR_PREIMAGE = PreimageRequestStatus._(0,
          _omitEnumNames ? '' : 'PREIMAGE_REQUEST_STATUS_WAITING_FOR_PREIMAGE');
  static const PreimageRequestStatus PREIMAGE_REQUEST_STATUS_PREIMAGE_SHARED =
      PreimageRequestStatus._(
          1, _omitEnumNames ? '' : 'PREIMAGE_REQUEST_STATUS_PREIMAGE_SHARED');
  static const PreimageRequestStatus PREIMAGE_REQUEST_STATUS_RETURNED =
      PreimageRequestStatus._(
          2, _omitEnumNames ? '' : 'PREIMAGE_REQUEST_STATUS_RETURNED');

  static const $core.List<PreimageRequestStatus> values =
      <PreimageRequestStatus>[
    PREIMAGE_REQUEST_STATUS_WAITING_FOR_PREIMAGE,
    PREIMAGE_REQUEST_STATUS_PREIMAGE_SHARED,
    PREIMAGE_REQUEST_STATUS_RETURNED,
  ];

  static final $core.List<PreimageRequestStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static PreimageRequestStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PreimageRequestStatus._(super.value, super.name);
}

class PreimageRequestRole extends $pb.ProtobufEnum {
  static const PreimageRequestRole PREIMAGE_REQUEST_ROLE_RECEIVER =
      PreimageRequestRole._(
          0, _omitEnumNames ? '' : 'PREIMAGE_REQUEST_ROLE_RECEIVER');
  static const PreimageRequestRole PREIMAGE_REQUEST_ROLE_SENDER =
      PreimageRequestRole._(
          1, _omitEnumNames ? '' : 'PREIMAGE_REQUEST_ROLE_SENDER');
  static const PreimageRequestRole PREIMAGE_REQUEST_ROLE_RECEIVER_AND_SENDER =
      PreimageRequestRole._(
          2, _omitEnumNames ? '' : 'PREIMAGE_REQUEST_ROLE_RECEIVER_AND_SENDER');

  static const $core.List<PreimageRequestRole> values = <PreimageRequestRole>[
    PREIMAGE_REQUEST_ROLE_RECEIVER,
    PREIMAGE_REQUEST_ROLE_SENDER,
    PREIMAGE_REQUEST_ROLE_RECEIVER_AND_SENDER,
  ];

  static final $core.List<PreimageRequestRole?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static PreimageRequestRole? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PreimageRequestRole._(super.value, super.name);
}

/// *
///  Static deposit address flow messages
class UtxoSwapRequestType extends $pb.ProtobufEnum {
  static const UtxoSwapRequestType Fixed =
      UtxoSwapRequestType._(0, _omitEnumNames ? '' : 'Fixed');
  static const UtxoSwapRequestType MaxFee =
      UtxoSwapRequestType._(1, _omitEnumNames ? '' : 'MaxFee');
  static const UtxoSwapRequestType Refund =
      UtxoSwapRequestType._(2, _omitEnumNames ? '' : 'Refund');
  static const UtxoSwapRequestType Instant =
      UtxoSwapRequestType._(3, _omitEnumNames ? '' : 'Instant');

  static const $core.List<UtxoSwapRequestType> values = <UtxoSwapRequestType>[
    Fixed,
    MaxFee,
    Refund,
    Instant,
  ];

  static final $core.List<UtxoSwapRequestType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static UtxoSwapRequestType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UtxoSwapRequestType._(super.value, super.name);
}

class UtxoSwapStatus extends $pb.ProtobufEnum {
  static const UtxoSwapStatus UTXO_SWAP_STATUS_UNSPECIFIED =
      UtxoSwapStatus._(0, _omitEnumNames ? '' : 'UTXO_SWAP_STATUS_UNSPECIFIED');
  static const UtxoSwapStatus UTXO_SWAP_STATUS_CREATED =
      UtxoSwapStatus._(1, _omitEnumNames ? '' : 'UTXO_SWAP_STATUS_CREATED');
  static const UtxoSwapStatus UTXO_SWAP_STATUS_COMPLETED =
      UtxoSwapStatus._(2, _omitEnumNames ? '' : 'UTXO_SWAP_STATUS_COMPLETED');
  static const UtxoSwapStatus UTXO_SWAP_STATUS_CANCELLED =
      UtxoSwapStatus._(3, _omitEnumNames ? '' : 'UTXO_SWAP_STATUS_CANCELLED');

  static const $core.List<UtxoSwapStatus> values = <UtxoSwapStatus>[
    UTXO_SWAP_STATUS_UNSPECIFIED,
    UTXO_SWAP_STATUS_CREATED,
    UTXO_SWAP_STATUS_COMPLETED,
    UTXO_SWAP_STATUS_CANCELLED,
  ];

  static final $core.List<UtxoSwapStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static UtxoSwapStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UtxoSwapStatus._(super.value, super.name);
}

/// Which hash variant to use in cryptographic operations.
class HashVariant extends $pb.ProtobufEnum {
  static const HashVariant HASH_VARIANT_UNSPECIFIED =
      HashVariant._(0, _omitEnumNames ? '' : 'HASH_VARIANT_UNSPECIFIED');
  static const HashVariant HASH_VARIANT_V2 =
      HashVariant._(1, _omitEnumNames ? '' : 'HASH_VARIANT_V2');

  static const $core.List<HashVariant> values = <HashVariant>[
    HASH_VARIANT_UNSPECIFIED,
    HASH_VARIANT_V2,
  ];

  static final $core.List<HashVariant?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static HashVariant? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const HashVariant._(super.value, super.name);
}

class InvoiceStatus extends $pb.ProtobufEnum {
  static const InvoiceStatus NOT_FOUND =
      InvoiceStatus._(0, _omitEnumNames ? '' : 'NOT_FOUND');
  static const InvoiceStatus PENDING =
      InvoiceStatus._(1, _omitEnumNames ? '' : 'PENDING');
  static const InvoiceStatus FINALIZED =
      InvoiceStatus._(2, _omitEnumNames ? '' : 'FINALIZED');
  static const InvoiceStatus RETURNED =
      InvoiceStatus._(4, _omitEnumNames ? '' : 'RETURNED');

  static const $core.List<InvoiceStatus> values = <InvoiceStatus>[
    NOT_FOUND,
    PENDING,
    FINALIZED,
    RETURNED,
  ];

  static final $core.List<InvoiceStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static InvoiceStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const InvoiceStatus._(super.value, super.name);
}

class TreeNodeStatus extends $pb.ProtobufEnum {
  static const TreeNodeStatus TREE_NODE_STATUS_CREATING =
      TreeNodeStatus._(0, _omitEnumNames ? '' : 'TREE_NODE_STATUS_CREATING');
  static const TreeNodeStatus TREE_NODE_STATUS_AVAILABLE =
      TreeNodeStatus._(1, _omitEnumNames ? '' : 'TREE_NODE_STATUS_AVAILABLE');
  static const TreeNodeStatus TREE_NODE_STATUS_FROZEN_BY_ISSUER =
      TreeNodeStatus._(
          2, _omitEnumNames ? '' : 'TREE_NODE_STATUS_FROZEN_BY_ISSUER');
  static const TreeNodeStatus TREE_NODE_STATUS_TRANSFER_LOCKED =
      TreeNodeStatus._(
          3, _omitEnumNames ? '' : 'TREE_NODE_STATUS_TRANSFER_LOCKED');
  static const TreeNodeStatus TREE_NODE_STATUS_SPLIT_LOCKED = TreeNodeStatus._(
      4, _omitEnumNames ? '' : 'TREE_NODE_STATUS_SPLIT_LOCKED');
  static const TreeNodeStatus TREE_NODE_STATUS_SPLITTED =
      TreeNodeStatus._(5, _omitEnumNames ? '' : 'TREE_NODE_STATUS_SPLITTED');
  static const TreeNodeStatus TREE_NODE_STATUS_AGGREGATED =
      TreeNodeStatus._(6, _omitEnumNames ? '' : 'TREE_NODE_STATUS_AGGREGATED');
  static const TreeNodeStatus TREE_NODE_STATUS_ON_CHAIN =
      TreeNodeStatus._(7, _omitEnumNames ? '' : 'TREE_NODE_STATUS_ON_CHAIN');
  static const TreeNodeStatus TREE_NODE_STATUS_AGGREGATE_LOCK =
      TreeNodeStatus._(
          8, _omitEnumNames ? '' : 'TREE_NODE_STATUS_AGGREGATE_LOCK');
  static const TreeNodeStatus TREE_NODE_STATUS_EXITED =
      TreeNodeStatus._(9, _omitEnumNames ? '' : 'TREE_NODE_STATUS_EXITED');
  static const TreeNodeStatus TREE_NODE_STATUS_RENEW_LOCKED = TreeNodeStatus._(
      10, _omitEnumNames ? '' : 'TREE_NODE_STATUS_RENEW_LOCKED');
  static const TreeNodeStatus TREE_NODE_STATUS_UNAVAILABLE = TreeNodeStatus._(
      11, _omitEnumNames ? '' : 'TREE_NODE_STATUS_UNAVAILABLE');
  static const TreeNodeStatus TREE_NODE_STATUS_PARENT_EXITED = TreeNodeStatus._(
      12, _omitEnumNames ? '' : 'TREE_NODE_STATUS_PARENT_EXITED');

  static const $core.List<TreeNodeStatus> values = <TreeNodeStatus>[
    TREE_NODE_STATUS_CREATING,
    TREE_NODE_STATUS_AVAILABLE,
    TREE_NODE_STATUS_FROZEN_BY_ISSUER,
    TREE_NODE_STATUS_TRANSFER_LOCKED,
    TREE_NODE_STATUS_SPLIT_LOCKED,
    TREE_NODE_STATUS_SPLITTED,
    TREE_NODE_STATUS_AGGREGATED,
    TREE_NODE_STATUS_ON_CHAIN,
    TREE_NODE_STATUS_AGGREGATE_LOCK,
    TREE_NODE_STATUS_EXITED,
    TREE_NODE_STATUS_RENEW_LOCKED,
    TREE_NODE_STATUS_UNAVAILABLE,
    TREE_NODE_STATUS_PARENT_EXITED,
  ];

  static final $core.List<TreeNodeStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 12);
  static TreeNodeStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TreeNodeStatus._(super.value, super.name);
}

class SparkTransactionType extends $pb.ProtobufEnum {
  static const SparkTransactionType SPARK_TRANSACTION_TYPE_UNSPECIFIED =
      SparkTransactionType._(
          0, _omitEnumNames ? '' : 'SPARK_TRANSACTION_TYPE_UNSPECIFIED');
  static const SparkTransactionType SPARK_TRANSACTION_TYPE_TRANSFER =
      SparkTransactionType._(
          1, _omitEnumNames ? '' : 'SPARK_TRANSACTION_TYPE_TRANSFER');
  static const SparkTransactionType SPARK_TRANSACTION_TYPE_LIGHTNING_SEND =
      SparkTransactionType._(
          2, _omitEnumNames ? '' : 'SPARK_TRANSACTION_TYPE_LIGHTNING_SEND');
  static const SparkTransactionType SPARK_TRANSACTION_TYPE_LIGHTNING_RECEIVE =
      SparkTransactionType._(
          3, _omitEnumNames ? '' : 'SPARK_TRANSACTION_TYPE_LIGHTNING_RECEIVE');
  static const SparkTransactionType SPARK_TRANSACTION_TYPE_COOPERATIVE_EXIT =
      SparkTransactionType._(
          4, _omitEnumNames ? '' : 'SPARK_TRANSACTION_TYPE_COOPERATIVE_EXIT');
  static const SparkTransactionType SPARK_TRANSACTION_TYPE_DEPOSIT =
      SparkTransactionType._(
          5, _omitEnumNames ? '' : 'SPARK_TRANSACTION_TYPE_DEPOSIT');

  static const $core.List<SparkTransactionType> values = <SparkTransactionType>[
    SPARK_TRANSACTION_TYPE_UNSPECIFIED,
    SPARK_TRANSACTION_TYPE_TRANSFER,
    SPARK_TRANSACTION_TYPE_LIGHTNING_SEND,
    SPARK_TRANSACTION_TYPE_LIGHTNING_RECEIVE,
    SPARK_TRANSACTION_TYPE_COOPERATIVE_EXIT,
    SPARK_TRANSACTION_TYPE_DEPOSIT,
  ];

  static final $core.List<SparkTransactionType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static SparkTransactionType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SparkTransactionType._(super.value, super.name);
}

class InitiatePreimageSwapRequest_Reason extends $pb.ProtobufEnum {
  /// The associated lightning service is sending the payment.
  static const InitiatePreimageSwapRequest_Reason REASON_SEND =
      InitiatePreimageSwapRequest_Reason._(
          0, _omitEnumNames ? '' : 'REASON_SEND');

  /// The associated lightning service is receiving the payment.
  static const InitiatePreimageSwapRequest_Reason REASON_RECEIVE =
      InitiatePreimageSwapRequest_Reason._(
          1, _omitEnumNames ? '' : 'REASON_RECEIVE');

  static const $core.List<InitiatePreimageSwapRequest_Reason> values =
      <InitiatePreimageSwapRequest_Reason>[
    REASON_SEND,
    REASON_RECEIVE,
  ];

  static final $core.List<InitiatePreimageSwapRequest_Reason?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static InitiatePreimageSwapRequest_Reason? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const InitiatePreimageSwapRequest_Reason._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
