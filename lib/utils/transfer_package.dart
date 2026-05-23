// lib/utils/transfer_package.dart

import 'dart:typed_data';

// Ensure you import your generated proto and custom hasher implementation
import 'package:spark_dart/services/transfer.dart';

import '../src/proto/spark.pb.dart';
import 'hashstructure.dart';
import 'hex.dart';

/// Returns the signing payload for a transfer package.
/// Uses V2 structured hashing with domain tag for collision resistance.
Uint8List getTransferPackageSigningPayload(
  String transferId,
  TransferPackage transferPackage, // Your generated gRPC proto class
) {
  // Remove hyphens and decode the hex string into a Uint8List
  final transferIdBytes = Uint8List.fromList(
    hexToBytes(transferId.replaceAll('-', '')),
  );

  return newHasher(['spark', 'transfer', 'signing payload'])
      .addBytes(transferIdBytes)
      // Note: In Dart protobufs, map fields are generated as Map<String, List<int>>.
      // You may need to cast/map them if your addMapStringToBytes strictly expects Uint8List.
      .addMapStringToBytes(
        transferPackage.keyTweakPackage.mapValues<Uint8List>((v)=>Uint8List.fromList(v)),
      )
      .hash();
}

/// Returns the signing payload for a claim package.
Uint8List getClaimPackageSigningPayload(
  String transferId,
  Map<String, Uint8List> keyTweakPackage,
) {
  final transferIdBytes = Uint8List.fromList(
    hexToBytes(transferId.replaceAll('-', '')),
  );

  return newHasher([
    'spark',
    'claim',
    'signing payload',
  ]).addBytes(transferIdBytes).addMapStringToBytes(keyTweakPackage).hash();
}
