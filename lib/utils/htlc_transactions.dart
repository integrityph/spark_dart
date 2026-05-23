// lib/utils/htlc_transactions.dart

import 'dart:typed_data';
import 'package:blockchain_utils/bip/bip/types/types.dart';
import 'package:convert/convert.dart';
import 'package:bitcoin_base/bitcoin_base.dart';

import '../errors/spark_error.dart'; // Adjust path based on your errors export
import 'bitcoin.dart'; // Adjust path for getTxId
import 'network.dart'; // Adjust path for your Network enum
import 'transaction.dart'; // Adjust path for maybeApplyFee, getEphemeralAnchorOutput

// Fixed BIP341 “NUMS” x-only public key (a well-known constant, not tied to any secret).
const String _pubKeyBytesHex =
    "0250929b74c1a04954b78b4b6035e97a5e078a5a0f28ec96d547bfee9ace803ac0";

const int lightningHTLCSequence = 2160;

Uint8List numsPoint() {
  final point = ECPublic.fromHex(_pubKeyBytesHex);
  // Get uncompressed bytes (32 bytes) and strip the parity byte
  return Uint8List.fromList(point.toBytes(mode:PubKeyModes.compressed).sublist(1));
}

// --- Data Classes ---

class CreateLightningRefundTxsInput {
  final BtcTransaction nodeTx;
  final BtcTransaction? directNodeTx;
  final int vout;
  final int sequence;
  final int directSequence;
  final TxInput? directInput;
  final Network network;
  final Uint8List hash;
  final Uint8List hashLockDestinationPubkey;
  final Uint8List sequenceLockDestinationPubkey;

  CreateLightningRefundTxsInput({
    required this.nodeTx,
    this.directNodeTx,
    required this.vout,
    required this.sequence,
    required this.directSequence,
    this.directInput,
    required this.network,
    required this.hash,
    required this.hashLockDestinationPubkey,
    required this.sequenceLockDestinationPubkey,
  });
}

class CreateLightningRefundTxsOutput {
  final BtcTransaction cpfpRefundTx;
  final BtcTransaction? directRefundTx;
  final BtcTransaction? directFromCpfpRefundTx;

  CreateLightningRefundTxsOutput({
    required this.cpfpRefundTx,
    this.directRefundTx,
    this.directFromCpfpRefundTx,
  });
}

class SenderSpendTxOutput {
  final BtcTransaction senderSpendTx;
  final Uint8List sighash;
  final Uint8List sequenceLockScript;
  final Uint8List controlBlockBytes;

  SenderSpendTxOutput({
    required this.senderSpendTx,
    required this.sighash,
    required this.sequenceLockScript,
    required this.controlBlockBytes,
  });
}

class ReceiverSpendTxOutput {
  final BtcTransaction spendTx;
  final Uint8List controlBlockBytes;
  final Uint8List leafHash;
  final Uint8List hashLockScript;

  ReceiverSpendTxOutput({
    required this.spendTx,
    required this.controlBlockBytes,
    required this.leafHash,
    required this.hashLockScript,
  });
}

// --- Refund Creation ---

CreateLightningRefundTxsOutput createRefundTxsForLightning(
  CreateLightningRefundTxsInput params,
) {
  final cpfpRefundTx = createLightningHTLCTransaction(
    nodeTx: params.nodeTx,
    sequence: params.sequence,
    vout: params.vout,
    hash: params.hash,
    hashLockDestinationPubkey: params.hashLockDestinationPubkey,
    sequenceLockDestinationPubkey: params.sequenceLockDestinationPubkey,
    applyFee: false,
    network: params.network,
  );

  final directFromCpfpRefundTx = createLightningHTLCTransaction(
    nodeTx: params.nodeTx,
    sequence: params.directSequence,
    vout: params.vout,
    hash: params.hash,
    hashLockDestinationPubkey: params.hashLockDestinationPubkey,
    sequenceLockDestinationPubkey: params.sequenceLockDestinationPubkey,
    applyFee: true,
    network: params.network,
  );

  BtcTransaction? directRefundTx;
  if (params.directSequence > 0 && params.directNodeTx != null) {
    directRefundTx = createLightningHTLCTransaction(
      nodeTx: params.directNodeTx!,
      sequence: params.directSequence,
      vout: params.vout,
      hash: params.hash,
      hashLockDestinationPubkey: params.hashLockDestinationPubkey,
      sequenceLockDestinationPubkey: params.sequenceLockDestinationPubkey,
      applyFee: true,
      network: params.network,
    );
  } else if (params.directInput != null && params.directSequence <= 0) {
    throw SparkValidationError(
      "directSequence must be provided if directInput is",
      context: {'field': "directSequence", 'value': params.directSequence},
    );
  }

  return CreateLightningRefundTxsOutput(
    cpfpRefundTx: cpfpRefundTx,
    directRefundTx: directRefundTx,
    directFromCpfpRefundTx: directFromCpfpRefundTx,
  );
}

BtcTransaction createLightningHTLCTransaction({
  required BtcTransaction nodeTx,
  required int vout,
  required int sequence,
  required Uint8List hash,
  required Uint8List hashLockDestinationPubkey,
  required Uint8List sequenceLockDestinationPubkey,
  required bool applyFee,
  required Network network,
}) {
  BigInt outAmount = nodeTx.outputs.elementAtOrNull(vout)?.amount ?? BigInt.zero;
  if (applyFee) {
    outAmount = maybeApplyFee(outAmount);
  }

  // TS Implementation hardcodes input index to 0 here despite taking vout
  final sequenceArray = (ByteData(
    4,
  )..setUint32(0, sequence, Endian.little)).buffer.asUint8List();
  final input = TxInput(
    txId: getTxId(nodeTx),
    txIndex: 0,
    sequance: sequenceArray,
  );

  final taprootAddress = createHTLCTaprootAddress(
    hash: hash,
    hashLockDestinationPubkey: hashLockDestinationPubkey,
    sequence: lightningHTLCSequence,
    sequenceLockDestinationPubkey: sequenceLockDestinationPubkey,
    network: network,
  );

  final outputs = <TxOutput>[
    TxOutput(
      amount: outAmount,
      scriptPubKey: Script.deserialize(bytes: taprootAddress),
    ),
  ];

  if (!applyFee) {
    outputs.add(getEphemeralAnchorOutput());
  }

  return BtcTransaction(
    inputs: [input],
    outputs: outputs,
    version: [0x03, 0x00, 0x00, 0x00],
  );
}

// --- Script & Address Building ---

Uint8List createHTLCTaprootAddress({
  required Uint8List hash,
  required Uint8List hashLockDestinationPubkey,
  required int sequence,
  required Uint8List sequenceLockDestinationPubkey,
  required Network network,
}) {
  final numsKey = numsPoint();

  final hashLockScript = createHashLockScript(hash, hashLockDestinationPubkey);
  final sequenceLockScript = createSequenceLockScript(
    sequence,
    sequenceLockDestinationPubkey,
  );

  // 1. Create the leaves (leafVersion defaults to 0xc0 automatically!)
  final hashLockLeaf = TaprootLeaf(script: hashLockScript);
  final sequenceLockLeaf = TaprootLeaf(script: sequenceLockScript);

  // 2. Combine the two leaves into a branch, which acts as the root treeScript
  final scriptTree = TaprootBranch(a: hashLockLeaf, b: sequenceLockLeaf);

  // 3. For the address generation, pass the branch as the treeScript
  final address = P2trAddress.fromInternalKey(
    internalKey: numsKey,
    treeScript: scriptTree,
  );

  return Uint8List.fromList(address.toScriptPubKey().toBytes());
}

Script createHashLockScript(Uint8List hash, Uint8List pubkey) {
  final xOnlyPubkey = pubkey.length == 33 ? pubkey.sublist(1) : pubkey;
  return Script(
    script: [
      'OP_SHA256',
      hex.encode(hash),
      'OP_EQUALVERIFY',
      hex.encode(xOnlyPubkey),
      'OP_CHECKSIG',
    ],
  );
}

Script createSequenceLockScript(
  int sequence,
  Uint8List sequenceLockDestinationPubkey,
) {
  final xOnlyPubkey = sequenceLockDestinationPubkey.length == 33
      ? sequenceLockDestinationPubkey.sublist(1)
      : sequenceLockDestinationPubkey;

  return Script(
    script: [
      sequence, // bitcoin_base Script arrays natively convert ints to scriptnums
      'OP_CHECKSEQUENCEVERIFY',
      'OP_DROP',
      hex.encode(xOnlyPubkey),
      'OP_CHECKSIG',
    ],
  );
}

// --- Spend Transactions ---

SenderSpendTxOutput createSenderSpendTx({
  required BtcTransaction htlcTx,
  required Network network,
  required Uint8List hash,
  required Uint8List hashLockDestinationPubkey,
  required Uint8List sequenceLockDestinationPubkey,
  required int fee,
}) {
  final amount = htlcTx.outputs[0].amount - BigInt.from(fee);
  if (amount <= BigInt.zero) {
    throw SparkValidationError(
      "Fee is greater than the amount",
      context: {'field': "fee", 'value': fee},
    );
  }

  final senderP2TR = P2trAddress.fromInternalKey(
    internalKey: sequenceLockDestinationPubkey.sublist(1, 33),
  ).toScriptPubKey();

  final lightningHTLCSequenceArray = (ByteData(
    4,
  )..setUint32(0, lightningHTLCSequence, Endian.little)).buffer.asUint8List(0);
  final senderSpendTx = BtcTransaction(
    inputs: [
      TxInput(
        txId: getTxId(htlcTx),
        txIndex: 0,
        sequance: lightningHTLCSequenceArray,
      ),
    ],
    outputs: [TxOutput(amount: amount, scriptPubKey: senderP2TR)],
    version: [0x03, 0x00, 0x00, 0x00],
  );

  final hashLockScript = createHashLockScript(hash, hashLockDestinationPubkey);
  final sequenceLockScript = createSequenceLockScript(
    lightningHTLCSequence,
    sequenceLockDestinationPubkey,
  );

  final numsKey = numsPoint(); // Grab the internal key

  final hashLockLeaf = TaprootLeaf(script: hashLockScript);
  final sequenceLockLeaf = TaprootLeaf(script: sequenceLockScript);

  final scriptTree = TaprootBranch(a: hashLockLeaf, b: sequenceLockLeaf);

  // Use the discovered factory method to generate the control block
  final controlBlock = TaprootControlBlock.generate(
    xOnlyOrInternalPubKey: numsKey,
    leafScript: sequenceLockLeaf,
    scriptTree: scriptTree,
  );
  final controlBlockBytes = Uint8List.fromList(controlBlock.toBytes());

  // Fixed the hex string to bytes deserialization for scriptPubKey
  final sighashBytes = senderSpendTx.getTransactionTaprootDigset(
    // keeping the typo!
    txIndex: 0,
    scriptPubKeys: [
      Script.deserialize(bytes: htlcTx.outputs[0].scriptPubKey.toBytes()),
    ],
    amounts: [htlcTx.outputs[0].amount],
    tapleafScript: sequenceLockLeaf,
  );

  return SenderSpendTxOutput(
    senderSpendTx: senderSpendTx,
    sighash: Uint8List.fromList(sighashBytes),
    sequenceLockScript: Uint8List.fromList(sequenceLockScript.toBytes()),
    controlBlockBytes: controlBlockBytes,
  );
}

ReceiverSpendTxOutput createReceiverSpendTx({
  required BtcTransaction htlcTx,
  required Network network,
  required Uint8List hash,
  required Uint8List hashLockDestinationPubkey,
  required Uint8List sequenceLockDestinationPubkey,
  required int fee,
}) {
  final amount = htlcTx.outputs[0].amount - BigInt.from(fee);
  if (amount <= BigInt.zero) {
    throw SparkValidationError(
      "Fee is greater than the amount",
      context: {'field': "fee", 'value': fee},
    );
  }

  final senderP2TR = P2trAddress.fromInternalKey(
    internalKey: sequenceLockDestinationPubkey.sublist(1, 33),
  ).toScriptPubKey();

  final spendTx = BtcTransaction(
    inputs: [
      TxInput(
        txId: getTxId(htlcTx),
        txIndex: 0,
      ), // Sequence is omitted, defaulting to max
    ],
    outputs: [TxOutput(amount: amount, scriptPubKey: senderP2TR)],
    version: [0x03, 0x00, 0x00, 0x00],
  );

  final hashLockScript = createHashLockScript(hash, hashLockDestinationPubkey);
  final sequenceLockScript = createSequenceLockScript(
    lightningHTLCSequence,
    sequenceLockDestinationPubkey,
  );

  final numsKey = numsPoint();

  final hashLockLeaf = TaprootLeaf(script: hashLockScript);
  final sequenceLockLeaf = TaprootLeaf(script: sequenceLockScript);

  final scriptTree = TaprootBranch(a: hashLockLeaf, b: sequenceLockLeaf);

  // Generate control block for the hash lock leaf
  final controlBlock = TaprootControlBlock.generate(
    xOnlyOrInternalPubKey: numsKey,
    leafScript: hashLockLeaf,
    scriptTree: scriptTree,
  );
  final controlBlockBytes = Uint8List.fromList(controlBlock.toBytes());

  // TaprootLeaf uses .hash() to return the tagged leaf hash
  final leafHash = Uint8List.fromList(hashLockLeaf.hash());

  return ReceiverSpendTxOutput(
    spendTx: spendTx,
    controlBlockBytes: controlBlockBytes,
    leafHash: leafHash,
    hashLockScript: Uint8List.fromList(hashLockScript.toBytes()),
  );
}
