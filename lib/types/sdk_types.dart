// lib/types/sdk_types.dart

import 'dart:typed_data';

// Adjust these imports based on your project structure:
import '../graphql/objects/user_request.dart';
import '../utils/hex.dart';
import '../src/proto/spark.pb.dart'; // Standard Dart protobuf output convention
// import '../graphql/objects/index.dart';

// ============================================================================
// Union Type Definition
// ============================================================================

/// In Dart, we represent TypeScript Unions using an abstract base class.
/// Ensure your generated GraphQL objects (LightningSendRequest, etc.) implement this.
abstract class UserRequestType implements UserRequest {}

// ============================================================================
// Settings
// ============================================================================

class WalletSettings {
  final String ownerIdentityPublicKey;
  final bool privateEnabled;

  WalletSettings({
    required this.ownerIdentityPublicKey,
    required this.privateEnabled,
  });
}

WalletSettings mapSettingsProtoToWalletSettings(WalletSetting proto) {
  return WalletSettings(
    ownerIdentityPublicKey: bytesToHex(
      Uint8List.fromList(proto.ownerIdentityPublicKey),
    ),
    privateEnabled: proto.privateEnabled,
  );
}

// ============================================================================
// Wallet Leaf
// ============================================================================

class WalletLeaf {
  final String id;
  final String treeId;
  final int value;
  final String? parentNodeId;
  final String nodeTx;
  final String refundTx;
  final int vout;
  final String verifyingPublicKey;
  final String ownerIdentityPublicKey;
  final SigningKeyshare? signingKeyshare;
  final String status;
  final String network;

  WalletLeaf({
    required this.id,
    required this.treeId,
    required this.value,
    this.parentNodeId,
    required this.nodeTx,
    required this.refundTx,
    required this.vout,
    required this.verifyingPublicKey,
    required this.ownerIdentityPublicKey,
    this.signingKeyshare,
    required this.status,
    required this.network,
  });
}

WalletLeaf mapTreeNodeToWalletLeaf(TreeNode proto) {
  return WalletLeaf(
    id: proto.id,
    treeId: proto.treeId,
    // Assuming proto values might be generated as Int64, .toInt() safely maps them.
    // If they are already ints, .toInt() is a safe no-op.
    value: proto.value.toInt(),
    // Standard Dart protobufs use hasX() to check optional string presence, or return empty string.
    parentNodeId: proto.parentNodeId.isNotEmpty ? proto.parentNodeId : null,
    nodeTx: bytesToHex(Uint8List.fromList(proto.nodeTx)),
    refundTx: bytesToHex(Uint8List.fromList(proto.refundTx)),
    vout: proto.vout.toInt(),
    verifyingPublicKey: bytesToHex(
      Uint8List.fromList(proto.verifyingPublicKey),
    ),
    ownerIdentityPublicKey: bytesToHex(
      Uint8List.fromList(proto.ownerIdentityPublicKey),
    ),
    // In standard Dart protobuf, optional messages might need a hasX() check, or just a null check.
    signingKeyshare: proto.hasSigningKeyshare() ? proto.signingKeyshare : null,
    status: proto.status,
    network: proto.network.name, // Maps Enum value to its String name
  );
}

// ============================================================================
// Transfers
// ============================================================================

enum TransferDirection {
  incoming("INCOMING"),
  outgoing("OUTGOING");

  final String value;
  const TransferDirection(this.value);
}

class TransferReceiver {
  final String identityPublicKey;
  final int amountSats;

  TransferReceiver({required this.identityPublicKey, required this.amountSats});
}

class WalletTransferLeaf {
  final WalletLeaf? leaf;
  final String secretCipher;
  final String signature;
  final String intermediateRefundTx;

  WalletTransferLeaf({
    this.leaf,
    required this.secretCipher,
    required this.signature,
    required this.intermediateRefundTx,
  });
}

WalletTransferLeaf mapTransferLeafToWalletTransferLeaf(TransferLeaf proto) {
  return WalletTransferLeaf(
    leaf: proto.hasLeaf() ? mapTreeNodeToWalletLeaf(proto.leaf) : null,
    secretCipher: bytesToHex(Uint8List.fromList(proto.secretCipher)),
    signature: bytesToHex(Uint8List.fromList(proto.signature)),
    intermediateRefundTx: bytesToHex(
      Uint8List.fromList(proto.intermediateRefundTx),
    ),
  );
}

class WalletTransfer {
  final String id;
  final String senderIdentityPublicKey;
  final String receiverIdentityPublicKey;
  final String status;
  final int totalValue;
  final DateTime? expiryTime;
  final List<WalletTransferLeaf> leaves;
  final DateTime? createdTime;
  final DateTime? updatedTime;
  final String type;
  final TransferDirection transferDirection;
  final UserRequestType? userRequest;
  final String? sparkInvoice;
  final List<TransferReceiver>? receivers;

  WalletTransfer({
    required this.id,
    required this.senderIdentityPublicKey,
    required this.receiverIdentityPublicKey,
    required this.status,
    required this.totalValue,
    this.expiryTime,
    required this.leaves,
    this.createdTime,
    this.updatedTime,
    required this.type,
    required this.transferDirection,
    this.userRequest,
    this.sparkInvoice,
    this.receivers,
  });
}

WalletTransfer mapTransferToWalletTransfer(
  Transfer proto,
  String identityPublicKey, [
  UserRequestType? userRequest,
]) {
  final receiverIdentityPublicKey = bytesToHex(
    Uint8List.fromList(proto.receiverIdentityPublicKey),
  );
  final senderIdentityPublicKey = bytesToHex(
    Uint8List.fromList(proto.senderIdentityPublicKey),
  );

  // Determine Transfer Direction
  TransferDirection direction;
  if (receiverIdentityPublicKey == identityPublicKey) {
    direction = TransferDirection.incoming;
  } else if (proto.receivers.isNotEmpty &&
      proto.receivers.any(
        (r) =>
            bytesToHex(Uint8List.fromList(r.identityPublicKey)) ==
            identityPublicKey,
      )) {
    direction = TransferDirection.incoming;
  } else {
    direction = TransferDirection.outgoing;
  }

  return WalletTransfer(
    id: proto.id,
    senderIdentityPublicKey: senderIdentityPublicKey,
    receiverIdentityPublicKey: receiverIdentityPublicKey,
    status: proto.status.name, // Maps Enum value to String Name
    totalValue: proto.totalValue.toInt(),
    expiryTime: proto.expiryTime.toDateTime(),
    leaves: proto.leaves
        .map((leaf) => mapTransferLeafToWalletTransferLeaf(leaf))
        .toList(),
    createdTime: proto.createdTime.toDateTime(),
    updatedTime: proto.updatedTime.toDateTime(),
    type: proto.type.name, // Maps Enum value to String Name
    transferDirection: direction,
    userRequest: userRequest,
    sparkInvoice: proto.sparkInvoice.isNotEmpty ? proto.sparkInvoice : null,
    receivers: proto.receivers.isNotEmpty
        ? proto.receivers
              .map(
                (r) => TransferReceiver(
                  identityPublicKey: bytesToHex(
                    Uint8List.fromList(r.identityPublicKey),
                  ),
                  amountSats: r.amountSats.toInt(),
                ),
              )
              .toList()
        : null,
  );
}
