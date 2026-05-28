import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:developer';

import 'package:bitcoin_base/bitcoin_base.dart' hide UTXO;
import 'package:blockchain_utils/blockchain_utils.dart' hide hex;
import 'package:collection/collection.dart';
import 'package:convert/convert.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter/foundation.dart';
import 'package:mutex/mutex.dart';
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart';
import 'package:spark_dart/spark_bindings/spark_bindings.dart';
import 'package:spark_dart/spark_wallet/se_helper.dart';
import 'package:spark_dart/src/rust/frb_generated.dart';
import 'package:boringssl_ffi/boringssl_ffi.dart' as bsll;
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

import '../errors/spark_error.dart';
import '../graphql/objects/bitcoin_network.dart' as graph;
import '../graphql/objects/exit_speed.dart';
import '../graphql/objects/claim_static_deposit_output.dart';
import '../graphql/objects/coop_exit_fee_quote.dart';
import '../graphql/objects/coop_exit_request.dart';
import '../graphql/objects/currency_unit.dart' show CurrencyUnit;
import '../graphql/objects/instant_static_deposit_plan.dart';
import '../graphql/objects/instant_static_deposit_quote_output.dart';
import '../graphql/objects/leaves_swap_fee_estimate_output.dart';
import '../graphql/objects/lightning_receive_request.dart';
import '../graphql/objects/lightning_send_request.dart';
import '../graphql/objects/request_coop_exit_input.dart';
import '../graphql/objects/static_deposit_quote_output.dart';
import '../services/bolt11_spark.dart'
    show decodeInvoice, isValidSparkAddressFallback, getNetworkFromInvoice;
import '../services/config.dart';
import '../services/connection/connection.dart';
import '../services/coop_exit.dart';
import '../services/deposit.dart';
import '../services/leaf_manager.dart';
import '../services/lightning.dart' hide bytesToBigIntBE;
import '../services/signing.dart';
import '../services/swap.dart';
import '../services/tokens/output_manager.dart';
import '../services/tokens/token_transactions.dart';
import '../services/transfer.dart';
import '../graphql/client.dart';
import '../services/wallet_config.dart';
import '../signer/types.dart';
import '../spark-readonly-client/types.dart';
import '../spark_bindings/types.dart';
import '../src/proto/spark.pb.dart' hide Network;
import '../signer/signer.dart';
import '../src/proto/spark_token.pb.dart';
import '../types/sdk_types.dart';
import '../utils/address.dart';
import '../utils/bitcoin.dart'
    show
        getTxEstimatedVbytesSizeByNumberOfInputsOutputs,
        getBasedBitcoinNetwork,
        getSigHashFromTx,
        getTxFromRawTxHex,
        getTxId,
        getP2WPKHAddressFromPublicKey,
        getP2TRScriptFromPublicKey,
        getTxFromRawTxBytes;
import '../utils/hex.dart';
import '../utils/htlc_transactions.dart';
import '../utils/invoice_hashing.dart';
import '../utils/keys.dart';
import '../utils/network.dart';
import '../utils/token_identifier.dart';
import '../utils/token_transactions.dart';
import 'types.dart' hide CreateLightningInvoiceParams;


abstract class EventEmitter {
  final Map<SparkWalletEvent, List<Function>> _handlers = {};

  // THE PERFECT METHOD
  void on<T extends Function>(SparkWalletEvent<T> event, T handler) {
    _handlers.putIfAbsent(event, () => []).add(handler);
  }

  void onAny(SparkAllEventsCallback handler) {
    on(SparkWalletEvent.all, handler);
  }

  void onBalanceUpdate(SparkBalanceUpdateCallback handler) {
    on(SparkWalletEvent.balanceUpdate, handler);
  }

  void onTransferClaimed(SparkTransferClaimedCallback handler) {
    on(SparkWalletEvent.transferClaimed, handler);
  }

  void onDepositConfirmed(SparkDepositConfirmedCallback handler) {
    on(SparkWalletEvent.depositConfirmed, handler);
  }

  void onStreamConnected(SparkStreamConnectedCallback handler) {
    on(SparkWalletEvent.streamConnected, handler);
  }

  void onStreamDisconnected(SparkStreamDisconnectedCallback handler) {
    on(SparkWalletEvent.streamDisconnected, handler);
  }

  void onStreamReconnecting(SparkStreamReconnectingCallback handler) {
    on(SparkWalletEvent.streamReconnecting, handler);
  }

  void onStreamHeartbeat(SparkStreamHeartbeatCallback handler) {
    on(SparkWalletEvent.streamHeartbeat, handler);
  }

  void onTokenTransaction(SparkTokenTransactionCallback handler) {
    on(SparkWalletEvent.tokenTransaction, handler);
  }

  // Because the callback arguments differ in length/type, you use Function.apply to emit
  void emit(SparkWalletEvent event, [List<dynamic> args = const []]) {
    // Fire specific handlers
    final specificHandlers = _handlers[event];
    if (specificHandlers != null) {
      for (final handler in specificHandlers) {
        Function.apply(handler, args);
      }
    }

    // Fire wildcard handlers
    final wildcardHandlers = _handlers[SparkWalletEvent.all];
    if (wildcardHandlers != null) {
      for (final handler in wildcardHandlers) {
        Function.apply(handler, [event.value, args]);
      }
    }
  }

  /// Emits a balance update event
  void emitBalanceUpdate(BalanceUpdateData balance) {
    emit(SparkWalletEvent.balanceUpdate, [balance]);
  }

  /// Emits when an incoming transfer is successfully claimed
  void emitTransferClaimed(String transferId, BigInt updatedBalance) {
    emit(SparkWalletEvent.transferClaimed, [transferId, updatedBalance]);
  }

  /// Emits when a deposit is marked as available
  void emitDepositConfirmed(String depositId, BigInt updatedBalance) {
    emit(SparkWalletEvent.depositConfirmed, [depositId, updatedBalance]);
  }

  /// Emits when the stream is successfully connected
  void emitStreamConnected() {
    emit(SparkWalletEvent.streamConnected, []);
  }

  /// Emits when the stream stops and will not retry
  void emitStreamDisconnected(String reason) {
    emit(SparkWalletEvent.streamDisconnected, [reason]);
  }

  /// Emits when attempting to reconnect the stream
  void emitStreamReconnecting(int attempt, int maxAttempts, int delayMs, String error) {
    emit(SparkWalletEvent.streamReconnecting, [attempt, maxAttempts, delayMs, error]);
  }

  void emitStreamHeartbeat() {
    emit(SparkWalletEvent.streamHeartbeat, []);
  }

  void emitTokenBalanceUpdate(List<TokenSyncTransaction> transactions, Map<Bech32mTokenIdentifier, TokenBalanceInfo> tokenBalances) {
    emit(SparkWalletEvent.tokenTransaction, [transactions, tokenBalances]);
  }

  void removeAllListeners() {
    _handlers.clear();
  }

  void removeListener<T extends Function>(SparkWalletEvent<T> event, T handler) {
    _handlers[event]?.remove(handler);
  }
}

class InitWalletResponse {
  final SparkWallet wallet;
  final String? mnemonic;
  List<({Uint8List chainCode, String path, Uint8List privateKey})>? encryptedKeyset;

  InitWalletResponse({required this.wallet, this.mnemonic, this.encryptedKeyset});
}

class TransferJob {
  final List<LeafKeyTweak> leafKeyTweaks;
  final Uint8List receiverIdentityPubkey;
  final SparkAddressFormat? sparkInvoice;
  final TransferWithInvoiceParams param;

  const TransferJob({
    required this.leafKeyTweaks,
    required this.receiverIdentityPubkey,
    this.sparkInvoice,
    required this.param,
  });
}

/// The SparkWallet class is the primary interface for interacting with the Spark network.
class SparkWallet extends EventEmitter implements ISparkWallet {
  // ---------------------------------------------------------------------------
  // Singleton registry
  // ---------------------------------------------------------------------------
  static final Map<String, SparkWallet> _instances = {};
  static final Map<String, Mutex> _initMutexes = {};

  String? _singletonKey;
  bool _disposed = false;

  late final WalletConfigService config;
  late final ConnectionManager connectionManager;
  late final CoopExitService coopExitService;
  late final DepositService depositService;
  late final LightningService lightningService;
  late final SigningService signingService;
  SspClient? sspClient;
  late final TokenTransactionService tokenTransactionService;
  late final TransferService transferService;
  late final SwapService swapService;
  late final LeafManager leafManager;

  final Mutex _claimTransferMutex = Mutex();
  Timer? _claimTransfersInterval;
  final Map<String, Mutex> _mutexes = {};

  String? _sparkAddress; // SparkAddressFormat

  // Using a boolean flag or a generic CancelToken for AbortController
  bool _streamAborted = false;

  bool _tokenOptimizationInProgress = false;
  Timer? _tokenOptimizationInterval;
  late final TokenOutputManager tokenOutputManager;

  final TokenMetadataMap tokenMetadata = {};

  // Tracer placeholder
  dynamic tracer;
  final String tracerId = "spark-sdk";

  // Timer for debouncing token syncs
  Timer? _tokenSyncDebounceTimer;
  // Accumulated pending identifiers
  final Set<String> _tokenSyncPendingIds = {};
  // Accumulated pending transactions
  final List<TokenSyncTransaction> _tokenSyncPendingTransactions = [];

  SparkWallet(ConfigOptions? options, SparkSigner? signerArg) {
    final signer = signerArg ?? DefaultSparkSigner();
    config = WalletConfigService(options: options, signer: signer);

    final events = config.getEvents();
    if (events.isNotEmpty) {
      events.forEach((event, handler) {
        final eventObj = SparkWalletEvent.fromString(event);
        if (eventObj == null) {
          throw Exception("Unknown event name `$event`. Possible values are ${SparkWalletEvent.values.map<String>((v)=>v.value).join(", ")}");
        }
        on(eventObj, handler);
      });
    }

    connectionManager = buildConnectionManager(config);
    signingService = SigningService(config);
    depositService = DepositService(config, connectionManager);
    transferService = TransferService(
      config,
      connectionManager,
      signingService,
    );
    tokenTransactionService = TokenTransactionService(
      config,
      connectionManager,
    );
    tokenOutputManager = TokenOutputManager(
      lockExpiryMs: config.getTokenOutputLockExpiryMs(),
    );
    lightningService = LightningService(
      config,
      connectionManager,
      signingService,
    );
    coopExitService = CoopExitService(
      config,
      connectionManager,
      signingService,
    );
    sspClient = SspClient(config: config, signer: config.signer);
    swapService = SwapService(config, transferService, sspClient!);

    leafManager = LeafManager(
      config: config,
      swapService: swapService,
      transferService: transferService,
      connectionManager: connectionManager,
      onBalanceUpdate: (balance) {
        emitBalanceUpdate(BalanceUpdateData(
          available: balance.available,
          owned: balance.owned,
          incoming: balance.incoming,
        ));
      },
      onAutoOptimize: () async {
        await for (final _ in optimizeLeaves()) {
          // run all steps
        }
      },
    );

    if (getTracer() != null) {
      _initializeTracer(this);
    }
    _wrapPublicMethods();
  }

  ConnectionManager buildConnectionManager(WalletConfigService config) {
    return ConnectionManager(config);
  }

  // Inside SparkWallet:
  static Future<InitWalletResponse> initialize({
    SparkWalletProps? props,
  }) async {
    await RustLib.init();
    setupSparkFrost();

    final options = props?.options ?? ConfigOptions();
    SparkSigner? signer;
    if (props?.keyset != null) {
      signer = DefaultSparkSigner(sparkKeysGenerator: KeySetGenerator());
    }

    SparkWallet wallet;
    try {
      wallet = SparkWallet(options, signer ?? props?.signer);
    } catch (error) {
      final err = await handlePublicMethodError(error);
      throw err;
    }

    print("Spark.initialize 1");

    // Check if the keyset is encrypted
    final isEncrypted = SEHelper.isKeysetEncrypted(props?.keyset);

    print("Spark.initialize 2 ${isEncrypted}");

    // decrypt the keyset
    List<({Uint8List chainCode, String path, Uint8List privateKey})>? encryptedKeyset;
    if (isEncrypted) {
      print("Spark.initialize 3 ${isEncrypted}");
      await SEHelper.decryptKeyset(props!.keyset!);
      print("Spark.initialize 4 ${isEncrypted}");
    } else if (props?.keyset != null && (props?.encryptAndStoreInSE ?? false)) {
      print("Spark.initialize 3.1 ${isEncrypted}");
      encryptedKeyset = await SEHelper.encryptKeyset(props!.keyset!);
      print("Spark.initialize 4.1 ${isEncrypted}");
    }

    // Directly call the initialization logic
    final initWalletResponse = await wallet._initWallet(
      props?.mnemonicOrSeed,
      props?.accountNumber,
      options,
      props?.keyset,
    );

    // assign the encrypted keyset if it was just encrypted
    initWalletResponse.encryptedKeyset = encryptedKeyset;

    return initWalletResponse; // Now safely typed as InitWalletResponse
  }

  static Mutex _getInitMutex(String identityHex) {
    if (!_initMutexes.containsKey(identityHex)) {
      _initMutexes[identityHex] = Mutex();
    }
    return _initMutexes[identityHex]!;
  }

  static Future<InitWalletResponse> getOrCreateWallet({
    required SparkWalletProps props,
    bool forceReinit = false,
  }) async {
    await RustLib.init();
    setupSparkFrost();
    
    final options = props.options ?? ConfigOptions();
    SparkWallet wallet;

    try {
      // Instantiate directly instead of using a generic builder
      wallet = SparkWallet(options, props.signer);
    } catch (error) {
      final err = await handlePublicMethodError(error);
      throw err;
    }

    String? mnemonic;
    dynamic seed;
    int? accountNumber = props.accountNumber;

    if (options.signerWithPreExistingKeys != true) {
      final resolved = await wallet._resolveSeedAndMnemonic(
        props.mnemonicOrSeed,
        accountNumber,
      );
      seed = resolved.seed;
      mnemonic = resolved.mnemonic;
      accountNumber = resolved.accountNumber;
      await wallet.config.signer.createSparkWalletFromSeed(
        seed,
        accountNumber: accountNumber,
      );
    }

    final identityPublicKey = await wallet.config.signer.getIdentityPublicKey();
    final identityHex = bytesToHex(
      identityPublicKey,
    ); // Assuming bytesToHex is defined locally

    return await _getInitMutex(identityHex).protect(() async {
      final existing = _instances[identityHex];
      if (existing != null && !existing._disposed) {
        if (forceReinit) {
          await existing.cleanupConnections();
        } else {
          wallet._cleanup(); // Dispose of the temporary wallet instance
          // Return the existing wallet cleanly typed
          return InitWalletResponse(wallet: existing, mnemonic: mnemonic);
        }
      }

      // Initialize the fresh wallet
      final result = await wallet._initWallet(
        seed ?? props.mnemonicOrSeed,
        accountNumber,
        options,
        props.keyset,
      );

      wallet._singletonKey = identityHex;
      _instances[identityHex] = wallet;

      return InitWalletResponse(wallet: result.wallet, mnemonic: mnemonic);
    });
  }

  Future<void> _createClientsAndSyncWallet() async {
    await connectionManager.createClients();

    await leafManager.initialize();
    // final isReactNative = false;

    // if (isReactNative) {
    //   _startPeriodicClaimTransfers();
    // } else {
    _setupBackgroundStream();
    // }

    await _syncWallet();

    final tokenOptConfig = config.getTokenOptimizationOptions();
    if (tokenOptConfig.enabled == true) {
      _startPeriodicTokenOptimization();
    }
  }

  void _logEvent(String message) {
    if (!config.getLog()) return;
    log(
      "[${DateTime.now().toIso8601String()}][${connectionManager.getSessionId()}] [spark-sdk][event] $message",
    );
  }

  SspClient _getSspClient() {
    if (sspClient == null) {
      throw SparkError("SSP client not initialized", {
        "configKey": "sspClient",
      });
    }
    return sspClient!;
  }

  // Future<void> _handleStreamEvent(SubscribeToEventsResponse data) async {
  //   // in dart oneof doesn't translate, I'll have to check one by one
  //   // final event = data.event;

  //   try {
  //     if (data.hasReceiverTransfer() &&
  //         data.receiverTransfer.transfer.type != TransferType.COUNTER_SWAP &&
  //         data.receiverTransfer.transfer.type != TransferType.COUNTER_SWAP_V3) {
  //       final transfer = data.receiverTransfer.transfer;
  //       final senderIdentityPublicKey = transfer.senderIdentityPublicKey;
  //       final receiverIdentityPublicKey = transfer.receiverIdentityPublicKey;
  //       final isSelf = ListEquality().equals(
  //         senderIdentityPublicKey,
  //         receiverIdentityPublicKey,
  //       );

  //       _logEvent(
  //         "Receiver transfer: id=${transfer.id} type=${transfer.type} status=${transfer.status} totalValue=${transfer.totalValue} leaves=${transfer.leaves.length} selfTransfer=$isSelf",
  //       );

  //       if (!isSelf) {
  //         final incomingLeaves = transfer.leaves
  //             .where((l) => l.hasLeaf())
  //             .map<TreeNode>((l) => l.leaf)
  //             .toList();

  //         if (incomingLeaves.isNotEmpty) {
  //           final valueSum = incomingLeaves.fold(
  //             0,
  //             (sum, l) => sum + l.value.toInt(),
  //           );
  //           _logEvent(
  //             "Receiver transfer ${transfer.id}: adding ${incomingLeaves.length} incoming leaves ($valueSum sats) ids=[${incomingLeaves.map((l) => l.id).join(",")}]",
  //           );
  //           await leafManager.addIncomingLeaves(incomingLeaves, transfer.id);
  //         }

  //         await _claimTransfer(transfer: transfer, emit: true);
  //       }
  //     } else if (data.hasReceiverTransfer() &&
  //         (data.receiverTransfer.transfer.type == TransferType.COUNTER_SWAP ||
  //             data.receiverTransfer.transfer.type ==
  //                 TransferType.COUNTER_SWAP_V3)) {
  //       final transfer = data.receiverTransfer.transfer;
  //       final counterSwapLeafIds = transfer.leaves
  //           .where((l) => l.hasLeaf())
  //           .map((l) => l.leaf.id);
  //       _logEvent(
  //         "Counter-swap receiver transfer (skipped): id=${transfer.id} type=${transfer.type} status=${transfer.status} totalValue=${transfer.totalValue} leafIds=[${counterSwapLeafIds.join(",")}]",
  //       );
  //     } else if (data.hasSenderTransfer()) {
  //       final transfer = data.senderTransfer.transfer;
  //       final senderLeafIds = transfer.leaves
  //           .where((l) => l.hasLeaf())
  //           .map((l) => l.leaf.id);
  //       _logEvent(
  //         "Sender transfer: id=${transfer.id} type=${transfer.type} status=${transfer.status} totalValue=${transfer.totalValue} leafIds=[${senderLeafIds.join(",")}]",
  //       );
  //       await leafManager.handleTransferEvent(transfer);
  //     } else if (data.hasDeposit()) {
  //       final deposit = data.deposit.deposit;
  //       _logEvent(
  //         "Deposit: id=${deposit.id} status=${deposit.status} value=${deposit.value}",
  //       );
  //       final wasAdded = await leafManager.handleDepositEvent(deposit);
  //       if (deposit.status == "AVAILABLE" && wasAdded) {
  //         emitDepositConfirmed(
  //           deposit.id,
  //           BigInt.from(leafManager.getAvailableBalance()),
  //         );
  //       }
  //     }
  //   } catch (error) {
  //     log("Error processing event: $error");
  //   }
  // }

  Future<void> _handleStreamEvent(SubscribeToEventsResponse data) async {
    try {
      if (data.hasReceiverTransfer() &&
          data.receiverTransfer.transfer.type != TransferType.COUNTER_SWAP &&
          data.receiverTransfer.transfer.type != TransferType.COUNTER_SWAP_V3) {
        
        final transfer = data.receiverTransfer.transfer;
        final traceId = data.receiverTransfer.traceId;
        
        // In Dart protobufs, strings default to "" rather than null
        if (traceId.isNotEmpty) {
          _logEvent(
            "handleStreamEvent: Receiver transfer ${transfer.id} traceId=$traceId",
          );
        }

        final senderIdentityPublicKey = transfer.senderIdentityPublicKey;
        final receiverIdentityPublicKey = transfer.receiverIdentityPublicKey;
        final isSelf = const ListEquality().equals(
          senderIdentityPublicKey,
          receiverIdentityPublicKey,
        );

        _logEvent(
          "handleStreamEvent: Receiver transfer: id=${transfer.id} type=${transfer.type} status=${transfer.status} totalValue=${transfer.totalValue} leaves=${transfer.leaves.length} selfTransfer=$isSelf",
        );

        if (!isSelf) {
          final incomingLeaves = transfer.leaves
              .where((l) => l.hasLeaf())
              .map<TreeNode>((l) => l.leaf)
              .toList();

          if (incomingLeaves.isNotEmpty) {
            final valueSum = incomingLeaves.fold(
              0,
              (sum, l) => sum + l.value.toInt(),
            );
            _logEvent(
              "handleStreamEvent: Receiver transfer ${transfer.id}: adding ${incomingLeaves.length} incoming leaves ($valueSum sats) ids=[${incomingLeaves.map((l) => l.id).join(",")}]",
            );
            await leafManager.addIncomingLeaves(incomingLeaves, transfer.id);
          }

          await _claimTransfer(transfer: transfer, emit: true);
        }
      } else if (data.hasReceiverTransfer() &&
          (data.receiverTransfer.transfer.type == TransferType.COUNTER_SWAP ||
              data.receiverTransfer.transfer.type == TransferType.COUNTER_SWAP_V3)) {
        
        final transfer = data.receiverTransfer.transfer;
        final counterSwapLeafIds = transfer.leaves
            .where((l) => l.hasLeaf())
            .map((l) => l.leaf.id);
        
        _logEvent(
          "handleStreamEvent: Counter-swap receiver transfer (skipped): id=${transfer.id} type=${transfer.type} status=${transfer.status} totalValue=${transfer.totalValue} leafIds=[${counterSwapLeafIds.join(",")}]",
        );
      } else if (data.hasSenderTransfer()) {
        final transfer = data.senderTransfer.transfer;
        final traceId = data.senderTransfer.traceId;

        if (traceId.isNotEmpty) {
          _logEvent(
            "handleStreamEvent: Sender transfer ${transfer.id} traceId=$traceId",
          );
        }

        final senderLeafIds = transfer.leaves
            .where((l) => l.hasLeaf())
            .map((l) => l.leaf.id);
            
        _logEvent(
          "handleStreamEvent: Sender transfer: id=${transfer.id} type=${transfer.type} status=${transfer.status} totalValue=${transfer.totalValue} leafIds=[${senderLeafIds.join(",")}]",
        );
        
        await leafManager.handleTransferEvent(transfer);
      } else if (data.hasDeposit()) {
        final deposit = data.deposit.deposit;
        final traceId = data.deposit.traceId;

        if (traceId.isNotEmpty) {
          _logEvent(
            "handleStreamEvent: Deposit ${deposit.id} traceId=$traceId",
          );
        }

        _logEvent(
          "handleStreamEvent: Deposit: id=${deposit.id} status=${deposit.status} value=${deposit.value}",
        );
        
        final wasAdded = await leafManager.handleDepositEvent(deposit);
        if (deposit.status == "AVAILABLE" && wasAdded) {
          emitDepositConfirmed(
            deposit.id,
            leafManager.getAvailableBalance(),
          );
        }
      } else if (data.hasTokenTransaction()) {
        // NEW BLOCK: Token Transaction handling
        final tokenTx = data.tokenTransaction;
        
        final bech32mIds = tokenTx.tokenIdentifiers.map((raw) =>
          encodeBech32mTokenIdentifier(Bech32mTokenIdentifierData(
            tokenIdentifier: Uint8List.fromList(raw),
            network: config.getNetwork(),
          ))
        ).toList();

        // Note: You may need to create a class or map to pass these parameters 
        // depending on how you implement _scheduleTokenSync in Dart.
        _scheduleTokenSync(
          bech32mIds,
          tokenTransactionHash: tokenTx.tokenTransactionHash,
          tokenIdentifiers: bech32mIds,
          sparkInvoices: tokenTx.sparkInvoices, 
        );
      }
    } catch (error) {
      log("Error processing event: $error");
    }
  }

  

  // Future<void> _setupBackgroundStream() async {
  //   final initialDelay = 1000;
  //   final maxDelay = 15000;
  //   final retryForever = double.infinity;
  //   final loggingEnabled = config.getLog();

  //   void logStream(String message) {
  //     if (!loggingEnabled) return;
  //     log("[${DateTime.now().toIso8601String()}] [spark-sdk][stream] $message");
  //   }

  //   int retryCount = 0;
  //   _streamAborted = false;

  //   while (!_streamAborted) {
  //     try {
  //       final address = config.getCoordinatorAddress();
  //       logStream("subscribing to $address (retry=$retryCount)");

  //       final stream = await connectionManager.subscribeToEvents(address);
  //       logStream("subscribeToEvents returned async iterator");

  //       final claimedTransfersIds = await _claimTransfers();
  //       logStream(
  //         "claimTransfers completed claimedTransfers=${claimedTransfersIds.length}",
  //       );

  //       try {
  //         await for (final data in stream) {
  //           if (_streamAborted) {
  //             logStream("stream controller aborted while iterating");
  //             break;
  //           }

  //           logStream(
  //             "stream event received type=${describeStreamEvent(data)}",
  //           );
  //           if (data.hasConnected()) {
  //             logStream("connected");
  //             emitStreamConnected();
  //             retryCount = 0;
  //           }

  //           if (data.hasReceiverTransfer() &&
  //               claimedTransfersIds.contains(
  //                 data.receiverTransfer.transfer.id,
  //               )) {
  //             continue;
  //           }
  //           await _handleStreamEvent(data);
  //         }
  //         logStream("stream iterator completed without throwing");
  //       } catch (error) {
  //         logStream("stream iterator threw: $error");
  //         rethrow;
  //       }
  //     } catch (error) {
  //       if (_streamAborted) {
  //         logStream("stream loop aborted");
  //         break;
  //       }

  //       final attempt = retryCount + 1;
  //       final backoffDelay = (initialDelay * (1 << retryCount))
  //           .clamp(0, maxDelay)
  //           .toInt();
  //       retryCount = attempt;

  //       logStream(
  //         "error: $error; retrying in ${backoffDelay}ms (attempt=$attempt)",
  //       );
  //       emitStreamReconnecting(
  //         attempt,
  //         (retryForever.isFinite) ? retryForever.toInt() : -1,
  //         backoffDelay,
  //         "error: $error; retrying in ${backoffDelay}ms (attempt=$attempt)"
  //       );

  //       try {
  //         await Future.delayed(Duration(milliseconds: backoffDelay));
  //       } catch (_) {
  //         if (_streamAborted) break;
  //       }
  //     } finally {
  //       logStream(
  //         "stream loop iteration finished retryCount=$retryCount aborted=$_streamAborted",
  //       );
  //     }
  //   }
  // }

  Future<void> _setupBackgroundStream() async {
    final initialDelay = 1000;
    final maxDelay = 15000;
    final retryForever = double.infinity;
    final loggingEnabled = config.getLog();
    final streamHeartbeatTimeoutMs = 15000;

    void logStream(String message) {
      if (!loggingEnabled) return;
      log("[${DateTime.now().toIso8601String()}] [spark-sdk][stream] $message");
    }

    int retryCount = 0;
    _streamAborted = false;

    while (!_streamAborted) {
      bool attemptAborted = false;
      Object? heartbeatTimeoutError;
      Timer? streamActivityTimer;

      void clearActivityTimeout() {
        streamActivityTimer?.cancel();
        streamActivityTimer = null;
      }

      void armActivityTimeout() {
        clearActivityTimeout();
        streamActivityTimer = Timer(Duration(milliseconds: streamHeartbeatTimeoutMs), () {
          if (_streamAborted || attemptAborted) return;

          heartbeatTimeoutError = Exception(
            "UNAVAILABLE: stream heartbeat timed out after ${streamHeartbeatTimeoutMs}ms",
          );
          logStream(
            "heartbeat timeout after ${streamHeartbeatTimeoutMs}ms; aborting current stream attempt",
          );
          attemptAborted = true;
          
          // NOTE: If your connectionManager exposes a way to actively cancel/abort 
          // the gRPC stream subscription, you should call it here to force the 
          // 'await for' loop below to wake up immediately.
        });
      }

      try {
        final address = config.getCoordinatorAddress();
        logStream("subscribing to $address (retry=$retryCount)");

        // If subscribeToEvents now accepts an abort signal or cancel token, pass it here.
        final stream = await connectionManager.subscribeToEvents(address);
        logStream("subscribeToEvents returned async iterator");

        final claimedTransfersIds = await _claimTransfers();
        logStream(
          "claimTransfers completed claimedTransfers=${claimedTransfersIds.length}",
        );

        bool heartbeatListenerEnabled = false;
        
        // Added the new sync call from the TS implementation
        await _syncTokenOutputs();

        try {
          await for (final data in stream) {
            if (_streamAborted || attemptAborted) {
              logStream("stream controller aborted while iterating");
              break;
            }

            // Do not enable the heartbeat listener until the stream proves the
            // connected coordinator actually emits heartbeat events.
            if (heartbeatListenerEnabled) {
              clearActivityTimeout();
            }

            if (data.hasHeartbeat()) {
              heartbeatListenerEnabled = true;
              armActivityTimeout();
              continue;
            }

            logStream(
              "stream event received type=${describeStreamEvent(data)}",
            );
            
            if (data.hasConnected()) {
              logStream("connected");
              emitStreamConnected();
              retryCount = 0;
            }

            if (data.hasReceiverTransfer() &&
                claimedTransfersIds.contains(
                  data.receiverTransfer.transfer.id,
                )) {
              if (heartbeatListenerEnabled) {
                armActivityTimeout();
              }
              continue;
            }

            await _handleStreamEvent(data);
            
            if (heartbeatListenerEnabled && !_streamAborted && !attemptAborted) {
              armActivityTimeout();
            }
          }
          logStream("stream iterator completed without throwing");

          if (heartbeatTimeoutError != null && !_streamAborted) {
            throw heartbeatTimeoutError!;
          }
        } catch (error) {
          logStream("stream iterator threw: $error");
          throw heartbeatTimeoutError ?? error;
        }
      } catch (error) {
        final retryError = heartbeatTimeoutError ?? error;
        
        if (_streamAborted) {
          logStream("stream loop aborted");
          break;
        }

        final attempt = retryCount + 1;
        final backoffDelay = (initialDelay * (1 << retryCount))
            .clamp(0, maxDelay)
            .toInt();
        retryCount = attempt;

        logStream(
          "error: $retryError; retrying in ${backoffDelay}ms (attempt=$attempt)",
        );
        
        emitStreamReconnecting(
          attempt,
          (retryForever.isFinite) ? retryForever.toInt() : -1,
          backoffDelay,
          "error: $retryError; retrying in ${backoffDelay}ms (attempt=$attempt)"
        );

        try {
          // Splitting the delay into smaller chunks allows it to exit early if aborted
          // This simulates the behavior of passing the AbortSignal into the delay in TS
          int timeSleptMs = 0;
          while (timeSleptMs < backoffDelay) {
            if (_streamAborted) break;
            await Future.delayed(const Duration(milliseconds: 100));
            timeSleptMs += 100;
          }
        } catch (_) {
          if (_streamAborted) break;
        }
      } finally {
        clearActivityTimeout();
        logStream(
          "stream loop iteration finished retryCount=$retryCount aborted=$_streamAborted",
        );
      }
    }
  }

  /// Debounce token sync: accumulates token identifiers across rapid-fire
  /// events and flushes once after a 200ms window of inactivity. This avoids
  /// redundant network calls when multiple token transactions finalize in a
  /// burst.
  void _scheduleTokenSync(
    List<String> bech32mIds, {
    required List<int> tokenTransactionHash,
    required List<String> tokenIdentifiers,
    required List<String> sparkInvoices,
  }) {
    _tokenSyncPendingIds.addAll(bech32mIds);
    
    _tokenSyncPendingTransactions.add(
      TokenSyncTransaction(
        tokenTransactionHash: tokenTransactionHash,
        tokenIdentifiers: tokenIdentifiers,
        sparkInvoices: sparkInvoices,
      ),
    );

    // Note: Adjust this to your specific debug logger if necessary
    log(
      "[DEBUG] scheduleTokenSync: queued token sync ids=${bech32mIds.length} pendingIds=${_tokenSyncPendingIds.length} pendingTransactions=${_tokenSyncPendingTransactions.length}",
    );

    // Clear the existing timer if it's currently running
    _tokenSyncDebounceTimer?.cancel();

    // Start a new 200ms debounce timer
    _tokenSyncDebounceTimer = Timer(const Duration(milliseconds: 200), () {
      _flushTokenSync();
    });
  }

  Future<void> _flushTokenSync() async {
    // Take a snapshot of the current pending data
    final ids = _tokenSyncPendingIds.toList();
    final transactions = List<TokenSyncTransaction>.from(_tokenSyncPendingTransactions);
    
    // Clear the class state
    _tokenSyncPendingIds.clear();
    _tokenSyncPendingTransactions.clear();
    _tokenSyncDebounceTimer = null;

    try {
      log(
        "[DEBUG] flushTokenSync: flushing token sync ids=${ids.length} transactions=${transactions.length}",
      );
      
      // Pass the IDs if there are any, otherwise pass null (or empty list depending on your sync method signature)
      await _syncTokenOutputs(ids.isNotEmpty ? ids : null);
      
      final tokenBalances = await _getTokenBalanceMap();
      
      // Emit your equivalent TokenBalanceUpdate event
      emitTokenBalanceUpdate(
        transactions,
        tokenBalances,
      );
      
      log(
        "[DEBUG] flushTokenSync: token sync emitted balance update tokenCount=${tokenBalances.length}",
      );
    } catch (error) {
      log("Error flushing token sync: $error");
      
      // Revert/Restore the IDs and transactions back to the pending state so they can be retried
      _tokenSyncPendingIds.addAll(ids);
      _tokenSyncPendingTransactions.insertAll(0, transactions);
    }
  }

  Future<List<TreeNode>> getLeaves([bool isBalanceCheck = false]) async {
    return await leafManager.getLeaves(isBalanceCheck);
  }

  /// Maps TypeScript AsyncGenerator to Dart Stream
  Stream<dynamic> optimizeLeaves([int? multiplicity]) async* {
    yield* leafManager.optimizeLeaves(multiplicity);
  }

  Future<void> optimizeTokenOutputs() async {
    if (_tokenOptimizationInProgress) {
      return;
    }

    _tokenOptimizationInProgress = true;

    try {
      await _syncTokenOutputs();

      final tokenOptConfig = config.getTokenOptimizationOptions();
      final minOutputsThreshold = tokenOptConfig.minOutputsThreshold ?? 50;

      final entries = await tokenOutputManager.entries();

      final acquireRequests = entries
          .where((entry) => entry.value.length > minOutputsThreshold)
          .map(
            (entry) => TokenOutputAcquireRequest(
              tokenIdentifier: entry.key,
              selector:
                  (
                    List<OutputWithPreviousTransactionData> available,
                    int remainingCapacity,
                  ) {
                    return available.take(remainingCapacity).toList();
                  },
            ),
          )
          .toList();

      if (acquireRequests.isEmpty) {
        return;
      }

      final outputsByToken = await tokenOutputManager.acquireOutputsBatch(
        acquireRequests,
        MAX_TOKEN_OUTPUTS_TX, // Assume imported from constants
        "optimize-token-outputs",
      );

      if (outputsByToken.isEmpty) {
        return;
      }

      final receiverSparkAddress = await getSparkAddress();
      final List<ReceiverOutput> receiverOutputs = [];
      final List<OutputWithPreviousTransactionData> selectedOutputs = [];

      for (final entry in outputsByToken.entries) {
        final tokenIdentifier = entry.key;
        final outputs = entry.value;

        if (outputs.isEmpty) {
          continue;
        }

        receiverOutputs.add(
          ReceiverOutput(
            tokenIdentifier: tokenIdentifier,
            tokenAmount: sumTokenOutputs(outputs), // Assume imported utility
            receiverSparkAddress: receiverSparkAddress,
          ),
        );
        selectedOutputs.addAll(outputs);
      }

      if (receiverOutputs.isEmpty) {
        return;
      }

      try {
        final txId = await tokenTransactionService.tokenTransfer(
          tokenOutputs: outputsByToken,
          receiverOutputs: receiverOutputs,
          outputSelectionStrategy: "SMALL_FIRST",
          selectedOutputs: selectedOutputs,
        );

        log(
          "Consolidated ${selectedOutputs.length} outputs across ${receiverOutputs.length} tokens in transaction $txId",
        );
      } catch (error) {
        log("Failed to optimize token outputs: $error");
      }
    } finally {
      _tokenOptimizationInProgress = false;
    }
  }

  void _startPeriodicTokenOptimization() {
    if (config.isReadOnly) {
      print('🛡️ [Read-Only] Blocked _startPeriodicTokenOptimization');
      return;
    }
    if (_tokenOptimizationInterval != null) {
      _tokenOptimizationInterval!.cancel();
    }

    final tokenOptConfig = config.getTokenOptimizationOptions();
    final intervalMs = tokenOptConfig.intervalMs ?? 300000;

    _tokenOptimizationInterval = Timer.periodic(
      Duration(milliseconds: intervalMs),
      (_) async {
        try {
          await optimizeTokenOutputs();
        } catch (error) {
          log("Error in periodic token output optimization: $error");
        }
      },
    );
  }

  Future<void> experimentalSyncWallet() async {
    await _syncWallet();
  }

  Future<void> _syncWallet() async {
    await _syncTokenOutputs();
    await leafManager.sync();
  }

  Future<String> getIdentityPublicKey() async {
    return bytesToHex(await config.signer.getIdentityPublicKey());
  }

  Future<String> getSparkAddress() async {
    _sparkAddress ??= encodeSparkAddress(
      SparkAddressData(
        identityPublicKey: bytesToHex(
          await config.signer.getIdentityPublicKey(),
        ),
        network: config.getNetwork(),
      ),
    );
    return _sparkAddress!;
  }

  Future<String> createSatsInvoice({
    int? amount,
    String? memo,
    String? senderSparkAddress,
    DateTime? expiryTime,
    String? receiverIdentityPubkey,
  }) async {
    const int maxSatsAmount = 2100000000000000;

    if (amount != null && (amount < 0 || amount > maxSatsAmount)) {
      throw SparkValidationError(
        "Amount must be between 0 and $maxSatsAmount sats",
        context: {
          "field": "amount",
          "value": amount,
          "expected": "less than or equal to $maxSatsAmount",
        },
      );
    }

    final protoPayment = SatsPayment(amount: amount==null ? null : $fixnum.Int64(amount));

    Uint8List? senderPublicKey;
    if (senderSparkAddress != null) {
      senderPublicKey = hexToBytes(
        decodeSparkAddress(
          senderSparkAddress,
          config.getNetwork(),
        ).identityPublicKey,
      );
    }

    final invoiceFields = SparkInvoiceFields(
      version: 1,
      id: _generateUuidV7().toBytes(),
      satsPayment: protoPayment,
      memo: memo,
      senderPublicKey: senderPublicKey,
      expiryTime: expiryTime != null
          ? Timestamp.fromDateTime(expiryTime)
          : null,
    );

    validateSparkInvoiceFields(invoiceFields);

    final identityPublicKey = await config.signer.getIdentityPublicKey();
    final shouldSignInvoice =
        receiverIdentityPubkey == null ||
        receiverIdentityPubkey.toLowerCase() ==
            bytesToHex(identityPublicKey).toLowerCase();

    Uint8List? signature;
    if (shouldSignInvoice) {
      final hash = hashSparkInvoice(
        invoiceFields,
        identityPublicKey,
        config.getNetwork(),
      );
      signature = await config.signer.signSchnorrWithIdentityKey(hash);
    }

    return encodeSparkAddressWithSignature(
      SparkAddressData(
        identityPublicKey:
            receiverIdentityPubkey ?? bytesToHex(identityPublicKey),
        network: config.getNetwork(),
        sparkInvoiceFields: invoiceFields,
      ),
      signature,
    );
  }

  Future<String> createTokensInvoice({
    BigInt? amount,
    String? tokenIdentifier, // Bech32mTokenIdentifier equivalent
    String? memo,
    String? senderSparkAddress,
    DateTime? expiryTime,
  }) async {
    // 2^128 - 1
    final BigInt maxUint128 = BigInt.parse(
      "340282366920938463463374607431768211455",
    );

    if (amount != null && (amount < BigInt.zero || amount > maxUint128)) {
      throw SparkValidationError(
        "Amount must be between 0 and $maxUint128",
        context: {
          "field": "amount",
          "value": amount,
          "expected":
              "greater than or equal to 0 and less than or equal to $maxUint128",
        },
      );
    }

    Uint8List? decodedTokenIdentifier;
    if (tokenIdentifier != null) {
      decodedTokenIdentifier = decodeBech32mTokenIdentifier(
        tokenIdentifier,
        network: config.getNetwork(),
      ).tokenIdentifier;
    }

    final protoPayment = TokensPayment(
      tokenIdentifier: decodedTokenIdentifier,
      amount: amount != null ? numberToVarBytesBE(amount) : null,
    );

    Uint8List? senderPublicKey;
    if (senderSparkAddress != null) {
      senderPublicKey = hexToBytes(
        decodeSparkAddress(
          senderSparkAddress,
          config.getNetwork(),
        ).identityPublicKey,
      );
    }

    final invoiceFields = SparkInvoiceFields(
      version: 1,
      id: _generateUuidV7().toBytes(),
      tokensPayment: protoPayment,
      memo: memo,
      senderPublicKey: senderPublicKey,
      expiryTime: expiryTime != null
          ? Timestamp.fromDateTime(expiryTime)
          : null,
    );

    validateSparkInvoiceFields(invoiceFields);

    final identityPublicKey = await config.signer.getIdentityPublicKey();
    final hash = hashSparkInvoice(
      invoiceFields,
      identityPublicKey,
      config.getNetwork(),
    );
    final signature = await config.signer.signSchnorrWithIdentityKey(hash);

    return encodeSparkAddressWithSignature(
      SparkAddressData(
        identityPublicKey: bytesToHex(identityPublicKey),
        network: config.getNetwork(),
        sparkInvoiceFields: invoiceFields,
      ),
      signature,
    );
  }

  Future<String> createUnsignedTokensInvoice({
    BigInt? amount,
    String? tokenIdentifier, // Bech32mTokenIdentifier equivalent
    String? memo,
    String? senderSparkAddress,
    DateTime? expiryTime,
  }) async {
    // 2^128 - 1
    final BigInt maxUint128 = BigInt.parse(
      "340282366920938463463374607431768211455",
    );

    if (amount != null && (amount < BigInt.zero || amount > maxUint128)) {
      throw SparkValidationError(
        "Amount must be between 0 and $maxUint128",
        context: {
          "field": "amount",
          "value": amount,
          "expected":
              "greater than or equal to 0 and less than or equal to $maxUint128",
        },
      );
    }

    Uint8List? decodedTokenIdentifier;
    if (tokenIdentifier != null) {
      decodedTokenIdentifier = decodeBech32mTokenIdentifier(
        tokenIdentifier,
        network: config.getNetwork(),
      ).tokenIdentifier;
    }

    final protoPayment = TokensPayment(
      tokenIdentifier: decodedTokenIdentifier,
      amount: amount != null ? numberToVarBytesBE(amount) : null,
    );

    Uint8List? senderPublicKey;
    if (senderSparkAddress != null) {
      senderPublicKey = hexToBytes(
        decodeSparkAddress(
          senderSparkAddress,
          config.getNetwork(),
        ).identityPublicKey,
      );
    }

    final invoiceFields = SparkInvoiceFields(
      version: 1,
      id: _generateUuidV7().toBytes(),
      tokensPayment: protoPayment,
      memo: memo,
      senderPublicKey: senderPublicKey,
      expiryTime: expiryTime != null
          ? Timestamp.fromDateTime(expiryTime)
          : null,
    );

    validateSparkInvoiceFields(invoiceFields);

    final identityPublicKey = await config.signer.getIdentityPublicKey();
    // final hash = hashSparkInvoice(
    //   invoiceFields,
    //   identityPublicKey,
    //   config.getNetwork(),
    // );
    // final signature = await config.signer.signSchnorrWithIdentityKey(hash);

    return encodeSparkAddressWithSignature(
      SparkAddressData(
        identityPublicKey: bytesToHex(identityPublicKey),
        network: config.getNetwork(),
        sparkInvoiceFields: invoiceFields,
      ),
      null,
    );
  }

  /// Using Dart 3 Records to cleanly return multiple values
  Future<({Uint8List seed, String? mnemonic, int accountNumber})>
  _resolveSeedAndMnemonic(
    dynamic mnemonicOrSeed, // String or Uint8List
    int? accountNumber,
  ) async {
    accountNumber ??= config.getNetwork() == Network.regtest ? 0 : 1;

    String? mnemonic;
    late Uint8List seed;

    if (mnemonicOrSeed == null) {
      mnemonic = await config.signer.generateMnemonic();
      seed = await config.signer.mnemonicToSeed(mnemonic);
    } else if (mnemonicOrSeed is Uint8List) {
      seed = mnemonicOrSeed;
    } else if (mnemonicOrSeed is String) {
      if (Bip39MnemonicValidator().isValid(mnemonicOrSeed)) {
        mnemonic = mnemonicOrSeed;
        seed = await config.signer.mnemonicToSeed(mnemonicOrSeed);
      } else {
        seed = hexToBytes(mnemonicOrSeed);
      }
    } else {
      throw ArgumentError('mnemonicOrSeed must be a String or Uint8List');
    }

    return (seed: seed, mnemonic: mnemonic, accountNumber: accountNumber);
  }

  Future<InitWalletResponse> _initWallet(
    dynamic mnemonicOrSeed,
    int? accountNumber,
    ConfigOptions options,
    List<({Uint8List chainCode, String path, Uint8List privateKey})>? keyset
  ) async {
    if (options.signerWithPreExistingKeys == true) {
      await _initWalletWithoutSeed();
      return InitWalletResponse(wallet: this, mnemonic: null);
    }

    final resolved = await _resolveSeedAndMnemonic(
      mnemonicOrSeed,
      accountNumber,
    );

    await _initWalletFromSeed(resolved.seed, resolved.accountNumber, keyset);

    return InitWalletResponse(mnemonic: resolved.mnemonic, wallet: this);
  }

  Future<String> _initWalletWithoutSeed() async {
    await _createClientsAndSyncWallet();

    final identityPublicKey = await config.signer.getIdentityPublicKey();

    if (identityPublicKey.isEmpty) {
      throw SparkValidationError(
        "Identity public key not found in signer",
        context: {"field": "identityPublicKey", "value": identityPublicKey},
      );
    }

    _sparkAddress = encodeSparkAddress(
      SparkAddressData(
        identityPublicKey: bytesToHex(identityPublicKey),
        network: config.getNetwork(),
      ),
    );

    return _sparkAddress!;
  }

  Future<String> _initWalletFromSeed(
    dynamic seed,
    int? accountNumber,
    List<({Uint8List chainCode, String path, Uint8List privateKey})>? keyset,
  ) async {
    final identityPublicKey = await config.signer.createSparkWalletFromSeed(
      seed,
      accountNumber: accountNumber,
      keyset: keyset,
    );
    await _createClientsAndSyncWallet();

    _sparkAddress = encodeSparkAddress(
      SparkAddressData(
        identityPublicKey:
            identityPublicKey, // assuming create returns hex or bytes appropriately
        network: config.getNetwork(),
      ),
    );

    return _sparkAddress!;
  }

  Future<LeavesSwapFeeEstimateOutput> getSwapFeeEstimate(int amountSats) async {
    final client = _getSspClient();

    final feeEstimate = await client.getSwapFeeEstimate(amountSats);
    if (feeEstimate == null) {
      throw Exception("Failed to get swap fee estimate");
    }

    return feeEstimate;
  }

  /// Utilizing Dart records or Maps. Returning a Map for easier serialization,
  /// but could easily be a typed Dart class.
  Future<({BigInt balance, BigInt owned, BigInt incoming})> getBalance() async {
    final freshLeaves = await leafManager.getLeaves(true);
    await _syncTokenOutputs();

    final freshIds = freshLeaves.map((l) => l.id).toSet();
    await leafManager.addLeaves(freshLeaves);
    await leafManager.evictStaleAvailable(freshIds);

    final available = BigInt.from(
      freshLeaves.fold(0, (sum, l) => sum + l.value.toInt()),
    );
    final owned = leafManager.getOwnedBalance();
    final incoming = leafManager.getIncomingBalance();

    return (
      balance: available,
      owned: owned,
      incoming: incoming,
      // 'tokenBalances': await _getTokenBalanceMap(),
    );
  }

  Future<Map<Bech32mTokenIdentifier, TokenBalanceInfo>> getTokenBalance() async {
    return await _getTokenBalanceMap();
  }

  Future<Map<String, dynamic>> getCachedBalance() async {
    return _buildBalanceResponse();
  }

  Future<Map<String, dynamic>> _buildBalanceResponse() async {
    final available = leafManager.getAvailableBalance();
    return {
      'balance': available,
      'satsBalance': {
        'available': available,
        'owned': leafManager.getOwnedBalance(),
        'incoming': leafManager.getIncomingBalance(),
      },
      'tokenBalances': await _getTokenBalanceMap(),
    };
  }

  Future<TokenBalanceMap> _getTokenBalanceMap() async {
    final hasTokenOutputs = !(await tokenOutputManager.isEmpty());
    return hasTokenOutputs ? await _getTokenBalance() : {};
  }

  Future<Map<String, UserTokenMetadata>> _getTokenMetadata() async {
    final tokenIdentifierKeys = await tokenOutputManager.getTokenIdentifiers();
    final List<String> metadataToFetch = [];

    for (final tokenIdentifier in tokenIdentifierKeys) {
      if (!tokenMetadata.containsKey(tokenIdentifier)) {
        metadataToFetch.add(tokenIdentifier);
      }
    }

    if (metadataToFetch.isNotEmpty) {
      final sparkTokenClient = await connectionManager.createSparkTokenClient(
        config.getCoordinatorAddress(),
      );

      try {
        final rawIdentifiers = metadataToFetch
            .map(
              (id) => decodeBech32mTokenIdentifier(
                id,
                network: config.getNetwork(),
              ).tokenIdentifier,
            )
            .toList();

        final response = await sparkTokenClient.query_token_metadata(
          QueryTokenMetadataRequest(tokenIdentifiers: rawIdentifiers),
        );

        for (final metadata in response.tokenMetadata) {
          final tokenIdentifier = encodeBech32mTokenIdentifier(
            Bech32mTokenIdentifierData(
              tokenIdentifier: Uint8List.fromList(metadata.tokenIdentifier),
              network: config.getNetwork(),
            ),
          );
          tokenMetadata[Bech32mTokenIdentifier(tokenIdentifier)] = metadata;
        }
      } catch (error) {
        throw SparkRequestError(
          "Failed to fetch token metadata",
          context: {'error': error},
        );
      }
    }

    final Map<String, UserTokenMetadata> tokenMetadataMap = {};

    for (final entry in tokenMetadata.entries) {
      final tokenIdentifier = entry.key;
      final metadata = entry.value;

      tokenMetadataMap[tokenIdentifier] = UserTokenMetadata(
        tokenPublicKey: bytesToHex(
          Uint8List.fromList(metadata.issuerPublicKey),
        ),
        rawTokenIdentifier: Uint8List.fromList(metadata.tokenIdentifier),
        tokenName: metadata.tokenName,
        tokenTicker: metadata.tokenTicker,
        decimals: metadata.decimals,
        maxSupply: bytesToBigIntBE(metadata.maxSupply),
        extraMetadata: metadata.hasExtraMetadata()
            ? Uint8List.fromList(metadata.extraMetadata)
            : null,
      );
    }

    return tokenMetadataMap;
  }

  Future<TokenBalanceMap> _getTokenBalance() async {
    final metadataMap = await _getTokenMetadata();
    final TokenBalanceMap result = {};

    for (final entry in metadataMap.entries) {
      final tokenIdentifier = entry.key;
      final tokenMetadata = entry.value;

      final availableOutputs = await tokenOutputManager.getAvailableOutputs(
        Bech32mTokenIdentifier(tokenIdentifier),
      );

      final humanReadableTokenIdentifier = encodeBech32mTokenIdentifier(
        Bech32mTokenIdentifierData(
          tokenIdentifier: tokenMetadata.rawTokenIdentifier,
          network: config.getNetwork(),
        ),
      );

      final pendingOutputs = await tokenOutputManager.getPendingOutboundOutputs(
        Bech32mTokenIdentifier(humanReadableTokenIdentifier),
      );

      final allOutputsSum = sumTokenOutputs([
        ...availableOutputs,
        ...pendingOutputs,
      ]);
      final availableToSendBalance = sumTokenOutputs(availableOutputs);

      result[Bech32mTokenIdentifier(
        humanReadableTokenIdentifier,
      )] = TokenBalanceInfo(
        ownedBalance: allOutputsSum,
        availableToSendBalance: availableToSendBalance,
        tokenMetadata: tokenMetadata,
      );
    }

    return result;
  }

  // Placeholder missing implementation for Uuidv7
  UuidValue _generateUuidV7() {
    final uuid = Uuid();
    return uuid.v7obj();
  }

  // ===========================================================================
  // CHUNK 3: Deposit and Claim Flows
  // (Continuing inside the SparkWallet abstract class...)
  // ===========================================================================

  Future<String> getSingleUseDepositAddress() async {
    return await _generateDepositAddress();
  }

  Future<String> getStaticDepositAddress() async {
    final signingPubkey = await config.signer.getStaticDepositSigningKey(0);

    final addressResult = await depositService.generateStaticDepositAddress(
      GenerateStaticDepositAddressParams(signingPubkey: signingPubkey),
    );

    if (!addressResult.hasDepositAddress()) {
      throw SparkError("Failed to generate static deposit address", {
        'signingPubkey': signingPubkey,
      });
    }

    return addressResult.depositAddress.address;
  }

  Future<String> _generateDepositAddress() async {
    final leafId = _generateUuidV7();

    final signingPubkey = await config.signer.getPublicKeyFromDerivation(
      keyDerivation: LeafKeyDerivation(path: leafId.toString()),
    );

    final addressResult = await depositService.generateDepositAddress(
      GenerateDepositAddressParams(
        signingPubkey: signingPubkey,
        leafId: leafId.toString(),
      ),
    );

    if (!addressResult.hasDepositAddress()) {
      throw SparkRequestError(
        "Failed to generate deposit address",
        context: {'signingPubkey': signingPubkey, 'leafId': leafId},
      );
    }

    return addressResult.depositAddress.address;
  }

  Future<List<String>> queryStaticDepositAddresses() async {
    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    final identityPublicKey = await config.signer.getIdentityPublicKey();
    final networkProto =
        networkToProto[config.getNetwork()]; // Assumes utility exists

    final response = await sparkClient.query_static_deposit_addresses(
      QueryStaticDepositAddressesRequest(
        identityPublicKey: identityPublicKey,
        network: networkProto,
      ),
    );

    return response.depositAddresses
        .map((addr) => addr.depositAddress)
        .toList();
  }

  Future<List<UTXO>> getUtxosForDepositAddress(
    String depositAddress, {
    int limit = 100,
    int offset = 0,
    bool excludeClaimed = false,
  }) async {
    if (depositAddress.isEmpty) {
      throw SparkValidationError(
        "Deposit address cannot be empty",
        context: {"field": "depositAddress"},
      );
    }

    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    try {
      final response = await sparkClient.get_utxos_for_address(
        GetUtxosForAddressRequest(
          address: depositAddress,
          network: networkToProto[config.getNetwork()],
          limit: $fixnum.Int64(limit),
          offset: $fixnum.Int64(offset),
          excludeClaimed: excludeClaimed,
        ),
      );

      return response.utxos
          .map((utxo) => UTXO(txid: utxo.txid, vout: utxo.vout))
          .toList();
    } catch (error) {
      throw SparkRequestError(
        "Failed to get UTXOs for deposit address",
        context: {'operation': "get_utxos_for_address", 'error': error},
      );
    }
  }

  Future<Map<String, dynamic>> getUtxosForIdentity({
    WalletGetUtxosForIdentityParams? params,
  }) async {
    params ??= WalletGetUtxosForIdentityParams();
    final identityPublicKey = params.identityPublicKey;
    final pageSize = params.pageSize ?? 50;
    final cursor = params.cursor ?? "";
    final direction = params.direction ?? "NEXT";
    final excludeClaimed = params.excludeClaimed ?? false;
    final includePending = params.includePending ?? false;

    final resolvedIdentityPublicKey =
        identityPublicKey ??
        bytesToHex(await config.signer.getIdentityPublicKey());

    if (pageSize <= 0) {
      throw SparkValidationError(
        "Page size must be a positive integer",
        context: {"field": "pageSize", "value": pageSize},
      );
    }
    if (direction == "PREVIOUS") {
      throw SparkValidationError(
        "Backward pagination is not currently supported for getUtxosForIdentity",
        context: {"field": "direction"},
      );
    }

    final identityPublicKeyBytes = parseCompressedPublicKeyHex(
      resolvedIdentityPublicKey,
      field: "identityPublicKey",
    );
    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    late GetUtxosForIdentityResponse response;
    try {
      response = await sparkClient.get_utxos_for_identity(
        GetUtxosForIdentityRequest(
          identityPublicKey: identityPublicKeyBytes,
          network: networkToProto[config.getNetwork()],
          excludeClaimed: excludeClaimed,
          includePending: includePending,
          page: PageRequest(
            pageSize: pageSize,
            cursor: cursor,
            direction: Direction.NEXT,
          ),
        ),
      );
    } catch (error) {
      throw SparkRequestError(
        "Failed to get UTXOs for identity",
        context: {'operation': "get_utxos_for_identity", 'error': error},
      );
    }

    return {
      'utxos': response.utxos.map((addressedUtxo) {
        if (!addressedUtxo.hasUtxo()) {
          throw SparkRequestError(
            "Malformed UTXO response payload",
            context: {
              'operation': "get_utxos_for_identity",
              'addressedUtxo': addressedUtxo,
            },
          );
        }
        return AddressedUtxo(
          address: addressedUtxo.address,
          utxo: UTXO(
            txid: addressedUtxo.utxo.txid,
            vout: addressedUtxo.utxo.vout,
          ),
          isConfirmed: addressedUtxo.isConfirmed,
        );
      }).toList(),
      'pageResponse': PageResponse(
        hasNextPage: response.page.hasNextPage,
        hasPreviousPage: response.page.hasPreviousPage,
        nextCursor: response.page.nextCursor,
        previousCursor: response.page.previousCursor,
      ),
    };
  }

  Future<StaticDepositQuoteOutput> getClaimStaticDepositQuote(
    String transactionId, [
    int? outputIndex,
  ]) async {
    final client = _getSspClient();
    var network = config.getSspNetwork();

    // if (network == BitcoinNetwork.FUTURE_VALUE) {
    //   network = BitcoinNetwork.REGTEST;
    // }

    outputIndex ??= await _getDepositTransactionVout(txid: transactionId);

    final quote = await client.getClaimDepositQuote(
      transactionId: transactionId,
      outputIndex: outputIndex,
      network: network,
    );

    if (quote == null) {
      throw Exception("Failed to get claim deposit quote");
    }

    return quote;
  }

  Future<ClaimStaticDepositOutput?> claimStaticDeposit({
    required String transactionId,
    required int creditAmountSats,
    required String sspSignature,
    int? outputIndex,
  }) async {
    if (sspClient == null) {
      throw Exception("SSP client not initialized");
    }

    outputIndex ??= await _getDepositTransactionVout(txid: transactionId);

    var network = config.getSspNetwork();
    // if (network == BitcoinNetwork.FUTURE_VALUE) {
    //   network = BitcoinNetwork.REGTEST;
    // }

    final depositSecretKeyBytes = await config.signer.getStaticDepositSecretKey(
      0,
    );
    final depositSecretKey = bytesToHex(depositSecretKeyBytes);

    final message = await _getStaticDepositSigningPayload(
      transactionId,
      outputIndex,
      network
          .toString()
          .split('.')
          .last
          .toLowerCase(), // Equivalent to network.toLowerCase()
      UtxoSwapRequestType.Fixed,
      creditAmountSats,
      sspSignature,
    );

    // Assuming sha256 is available (e.g., via package:crypto)
    final hashBuffer = Uint8List.fromList(bsll.sha256.hash(message)!);
    final signatureBytes = await config.signer.signMessageWithIdentityKey(
      hashBuffer,
    );
    final signature = bytesToHex(signatureBytes);

    final response = await sspClient!.claimStaticDeposit(
      transactionId: transactionId,
      outputIndex: outputIndex,
      network: network,
      creditAmountSats: creditAmountSats,
      depositSecretKey: depositSecretKey,
      signature: signature,
      sspSignature: sspSignature,
    );

    if (response == null) {
      throw Exception("Failed to claim static deposit");
    }

    return response;
  }

  Future<ClaimStaticDepositOutput?> claimStaticDepositWithMaxFee({
    required String transactionId,
    required int maxFee,
    int? outputIndex,
  }) async {
    final client = _getSspClient();
    var network = config.getSspNetwork();

    // if (network == BitcoinNetwork.FUTURE_VALUE) {
    //   network = BitcoinNetwork.REGTEST;
    // }

    final depositTx = await _getDepositTransaction(transactionId);

    outputIndex ??= await _getDepositTransactionVout(
      txid: transactionId,
      depositTx: depositTx,
    );

    // Assumes Transaction class has outputs.elementAtOrNull(index).amount
    final depositAmount = depositTx.outputs
        .elementAt(outputIndex)
        .amount
        .toInt();

    final quote = await client.getClaimDepositQuote(
      transactionId: transactionId,
      outputIndex: outputIndex,
      network: network,
    );

    if (quote == null) {
      throw Exception("Failed to get claim deposit quote");
    }

    final creditAmountSats = quote.creditAmountSats;
    final sspSignature = quote.signature;
    final feeCharged = depositAmount - creditAmountSats;

    if (feeCharged > maxFee) {
      throw SparkValidationError(
        "Fee larger than max fee",
        context: {"field": "feeCharged", "value": feeCharged},
      );
    }

    final response = await claimStaticDeposit(
      transactionId: transactionId,
      creditAmountSats: creditAmountSats,
      sspSignature: sspSignature,
      outputIndex: outputIndex,
    );

    if (response == null) {
      throw Exception("Failed to claim static deposit");
    }

    return response;
  }

  Future<InstantStaticDepositQuoteOutput>
  experimentalGetInstantStaticDepositQuote(
    String transactionId, {
    required String partnerId,
    int? outputIndex,
  }) async {
    final client = _getSspClient();

    outputIndex ??= await _getDepositTransactionVout(txid: transactionId);

    var network = config.getSspNetwork();
    // if (network == BitcoinNetwork.FUTURE_VALUE) {
    //   network = BitcoinNetwork.REGTEST;
    // }

    final result = await client.getInstantStaticDepositQuote(
      transactionId: transactionId,
      outputIndex: outputIndex,
      network: network,
      partnerId: partnerId,
    );

    if (result == null) {
      throw SparkRequestError(
        "Failed to get instant static deposit quote",
        context: {'transactionId': transactionId, 'outputIndex': outputIndex},
      );
    }

    return result;
  }

  Future<Map<String, String>> experimentalClaimInstantStaticDeposit({
    required StaticDepositQuote quote,
    required InstantStaticDepositPlan plan,
    required String transactionId,
    required int outputIndex,
  }) async {
    final client = _getSspClient();

    final depositSecretKeyBytes = await config.signer.getStaticDepositSecretKey(
      0,
    );
    final depositSecretKey = bytesToHex(depositSecretKeyBytes);

    var network = config.getSspNetwork();
    // if (network == BitcoinNetwork.FUTURE_VALUE) {
    //   network = BitcoinNetwork.REGTEST;
    // }
    final networkName = network.toString().split('.').last.toLowerCase();

    final creditAmountSats = quote.creditAmount.originalValue;
    final depositAmountSats = quote.depositAmount.originalValue;
    final quoteSignature = quote.quoteSignature;

    Uint8List messageHash;
    if (plan.confirmations >= 1) {
      final payload = await _getStaticDepositSigningPayload(
        transactionId,
        outputIndex,
        networkName,
        UtxoSwapRequestType.Fixed,
        creditAmountSats,
        quoteSignature,
      );
      messageHash = Uint8List.fromList(bsll.sha256.hash(payload)!);
    } else {
      final staticDepositAddress = await getStaticDepositAddress();
      messageHash = _createInstantDepositUserStatement(
        network: networkName,
        creditAmountSats: creditAmountSats,
        secondaryCreditAmountSats: 0,
        destinationAddress: staticDepositAddress,
        satsValue: depositAmountSats,
        sspSignature: hexToBytes(quoteSignature),
      );
    }

    final signatureBytes = await config.signer.signMessageWithIdentityKey(
      messageHash,
    );
    final signature = bytesToHex(signatureBytes);

    final result = await client.claimInstantStaticDeposit(
      quoteId: quote.id,
      depositSecretKey: depositSecretKey,
      signature: signature,
    );

    if (result == null) {
      throw SparkRequestError(
        "Failed to claim instant static deposit",
        context: {'quoteId': quote.id},
      );
    }

    return {'claimId': result.claimId};
  }

  Uint8List _createInstantDepositUserStatement({
    required String network,
    required int creditAmountSats,
    required int secondaryCreditAmountSats,
    required String destinationAddress,
    required int satsValue,
    required Uint8List sspSignature,
  }) {
    // Assuming newHasher is a utility that wraps sha256 incremental hashing.
    // In Dart, you might use a BytesBuilder to concatenate parts before hashing.
    final builder = BytesBuilder();
    builder.add(utf8.encode("spark"));
    builder.add(utf8.encode("claim_instant_static_deposit"));
    builder.add(utf8.encode(network));
    builder.addByte(3); // requestType = Instant

    final creditData = ByteData(8)
      ..setUint64(0, creditAmountSats, Endian.little);
    builder.add(creditData.buffer.asUint8List());

    final secCreditData = ByteData(8)
      ..setUint64(0, secondaryCreditAmountSats, Endian.little);
    builder.add(secCreditData.buffer.asUint8List());

    builder.add(utf8.encode(destinationAddress));

    final satsData = ByteData(8)..setUint64(0, satsValue, Endian.little);
    builder.add(satsData.buffer.asUint8List());

    builder.add(sspSignature);

    return Uint8List.fromList(
      bsll.sha256.hash(builder.toBytes())!,
    ); // Custom wrapper over crypto.sha256
  }

  Future<String> refundStaticDeposit({
    required String depositTransactionId,
    int? outputIndex,
    required String destinationAddress,
    @Deprecated("use satsPerVbyteFee") int? fee,
    int? satsPerVbyteFee,
  }) async {
    if (fee == null && satsPerVbyteFee == null) {
      throw SparkValidationError("Fee or satsPerVbyteFee must be provided");
    }

    if (satsPerVbyteFee != null && satsPerVbyteFee > 150) {
      throw SparkValidationError("satsPerVbyteFee must be less than 150");
    }

    final finalFee = satsPerVbyteFee != null
        ? satsPerVbyteFee *
              getTxEstimatedVbytesSizeByNumberOfInputsOutputs(1, 1)
        : fee!;

    if (finalFee < 194) {
      throw SparkValidationError(
        "Fee must be at least 194",
        context: {"field": "fee", "value": finalFee},
      );
    }

    final network = config.getNetwork();
    final networkType = networkToProto[network];
    final networkJSON = network.toString();

    final depositTx = await _getDepositTransaction(depositTransactionId);

    outputIndex ??= await _getDepositTransactionVout(
      txid: depositTransactionId,
      depositTx: depositTx,
    );

    final totalAmount = depositTx.outputs.elementAt(outputIndex).amount;
    final creditAmountSats = totalAmount.toInt() - finalFee;

    if (creditAmountSats <= 0) {
      throw SparkValidationError(
        "Fee too large. Credit amount must be greater than 0",
        context: {"field": "creditAmountSats", "value": creditAmountSats},
      );
    }

    final tx = BtcTransaction(version: [0x03, 0x00, 0x00, 0x00]);

    tx.inputs.add(TxInput(txId: depositTransactionId, txIndex: outputIndex));
    tx.witnesses.add(TxWitnessInput(stack: []));

    // Decode the address and create output script
    final addressDecoded = BitcoinAddress(
      destinationAddress,
      network: getBasedBitcoinNetwork(network),
    );
    final outputScript = addressDecoded.baseAddress.toScriptPubKey();

    tx.outputs.add(
      TxOutput(
        scriptPubKey: outputScript,
        amount: BigInt.from(creditAmountSats),
      ),
    );

    final spendTxSighash = getSigHashFromTx(
      tx,
      0,
      [depositTx.outputs.elementAt(outputIndex)],
    );

    final signingNonceCommitment = await config.signer
        .getRandomSigningCommitment();

    final signingJob = SigningJob(
      rawTx: tx.toBytes(),
      signingPublicKey: await config.signer.getStaticDepositSigningKey(0),
      signingNonceCommitment: signingNonceCommitment.commitment.toProto(),
    );

    final message = await _getStaticDepositSigningPayload(
      depositTransactionId,
      outputIndex,
      networkJSON.toLowerCase(),
      UtxoSwapRequestType.Refund,
      creditAmountSats,
      bytesToHex(spendTxSighash),
    );

    final hashBuffer = Uint8List.fromList(bsll.sha256.hash(message)!);
    final swapResponseUserSignature = await config.signer
        .signMessageWithIdentityKey(hashBuffer);

    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    final swapResponse = await sparkClient.initiate_static_deposit_utxo_refund(
      InitiateStaticDepositUtxoRefundRequest(
        onChainUtxo: UTXO(
          txid: hexToBytes(depositTransactionId),
          vout: outputIndex,
          network: networkType,
        ),
        userSignature: swapResponseUserSignature,
        refundTxSigningJob: signingJob,
      ),
    );

    if (!swapResponse.hasRequiredFields()) {
      throw Exception("Failed to initiate utxo swap");
    }

    final userSignature = await config.signer.signFrost(
      SignFrostParams(
        message: spendTxSighash,
        publicKey: Uint8List.fromList(
          swapResponse.depositAddress.verifyingPublicKey,
        ),
        keyDerivation: StaticDepositKeyDerivation(path: 0),
        selfCommitment: signingNonceCommitment,
        statechainCommitments: swapResponse
            .refundTxSigningResult
            .signingNonceCommitments
            .mapValues<ISigningCommitment>(
              (v) => ISigningCommitment(
                binding: Uint8List.fromList(v.binding),
                hiding: Uint8List.fromList(v.hiding),
              ),
            ),
        verifyingKey: Uint8List.fromList(
          swapResponse.depositAddress.verifyingPublicKey,
        ),
      ),
    );

    final signatureResult = await config.signer.aggregateFrost(
      AggregateFrostParams(
        message: spendTxSighash,
        statechainSignatures: swapResponse.refundTxSigningResult.signatureShares
            .mapValues<Uint8List>((v) => Uint8List.fromList(v)),
        statechainPublicKeys: swapResponse.refundTxSigningResult.publicKeys
            .mapValues<Uint8List>((v) => Uint8List.fromList(v)),
        verifyingKey: Uint8List.fromList(
          swapResponse.depositAddress.verifyingPublicKey,
        ),
        statechainCommitments: swapResponse
            .refundTxSigningResult
            .signingNonceCommitments
            .mapValues<ISigningCommitment>(
              (v) => ISigningCommitment(
                binding: Uint8List.fromList(v.binding),
                hiding: Uint8List.fromList(v.hiding),
              ),
            ),
        selfCommitment: signingNonceCommitment,
        publicKey: await config.signer.getStaticDepositSigningKey(0),
        selfSignature: userSignature,
      ),
    );

    tx.witnesses[0] = TxWitnessInput(stack: [hex.encode(signatureResult)]);

    return hex.encode(tx.toBytes());
  }

  Future<String> refundAndBroadcastStaticDeposit({
    required String depositTransactionId,
    int? outputIndex,
    required String destinationAddress,
    int? satsPerVbyteFee,
  }) async {
    final txHex = await refundStaticDeposit(
      depositTransactionId: depositTransactionId,
      outputIndex: outputIndex,
      destinationAddress: destinationAddress,
      satsPerVbyteFee: satsPerVbyteFee,
    );

    return await _broadcastTx(txHex);
  }

  Future<String> _broadcastTx(String txHex) async {
    if (txHex.isEmpty) {
      throw SparkValidationError(
        "Transaction hex cannot be empty",
        context: {"field": "txHex"},
      );
    }

    final baseUrl = config.getElectrsUrl();
    final headers = <String, String>{};

    if (config.getNetwork() == Network.local) {
      // Assuming a local singleton faucet implementation in Dart
      // final localFaucet = BitcoinFaucet.getInstance();
      // return await localFaucet.broadcastTx(txHex);
      throw UnimplementedError("BitcoinFaucet is not implemented");
    } else {
      if (config.getNetwork() == Network.regtest) {
        // Assuming base64Encode from dart:convert
        final auth = base64Encode(
          utf8.encode(
            "${electrsCredentials["username"]}:${electrsCredentials["password"]}",
          ),
        );
        headers['Authorization'] = 'Basic $auth';
      }

      final response = await http.post(
        Uri.parse('$baseUrl/tx'),
        headers: headers,
        body: txHex,
      );

      return response.body;
    }
  }

  Future<Uint8List> _getStaticDepositSigningPayload(
    String transactionID,
    int outputIndex,
    String network,
    UtxoSwapRequestType requestType, // Assume Enum is ported
    int creditAmountSats,
    String sspSignature,
  ) async {
    final builder = BytesBuilder();

    builder.add(utf8.encode("claim_static_deposit"));
    builder.add(utf8.encode(network));
    builder.add(utf8.encode(transactionID));

    // Dart ByteData for Little Endian writes
    final outputIndexData = ByteData(4)
      ..setUint32(0, outputIndex, Endian.little);
    builder.add(outputIndexData.buffer.asUint8List());

    int requestTypeInt;
    switch (requestType) {
      case UtxoSwapRequestType.Fixed:
        requestTypeInt = 0;
        break;
      case UtxoSwapRequestType.MaxFee:
        requestTypeInt = 1;
        break;
      case UtxoSwapRequestType.Refund:
        requestTypeInt = 2;
        break;
      default:
        requestTypeInt = 0;
    }
    builder.addByte(requestTypeInt);

    // 8-byte unsigned integer (little-endian)
    final creditAmountData = ByteData(8)
      ..setUint64(0, creditAmountSats, Endian.little);
    builder.add(creditAmountData.buffer.asUint8List());

    builder.add(hexToBytes(sspSignature));

    return builder.toBytes();
  }

  Future<int> _getDepositTransactionVout({
    required String txid,
    BtcTransaction? depositTx,
  }) async {
    depositTx ??= await _getDepositTransaction(txid);

    final staticDepositAddresses = (await queryStaticDepositAddresses())
        .toSet();

    int vout = -1;

    final targetScriptHexes = staticDepositAddresses.map((addr) {
      // Library effortlessly handles Address -> Script
      final script = BitcoinAddress(addr).baseAddress.toScriptPubKey().toHex();
      return script;
    }).toSet(); // Use a Set for instant O(1) lookups

    for (int i = 0; i < depositTx.outputs.length; i++) {
      final output = depositTx.outputs[i];

      // 2. Extract the hex of the current output's script
      final outputScriptHex = output.scriptPubKey.toHex();

      // 3. Compare the scripts directly!
      if (targetScriptHexes.contains(outputScriptHex)) {
        vout = i;
        break;
      }
    }

    if (vout == -1) {
      throw Exception("No static deposit address found");
    }

    return vout;
  }

  Future<BtcTransaction> _getDepositTransaction(String txid) async {
    if (txid.isEmpty) {
      throw SparkValidationError(
        "Transaction ID cannot be empty",
        context: {"field": "txid"},
      );
    }

    final baseUrl = config.getElectrsUrl();
    final headers = <String, String>{};
    String? txHex;

    if (config.getNetwork() == Network.local) {
      throw UnimplementedError("BitcoinFaucet not implemented");
      // final localFaucet = BitcoinFaucet.getInstance();
      // final response = await localFaucet.getRawTransaction(txid);
      // txHex = response.hex;
    } else {
      if (config.getNetwork() == Network.regtest) {
        final auth = base64Encode(
          utf8.encode(
            "${electrsCredentials["username"]}:${electrsCredentials["password"]}",
          ),
        );
        headers['Authorization'] = 'Basic $auth';
      }

      final response = await http.get(
        Uri.parse('$baseUrl/tx/$txid/hex'),
        headers: headers,
      );
      txHex = response.body;
    }

    if (txHex.isEmpty) {
      throw Exception("Transaction not found");
    }

    if (!RegExp(r'^[0-9A-Fa-f]+$').hasMatch(txHex)) {
      throw SparkValidationError(
        "Invalid transaction hex",
        context: {"field": "txHex", "value": txHex},
      );
    }

    return getTxFromRawTxHex(
      txHex,
    ); // Assumed utility returning Transaction object
  }

  Future<List<TreeNode>> _finalizeDeposit({
    required KeyDerivation keyDerivation,
    required Uint8List verifyingKey,
    required BtcTransaction depositTx,
    required int vout,
  }) async {
    // MAX_SAFE_INTEGER bounds check for web safety
    const int maxSafeInteger = 9007199254740991;
    if (vout > maxSafeInteger || vout < 0) {
      throw SparkValidationError(
        "vout must be less than 2^53",
        context: {
          "field": "vout",
          "value": vout,
          "expected": "smaller or equal to $maxSafeInteger",
        },
      );
    }

    final res = await depositService.createTreeRoot(
      CreateTreeRootParams(
        keyDerivation: keyDerivation,
        verifyingKey: verifyingKey,
        depositTx: depositTx,
        vout: vout,
      ),
    );
    return res.nodes;
  }

  Future<List<String>> getUnusedDepositAddresses() async {
    final addresses = await _queryAllUnusedDepositAddresses();
    return addresses.map((addr) => addr.depositAddress).toList();
  }

  Future<List<DepositAddressQueryResult>> _queryAllUnusedDepositAddresses({
    Uint8List? identityPublicKey,
    dynamic network, // NetworkProto
  }) async {
    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    int limit = 100;
    int offset = 0;
    final pastOffsets = <int>{};
    final List<DepositAddressQueryResult> depositAddresses = [];

    final resolvedIdentityPublicKey =
        identityPublicKey ?? await config.signer.getIdentityPublicKey();
    final resolvedNetwork = network ?? networkToProto[config.getNetwork()];

    while (offset >= 0) {
      if (pastOffsets.contains(offset)) {
        log("Warning: Offset has already been seen, stopping");
        break;
      }

      final response = await sparkClient.query_unused_deposit_addresses(
        QueryUnusedDepositAddressesRequest(
          identityPublicKey: resolvedIdentityPublicKey,
          network: resolvedNetwork,
          limit: $fixnum.Int64(limit),
          offset: $fixnum.Int64(offset),
        ),
      );

      depositAddresses.addAll(response.depositAddresses);

      pastOffsets.add(offset);
      offset = response.offset.toInt();
    }

    return depositAddresses;
  }

  Future<List<WalletLeaf>> claimDeposit(String txid) async {
    if (txid.isEmpty) {
      throw SparkValidationError(
        "Transaction ID cannot be empty",
        context: {"field": "txid"},
      );
    }

    if (!_mutexes.containsKey(txid)) {
      _mutexes[txid] = Mutex();
    }
    final mutex = _mutexes[txid]!;

    final nodes = await mutex.protect(() async {
      final baseUrl = config.getElectrsUrl();
      final headers = <String, String>{};
      String? txHex;

      if (config.getNetwork() == Network.local) {
        throw UnimplementedError("BitcoinFaucet is not implemented");
        // final localFaucet = BitcoinFaucet.getInstance();
        // final response = await localFaucet.getRawTransaction(txid);
        // txHex = response.hex;
      } else {
        if (config.getNetwork() == Network.regtest) {
          final auth = base64Encode(
            utf8.encode(
              "${electrsCredentials["username"]}:${electrsCredentials["password"]}",
            ),
          );
          headers['Authorization'] = 'Basic $auth';
        }

        final response = await http.get(
          Uri.parse('$baseUrl/tx/$txid/hex'),
          headers: headers,
        );
        txHex = response.body;
      }

      if (txHex.isEmpty) {
        throw Exception("Transaction not found");
      }

      if (!RegExp(r'^[0-9A-Fa-f]+$').hasMatch(txHex)) {
        throw SparkValidationError(
          "Invalid transaction hex",
          context: {" field": "txHex", " value": txHex},
        );
      }
      final depositTx = getTxFromRawTxHex(txHex);

      final queryResult = await _queryAllUnusedDepositAddresses(
        identityPublicKey: await config.signer.getIdentityPublicKey(),
        network: networkToProto[config.getNetwork()],
      );

      final unusedDepositAddresses = {
        for (var addr in queryResult) addr.depositAddress: addr,
      };

      final scriptHexToDepositAddress = <String, DepositAddressQueryResult>{};

      for (final entry in unusedDepositAddresses.entries) {
        final addressString = entry.key;
        final queryResult = entry.value;

        // Convert the known address to its locking script hex
        final script = BitcoinAddress(
          addressString,
          network: getBasedBitcoinNetwork(config.getNetwork()),
        ).baseAddress.toScriptPubKey();
        final scriptHex = script.toHex();

        scriptHexToDepositAddress[scriptHex] = queryResult;
      }

      DepositAddressQueryResult? depositAddress;
      int vout = 0;

      for (int i = 0; i < depositTx.outputs.length; i++) {
        final output =
            depositTx.outputs[i]; // standard index access is safe here

        // 2. Extract the hex of the current output's script
        final outputScriptHex = output.scriptPubKey.toHex();

        // 3. Check if this hex matches any of our known deposit addresses
        if (scriptHexToDepositAddress.containsKey(outputScriptHex)) {
          vout = i;
          depositAddress = scriptHexToDepositAddress[outputScriptHex];
          break;
        }
      }

      if (depositAddress == null) {
        throw SparkValidationError(
          "Deposit address has already been used",
          context: {"field": "depositAddress", "value": depositAddress},
        );
      }

      late KeyDerivation keyDerivation;
      if (!depositAddress.hasLeafId()) {
        keyDerivation = DepositKeyDerivation();
      } else {
        keyDerivation = LeafKeyDerivation(path: depositAddress.leafId);
      }

      final finalizedNodes = await _finalizeDeposit(
        keyDerivation: keyDerivation,
        verifyingKey: Uint8List.fromList(depositAddress.verifyingPublicKey),
        depositTx: depositTx,
        vout: vout,
      );

      final availableNodes = finalizedNodes
          .where((node) => node.status == "AVAILABLE")
          .toList();
      await leafManager.addLeaves(availableNodes);

      final creatingNodes = finalizedNodes
          .where((node) => node.status == "CREATING")
          .toList();
      if (creatingNodes.isNotEmpty) {
        await leafManager.addIncomingLeaves(creatingNodes, txid);
      }

      return finalizedNodes;
    });

    _mutexes.remove(txid);

    return nodes.map(mapTreeNodeToWalletLeaf).toList();
  }

  Future<List<WalletLeaf>> claimMultiUtxoDeposit(List<String> txids) async {
    if (txids.length < 2) {
      throw SparkValidationError(
        "claimMultiUtxoDeposit requires at least 2 transaction IDs",
        context: {
          "field": "txids",
          "value": txids.length,
          "expected": "At least 2 transaction IDs",
        },
      );
    }

    final sortedTxids = List<String>.from(txids)..sort();
    final mutexKey = sortedTxids.join(",");

    if (!_mutexes.containsKey(mutexKey)) {
      _mutexes[mutexKey] = Mutex();
    }
    final mutex = _mutexes[mutexKey]!;

    final nodes = await mutex.protect(() async {
      final depositTxs = await Future.wait(
        txids.map((txid) => _getDepositTransaction(txid)),
      );

      final queryResult = await _queryAllUnusedDepositAddresses(
        identityPublicKey: await config.signer.getIdentityPublicKey(),
        network: networkToProto[config.getNetwork()],
      );

      DepositAddressQueryResult? depositAddress;
      final matchedTxs = <Map<String, dynamic>>[];

      // 1. Pre-compute a map of ScriptHex -> DepositAddressQueryResult
      final scriptHexToDepositAddress = <String, DepositAddressQueryResult>{};
      for (var addr in queryResult) {
        // Convert the known address to its locking script hex
        final script = BitcoinAddress(
          addr.depositAddress,
        ).baseAddress.toScriptPubKey();
        final scriptHex = script.toHex();
        scriptHexToDepositAddress[scriptHex] = addr;
      }

      for (final depositTx in depositTxs) {
        bool found = false;

        for (int i = 0; i < depositTx.outputs.length; i++) {
          final output = depositTx
              .outputs[i]; // elementAtOrNull is safe to drop if you use standard bounds

          // 2. Extract the hex of the current output's script
          final outputScriptHex = output.scriptPubKey.toHex();

          // 3. Look it up in our pre-computed hex map
          final matchedAddr = scriptHexToDepositAddress[outputScriptHex];

          if (matchedAddr != null) {
            if (depositAddress != null &&
                depositAddress.depositAddress != matchedAddr.depositAddress) {
              throw SparkValidationError(
                "All UTXOs must be to the same deposit address for multi-UTXO claim",
                context: {
                  "field": "depositAddress",
                  "value": matchedAddr.depositAddress,
                  "expected": depositAddress.depositAddress,
                },
              );
            }
            depositAddress = matchedAddr;
            matchedTxs.add({'tx': depositTx, 'vout': i});
            found = true;
            break;
          }
        }

        if (!found) {
          throw SparkValidationError(
            "No matching unused deposit address found for transaction",
            context: {"field": "txid", "value": getTxId(depositTx)},
          );
        }
      }

      if (depositAddress == null) {
        throw SparkValidationError(
          "No matching unused deposit address found",
          context: {"field": "depositAddress"},
        );
      }

      late KeyDerivation keyDerivation;
      if (!depositAddress.hasLeafId()) {
        keyDerivation = DepositKeyDerivation();
      } else {
        keyDerivation = LeafKeyDerivation(path: depositAddress.leafId);
      }

      final res = await depositService.createTreeRootMultiUtxo(
        CreateTreeRootMultiUtxoParams(
          keyDerivation: keyDerivation,
          verifyingKey: Uint8List.fromList(depositAddress.verifyingPublicKey),
          depositTxs: matchedTxs,
        ),
      );

      final availableNodes = res.nodes
          .where((node) => node.status == "AVAILABLE")
          .toList();
      await leafManager.addLeaves(availableNodes);

      final creatingNodes = res.nodes
          .where((node) => node.status == "CREATING")
          .toList();
      if (creatingNodes.isNotEmpty) {
        await leafManager.addIncomingLeaves(creatingNodes, mutexKey);
      }

      return res.nodes;
    });

    _mutexes.remove(mutexKey);

    return nodes.map(mapTreeNodeToWalletLeaf).toList();
  }

  Future<List<TreeNode>> advancedDeposit(String txHex) async {
    final depositTx = getTxFromRawTxHex(txHex);

    final queryResult = await _queryAllUnusedDepositAddresses(
      identityPublicKey: await config.signer.getIdentityPublicKey(),
      network: networkToProto[config.getNetwork()],
    );

    // 1. Pre-compute a map of ScriptHex -> unusedDepositAddress
    final scriptHexToDepositAddress =
        {}; // Type depends on your queryResult, e.g., <String, DepositAddressQueryResult>
    for (var addr in queryResult) {
      // Convert the known address to its locking script hex
      final script = BitcoinAddress(
        addr.depositAddress,
      ).baseAddress.toScriptPubKey();
      final scriptHex = script.toHex();
      scriptHexToDepositAddress[scriptHex] = addr;
    }

    int vout = 0;
    final List<TreeNode> responses = [];

    for (int i = 0; i < depositTx.outputs.length; i++) {
      final output = depositTx.outputs[i];

      // 2. Extract the hex of the current output's script
      final outputScriptHex = output.scriptPubKey.toHex();

      // 3. Look it up in our pre-computed hex map
      final unusedDepositAddress = scriptHexToDepositAddress[outputScriptHex];

      if (unusedDepositAddress != null) {
        vout = i;
        late KeyDerivation keyDerivation;

        if (!unusedDepositAddress.hasLeafId()) {
          keyDerivation = DepositKeyDerivation();
        } else {
          keyDerivation = LeafKeyDerivation(path: unusedDepositAddress.leafId);
        }

        final response = await depositService.createTreeRoot(
          CreateTreeRootParams(
            keyDerivation: keyDerivation,
            verifyingKey: Uint8List.fromList(
              unusedDepositAddress.verifyingPublicKey,
            ),
            depositTx: depositTx,
            vout: vout,
          ),
        );
        responses.addAll(response.nodes);
      }
    }

    if (responses.isEmpty) {
      throw Exception(
        "No unused deposit address found for tx: ${getTxId(depositTx)}",
      );
    }

    return responses;
  }

  Future<WalletTransfer> transfer({
    required BigInt amountSats,
    required String receiverSparkAddress,
  }) async {
    if (receiverSparkAddress.isEmpty) {
      throw SparkValidationError(
        "Receiver Spark address cannot be empty",
        context: {"field": "receiverSparkAddress"},
      );
    }

    final receiverAddress = decodeSparkAddress(
      receiverSparkAddress,
      config.getNetwork(),
    );

    if (receiverAddress.sparkInvoiceFields != null) {
      throw SparkValidationError(
        "Spark address is a Spark invoice. Use fulfillSparkInvoice instead.",
        context: {
          "field": "receiverSparkAddress",
          "value": receiverSparkAddress,
        },
      );
    }

    final outcomes = await _transferWithInvoice([
      TransferWithInvoiceParams(
        amountSats: amountSats,
        receiverIdentityPubkey: hexToBytes(receiverAddress.identityPublicKey),
      ),
    ]);

    final outcome = outcomes.isNotEmpty ? outcomes.first : null;
    if (outcome == null) throw Exception("no transfer created");

    return switch (outcome) {
      TransferWithInvoiceSuccess(:final transfer) => transfer,
      TransferWithInvoiceFailure(:final error) => throw error,
    };
  }

  Future<WalletTransfer> transferV2({
    required List<TransferParams> receivers,
  }) async {
    if (receivers.isEmpty) {
      throw SparkValidationError(
        "transferV2 requires at least 1 receiver",
        context: {
          "field": "receivers",
          "value": receivers.length,
          "expected": ">= 1",
        },
      );
    }

    final List<Map<String, dynamic>> decodedReceivers = [];

    for (final receiver in receivers) {
      if (receiver.receiverSparkAddress.isEmpty) {
        throw SparkValidationError(
          "Receiver Spark address cannot be empty",
          context: {"field": "receiverSparkAddress"},
        );
      }

      // Dart's ints are safe up to 2^63-1 on native, 2^53-1 on web.
      // We assume standard validation here.
      if (receiver.amountSats <= BigInt.zero) {
        throw SparkValidationError(
          "Amount must be a positive integer",
          context: {"field": "amountSats", "value": receiver.amountSats},
        );
      }

      final addressData = decodeSparkAddress(
        receiver.receiverSparkAddress,
        config.getNetwork(),
      );

      if (addressData.sparkInvoiceFields != null) {
        throw SparkValidationError(
          "Spark invoices are not currently supported in multi-receiver transfers. Use plain Spark addresses.",
          context: {
            "field": "receiverSparkAddress",
            "value": receiver.receiverSparkAddress,
          },
        );
      }

      decodedReceivers.add({
        'identityPublicKey': hexToBytes(addressData.identityPublicKey),
        'amountSats': receiver.amountSats,
      });
    }

    final amountSatsArray = decodedReceivers
        .map((r) => r['amountSats'] as BigInt)
        .toList();

    return await leafManager.selectLeavesAndExecute<WalletTransfer>(
      amountSatsArray,
      (List<List<TreeNode>> selected) async {
        final List<LeafKeyTweak> allLeafKeyTweaks = [];

        for (int i = 0; i < decodedReceivers.length; i++) {
          final receiver = decodedReceivers[i];
          final leaves = selected[i];

          final leafKeyTweaks = leaves
              .map((leaf) => _toSendTweak(leaf, receiver['identityPublicKey']))
              .toList();
          allLeafKeyTweaks.addAll(leafKeyTweaks);
        }

        final transfer = await transferService.sendTransferV3(allLeafKeyTweaks);

        final signerIdentityPublicKey = await config.signer
            .getIdentityPublicKey();

        final hasSelfReceiver = decodedReceivers.any(
          (r) => ListEquality().equals(
            r['identityPublicKey'],
            signerIdentityPublicKey,
          ),
        );

        if (hasSelfReceiver) {
          final pending = await transferService.queryTransfer(transfer.id);
          if (pending != null) {
            await _claimTransfer(transfer: pending);
          }
        } else {
          await leafManager.handleTransferEvent(transfer);
        }

        return mapTransferToWalletTransfer(
          transfer,
          bytesToHex(signerIdentityPublicKey),
        );
      },
    );
  }

  Future<List<TransferWithInvoiceOutcome>> _transferWithInvoice(
    List<TransferWithInvoiceParams> params,
  ) async {
    final List<BigInt> amountSatsArray = [];

    // MAX_SAFE_INTEGER bounds check
    const int maxSafeInteger = 9007199254740991;

    for (final param in params) {
      final amountSats = param.amountSats;
      if (amountSats > BigInt.from(maxSafeInteger)) {
        throw SparkValidationError(
          "Sats amount must be less than 2^53",
          context: {
            "field": "amountSats",
            "value": amountSats,
            "expected": "smaller or equal to $maxSafeInteger",
          },
        );
      }
      if (amountSats <= BigInt.zero) {
        throw SparkValidationError(
          "Amount must be greater than 0",
          context: {"field": "amountSats", "value": amountSats},
        );
      }
      amountSatsArray.add(amountSats);
    }

    return await leafManager.selectLeavesAndExecute<
      List<TransferWithInvoiceOutcome>
    >(amountSatsArray, (List<List<TreeNode>> selected) async {
      final List<TransferJob> jobs = [];
      for (int i = 0; i < params.length; i++) {
        final param = params[i];
        final leaves = selected[i];
        final leafKeyTweaks = leaves
            .map((leaf) => _toSendTweak(leaf, param.receiverIdentityPubkey))
            .toList();

        jobs.add(
          TransferJob(
            leafKeyTweaks: leafKeyTweaks,
            receiverIdentityPubkey: param.receiverIdentityPubkey,
            sparkInvoice: param.sparkInvoice,
            param: param,
          ),
        );
      }

      final signerIdentityPublicKey = await config.signer
          .getIdentityPublicKey();

      final outcomes = await Future.wait(
        jobs.map((job) async {
          try {
            final transfer = await transferService.sendTransferWithKeyTweaks(
              job.leafKeyTweaks,
              job.sparkInvoice,
            );

            final isSelfTransfer = ListEquality().equals(
              signerIdentityPublicKey,
              job.receiverIdentityPubkey,
            );

            if (isSelfTransfer) {
              final pending = await transferService.queryTransfer(transfer.id);
              if (pending != null) {
                await _claimTransfer(transfer: pending);
              }
            } else {
              await leafManager.handleTransferEvent(transfer);
            }

            return TransferWithInvoiceSuccess(
              transfer: mapTransferToWalletTransfer(
                transfer,
                bytesToHex(await config.signer.getIdentityPublicKey()),
              ),
              param: job.param,
            );
          } catch (error) {
            final tweaks = job.leafKeyTweaks;
            leafManager.restoreLocalLockedToAvailable(
              tweaks.map((t) => t.leaf.id).toList(),
            );

            return TransferWithInvoiceFailure(
              error: error is Error
                  ? Exception(error.toString())
                  : Exception(error.toString()),
              param: job.param,
            );
          }
        }),
      );

      return outcomes;
    });
  }

  LeafKeyTweak _toSendTweak(
    TreeNode node,
    Uint8List receiverIdentityPublicKey,
  ) {
    return LeafKeyTweak(
      leaf: node,
      keyDerivation: LeafKeyDerivation(path: node.id),
      newKeyDerivation: RandomKeyDerivation(),
      receiverIdentityPublicKey: receiverIdentityPublicKey,
    );
  }

  Future<List<TreeNode>> _processClaimedTransferResults(
    List<TreeNode> result,
    Transfer transfer, [
    bool emitEvent = false,
  ]) async {
    final satsSum = result.fold(0, (sum, l) => sum + l.value.toInt());
    _logEvent(
      "processClaimedTransferResults: transfer=${transfer.id} type=${transfer.type} claimed ${result.length} leaves ($satsSum sats) ids=[${result.map((l) => l.id).join(",")}]",
    );

    result = await leafManager.registerClaimedLeaves(result, transfer.id);

    if (emitEvent &&
        transfer.type != TransferType.COUNTER_SWAP &&
        transfer.type != TransferType.COUNTER_SWAP_V3) {
      final balanceMap = await getBalance();
      emitTransferClaimed(
        transfer.id,
        balanceMap.balance,
      );
    }

    return result;
  }

  Future<List<TreeNode>> _claimTransfer({
    required Transfer transfer,
    bool emit = false,
  }) async {
    _logEvent(
      "claimTransfer: transfer=${transfer.id} type=${transfer.type} status=${transfer.status} leaves=${transfer.leaves.length}",
    );


    final result = await _claimTransferMutex.protect(() async {
      return await transferService.claimTransfer(transfer);
    });

    final results = await _processClaimedTransferResults(
      result,
      transfer,
      emit,
    );

    return results;
  }

  Future<List<String>> _claimTransfers([
    List<TransferType>? types,
    bool emit = false,
  ]) async {
    if (config.isReadOnly) {
      print('🛡️ [Read-Only] Blocked _claimTransfers');
      return [];
    }
    final transfers = await transferService.queryPendingTransfers();

    final typeStr = types != null
        ? " (filtering types=[${types.join(",")}])"
        : "";
    _logEvent(
      "claimTransfers: found ${transfers.transfers.length} pending transfers$typeStr",
    );

    final List<Future<String?>> promises = [];
    int skippedType = 0;
    int skippedStatus = 0;

    for (final transfer in transfers.transfers) {
      if (types != null && !types.contains(transfer.type)) {
        skippedType++;
        continue;
      }

      if (transfer.status !=
              TransferStatus.TRANSFER_STATUS_SENDER_KEY_TWEAKED &&
          transfer.status !=
              TransferStatus.TRANSFER_STATUS_RECEIVER_KEY_TWEAKED &&
          transfer.status !=
              TransferStatus.TRANSFER_STATUS_RECEIVER_REFUND_SIGNED &&
          transfer.status !=
              TransferStatus.TRANSFER_STATUS_RECEIVER_KEY_TWEAK_APPLIED &&
          transfer.status !=
              TransferStatus.TRANSFER_STATUS_RECEIVER_KEY_TWEAK_LOCKED) {
        skippedStatus++;
        continue;
      }

      _logEvent(
        "claimTransfers: claiming transfer=${transfer.id} type=${transfer.type} status=${transfer.status} totalValue=${transfer.totalValue}",
      );

      promises.add(
        _claimTransfer(
          transfer: transfer,
          emit: emit,
        ).then<String?>((_) => transfer.id).catchError((error) {
          log("Failed to claim transfer ${transfer.id}: $error");
          return null; // Return null instead of throwing to mimic Promise.allSettled behavior
        }),
      );
    }

    if (skippedType > 0 || skippedStatus > 0) {
      _logEvent(
        "claimTransfers: skipped $skippedType by type, $skippedStatus by status",
      );
    }

    final results = await Future.wait(promises);
    final claimed = results.where((id) => id != null).cast<String>().toList();

    _logEvent(
      "claimTransfers: completed. Claimed ${claimed.length} of ${promises.length} attempted",
    );
    return claimed;
  }

  // ***** Lightning Flow *****

  Future<LightningReceiveRequest> createLightningInvoice({
    required int amountSats,
    String? memo,
    int expirySeconds = 60 * 60 * 24 * 30, // 30 days
    bool includeSparkAddress = false,
    bool includeSparkInvoice = false,
    String? receiverIdentityPubkey,
    String? descriptionHash,
  }) async {
    Future<LightningReceiveRequest> requestLightningInvoice(
      int amountSats,
      Uint8List paymentHash, {
      String? memo,
      String? receiverIdentityPubkey,
      String? descriptionHash,
    }) async {
      return await _validateAndCreateLightningInvoice(
        amountSats: amountSats,
        paymentHashHex: bytesToHex(paymentHash),
        memo: memo,
        expirySeconds: expirySeconds,
        includeSparkAddress: includeSparkAddress,
        includeSparkInvoice: includeSparkInvoice,
        receiverIdentityPubkey: receiverIdentityPubkey,
        descriptionHash: descriptionHash,
      );
    }

    final invoice = await lightningService.createLightningInvoice(
      CreateLightningInvoiceParams(
        amountSats: amountSats,
        memo: memo,
        invoiceCreator: requestLightningInvoice,
        receiverIdentityPubkey: receiverIdentityPubkey,
        descriptionHash: descriptionHash,
      ),
    );

    return invoice;
  }

  Future<LightningReceiveRequest> _validateAndCreateLightningInvoice({
    required int amountSats,
    required String paymentHashHex,
    String? memo,
    required int expirySeconds,
    required bool includeSparkAddress,
    required bool includeSparkInvoice,
    String? receiverIdentityPubkey,
    String? descriptionHash,
  }) async {
    final client = _getSspClient();
    const int maxSafeInteger = 9007199254740991;

    if (amountSats < 0) {
      throw SparkValidationError(
        "Invalid amount",
        context: {
          "field": "amountSats",
          "value": amountSats,
          "expected": "non-negative number",
        },
      );
    }

    if (amountSats > maxSafeInteger) {
      throw SparkValidationError(
        "Sats amount must be less than 2^53",
        context: {
          "field": "amountSats",
          "value": amountSats,
          "expected": "smaller or equal to $maxSafeInteger",
        },
      );
    }

    if (expirySeconds > maxSafeInteger) {
      throw SparkValidationError(
        "Expiration time must be less than 2^53",
        context: {
          "field": "expirySeconds",
          "value": expirySeconds,
          "expected": "smaller or equal to $maxSafeInteger",
        },
      );
    }

    if (expirySeconds < 0) {
      throw SparkValidationError(
        "Invalid expiration time",
        context: {
          "field": "expirySeconds",
          "value": expirySeconds,
          "expected": "Non-negative expiration time",
        },
      );
    }

    if (memo != null && memo.length > 639) {
      throw SparkValidationError(
        "Invalid memo size",
        context: {
          "field": "memo",
          "value": memo,
          "expected": "Memo size within limits",
        },
      );
    }

    if (memo != null && descriptionHash != null) {
      throw SparkValidationError(
        "Memo and descriptionHash cannot be provided together. Please provide only one.",
        context: {
          "field": "memo",
          "value": memo,
          "expected": "Memo or descriptionHash",
        },
      );
    }

    if (includeSparkAddress && includeSparkInvoice) {
      throw SparkValidationError(
        "includeSparkAddress and includeSparkInvoice are mutually exclusive",
        context: {
          "field": "includeSparkInvoice",
          "value": includeSparkInvoice,
          "expected": "Only one of includeSparkAddress or includeSparkInvoice",
        },
      );
    }

    String? sparkInvoice;
    if (includeSparkInvoice) {
      final sparkAmount = amountSats > 0 ? amountSats : null;
      sparkInvoice = await createSatsInvoice(
        amount: sparkAmount,
        expiryTime: DateTime.now().add(Duration(seconds: expirySeconds)),
        receiverIdentityPubkey: receiverIdentityPubkey,
      );
    }

    final network = config.getNetwork();
    graph.BitcoinNetwork bitcoinNetwork = graph.BitcoinNetwork.testnet;
    if (network == Network.mainnet) {
      bitcoinNetwork = graph.BitcoinNetwork.mainnet;
    } else if (network == Network.testnet) {
      bitcoinNetwork = graph.BitcoinNetwork.testnet;
    }

    final invoice = await client.requestLightningReceive(
      amountSats: amountSats,
      network: bitcoinNetwork,
      paymentHash: paymentHashHex,
      expirySecs: expirySeconds,
      memo: memo,
      includeSparkAddress: includeSparkAddress,
      receiverIdentityPubkey: receiverIdentityPubkey,
      descriptionHash: descriptionHash,
      sparkInvoice: sparkInvoice,
    );

    if (invoice == null) {
      throw Exception("Failed to create lightning invoice");
    }

    final decodedInvoice = decodeInvoice(invoice.invoice.encodedInvoice);

    if (invoice.invoice.paymentHash != paymentHashHex ||
        decodedInvoice.paymentHash != paymentHashHex) {
      throw SparkValidationError(
        "Payment hash mismatch",
        context: {
          "field": "paymentHash",
          "value": invoice.invoice.paymentHash,
          "expected": paymentHashHex,
        },
      );
    }

    if (decodedInvoice.amountMSats == null && amountSats != 0) {
      throw SparkValidationError(
        "Amount mismatch",
        context: {
          "field": "amountMSats",
          "value": "null",
          "expected": amountSats * 1000,
        },
      );
    }

    if (decodedInvoice.amountMSats != null &&
        decodedInvoice.amountMSats != BigInt.from(amountSats * 1000)) {
      throw SparkValidationError(
        "Amount mismatch",
        context: {
          "field": "amountMSats",
          "value": decodedInvoice.amountMSats.toString(),
          "expected": amountSats * 1000,
        },
      );
    }

    if (includeSparkAddress) {
      final sparkFallbackAddress = decodedInvoice.fallbackAddress;

      if (sparkFallbackAddress == null) {
        log(
          "No spark fallback address found in lightning invoice: ${invoice.invoice.encodedInvoice}",
        );
        throw SparkValidationError(
          "No spark fallback address found in lightning invoice",
          context: {
            "field": "sparkFallbackAddress",
            "value": sparkFallbackAddress,
            "expected": "Valid spark fallback address",
          },
        );
      }

      final expectedIdentityPubkey =
          receiverIdentityPubkey ?? await getIdentityPublicKey();

      if (sparkFallbackAddress != expectedIdentityPubkey) {
        throw SparkValidationError(
          "Mismatch between spark identity embedded in lightning invoice and designated recipient spark identity",
          context: {
            "field": "sparkFallbackAddress",
            "value": sparkFallbackAddress,
            "expected": expectedIdentityPubkey,
          },
        );
      }
    } else if (includeSparkInvoice) {
      final embeddedSparkInvoice = decodedInvoice.fallbackAddress;

      if (embeddedSparkInvoice == null) {
        throw SparkValidationError(
          "No spark invoice found in lightning invoice",
          context: {
            "field": "sparkInvoice",
            "value": embeddedSparkInvoice,
            "expected": "Valid spark invoice",
          },
        );
      }

      if (embeddedSparkInvoice != sparkInvoice) {
        throw SparkValidationError(
          "Mismatch between spark invoice embedded in lightning invoice and expected spark invoice",
          context: {
            "field": "sparkInvoice",
            "value": embeddedSparkInvoice,
            "expected": sparkInvoice,
          },
        );
      }
    } else if (decodedInvoice.fallbackAddress != null) {
      throw SparkValidationError(
        "Spark fallback address found in lightning invoice but includeSparkAddress is false",
        context: {
          "field": "sparkFallbackAddress",
          "value": decodedInvoice.fallbackAddress,
        },
      );
    }

    return invoice;
  }

  // ===========================================================================
  // CHUNK 5: Lightning Payments, HTLCs, Invoice Fulfillment, and Coop Exit
  // (Continuing inside the SparkWallet abstract class...)
  // ===========================================================================

  Future<WalletTransfer?> _tryPayOverSpark(
    dynamic decodedInvoice, // DecodedInvoice
    BigInt amountSats,
    Network network,
  ) async {
    final fallbackAddress = decodedInvoice.fallbackAddress;
    if (fallbackAddress == null) {
      log("No fallback address found in invoice");
      return null;
    }

    final sparkNetwork = _tryGetNetworkFromSparkAddress(fallbackAddress);
    if (sparkNetwork != null && !_isCompatibleNetwork(network, sparkNetwork)) {
      log(
        "Spark address network $sparkNetwork incompatible with invoice network ${network.toString()}",
      );
      return null;
    }

    final networkType = sparkNetwork ?? network; // Assumed utility
    final decoded = _tryDecodeSparkAddress(fallbackAddress, networkType);

    if (decoded?.sparkInvoiceFields != null) {
      final isZeroAmountInvoice = decodedInvoice.amountMSats == null;
      _validateSparkInvoiceAmount(
        decoded!.sparkInvoiceFields,
        amountSats,
        isZeroAmountInvoice,
      );
      return await _fulfillSparkInvoiceInternal(fallbackAddress, amountSats);
    }

    if (decoded != null) {
      return await transfer(
        amountSats: amountSats,
        receiverSparkAddress: fallbackAddress,
      );
    }

    if (!isValidSparkAddressFallback(fallbackAddress)) {
      log("Invalid spark fallback address: $fallbackAddress");
      return null;
    }

    final sparkAddress = encodeSparkAddress(
      SparkAddressData(identityPublicKey: fallbackAddress, network: network),
    );
    return await transfer(
      amountSats: amountSats,
      receiverSparkAddress: sparkAddress,
    );
  }

  dynamic _tryDecodeSparkAddress(String address, dynamic networkType) {
    try {
      return decodeSparkAddress(address, networkType);
    } catch (_) {
      return null;
    }
  }

  Network? _tryGetNetworkFromSparkAddress(String address) {
    try {
      return getNetworkFromSparkAddress(address);
    } catch (_) {
      return null;
    }
  }

  bool _isCompatibleNetwork(Network invoiceNetwork, Network sparkNetwork) {
    final invoiceNetworkType = invoiceNetwork;
    if (invoiceNetworkType == sparkNetwork) return true;

    if ((invoiceNetworkType == Network.regtest ||
            invoiceNetworkType == Network.local) &&
        (sparkNetwork == Network.regtest || sparkNetwork == Network.local)) {
      return true;
    }
    return false;
  }

  void _validateSparkInvoiceAmount(
    dynamic sparkInvoiceFields,
    BigInt expectedAmountSats,
    bool isZeroAmountLightningInvoice,
  ) {
    final paymentType = sparkInvoiceFields.paymentType;
    if (paymentType?.type != "sats") {
      throw SparkValidationError(
        "Lightning invoice should only contain sats payment type",
      );
    }
    final invoiceAmount = (paymentType.amount ?? 0).toInt();
    final isZeroAmountSparkInvoice = invoiceAmount == 0;

    if (isZeroAmountSparkInvoice != isZeroAmountLightningInvoice) {
      throw SparkValidationError(
        "Zero amount mismatch. Either both or neither the lightning invoice and the spark invoice should have a zero amount",
        context: {
          "field": "isZeroAmountLightningInvoice",
          "value": isZeroAmountLightningInvoice,
          "expected": isZeroAmountSparkInvoice,
        },
      );
    }
    if (invoiceAmount != expectedAmountSats && !isZeroAmountSparkInvoice) {
      throw SparkValidationError(
        "Lightning invoice amount does not match embedded spark invoice amount",
        context: {
          "field": "amountSats",
          "value": expectedAmountSats,
          "expected": invoiceAmount,
        },
      );
    }
  }

  Future<WalletTransfer> _fulfillSparkInvoiceInternal(
    String invoice, // SparkAddressFormat
    BigInt amountSats,
  ) async {
    final result = await fulfillSparkInvoice([
      (invoice: invoice, amount: amountSats),
    ]);

    if (result.satsTransactionErrors.isNotEmpty) {
      throw result.satsTransactionErrors.first.error;
    }

    if (result.satsTransactionSuccess.isEmpty) {
      throw Exception("Failed to fulfill spark invoice");
    }

    return result.satsTransactionSuccess.first.transferResponse;
  }

  Future<LightningPaymentResponse> payLightningInvoice({
    required String invoice,
    required int maxFeeSats,
    bool preferSpark = false,
    BigInt? amountSatsToSend,
    String? idempotencyKey,
  }) async {
    final lowerInvoice = invoice.toLowerCase();

    final invoiceNetwork = getNetworkFromInvoice(lowerInvoice);
    final walletNetwork = config.getNetwork();

    final isValidNetworkForWallet =
        invoiceNetwork == walletNetwork ||
        (invoiceNetwork == Network.regtest &&
            (walletNetwork == Network.regtest ||
                walletNetwork == Network.local));

    if (!isValidNetworkForWallet) {
      throw SparkValidationError(
        "Invoice network: $invoiceNetwork does not match wallet network: $walletNetwork",
        context: {
          "field": "invoice",
          "value": invoiceNetwork,
          "expected": walletNetwork,
        },
      );
    }

    final decodedInvoice = decodeInvoice(lowerInvoice);
    final amountMSats = decodedInvoice.amountMSats;
    final isZeroAmountInvoice = amountMSats == null;

    if (!isZeroAmountInvoice && amountSatsToSend != null) {
      throw SparkValidationError(
        "Invalid amount. User can only specify amountSatsToSend for 0 amount lightning invoice",
        context: {
          "field": "amountMSats",
          "value": amountMSats.toInt(),
          "expected": "0",
        },
      );
    }

    if (isZeroAmountInvoice && amountSatsToSend == null) {
      throw SparkValidationError(
        "Invalid amount. User must specify amountSatsToSend for 0 amount lightning invoice",
        context: {"field": "amountMSats", "value": 0, "expected": "0"},
      );
    }

    final amountSats = isZeroAmountInvoice
        ? amountSatsToSend!
        : ((amountMSats + BigInt.from(999)) ~/ BigInt.from(1000)); // this is big int division with ceiling

    if (amountSats <= BigInt.zero) {
      throw SparkValidationError(
        "Invalid amount",
        context: {
          "field": "amountSats",
          "value": amountSats,
          "expected": "greater than 0",
        },
      );
    }

    final sparkFallbackAddress = decodedInvoice.fallbackAddress;
    final paymentHash = decodedInvoice.paymentHash;

    if (preferSpark && sparkFallbackAddress != null) {
      final sparkPayment = await _tryPayOverSpark(
        decodedInvoice,
        amountSats,
        invoiceNetwork!,
      );
      if (sparkPayment != null) return LightningPaymentResponse(walletTransfer: sparkPayment);
      log("No valid spark data found in invoice. Defaulting to lightning.");
    }

    final expiryTime = DateTime.now().add(const Duration(days: 16));
    final client = _getSspClient();

    final feeEstimate = await getLightningSendFeeEstimate(
      encodedInvoice: lowerInvoice,
      amountSats: isZeroAmountInvoice ? amountSatsToSend : null,
    );

    if (maxFeeSats < feeEstimate) {
      throw SparkValidationError(
        "maxFeeSats does not cover fee estimate",
        context: {
          "field": "maxFeeSats",
          "value": maxFeeSats,
          "expected": "$feeEstimate sats",
        },
      );
    }

    final totalAmount = amountSats + BigInt.from(feeEstimate);

    return await leafManager.selectLeavesAndExecute<LightningPaymentResponse>([totalAmount], (
      selected,
    ) async {
      final leaves = selected[0];
      debugPrint("Phase 1 -- leaves selection");
      for (final (index, v) in leaves.indexed){
        debugPrint("$index: ${v.id}");
        debugPrint("directFromCpfpRefundTx: ${hex.encode(v.directFromCpfpRefundTx)}");
        debugPrint("directRefundTx: ${hex.encode(v.directRefundTx)}");
        debugPrint("directTx: ${hex.encode(v.directTx)}");
        debugPrint("nodeTx: ${hex.encode(v.nodeTx)}");
        debugPrint("refundTx: ${hex.encode(v.refundTx)}");
      }
      final sspIdentityPubkey = hexToBytes(config.getSspIdentityPublicKey());

      final leavesToSend = leaves
          .map(
            (leaf) => LeafKeyTweak(
              leaf: leaf,
              keyDerivation: LeafKeyDerivation(path: leaf.id),
              newKeyDerivation: RandomKeyDerivation(),
              receiverIdentityPublicKey: sspIdentityPubkey,
            ),
          )
          .toList();

      final transferID = _generateUuidV7();

      final startTransferRequest = await transferService
          .prepareTransferForLightning(
            leavesToSend,
            hexToBytes(paymentHash),
            expiryTime,
            transferID.toString(),
          );

      final swapResponse = await lightningService.swapNodesForPreimage(
        SwapNodesForPreimageParams(
          leaves: leavesToSend,
          receiverIdentityPubkey: sspIdentityPubkey,
          paymentHash: hexToBytes(paymentHash),
          isInboundPayment: false,
          invoiceString: lowerInvoice,
          feeSats: BigInt.from(feeEstimate),
          amountSatsToSend: amountSatsToSend,
          startTransferRequest: startTransferRequest,
          expiryTime: expiryTime,
          transferID: transferID.toString(),
          idempotencyKey: idempotencyKey,
        ),
      );

      if (!swapResponse.hasTransfer()) {
        throw Exception("Failed to swap nodes for preimage");
      }

      await leafManager.handleTransferEvent(swapResponse.transfer);

      final sspResponse = await client.requestLightningSend(
        encodedInvoice: lowerInvoice,
        amountSats: isZeroAmountInvoice ? amountSatsToSend : null,
        userOutboundTransferExternalId: swapResponse.transfer.id,
      );

      if (sspResponse == null) {
        throw Exception("Failed to contact SSP");
      }

      return LightningPaymentResponse(lightningSendRequest: sspResponse);
    });
  }

  // ***** HTLC Flow *****
  Future<Transfer> createHTLC({
    required String receiverSparkAddress,
    required BigInt amountSats,
    String? preimage,
    required DateTime expiryTime,
  }) async {
    if (expiryTime.isBefore(DateTime.now())) {
      throw SparkValidationError(
        "Expiry time must be in the future",
        context: {
          "field": "expiryTime",
          "value": expiryTime,
          "expected": "greater than 0",
        },
      );
    }

    return await leafManager.selectLeavesAndExecute<Transfer>([amountSats], (
      selected,
    ) async {
      final leaves = selected[0];
      final transferID = _generateUuidV7();

      if (preimage == null) {
        final preimageBytes = await getHTLCPreimage(transferID.toString());
        preimage = bytesToHex(preimageBytes);
      }

      final paymentHash = bsll.sha256.hash((hexToBytes(preimage!)))!;

      final receiverIdentityPubkey = decodeSparkAddress(
        receiverSparkAddress,
        config.getNetwork(),
      ).identityPublicKey;

      final receiverPubkeyBytes = hexToBytes(receiverIdentityPubkey);

      final leavesToSend = leaves
          .map(
            (leaf) => LeafKeyTweak(
              leaf: leaf,
              keyDerivation: LeafKeyDerivation(path: leaf.id),
              newKeyDerivation: RandomKeyDerivation(),
              receiverIdentityPublicKey: receiverPubkeyBytes,
            ),
          )
          .toList();

      final startTransferRequest = await transferService
          .prepareTransferForLightning(
            leavesToSend,
            paymentHash,
            expiryTime,
            transferID.toString(),
          );

      final swapResponse = await lightningService.swapNodesForPreimage(
        SwapNodesForPreimageParams(
          leaves: leavesToSend,
          receiverIdentityPubkey: hexToBytes(receiverIdentityPubkey),
          paymentHash: paymentHash,
          isInboundPayment: false,
          startTransferRequest: startTransferRequest,
          expiryTime: expiryTime,
          transferID: transferID.toString(),
        ),
      );

      if (!swapResponse.hasTransfer()) {
        throw Exception("Failed to swap nodes for preimage");
      }

      await leafManager.handleTransferEvent(swapResponse.transfer);

      return swapResponse.transfer;
    });
  }

  Future<Uint8List> getHTLCPreimage(String transferID) async {
    final cleanedTransferID = transferID.trim().toLowerCase().replaceAll(
      "-",
      "",
    );
    return await config.signer.htlcHMAC(cleanedTransferID);
  }

  Future<Transfer> claimHTLC(String preimage) async {
    final bytes = hexToBytes(preimage);
    if (bytes.length != 32) {
      throw SparkValidationError(
        "Preimage must be 32 bytes",
        context: {
          "field": "preimage",
          "value": preimage,
          "expected": "32 bytes",
        },
      );
    }

    final transfer = await lightningService.providePreimage(bytes);
    // if (transfer == null) {
    //   throw Exception("Failed to provide preimage");
    // }

    final receiverIdentityPublicKey = transfer.receiverIdentityPublicKey;
    final isSelfClaim = ListEquality().equals(
      receiverIdentityPublicKey,
      await config.signer.getIdentityPublicKey(),
    );

    if (isSelfClaim) {
      await _claimTransfer(transfer: transfer, emit: true);
    }
    return transfer;
  }

  Future<String> createHTLCSenderSpendTx({
    required String htlcTx,
    required String hash,
    required String hashLockDestinationPubkey,
    required String sequenceLockDestinationPubkey,
    required int satsPerVbyteFee,
  }) async {
    final fee =
        satsPerVbyteFee * getTxEstimatedVbytesSizeByNumberOfInputsOutputs(1, 1);
    final htlxTxFromHex = BtcTransaction.deserialize(hexToBytes(htlcTx));
    final hashBytes = hexToBytes(hash);
    final hashLockDestinationPubkeyBytes = hexToBytes(
      hashLockDestinationPubkey,
    );
    final sequenceLockDestinationPubkeyBytes = hexToBytes(
      sequenceLockDestinationPubkey,
    );

    final res = createSenderSpendTx(
      htlcTx: htlxTxFromHex,
      network: config.getNetwork(),
      hash: hashBytes,
      hashLockDestinationPubkey: hashLockDestinationPubkeyBytes,
      sequenceLockDestinationPubkey: sequenceLockDestinationPubkeyBytes,
      fee: fee,
    );

    final senderSpendTx = res.senderSpendTx;

    // --- GRAB THE MISSING UTXO DATA ---
    // Look at what input 0 is spending from the previous transaction
    final spentOutputIndex =
        senderSpendTx.inputs[0].txIndex; // txIndex is 'vout' in bitcoin_base
    final spentOutput = htlxTxFromHex.outputs[spentOutputIndex];

    config.signer.signTransactionIndex(
      senderSpendTx,
      0,
      await config.signer.getIdentityPublicKey(),
      // Pass the extracted data down!
      utxoAmount: spentOutput.amount,
      utxoScript: spentOutput.scriptPubKey,
      prevOuts: [spentOutput],
    );

    return senderSpendTx.toHex();
  }

  Future<String> createHTLCReceiverSpendTx({
    required String htlcTx,
    required String hash,
    required String hashLockDestinationPubkey,
    required String sequenceLockDestinationPubkey,
    required String preimage,
    required int satsPerVbyteFee,
  }) async {
    final fee =
        satsPerVbyteFee * getTxEstimatedVbytesSizeByNumberOfInputsOutputs(1, 1);
    final htlxTxFromHex = BtcTransaction.deserialize(hexToBytes(htlcTx));
    final hashBytes = hexToBytes(hash);
    final hashLockDestinationPubkeyBytes = hexToBytes(
      hashLockDestinationPubkey,
    );
    final sequenceLockDestinationPubkeyBytes = hexToBytes(
      sequenceLockDestinationPubkey,
    );

    final res = createReceiverSpendTx(
      htlcTx: htlxTxFromHex,
      network: config.getNetwork(),
      hash: hashBytes,
      hashLockDestinationPubkey: hashLockDestinationPubkeyBytes,
      sequenceLockDestinationPubkey: sequenceLockDestinationPubkeyBytes,
      fee: fee,
    );

    final spendTx = res.spendTx;
    final controlBlockBytes = res.controlBlockBytes;
    // final leafHash = res.leafHash;
    final hashLockScript = res.hashLockScript;

    // --- 1. GRAB THE MISSING UTXO DATA (Just like last time) ---
    final spentOutputIndex = spendTx.inputs[0].txIndex;
    final spentOutput = htlxTxFromHex.outputs[spentOutputIndex];

    config.signer.signTransactionIndex(
      spendTx,
      0,
      await config.signer.getIdentityPublicKey(),
      utxoAmount: spentOutput.amount,
      utxoScript: spentOutput.scriptPubKey,
      prevOuts: [spentOutput],
      tapleafScript: TaprootLeaf(
        script: Script.deserialize(bytes: hashLockScript),
      ),
    );

    // --- 2. EXTRACT THE SIGNATURE ---
    // Our custom signer just put the raw signature into the first slot.
    final sigBytes = spendTx.witnesses[0].stack[0];

    // --- 3. CONSTRUCT THE HTLC WITNESS STACK ---
    // Taproot Script-Path requires: [Signature, Preimage, Script, ControlBlock]
    spendTx.witnesses[0] = TxWitnessInput(
      stack: [
        sigBytes,
        preimage,
        hex.encode(hashLockScript), // From your 'res' object
        hex.encode(controlBlockBytes), // From your 'res' object
      ],
    );

    return spendTx.toHex();
  }

  Future<QueryHtlcResponse> queryHTLC({
    List<String>? paymentHashes,
    PreimageRequestStatus? status,
    List<String>? transferIds,
    PreimageRequestRole matchRole =
        PreimageRequestRole.PREIMAGE_REQUEST_ROLE_RECEIVER,
    int limit = 100,
    int offset = 0,
  }) async {
    if (limit > 100 || limit < 1) {
      throw SparkValidationError(
        "Limit must be between 1 and 100 if provided.",
        context: {
          "field": "limit",
          "value": limit,
          "expected": "between 1 and 100",
        },
      );
    }
    if (offset < 0) {
      throw SparkValidationError(
        "Offset must be non-negative if provided",
        context: {
          "field": "offset",
          "value": offset,
          "expected": "non-negative",
        },
      );
    }

    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );
    final identityPublicKey = await config.signer.getIdentityPublicKey();

    try {
      return await sparkClient.query_htlc(
        QueryHtlcRequest(
          paymentHashes:
              paymentHashes?.map((hash) => hexToBytes(hash)).toList() ?? [],
          status: status,
          transferIds: transferIds ?? [],
          matchRole: matchRole,
          identityPublicKey: identityPublicKey,
          limit: $fixnum.Int64(limit),
          offset: $fixnum.Int64(offset),
        ),
      );
    } catch (error) {
      throw SparkRequestError(
        "Failed to query HTLC",
        context: {'operation': "query_htlc", 'error': error},
      );
    }
  }

  Future<FulfillSparkInvoiceResponse> fulfillSparkInvoice(
    List<({String invoice, BigInt? amount})> sparkInvoices,
  ) async {
    if (sparkInvoices.isEmpty) {
      throw SparkValidationError(
        "No Spark invoices provided",
        context: {"field": "sparkInvoices", "expected": "Non-empty array"},
      );
    }

    final satsTransactionSuccess =
        <({SparkAddressFormat invoice, WalletTransfer transferResponse})>[];
    final satsTransactionErrors =
        <({Exception error, SparkAddressFormat invoice})>[];
    final tokenTransactionSuccess =
        <
          ({
            List<SparkAddressFormat> invoices,
            Bech32mTokenIdentifier tokenIdentifier,
            String txid,
          })
        >[];
    final tokenTransactionErrors =
        <
          ({
            Exception error,
            List<SparkAddressFormat> invoices,
            Bech32mTokenIdentifier tokenIdentifier,
          })
        >[];

    final groupedResult = await _groupSparkInvoicesByPaymentType(sparkInvoices);

    if (groupedResult.invalidInvoices.isNotEmpty) {
      return FulfillSparkInvoiceResponse(
        satsTransactionSuccess: satsTransactionSuccess,
        satsTransactionErrors: satsTransactionErrors,
        tokenTransactionSuccess: tokenTransactionSuccess,
        tokenTransactionErrors: tokenTransactionErrors,
        invalidInvoices: groupedResult.invalidInvoices,
      );
    }

    if (groupedResult.tokenInvoices.isNotEmpty) {
      await _syncTokenOutputs();
      final List<Future<dynamic>> tokenTransferTasks = [];

      for (final entry in groupedResult.tokenInvoices.entries) {
        final identifierHex = entry.key;
        final decodedInvoices = entry.value;

        final tokenIdentifierBytes = hexToBytes(identifierHex);
        final tokenIdB32 = encodeBech32mTokenIdentifier(
          Bech32mTokenIdentifierData(
            tokenIdentifier: tokenIdentifierBytes,
            network: config.getNetwork(),
          ),
        );

        final receiverOutputs = decodedInvoices
            .map<ReceiverOutput>(
              (d) => ReceiverOutput(
                tokenIdentifier: Bech32mTokenIdentifier(tokenIdB32),
                tokenAmount: d.amount,
                receiverSparkAddress: d.invoice,
              ),
            )
            .toList();

        final invoices = decodedInvoices.map((d) => d.invoice).toList();
        final totalTokenAmount = receiverOutputs.fold(
          BigInt.zero,
          (sum, o) => sum + (o.tokenAmount),
        );

        tokenTransferTasks.add(() async {
          try {
            final acquiredOutputs = await tokenOutputManager.acquireOutputs(
              Bech32mTokenIdentifier(tokenIdB32),
              (available) => tokenTransactionService.selectTokenOutputs(
                available,
                totalTokenAmount,
                "SMALL_FIRST",
              ),
              "fulfill-invoice-$tokenIdB32",
            );

            final txid = await tokenTransactionService.tokenTransfer(
              tokenOutputs: {
                Bech32mTokenIdentifier(tokenIdB32): acquiredOutputs,
              },
              receiverOutputs: receiverOutputs,
              selectedOutputs: acquiredOutputs,
            );

            return {
              'ok': true,
              'tokenIdentifier': tokenIdB32,
              'invoices': invoices,
              'txid': txid,
            };
          } catch (e) {
            return {
              'ok': false,
              'tokenIdentifier': tokenIdB32,
              'invoices': invoices,
              'error': e is Error
                  ? Exception(e.toString())
                  : Exception(e.toString()),
            };
          }
        }());
      }

      final results = await Future.wait(tokenTransferTasks);
      for (final r in results) {
        if (r['ok']) {
          tokenTransactionSuccess.add(
            (
              invoices: r['invoices'] as List<SparkAddressFormat>,
              tokenIdentifier: Bech32mTokenIdentifier(r['tokenIdentifier'] as String),
              txid: r['txid'] as String,
            )
          );
        } else {
          tokenTransactionErrors.add(
            (
              invoices: r['invoices'] as List<SparkAddressFormat>,
              tokenIdentifier: Bech32mTokenIdentifier(r['tokenIdentifier'] as String),
              error: r['error'] as Exception,
            )
          );
        }
      }
    }

    if (groupedResult.satsInvoices.isNotEmpty) {
      final transfers = await _transferWithInvoice(groupedResult.satsInvoices);
      for (final transfer in transfers) {
        if (transfer is TransferWithInvoiceSuccess) {
          satsTransactionSuccess.add((
            invoice: (transfer.param.sparkInvoice != null)
                ? SparkAddressFormat(transfer.param.sparkInvoice!)
                : SparkAddressFormat(""),
            transferResponse: transfer.transfer,
          ));
        } else {
          satsTransactionErrors.add((
            invoice: (transfer.param.sparkInvoice != null)
                ? SparkAddressFormat(transfer.param.sparkInvoice!)
                : SparkAddressFormat(""),
            error: (transfer as TransferWithInvoiceFailure).error,
          ));
        }
      }
    }

    return FulfillSparkInvoiceResponse(
      satsTransactionSuccess: satsTransactionSuccess,
      satsTransactionErrors: satsTransactionErrors,
      tokenTransactionSuccess: tokenTransactionSuccess,
      tokenTransactionErrors: tokenTransactionErrors,
      invalidInvoices: groupedResult.invalidInvoices,
    );
  }

  Future<GroupSparkInvoicesResult> _groupSparkInvoicesByPaymentType(
    List<({String invoice, BigInt? amount})> sparkInvoices,
  ) async {
    final satsInvoices = <TransferWithInvoiceParams>[];
    final tokenInvoices = <String, List<TokenInvoice>>{};
    final invalidInvoices = <InvalidInvoice>[];

    final identityPublicKey = await getIdentityPublicKey();

    for (final input in sparkInvoices) {
      final invoice = input.invoice;
      final amount = input.amount;

      if (isLegacySparkAddress(invoice)) {
        invalidInvoices.add(
          InvalidInvoice(
            invoice: SparkAddressFormat(invoice),
            error: SparkValidationError(
              "Deprecated spark invoice format",
              context: {"field": "invoice", "value": invoice},
            ),
          ),
        );
        continue;
      }

      final addressData = decodeSparkAddress(invoice, config.getNetwork());
      if (addressData.sparkInvoiceFields == null) {
        invalidInvoices.add(
          InvalidInvoice(
            invoice: SparkAddressFormat(invoice),
            error: SparkValidationError(
              "Missing invoice fields",
              context: {"field": "invoice", "value": invoice},
            ),
          ),
        );
        continue;
      }

      final fields = addressData.sparkInvoiceFields;

      if (fields?.expiryTime != null) {
        if (fields!.expiryTime!.isBefore(DateTime.now())) {
          invalidInvoices.add(
            InvalidInvoice(
              invoice: SparkAddressFormat(invoice),
              error: SparkValidationError(
                "Invoice expired",
                context: {"field": "invoice", "value": fields.expiryTime},
              ),
            ),
          );
          continue;
        }
      }

      if (fields?.senderPublicKey != null &&
          fields!.senderPublicKey != identityPublicKey) {
        invalidInvoices.add(
          InvalidInvoice(
            invoice: SparkAddressFormat(invoice),
            error: SparkValidationError(
              "Sender public key mismatch",
              context: {"field": "invoice"},
            ),
          ),
        );
        continue;
      }

      if (fields?.paymentType?.type == "sats") {
        final encodedAmount = fields!.paymentType!.amount;
        // In Dart BigInt handles safe integers inherently
        if (encodedAmount == null && amount == null) {
          invalidInvoices.add(
            InvalidInvoice(
              invoice: SparkAddressFormat(invoice),
              error: SparkValidationError(
                "No amount passed for nil amount invoice",
                context: {"field": "invoice"},
              ),
            ),
          );
          continue;
        }
        satsInvoices.add(
          TransferWithInvoiceParams(
            amountSats: encodedAmount ?? amount!,
            receiverIdentityPubkey: hexToBytes(addressData.identityPublicKey),
            sparkInvoice: SparkAddressFormat(invoice),
          ),
        );
      } else if (fields?.paymentType?.type == "tokens") {
        final tokenIdentifierHex = fields!.paymentType!.tokenIdentifier!;
        final encodedAmount = fields.paymentType?.amount;
        if (tokenIdentifierHex.isEmpty) {
          invalidInvoices.add(
            InvalidInvoice(
              invoice: SparkAddressFormat(invoice),
              error: SparkValidationError(
                "No token identifier passed for tokens invoice",
                context: {"field": "invoice", "value": invoice},
              ),
            ),
          );
          continue;
        }
        if (encodedAmount == null && amount == null) {
          invalidInvoices.add(
            InvalidInvoice(
              invoice: SparkAddressFormat(invoice),
              error: SparkValidationError(
                "No amount passed for nil amount invoice",
                context: {"field": "invoice"},
              ),
            ),
          );
          continue;
        }

        tokenInvoices
            .putIfAbsent(tokenIdentifierHex, () => [])
            .add(
              TokenInvoice(
                invoice: SparkAddressFormat(invoice),
                identifierHex: tokenIdentifierHex,
                amount: encodedAmount ?? amount!,
              ),
            );
      } else {
        invalidInvoices.add(
          InvalidInvoice(
            invoice: SparkAddressFormat(invoice),
            error: SparkValidationError(
              "Invalid payment type",
              context: {"field": "invoice"},
            ),
          ),
        );
      }
    }

    return GroupSparkInvoicesResult(
      satsInvoices: satsInvoices,
      tokenInvoices: tokenInvoices,
      invalidInvoices: invalidInvoices,
    );
  }

  // ***** Cooperative Exit Flow *****

  Future<CoopExitRequest?> withdraw({
    required String onchainAddress,
    required ExitSpeed exitSpeed,
    CoopExitFeeQuote? feeQuote,
    BigInt? amountSats,
    BigInt? feeAmountSats,
    String? feeQuoteId,
    bool deductFeeFromWithdrawalAmount = true,
  }) async {
    const int maxSafeInteger = 9007199254740991;
    if (amountSats != null && amountSats > BigInt.from(maxSafeInteger)) {
      throw SparkValidationError(
        "Sats amount must be less than 2^53",
        context: {"field": "amountSats", "value": amountSats},
      );
    }

    if (feeQuote != null) {
      switch (exitSpeed) {
        case ExitSpeed.fast:
          feeAmountSats =
              BigInt.from(feeQuote.l1BroadcastFeeFast.originalValue) +
              BigInt.from(feeQuote.userFeeFast.originalValue);
          break;
        case ExitSpeed.medium:
          feeAmountSats =
              BigInt.from(feeQuote.l1BroadcastFeeMedium.originalValue) +
              BigInt.from(feeQuote.userFeeMedium.originalValue);
          break;
        case ExitSpeed.slow:
          feeAmountSats =
              BigInt.from(feeQuote.l1BroadcastFeeSlow.originalValue) +
              BigInt.from(feeQuote.userFeeSlow.originalValue);
          break;
        default:
          throw SparkValidationError(
            "Invalid exit speed",
            context: {
              "field": "exitSpeed",
              "value": exitSpeed,
              "expected": "FAST, MEDIUM, or SLOW",
            },
          );
      }
      feeQuoteId = feeQuote.id;
    }

    if (feeAmountSats == null) {
      throw SparkValidationError(
        "No fee quote or fee amount provided",
        context: {"field": "feeQuote", "value": feeQuote},
      );
    }

    if (feeQuoteId == null) {
      throw SparkValidationError(
        "No fee quote ID provided",
        context: {"field": "feeQuoteId", "value": feeQuoteId},
      );
    }

    return await _coopExit(
      onchainAddress,
      feeAmountSats,
      feeQuoteId,
      exitSpeed,
      deductFeeFromWithdrawalAmount,
      amountSats,
    );
  }

  Future<CoopExitRequest?> _coopExit(
    String onchainAddress,
    BigInt feeAmountSats,
    String feeQuoteId,
    ExitSpeed exitSpeed,
    bool deductFeeFromWithdrawalAmount,
    BigInt? targetAmountSats,
  ) async {
    const int maxSafeInteger = 9007199254740991;
    if (targetAmountSats != null && targetAmountSats > BigInt.from(maxSafeInteger)) {
      throw SparkValidationError(
        "Sats amount must be less than 2^53",
        context: {"field": "targetAmountSats", "value": targetAmountSats},
      );
    }

    if (targetAmountSats == null) {
      deductFeeFromWithdrawalAmount = true;
    }

    Future<dynamic> executeCoopExit(
      List<TreeNode> leavesToSendToSsp,
      List<TreeNode> leavesToSendToSE,
    ) async {
      final sspPubKey = hexToBytes(config.getSspIdentityPublicKey());

      final leafKeyTweaks = [...leavesToSendToSE, ...leavesToSendToSsp]
          .map(
            (leaf) => LeafKeyTweak(
              leaf: leaf,
              keyDerivation: LeafKeyDerivation(path: leaf.id),
              newKeyDerivation: RandomKeyDerivation(),
              receiverIdentityPublicKey: sspPubKey,
            ),
          )
          .toList();

      final transferId = _generateUuidV7();

      final requestCoopExitParams = RequestCoopExitInput(
        leafExternalIds: leavesToSendToSsp.map((leaf) => leaf.id).toList(),
        withdrawalAddress: onchainAddress,
        exitSpeed: exitSpeed,
        withdrawAll: deductFeeFromWithdrawalAmount,
        userOutboundTransferExternalId: transferId.toString(),
      );

      if (!deductFeeFromWithdrawalAmount) {
        requestCoopExitParams.feeQuoteId = feeQuoteId;
        requestCoopExitParams.feeLeafExternalIds = leavesToSendToSE
            .map((leaf) => leaf.id)
            .toList();
      }

      final client = _getSspClient();
      final coopExitRequest = await client.requestCoopExit(
        requestCoopExitParams,
      );

      if (coopExitRequest?.rawConnectorTransaction == null) {
        throw Exception("Failed to request coop exit");
      }

      final connectorTx = getTxFromRawTxHex(
        coopExitRequest!.rawConnectorTransaction,
      );
      final coopExitTxId = hexToBytes(coopExitRequest.coopExitTxid);
      final connectorTxId = getTxId(connectorTx);

      final List<TxInput> connectorOutputs = [];
      for (int i = 0; i < connectorTx.outputs.length - 1; i++) {
        connectorOutputs.add(TxInput(txId: connectorTxId, txIndex: i));
      }

      final sspPubIdentityKey = hexToBytes(config.getSspIdentityPublicKey());
      final connectorTxBytes = hexToBytes(
        coopExitRequest.rawConnectorTransaction,
      );

      final transfer = await coopExitService.getConnectorRefundSignatures(
        GetConnectorRefundSignaturesParams(
          leaves: leafKeyTweaks,
          exitTxId: coopExitTxId,
          connectorOutputs: connectorOutputs,
          receiverPubKey: sspPubIdentityKey,
          transferId: transferId.toString(),
          connectorTx: connectorTxBytes,
        ),
      );

      await leafManager.handleTransferEvent(transfer.transfer);

      return await client.completeCoopExit(
        userOutboundTransferExternalId: transfer.transfer.id,
      );
    }

    if (deductFeeFromWithdrawalAmount) {
      if (targetAmountSats != null) {
        return await leafManager.selectLeavesAndExecute<
          dynamic
        >([targetAmountSats], (selected) async {
          final leavesToSendToSsp = selected[0];
          final sum = leavesToSendToSsp.fold(
            BigInt.zero,
            (acc, leaf) => acc + BigInt.parse(leaf.value.toString()),
          );
          if (feeAmountSats > sum) {
            throw SparkValidationError(
              "The fee for the withdrawal is greater than the target withdrawal amount",
              context: {"field": "fee", "value": feeAmountSats},
            );
          }
          return await executeCoopExit(leavesToSendToSsp, []);
        });
      } else {
        return await leafManager.executeWithAllLeaves((allLeaves) async {
          final sum = allLeaves.fold(
            BigInt.zero,
            (acc, leaf) => acc + BigInt.parse(leaf.value.toString()),
          );
          if (feeAmountSats > sum) {
            throw SparkValidationError(
              "The fee for the withdrawal is greater than the target withdrawal amount",
              context: {"field": "fee", "value": feeAmountSats},
            );
          }
          return await executeCoopExit(allLeaves, []);
        });
      }
    } else {
      if (targetAmountSats == null) {
        throw SparkValidationError(
          "targetAmountSats is required when deductFeeFromWithdrawalAmount is false",
          context: {"field": "targetAmountSats"},
        );
      }

      return await leafManager.selectLeavesAndExecute<dynamic>(
        [targetAmountSats, feeAmountSats],
        (selected) async {
          return await executeCoopExit(selected[0], selected[1]);
        },
      );
    }
  }

  Future<int> getLightningSendFeeEstimate({
    required String encodedInvoice,
    BigInt? amountSats,
  }) async {
    final client = _getSspClient();
    final feeEstimate = await client.getLightningSendFeeEstimate(
      encodedInvoice,
      amountSats,
    );

    if (feeEstimate == null) {
      throw Exception("Failed to get lightning send fee estimate");
    }

    print("feeEstimate.feeEstimate.originalUnit: ${feeEstimate.feeEstimate.originalUnit}");

    switch (feeEstimate.feeEstimate.originalUnit) {
      case CurrencyUnit.satoshi:
        return feeEstimate.feeEstimate.originalValue;
      case CurrencyUnit.millisatoshi:
        return (feeEstimate.feeEstimate.originalValue / 1000).ceil();
      default:
        throw Exception(
          "Unsupported fee estimate unit: ${feeEstimate.feeEstimate.originalUnit}",
        );
    }
  }

  // ===========================================================================
  // CHUNK 6: Tokens, Webhooks, Signing, Cleanup, and Tracing
  // (Closing out the SparkWallet abstract class)
  // ===========================================================================

  Future<TransferWithUserRequest?> getTransferFromSsp(String id) async {
    final client = _getSspClient();
    final transfers = await client.getTransfers([id]);
    return transfers.isNotEmpty == true ? transfers.first : null;
  }

  Future<List<WalletTransfer>> _constructTransfersWithUserRequest(
    List<Transfer> transfers,
  ) async {
    final identityPublicKey = bytesToHex(
      await config.signer.getIdentityPublicKey(),
    );

    final transferIdsToFetch = transfers
        .where(
          (transfer) => [
            TransferType.COOPERATIVE_EXIT,
            TransferType.COUNTER_SWAP_V3,
            TransferType.COUNTER_SWAP,
            TransferType.PREIMAGE_SWAP,
            TransferType.PRIMARY_SWAP_V3,
            TransferType.SWAP,
            TransferType.UTXO_SWAP,
          ].contains(transfer.type),
        )
        .map((transfer) => transfer.id)
        .toList();

    List<dynamic>? userRequests;
    if (sspClient != null && transferIdsToFetch.isNotEmpty) {
      userRequests = await sspClient!.getTransfers(transferIdsToFetch);
    }

    final userRequestsMap = <String, dynamic>{};
    for (final userRequest in userRequests ?? []) {
      if (userRequest?.sparkId != null && userRequest?.userRequest != null) {
        userRequestsMap[userRequest.sparkId] = userRequest.userRequest;
      }
    }

    return transfers
        .map(
          (transfer) => mapTransferToWalletTransfer(
            transfer,
            identityPublicKey,
            userRequestsMap[transfer.id],
          ),
        )
        .toList();
  }

  Future<WalletTransfer?> getTransfer(String id) async {
    final transfer = await transferService.queryTransfer(id);
    if (transfer == null) {
      return null;
    }

    final constructed = await _constructTransfersWithUserRequest([transfer]);
    return constructed.isNotEmpty ? constructed.first : null;
  }

  Future<({List<WalletTransfer> transfers, int offset})> getTransfers({
    int limit = 20,
    int offset = 0,
    DateTime? createdAfter,
    DateTime? createdBefore,
  }) async {
    if (createdAfter != null && createdBefore != null) {
      throw Exception(
        "createdAfter and createdBefore are mutually exclusive - only one can be specified",
      );
    }

    final transfersResponse = await transferService.queryAllTransfers(
      limit: limit,
      offset: offset,
      createdAfter: createdAfter,
      createdBefore: createdBefore,
      types: [
        TransferType.COOPERATIVE_EXIT,
        TransferType.PREIMAGE_SWAP,
        TransferType.UTXO_SWAP,
        TransferType.TRANSFER,
      ],
    );

    return (
      transfers: await _constructTransfersWithUserRequest(
        transfersResponse.transfers.toList(),
      ),
      offset: transfersResponse.offset.toInt(),
    );
  }

  // ***** Token Flow *****

  Future<void> _syncTokenOutputs([List<String>? tokenIdentifiers]) async {
    final filterByIdentifiers =
        tokenIdentifiers != null && tokenIdentifiers.isNotEmpty;

    final rawTokenIdentifiers = filterByIdentifiers
        ? tokenIdentifiers
              .map(
                (id) => decodeBech32mTokenIdentifier(
                  id,
                  network: config.getNetwork(),
                ).tokenIdentifier,
              )
              .toList()
        : null;

    final identityPublicKey = await config.signer.getIdentityPublicKey();
    final unsortedTokenOutputs = await tokenTransactionService
        .fetchOwnedTokenOutputs(
          FetchOwnedTokenOutputsParams(
            ownerPublicKeys: [identityPublicKey],
            tokenIdentifiers: rawTokenIdentifiers,
          ),
        );

    final groupedOutputs = TokenOutputsMap();

    for (final output in unsortedTokenOutputs) {
      if (!output.output.hasTokenIdentifier() || output.output.id.isEmpty) {
        throw SparkValidationError(
          "Server returned incomplete token output",
          context: {"field": "output", "value": output},
        );
      }

      final bech32mTokenIdentifier = encodeBech32mTokenIdentifier(
        Bech32mTokenIdentifierData(
          tokenIdentifier: Uint8List.fromList(output.output.tokenIdentifier),
          network: config.getNetwork(),
        ),
      );

      groupedOutputs
          .putIfAbsent(Bech32mTokenIdentifier(bech32mTokenIdentifier), () => [])
          .add(output);
    }

    await tokenOutputManager.setOutputs(
      groupedOutputs,
      filterByIdentifiers
          ? tokenIdentifiers
                .map<Bech32mTokenIdentifier>((v) => Bech32mTokenIdentifier(v))
                .toList()
          : null,
    );
  }

  Future<String?> transferTokens({
    required String tokenIdentifier,
    required BigInt tokenAmount,
    required String receiverSparkAddress,
    String outputSelectionStrategy = "SMALL_FIRST",
    List<OutputWithPreviousTransactionData>? selectedOutputs,
  }) async {
    try {
      final addressData = decodeSparkAddress(
        receiverSparkAddress,
        config.getNetwork(),
      );

      if (addressData.sparkInvoiceFields != null) {
        throw SparkValidationError(
          "Spark address is a Spark invoice. Use fulfillSparkInvoice instead.",
        );
      }

      await _syncTokenOutputs([tokenIdentifier]);

      final acquiredOutputs = await tokenOutputManager.acquireOutputs(
        Bech32mTokenIdentifier(tokenIdentifier),
        (available) {
          if (selectedOutputs != null) {
            return selectedOutputs
                .where((so) => available.any((a) => a.output.id == so.output.id))
                .toList();
          }
          return tokenTransactionService.selectTokenOutputs(
            available,
            tokenAmount,
            outputSelectionStrategy,
          );
        },
        "transfer-$tokenIdentifier",
      );

      final TokenOutputsMap tokenOutputsMap = {
        Bech32mTokenIdentifier(tokenIdentifier): acquiredOutputs,
      };

      final txHash = await tokenTransactionService.tokenTransfer(
        tokenOutputs: tokenOutputsMap,
        receiverOutputs: [
          ReceiverOutput(
            tokenIdentifier: Bech32mTokenIdentifier(tokenIdentifier),
            tokenAmount: tokenAmount,
            receiverSparkAddress: receiverSparkAddress,
          ),
        ],
        outputSelectionStrategy: outputSelectionStrategy,
        selectedOutputs: acquiredOutputs,
      );

      return txHash;
    } catch (e, stack) {
      debugPrint("transferToken failed ${e}\n${stack}");
      return null;
    }
  }

  Future<String> batchTransferTokens({
    required List<ReceiverOutput> receiverOutputs,
    String outputSelectionStrategy = "SMALL_FIRST",
    List<OutputWithPreviousTransactionData>? selectedOutputs,
  }) async {
    if (receiverOutputs.isEmpty) {
      throw SparkValidationError(
        "At least one receiver output is required",
        context: {"field": "receiverOutputs"},
      );
    }

    for (final output in receiverOutputs) {
      if ((output.tokenAmount) <= BigInt.zero) {
        throw SparkValidationError(
          "Token amount must be greater than 0",
          context: {"field": "receiverOutputs"},
        );
      }
    }

    final amountsByToken = <String, BigInt>{};
    for (final output in receiverOutputs) {
      final id = output.tokenIdentifier;
      final amount = output.tokenAmount;
      amountsByToken[id] = (amountsByToken[id] ?? BigInt.zero) + amount;
    }

    final tokenIdentifiers = amountsByToken.keys.toList();
    await _syncTokenOutputs(tokenIdentifiers);

    final acquiredByToken = <String, List<OutputWithPreviousTransactionData>>{};

    for (final tokenId in tokenIdentifiers) {
      final totalForToken = amountsByToken[tokenId]!;
      final acquiredOutputs = await tokenOutputManager.acquireOutputs(
        Bech32mTokenIdentifier(tokenId),
        (available) {
          if (selectedOutputs != null) {
            return selectedOutputs
                .where(
                  (so) => available.any((a) => a.output.id == so.output.id),
                )
                .toList();
          }
          return tokenTransactionService.selectTokenOutputs(
            available,
            totalForToken,
            outputSelectionStrategy,
          );
        },
        "batch-transfer-$tokenId",
      );
      acquiredByToken[tokenId] = acquiredOutputs;
    }

    final TokenOutputsMap tokenOutputsMap = {};
    final allAcquiredOutputs = <OutputWithPreviousTransactionData>[];

    for (final entry in acquiredByToken.entries) {
      tokenOutputsMap[Bech32mTokenIdentifier(entry.key)] = entry.value;
      allAcquiredOutputs.addAll(entry.value);
    }

    final txHash = await tokenTransactionService.tokenTransfer(
      tokenOutputs: tokenOutputsMap,
      receiverOutputs: receiverOutputs,
      outputSelectionStrategy: outputSelectionStrategy,
      selectedOutputs: allAcquiredOutputs,
    );

    return txHash;
  }

  @Deprecated(
    'Use queryTokenTransactionsWithFilters or queryTokenTransactionsByTxHashes instead',
  )
  Future<QueryTokenTransactionsResponse> queryTokenTransactions({
    List<String>? sparkAddresses,
    @Deprecated('Use sparkAddresses instead') List<String>? ownerPublicKeys,
    List<String>? issuerPublicKeys,
    List<String>? tokenTransactionHashes,
    List<String>? tokenIdentifiers,
    List<String>? outputIds,
    QueryOrder? order,
    int pageSize = 50,
    int offset = 0,
  }) async {
    return tokenTransactionService.queryTokenTransactions(
      QueryTokenTransactionsParams(
        sparkAddresses: sparkAddresses,
        ownerPublicKeys: ownerPublicKeys,
        issuerPublicKeys: issuerPublicKeys,
        tokenTransactionHashes: tokenTransactionHashes,
        tokenIdentifiers: tokenIdentifiers,
        outputIds: outputIds,
        order: order,
        pageSize: pageSize,
        offset: offset,
      ),
    );
  }

  Future<String> getTokenL1Address() async {
    return getP2WPKHAddressFromPublicKey(
      await config.signer.getIdentityPublicKey(),
      config.getNetwork(),
    );
  }

  Future<QueryTokenTransactionsResponse> queryTokenTransactionsByTxHashes(
    List<String> tokenTransactionHashes,
  ) async {
    return tokenTransactionService.queryTokenTransactionsByTxHashes(
      tokenTransactionHashes,
    );
  }

  Future<QueryTokenTransactionsResponse> queryTokenTransactionsWithFilters({
    List<String>? sparkAddresses,
    List<String>? issuerPublicKeys,
    List<String>? tokenIdentifiers,
    List<String>? outputIds,
    int? pageSize,
    String? cursor,
    QueryDirection? direction,
  }) async {
    return tokenTransactionService.queryTokenTransactionsWithFilters(
      QueryTokenTransactionsWithFiltersParams(
        sparkAddresses: sparkAddresses,
        issuerPublicKeys: issuerPublicKeys,
        tokenIdentifiers: tokenIdentifiers,
        outputIds: outputIds,
        pageSize: pageSize,
        cursor: cursor,
        direction: direction,
      ),
    );
  }

  // Internal use
  Future<Map<String, dynamic>> getTokenOutputStats(
    String tokenIdentifier,
  ) async {
    final availableOutputs = await tokenOutputManager.getAvailableOutputs(
      Bech32mTokenIdentifier(tokenIdentifier),
    );
    return {
      'outputCount': availableOutputs.length,
      'totalAmount': sumTokenOutputs(availableOutputs),
    };
  }

  Future<String> signMessageWithIdentityKey(
    String message, [
    bool compact = false,
  ]) async {
    final hash = Uint8List.fromList(bsll.sha256.hash(utf8.encode(message))!);
    final signature = await config.signer.signMessageWithIdentityKey(
      hash,
      compact: compact,
    );
    return bytesToHex(signature);
  }

  Future<bool> validateMessageWithIdentityKey(
    String message,
    dynamic signature,
  ) async {
    final hash = Uint8List.fromList(bsll.sha256.hash(utf8.encode(message))!);
    Uint8List sigBytes;
    if (signature is String) {
      sigBytes = hexToBytes(signature);
    } else if (signature is Uint8List) {
      sigBytes = signature;
    } else {
      throw ArgumentError("Signature must be a String or Uint8List");
    }
    return config.signer.validateMessageWithIdentityKey(hash, sigBytes);
  }

  // 1. ADD prevOuts TO THE SIGNATURE
  Future<String> signTransaction(
    String txHex, {
    required List<TxOutput> prevOuts, // Pass the UTXOs here!
    String keyType = "auto-detect",
  }) async {
    try {
      final tx = BtcTransaction.deserialize(hexToBytes(txHex));

      // 2. Add a safety check
      if (tx.inputs.length != prevOuts.length) {
        throw StateError(
          "The number of prevOuts must match the number of inputs.",
        );
      }

      late Uint8List publicKey;

      switch (keyType.toLowerCase()) {
        case "identity":
          publicKey = await config.signer.getIdentityPublicKey();
          break;
        case "deposit":
          publicKey = await config.signer.getDepositSigningKey();
          break;
        case "auto-detect":
        default:
          // Pass prevOuts down to the detector
          final detectedKey = await _detectKeyForTransaction(tx, prevOuts);
          if (detectedKey != null) {
            publicKey = detectedKey['publicKey']!;
          } else {
            publicKey = await config.signer.getIdentityPublicKey();
          }
          break;
      }

      int inputsSigned = 0;
      for (int i = 0; i < tx.inputs.length; i++) {
        // 3. READ THE SCRIPT FROM prevOuts, NOT THE INPUT!
        final script = prevOuts[i].scriptPubKey.toBytes();

        // Check for ephemeral anchor (OP_TRUE)
        if (script.length == 1 && script[0] == 0x51) {
          continue;
        }

        final identityScript = getP2TRScriptFromPublicKey(
          publicKey,
          config.getNetwork(),
        );

        if (bytesToHex(Uint8List.fromList(script)) ==
            bytesToHex(identityScript)) {
          try {
            // 4. Pass prevOuts down to your newly upgraded signer!
            config.signer.signTransactionIndex(
              tx,
              i,
              publicKey,
              prevOuts: prevOuts,
            );
            inputsSigned++;
          } catch (error) {
            throw SparkValidationError(
              "Failed to sign input $i: $error",
              context: {"field": "input", "value": i.toString()},
            );
          }
        }
      }

      if (inputsSigned == 0) {
        throw Exception(
          "No inputs were signed. Check that the transaction contains inputs controlled by this wallet.",
        );
      }

      // tx.finalize(); <-- DELETE THIS! We finalize directly inside signTransactionIndex now!
      return tx.toHex(); // Use toHex() for bitcoin_base
    } catch (error) {
      log("❌ Error signing transaction: $error");
      rethrow;
    }
  }

  // Update detector to accept prevOuts
  Future<Map<String, dynamic>?> _detectKeyForTransaction(
    BtcTransaction tx,
    List<TxOutput> prevOuts,
  ) async {
    try {
      final identityPubKey = await config.signer.getIdentityPublicKey();
      final depositPubKey = await config.signer.getDepositSigningKey();

      for (int i = 0; i < tx.inputs.length; i++) {
        // READ FROM prevOuts
        final script = prevOuts[i].scriptPubKey.toBytes();

        final identityScript = getP2TRScriptFromPublicKey(
          identityPubKey,
          config.getNetwork(),
        );
        final depositScript = getP2TRScriptFromPublicKey(
          depositPubKey,
          config.getNetwork(),
        );

        if (bytesToHex(Uint8List.fromList(script)) ==
            bytesToHex(identityScript)) {
          return {'publicKey': identityPubKey, 'keyType': "identity"};
        }

        if (bytesToHex(Uint8List.fromList(script)) ==
            bytesToHex(depositScript)) {
          return {'publicKey': depositPubKey, 'keyType': "deposit"};
        }
      }
      return null;
    } catch (error) {
      log("Error during key auto-detection: $error");
      return null;
    }
  }

  Future<LightningReceiveRequest?> getLightningReceiveRequest(String id) async {
    final client = _getSspClient();
    return await client.getLightningReceiveRequest(id);
  }

  Future<LightningSendRequest?> getLightningSendRequest(String id) async {
    final client = _getSspClient();
    return await client.getLightningSendRequest(id);
  }

  Future<CoopExitRequest?> getCoopExitRequest(String id) async {
    final client = _getSspClient();
    return await client.getCoopExitRequest(id);
  }

  Future<Map<String, int>> checkTimelock(String nodeId) async {
    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    try {
      final response = await sparkClient.query_nodes(
        QueryNodesRequest(
          nodeIds: TreeNodeIds(nodeIds: [nodeId]),
          includeParents: false,
          network: networkToProto[config.getNetwork()],
        ),
      );

      final node = response.nodes[nodeId];
      if (node == null) {
        throw SparkValidationError(
          "Node not found",
          context: {"field": "nodeId", "value": nodeId},
        );
      }

      // final isRootNode = node.parentNodeId.isEmpty;

      if (node.nodeTx.isEmpty) {
        throw SparkValidationError(
          "Node transaction data is missing or empty",
          context: {"field": "nodeTx"},
        );
      }

      if (node.refundTx.isEmpty) {
        throw SparkValidationError(
          "Refund transaction data is missing or empty",
          context: {"field": "refundTx"},
        );
      }

      late BtcTransaction nodeTx;
      late BtcTransaction refundTx;

      try {
        nodeTx = getTxFromRawTxBytes(Uint8List.fromList(node.nodeTx));
      } catch (error) {
        throw SparkValidationError("Failed to parse node transaction: $error");
      }

      try {
        refundTx = getTxFromRawTxBytes(Uint8List.fromList(node.refundTx));
      } catch (error) {
        throw SparkValidationError(
          "Failed to parse refund transaction: $error",
        );
      }

      final nodeInput = nodeTx.inputs.elementAtOrNull(0);
      if (nodeInput == null) {
        throw SparkValidationError("Node transaction has no inputs");
      }

      final refundInput = refundTx.inputs.elementAtOrNull(0);
      if (refundInput == null) {
        throw SparkValidationError("Refund transaction has no inputs");
      }

      if (refundInput.sequence.isEmpty) {
        throw SparkValidationError("Refund transaction has no sequence");
      }

      final nodeInputSequenceInt = Uint8List.fromList(
        nodeInput.sequence,
      ).buffer.asByteData(0).getUint32(0, Endian.little);
      final refundInputSequenceInt = Uint8List.fromList(
        refundInput.sequence,
      ).buffer.asByteData(0).getUint32(0, Endian.little);

      final nodeTimelock = nodeInputSequenceInt & 0xffff;
      final refundTimelock = refundInputSequenceInt & 0xffff;

      return {'nodeTimelock': nodeTimelock, 'refundTimelock': refundTimelock};
    } catch (error) {
      throw SparkRequestError(
        "Failed to check timelock for node $nodeId",
        context: {'operation': 'query_nodes', 'error': error},
      );
    }
  }

  void _cleanup() {
    _disposed = true;
    if (_singletonKey != null) {
      if (_instances[_singletonKey] == this) {
        _instances.remove(_singletonKey);
      }
    }
    if (_claimTransfersInterval != null) {
      _claimTransfersInterval!.cancel();
      _claimTransfersInterval = null;
    }
    if (_tokenOptimizationInterval != null) {
      _tokenOptimizationInterval!.cancel();
      _tokenOptimizationInterval = null;
    }
    if (!_streamAborted) {
      emitStreamDisconnected("Wallet cleanup requested");
      _streamAborted =
          true; // Signals the while-loop in _setupBackgroundStream to exit
    }
    removeAllListeners();
  }

  Future<void> cleanupConnections() async {
    _cleanup();
    await connectionManager.closeConnections();
  }

  static Future<void> resetInstances() async {
    final cleanups = <Future<void>>[];
    for (final wallet in _instances.values) {
      cleanups.add(wallet.cleanupConnections().catchError((_) {}));
    }
    await Future.wait(cleanups);
    _instances.clear();
    _initMutexes.clear();
  }

  // void _startPeriodicClaimTransfers() {
  //   if (_claimTransfersInterval != null) {
  //     _claimTransfersInterval!.cancel();
  //   }

  //   _claimTransfers();

  //   _claimTransfersInterval = Timer.periodic(const Duration(seconds: 10), (_) async {
  //     try {
  //       await _claimTransfers([
  //         TransferType.TRANSFER,
  //         TransferType.COOPERATIVE_EXIT,
  //         TransferType.PREIMAGE_SWAP,
  //         TransferType.UTXO_SWAP,
  //       ], true);
  //     } catch (error) {
  //       log("Error in periodic transfer claiming: $error");
  //     }
  //   });
  // }

  Future<dynamic> getUserRequests([GetUserRequestsParams? params]) async {
    final client = _getSspClient();
    return await client.getUserRequests(params ?? GetUserRequestsParams());
  }

  Future<WalletSettings?> setPrivacyEnabled(bool privacyEnabled) async {
    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );
    final response = await sparkClient.update_wallet_setting(
      UpdateWalletSettingRequest(privateEnabled: privacyEnabled),
    );

    return response.hasWalletSetting()
        ? mapSettingsProtoToWalletSettings(response.walletSetting)
        : null;
  }

  Future<WalletSettings?> getWalletSettings() async {
    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );
    final response = await sparkClient.query_wallet_setting(
      QueryWalletSettingRequest(),
    );

    return response.hasWalletSetting()
        ? mapSettingsProtoToWalletSettings(response.walletSetting)
        : null;
  }

  Future<dynamic> registerSparkWalletWebhook(dynamic input) async {
    final client = _getSspClient();
    return await client.registerSparkWalletWebhook(input);
  }

  Future<dynamic> deleteSparkWalletWebhook(dynamic input) async {
    final client = _getSspClient();
    return await client.deleteSparkWalletWebhook(input);
  }

  Future<dynamic> listSparkWalletWebhooks() async {
    final client = _getSspClient();
    return await client.listSparkWalletWebhooks();
  }

  Future<bool> isOptimizationInProgress() async {
    return leafManager.isOptimizing();
  }

  Future<bool> isTokenOptimizationInProgress() async {
    return _tokenOptimizationInProgress;
  }

  List<String> getOtelTraceUrls() {
    final soConfig = config.getSigningOperators();
    final sspBaseUrl = config.getSspBaseUrl();
    final List<String> domains = [];

    for (final so in soConfig.values) {
      domains.add(so.address);
    }
    if (sspBaseUrl.isNotEmpty) {
      domains.add(sspBaseUrl);
    }
    return domains;
  }

  void _initializeTracer(SparkWallet wallet) {
    final consoleOptions = wallet.config.getConsoleOptions();
    final spanProcessors = [];
    if (consoleOptions.otel == true) {
      // spanProcessors.add(SimpleSpanProcessor(ConsoleSpanExporter()));
    }
    final traceUrls = getOtelTraceUrls();
    wallet.initializeTracerEnv(
      spanProcessors: spanProcessors,
      traceUrls: traceUrls,
    );
  }

  dynamic getTracer() {
    return null;
  }

  void initializeTracerEnv({
    required List<dynamic> spanProcessors,
    required List<String> traceUrls,
  }) {
    /* Implementation depends on Dart OTEL package */
  }

  static Future<SparkError> handlePublicMethodError(
    dynamic error, [
    SparkWallet? wallet,
    String? traceId,
  ]) async {
    final context = <String, dynamic>{};

    if (traceId != null && traceId.isNotEmpty) {
      context['traceId'] = traceId;
    }

    if (wallet != null) {
      try {
        final keyBytes = await wallet.config.signer.getIdentityPublicKey();
        context['idPubKey'] = bytesToHex(keyBytes);
      } catch (_) {
        /* Signer not initialized yet, ignore */
      }
    }

    if (error is SparkError) {
      if (context.isNotEmpty) {
        error.update(context: context);
      }
      return error;
    }

    if (error is Error || error is Exception) {
      return SparkError(error.toString(), {...context, 'error': error});
    }

    return SparkError(error.toString(), {...context, 'error': error});
  }

  String getTraceName(String methodName) {
    return "SparkWallet.$methodName";
  }

  // NOTE: Dart does not support dynamic method wrapping at runtime like JS does.
  // In a real Dart application, you would manually wrap the bodies of your public methods
  // with a try/catch -> handlePublicMethodError block, or use source generators (build_runner).
  // I have included a conceptual translation here, but `_wrapPublicMethods()` below is effectively a no-op
  // in standard compiled Dart without reflection.
  void _wrapPublicMethods() {
    // PUBLIC_SPARK_WALLET_METHODS list handling would go here via code generation in Dart.
    // log("Dart reflection not supported. Wrap public methods manually or via build_runner.");
  }

  String describeStreamEvent(SubscribeToEventsResponse data) {
    switch (data.whichEvent()) {
      case SubscribeToEventsResponse_Event.receiverTransfer:
        return "receiver_transfer";
      case SubscribeToEventsResponse_Event.deposit:
        return "deposit";
      case SubscribeToEventsResponse_Event.connected:
        return "connected";
      case SubscribeToEventsResponse_Event.senderTransfer:
        return "sender_transfer";
      case SubscribeToEventsResponse_Event.heartbeat:
        return "heartbeat";
      case SubscribeToEventsResponse_Event.tokenTransaction:
        return "token_transaction";
      case SubscribeToEventsResponse_Event.notSet:
        print("$data ${data.writeToJson()}");
        return "unknown (not set)";
    }
  }

  /// Equivalent to @noble/curves numberToVarBytesBE
  Uint8List numberToVarBytesBE(BigInt n) {
    return hexToBytes(numberToHexUnpadded(n));
  }

  /// Equivalent to @noble/curves numberToHexUnpadded (and abignumber assertion)
  String numberToHexUnpadded(BigInt num) {
    // abignumber equivalent: assert positive
    if (num < BigInt.zero) {
      throw RangeError('positive bigint expected, got $num');
    }

    final String hex = num.toRadixString(16);
    // Pad with a leading zero if the length is odd
    return hex.length.isOdd ? '0$hex' : hex;
  }

  /// Equivalent to @noble/curves hexToBytes
  Uint8List hexToBytes(String hex) {
    final int hl = hex.length;
    final int al = hl ~/ 2; // integer division

    if (hl.isOdd) {
      throw RangeError('hex string expected, got unpadded hex of length $hl');
    }

    final Uint8List array = Uint8List(al);

    for (int ai = 0, hi = 0; ai < al; ai++, hi += 2) {
      final String byteString = hex.substring(hi, hi + 2);
      final int? byteValue = int.tryParse(byteString, radix: 16);

      if (byteValue == null) {
        throw RangeError(
          'hex string expected, got non-hex character "$byteString" at index $hi',
        );
      }

      array[ai] = byteValue;
    }

    return array;
  }
}