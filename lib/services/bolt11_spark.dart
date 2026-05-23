import 'dart:convert';
import 'dart:typed_data';
import 'package:bech32/bech32.dart';
import 'package:blockchain_utils/crypto/quick_crypto.dart';
import 'package:convert/convert.dart';
import 'package:bolt11_decoder/bolt11_decoder.dart';
import 'package:decimal/decimal.dart';

import '../utils/network.dart'; // Adjust based on your Network enum location
import '../errors/spark_error.dart'; // Adjust for SparkValidationError

// Sentinel value for spark address in routing hints
const _receiverIdentityPublicKeyShortChannelId = "f42400f424000001";

// Version code for spark invoice in BOLT-11 fallback address
const _sparkInvoiceFallbackVersion = 31;

const _paymentHashName = "payment_hash";
const _paymentSecretName = "payment_secret";
const _fallbackAddressName = "fallback_address";

class DecodedInvoice {
  final BigInt? amountMSats;
  final String? fallbackAddress;
  final String paymentHash;
  final String? payeePublicKey;
  final List<int>? signature;
  final List<int>? msgHash;

  DecodedInvoice({
    this.amountMSats,
    this.fallbackAddress,
    required this.paymentHash,
    this.payeePublicKey,
    this.signature,
    this.msgHash,
  });
}

DecodedInvoice decodeInvoice(String invoice) {
  // Decode the BOLT-11 invoice using the package
  final req = Bolt11PaymentRequest(invoice);

  

  final network = getNetworkFromInvoice(invoice);

  if (network == null) {
    throw SparkValidationError(
      "Invalid network found in invoice",
      context: {'invoice': invoice},
    );
  }

  String? paymentHash;
  String? paymentSecret;
  String? fallbackAddress;
  String? payeePublicKey;
  List<int> msgHash = calculateMessageHash(invoice);

  // Loop through the strongly-typed tags instead of 'dynamic' sections
  for (final tag in req.tags) {
    if (tag.type == _paymentHashName) {
      paymentHash = tag.data?.toString();
    } else if (tag.type == _paymentSecretName) {
      paymentSecret = tag.data?.toString();
    } else if (tag.type == _fallbackAddressName) {
      // Depending on the address type, the data could be a Map or a direct String
      final data = tag.data;
      String? parsedAddress;
      if (data is Map) {
        parsedAddress =
            data['address']?.toString() ?? data['value']?.toString();
      } else {
        parsedAddress = data?.toString();
      }

      if (parsedAddress != null) {
        fallbackAddress = parseSparkFallbackAddress(parsedAddress);
      }
    } else if (tag.type == 'routing_info' || tag.type == 'r') {
      // Fall back to checking routing hints for identity pubkey (legacy format)
      if (fallbackAddress == null) {
        final data = tag.data;
        if (data is List) {
          for (final routeHint in data) {
            // Safely access properties depending on if it's parsed as a Map or an Object
            final shortChannelId = routeHint is Map
                ? routeHint['short_channel_id']
                : routeHint.shortChannelId;

            if (shortChannelId == _receiverIdentityPublicKeyShortChannelId) {
              fallbackAddress = routeHint is Map
                  ? routeHint['pubkey']
                  : routeHint.pubkey;
              break;
            }
          }
        }
      }
    }
  }

  if (paymentHash == null) {
    throw SparkValidationError(
      "No payment hash found in invoice",
      context: {'invoice': invoice},
    );
  }

  if (paymentSecret == null) {
    throw SparkValidationError(
      "Invalid payment secret found in invoice",
      context: {'invoice': invoice},
    );
  }

  // The package natively exposes the amount as a num/double (usually in BTC)
  // Multiply by 100,000,000,000 to convert BTC directly to millisatoshis
  final msatMultiplier = Decimal.parse('100000000000');
  final calculatedMsats = req.amount * msatMultiplier;
  BigInt? amountMSats = (calculatedMsats.toBigInt()==BigInt.zero) ? null : calculatedMsats.toBigInt();

  return DecodedInvoice(
    amountMSats: amountMSats,
    fallbackAddress: fallbackAddress,
    paymentHash: paymentHash,
    payeePublicKey: payeePublicKey,
    signature: req.signature,
    msgHash: msgHash,
  );
}

/// Converts 5-bit bech32 words to bytes with lenient padding handling.
///
/// Unlike standard bech32 decoders, this ignores excess padding bits at the end
/// which can occur in BOLT-11 fallback address data.
Uint8List _fromWordsLenient(List<int> words) {
  int bits = 0;
  int value = 0;
  final result = <int>[];

  for (final word in words) {
    value = (value << 5) | word;
    bits += 5;

    while (bits >= 8) {
      bits -= 8;
      result.add((value >> bits) & 0xff);
    }
  }

  return Uint8List.fromList(result);
}

/// Parses the fallback address value from a BOLT-11 invoice.
///
/// For spark invoices (version 31), the data is the raw spark invoice bytes.
/// The JS library returns unknown tags as { tagCode, words } where words is a
/// bech32-encoded string of the 5-bit words.
String? parseSparkFallbackAddress(dynamic value) {
  if (value == null) return null;

  // If it's already a string (shouldn't happen with the JS library but handle it)
  if (value is String) {
    return value;
  }

  // Handle it if the decoder returned a Map for the unknown tag
  if (value is Map && value.containsKey('words') && value['words'] is String) {
    try {
      final wordsString = value['words'] as String;

      // We use Bech32Codec from package:bech32 with a high max length limit
      const codec = Bech32Codec();
      final decoded = codec.decode(wordsString, 5000);
      final words = decoded.data;

      if (words.isNotEmpty) {
        // First 5-bit word is the witness version
        final version = words[0];
        if (version == _sparkInvoiceFallbackVersion) {
          // Remaining words contain the spark invoice data
          final dataWords = words.sublist(1);
          final invoiceBytes = _fromWordsLenient(dataWords);
          return utf8.decode(invoiceBytes);
        }
      }
    } catch (_) {
      return null;
    }
  }

  return null;
}

Network? getNetworkFromInvoice(String invoice) {
  // order matters here
  if (invoice.startsWith("lnbcrt")) {
    return Network.regtest; // Adjust to your enum
  }
  if (invoice.startsWith("lnbc")) return Network.mainnet;
  if (invoice.startsWith("lntb")) return Network.testnet;
  if (invoice.startsWith("lnsb")) return Network.signet;

  return null;
}

bool isValidSparkAddressFallback(String address) {
  try {
    final bytes = hex.decode(address);
    // 33-byte identity public key
    if (bytes.length != 33) {
      return false;
    }
    return true;
  } catch (_) {
    return false;
  }
}

List<int> calculateMessageHash(String fullInvoice) {
  final decoded = Bech32Codec().decode(fullInvoice, fullInvoice.length);
  
  // 1. Get the 5-bit words excluding the signature
  final dataWithoutSignature = decoded.data.sublist(0, decoded.data.length - 104);
  
  // 2. CONVERT the 5-bit words to 8-bit bytes (padded = true per BOLT 11)
  final dataBytes = convertBits(dataWithoutSignature, 5, 8, true);
  
  // 3. Get HRP as UTF-8 bytes
  List<int> hrpBytes = utf8.encode(decoded.hrp);

  // 4. Combine 8-bit HRP bytes with 8-bit Data bytes
  List<int> commitment = [...hrpBytes, ...dataBytes];

  // 5. Hash the properly formatted byte array
  return QuickCrypto.sha256Hash(commitment);
}

List<int> convertBits(List<int> data, int fromBits, int toBits, bool pad) {
  int acc = 0;
  int bits = 0;
  List<int> result = [];
  int maxv = (1 << toBits) - 1;

  for (int v in data) {
    if (v < 0 || (v >> fromBits) != 0) {
      throw Exception("Invalid value in data");
    }
    acc = (acc << fromBits) | v;
    bits += fromBits;
    while (bits >= toBits) {
      bits -= toBits;
      result.add((acc >> bits) & maxv);
    }
  }

  if (pad) {
    if (bits > 0) {
      result.add((acc << (toBits - bits)) & maxv);
    }
  } else if (bits >= fromBits || ((acc << (toBits - bits)) & maxv) != 0) {
    throw Exception("Invalid padding");
  }

  return result;
}
