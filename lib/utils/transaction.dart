// lib/utils/transaction.dart

import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:bitcoin_base/bitcoin_base.dart';
import 'package:flutter/foundation.dart';

import '../errors/spark_error.dart'; // Adjust path for SparkValidationError
import '../spark_bindings/spark_bindings.dart'; // Adjust path for getSparkFrost
import 'bitcoin.dart';
import 'network.dart';

const int initialTimelock = 2000;
const int testUnilateralTimelock = 100;

const int timeLockInterval = 100;
const int directTimelockOffset = 50;
const int htlcTimelockOffset = 70;
const int directHtlcTimelockOffset = 85;

const int initialSequence = initialTimelock;

const int testUnilateralSequence = testUnilateralTimelock;
const int testUnilateralDirectSequence =
    testUnilateralTimelock + directTimelockOffset;

const int initialRootNodeSequence = 0;

// Default fee constants matching Go implementation
const int estimatedTxSize = 191;
const int defaultSatsPerVbyte = 5;
const int defaultFeeSats = estimatedTxSize * defaultSatsPerVbyte;

// Matches Go spark.ZeroSequence — avoids bit 31 (timelock disabled flag) being set.
const List<int> zeroSequence = [0x00, 0x00, 0x00, 0x40]; //1 << 30;

String _networkToString(Network network) {
  switch (network) {
    case Network.mainnet:
      return "mainnet";
    case Network.testnet:
      return "testnet";
    case Network.signet:
      return "signet";
    case Network.regtest:
    case Network.local:
      return "regtest";
  }
}

/// Subtracts the default fee from the amount if it's greater than the fee.
/// Returns the original amount if it's less than or equal to the fee.
BigInt maybeApplyFee(BigInt amount) {
  final fee = BigInt.from(defaultFeeSats);
  if (amount > fee) {
    return amount - fee;
  }
  return amount;
}

class CreateNodeTxsParams {
  final BtcTransaction parentTx;
  final int sequence;
  final int? directSequence;
  final int vout;
  final Network network;

  CreateNodeTxsParams({
    required this.parentTx,
    required this.sequence,
    this.directSequence,
    required this.vout,
    required this.network,
  });
}

class CreateNodeTxsResult {
  final BtcTransaction nodeTx;
  final BtcTransaction? directNodeTx;

  CreateNodeTxsResult({required this.nodeTx, required this.directNodeTx});
}

Future<CreateNodeTxsResult> _createNodeTxs(CreateNodeTxsParams params) async {
  final parentOutput = params.parentTx.outputs[params.vout];

  // In bitcoin_base, scriptPubKey is a hex string. We decode it to Uint8List.
  final pkScriptBytes = Uint8List.fromList(parentOutput.scriptPubKey.toBytes());

  final address = getP2TRAddressFromPkScript(pkScriptBytes, params.network);
  final actualDirectSequence =
      params.directSequence ?? params.sequence + directTimelockOffset;

  final sparkFrost = getSparkFrost();

  // Serialize parentTx to raw bytes for the WASM/FFI call
  final parentTxBytes = Uint8List.fromList(
    hex.decode(params.parentTx.serialize()),
  );

  final result = await sparkFrost.constructNodeTxPair(
    parentTxBytes,
    params.vout,
    address,
    params.sequence,
    actualDirectSequence,
    BigInt.from(defaultFeeSats),
  );

  // Assuming your FFI returns an object with cpfp and direct properties
  final nodeTx = getTxFromRawTxBytes(result.cpfpTx.tx);
  final directNodeTx = getTxFromRawTxBytes(result.directTx.tx);

  return CreateNodeTxsResult(nodeTx: nodeTx, directNodeTx: directNodeTx);
}

Future<CreateNodeTxsResult> createRootNodeTx(
  BtcTransaction parentTx,
  int vout,
  Network network,
) async {
  return _createNodeTxs(
    CreateNodeTxsParams(
      parentTx: parentTx,
      sequence: initialRootNodeSequence,
      vout: vout,
      network: network,
    ),
  );
}

Future<CreateNodeTxsResult> createZeroTimelockNodeTx(
  BtcTransaction parentTx,
  Network network,
) async {
  return _createNodeTxs(
    CreateNodeTxsParams(
      parentTx: parentTx,
      sequence: initialRootNodeSequence,
      directSequence: directTimelockOffset,
      vout: 0,
      network: network,
    ),
  );
}

Future<CreateNodeTxsResult> createInitialTimelockNodeTx(
  BtcTransaction parentTx,
  Network network,
) async {
  return _createNodeTxs(
    CreateNodeTxsParams(
      parentTx: parentTx,
      sequence: initialSequence,
      vout: 0,
      network: network,
    ),
  );
}

Future<CreateNodeTxsResult> createDecrementedTimelockNodeTx(
  BtcTransaction parentTx,
  BtcTransaction currentTx,
  Network network,
) async {
  final currentSequence = currentTx.inputs[0].sequence;
  final currentSequenceInt = Uint8List.fromList(
    currentSequence,
  ).buffer.asByteData(0).getUint32(0, Endian.little);

  return _createNodeTxs(
    CreateNodeTxsParams(
      parentTx: parentTx,
      sequence: getNextTransactionSequence(currentSequenceInt).nextSequence,
      vout: 0,
      network: network,
    ),
  );
}

Future<CreateNodeTxsResult> createTestUnilateralTimelockNodeTx(
  BtcTransaction parentTx,
  BtcTransaction nodeTx,
  Network network,
) async {
  final sequence = nodeTx.inputs[0].sequence;
  final sequenceInt = Uint8List.fromList(
    sequence,
  ).buffer.asByteData(0).getUint32(0, Endian.little);

  final isBit30Defined = sequenceInt & (1 << 30);
  return _createNodeTxs(
    CreateNodeTxsParams(
      parentTx: parentTx,
      sequence: isBit30Defined | testUnilateralTimelock,
      vout: 0,
      network: network,
    ),
  );
}

class NextHTLCTransactionSequence {
  final int nextSequence;
  final int nextDirectSequence;

  NextHTLCTransactionSequence({
    required this.nextSequence,
    required this.nextDirectSequence,
  });
}

NextHTLCTransactionSequence getNextHTLCTransactionSequence(
  int currSequence, {
  bool isNodeTx = false,
}) {
  final currentTimelock = getCurrentTimelock(currSequence);
  final nextTimelock = currentTimelock - timeLockInterval;
  final isBit30Defined = currSequence & (1 << 30);

  if (isNodeTx && nextTimelock < 0) {
    throw SparkValidationError(
      "timelock interval is less than 0",
      context: {
        'field': "nextTimelock",
        'value': nextTimelock,
        'expected': "Non-negative timelock interval",
      },
    );
  } else if (!isNodeTx && nextTimelock <= 0) {
    throw SparkValidationError(
      "timelock interval is less than or equal to 0",
      context: {
        'field': "nextTimelock",
        'value': nextTimelock,
        'expected': "Timelock greater than 0",
      },
    );
  }

  return NextHTLCTransactionSequence(
    nextSequence: isBit30Defined | (nextTimelock + htlcTimelockOffset),
    nextDirectSequence:
        isBit30Defined | (nextTimelock + directHtlcTimelockOffset),
  );
}

class RefundTxParams {
  final BtcTransaction nodeTx;
  final BtcTransaction? directNodeTx;
  final Uint8List receivingPubkey;
  final Network network;

  RefundTxParams({
    required this.nodeTx,
    this.directNodeTx,
    required this.receivingPubkey,
    required this.network,
  });
}

class RefundTxWithSequenceParams extends RefundTxParams {
  final int sequence;
  final bool enforceTimelocks;

  RefundTxWithSequenceParams({
    required super.nodeTx,
    super.directNodeTx,
    required super.receivingPubkey,
    required super.network,
    required this.sequence,
    this.enforceTimelocks = false,
  });
}

class RefundTxWithSequenceAndConnectorOutputParams
    extends RefundTxWithSequenceParams {
  final TxInput connectorOutput;

  RefundTxWithSequenceAndConnectorOutputParams({
    required super.nodeTx,
    super.directNodeTx,
    required super.receivingPubkey,
    required super.network,
    required super.sequence,
    super.enforceTimelocks,
    required this.connectorOutput,
  });
}

class RefundTxs {
  final BtcTransaction cpfpRefundTx;
  final BtcTransaction? directRefundTx;
  final BtcTransaction? directFromCpfpRefundTx;

  RefundTxs({
    required this.cpfpRefundTx,
    this.directRefundTx,
    required this.directFromCpfpRefundTx,
  });
}

Future<RefundTxs> _createRefundTxs(RefundTxWithSequenceParams params) async {
  int sequence = params.sequence;

  if (params.enforceTimelocks) {
    int currentTimelock = getCurrentTimelock(sequence);
    final remainder = currentTimelock % timeLockInterval;
    if (remainder != 0) {
      currentTimelock = currentTimelock - remainder;
    }

    // Using .toUnsigned(32) ensures the bit shift acts strictly as an unsigned 32-bit operation
    // exactly matching TS `>>> 0` behavior.
    sequence =
        (currentTimelock & 0xffff) | ((sequence & (1 << 30)).toUnsigned(32));
  }

  final directSequence = sequence + directTimelockOffset;
  final sequenceInt = Uint8List.fromList(
    params.nodeTx.inputs[0].sequence,
  ).buffer.asByteData(0).getUint32(0, Endian.little);
  final isZeroNode = getCurrentTimelock(sequenceInt) == 0;

  Uint8List? directNodeTxBytes;
  if (params.directNodeTx != null && !isZeroNode) {
    directNodeTxBytes = Uint8List.fromList(
      hex.decode(params.directNodeTx!.serialize()),
    );
  }

  final nodeTxBytes = Uint8List.fromList(hex.decode(params.nodeTx.serialize()));
  final sparkFrost = getSparkFrost();

  final result = await sparkFrost.constructRefundTxTrio(
    nodeTxBytes,
    directNodeTxBytes,
    0,
    params.receivingPubkey,
    _networkToString(params.network), // Rust expects this to be lower case
    sequence,
    directSequence,
    BigInt.from(defaultFeeSats),
  );

  // Note: verify the property names (e.g., cpfpRefund vs cpfp_refund) on your actual FFI bindings.
  final cpfpRefundTx = getTxFromRawTxBytes(result.cpfpRefundTx.tx);
  final directRefundTx = result.directRefundTx != null
      ? getTxFromRawTxBytes(result.directRefundTx!.tx)
      : null;
  final directFromCpfpRefundTx = getTxFromRawTxBytes(
    result.directFromCpfpRefundTx.tx,
  );

  return RefundTxs(
    cpfpRefundTx: cpfpRefundTx,
    directRefundTx: directRefundTx,
    directFromCpfpRefundTx: directFromCpfpRefundTx,
  );
}

Future<RefundTxs> createInitialTimelockRefundTxs(RefundTxParams params) async {
  return _createRefundTxs(
    RefundTxWithSequenceParams(
      nodeTx: params.nodeTx,
      directNodeTx: params.directNodeTx,
      receivingPubkey: params.receivingPubkey,
      network: params.network,
      sequence: initialSequence,
    ),
  );
}

Future<RefundTxs> createDecrementedTimelockRefundTxs(
  RefundTxWithSequenceParams params,
) async {
  final nextSequence = getNextTransactionSequence(params.sequence).nextSequence;

  return _createRefundTxs(
    RefundTxWithSequenceParams(
      nodeTx: params.nodeTx,
      directNodeTx: params.directNodeTx,
      receivingPubkey: params.receivingPubkey,
      network: params.network,
      sequence: nextSequence,
    ),
  );
}

Future<RefundTxs> createCurrentTimelockRefundTxs(
  RefundTxWithSequenceParams params,
) async {
  return _createRefundTxs(
    RefundTxWithSequenceParams(
      nodeTx: params.nodeTx,
      directNodeTx: params.directNodeTx,
      receivingPubkey: params.receivingPubkey,
      network: params.network,
      sequence: params.sequence,
      enforceTimelocks: true,
    ),
  );
}

Future<RefundTxs> createTestUnilateralRefundTxs(RefundTxParams params) async {
  return _createRefundTxs(
    RefundTxWithSequenceParams(
      nodeTx: params.nodeTx,
      directNodeTx: params.directNodeTx,
      receivingPubkey: params.receivingPubkey,
      network: params.network,
      sequence: testUnilateralSequence,
    ),
  );
}

Future<RefundTxs> createConnectorRefundTxs(
  RefundTxWithSequenceAndConnectorOutputParams params,
) async {
  final trio = await createDecrementedTimelockRefundTxs(params);

  // We can safely add the inputs directly to the lists created by bitcoin_base
  trio.cpfpRefundTx.inputs.add(params.connectorOutput);
  if (trio.directRefundTx != null) {
    trio.directRefundTx!.inputs.add(params.connectorOutput);
  }
  trio.directFromCpfpRefundTx?.inputs.add(params.connectorOutput);

  return trio;
}

int getCurrentTimelock(int? currSequence) {
  return (currSequence ?? 0) & 0xffff;
}

class TransactionSequence {
  final int nextSequence;
  final int nextDirectSequence;

  TransactionSequence({
    required this.nextSequence,
    required this.nextDirectSequence,
  });
}

TransactionSequence getTransactionSequence(int? currSequence) {
  final timelock = getCurrentTimelock(currSequence);
  final isBit30Defined = (currSequence ?? 0) & (1 << 30);

  return TransactionSequence(
    nextSequence: isBit30Defined | timelock,
    nextDirectSequence: isBit30Defined | (timelock + directTimelockOffset),
  );
}

void checkIfValidSequence(int? currSequence) {
  // Check bit 31 is active. If not equal to 0, timelock is not active.
  final timeLockActive = (currSequence ?? 0) & 0x80000000;
  if (timeLockActive != 0) {
    throw SparkValidationError(
      "Timelock not active",
      context: {'field': "currSequence", 'value': currSequence},
    );
  }

  // Check bit 22 is active. If not equal to 0, block based time lock not active.
  final relativeTimeLockActive = (currSequence ?? 0) & 0x00400000;
  if (relativeTimeLockActive != 0) {
    throw SparkValidationError(
      "Block based timelock not active",
      context: {'field': "currSequence", 'value': currSequence},
    );
  }
}

bool isZeroTimelock(int currSequence) {
  return getCurrentTimelock(currSequence) == 0;
}

// Refresh if current timelock is less than 200 blocks, to prevent it from
// going below 100 blocks following a transfer or renewal, which risks
// interfering with watchtowers.
bool doesTxnNeedRenewed(int currSequence) {
  final currentTimelock = getCurrentTimelock(currSequence);
  return currentTimelock < 200;
}

bool doesLeafNeedRefresh(int currSequence, {bool isNodeTx = false}) {
  final currentTimelock = getCurrentTimelock(currSequence);

  if (isNodeTx) {
    return currentTimelock == 0;
  }
  return currentTimelock <= 100;
}

// Make sure that the leaves are ok before sending or else next user could lose funds
TransactionSequence getNextTransactionSequence(
  int currSequence, {
  bool isNodeTx = false,
}) {
  final currentTimelock = getCurrentTimelock(currSequence);
  final nextTimelock = currentTimelock - timeLockInterval;
  final isBit30Defined = currSequence & (1 << 30);

  try{
    if (isNodeTx && nextTimelock < 0) {
      throw SparkValidationError(
        "timelock interval is less than 0",
        context: {
          'field': "nextTimelock",
          'value': nextTimelock,
          'expected': "Non-negative timelock interval",
        },
      );
    } else if (!isNodeTx && nextTimelock <= 0) {
      throw SparkValidationError(
        "timelock interval is less than or equal to 0",
        context: {
          'field': "nextTimelock",
          'value': nextTimelock,
          'expected': "Timelock greater than 0",
        },
      );
    }
  } catch (e, stack) {
    debugPrint("Catching the error to get the full stack $e\n${stack}");
    rethrow;
  }

  return TransactionSequence(
    nextSequence: isBit30Defined | nextTimelock,
    nextDirectSequence: isBit30Defined | (nextTimelock + directTimelockOffset),
  );
}

TxOutput getEphemeralAnchorOutput() {
  return TxOutput(
    amount: BigInt.zero,
    // Pay-to-anchor (P2A) ephemeral anchor output
    scriptPubKey: Script.deserialize(bytes: [0x51, 0x02, 0x4e, 0x73]),
  );
}

class DepositTx {
  final BtcTransaction tx;
  final int vout;

  DepositTx({required this.tx, required this.vout});
}

/// Creates a multi-input root transaction that consolidates multiple on-chain
/// UTXOs (all to the same deposit address) into a single root output.
///
/// Input ordering: primary UTXO first, then additional UTXOs in array order.
/// The output uses the pkScript from the first deposit output and sums all amounts.
BtcTransaction createMultiInputRootTx(List<DepositTx> depositTxs) {
  if (depositTxs.isEmpty) {
    throw SparkValidationError(
      "depositTxs must not be empty",
      context: {
        'field': "depositTxs",
        'value': depositTxs.length,
        'expected': "At least 1 deposit transaction",
      },
    );
  }

  final inputs = <TxInput>[];
  var totalAmount = BigInt.zero;

  for (final deposit in depositTxs) {
    final output = deposit.tx.outputs[deposit.vout];

    // In bitcoin_base, if it exists, amount is valid, and scriptPubKey is never null.
    // If you need strict runtime checking:
    if (output.scriptPubKey.toBytes().isEmpty) {
      throw SparkValidationError(
        "Deposit transaction output missing script",
        context: {
          'field': "depositTxOutput",
          'value': {'vout': deposit.vout},
        },
      );
    }

    inputs.add(
      TxInput(
        txId: getTxId(deposit.tx),
        txIndex: deposit.vout,
        sequance: zeroSequence,
      ),
    );
    totalAmount += output.amount;
  }

  final firstOutput = depositTxs[0].tx.outputs[depositTxs[0].vout];

  final outputs = <TxOutput>[
    TxOutput(scriptPubKey: firstOutput.scriptPubKey, amount: totalAmount),
    getEphemeralAnchorOutput(),
  ];

  return BtcTransaction(
    inputs: inputs,
    outputs: outputs,
    version: [0x03, 0x00, 0x00, 0x00],
  );
}
