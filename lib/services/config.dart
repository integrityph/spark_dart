// lib/services/config.dart

import '../graphql/client.dart'; // HasSspClientOptions, SspClientOptions
import '../graphql/objects/bitcoin_network.dart'; // BitcoinNetwork
import '../signer/signer.dart'; // DefaultSparkSigner, SparkSigner
import '../utils/network.dart'; // Network, NetworkToProto, NetworkType
import 'wallet_config.dart'; // ConfigOptions, WalletConfig, SigningOperator, ConsoleOptions, OptimizationOptions, TokenOptimizationOptions
import '../errors/spark_error.dart'; // SparkError
// import '../spark_wallet/types.dart'; // SparkWalletEvents

class WalletConfigService implements HasSspClientOptions {
  final ConfigOptions _config;
  final SparkSigner signer;

  bool get isReadOnly => _config.isReadOnly ?? false;

  @override
  final SspClientOptions sspClientOptions;

  // Private constructor for final initialization
  WalletConfigService._internal(
    this._config,
    this.signer,
    this.sspClientOptions,
  );

  factory WalletConfigService({
    ConfigOptions? options,
    required SparkSigner signer,
  }) {
    final network = options?.network ?? Network.mainnet;

    final defaultConfig = _getDefaultConfig(network);

    // Using a hypothetical merge/copyWith method to mimic TS {...default, ...options}
    // You will need to implement this in your ConfigOptions class.
    final mergedConfig = defaultConfig.merge(options);

    return WalletConfigService._internal(
      mergedConfig,
      signer,
      mergedConfig.sspClientOptions!,
    );
  }

  static Network _parseNetwork(String network) {
    try {
      return Network.values.byName(network);
    } catch (_) {
      // Fallback if network string doesn't exactly match the enum
      return Network.regtest;
    }
  }

  static ConfigOptions _getDefaultConfig(Network network) {
    switch (network) {
      case Network.mainnet:
        return WalletConfig.mainnet;
      case Network.regtest:
        return WalletConfig.regtest;
      default:
        return WalletConfig.local;
    }
  }

  String getCoordinatorAddress() {
    final coordinator =
        _config.signingOperators?[_config.coordinatorIdentifier];
    if (coordinator == null) {
      throw SparkError("coordinator not found in signing operators");
    }
    return coordinator.address;
  }

  Map<String, SigningOperator> getSigningOperators() {
    return Map.unmodifiable(_config.signingOperators ?? {});
  }

  int getThreshold() {
    return _config.threshold!;
  }

  String getCoordinatorIdentifier() {
    return _config.coordinatorIdentifier!;
  }

  int getExpectedWithdrawBondSats() {
    return _config.expectedWithdrawBondSats!;
  }

  int getExpectedWithdrawRelativeBlockLocktime() {
    return _config.expectedWithdrawRelativeBlockLocktime!;
  }

  BitcoinNetwork getSspNetwork() {
    if (_config.network?.value == "mainnet") {
      return BitcoinNetwork.mainnet;
    } else if (_config.network?.value == "regtest") {
      return BitcoinNetwork.regtest;
    } else if (_config.network?.value == "testnet") {
      return BitcoinNetwork.testnet;
    } else if (_config.network?.value == "signet") {
      return BitcoinNetwork.signet;
    }
    return BitcoinNetwork.futureValue;
  }

  Network getNetwork() {
    return _parseNetwork(_config.network!.name);
  }

  String getNetworkType() {
    return _config.network!.name;
  }

  int getNetworkProto() {
    final networkEnum = _parseNetwork(_config.network!.name);
    // Assumes NetworkToProto is a Map<Network, int>
    return networkToProto[networkEnum]!.value;
  }

  String getTokenSignatures() {
    return _config.tokenSignatures!; // "ECDSA" | "SCHNORR"
  }

  int getTokenValidityDurationSeconds() {
    return _config.tokenValidityDurationSeconds!;
  }

  String getElectrsUrl() {
    return _config.electrsUrl!;
  }

  String getSspBaseUrl() {
    return _config.sspClientOptions!.baseUrl;
  }

  String getSspIdentityPublicKey() {
    return _config.sspClientOptions!.identityPublicKey;
  }

  ConsoleOptions getConsoleOptions() {
    // Mimicking the TS object spread {...this.config.console} by returning a new instance/copy
    // Assuming ConsoleOptions has a copyWith or clone method
    return _config.console!.clone();
  }

  bool getLog() {
    return _config.log ?? false;
  }

  Map<String, Function> getEvents() {
    return Map.from(_config.events ?? {});
  }

  OptimizationOptions getOptimizationOptions() {
    return _config.optimizationOptions!;
  }

  TokenOptimizationOptions getTokenOptimizationOptions() {
    return _config.tokenOptimizationOptions!;
  }

  int getTokenOutputLockExpiryMs() {
    return _config.tokenOutputLockExpiryMs!;
  }

  bool getUseTokenPrimitivesBindings() {
    return _config.useTokenPrimitivesBindings ?? false;
  }

  String getTokenTransactionVersion() {
    return _config.tokenTransactionVersion!; // "V2" | "V3"
  }
}
