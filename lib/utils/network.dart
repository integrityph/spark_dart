import 'package:bech32/bech32.dart';
// Assuming a Bitcoin library equivalent to @scure/btc-signer
// import 'package:bitcoin_base/bitcoin_base.dart' as btc;

import '../src/proto/spark.pb.dart' as spark_proto;
import '../graphql/objects/bitcoin_network.dart';
import '../errors/spark_error.dart';

enum Network {
  mainnet,
  testnet,
  signet,
  regtest,
  local;

  /// Returns the uppercase string value of the enum (e.g., 'MAINNET')
  String get value => name.toUpperCase();
}

const Map<Network, spark_proto.Network> networkToProto = {
  Network.mainnet: spark_proto.Network.MAINNET,
  Network.testnet: spark_proto.Network.TESTNET,
  Network.signet: spark_proto.Network.SIGNET,
  Network.regtest: spark_proto.Network.REGTEST,
  Network.local: spark_proto.Network.REGTEST,
};

Network? protoToNetwork(spark_proto.Network protoNetwork) {
  switch (protoNetwork) {
    case spark_proto.Network.MAINNET:
      return Network.mainnet;
    case spark_proto.Network.TESTNET:
      return Network.testnet;
    case spark_proto.Network.SIGNET:
      return Network.signet;
    case spark_proto.Network.REGTEST:
      return Network.regtest;
    default:
      return null;
  }
}

/// Represents the internal Bitcoin library network configuration.
class BtcNetworkConfig {
  final String bech32;
  final String messagePrefix;
  // Add other required fields based on your crypto library (wif, pubKeyHash, etc.)

  const BtcNetworkConfig({required this.bech32, required this.messagePrefix});
}

const mainnetConfig = BtcNetworkConfig(
  bech32: "bc",
  messagePrefix: "\x18Bitcoin Signed Message:\n",
);
const testnetConfig = BtcNetworkConfig(
  bech32: "tb",
  messagePrefix: "\x18Bitcoin Signed Message:\n",
);
const regtestConfig = BtcNetworkConfig(
  bech32: "bcrt",
  messagePrefix: "\x18Bitcoin Signed Message:\n",
);

const Map<Network, BtcNetworkConfig> networkConfigMap = {
  Network.mainnet: mainnetConfig,
  Network.testnet: testnetConfig,
  Network.signet: testnetConfig,
  Network.regtest: regtestConfig,
  Network.local: regtestConfig,
};

BtcNetworkConfig getNetwork(Network network) => networkConfigMap[network]!;

/// Utility function to determine the network from a Bitcoin address.
///
/// @param {String} address - The Bitcoin address
/// @returns {BitcoinNetwork?} The detected network or null if not detected
BitcoinNetwork? getNetworkFromAddress(String address) {
  try {
    const codec = Bech32Codec();
    // In Dart's bech32 package, decode handles the hrp (prefix)
    // Note: If you need specific bech32m support, ensure your codec supports it.
    final decoded = codec.decode(address, 1024); // max length constraint

    if (decoded.hrp == "bc") {
      return BitcoinNetwork.mainnet;
    } else if (decoded.hrp == "bcrt") {
      return BitcoinNetwork.regtest;
    } else if (decoded.hrp == "tb") {
      return BitcoinNetwork.testnet;
    }
  } catch (err) {
    throw SparkValidationError(
      "Invalid Bitcoin address",
      context: {
        'field': "address",
        'value': address,
        'expected': "Valid Bech32 address with prefix 'bc', 'tb', or 'bcrt'",
        'error': err.toString(),
      },
    );
  }
  return null;
}

/// Utility function to get the network enum value from a string.
///
/// @param {String?} network - The Bitcoin network string
/// @returns {Network} The enum value matching the string
Network getNetworkFromString(String? network) {
  final net = (network ?? "REGTEST").toUpperCase();
  switch (net) {
    case "MAINNET":
      return Network.mainnet;
    case "TESTNET":
      return Network.testnet;
    case "SIGNET":
      return Network.signet;
    case "LOCAL":
      return Network.local;
    default:
      return Network.regtest;
  }
}
