import 'dart:typed_data';
import 'package:bech32m_i/bech32m_i.dart';

import '../utils/network.dart'; // Adjust for your NetworkType enum
import '../errors/spark_error.dart'; // Adjust for SparkValidationError

const _bech32mTokenIdentifierNetworkPrefix = <Network, String>{
  Network.mainnet: "btkn",
  Network.regtest: "btknrt",
  Network.testnet: "btknt",
  Network.signet: "btkns",
  Network.local: "btknl",
};

class Bech32mTokenIdentifierData {
  final Uint8List tokenIdentifier;
  final Network network;

  Bech32mTokenIdentifierData({
    required this.tokenIdentifier,
    required this.network,
  });
}

extension type Bech32mTokenIdentifier(String value) implements String {
  // You can even add a factory constructor to enforce validation at runtime!
  factory Bech32mTokenIdentifier.validated(String value) {
    if (!value.contains('1')) {
      throw ArgumentError('Invalid token identifier: missing separator');
    }
    return Bech32mTokenIdentifier(value);
  }
}

String encodeBech32mTokenIdentifier(Bech32mTokenIdentifierData payload) {
  try {
    final prefix = _bech32mTokenIdentifierNetworkPrefix[payload.network];

    if (prefix == null) {
      throw SparkValidationError(
        "Network is required to encode bech32m encoded token identifier",
        context: {"field": "network", "value": payload.network.toString()},
      );
    }

    // Convert standard 8-bit bytes into 5-bit Bech32 words
    final words = _convertBits(payload.tokenIdentifier.toList(), 8, 5, true);

    const codec = Bech32mCodec();
    final bech32Obj = Bech32m(prefix, words);

    // Pass 500 as the max length, matching the TS implementation
    return codec.encode(bech32Obj, 500);
  } catch (error) {
    throw SparkValidationError(
      "Failed to encode bech32m encoded token identifier",
      context: {
        "field": "tokenIdentifier",
        "value": payload.tokenIdentifier,
        "error": error.toString(),
      },
    );
  }
}

Bech32mTokenIdentifierData decodeBech32mTokenIdentifier(
  String bech32mTokenIdentifier, {
  Network? network,
}) {
  try {
    const codec = Bech32mCodec();
    final decoded = codec.decode(bech32mTokenIdentifier, 500);

    if (network != null &&
        decoded.hrp != _bech32mTokenIdentifierNetworkPrefix[network]) {
      throw SparkValidationError(
        "Invalid bech32m encoded token identifier prefix",
        context: {
          "field": "bech32mTokenIdentifier",
          "value": bech32mTokenIdentifier,
          "expected":
              "prefix='${_bech32mTokenIdentifierNetworkPrefix[network]}'",
        },
      );
    }

    // Convert 5-bit Bech32 words back into standard 8-bit bytes
    final tokenIdentifierBytes = _convertBits(decoded.data, 5, 8, false);

    return Bech32mTokenIdentifierData(
      tokenIdentifier: Uint8List.fromList(tokenIdentifierBytes),
      network:
          network ??
          getNetworkFromBech32mTokenIdentifier(bech32mTokenIdentifier),
    );
  } catch (error) {
    if (error is SparkValidationError) {
      rethrow;
    }
    throw SparkValidationError(
      "Failed to decode bech32m encoded token identifier",
      context: {
        "field": "bech32mTokenIdentifier",
        "value": bech32mTokenIdentifier,
        "error": error.toString(),
      },
    );
  }
}

Network getNetworkFromBech32mTokenIdentifier(String bech32mTokenIdentifier) {
  // Using lastIndexOf to strictly comply with BIP173 which defines
  // the separator as the *last* '1' in the string.
  final separatorIndex = bech32mTokenIdentifier.lastIndexOf("1");
  if (separatorIndex == -1) {
    throw SparkValidationError(
      "Invalid bech32m token identifier: no separator found",
      context: {
        "field": "bech32mTokenIdentifier",
        "value": bech32mTokenIdentifier,
      },
    );
  }

  final prefix = bech32mTokenIdentifier.substring(0, separatorIndex);

  for (final entry in _bech32mTokenIdentifierNetworkPrefix.entries) {
    if (entry.value == prefix) {
      return entry.key;
    }
  }

  throw SparkValidationError(
    "Unknown bech32m token identifier prefix",
    context: {
      "field": "bech32mTokenIdentifier",
      "value": bech32mTokenIdentifier,
    },
  );
}

/// Standard algorithm to group bits from one density to another.
/// Used to convert 8-bit bytes to 5-bit Bech32 words and vice-versa.
List<int> _convertBits(List<int> data, int fromBits, int toBits, bool pad) {
  var acc = 0;
  var bits = 0;
  final ret = <int>[];
  final maxv = (1 << toBits) - 1;

  for (final value in data) {
    if (value < 0 || (value >> fromBits) != 0) {
      throw FormatException('Invalid value: $value');
    }
    acc = (acc << fromBits) | value;
    bits += fromBits;
    while (bits >= toBits) {
      bits -= toBits;
      ret.add((acc >> bits) & maxv);
    }
  }

  if (pad) {
    if (bits > 0) {
      ret.add((acc << (toBits - bits)) & maxv);
    }
  } else if (bits >= fromBits || ((acc << (toBits - bits)) & maxv) != 0) {
    throw FormatException('Invalid padding');
  }

  return ret;
}
