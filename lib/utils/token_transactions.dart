// lib/utils/token_transactions.dart

import 'dart:typed_data';
import 'package:collection/collection.dart'; // For elementAtOrNull and entries.find
import '../src/proto/spark_token.pb.dart';
import '../spark_wallet/types.dart';
import 'token_identifier.dart';

/// Helper to convert big-endian bytes to a BigInt.
/// Equivalent to bytesToNumberBE in @noble/curves.
BigInt _bytesToBigIntBE(Uint8List bytes) {
  BigInt result = BigInt.zero;
  for (int byte in bytes) {
    result = (result << 8) | BigInt.from(byte);
  }
  return result;
}

/// Helper for byte array equality comparison.
bool _equalBytes(Uint8List a, Uint8List b) {
  if (a.length != b.length) return false;
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

BigInt sumTokenOutputs(List<OutputWithPreviousTransactionData> outputs) {
  try {
    return outputs.fold(BigInt.zero, (sum, output) {
      // Accessing sub-fields safely via elementAtOrNull or null-checks if needed.
      // Protobuf generated messages in Dart usually have hasField() methods.
      if (!output.hasOutput() || output.output.tokenAmount.isEmpty) {
        return sum;
      }
      return sum +
          _bytesToBigIntBE(Uint8List.fromList(output.output.tokenAmount));
    });
  } catch (error) {
    return BigInt.zero;
  }
}

class TokenIdentifierBalance {
  final BigInt ownedBalance;
  final BigInt availableToSendBalance;

  const TokenIdentifierBalance({
    required this.ownedBalance,
    required this.availableToSendBalance,
  });
}

TokenIdentifierBalance filterTokenBalanceForTokenIdentifier(
  TokenBalanceMap? tokenBalances,
  String tokenIdentifier, // Bech32mTokenIdentifier is a String in Dart
) {
  if (tokenBalances == null) {
    return TokenIdentifierBalance(
      ownedBalance: BigInt.zero,
      availableToSendBalance: BigInt.zero,
    );
  }

  final tokenIdentifierBytes = decodeBech32mTokenIdentifier(
    tokenIdentifier,
  ).tokenIdentifier;

  // tokenBalances is assumed to be a Map<String, TokenBalanceInfo> (or similar)
  final entry = tokenBalances.entries.firstWhereOrNull(
    (e) => _equalBytes(
      Uint8List.fromList(e.value.tokenMetadata.rawTokenIdentifier),
      Uint8List.fromList(tokenIdentifierBytes),
    ),
  );

  if (entry == null) {
    return TokenIdentifierBalance(
      ownedBalance: BigInt.zero,
      availableToSendBalance: BigInt.zero,
    );
  }

  return TokenIdentifierBalance(
    ownedBalance: entry.value.ownedBalance,
    availableToSendBalance: entry.value.availableToSendBalance,
  );
}
