// lib/utils/token_transaction_validation.dart

import 'package:collection/collection.dart'; // For IterableExtension.elementAtOrNull
import '../errors/spark_error.dart'; // SparkError
import '../src/proto/spark_token.pb.dart'; // TokenTransaction, TokenOutputToSpend

// If you don't want to depend on flutter/foundation for listEquals,
// you can use this helper:
bool _areByteArraysEqual(List<int> a, List<int> b) {
  return const IterableEquality().equals(a, b);
}

bool _hasDuplicates<T>(List<T> array) {
  return array.toSet().length != array.length;
}

void validateTokenTransaction(
  TokenTransaction finalTokenTransaction,
  TokenTransaction partialTokenTransaction,
  Map<String, dynamic> signingOperators, {
  required List<String> ownerIdentifiers,
  required int threshold,
  required int expectedWithdrawBondSats,
  required int expectedWithdrawRelativeBlockLocktime,
  required int expectedThreshold,
}) {
  if (finalTokenTransaction.network != partialTokenTransaction.network) {
    throw SparkError("Network mismatch in response token transaction", {
      "value": finalTokenTransaction.network,
      "expected": partialTokenTransaction.network,
    });
  }

  // In Dart Protobufs, we check which case is set using the generated whichTokenInputs()
  final finalCase = finalTokenTransaction.whichTokenInputs();
  final partialCase = partialTokenTransaction.whichTokenInputs();

  if (finalCase == TokenTransaction_TokenInputs.notSet) {
    throw SparkError("Token inputs missing in final transaction", {
      "value": finalTokenTransaction,
    });
  }

  if (partialCase == TokenTransaction_TokenInputs.notSet) {
    throw SparkError("Token inputs missing in partial transaction", {
      "value": partialTokenTransaction,
    });
  }

  if (finalCase != partialCase) {
    throw SparkError(
      "Transaction type mismatch: final transaction has $finalCase, partial transaction has $partialCase",
      {"value": finalCase.toString(), "expected": partialCase.toString()},
    );
  }

  if (finalTokenTransaction.sparkOperatorIdentityPublicKeys.length !=
      partialTokenTransaction.sparkOperatorIdentityPublicKeys.length) {
    throw SparkError("Spark operator identity public keys count mismatch", {
      "value": finalTokenTransaction.sparkOperatorIdentityPublicKeys.length,
      "expected":
          partialTokenTransaction.sparkOperatorIdentityPublicKeys.length,
    });
  }

  if (partialCase == TokenTransaction_TokenInputs.mintInput) {
    final finalMintInput = finalTokenTransaction.mintInput;
    final partialMintInput = partialTokenTransaction.mintInput;

    if (finalMintInput.issuerPublicKey.isEmpty ||
        partialMintInput.issuerPublicKey.isEmpty) {
      throw SparkError("Issuer public key missing in mint input", {
        "value": finalMintInput.issuerPublicKey,
        "expected": partialMintInput.issuerPublicKey,
      });
    }
    if (finalMintInput.tokenIdentifier.isEmpty ||
        partialMintInput.tokenIdentifier.isEmpty) {
      throw SparkError("Token identifier missing in mint input", {
        "value": finalMintInput.tokenIdentifier,
        "expected": partialMintInput.tokenIdentifier,
      });
    }

    if (!_areByteArraysEqual(
      finalMintInput.issuerPublicKey,
      partialMintInput.issuerPublicKey,
    )) {
      throw SparkError("Issuer public key mismatch in mint input", {
        "value": finalMintInput.issuerPublicKey.toString(),
        "expected": partialMintInput.issuerPublicKey.toString(),
      });
    }

    if (!_areByteArraysEqual(
      finalMintInput.tokenIdentifier,
      partialMintInput.tokenIdentifier,
    )) {
      throw SparkError("Token identifier mismatch in mint input", {
        "value": finalMintInput.tokenIdentifier.toString(),
        "expected": partialMintInput.tokenIdentifier.toString(),
      });
    }
  } else if (partialCase == TokenTransaction_TokenInputs.transferInput) {
    final finalTransferInput = finalTokenTransaction.transferInput;
    final partialTransferInput = partialTokenTransaction.transferInput;

    if (finalTransferInput.outputsToSpend.length !=
        partialTransferInput.outputsToSpend.length) {
      throw SparkError("Outputs to spend count mismatch in transfer input", {
        "value": finalTransferInput.outputsToSpend.length,
        "expected": partialTransferInput.outputsToSpend.length,
      });
    }

    for (int i = 0; i < finalTransferInput.outputsToSpend.length; i++) {
      final finalOutput = finalTransferInput.outputsToSpend.elementAtOrNull(i);
      final partialOutput = partialTransferInput.outputsToSpend.elementAtOrNull(
        i,
      );

      if (finalOutput == null) {
        throw SparkError("Token output to spend missing in final transaction", {
          "outputIndex": i,
          "value": finalOutput,
        });
      }

      if (partialOutput == null) {
        throw SparkError(
          "Token output to spend missing in partial transaction",
          {"outputIndex": i, "value": partialOutput},
        );
      }

      if (!_areByteArraysEqual(
        finalOutput.prevTokenTransactionHash,
        partialOutput.prevTokenTransactionHash,
      )) {
        throw SparkError(
          "Previous token transaction hash mismatch in transfer input",
          {
            "outputIndex": i,
            "value": finalOutput.prevTokenTransactionHash.toString(),
            "expected": partialOutput.prevTokenTransactionHash.toString(),
          },
        );
      }

      if (finalOutput.prevTokenTransactionVout !=
          partialOutput.prevTokenTransactionVout) {
        throw SparkError(
          "Previous token transaction vout mismatch in transfer input",
          {
            "outputIndex": i,
            "value": finalOutput.prevTokenTransactionVout,
            "expected": partialOutput.prevTokenTransactionVout,
          },
        );
      }
    }
  }

  if (finalTokenTransaction.tokenOutputs.length !=
      partialTokenTransaction.tokenOutputs.length) {
    throw SparkError("Token outputs count mismatch", {
      "value": finalTokenTransaction.tokenOutputs.length,
      "expected": partialTokenTransaction.tokenOutputs.length,
    });
  }

  for (int i = 0; i < finalTokenTransaction.tokenOutputs.length; i++) {
    final finalOutput = finalTokenTransaction.tokenOutputs.elementAtOrNull(i);
    final partialOutput = partialTokenTransaction.tokenOutputs.elementAtOrNull(
      i,
    );

    if (finalOutput == null) {
      throw SparkError("Token output missing in final transaction", {
        "outputIndex": i,
        "value": finalOutput,
      });
    }

    if (partialOutput == null) {
      throw SparkError("Token output missing in partial transaction", {
        "outputIndex": i,
        "value": partialOutput,
      });
    }

    if (!_areByteArraysEqual(
      finalOutput.ownerPublicKey,
      partialOutput.ownerPublicKey,
    )) {
      throw SparkError("Owner public key mismatch in token output", {
        "outputIndex": i,
        "value": finalOutput.ownerPublicKey.toString(),
        "expected": partialOutput.ownerPublicKey.toString(),
      });
    }

    // In Dart, we check presence with hasField() methods
    if (finalOutput.hasTokenPublicKey() && partialOutput.hasTokenPublicKey()) {
      if (!_areByteArraysEqual(
        finalOutput.tokenPublicKey,
        partialOutput.tokenPublicKey,
      )) {
        throw SparkError("Token public key mismatch in token output", {
          "outputIndex": i,
          "value": finalOutput.tokenPublicKey.toString(),
          "expected": partialOutput.tokenPublicKey.toString(),
        });
      }
    }

    if (!_areByteArraysEqual(
      finalOutput.tokenAmount,
      partialOutput.tokenAmount,
    )) {
      throw SparkError("Token amount mismatch in token output", {
        "outputIndex": i,
        "value": finalOutput.tokenAmount.toString(),
        "expected": partialOutput.tokenAmount.toString(),
      });
    }

    if (finalOutput.hasWithdrawBondSats()) {
      if (finalOutput.withdrawBondSats.toInt() != expectedWithdrawBondSats) {
        throw SparkError("Withdraw bond sats mismatch in token output", {
          "outputIndex": i,
          "value": finalOutput.withdrawBondSats,
          "expected": expectedWithdrawBondSats,
        });
      }
    }

    if (finalOutput.hasWithdrawRelativeBlockLocktime()) {
      if (finalOutput.withdrawRelativeBlockLocktime.toInt() !=
          expectedWithdrawRelativeBlockLocktime) {
        throw SparkError(
          "Withdraw relative block locktime mismatch in token output",
          {
            "outputIndex": i,
            "value": finalOutput.withdrawRelativeBlockLocktime,
            "expected": expectedWithdrawRelativeBlockLocktime,
          },
        );
      }
    }
  }

  if (threshold != expectedThreshold) {
    throw SparkError(
      "Threshold mismatch: expected $expectedThreshold but got $threshold",
      {"field": "threshold", "value": threshold, "expected": expectedThreshold},
    );
  }

  if (ownerIdentifiers.length != signingOperators.keys.length) {
    throw SparkError(
      "Keyshare operator count (${ownerIdentifiers.length}) does not match signing operator count (${signingOperators.keys.length})",
      {
        "keyshareInfo": ownerIdentifiers.length,
        "signingOperators": signingOperators.keys.length,
      },
    );
  }

  if (_hasDuplicates(ownerIdentifiers)) {
    throw SparkError("Duplicate ownerIdentifiers found in keyshareInfo", {
      "keyshareInfo": ownerIdentifiers,
    });
  }

  for (final identifier in ownerIdentifiers) {
    if (signingOperators[identifier] == null) {
      throw SparkError(
        "Keyshare operator $identifier not found in signing operator list",
        {
          "keyshareInfo": identifier,
          "signingOperators": signingOperators.keys.toList(),
        },
      );
    }
  }

  // Protobuf Timestamp comparison
  if (finalTokenTransaction.hasClientCreatedTimestamp() &&
      partialTokenTransaction.hasClientCreatedTimestamp()) {
    final finalTs = finalTokenTransaction.clientCreatedTimestamp
        .toDateTime()
        .millisecondsSinceEpoch;
    final partialTs = partialTokenTransaction.clientCreatedTimestamp
        .toDateTime()
        .millisecondsSinceEpoch;

    if (finalTs != partialTs) {
      throw SparkError("Client created timestamp mismatch", {
        "value": finalTokenTransaction.clientCreatedTimestamp.toString(),
        "expected": partialTokenTransaction.clientCreatedTimestamp.toString(),
      });
    }
  }
}
