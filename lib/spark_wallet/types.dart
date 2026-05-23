import 'dart:typed_data';
import '../graphql/objects/coop_exit_fee_quote.dart';
import '../graphql/objects/exit_speed.dart';
import '../graphql/objects/lightning_send_request.dart';
import '../src/proto/spark_token.pb.dart'; // TokenMetadata, OutputWithPreviousTransactionData
import '../services/wallet_config.dart'; // ConfigOptions
import '../signer/signer.dart'; // SparkSigner
import '../signer/types.dart'; // KeyDerivation
// import '../types/index.dart'; // CoopExitFeeQuote, ExitSpeed, WalletTransfer
import '../types/sdk_types.dart';
import '../utils/address.dart'; // SparkAddressFormat
import '../utils/idempotency.dart'; // IdempotencyOptions
import '../utils/token_identifier.dart'; // Bech32mTokenIdentifier

// Export re-directed from output-manager
export '../services/tokens/output_manager.dart' show TokenOutputLock;

// ===========================================================================
// CYCLIC IMPORT FIX
// ===========================================================================

/// The base contract for SparkWallet to prevent circular dependencies
/// between the types file and the main implementation.
abstract class ISparkWallet {
  // Add common high-level getters/methods needed by types or error handlers here.
  // e.g., String get identityPublicKey;
}

// ===========================================================================
// TYPE ALIASES & MAPS
// ===========================================================================

typedef RawTokenIdentifierHex = String;
typedef TokenMetadataMap = Map<Bech32mTokenIdentifier, TokenMetadata>;
typedef TokenOutputsMap =
    Map<Bech32mTokenIdentifier, List<OutputWithPreviousTransactionData>>;

// ===========================================================================
// DATA CLASSES (Params & Responses)
// ===========================================================================

class WithdrawParams {
  final String onchainAddress;
  final ExitSpeed exitSpeed;

  @Deprecated('Use feeQuoteId and feeAmountSats instead')
  final CoopExitFeeQuote? feeQuote;

  final BigInt? amountSats;
  final String? feeQuoteId;
  final int? feeAmountSats;
  final bool? deductFeeFromWithdrawalAmount;

  WithdrawParams({
    required this.onchainAddress,
    required this.exitSpeed,
    this.feeQuote,
    this.amountSats,
    this.feeQuoteId,
    this.feeAmountSats,
    this.deductFeeFromWithdrawalAmount,
  });
}

class CreateLightningInvoiceParams {
  final BigInt amountSats;
  final String? memo;
  final int? expirySeconds;
  final bool? includeSparkAddress;
  final bool? includeSparkInvoice;
  final String? receiverIdentityPubkey;
  final String? descriptionHash;

  CreateLightningInvoiceParams({
    required this.amountSats,
    this.memo,
    this.expirySeconds,
    this.includeSparkAddress,
    this.includeSparkInvoice,
    this.receiverIdentityPubkey,
    this.descriptionHash,
  });
}

class CreateLightningHodlInvoiceParams {
  final BigInt amountSats;
  final String paymentHash;
  final String? memo;
  final int? expirySeconds;
  final bool? includeSparkAddress;
  final bool? includeSparkInvoice;
  final String? receiverIdentityPubkey;
  final String? descriptionHash;

  CreateLightningHodlInvoiceParams({
    required this.amountSats,
    required this.paymentHash,
    this.memo,
    this.expirySeconds,
    this.includeSparkAddress,
    this.includeSparkInvoice,
    this.receiverIdentityPubkey,
    this.descriptionHash,
  });
}

class PayLightningInvoiceParams extends IdempotencyOptions {
  final String invoice;
  final int maxFeeSats;
  final bool? preferSpark;
  final BigInt? amountSatsToSend;

  PayLightningInvoiceParams({
    required this.invoice,
    required this.maxFeeSats,
    this.preferSpark,
    this.amountSatsToSend,
    super.idempotencyKey,
  });
}

class TransferParams {
  final BigInt amountSats;
  final String receiverSparkAddress;

  TransferParams({
    required this.amountSats,
    required this.receiverSparkAddress,
  });
}

class TransferWithInvoiceParams {
  final BigInt amountSats;
  final Uint8List receiverIdentityPubkey;
  final SparkAddressFormat? sparkInvoice;

  TransferWithInvoiceParams({
    required this.amountSats,
    required this.receiverIdentityPubkey,
    this.sparkInvoice,
  });
}

// --- TransferWithInvoiceOutcome Union ---
sealed class TransferWithInvoiceOutcome {
  final TransferWithInvoiceParams param;
  const TransferWithInvoiceOutcome(this.param);
}

class TransferWithInvoiceSuccess extends TransferWithInvoiceOutcome {
  final WalletTransfer transfer;
  const TransferWithInvoiceSuccess({
    required this.transfer,
    required TransferWithInvoiceParams param,
  }) : super(param);
}

class TransferWithInvoiceFailure extends TransferWithInvoiceOutcome {
  final Exception error;
  const TransferWithInvoiceFailure({
    required this.error,
    required TransferWithInvoiceParams param,
  }) : super(param);
}
// ----------------------------------------

class InvalidInvoice {
  final SparkAddressFormat invoice;
  final Exception error;

  InvalidInvoice({required this.invoice, required this.error});
}

class FulfillSparkInvoiceResponse {
  // Using Dart 3 Records for exact structural typing of the TS inline objects
  final List<({SparkAddressFormat invoice, WalletTransfer transferResponse})>
  satsTransactionSuccess;
  final List<
    ({
      Bech32mTokenIdentifier tokenIdentifier,
      List<SparkAddressFormat> invoices,
      String txid,
    })
  >
  tokenTransactionSuccess;
  final List<({SparkAddressFormat invoice, Exception error})>
  satsTransactionErrors;
  final List<
    ({
      Bech32mTokenIdentifier tokenIdentifier,
      List<SparkAddressFormat> invoices,
      Exception error,
    })
  >
  tokenTransactionErrors;
  final List<InvalidInvoice> invalidInvoices;

  FulfillSparkInvoiceResponse({
    required this.satsTransactionSuccess,
    required this.tokenTransactionSuccess,
    required this.satsTransactionErrors,
    required this.tokenTransactionErrors,
    required this.invalidInvoices,
  });
}

class TokenInvoice {
  final SparkAddressFormat invoice;
  final String identifierHex;
  final BigInt amount;

  TokenInvoice({
    required this.invoice,
    required this.identifierHex,
    required this.amount,
  });
}

class GroupSparkInvoicesResult {
  final List<TransferWithInvoiceParams> satsInvoices;
  final Map<String, List<TokenInvoice>> tokenInvoices;
  final List<InvalidInvoice> invalidInvoices;

  GroupSparkInvoicesResult({
    required this.satsInvoices,
    required this.tokenInvoices,
    required this.invalidInvoices,
  });
}

class DepositParams {
  final KeyDerivation keyDerivation;
  final Uint8List verifyingKey;
  final dynamic depositTx; // Type depends on your Bitcoin library Transaction
  final int vout;

  DepositParams({
    required this.keyDerivation,
    required this.verifyingKey,
    required this.depositTx,
    required this.vout,
  });
}

/// Token metadata containing essential information about a token.
class UserTokenMetadata {
  /// Raw binary token identifier
  final Uint8List rawTokenIdentifier;

  /// Public key of the token issuer
  final String tokenPublicKey;

  /// Human-readable name of the token
  final String tokenName;

  /// Short ticker symbol for the token
  final String tokenTicker;

  /// Number of decimal places for token amounts
  final int decimals;

  /// Maximum supply of tokens that can ever be minted
  final BigInt maxSupply;

  /// Extra metadata of the token
  final Uint8List? extraMetadata;

  UserTokenMetadata({
    required this.rawTokenIdentifier,
    required this.tokenPublicKey,
    required this.tokenName,
    required this.tokenTicker,
    required this.decimals,
    required this.maxSupply,
    this.extraMetadata,
  });
}

class TokenBalanceInfo {
  final BigInt ownedBalance;
  final BigInt availableToSendBalance;
  final UserTokenMetadata tokenMetadata;

  TokenBalanceInfo({
    required this.ownedBalance,
    required this.availableToSendBalance,
    required this.tokenMetadata,
  });
}

typedef TokenBalanceMap = Map<Bech32mTokenIdentifier, TokenBalanceInfo>;

class InitWalletResponse<T extends ISparkWallet> {
  final T wallet;
  final String? mnemonic;

  InitWalletResponse({required this.wallet, this.mnemonic});
}

class SparkWalletProps {
  final dynamic mnemonicOrSeed; // Accepts Uint8List or String
  List<({String path, Uint8List privateKey, Uint8List chainCode})>? keyset;
  final int? accountNumber;
  final SparkSigner? signer;
  final ConfigOptions? options;
  final bool encryptAndStoreInSE;
  

  SparkWalletProps({
    this.mnemonicOrSeed,
    this.accountNumber,
    this.signer,
    this.options,
    this.keyset,
    this.encryptAndStoreInSE=true,
  });
}

class HandlePublicMethodErrorParams {
  final String? traceId;
  final ISparkWallet? wallet; // Safely references the interface

  HandlePublicMethodErrorParams({this.traceId, this.wallet});
}

class TransferReceiver {
  final String receiverSparkAddress;
  final int amountSats;

  TransferReceiver({
    required this.receiverSparkAddress,
    required this.amountSats,
  });
}

class TransferV2Params {
  final List<TransferReceiver> receivers;

  TransferV2Params({required this.receivers});
}

class CreateHTLCParams {
  final String receiverSparkAddress;
  final int amountSats;
  final String? preimage;
  final DateTime expiryTime;

  CreateHTLCParams({
    required this.receiverSparkAddress,
    required this.amountSats,
    this.preimage,
    required this.expiryTime,
  });
}

class LightningPaymentResponse {
  final LightningSendRequest? lightningSendRequest;
  final WalletTransfer? walletTransfer;

  const LightningPaymentResponse({this.lightningSendRequest, this.walletTransfer});
}

// ===========================================================================
// EVENTS
// ===========================================================================

enum SparkWalletEvent<T extends Function> {
  all<SparkAllEventsCallback>("*"),
  balanceUpdate<SparkBalanceUpdateCallback>("balance:update"),
  transferClaimed<SparkTransferClaimedCallback>("transfer:claimed"),
  depositConfirmed<SparkDepositConfirmedCallback>("deposit:confirmed"),
  streamConnected<SparkStreamConnectedCallback>("stream:connected"),
  streamDisconnected<SparkStreamDisconnectedCallback>("stream:disconnected"),
  streamReconnecting<SparkStreamReconnectingCallback>("stream:reconnecting"),
  streamHeartbeat<SparkStreamHeartbeatCallback>("stream:heartbeat"),
  tokenTransaction<SparkTokenTransactionCallback>("token:transaction");

  final String value;

  const SparkWalletEvent(this.value);

  static SparkWalletEvent<Function>? fromString(String stringValue) {
    for (final event in SparkWalletEvent.values) {
      if (event.value == stringValue) {
        return event;
      }
    }
    return null;
  }
}

// --- Event Signatures (Translating the TS SparkWalletEvents Interface) ---

/// Signature for [SparkWalletEvent.all]
typedef SparkAllEventsCallback = void Function(SparkWalletEvent event, List<dynamic> args);

class BalanceUpdateData {
  final BigInt available;
  final BigInt owned;
  final BigInt incoming;

  BalanceUpdateData({
    required this.available,
    required this.owned,
    required this.incoming,
  });
}

/// Emitted whenever the balance changes (deposits, transfers, swaps, claims).
typedef SparkBalanceUpdateCallback = void Function(BalanceUpdateData balance);

/// Emitted when an incoming transfer is successfully claimed.
typedef SparkTransferClaimedCallback =
    void Function(String transferId, BigInt updatedBalance);

/// Emitted when a deposit is marked as available.
typedef SparkDepositConfirmedCallback =
    void Function(String depositId, BigInt updatedBalance);

/// Emitted when the stream is connected
typedef SparkStreamConnectedCallback = void Function();

/// Emitted when the stream stops and will not retry again.
typedef SparkStreamDisconnectedCallback = void Function(String reason);

/// Emitted when attempting to reconnect the stream.
typedef SparkStreamReconnectingCallback =
    void Function(int attempt, int maxAttempts, int delayMs, String error);

/// Emitted when stream gets heartbeat from server
typedef SparkStreamHeartbeatCallback =
    void Function();

/// Emitted when attempting to reconnect the stream.
typedef SparkTokenTransactionCallback =
    void Function(List<TokenSyncTransaction> transactions, Map<Bech32mTokenIdentifier, TokenBalanceInfo> tokenBalances);

class TokenSyncTransaction {
  final List<int> tokenTransactionHash;
  final List<String> tokenIdentifiers;
  final List<String> sparkInvoices;

  TokenSyncTransaction({
    required this.tokenTransactionHash,
    required this.tokenIdentifiers,
    required this.sparkInvoices,
  });
}