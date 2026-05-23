// lib/utils/token_hashing.dart

import 'dart:typed_data';
import 'dart:convert';

import 'package:bech32m_i/bech32m_i.dart';
import 'package:boringssl_ffi/boringssl_ffi.dart' as bsll;

import '../errors/types.dart';
import '../spark_wallet/proto-hash.dart';
import '../src/proto/spark.pb.dart';
import '../src/proto/spark_token.pb.dart';

class OperatorSpecificTokenTransactionSignablePayload {
  final Uint8List? finalTokenTransactionHash;
  final Uint8List? operatorIdentityPublicKey;

  const OperatorSpecificTokenTransactionSignablePayload({
    this.finalTokenTransactionHash,
    this.operatorIdentityPublicKey,
  });
}

Uint8List hashTokenTransaction(
  TokenTransaction tokenTransaction, [
  bool partialHash = false,
]) {
  switch (tokenTransaction.version) {
    case 1:
      return hashTokenTransactionV1(tokenTransaction, partialHash);
    case 2:
      return hashTokenTransactionV2(tokenTransaction, partialHash);
    default:
      // Assuming your SparkValidationError accepts a map or named parameters for details
      throw SparkValidationError(
        "invalid token transaction version",
        context: {
          "field": "tokenTransaction.version",
          "value": tokenTransaction.version,
        },
      );
  }
}

/// Helper to mimic the `sha256.create().update(bytes).digest()` flow.
Uint8List _sha256(List<int> data) {
  return Uint8List.fromList(bsll.sha256.hash(data)!);
}

Uint8List hashTokenTransactionV1(
  TokenTransaction? tokenTransaction, [
  bool partialHash = false,
]) {
  // Dart's null safety handles most nil checks automatically if the parameter isn't nullable,
  // but included to keep parity with your TS validation logic.
  // ignore: unnecessary_null_comparison
  if (tokenTransaction == null) {
    throw SparkValidationError(
      "token transaction cannot be null",
      context: {"field": "tokenTransaction"},
    );
  }

  List<Uint8List> allHashes = [];

  // Hash version
  final versionBytes = ByteData(4)
    ..setUint32(0, tokenTransaction.version, Endian.big);
  allHashes.add(_sha256(versionBytes.buffer.asUint8List()));

  // Hash transaction type
  int transactionType = 0;

  // Assuming standard Dart protoc generator methods (hasX / whichX)
  if (tokenTransaction.hasMintInput()) {
    transactionType = TokenTransactionType.TOKEN_TRANSACTION_TYPE_MINT.value;
  } else if (tokenTransaction.hasTransferInput()) {
    transactionType =
        TokenTransactionType.TOKEN_TRANSACTION_TYPE_TRANSFER.value;
  } else if (tokenTransaction.hasCreateInput()) {
    transactionType = TokenTransactionType.TOKEN_TRANSACTION_TYPE_CREATE.value;
  } else {
    throw SparkValidationError(
      "token transaction must have exactly one input type",
      context: {"field": "tokenInputs"},
    );
  }

  final typeBytes = ByteData(4)..setUint32(0, transactionType, Endian.big);
  allHashes.add(_sha256(typeBytes.buffer.asUint8List()));

  // Hash token inputs based on type
  if (tokenTransaction.hasTransferInput()) {
    final transferInput = tokenTransaction.transferInput;
    if (transferInput.outputsToSpend.isEmpty) {
      throw SparkValidationError(
        "outputs to spend cannot be empty",
        context: {"field": "tokenInputs.transferInput.outputsToSpend"},
      );
    }

    // Hash outputs to spend length
    final outputsLenBytes = ByteData(4)
      ..setUint32(0, transferInput.outputsToSpend.length, Endian.big);
    allHashes.add(_sha256(outputsLenBytes.buffer.asUint8List()));

    // Hash outputs to spend
    for (int i = 0; i < transferInput.outputsToSpend.length; i++) {
      final output = transferInput.outputsToSpend.elementAtOrNull(i);
      // ignore: unnecessary_null_comparison
      if (output == null) {
        throw SparkValidationError(
          "output cannot be null at index $i",
          context: {
            "field": "tokenInputs.transferInput.outputsToSpend[$i]",
            "index": i,
          },
        );
      }

      final hashBytes = <int>[];

      if (output.prevTokenTransactionHash.isNotEmpty) {
        final prevHash = output.prevTokenTransactionHash;
        if (prevHash.length != 32) {
          throw SparkValidationError(
            "invalid previous transaction hash length at index $i",
            context: {
              "field":
                  "tokenInputs.transferInput.outputsToSpend[$i].prevTokenTransactionHash",
              "value": prevHash,
              "expectedLength": 32,
              "actualLength": prevHash.length,
              "index": i,
            },
          );
        }
        hashBytes.addAll(prevHash);
      }

      final voutBytes = ByteData(4)
        ..setUint32(0, output.prevTokenTransactionVout, Endian.big);
      hashBytes.addAll(voutBytes.buffer.asUint8List());

      allHashes.add(_sha256(hashBytes));
    }
  } else if (tokenTransaction.hasMintInput()) {
    final mintInput = tokenTransaction.mintInput;

    if (mintInput.issuerPublicKey.isNotEmpty) {
      final issuerPubKey = mintInput.issuerPublicKey;
      if (issuerPubKey.isEmpty) {
        // Kept strictly for parity, though isNotEmpty guards it
        throw SparkValidationError(
          "issuer public key cannot be empty",
          context: {
            "field": "tokenInputs.mintInput.issuerPublicKey",
            "value": issuerPubKey,
            "expectedLength": 1,
            "actualLength": 0,
          },
        );
      }
      allHashes.add(_sha256(issuerPubKey));

      final tokenIdentifierBytes = <int>[];
      if (mintInput.tokenIdentifier.isNotEmpty) {
        tokenIdentifierBytes.addAll(mintInput.tokenIdentifier);
      } else {
        tokenIdentifierBytes.addAll(Uint8List(32));
      }
      allHashes.add(_sha256(tokenIdentifierBytes));
    }
  } else if (tokenTransaction.hasCreateInput()) {
    final createInput = tokenTransaction.createInput;

    // Hash issuer public key
    if (createInput.issuerPublicKey.isEmpty) {
      throw SparkValidationError(
        "issuer public key cannot be nil or empty",
        context: {"field": "tokenInputs.createInput.issuerPublicKey"},
      );
    }
    allHashes.add(_sha256(createInput.issuerPublicKey));

    // Hash token name
    if (createInput.tokenName.isEmpty) {
      throw SparkValidationError(
        "token name cannot be empty",
        context: {"field": "tokenInputs.createInput.tokenName"},
      );
    }
    if (createInput.tokenName.length > 20) {
      throw SparkValidationError(
        "token name cannot be longer than 20 bytes",
        context: {
          "field": "tokenInputs.createInput.tokenName",
          "value": createInput.tokenName,
          "expectedLength": 20,
          "actualLength": createInput.tokenName.length,
        },
      );
    }
    allHashes.add(_sha256(utf8.encode(createInput.tokenName)));

    // Hash token ticker
    if (createInput.tokenTicker.isEmpty) {
      throw SparkValidationError(
        "token ticker cannot be empty",
        context: {"field": "tokenInputs.createInput.tokenTicker"},
      );
    }
    if (createInput.tokenTicker.length > 6) {
      throw SparkValidationError(
        "token ticker cannot be longer than 6 bytes",
        context: {
          "field": "tokenInputs.createInput.tokenTicker",
          "value": createInput.tokenTicker,
          "expectedLength": 6,
          "actualLength": createInput.tokenTicker.length,
        },
      );
    }
    allHashes.add(_sha256(utf8.encode(createInput.tokenTicker)));

    // Hash decimals
    final decimalsBytes = ByteData(4)
      ..setUint32(0, createInput.decimals, Endian.big);
    allHashes.add(_sha256(decimalsBytes.buffer.asUint8List()));

    // Hash max supply (fixed 16 bytes)
    if (createInput.maxSupply.isEmpty) {
      throw SparkValidationError(
        "max supply cannot be nil",
        context: {"field": "tokenInputs.createInput.maxSupply"},
      );
    }
    if (createInput.maxSupply.length != 16) {
      throw SparkValidationError(
        "max supply must be exactly 16 bytes",
        context: {
          "field": "tokenInputs.createInput.maxSupply",
          "value": createInput.maxSupply,
          "expectedLength": 16,
          "actualLength": createInput.maxSupply.length,
        },
      );
    }
    allHashes.add(_sha256(createInput.maxSupply));

    // Hash is freezable
    allHashes.add(_sha256([createInput.isFreezable ? 1 : 0]));

    // Hash creation entity public key (only for final hash)
    if (!partialHash && createInput.creationEntityPublicKey.isNotEmpty) {
      allHashes.add(_sha256(createInput.creationEntityPublicKey));
    } else {
      // Empty hash update if nothing is added, matching TS behavior
      allHashes.add(_sha256([]));
    }
  }

  // Hash outputs length
  final outputsLenBytes = ByteData(4)
    ..setUint32(0, tokenTransaction.tokenOutputs.length, Endian.big);
  allHashes.add(_sha256(outputsLenBytes.buffer.asUint8List()));

  for (int i = 0; i < tokenTransaction.tokenOutputs.length; i++) {
    final output = tokenTransaction.tokenOutputs.elementAtOrNull(i);
    // ignore: unnecessary_null_comparison
    if (output == null) {
      throw SparkValidationError(
        "output cannot be null at index $i",
        context: {"field": "tokenOutputs[$i]", "index": i},
      );
    }

    final hashBytes = <int>[];

    // Only hash ID if it's not empty and not in partial hash mode
    if (output.id.isNotEmpty && !partialHash) {
      if (output.id.isEmpty) {
        // Same parity check
        throw SparkValidationError(
          "output ID at index $i cannot be empty",
          context: {"field": "tokenOutputs[$i].id", "index": i},
        );
      }
      hashBytes.addAll(utf8.encode(output.id));
    }

    if (output.ownerPublicKey.isNotEmpty) {
      hashBytes.addAll(output.ownerPublicKey);
    }

    if (!partialHash) {
      if (output.revocationCommitment.isNotEmpty) {
        hashBytes.addAll(output.revocationCommitment);
      }

      // Convert Int64 (from Protobufs) to standard int for ByteData.
      final bondBytes = ByteData(8)
        ..setUint64(0, output.withdrawBondSats.toInt(), Endian.big);
      hashBytes.addAll(bondBytes.buffer.asUint8List());

      final locktimeBytes = ByteData(
        8,
      )..setUint64(0, output.withdrawRelativeBlockLocktime.toInt(), Endian.big);
      hashBytes.addAll(locktimeBytes.buffer.asUint8List());
    }

    // Hash token public key (33 bytes if present, otherwise 33 zero bytes)
    if (output.tokenPublicKey.isEmpty) {
      hashBytes.addAll(Uint8List(33));
    } else {
      hashBytes.addAll(output.tokenPublicKey);
    }

    // Hash token identifier (32 bytes if present, otherwise 32 zero bytes)
    if (output.tokenIdentifier.isEmpty) {
      hashBytes.addAll(Uint8List(32));
    } else {
      hashBytes.addAll(output.tokenIdentifier);
    }

    if (output.tokenAmount.isNotEmpty) {
      if (output.tokenAmount.length > 16) {
        throw SparkValidationError(
          "token amount at index $i exceeds maximum length",
          context: {
            "field": "tokenOutputs[$i].tokenAmount",
            "value": output.tokenAmount,
            "expectedLength": 16,
            "actualLength": output.tokenAmount.length,
            "index": i,
          },
        );
      }
      hashBytes.addAll(output.tokenAmount);
    }

    allHashes.add(_sha256(hashBytes));
  }

  // Sort operator public keys before hashing
  final sortedPubKeys =
      List<Uint8List>.from(tokenTransaction.sparkOperatorIdentityPublicKeys)
        ..sort((a, b) {
          for (int i = 0; i < a.length && i < b.length; i++) {
            if (a[i] != b[i]) return a[i] - b[i];
          }
          return a.length - b.length;
        });

  // Hash spark operator identity public keys length
  final operatorLenBytes = ByteData(4)
    ..setUint32(0, sortedPubKeys.length, Endian.big);
  allHashes.add(_sha256(operatorLenBytes.buffer.asUint8List()));

  // Hash spark operator identity public keys
  for (int i = 0; i < sortedPubKeys.length; i++) {
    final pubKey = sortedPubKeys.elementAtOrNull(i);
    // ignore: unnecessary_null_comparison
    if (pubKey == null) {
      throw SparkValidationError(
        "operator public key at index $i cannot be null",
        context: {"field": "sparkOperatorIdentityPublicKeys[$i]", "index": i},
      );
    }
    if (pubKey.isEmpty) {
      throw SparkValidationError(
        "operator public key at index $i cannot be empty",
        context: {"field": "sparkOperatorIdentityPublicKeys[$i]", "index": i},
      );
    }
    allHashes.add(_sha256(pubKey));
  }

  // Hash the network field
  final networkBytes = ByteData(4)
    ..setUint32(0, tokenTransaction.network.value, Endian.big);
  allHashes.add(_sha256(networkBytes.buffer.asUint8List()));

  // Hash client created timestamp
  // (Assuming it's a Protobuf Timestamp. If it's a Dart DateTime, remove `.toDateTime()`)
  if (!tokenTransaction.hasClientCreatedTimestamp()) {
    throw SparkValidationError(
      "client created timestamp cannot be null for V1 token transactions",
      context: {"field": "clientCreatedTimestamp"},
    );
  }

  final clientUnixTime = tokenTransaction.clientCreatedTimestamp
      .toDateTime()
      .millisecondsSinceEpoch;
  final clientTimestampBytes = ByteData(8)
    ..setUint64(0, clientUnixTime, Endian.big);
  allHashes.add(_sha256(clientTimestampBytes.buffer.asUint8List()));

  if (!partialHash) {
    // Hash expiry time
    final expiryUnixTime = tokenTransaction.hasExpiryTime()
        ? (tokenTransaction.expiryTime.toDateTime().millisecondsSinceEpoch ~/
              1000)
        : 0;

    final expiryTimeBytes = ByteData(8)
      ..setUint64(0, expiryUnixTime, Endian.big);
    allHashes.add(_sha256(expiryTimeBytes.buffer.asUint8List()));
  }

  // Final hash of all concatenated hashes
  final concatenatedHashes = <int>[];
  for (final hash in allHashes) {
    concatenatedHashes.addAll(hash);
  }

  return _sha256(concatenatedHashes);
}

// Ensure these are available based on your project setup
// import 'package:bech32/bech32.dart'; // or your equivalent ported library

class _KeyedInvoice {
  final Uint8List id;
  final String raw;
  _KeyedInvoice(this.id, this.raw);
}

Uint8List hashTokenTransactionV2(
  TokenTransaction? tokenTransaction, [
  bool partialHash = false,
]) {
  // ignore: unnecessary_null_comparison
  if (tokenTransaction == null) {
    throw SparkValidationError(
      "token transaction cannot be null",
      context: {"field": "tokenTransaction"},
    );
  }

  List<Uint8List> allHashes = [];

  // Hash version
  final versionBytes = ByteData(4)
    ..setUint32(0, tokenTransaction.version, Endian.big);
  allHashes.add(_sha256(versionBytes.buffer.asUint8List()));

  // Hash transaction type
  int transactionType = 0;

  if (tokenTransaction.hasMintInput()) {
    transactionType = TokenTransactionType.TOKEN_TRANSACTION_TYPE_MINT.value;
  } else if (tokenTransaction.hasTransferInput()) {
    transactionType =
        TokenTransactionType.TOKEN_TRANSACTION_TYPE_TRANSFER.value;
  } else if (tokenTransaction.hasCreateInput()) {
    transactionType = TokenTransactionType.TOKEN_TRANSACTION_TYPE_CREATE.value;
  } else {
    throw SparkValidationError(
      "token transaction must have exactly one input type",
      context: {"field": "tokenInputs"},
    );
  }

  final typeBytes = ByteData(4)..setUint32(0, transactionType, Endian.big);
  allHashes.add(_sha256(typeBytes.buffer.asUint8List()));

  // Hash token inputs based on type
  if (tokenTransaction.hasTransferInput()) {
    final transferInput = tokenTransaction.transferInput;

    if (transferInput.outputsToSpend.isEmpty) {
      throw SparkValidationError(
        "outputs to spend cannot be empty",
        context: {"field": "tokenInputs.transferInput.outputsToSpend"},
      );
    }

    // Hash outputs to spend length
    final outputsLenBytes = ByteData(4)
      ..setUint32(0, transferInput.outputsToSpend.length, Endian.big);
    allHashes.add(_sha256(outputsLenBytes.buffer.asUint8List()));

    // Hash outputs to spend
    for (int i = 0; i < transferInput.outputsToSpend.length; i++) {
      final output = transferInput.outputsToSpend.elementAtOrNull(i);
      if (output == null) {
        throw SparkValidationError(
          "output cannot be null at index $i",
          context: {
            "field": "tokenInputs.transferInput.outputsToSpend[$i]",
            "index": i,
          },
        );
      }

      final hashBytes = <int>[];

      if (output.prevTokenTransactionHash.isNotEmpty) {
        final prevHash = output.prevTokenTransactionHash;
        if (prevHash.length != 32) {
          throw SparkValidationError(
            "invalid previous transaction hash length at index $i",
            context: {
              "field":
                  "tokenInputs.transferInput.outputsToSpend[$i].prevTokenTransactionHash",
              "value": prevHash,
              "expectedLength": 32,
              "actualLength": prevHash.length,
              "index": i,
            },
          );
        }
        hashBytes.addAll(prevHash);
      }

      final voutBytes = ByteData(4)
        ..setUint32(0, output.prevTokenTransactionVout, Endian.big);
      hashBytes.addAll(voutBytes.buffer.asUint8List());

      allHashes.add(_sha256(hashBytes));
    }
  } else if (tokenTransaction.hasMintInput()) {
    final mintInput = tokenTransaction.mintInput;

    if (mintInput.issuerPublicKey.isNotEmpty) {
      final issuerPubKey = mintInput.issuerPublicKey;
      if (issuerPubKey.isEmpty) {
        throw SparkValidationError(
          "issuer public key cannot be empty",
          context: {
            "field": "tokenInputs.mintInput.issuerPublicKey",
            "value": issuerPubKey,
            "expectedLength": 1,
            "actualLength": 0,
          },
        );
      }
      allHashes.add(_sha256(issuerPubKey));

      final tokenIdentifierBytes = <int>[];
      if (mintInput.tokenIdentifier.isNotEmpty) {
        tokenIdentifierBytes.addAll(mintInput.tokenIdentifier);
      } else {
        tokenIdentifierBytes.addAll(Uint8List(32));
      }
      allHashes.add(_sha256(tokenIdentifierBytes));
    }
  } else if (tokenTransaction.hasCreateInput()) {
    final createInput = tokenTransaction.createInput;

    // Hash issuer public key
    if (createInput.issuerPublicKey.isEmpty) {
      throw SparkValidationError(
        "issuer public key cannot be nil or empty",
        context: {"field": "tokenInputs.createInput.issuerPublicKey"},
      );
    }
    allHashes.add(_sha256(createInput.issuerPublicKey));

    // Hash token name
    if (createInput.tokenName.isEmpty) {
      throw SparkValidationError(
        "token name cannot be empty",
        context: {"field": "tokenInputs.createInput.tokenName"},
      );
    }
    if (createInput.tokenName.length > 20) {
      throw SparkValidationError(
        "token name cannot be longer than 20 bytes",
        context: {
          "field": "tokenInputs.createInput.tokenName",
          "value": createInput.tokenName,
          "expectedLength": 20,
          "actualLength": createInput.tokenName.length,
        },
      );
    }
    allHashes.add(_sha256(utf8.encode(createInput.tokenName)));

    // Hash token ticker
    if (createInput.tokenTicker.isEmpty) {
      throw SparkValidationError(
        "token ticker cannot be empty",
        context: {"field": "tokenInputs.createInput.tokenTicker"},
      );
    }
    if (createInput.tokenTicker.length > 6) {
      throw SparkValidationError(
        "token ticker cannot be longer than 6 bytes",
        context: {
          "field": "tokenInputs.createInput.tokenTicker",
          "value": createInput.tokenTicker,
          "expectedLength": 6,
          "actualLength": createInput.tokenTicker.length,
        },
      );
    }
    allHashes.add(_sha256(utf8.encode(createInput.tokenTicker)));

    // Hash decimals
    final decimalsBytes = ByteData(4)
      ..setUint32(0, createInput.decimals, Endian.big);
    allHashes.add(_sha256(decimalsBytes.buffer.asUint8List()));

    // Hash max supply (fixed 16 bytes)
    if (createInput.maxSupply.isEmpty) {
      throw SparkValidationError(
        "max supply cannot be nil",
        context: {"field": "tokenInputs.createInput.maxSupply"},
      );
    }
    if (createInput.maxSupply.length != 16) {
      throw SparkValidationError(
        "max supply must be exactly 16 bytes",
        context: {
          "field": "tokenInputs.createInput.maxSupply",
          "value": createInput.maxSupply,
          "expectedLength": 16,
          "actualLength": createInput.maxSupply.length,
        },
      );
    }
    allHashes.add(_sha256(createInput.maxSupply));

    // Hash is freezable
    allHashes.add(_sha256([createInput.isFreezable ? 1 : 0]));

    // Hash creation entity public key (only for final hash)
    if (!partialHash && createInput.creationEntityPublicKey.isNotEmpty) {
      allHashes.add(_sha256(createInput.creationEntityPublicKey));
    } else {
      allHashes.add(_sha256([]));
    }
  }

  // Hash token outputs (length + contents)
  final outputsLenBytes = ByteData(4)
    ..setUint32(0, tokenTransaction.tokenOutputs.length, Endian.big);
  allHashes.add(_sha256(outputsLenBytes.buffer.asUint8List()));

  for (int i = 0; i < tokenTransaction.tokenOutputs.length; i++) {
    final output = tokenTransaction.tokenOutputs.elementAtOrNull(i);
    if (output == null) {
      throw SparkValidationError(
        "output cannot be null at index $i",
        context: {"field": "tokenOutputs[$i]", "index": i},
      );
    }

    final hashBytes = <int>[];

    // Only hash ID if it's not empty and not in partial hash mode
    if (output.id.isNotEmpty && !partialHash) {
      if (output.id.isEmpty) {
        throw SparkValidationError(
          "output ID at index $i cannot be empty",
          context: {"field": "tokenOutputs[$i].id", "index": i},
        );
      }
      hashBytes.addAll(utf8.encode(output.id));
    }

    if (output.ownerPublicKey.isNotEmpty) {
      hashBytes.addAll(output.ownerPublicKey);
    }

    if (!partialHash) {
      if (output.revocationCommitment.isNotEmpty) {
        hashBytes.addAll(output.revocationCommitment);
      }

      final bondBytes = ByteData(8)
        ..setUint64(0, output.withdrawBondSats.toInt(), Endian.big);
      hashBytes.addAll(bondBytes.buffer.asUint8List());

      final locktimeBytes = ByteData(
        8,
      )..setUint64(0, output.withdrawRelativeBlockLocktime.toInt(), Endian.big);
      hashBytes.addAll(locktimeBytes.buffer.asUint8List());
    }

    // Hash token public key
    if (output.tokenPublicKey.isEmpty) {
      hashBytes.addAll(Uint8List(33));
    } else {
      hashBytes.addAll(output.tokenPublicKey);
    }

    // Hash token identifier
    if (output.tokenIdentifier.isEmpty) {
      hashBytes.addAll(Uint8List(32));
    } else {
      hashBytes.addAll(output.tokenIdentifier);
    }

    if (output.tokenAmount.isNotEmpty) {
      if (output.tokenAmount.length > 16) {
        throw SparkValidationError(
          "token amount at index $i exceeds maximum length",
          context: {
            "field": "tokenOutputs[$i].tokenAmount",
            "value": output.tokenAmount,
            "expectedLength": 16,
            "actualLength": output.tokenAmount.length,
            "index": i,
          },
        );
      }
      hashBytes.addAll(output.tokenAmount);
    }

    allHashes.add(_sha256(hashBytes));
  }

  // Operator public keys validation
  final sortedPubKeys =
      List<Uint8List>.from(tokenTransaction.sparkOperatorIdentityPublicKeys)
        ..sort((a, b) {
          for (int i = 0; i < a.length && i < b.length; i++) {
            if (a[i] != b[i]) return a[i] - b[i];
          }
          return a.length - b.length;
        });

  // Hash spark operator identity public keys length
  final operatorLenBytes = ByteData(4)
    ..setUint32(0, sortedPubKeys.length, Endian.big);
  allHashes.add(_sha256(operatorLenBytes.buffer.asUint8List()));

  // Hash spark operator identity public keys
  for (int i = 0; i < sortedPubKeys.length; i++) {
    final pubKey = sortedPubKeys.elementAtOrNull(i);
    if (pubKey == null) {
      throw SparkValidationError(
        "operator public key at index $i cannot be null",
        context: {"field": "sparkOperatorIdentityPublicKeys[$i]", "index": i},
      );
    }
    if (pubKey.isEmpty) {
      throw SparkValidationError(
        "operator public key at index $i cannot be empty",
        context: {"field": "sparkOperatorIdentityPublicKeys[$i]", "index": i},
      );
    }
    allHashes.add(_sha256(pubKey));
  }

  // Hash the network field
  final networkBytes = ByteData(4)
    ..setUint32(0, tokenTransaction.network.value, Endian.big);
  allHashes.add(_sha256(networkBytes.buffer.asUint8List()));

  // Hash client created timestamp
  if (!tokenTransaction.hasClientCreatedTimestamp()) {
    throw SparkValidationError(
      "client created timestamp cannot be null for V2 token transactions",
      context: {"field": "clientCreatedTimestamp"},
    );
  }

  final clientUnixTime = tokenTransaction.clientCreatedTimestamp
      .toDateTime()
      .millisecondsSinceEpoch;
  final clientTimestampBytes = ByteData(8)
    ..setUint64(0, clientUnixTime, Endian.big);
  allHashes.add(_sha256(clientTimestampBytes.buffer.asUint8List()));

  if (!partialHash) {
    // Hash expiry time
    final expiryUnixTime = tokenTransaction.hasExpiryTime()
        ? (tokenTransaction.expiryTime.toDateTime().millisecondsSinceEpoch ~/
              1000)
        : 0;

    final expiryTimeBytes = ByteData(8)
      ..setUint64(0, expiryUnixTime, Endian.big);
    allHashes.add(_sha256(expiryTimeBytes.buffer.asUint8List()));
  }

  // === V2 SPECIFIC: Hash invoice attachments ===
  final attachments = tokenTransaction.invoiceAttachments;

  // Hash attachments length (uint32 BE)
  final lenBytes = ByteData(4)..setUint32(0, attachments.length, Endian.big);
  allHashes.add(_sha256(lenBytes.buffer.asUint8List()));

  final sortedInvoices = <_KeyedInvoice>[];

  for (int i = 0; i < attachments.length; i++) {
    final attachment = attachments.elementAtOrNull(i);
    if (attachment == null) {
      throw SparkValidationError(
        "invoice attachment at index $i cannot be null",
        context: {"field": "invoiceAttachments[$i]", "index": i},
      );
    }

    final invoice = attachment.sparkInvoice;
    Uint8List? idBytes;

    try {
      const codec = Bech32mCodec();
      final decoded = codec.decode(invoice, 500);
      final payloadBytes = _fromWords(decoded.data);
      final payload = SparkAddress.fromBuffer(Uint8List.fromList(payloadBytes));

      if (!payload.hasSparkInvoiceFields() ||
          !payload.sparkInvoiceFields.hasId()) {
        throw Exception("missing spark invoice fields or id");
      }
      // Assuming id is parsed as a List<int> / Uint8List in Dart
      idBytes = Uint8List.fromList(payload.sparkInvoiceFields.id);
    } catch (err) {
      throw SparkValidationError(
        "invalid invoice at $i",
        context: {
          "field": "invoiceAttachments[$i].sparkInvoice",
          "index": i,
          "value": invoice,
          "error": err.toString(),
        },
      );
    }

    if (idBytes.length != 16) {
      throw SparkValidationError(
        "invalid invoice id at $i",
        context: {"field": "invoiceAttachments[$i].sparkInvoice", "index": i},
      );
    }
    sortedInvoices.add(_KeyedInvoice(idBytes, invoice));
  }

  // Sort by UUID bytes (lexicographically)
  sortedInvoices.sort((a, b) {
    for (int j = 0; j < a.id.length && j < b.id.length; j++) {
      if (a.id[j] != b.id[j]) return a.id[j] - b.id[j];
    }
    return a.id.length - b.id.length;
  });

  // Hash raw invoice strings (UTF-8)
  for (final k in sortedInvoices) {
    allHashes.add(_sha256(utf8.encode(k.raw)));
  }

  // Final hash of all concatenated hashes
  final concatenatedHashes = <int>[];
  for (final hash in allHashes) {
    concatenatedHashes.addAll(hash);
  }

  return _sha256(concatenatedHashes);
}

Uint8List _fromWords(List<int> words) {
  int acc = 0;
  int bits = 0;
  final result = <int>[];
  final maxv = (1 << 8) - 1;

  for (var value in words) {
    if (value < 0 || value >> 5 != 0) {
      throw Exception('Invalid value: $value');
    }
    acc = (acc << 5) | value;
    bits += 5;
    while (bits >= 8) {
      bits -= 8;
      result.add((acc >> bits) & maxv);
    }
  }

  // Validates padding to ensure data isn't mangled
  if (bits >= 5 || ((acc << (8 - bits)) & maxv) != 0) {
    throw Exception('Invalid padding');
  }

  return Uint8List.fromList(result);
}

TokenTransactionType inferTokenTransactionType(
  TokenTransaction tokenTransaction,
) {
  if (tokenTransaction.hasCreateInput()) {
    return TokenTransactionType.TOKEN_TRANSACTION_TYPE_CREATE;
  } else if (tokenTransaction.hasMintInput()) {
    return TokenTransactionType.TOKEN_TRANSACTION_TYPE_MINT;
  } else {
    // transferInput is the default fallback matching your TS logic
    return TokenTransactionType.TOKEN_TRANSACTION_TYPE_TRANSFER;
  }
}

List<InvoiceAttachment>? sortInvoiceAttachments(
  List<InvoiceAttachment>? attachments,
) {
  if (attachments == null || attachments.isEmpty) {
    return attachments;
  }

  // Create a copy of the list so we don't mutate the original
  final sorted = List<InvoiceAttachment>.from(attachments);

  // Dart's String.compareTo handles standard lexicographical sorting
  sorted.sort((a, b) => a.sparkInvoice.compareTo(b.sparkInvoice));

  return sorted;
}

Future<Uint8List> hashTokenTransactionV3(
  TokenTransaction? tokenTransaction, [
  bool partialHash = false,
]) async {
  // ignore: unnecessary_null_comparison
  if (tokenTransaction == null) {
    throw SparkValidationError(
      "token transaction cannot be null",
      context: {"field": "tokenTransaction"},
    );
  }

  // Assumes you have ported createProtoHasher()
  final hasher = createProtoHasher();

  if (partialHash) {
    // Use Dart's built-in Protobuf deepCopy() rather than JS object spread
    final cloned = tokenTransaction.deepCopy();
    cloned.clearExpiryTime();

    final inputType = inferTokenTransactionType(cloned);

    switch (inputType) {
      case TokenTransactionType.TOKEN_TRANSACTION_TYPE_CREATE:
        if (cloned.hasCreateInput()) {
          cloned.createInput.clearCreationEntityPublicKey();
        }
        break;

      case TokenTransactionType.TOKEN_TRANSACTION_TYPE_MINT:
      case TokenTransactionType.TOKEN_TRANSACTION_TYPE_TRANSFER:
        // Dart Protobuf repeated fields are never null, so we can iterate safely
        for (final output in cloned.tokenOutputs) {
          output.clearId();
          output.clearRevocationCommitment();
          output.clearWithdrawBondSats();
          output.clearWithdrawRelativeBlockLocktime();
        }
        break;

      default:
        throw SparkValidationError(
          "unsupported token transaction type: $inputType",
          context: {"field": "tokenInputs"},
        );
    }

    return await hasher.hashProto(cloned);  //"spark_token.TokenTransaction");
  }

  // If not partial, we can just hash the original.
  // (In TS, it wraps it to ensure invoiceAttachments is an empty array if null,
  // but Dart Protobuf handles repeated fields natively, so no spreading needed).
  return await hasher.hashProto(
    tokenTransaction,
    // "spark_token.TokenTransaction",
  );
}

Future<Uint8List> hashPartialTokenTransaction(
  PartialTokenTransaction partialTokenTransaction,
) async {
  final hasher = createProtoHasher();

  return await hasher.hashProto(
    partialTokenTransaction,
    // "spark_token.PartialTokenTransaction",
  );
}

Future<Uint8List> hashFinalTokenTransaction(
  FinalTokenTransaction? finalTokenTransaction,
) async {
  // ignore: unnecessary_null_comparison
  if (finalTokenTransaction == null) {
    throw SparkValidationError(
      "final token transaction cannot be null",
      context: {"field": "finalTokenTransaction"},
    );
  }

  final hasher = createProtoHasher();

  return await hasher.hashProto(
    finalTokenTransaction,
    // "spark_token.FinalTokenTransaction",
  );
}

Uint8List hashOperatorSpecificTokenTransactionSignablePayload(
  OperatorSpecificTokenTransactionSignablePayload? payload,
) {
  // ignore: unnecessary_null_comparison
  if (payload == null) {
    throw SparkValidationError(
      "operator specific token transaction signable payload cannot be null",
      context: {"field": "payload"},
    );
  }

  List<Uint8List> allHashes = [];

  // Hash final token transaction hash if present
  if (payload.finalTokenTransactionHash != null) {
    final hashBytes = payload.finalTokenTransactionHash!;
    if (hashBytes.length != 32) {
      throw SparkValidationError(
        "invalid final token transaction hash length",
        context: {
          "field": "finalTokenTransactionHash",
          "value": hashBytes,
          "expectedLength": 32,
          "actualLength": hashBytes.length,
        },
      );
    }
    allHashes.add(_sha256(hashBytes));
  }

  // Hash operator identity public key
  if (payload.operatorIdentityPublicKey == null) {
    throw SparkValidationError(
      "operator identity public key cannot be null",
      context: {"field": "operatorIdentityPublicKey"},
    );
  }

  if (payload.operatorIdentityPublicKey!.isEmpty) {
    throw SparkValidationError(
      "operator identity public key cannot be empty",
      context: {"field": "operatorIdentityPublicKey"},
    );
  }

  allHashes.add(_sha256(payload.operatorIdentityPublicKey!));

  // Final hash of all concatenated hashes
  final concatenatedHashes = <int>[];
  for (final hash in allHashes) {
    concatenatedHashes.addAll(hash);
  }

  return _sha256(concatenatedHashes);
}
