// lib/services/wallet_config.dart

import '../graphql/client.dart'; // MayHaveSspClientOptions, SspClientOptions
// SparkWalletEvents
import '../utils/network.dart'; // NetworkType, Network

const _sspIdentityPublicKeys = {
  Network.local:
      "028c094a432d46a0ac95349d792c2e3730bd60c29188db716f56a99e39b95338b4",
  Network.regtest:
      "022bf283544b16c0622daecb79422007d167eca6ce9f0c98c0c49833b1f7170bfe",
  Network.mainnet:
      "023e33e2920326f64ea31058d44777442d97d7d5cbfcf54e3060bc1695e5261c93",
};

class _UrlConfig {
  static const localSsp = "http://127.0.0.1:5000";
  static const localElectrs = "http://127.0.0.1:30000";

  static const regtestSsp = "https://api.lightspark.com";
  static const regtestElectrs =
      "https://regtest-mempool.us-west-2.sparkinfra.net/api";

  static const mainnetSsp = "https://api.lightspark.com";
  static const mainnetElectrs = "https://mempool.space/api";
}

const electrsCredentials = {
  "username": "spark-sdk",
  "password": "mCMk1JqlBNtetUNy",
};

// Toggle these based on your specific Dart testing setup if needed.
const bool isHermeticTest = bool.fromEnvironment(
  'IS_HERMETIC_TEST',
  defaultValue: false,
);
const bool isBare = bool.fromEnvironment('IS_BARE', defaultValue: false);

String getElectrsUrl(Network network) {
  switch (network) {
    case Network.local:
      return isHermeticTest
          ? "http://mempool.minikube.local/api"
          : _UrlConfig.localElectrs;
    case Network.regtest:
      return _UrlConfig.regtestElectrs;
    case Network.mainnet:
      return _UrlConfig.mainnetElectrs;
    default:
      return _UrlConfig.localElectrs;
  }
}

String getSspIdentityPublicKey(Network network) {
  return _sspIdentityPublicKeys[network] ??
      _sspIdentityPublicKeys[Network.local]!;
}

String getSspUrl(Network network) {
  switch (network) {
    case Network.local:
      return isHermeticTest ? "http://app.minikube.local" : _UrlConfig.localSsp;
    case Network.regtest:
      return _UrlConfig.regtestSsp;
    case Network.mainnet:
      return _UrlConfig.mainnetSsp;
    default:
      return _UrlConfig.localSsp;
  }
}

String? getSspSchemaEndpoint(Network network) {
  switch (network) {
    case Network.local:
      return "graphql/spark/rc";
    default:
      return null;
  }
}

class SigningOperator {
  final int id;
  final String identifier;
  final String address;
  final String identityPublicKey;

  const SigningOperator({
    required this.id,
    required this.identifier,
    required this.address,
    required this.identityPublicKey,
  });
}

class ConsoleOptions {
  final bool? otel;

  const ConsoleOptions({this.otel});

  ConsoleOptions copyWith({bool? otel}) {
    return ConsoleOptions(otel: otel ?? this.otel);
  }

  ConsoleOptions clone() {
    return copyWith();
  }
}

class OptimizationOptions {
  final bool? auto;
  final int? multiplicity;
  const OptimizationOptions({this.auto, this.multiplicity});
}

class TokenOptimizationOptions {
  final bool? enabled;
  final int? intervalMs;
  final int? minOutputsThreshold;
  const TokenOptimizationOptions({
    this.enabled,
    this.intervalMs,
    this.minOutputsThreshold,
  });
}

class ConfigOptions implements MayHaveSspClientOptions {
  final bool? log;
  final Network? network;
  final Map<String, SigningOperator>? signingOperators;
  final String? coordinatorIdentifier;
  final String? frostSignerAddress;
  final int? threshold;
  final String? tokenSignatures; // "ECDSA" or "SCHNORR"
  final int? tokenValidityDurationSeconds;
  final String? electrsUrl;

  @override
  final SspClientOptions? sspClientOptions;

  final int? expectedWithdrawBondSats;
  final int? expectedWithdrawRelativeBlockLocktime;
  final bool? signerWithPreExistingKeys;
  final ConsoleOptions? console;

  final Map<String, Function>? events;

  final OptimizationOptions? optimizationOptions;
  final TokenOptimizationOptions? tokenOptimizationOptions;
  final int? tokenOutputLockExpiryMs;
  final String? tokenTransactionVersion; // "V2" or "V3"
  final bool? useTokenPrimitivesBindings;
  final bool? isReadOnly;

  const ConfigOptions({
    this.log,
    this.network,
    this.signingOperators,
    this.coordinatorIdentifier,
    this.frostSignerAddress,
    this.threshold,
    this.tokenSignatures,
    this.tokenValidityDurationSeconds,
    this.electrsUrl,
    this.sspClientOptions,
    this.expectedWithdrawBondSats,
    this.expectedWithdrawRelativeBlockLocktime,
    this.signerWithPreExistingKeys,
    this.console,
    this.events,
    this.optimizationOptions,
    this.tokenOptimizationOptions,
    this.tokenOutputLockExpiryMs,
    this.tokenTransactionVersion,
    this.useTokenPrimitivesBindings,
    this.isReadOnly = true,
  });

  ConfigOptions copyWith(ConfigOptions other) {
    return ConfigOptions(
      log: other.log ?? log,
      network: other.network ?? network,
      signingOperators: other.signingOperators ?? signingOperators,
      coordinatorIdentifier:
          other.coordinatorIdentifier ?? coordinatorIdentifier,
      frostSignerAddress: other.frostSignerAddress ?? frostSignerAddress,
      threshold: other.threshold ?? threshold,
      tokenSignatures: other.tokenSignatures ?? tokenSignatures,
      tokenValidityDurationSeconds:
          other.tokenValidityDurationSeconds ?? tokenValidityDurationSeconds,
      electrsUrl: other.electrsUrl ?? electrsUrl,
      sspClientOptions: other.sspClientOptions ?? sspClientOptions,
      expectedWithdrawBondSats:
          other.expectedWithdrawBondSats ?? expectedWithdrawBondSats,
      expectedWithdrawRelativeBlockLocktime:
          other.expectedWithdrawRelativeBlockLocktime ??
          expectedWithdrawRelativeBlockLocktime,
      signerWithPreExistingKeys:
          other.signerWithPreExistingKeys ?? signerWithPreExistingKeys,
      console: other.console ?? console,
      events: other.events ?? events,
      optimizationOptions: other.optimizationOptions ?? optimizationOptions,
      tokenOptimizationOptions:
          other.tokenOptimizationOptions ?? tokenOptimizationOptions,
      tokenOutputLockExpiryMs:
          other.tokenOutputLockExpiryMs ?? tokenOutputLockExpiryMs,
      tokenTransactionVersion:
          other.tokenTransactionVersion ?? tokenTransactionVersion,
      useTokenPrimitivesBindings:
          other.useTokenPrimitivesBindings ?? useTokenPrimitivesBindings,
      isReadOnly: other.isReadOnly ?? isReadOnly,
    );
  }

  ConfigOptions merge(ConfigOptions? other) {
    if (other == null) return this;
    return copyWith(other);
  }
}

const _prodPubkeys = [
  "03dfbdff4b6332c220f8fa2ba8ed496c698ceada563fa01b67d9983bfc5c95e763",
  "03e625e9768651c9be268e287245cc33f96a68ce9141b0b4769205db027ee8ed77",
  "022eda13465a59205413086130a65dc0ed1b8f8e51937043161f8be0c369b1a410",
];

const _localOperatorPublicKeys = [
  "0322ca18fc489ae25418a0e768273c2c61cabb823edfb14feb891e9bec62016510",
  "0341727a6c41b168f07eb50865ab8c397a53c7eef628ac1020956b705e43b6cb27",
  "0305ab8d485cc752394de4981f8a5ae004f2becfea6f432c9a59d5022d8764f0a6",
  "0352aef4d49439dedd798ac4aef1e7ebef95f569545b647a25338398c1247ffdea",
  "02c05c88cc8fc181b1ba30006df6a4b0597de6490e24514fbdd0266d2b9cd3d0ba",
];

String _getLocalFrostSignerAddress() {
  return isHermeticTest ? "localhost:9999" : "unix:///tmp/frost_0.sock";
}

ConfigOptions get _baseConfig => ConfigOptions(
  log: false,
  network: Network.local,
  coordinatorIdentifier:
      "0000000000000000000000000000000000000000000000000000000000000001",
  frostSignerAddress: _getLocalFrostSignerAddress(),
  threshold: 2,
  signingOperators: getLocalSigningOperators(),
  tokenSignatures: "SCHNORR",
  tokenValidityDurationSeconds: 180,
  electrsUrl: getElectrsUrl(Network.local),
  expectedWithdrawBondSats: 10000,
  expectedWithdrawRelativeBlockLocktime: 1000,
  sspClientOptions: SspClientOptions(
    baseUrl: getSspUrl(Network.local),
    identityPublicKey: getSspIdentityPublicKey(Network.local),
    schemaEndpoint: getSspSchemaEndpoint(Network.local),
  ),
  signerWithPreExistingKeys: false,
  console: const ConsoleOptions(otel: false),
  events: const {},
  optimizationOptions: const OptimizationOptions(auto: true, multiplicity: 1),
  tokenOptimizationOptions: const TokenOptimizationOptions(
    enabled: true,
    intervalMs: 300000, // 5 minutes
    minOutputsThreshold: 50,
  ),
  tokenOutputLockExpiryMs: 20000, // 20 seconds
  tokenTransactionVersion: "V3",
  useTokenPrimitivesBindings: false,
);

ConfigOptions get _localWalletConfig =>
    _baseConfig.copyWith(ConfigOptions(threshold: getLocalSigningThreshold()));

ConfigOptions get _localWalletConfigSchnorr => _localWalletConfig.copyWith(
  ConfigOptions(threshold: getLocalSigningThreshold()),
);

ConfigOptions get _localWalletConfigEcdsa => _localWalletConfig.copyWith(
  ConfigOptions(
    tokenSignatures: "ECDSA",
    threshold: getLocalSigningThreshold(),
  ),
);

ConfigOptions get _regtestWalletConfig => _baseConfig.copyWith(
  ConfigOptions(
    network: Network.regtest,
    signingOperators: getSigningOperators(),
    electrsUrl: getElectrsUrl(Network.regtest),
    expectedWithdrawBondSats: 10000,
    expectedWithdrawRelativeBlockLocktime: 1000,
    sspClientOptions: SspClientOptions(
      baseUrl: getSspUrl(Network.regtest),
      identityPublicKey: getSspIdentityPublicKey(Network.regtest),
    ),
  ),
);

ConfigOptions get _mainnetWalletConfig => _baseConfig.copyWith(
  ConfigOptions(
    network: Network.mainnet,
    signingOperators: getSigningOperators(),
    electrsUrl: getElectrsUrl(Network.mainnet),
    expectedWithdrawBondSats: 10000,
    expectedWithdrawRelativeBlockLocktime: 1000,
    sspClientOptions: SspClientOptions(
      baseUrl: getSspUrl(Network.mainnet),
      identityPublicKey: getSspIdentityPublicKey(Network.mainnet),
    ),
  ),
);

class WalletConfig {
  static ConfigOptions get local => _localWalletConfig;
  static ConfigOptions get localSchnorr => _localWalletConfigSchnorr;
  static ConfigOptions get localEcdsa => _localWalletConfigEcdsa;
  static ConfigOptions get regtest => _regtestWalletConfig;
  static ConfigOptions get mainnet => _mainnetWalletConfig;
}

Map<String, SigningOperator> createLocalSigningOperators(
  List<String> addresses,
) {
  if (addresses.length > _localOperatorPublicKeys.length) {
    throw Exception(
      "Expected at most ${_localOperatorPublicKeys.length} local signing operators, got ${addresses.length}",
    );
  }

  final operators = <String, SigningOperator>{};

  for (var i = 0; i < addresses.length; i++) {
    final identifier = (i + 1).toString().padLeft(64, '0');
    operators[identifier] = SigningOperator(
      id: i,
      identifier: identifier,
      address: addresses[i],
      identityPublicKey: _localOperatorPublicKeys[i],
    );
  }

  return operators;
}

Map<String, SigningOperator> getSigningOperators() {
  return {
    "0000000000000000000000000000000000000000000000000000000000000001":
        SigningOperator(
          id: 0,
          identifier:
              "0000000000000000000000000000000000000000000000000000000000000001",
          address: "https://0.spark.lightspark.com",
          identityPublicKey: _prodPubkeys[0],
        ),
    "0000000000000000000000000000000000000000000000000000000000000002":
        SigningOperator(
          id: 1,
          identifier:
              "0000000000000000000000000000000000000000000000000000000000000002",
          address: "https://spark-operator.breez.technology",
          identityPublicKey: _prodPubkeys[1],
        ),
    "0000000000000000000000000000000000000000000000000000000000000003":
        SigningOperator(
          id: 2,
          identifier:
              "0000000000000000000000000000000000000000000000000000000000000003",
          address: "https://2.spark.flashnet.xyz",
          identityPublicKey: _prodPubkeys[2],
        ),
  };
}

Map<String, SigningOperator> getLocalSigningOperators() {
  final numOperators = int.fromEnvironment(
    'NUM_SPARK_OPERATORS',
    defaultValue: 3,
  );
  final hermeticDomain = isBare
      ? "spark-web.minikube.local"
      : "spark.minikube.local";

  final addresses = List.generate(numOperators, (i) {
    return isHermeticTest
        ? "https://$i.$hermeticDomain"
        : "https://localhost:${8535 + i}";
  });

  return createLocalSigningOperators(addresses);
}

int getLocalSigningThreshold([Map<String, SigningOperator>? signingOperators]) {
  final operators = signingOperators ?? getLocalSigningOperators();
  final numOperators = operators.length;
  return ((numOperators + 2) / 2).floor();
}

Network normalizeNetworkType(
  String? value, [
  Network defaultNetwork = Network.regtest,
]) {
  final normalizedValue = value?.toUpperCase();
  switch (normalizedValue) {
    case "LOCAL":
      return Network.local;
    case "MAINNET":
      return Network.mainnet;
    case "REGTEST":
      return Network.regtest;
    // Add other cases like "SIGNET" or "TESTNET" here if they exist in your Dart Network enum
    default:
      return defaultNetwork;
  }
}

ConfigOptions mergeConfigOptionsForNetwork(
  Network network, [
  ConfigOptions? configOverride,
]) {
  if (configOverride == null) {
    return ConfigOptions(network: network);
  }

  if (configOverride.network != null && configOverride.network != network) {
    throw Exception(
      "Config file network ${configOverride.network} does not match $network",
    );
  }

  return configOverride.copyWith(ConfigOptions(network: network));
}

Map<String, SigningOperator> rewriteSigningOperatorAddresses(
  Map<String, SigningOperator> signingOperators,
  String Function(SigningOperator) rewriteAddress,
) {
  final sortedOperators = signingOperators.values.toList()
    ..sort((left, right) => left.id.compareTo(right.id));

  return Map.fromEntries(
    sortedOperators.map((operator) {
      return MapEntry(
        operator.identifier,
        SigningOperator(
          id: operator.id,
          identifier: operator.identifier,
          address: rewriteAddress(operator),
          identityPublicKey: operator.identityPublicKey,
        ),
      );
    }),
  );
}
