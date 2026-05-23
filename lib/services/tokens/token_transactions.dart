import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart';

import '../../errors/types.dart'; // SparkRequestError, SparkValidationError
import '../../src/proto/spark.pb.dart'; // Direction, Order
import '../../src/proto/spark_token.pbgrpc.dart'; // BroadcastTransactionResponse, CommitProgress, CommitStatus, CommitTransactionResponse, InputTtxoSignaturesPerOperator, OutputWithPreviousTransactionData, PartialTokenOutput, PartialTokenTransaction, QueryTokenTransactionsRequest, QueryTokenTransactionsResponse, SignatureWithIndex, TokenOutput, TokenTransaction
// Assuming TokenOutputsMap is mapped to Map<String, List<OutputWithPreviousTransactionData>>
import '../../spark_wallet/types.dart';
import '../../types/grpc.dart'; // SparkCallOptions
import '../../utils/address.dart'; // decodeSparkAddress, isValidPublicKey, SparkAddressFormat
import '../../utils/token_hashing.dart'; // hashFinalTokenTransaction, hashOperatorSpecificTokenTransactionSignablePayload, hashPartialTokenTransaction, hashTokenTransaction, sortInvoiceAttachments
import '../../utils/token_identifier.dart'; // Bech32mTokenIdentifier, decodeBech32mTokenIdentifier
import '../../utils/token_transaction_validation.dart'; // validateTokenTransaction
import '../../utils/token_transactions.dart'; // sumTokenOutputs
import '../config.dart'; // WalletConfigService
import '../connection/connection.dart'; // ConnectionManager
import '../wallet_config.dart'; // SigningOperator
import '../../utils/hex.dart'; // bytesToHex, hexToBytes, bytesToBigIntBE, bigIntToBytesBE

const int QUERY_TOKEN_OUTPUTS_PAGE_SIZE = 100;
const int MAX_TOKEN_OUTPUTS_TX = 500;

class FetchOwnedTokenOutputsParams {
  final List<Uint8List> ownerPublicKeys;
  final List<Uint8List>? issuerPublicKeys;
  final List<Uint8List>? tokenIdentifiers;

  FetchOwnedTokenOutputsParams({
    required this.ownerPublicKeys,
    this.issuerPublicKeys,
    this.tokenIdentifiers,
  });
}

enum QueryOrder { asc, desc }

enum QueryDirection { next, previous }

class QueryTokenTransactionsParams {
  final List<String>? sparkAddresses;
  final List<String>? ownerPublicKeys;
  final List<String>? issuerPublicKeys;
  final List<String>? tokenTransactionHashes;
  final List<String>? tokenIdentifiers;
  final List<String>? outputIds;
  final QueryOrder? order;
  final int? pageSize;
  final int? offset;

  QueryTokenTransactionsParams({
    this.sparkAddresses,
    this.ownerPublicKeys,
    this.issuerPublicKeys,
    this.tokenTransactionHashes,
    this.tokenIdentifiers,
    this.outputIds,
    this.order,
    this.pageSize,
    this.offset,
  });
}

class QueryTokenTransactionsWithFiltersParams {
  final List<String>? sparkAddresses;
  final List<String>? issuerPublicKeys;
  final List<String>? tokenIdentifiers;
  final List<String>? outputIds;
  final int? pageSize;
  final String? cursor;
  final QueryDirection? direction;

  QueryTokenTransactionsWithFiltersParams({
    this.sparkAddresses,
    this.issuerPublicKeys,
    this.tokenIdentifiers,
    this.outputIds,
    this.pageSize,
    this.cursor,
    this.direction,
  });
}

class TokenTransactionService {
  final WalletConfigService config;
  final ConnectionManager connectionManager;

  TokenTransactionService(this.config, this.connectionManager);

  Future<String> tokenTransfer({
    required TokenOutputsMap tokenOutputs,
    required List<ReceiverOutput> receiverOutputs,
    String outputSelectionStrategy = "SMALL_FIRST",
    List<OutputWithPreviousTransactionData>? selectedOutputs,
  }) async {
    if (receiverOutputs.isEmpty) {
      throw SparkValidationError(
        "No receiver outputs provided",
        context: {
          'field': "receiverOutputs",
          'value': receiverOutputs,
          'expected': "Non-empty array",
        },
      );
    }

    final receiversByToken = _groupReceiverOutputsByToken(receiverOutputs);
    late List<OutputWithPreviousTransactionData> allOutputsToUse;

    if (selectedOutputs != null) {
      allOutputsToUse = selectedOutputs;
      for (final output in selectedOutputs) {
        if (!output.hasOutput()) continue;
        final tokenId = bytesToHex(
          Uint8List.fromList(output.output.tokenIdentifier),
        );
        final bech32TokenId = _findBech32TokenIdentifier(
          tokenId,
          receiversByToken,
        );

        if (bech32TokenId == null) {
          throw SparkValidationError(
            "Selected output does not match any receiver token type",
            context: {
              'field': "selectedOutputs",
              'value': tokenId,
              'expected': "Token identifier matching one of the receivers",
            },
          );
        }
      }
    } else {
      // Select outputs for each token type
      allOutputsToUse = [];
      for (final entry in receiversByToken.entries) {
        final tokenIdentifier = entry.key;
        final receivers = entry.value;

        final totalTokenAmount = receivers.fold<BigInt>(
          BigInt.zero,
          (sum, transfer) => sum + transfer.tokenAmount,
        );

        final availableOutputs = tokenOutputs[tokenIdentifier];
        if (availableOutputs == null) {
          throw SparkValidationError(
            "No token outputs provided for receiver token type",
            context: {
              'field': "tokenOutputs",
              'value': tokenIdentifier,
              'expected': "Map entry for each receiver token identifier",
            },
          );
        }

        final selectedForToken = selectTokenOutputs(
          availableOutputs,
          totalTokenAmount,
          outputSelectionStrategy,
        );

        allOutputsToUse.addAll(selectedForToken);
      }
    }

    _validateOutputCountPerToken(allOutputsToUse);

    if (selectedOutputs != null) {
      _validateSelectedOutputInputAmounts(allOutputsToUse, receiverOutputs);
    }

    final builtData = _buildTokenOutputData(receiverOutputs);
    final tokenOutputData = builtData.tokenOutputData;
    final sparkInvoices = builtData.sparkInvoices;

    if (config.getTokenTransactionVersion() == "V2") {
      final tokenTransaction = await _constructTransferTokenTransaction(
        allOutputsToUse,
        tokenOutputData,
        sparkInvoices,
      );

      final txId = await broadcastTokenTransaction(
        tokenTransaction,
        allOutputsToUse
            .map((o) => Uint8List.fromList(o.output.ownerPublicKey))
            .toList(),
        allOutputsToUse
            .map((o) => Uint8List.fromList(o.output.revocationCommitment))
            .toList(),
      );

      return txId;
    } else {
      final partialTokenTransaction =
          await _constructPartialTransferTokenTransaction(
            allOutputsToUse,
            tokenOutputData,
            sparkInvoices,
          );

      final txId = await broadcastTokenTransactionV3(
        partialTokenTransaction,
        allOutputsToUse
            .map((o) => Uint8List.fromList(o.output.ownerPublicKey))
            .toList(),
      );

      return txId;
    }
  }

  Map<Bech32mTokenIdentifier, List<ReceiverOutput>>
  _groupReceiverOutputsByToken(List<ReceiverOutput> receiverOutputs) {
    final receiversByToken = <Bech32mTokenIdentifier, List<ReceiverOutput>>{};

    for (final receiver in receiverOutputs) {
      receiversByToken
          .putIfAbsent(receiver.tokenIdentifier, () => [])
          .add(receiver);
    }

    return receiversByToken;
  }

  BigInt bytesToBigIntBE(List<int> val) {
    BigInt result = BigInt.zero;

    for (final byte in val) {
      // Shift the accumulated result left by 1 byte (8 bits)
      // and combine it with the new byte using bitwise OR.
      //
      // We use & 0xff as a safety net to ensure we are strictly
      // grabbing 8 unsigned bits, just in case a standard List<int>
      // sneaks in a negative value or something larger than 255.
      result = (result << 8) | BigInt.from(byte & 0xff);
    }

    return result;
  }

  void _validateSelectedOutputInputAmounts(
    List<OutputWithPreviousTransactionData> selectedOutputs,
    List<ReceiverOutput> receiverOutputs,
  ) {
    final inputAmountsByToken = <String, BigInt>{};
    for (final output in selectedOutputs) {
      if (!output.hasOutput()) continue;
      final tokenId = bytesToHex(
        Uint8List.fromList(output.output.tokenIdentifier),
      );
      final currentAmount = inputAmountsByToken[tokenId] ?? BigInt.zero;
      inputAmountsByToken[tokenId] =
          currentAmount +
          bytesToBigIntBE(Uint8List.fromList(output.output.tokenAmount));
    }

    final outputAmountsByToken = <String, BigInt>{};
    for (final receiver in receiverOutputs) {
      final decoded = decodeBech32mTokenIdentifier(
        receiver.tokenIdentifier,
        network: config.getNetwork(),
      );
      final tokenId = bytesToHex(decoded.tokenIdentifier);
      final currentAmount = outputAmountsByToken[tokenId] ?? BigInt.zero;
      outputAmountsByToken[tokenId] = currentAmount + receiver.tokenAmount;
    }

    for (final entry in outputAmountsByToken.entries) {
      final tokenId = entry.key;
      final outputAmount = entry.value;
      final inputAmount = inputAmountsByToken[tokenId] ?? BigInt.zero;

      if (inputAmount < outputAmount) {
        throw SparkValidationError(
          "Insufficient input amount for token $tokenId",
          context: {
            'field': "tokenAmount",
            'value': inputAmount,
            'expected': outputAmount,
          },
        );
      }
    }
  }

  void _validateOutputCountPerToken(
    List<OutputWithPreviousTransactionData> outputsToUse,
  ) {
    final outputCountByToken = <String, int>{};

    for (final output in outputsToUse) {
      if (!output.hasOutput()) continue;
      final tokenId = bytesToHex(
        Uint8List.fromList(output.output.tokenIdentifier),
      );
      outputCountByToken[tokenId] = (outputCountByToken[tokenId] ?? 0) + 1;
    }

    for (final entry in outputCountByToken.entries) {
      final tokenId = entry.key;
      final count = entry.value;

      if (count <= MAX_TOKEN_OUTPUTS_TX) {
        continue;
      }

      throw SparkValidationError(
        "Cannot transfer more than $MAX_TOKEN_OUTPUTS_TX TTXOs for token $tokenId in a single transaction ($count selected).",
        context: {
          'field': "outputsToUse",
          'value': count,
          'expected':
              "Less than or equal to $MAX_TOKEN_OUTPUTS_TX per token type",
        },
      );
    }
  }

  ({
    List<TokenOutputData> tokenOutputData,
    List<SparkAddressFormat> sparkInvoices,
  })
  _buildTokenOutputData(List<ReceiverOutput> receiverOutputs) {
    final sparkInvoices = <SparkAddressFormat>[];

    final tokenOutputData = receiverOutputs.map((transfer) {
      final receiverAddress = decodeSparkAddress(
        transfer.receiverSparkAddress,
        config.getNetwork(),
      );

      final rawTokenIdentifier = decodeBech32mTokenIdentifier(
        transfer.tokenIdentifier,
        network: config.getNetwork(),
      ).tokenIdentifier;

      if (receiverAddress.sparkInvoiceFields != null) {
        sparkInvoices.add(SparkAddressFormat(transfer.receiverSparkAddress));
        return TokenOutputData(
          receiverPublicKey: hexToBytes(receiverAddress.identityPublicKey),
          rawTokenIdentifier: Uint8List.fromList(rawTokenIdentifier),
          tokenAmount: transfer.tokenAmount,
          sparkInvoice: transfer.receiverSparkAddress,
        );
      }

      return TokenOutputData(
        receiverPublicKey: hexToBytes(receiverAddress.identityPublicKey),
        rawTokenIdentifier: Uint8List.fromList(rawTokenIdentifier),
        tokenAmount: transfer.tokenAmount,
      );
    }).toList();

    return (tokenOutputData: tokenOutputData, sparkInvoices: sparkInvoices);
  }

  Bech32mTokenIdentifier? _findBech32TokenIdentifier(
    String hexTokenId,
    Map<Bech32mTokenIdentifier, List<dynamic>> receiversByToken,
  ) {
    for (final entry in receiversByToken.entries) {
      final bech32TokenId = entry.key;
      final decoded = decodeBech32mTokenIdentifier(
        bech32TokenId,
        network: config.getNetwork(),
      );

      if (bytesToHex(Uint8List.fromList(decoded.tokenIdentifier)) ==
          hexTokenId) {
        return bech32TokenId;
      }
    }
    return null;
  }

  Future<void> _appendChange<T>(
    Map<String, BigInt> availableByToken,
    Map<String, BigInt> requestedByToken,
    List<T> outputs,
    T Function(
      Uint8List ownerPublicKey,
      Uint8List tokenIdentifier,
      BigInt changeAmount,
    )
    buildOutput,
  ) async {
    final identityPublicKey = await config.signer.getIdentityPublicKey();
    for (final entry in availableByToken.entries) {
      final tokenId = entry.key;
      final availableAmount = entry.value;

      final requestedAmount = requestedByToken[tokenId] ?? BigInt.zero;
      if (availableAmount > requestedAmount) {
        outputs.add(
          buildOutput(
            identityPublicKey,
            hexToBytes(tokenId),
            availableAmount - requestedAmount,
          ),
        );
      }
    }
  }

  Future<TokenTransaction> _constructTransferTokenTransaction(
    List<OutputWithPreviousTransactionData> selectedOutputs,
    List<TokenOutputData> tokenOutputData, [
    List<SparkAddressFormat>? sparkInvoices,
  ]) async {
    final sortedOutputs =
        List<OutputWithPreviousTransactionData>.from(selectedOutputs)..sort(
          (a, b) =>
              a.previousTransactionVout.compareTo(b.previousTransactionVout),
        );

    // Calculate available and requested amounts per token type
    final availableByToken = <String, BigInt>{};
    for (final output in sortedOutputs) {
      if (!output.hasOutput()) continue;
      final tokenId = bytesToHex(
        Uint8List.fromList(output.output.tokenIdentifier),
      );
      final currentAmount = availableByToken[tokenId] ?? BigInt.zero;
      availableByToken[tokenId] =
          currentAmount +
          bytesToBigIntBE(Uint8List.fromList(output.output.tokenAmount));
    }

    final requestedByToken = <String, BigInt>{};
    for (final output in tokenOutputData) {
      final tokenId = bytesToHex(output.rawTokenIdentifier);
      final currentAmount = requestedByToken[tokenId] ?? BigInt.zero;
      requestedByToken[tokenId] = currentAmount + output.tokenAmount;
    }

    final tokenOutputs = tokenOutputData.map((output) {
      return TokenOutput(
        ownerPublicKey: output.receiverPublicKey,
        tokenIdentifier: output.rawTokenIdentifier,
        tokenAmount: bigIntToBytesBE(output.tokenAmount, 16),
      );
    }).toList();

    await _appendChange<TokenOutput>(
      availableByToken,
      requestedByToken,
      tokenOutputs,
      (ownerPublicKey, tokenIdentifier, changeAmount) {
        return TokenOutput(
          ownerPublicKey: ownerPublicKey,
          tokenIdentifier: tokenIdentifier,
          tokenAmount: bigIntToBytesBE(changeAmount, 16),
        );
      },
    );

    final sortedInvoiceAttachments = sparkInvoices != null
        ? sortInvoiceAttachments(
            sparkInvoices
                .map((invoice) => InvoiceAttachment(sparkInvoice: invoice))
                .toList(), // Using presumed generated InvoiceAttachment class
          )
        : <InvoiceAttachment>[];

    return TokenTransaction(
      version: 2,
      network: Network.valueOf(config.getNetworkProto()),
      transferInput: TokenTransferInput(
        outputsToSpend: sortedOutputs
            .map<TokenOutputToSpend>(
              (output) => TokenOutputToSpend(
                // Assuming TransferInput_OutputToSpend is the nested message
                prevTokenTransactionHash: output.previousTransactionHash,
                prevTokenTransactionVout: output.previousTransactionVout,
              ),
            )
            .toList(),
      ),
      tokenOutputs: tokenOutputs,
      sparkOperatorIdentityPublicKeys: _collectOperatorIdentityPublicKeys(),
      // expiryTime is undefined/null
      clientCreatedTimestamp: Timestamp.fromDateTime(
        connectionManager.getCurrentServerTime(),
      ),
      invoiceAttachments: sortedInvoiceAttachments,
    );
  }

  Future<PartialTokenTransaction> _constructPartialTransferTokenTransaction(
    List<OutputWithPreviousTransactionData> selectedOutputs,
    List<TokenOutputData> tokenOutputData, [
    List<SparkAddressFormat>? sparkInvoices,
  ]) async {
    final sortedOutputs =
        List<OutputWithPreviousTransactionData>.from(selectedOutputs)..sort(
          (a, b) =>
              a.previousTransactionVout.compareTo(b.previousTransactionVout),
        );

    final availableByToken = <String, BigInt>{};
    for (final output in sortedOutputs) {
      if (!output.hasOutput()) continue;
      final tokenId = bytesToHex(
        Uint8List.fromList(output.output.tokenIdentifier),
      );
      final currentAmount = availableByToken[tokenId] ?? BigInt.zero;
      availableByToken[tokenId] =
          currentAmount +
          bytesToBigIntBE(Uint8List.fromList(output.output.tokenAmount));
    }

    final requestedByToken = <String, BigInt>{};
    for (final output in tokenOutputData) {
      final tokenId = bytesToHex(output.rawTokenIdentifier);
      final currentAmount = requestedByToken[tokenId] ?? BigInt.zero;
      requestedByToken[tokenId] = currentAmount + output.tokenAmount;
    }

    final partialTokenOutputs = tokenOutputData.map((output) {
      return PartialTokenOutput(
        ownerPublicKey: output.receiverPublicKey,
        tokenIdentifier: output.rawTokenIdentifier,
        withdrawBondSats: $fixnum.Int64(
          config.getExpectedWithdrawBondSats(),
        ), // Assuming protoc fixes Int64 mapping
        withdrawRelativeBlockLocktime: $fixnum.Int64(
          config.getExpectedWithdrawRelativeBlockLocktime(),
        ),
        tokenAmount: bigIntToBytesBE(output.tokenAmount, 16),
      );
    }).toList();

    await _appendChange<PartialTokenOutput>(
      availableByToken,
      requestedByToken,
      partialTokenOutputs,
      (ownerPublicKey, tokenIdentifier, changeAmount) {
        return PartialTokenOutput(
          ownerPublicKey: ownerPublicKey,
          tokenIdentifier: tokenIdentifier,
          withdrawBondSats: $fixnum.Int64(config.getExpectedWithdrawBondSats()),
          withdrawRelativeBlockLocktime: $fixnum.Int64(
            config.getExpectedWithdrawRelativeBlockLocktime(),
          ),
          tokenAmount: bigIntToBytesBE(changeAmount, 16),
        );
      },
    );

    final sortedInvoiceAttachments = sparkInvoices != null
        ? sortInvoiceAttachments(
            sparkInvoices
                .map((invoice) => InvoiceAttachment(sparkInvoice: invoice))
                .toList(),
          )
        : <InvoiceAttachment>[];

    return PartialTokenTransaction(
      version: 3,
      tokenTransactionMetadata: TokenTransactionMetadata(
        // Assuming generated wrapper message
        network: Network.valueOf(config.getNetworkProto()),
        sparkOperatorIdentityPublicKeys: _collectOperatorIdentityPublicKeys(),
        validityDurationSeconds: $fixnum.Int64(
          config.getTokenValidityDurationSeconds(),
        ),
        clientCreatedTimestamp: Timestamp.fromDateTime(
          connectionManager.getCurrentServerTime(),
        ),
        invoiceAttachments: sortedInvoiceAttachments,
      ),
      transferInput: TokenTransferInput(
        outputsToSpend: sortedOutputs
            .map(
              (output) => TokenOutputToSpend(
                prevTokenTransactionHash: output.previousTransactionHash,
                prevTokenTransactionVout: output.previousTransactionVout,
              ),
            )
            .toList(),
      ),
      partialTokenOutputs: partialTokenOutputs,
    );
  }

  List<Uint8List> _collectOperatorIdentityPublicKeys() {
    final operatorKeys = <Uint8List>[];
    for (final operator in config.getSigningOperators().values) {
      operatorKeys.add(hexToBytes(operator.identityPublicKey));
    }

    operatorKeys.sort((a, b) {
      final minLength = a.length < b.length ? a.length : b.length;
      for (int i = 0; i < minLength; i++) {
        if (a[i] != b[i]) {
          return a[i] - b[i];
        }
      }
      return a.length - b.length;
    });

    return operatorKeys;
  }

  Future<String> broadcastTokenTransaction(
    TokenTransaction tokenTransaction, [
    List<Uint8List>? outputsToSpendSigningPublicKeys,
    List<Uint8List>? outputsToSpendCommitments,
  ]) async {
    final result = await broadcastTokenTransactionDetailed(
      tokenTransaction,
      outputsToSpendSigningPublicKeys,
      outputsToSpendCommitments,
    );

    return bytesToHex(result.finalTokenTransactionHash);
  }

  Future<DetailedBroadcastResult> broadcastTokenTransactionDetailed(
    TokenTransaction tokenTransaction, [
    List<Uint8List>? outputsToSpendSigningPublicKeys,
    List<Uint8List>? outputsToSpendCommitments,
  ]) async {
    final signingOperators = config.getSigningOperators();

    final startResult = await _startTokenTransaction(
      tokenTransaction,
      signingOperators,
      outputsToSpendSigningPublicKeys,
      outputsToSpendCommitments,
    );

    final finalTokenTransaction = startResult.finalTokenTransaction;
    final finalTokenTransactionHash = startResult.finalTokenTransactionHash;

    final signResult = await _signTokenTransaction(
      finalTokenTransaction,
      finalTokenTransactionHash,
      signingOperators,
    );

    return DetailedBroadcastResult(
      commitStatus: signResult.commitStatus,
      commitProgress: signResult.commitProgress,
      tokenIdentifier: signResult.tokenIdentifier,
      finalTokenTransaction: finalTokenTransaction,
      finalTokenTransactionHash: finalTokenTransactionHash,
    );
  }

  Future<String> broadcastTokenTransactionV3(
    PartialTokenTransaction partialTokenTransaction, [
    List<Uint8List>? outputsToSpendSigningPublicKeys,
  ]) async {
    final broadcastResponse = await broadcastTokenTransactionV3Detailed(
      partialTokenTransaction,
      outputsToSpendSigningPublicKeys,
    );

    if (!broadcastResponse.hasFinalTokenTransaction()) {
      throw SparkValidationError(
        "Final token transaction missing in broadcast response",
      );
    }

    final finalHash = await hashFinalTokenTransaction(
      broadcastResponse.finalTokenTransaction,
    );

    return bytesToHex(finalHash);
  }

  Future<BroadcastTransactionResponse> broadcastTokenTransactionV3Detailed(
    PartialTokenTransaction partialTokenTransaction, [
    List<Uint8List>? outputsToSpendSigningPublicKeys,
  ]) async {
    final sparkClient = await connectionManager.createSparkTokenClient(
      config.getCoordinatorAddress(),
    );

    final partialTokenTransactionHash = await hashPartialTokenTransaction(
      partialTokenTransaction,
    );

    final ownerSignaturesWithIndex = <SignatureWithIndex>[];

    if (partialTokenTransaction.hasMintInput()) {
      if (partialTokenTransaction.partialTokenOutputs.isEmpty) {
        throw SparkValidationError(
          "Invalid mint input",
          context: {
            'field': "partialTokenOutputs",
            'value': null,
            'expected': "At least one token output",
          },
        );
      }

      final ownerPubkey = Uint8List.fromList(
        partialTokenTransaction.partialTokenOutputs[0].ownerPublicKey,
      );
      if (ownerPubkey.isEmpty) {
        throw SparkValidationError(
          "Invalid mint input",
          context: {
            'field': "ownerPubkey",
            'value': null,
            'expected': "Non-null ownerPubkey",
          },
        );
      }

      final ownerSignature = await _signMessageWithKey(
        partialTokenTransactionHash,
        ownerPubkey,
      );

      ownerSignaturesWithIndex.add(
        SignatureWithIndex(signature: ownerSignature, inputIndex: 0),
      );
    } else if (partialTokenTransaction.hasCreateInput()) {
      final issuerPublicKey = Uint8List.fromList(
        partialTokenTransaction.createInput.issuerPublicKey,
      );
      if (issuerPublicKey.isEmpty) {
        throw SparkValidationError(
          "Invalid create input",
          context: {
            'field': "issuerPublicKey",
            'value': null,
            'expected': "Non-null issuer public key",
          },
        );
      }

      final ownerSignature = await _signMessageWithKey(
        partialTokenTransactionHash,
        issuerPublicKey,
      );

      ownerSignaturesWithIndex.add(
        SignatureWithIndex(signature: ownerSignature, inputIndex: 0),
      );
    } else if (partialTokenTransaction.hasTransferInput()) {
      if (outputsToSpendSigningPublicKeys == null) {
        throw SparkValidationError(
          "Invalid transfer input",
          context: {
            'field': "outputsToSpend",
            'value': {'signingPublicKeys': outputsToSpendSigningPublicKeys},
            'expected': "Non-null signing public keys",
          },
        );
      }

      for (int i = 0; i < outputsToSpendSigningPublicKeys.length; i++) {
        final key = outputsToSpendSigningPublicKeys[i];
        if (key.isEmpty) {
          throw SparkValidationError(
            "Invalid signing key",
            context: {
              'field': "outputsToSpendSigningPublicKeys",
              'value': i,
              'expected': "Non-null signing key",
            },
          );
        }

        final ownerSignature = await _signMessageWithKey(
          partialTokenTransactionHash,
          key,
        );

        debugPrint("braodcastTokenTransactionV3Detailed ownerSignature (${ownerSignature.length}) :${hex.encode(ownerSignature)}, hash(${partialTokenTransactionHash.length}): ${hex.encode(partialTokenTransactionHash)} key: ${hex.encode(key)}");

        ownerSignaturesWithIndex.add(
          SignatureWithIndex(signature: ownerSignature, inputIndex: i),
        );
      }
    }

    final request = BroadcastTransactionRequest(
      identityPublicKey: await config.signer.getIdentityPublicKey(),
      partialTokenTransaction: partialTokenTransaction,
      tokenTransactionOwnerSignatures: ownerSignaturesWithIndex,
    );

    // Provide custom call options mimicking the JS setup
    final sparkOptions = SparkCallOptions(
      retry: true,
      retryableStatuses: ["UNKNOWN", "UNAVAILABLE", "CANCELLED", "INTERNAL"],
      retryMaxAttempts: 3,
    );

    int attempts = 0;
    while (true) {
      try {
        attempts++;
        return await sparkClient.broadcast_transaction(
          request,
          options: sparkOptions.toGrpcCallOptions(),
        );
      } on GrpcError catch (e) {
        final statusString = e.codeName; // e.g., "UNAVAILABLE"

        if (sparkOptions.retry &&
            attempts < sparkOptions.retryMaxAttempts &&
            sparkOptions.retryableStatuses.contains(statusString)) {
          // Logic for backoff could go here
          continue;
        }
        rethrow;
      }
    }
  }

  Future<StartTokenTxResult> _startTokenTransaction(
    TokenTransaction tokenTransaction,
    Map<String, SigningOperator> signingOperators, [
    List<Uint8List>? outputsToSpendSigningPublicKeys,
    List<Uint8List>? outputsToSpendCommitments,
  ]) async {
    final sparkClient = await connectionManager.createSparkTokenClient(
      config.getCoordinatorAddress(),
    );

    final partialTokenTransactionHash = hashTokenTransaction(
      tokenTransaction,
      true,
    );

    final ownerSignaturesWithIndex = <SignatureWithIndex>[];

    if (tokenTransaction.hasMintInput()) {
      final tokenIdentifier = tokenTransaction.mintInput.tokenIdentifier;
      if (tokenIdentifier.isEmpty) {
        throw SparkValidationError(
          "Invalid mint input",
          context: {
            'field': "tokenIdentifier",
            'value': null,
            'expected': "Non-null tokenIdentifier",
          },
        );
      }

      if (tokenTransaction.tokenOutputs.isEmpty) {
        throw SparkValidationError(
          "Invalid mint input",
          context: {
            'field': "tokenOutputs",
            'value': null,
            'expected': "At least one token output",
          },
        );
      }

      final ownerPubkey = Uint8List.fromList(
        tokenTransaction.tokenOutputs[0].ownerPublicKey,
      );
      if (ownerPubkey.isEmpty) {
        throw SparkValidationError(
          "Invalid mint input",
          context: {
            'field': "ownerPubkey",
            'value': null,
            'expected': "Non-null ownerPubkey",
          },
        );
      }

      final ownerSignature = await _signMessageWithKey(
        partialTokenTransactionHash,
        ownerPubkey,
      );

      ownerSignaturesWithIndex.add(
        SignatureWithIndex(signature: ownerSignature, inputIndex: 0),
      );
    } else if (tokenTransaction.hasCreateInput()) {
      final issuerPublicKey = Uint8List.fromList(
        tokenTransaction.createInput.issuerPublicKey,
      );
      if (issuerPublicKey.isEmpty) {
        throw SparkValidationError(
          "Invalid create input",
          context: {
            'field': "issuerPublicKey",
            'value': null,
            'expected': "Non-null issuer public key",
          },
        );
      }

      final ownerSignature = await _signMessageWithKey(
        partialTokenTransactionHash,
        issuerPublicKey,
      );

      ownerSignaturesWithIndex.add(
        SignatureWithIndex(signature: ownerSignature, inputIndex: 0),
      );
    } else if (tokenTransaction.hasTransferInput()) {
      if (outputsToSpendSigningPublicKeys == null ||
          outputsToSpendCommitments == null) {
        throw SparkValidationError(
          "Invalid transfer input",
          context: {
            'field': "outputsToSpend",
            'value': {
              'signingPublicKeys': outputsToSpendSigningPublicKeys,
              'revocationPublicKeys': outputsToSpendCommitments,
            },
            'expected': "Non-null signing and revocation public keys",
          },
        );
      }

      for (int i = 0; i < outputsToSpendSigningPublicKeys.length; i++) {
        final key = outputsToSpendSigningPublicKeys[i];
        if (key.isEmpty) {
          throw SparkValidationError(
            "Invalid signing key",
            context: {
              'field': "outputsToSpendSigningPublicKeys",
              'value': i,
              'expected': "Non-null signing key",
            },
          );
        }
        final ownerSignature = await _signMessageWithKey(
          partialTokenTransactionHash,
          key,
        );

        ownerSignaturesWithIndex.add(
          SignatureWithIndex(signature: ownerSignature, inputIndex: i),
        );
      }
    }

    final callOptions = SparkCallOptions(
      retry: true,
      retryableStatuses: ["UNKNOWN", "UNAVAILABLE", "CANCELLED", "INTERNAL"],
      retryMaxAttempts: 3,
    ).toGrpcCallOptions();

    final startResponse = await sparkClient.start_transaction(
      StartTransactionRequest(
        identityPublicKey: await config.signer.getIdentityPublicKey(),
        partialTokenTransaction: tokenTransaction,
        validityDurationSeconds: $fixnum.Int64(
          config.getTokenValidityDurationSeconds(),
        ),
        partialTokenTransactionOwnerSignatures: ownerSignaturesWithIndex,
      ),
      options: callOptions,
    );

    if (!startResponse.hasFinalTokenTransaction()) {
      throw Exception("Final token transaction missing in start response");
    }
    if (!startResponse.hasKeyshareInfo()) {
      throw Exception("Keyshare info missing in start response");
    }

    validateTokenTransaction(
      startResponse.finalTokenTransaction,
      tokenTransaction,
      signingOperators = signingOperators,
      ownerIdentifiers: startResponse.keyshareInfo.ownerIdentifiers,
      threshold: startResponse.keyshareInfo.threshold,
      expectedWithdrawBondSats: config.getExpectedWithdrawBondSats(),
      expectedWithdrawRelativeBlockLocktime: config
          .getExpectedWithdrawRelativeBlockLocktime(),
      expectedThreshold: config.getThreshold(),
    );

    final finalTokenTransaction = startResponse.finalTokenTransaction;
    final finalTokenTransactionHash = hashTokenTransaction(
      finalTokenTransaction,
      false,
    );

    return StartTokenTxResult(
      finalTokenTransaction: finalTokenTransaction,
      finalTokenTransactionHash: finalTokenTransactionHash,
      threshold: startResponse.keyshareInfo.threshold,
    );
  }

  Future<SignTokenTxResult> _signTokenTransaction(
    TokenTransaction finalTokenTransaction,
    Uint8List finalTokenTransactionHash,
    Map<String, SigningOperator> signingOperators,
  ) async {
    final coordinatorClient = await connectionManager.createSparkTokenClient(
      config.getCoordinatorAddress(),
    );

    final inputTtxoSignaturesPerOperator = await _createSignaturesForOperators(
      finalTokenTransaction,
      finalTokenTransactionHash,
      signingOperators,
    );

    final callOptions = SparkCallOptions(
      retry: true,
      retryableStatuses: ["UNKNOWN", "UNAVAILABLE", "CANCELLED", "INTERNAL"],
      retryMaxAttempts: 3,
    ).toGrpcCallOptions();

    try {
      final response = await coordinatorClient.commit_transaction(
        CommitTransactionRequest(
          finalTokenTransaction: finalTokenTransaction,
          finalTokenTransactionHash: finalTokenTransactionHash,
          inputTtxoSignaturesPerOperator: inputTtxoSignaturesPerOperator,
          ownerIdentityPublicKey: await config.signer.getIdentityPublicKey(),
        ),
        options: callOptions,
      );

      return SignTokenTxResult(
        commitStatus: response.commitStatus,
        commitProgress: response.hasCommitProgress()
            ? response.commitProgress
            : null,
        // Depending on your proto definition, this might be a property of response.
        // Providing null as a fallback if not present.
        tokenIdentifier: response.hasTokenIdentifier()
            ? Uint8List.fromList(response.tokenIdentifier)
            : null,
      );
    } catch (error) {
      throw SparkRequestError(
        "Failed to sign token transaction",
        context: {'operation': "commit_transaction", 'error': error},
      );
    }
  }

  Future<List<OutputWithPreviousTransactionData>> fetchOwnedTokenOutputs(
    FetchOwnedTokenOutputsParams params,
  ) async {
    final ownerPublicKeys = params.ownerPublicKeys;
    final issuerPublicKeys = params.issuerPublicKeys ?? [];
    final tokenIdentifiers = params.tokenIdentifiers ?? [];

    if (ownerPublicKeys.isEmpty) {
      throw SparkValidationError(
        "Owner public keys cannot be empty",
        context: {
          'field': "ownerPublicKeys",
          'value': ownerPublicKeys,
          'expected': "Non-empty array",
        },
      );
    }
    for (final ownerPublicKey in ownerPublicKeys) {
      isValidPublicKey(bytesToHex(ownerPublicKey));
    }
    for (final issuerPublicKey in issuerPublicKeys) {
      isValidPublicKey(bytesToHex(issuerPublicKey));
    }
    for (final tokenIdentifier in tokenIdentifiers) {
      if (tokenIdentifier.length != 32) {
        throw SparkValidationError(
          "Token identifier must be 32 bytes (64 hex characters) long.",
          context: {
            'field': "tokenIdentifier",
            'value': tokenIdentifier,
            'expected': "32 bytes",
          },
        );
      }
    }

    final tokenClient = await connectionManager.createSparkTokenClient(
      config.getCoordinatorAddress(),
    );

    try {
      final allOutputs = <OutputWithPreviousTransactionData>[];
      String? after;

      do {
        final result = await tokenClient.query_token_outputs(
          QueryTokenOutputsRequest(
            // Assuming typical generated request wrapper
            ownerPublicKeys: ownerPublicKeys,
            issuerPublicKeys: issuerPublicKeys,
            tokenIdentifiers: tokenIdentifiers,
            network: Network.valueOf(config.getNetworkProto()),
            pageRequest: PageRequest(
              // Assuming PageRequest is a nested/shared message
              pageSize: QUERY_TOKEN_OUTPUTS_PAGE_SIZE,
              cursor: after ?? "",
              direction: Direction.NEXT,
            ),
          ),
        );

        // Assumes proto array is accessible
        if (result.outputsWithPreviousTransactionData.isNotEmpty) {
          allOutputs.addAll(result.outputsWithPreviousTransactionData);
        }

        if (result.hasPageResponse() && result.pageResponse.hasNextPage) {
          after = result.pageResponse.nextCursor;
        } else {
          break;
        }
      } while (after.isNotEmpty);

      return allOutputs;
    } catch (error) {
      // throw SparkRequestError("Failed to fetch owned token outputs", context: {
      //   'operation': "query_token_outputs",
      //   'error': error,
      // });
      rethrow;
    }
  }

  // ===========================================================================
  // CHUNK: Querying and Selection Logic
  // (Completing the TokenTransactionService class...)
  // ===========================================================================

  Future<QueryTokenTransactionsResponse> queryTokenTransactions(
    QueryTokenTransactionsParams params,
  ) async {
    final decodedOwnerPublicKeys = params.sparkAddresses?.map((address) {
      final decoded = decodeSparkAddress(address, config.getNetwork());
      return decoded.identityPublicKey;
    }).toList();

    final allOwnerPublicKeys = <String>[
      ...(decodedOwnerPublicKeys ?? []),
      ...(params.ownerPublicKeys ?? []),
    ];

    final tokenClient = await connectionManager.createSparkTokenClient(
      config.getCoordinatorAddress(),
    );

    final queryParams = QueryTokenTransactionsRequest(
      issuerPublicKeys: params.issuerPublicKeys?.map(hexToBytes).toList() ?? [],
      ownerPublicKeys: allOwnerPublicKeys.isNotEmpty
          ? allOwnerPublicKeys.map(hexToBytes).toList()
          : [],
      tokenIdentifiers:
          params.tokenIdentifiers?.map((identifier) {
            final decoded = decodeBech32mTokenIdentifier(
              identifier, // Assumes String maps cleanly
              network: config.getNetwork(),
            );
            return Uint8List.fromList(decoded.tokenIdentifier);
          }).toList() ??
          [],
      tokenTransactionHashes:
          params.tokenTransactionHashes?.map(hexToBytes).toList() ?? [],
      outputIds: params.outputIds ?? [],
      order: params.order == QueryOrder.asc
          ? Order.ASCENDING
          : Order.DESCENDING,
      limit: $fixnum.Int64(params.pageSize ?? 0),
      offset: $fixnum.Int64(params.offset ?? 0),
    );

    try {
      return await tokenClient.query_token_transactions(queryParams);
    } catch (error) {
      throw SparkRequestError(
        "Failed to query token transactions",
        context: {'operation': "query_token_transactions", 'error': error},
      );
    }
  }

  Future<QueryTokenTransactionsResponse> queryTokenTransactionsByTxHashes(
    List<String> tokenTransactionHashes,
  ) async {
    final tokenClient = await connectionManager.createSparkTokenClient(
      config.getCoordinatorAddress(),
    );

    final queryParams = QueryTokenTransactionsRequest(
      byTxHash: QueryTokenTransactionsByTxHash(
        tokenTransactionHashes: tokenTransactionHashes.map(hexToBytes).toList(),
      ),
      outputIds: [],
      ownerPublicKeys: [],
      issuerPublicKeys: [],
      tokenIdentifiers: [],
      tokenTransactionHashes: [],
      order: Order.ASCENDING,
      limit: $fixnum.Int64(0),
      offset: $fixnum.Int64(0),
    );

    try {
      return await tokenClient.query_token_transactions(queryParams);
    } catch (error) {
      throw SparkRequestError(
        "Failed to query token transactions",
        context: {'operation': "query_token_transactions", 'error': error},
      );
    }
  }

  Future<QueryTokenTransactionsResponse> queryTokenTransactionsWithFilters(
    QueryTokenTransactionsWithFiltersParams params,
  ) async {
    final decodedOwnerPublicKeys = params.sparkAddresses?.map((address) {
      final decoded = decodeSparkAddress(address, config.getNetwork());
      return decoded.identityPublicKey;
    }).toList();

    final tokenClient = await connectionManager.createSparkTokenClient(
      config.getCoordinatorAddress(),
    );

    final queryParams = QueryTokenTransactionsRequest(
      byFilters: QueryTokenTransactionsByFilters(
        outputIds: params.outputIds ?? [],
        ownerPublicKeys: decodedOwnerPublicKeys?.map(hexToBytes).toList() ?? [],
        issuerPublicKeys:
            params.issuerPublicKeys?.map(hexToBytes).toList() ?? [],
        tokenIdentifiers:
            params.tokenIdentifiers?.map((identifier) {
              final decoded = decodeBech32mTokenIdentifier(
                identifier,
                network: config.getNetwork(),
              );
              return Uint8List.fromList(decoded.tokenIdentifier);
            }).toList() ??
            [],
        pageRequest: PageRequest(
          unsafePageSize: 0,
          pageSize: params.pageSize ?? 50,
          cursor: params.cursor ?? "",
          direction: params.direction == QueryDirection.previous
              ? Direction.PREVIOUS
              : Direction.NEXT,
        ),
      ),
      outputIds: [],
      ownerPublicKeys: [],
      issuerPublicKeys: [],
      tokenIdentifiers: [],
      tokenTransactionHashes: [],
      order: Order.ASCENDING,
      limit: $fixnum.Int64(0),
      offset: $fixnum.Int64(0),
    );

    try {
      return await tokenClient.query_token_transactions(queryParams);
    } catch (error) {
      throw SparkRequestError(
        "Failed to query token transactions",
        context: {'operation': "query_token_transactions", 'error': error},
      );
    }
  }

  List<OutputWithPreviousTransactionData> selectTokenOutputs(
    List<OutputWithPreviousTransactionData> tokenOutputs,
    BigInt tokenAmount,
    String strategy, // "SMALL_FIRST" | "LARGE_FIRST"
  ) {
    if (tokenAmount <= BigInt.zero) {
      throw SparkValidationError(
        "Token amount must be greater than 0",
        context: {
          'field': "tokenAmount",
          'value': tokenAmount,
          'expected': "Greater than 0",
        },
      );
    }

    final totalOutputsAmount = sumTokenOutputs(tokenOutputs);
    if (totalOutputsAmount < tokenAmount) {
      throw SparkValidationError(
        "Insufficient token amount",
        context: {
          'field': "tokenAmount",
          'value': totalOutputsAmount,
          'expected': tokenAmount,
        },
      );
    }

    // First try to find an exact match
    OutputWithPreviousTransactionData? exactMatch;
    for (final item in tokenOutputs) {
      if (item.hasOutput() &&
          bytesToBigIntBE(Uint8List.fromList(item.output.tokenAmount)) ==
              tokenAmount) {
        exactMatch = item;
        break;
      }
    }

    if (exactMatch != null) {
      return [exactMatch];
    }

    // Sort outputs: smallest first for SMALL_FIRST, largest first for LARGE_FIRST
    final sortedOutputs = List<OutputWithPreviousTransactionData>.from(
      tokenOutputs,
    );
    sortedOutputs.sort((a, b) {
      final amountA = bytesToBigIntBE(Uint8List.fromList(a.output.tokenAmount));
      final amountB = bytesToBigIntBE(Uint8List.fromList(b.output.tokenAmount));
      return strategy == "SMALL_FIRST"
          ? amountA.compareTo(amountB)
          : amountB.compareTo(amountA);
    });

    // SMALL_FIRST strategy: Maximize use of small outputs while staying within MAX_OUTPUTS limit
    if (strategy == "SMALL_FIRST") {
      // First, try to use only the smallest outputs
      BigInt sum = BigInt.zero;
      int count = 0;
      for (final output in sortedOutputs) {
        sum += bytesToBigIntBE(Uint8List.fromList(output.output.tokenAmount));
        count++;
        if (sum >= tokenAmount) {
          // We can reach the target with outputs
          return sortedOutputs.sublist(0, count);
        }
        if (count >= MAX_TOKEN_OUTPUTS_TX) break;
      }

      // If we reached MAX_OUTPUTS but don't have enough, we need to swap some small
      // outputs for larger ones
      final smallOutputs = sortedOutputs.sublist(0, MAX_TOKEN_OUTPUTS_TX);
      final largeOutputs = sortedOutputs
          .sublist(MAX_TOKEN_OUTPUTS_TX)
          .reversed
          .toList(); // Largest first

      BigInt smallSum = smallOutputs.fold<BigInt>(
        BigInt.zero,
        (acc, output) =>
            acc +
            bytesToBigIntBE(Uint8List.fromList(output.output.tokenAmount)),
      );

      final selectedOutputs = List<OutputWithPreviousTransactionData>.from(
        smallOutputs,
      );

      // While we haven't reached the target, swap the smallest output for a larger one
      int largeIdx = 0;
      while (smallSum < tokenAmount && largeIdx < largeOutputs.length) {
        final largeOutput = largeOutputs[largeIdx];
        final largeAmount = bytesToBigIntBE(
          Uint8List.fromList(largeOutput.output.tokenAmount),
        );

        // Remove the smallest output from selection
        final smallestOutput = selectedOutputs.removeAt(
          0,
        ); // shift() equivalent
        final smallestAmount = bytesToBigIntBE(
          Uint8List.fromList(smallestOutput.output.tokenAmount),
        );

        selectedOutputs.add(largeOutput);

        smallSum = smallSum - smallestAmount + largeAmount;
        largeIdx++;
      }

      if (smallSum < tokenAmount) {
        throw SparkValidationError(
          "Insufficient token amount",
          context: {
            'field': "tokenAmount",
            'value': smallSum,
            'expected': tokenAmount,
          },
        );
      }

      return selectedOutputs;
    } else {
      // LARGE_FIRST strategy: simple greedy approach
      final selectedOutputs = <OutputWithPreviousTransactionData>[];
      BigInt remainingAmount = tokenAmount;

      for (final output in sortedOutputs) {
        if (remainingAmount <= BigInt.zero) break;
        if (selectedOutputs.length >= MAX_TOKEN_OUTPUTS_TX) break;

        selectedOutputs.add(output);
        remainingAmount -= bytesToBigIntBE(
          Uint8List.fromList(output.output.tokenAmount),
        );
      }

      if (remainingAmount > BigInt.zero) {
        throw SparkValidationError(
          "Insufficient token amount",
          context: {'field': "remainingAmount", 'value': remainingAmount},
        );
      }

      return selectedOutputs;
    }
  }

  // ===========================================================================
  // CHUNK: Sorting and Signature Generation
  // (Completing the TokenTransactionService class...)
  // ===========================================================================

  // void _sortTokenOutputsByStrategy(
  //   List<OutputWithPreviousTransactionData> tokenOutputs,
  //   String strategy, // "SMALL_FIRST" | "LARGE_FIRST"
  // ) {
  //   if (strategy == "SMALL_FIRST") {
  //     tokenOutputs.sort((a, b) {
  //       final amountA = bytesToBigIntBE(
  //         Uint8List.fromList(a.output.tokenAmount),
  //       );
  //       final amountB = bytesToBigIntBE(
  //         Uint8List.fromList(b.output.tokenAmount),
  //       );
  //       return amountA.compareTo(amountB);
  //     });
  //   } else {
  //     tokenOutputs.sort((a, b) {
  //       final amountA = bytesToBigIntBE(
  //         Uint8List.fromList(a.output.tokenAmount),
  //       );
  //       final amountB = bytesToBigIntBE(
  //         Uint8List.fromList(b.output.tokenAmount),
  //       );
  //       return amountB.compareTo(amountA);
  //     });
  //   }
  // }

  // Helper function for deciding if the signer public key is the identity public key
  // NOTE: Replace the version from the previous chunk with this accurate translation.
  Future<Uint8List> _signMessageWithKey(
    Uint8List message,
    Uint8List publicKey,
  ) async {
    final tokenSignatures = config.getTokenSignatures();
    final identityPublicKey = await config.signer.getIdentityPublicKey();

    if (bytesToHex(publicKey) == bytesToHex(identityPublicKey)) {
      if (tokenSignatures == "SCHNORR") {
        return await config.signer.signSchnorrWithIdentityKey(message);
      } else {
        return await config.signer.signMessageWithIdentityKey(message);
      }
    } else {
      throw SparkValidationError(
        "Invalid public key",
        context: {
          'field': "publicKey",
          'value': bytesToHex(publicKey),
          'expected': bytesToHex(identityPublicKey),
        },
      );
    }
  }

  // NOTE: Replace the version from the previous chunk with this accurate translation.
  Future<List<InputTtxoSignaturesPerOperator>> _createSignaturesForOperators(
    TokenTransaction finalTokenTransaction,
    Uint8List finalTokenTransactionHash,
    Map<String, SigningOperator> signingOperators,
  ) async {
    final inputTtxoSignaturesPerOperator = <InputTtxoSignaturesPerOperator>[];

    for (final operator in signingOperators.values) {
      final ttxoSignatures = <SignatureWithIndex>[];
      final operatorIdentityPublicKey = hexToBytes(operator.identityPublicKey);

      if (finalTokenTransaction.hasMintInput()) {
        final issuerPublicKey = Uint8List.fromList(
          finalTokenTransaction.mintInput.issuerPublicKey,
        );
        if (issuerPublicKey.isEmpty) {
          throw SparkValidationError(
            "Invalid mint input",
            context: {
              'field': "issuerPublicKey",
              'value': null,
              'expected': "Non-null issuer public key",
            },
          );
        }

        // Assuming hashOperatorSpecific... takes the two relevant byte arrays directly
        final payloadHash = hashOperatorSpecificTokenTransactionSignablePayload(
          OperatorSpecificTokenTransactionSignablePayload(
            finalTokenTransactionHash: finalTokenTransactionHash,
            operatorIdentityPublicKey: operatorIdentityPublicKey,
          ),
        );

        final ownerSignature = await _signMessageWithKey(
          payloadHash,
          issuerPublicKey,
        );

        ttxoSignatures.add(
          SignatureWithIndex(signature: ownerSignature, inputIndex: 0),
        );
      } else if (finalTokenTransaction.hasCreateInput()) {
        final issuerPublicKey = Uint8List.fromList(
          finalTokenTransaction.createInput.issuerPublicKey,
        );
        if (issuerPublicKey.isEmpty) {
          throw SparkValidationError(
            "Invalid create input",
            context: {
              'field': "issuerPublicKey",
              'value': null,
              'expected': "Non-null issuer public key",
            },
          );
        }

        final payloadHash = hashOperatorSpecificTokenTransactionSignablePayload(
          OperatorSpecificTokenTransactionSignablePayload(
            finalTokenTransactionHash: finalTokenTransactionHash,
            operatorIdentityPublicKey: operatorIdentityPublicKey,
          ),
        );

        final ownerSignature = await _signMessageWithKey(
          payloadHash,
          issuerPublicKey,
        );

        ttxoSignatures.add(
          SignatureWithIndex(signature: ownerSignature, inputIndex: 0),
        );
      } else if (finalTokenTransaction.hasTransferInput()) {
        final transferInput = finalTokenTransaction.transferInput;

        // Create signatures for each input
        for (int i = 0; i < transferInput.outputsToSpend.length; i++) {
          final payloadHash =
              hashOperatorSpecificTokenTransactionSignablePayload(
                OperatorSpecificTokenTransactionSignablePayload(
                  finalTokenTransactionHash: finalTokenTransactionHash,
                  operatorIdentityPublicKey: operatorIdentityPublicKey,
                ),
              );

          Uint8List ownerSignature;
          if (config.getTokenSignatures() == "SCHNORR") {
            ownerSignature = await config.signer.signSchnorrWithIdentityKey(
              payloadHash,
            );
          } else {
            ownerSignature = await config.signer.signMessageWithIdentityKey(
              payloadHash,
            );
          }

          ttxoSignatures.add(
            SignatureWithIndex(signature: ownerSignature, inputIndex: i),
          );
        }
      }

      inputTtxoSignaturesPerOperator.add(
        InputTtxoSignaturesPerOperator(
          ttxoSignatures: ttxoSignatures,
          operatorIdentityPublicKey: operatorIdentityPublicKey,
        ),
      );
    }

    return inputTtxoSignaturesPerOperator;
  }
}

// // --- Companion Data Classes ---

class ReceiverOutput {
  final Bech32mTokenIdentifier tokenIdentifier;
  final BigInt tokenAmount;
  final String receiverSparkAddress;

  ReceiverOutput({
    required this.tokenIdentifier,
    required this.tokenAmount,
    required this.receiverSparkAddress,
  });
}

class TokenOutputData {
  final Uint8List receiverPublicKey;
  final Uint8List rawTokenIdentifier;
  final BigInt tokenAmount;
  final String? sparkInvoice;

  TokenOutputData({
    required this.receiverPublicKey,
    required this.rawTokenIdentifier,
    required this.tokenAmount,
    this.sparkInvoice,
  });
}

// --- Companion Data Classes ---

class DetailedBroadcastResult {
  final CommitStatus commitStatus;
  final CommitProgress? commitProgress;
  final Uint8List? tokenIdentifier;
  final TokenTransaction finalTokenTransaction;
  final Uint8List finalTokenTransactionHash;

  DetailedBroadcastResult({
    required this.commitStatus,
    this.commitProgress,
    this.tokenIdentifier,
    required this.finalTokenTransaction,
    required this.finalTokenTransactionHash,
  });
}

class StartTokenTxResult {
  final TokenTransaction finalTokenTransaction;
  final Uint8List finalTokenTransactionHash;
  final int threshold;

  StartTokenTxResult({
    required this.finalTokenTransaction,
    required this.finalTokenTransactionHash,
    required this.threshold,
  });
}

class SignTokenTxResult {
  final CommitStatus commitStatus;
  final CommitProgress? commitProgress;
  final Uint8List? tokenIdentifier;

  SignTokenTxResult({
    required this.commitStatus,
    this.commitProgress,
    this.tokenIdentifier,
  });
}
