enum BitcoinNetwork {
  /// This is an enum value that represents values that could be added in the future.
  /// Clients should support unknown values as more of them could be added without notice.
  futureValue("FUTURE_VALUE"),

  /// The production version of the Bitcoin Blockchain.
  mainnet("MAINNET"),

  /// A test version of the Bitcoin Blockchain, maintained by Lightspark.
  regtest("REGTEST"),

  /// A test version of the Bitcoin Blockchain, maintained by a centralized organization.
  /// Not in use at Lightspark.
  signet("SIGNET"),

  /// A test version of the Bitcoin Blockchain, publicly available.
  testnet("TESTNET");

  final String value;
  const BitcoinNetwork(this.value);

  @override
  String toString() => value;

  static BitcoinNetwork fromString(String network) {
    return BitcoinNetwork.values.firstWhere(
      (e) => e.value == network.toUpperCase(),
      orElse: () => BitcoinNetwork.futureValue,
    );
  }
}
