// lib/utils/bitcoin.dart

import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:bitcoin_base/bitcoin_base.dart';
import 'package:boringssl_ffi/boringssl_ffi.dart' as bsll;

import '../errors/spark_error.dart'; // Adjust import based on your SparkValidationError
import 'network.dart'; // Adjust import based on your Network enum

// --- Taproot & Keys ---

Uint8List computeTaprootKeyNoScript(Uint8List pubkey) {
  if (pubkey.length != 32) {
    throw SparkValidationError(
      "Public key must be 32 bytes",
      context: {'field': "pubkey", 'value': pubkey.length, 'expected': 32},
    );
  }

  final ecPub = ECPublic.fromBytes(pubkey);
  final tweaked = ecPub.tweakPublicKey();

  return Uint8List.fromList(hex.decode(tweaked));
}

Uint8List getP2TRScriptFromPublicKey(Uint8List pubKey, Network network) {
  if (pubKey.length != 33) {
    throw SparkValidationError(
      "Public key must be 33 bytes",
      context: {'field': "pubKey", 'value': pubKey.length, 'expected': 33},
    );
  }

  // 1. Strip the 0x02/0x03 parity byte to get the 32-byte X-coordinate
  final xOnlyPubKey = pubKey.sublist(1);

  final address = P2trAddress.fromInternalKey(internalKey: xOnlyPubKey);

  // 3. Skip the hex encoding/decoding, just grab the raw bytes
  return Uint8List.fromList(address.toScriptPubKey().toBytes());
}

// --- Addresses ---

String getP2TRAddressFromPublicKey(Uint8List pubKey, Network network) {
  if (pubKey.length != 33) {
    throw SparkValidationError(
      "Public key must be 33 bytes",
      context: {'field': "pubKey", 'value': pubKey.length, 'expected': 33},
    );
  }

  final address = P2trAddress.fromInternalKey(internalKey: pubKey);

  return address.toAddress(getBasedUtxoNetwork(network));
}

BasedUtxoNetwork getBasedUtxoNetwork(Network network) {
  return switch (network) {
    Network.mainnet => BasedUtxoNetwork.fromName("bitcoinMainnet"),
    Network.testnet => BasedUtxoNetwork.fromName("bitcoinTestnet"),
    Network.regtest => BasedUtxoNetwork.fromName("bitcoinTestnet"),
    Network.signet => BasedUtxoNetwork.fromName("bitcoinSignet"),
    Network.local => BasedUtxoNetwork.fromName("bitcoinTestnet"),
  };
}

BitcoinNetwork getBasedBitcoinNetwork(Network network) {
  return switch (network) {
    Network.mainnet => BitcoinNetwork.mainnet,
    Network.testnet => BitcoinNetwork.testnet,
    Network.regtest => BitcoinNetwork.testnet,
    Network.signet => BitcoinNetwork.signet,
    Network.local => BitcoinNetwork.testnet,
  };
}

String getP2TRAddressFromPkScript(Uint8List pkScript, Network network) {
  if (pkScript.length != 34 || pkScript[0] != 0x51 || pkScript[1] != 0x20) {
    throw SparkValidationError(
      "Invalid pkscript",
      context: {
        'field': "pkScript",
        'value': hex.encode(pkScript),
        'expected': "34 bytes starting with 0x51 0x20",
      },
    );
  }

  final address = P2trAddress.fromProgram(
    program: hex.encode(pkScript.sublist(2)),
  );

  return address.toAddress(getBasedUtxoNetwork(network));
}

String getP2WPKHAddressFromPublicKey(Uint8List pubKey, Network network) {
  if (pubKey.length != 33) {
    throw SparkValidationError(
      "Public key must be 33 bytes",
      context: {'field': "pubKey", 'value': pubKey.length, 'expected': 33},
    );
  }

  // 1. Load the point
  final ecPub = ECPublic.fromBytes(pubKey);

  // 2. Extract the Hash160 witness program.
  // Note: In bitcoin_base, toHash160() typically returns a hex string.
  // The ternary check here just defends against minor library version differences.
  final hash160 = ecPub.toHash160();
  final programBytes = hash160;

  // 3. Feed the 20-byte hash into the program factory to handle the Bech32 encoding
  final address = P2wpkhAddress.fromProgram(program: hex.encode(programBytes));

  return address.toAddress(getBasedUtxoNetwork(network));
}

// --- Transactions & Sighashes ---

BtcTransaction getTxFromRawTxHex(String rawTxHex) {
  try {
    return BtcTransaction.deserialize(hex.decode(rawTxHex));
  } catch (e) {
    throw SparkValidationError(
      "Failed to parse transaction from hex",
      context: {'field': "tx", 'value': "null"},
    );
  }
}

BtcTransaction getTxFromRawTxBytes(Uint8List rawTxBytes) {
  try {
    // In bitcoin_base, if .fromBuffer isn't available, converting to hex works safely
    return BtcTransaction.deserialize(rawTxBytes);
  } catch (e) {
    throw SparkValidationError(
      "Failed to parse transaction from bytes",
      context: {'field': "tx", 'value': "null"},
    );
  }
}

Uint8List getSigHashFromTx(
  BtcTransaction tx,
  int inputIndex,
  List<TxOutput> prevOutput,
) {
  if (prevOutput[inputIndex].scriptPubKey.toBytes().isEmpty) {
    throw SparkValidationError("No script found in prevOutput");
  }
  if (prevOutput[inputIndex].amount == BigInt.zero) {
    throw SparkValidationError("No amount found in prevOutput");
  }

  // Duplicate the target output across all inputs to match the TS `.fill()` behavior
  final scriptPubKeys = List.generate(
    tx.inputs.length,
    (_) => prevOutput[inputIndex].scriptPubKey,
  );

  final amounts = List.generate(prevOutput.length, (i) => prevOutput[i].amount);

  // Calculates the BIP-341 sighash.
  final sighashBytes = tx.getTransactionTaprootDigset(
    txIndex: inputIndex,
    scriptPubKeys: scriptPubKeys,
    amounts: amounts,
  );

  // The library returns a List<int> digest directly, so we just wrap it
  return Uint8List.fromList(sighashBytes);
}

/// Computes sighash for a multi-input Taproot transaction.
/// Per BIP 341, the sighash commits to ALL inputs' prevout amounts and scriptPubKeys.
Uint8List getSigHashFromMultiInputTx(
  BtcTransaction tx,
  int inputIndex,
  List<TxOutput> prevOutputs,
) {
  if (prevOutputs.length != tx.inputs.length) {
    throw SparkValidationError(
      "prevOutputs length must match transaction inputs length",
      context: {
        'field': "prevOutputs",
        'value': prevOutputs.length,
        'expected': tx.inputs.length,
      },
    );
  }

  final scriptPubKeys = <Script>[];
  final amounts = <BigInt>[];

  for (final prevOutput in prevOutputs) {
    if (prevOutput.scriptPubKey.toBytes().isEmpty) {
      throw SparkValidationError("No script found in prevOutput");
    }
    if (prevOutput.amount == BigInt.zero) {
      throw SparkValidationError("No amount found in prevOutput");
    }
    scriptPubKeys.add(prevOutput.scriptPubKey);
    amounts.add(prevOutput.amount);
  }

  final sighashBytes = tx.getTransactionTaprootDigset(
    txIndex: inputIndex,
    scriptPubKeys: scriptPubKeys,
    amounts: amounts,
  );

  return Uint8List.fromList(sighashBytes);
}

// --- Pure Dart Utility Implementations ---

String getTxId(BtcTransaction tx) {
  return tx.txId();
  // Convert TX to bytes, double SHA256 it, and reverse the bytes
  // final rawBytes = Uint8List.fromList(hex.decode(tx.serialize()));
  // final hash1 = bsll.sha256.hash(rawBytes)!;
  // final hash2 = bsll.sha256.hash(hash1)!;

  // final reversed = Uint8List.fromList(hash2.reversed.toList());
  // return hex.encode(reversed);
}

String getTxIdNoReverse(BtcTransaction tx) {
  final rawBytes = Uint8List.fromList(hex.decode(tx.serialize()));
  final hash1 = bsll.sha256.hash(rawBytes)!;
  final hash2 = bsll.sha256.hash(hash1)!;

  return hex.encode(hash2);
}

int getTxEstimatedVbytesSizeByNumberOfInputsOutputs(
  int numInputs,
  int numOutputs,
) {
  const int txOverhead = 10;
  const int inVbytes = 150;
  const int outVbytes = 34;

  return txOverhead + (numInputs * inVbytes) + (numOutputs * outVbytes);
}
