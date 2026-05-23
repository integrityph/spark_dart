import 'dart:convert';
import 'dart:typed_data';

import 'package:bitcoin_base/bitcoin_base.dart' hide UTXO;
import 'package:boringssl_ffi/boringssl_ffi.dart' as bsll;
import 'package:secp256k1_ffi/secp256k1_ffi.dart';

import '../services/transfer.dart';
import '../spark_bindings/types.dart';

import '../errors/types.dart'; // SparkRequestError, SparkValidationError
import '../src/proto/spark.pbgrpc.dart'; // Address, FinalizeDepositTreeCreationResponse, GenerateDepositAddressResponse, GetSigningCommitmentsResponse, HashVariant
import '../signer/types.dart'; // KeyDerivation
import '../utils/bitcoin.dart'; // getSigHashFromMultiInputTx, getSigHashFromTx, getP2trTweakedPubkey
import '../utils/keys.dart'; // subtractPublicKeys
// import '../utils/network.dart' hide Network; // getNetwork
import '../utils/proof.dart'; // proofOfPossessionMessageHashForDepositAddress
import '../utils/transaction.dart'; // createInitialTimelockRefundTxs, createMultiInputRootTx, createRootNodeTx
import '../utils/hex.dart'; // hexToBytes
// import '../utils/crypto.dart'; // sha256Bytes, schnorrVerify, secp256k1VerifyDer
import 'config.dart'; // WalletConfigService
import 'connection/connection.dart' hide Address; // ConnectionManager

class ValidateDepositAddressParams {
  final Address address;
  final Uint8List userPubkey;
  final bool verifyCoordinatorProof;

  ValidateDepositAddressParams({
    required this.address,
    required this.userPubkey,
    this.verifyCoordinatorProof = false,
  });
}

class GenerateStaticDepositAddressParams {
  final Uint8List signingPubkey;

  GenerateStaticDepositAddressParams({required this.signingPubkey});
}

class GenerateDepositAddressParams {
  final Uint8List signingPubkey;
  final String leafId;
  final bool isStatic;

  GenerateDepositAddressParams({
    required this.signingPubkey,
    required this.leafId,
    this.isStatic = false,
  });
}

class CreateTreeRootParams {
  final KeyDerivation keyDerivation;
  final Uint8List verifyingKey;
  final BtcTransaction depositTx; // Assume Transaction class exists
  final int vout;

  CreateTreeRootParams({
    required this.keyDerivation,
    required this.verifyingKey,
    required this.depositTx,
    required this.vout,
  });
}

class CreateTreeRootMultiUtxoParams {
  final KeyDerivation keyDerivation;
  final Uint8List verifyingKey;
  final List<Map<String, dynamic>>
  depositTxs; // e.g. [{'tx': Transaction, 'vout': int}]

  CreateTreeRootMultiUtxoParams({
    required this.keyDerivation,
    required this.verifyingKey,
    required this.depositTxs,
  });
}

class DepositService {
  final WalletConfigService config;
  final ConnectionManager connectionManager;

  DepositService(this.config, this.connectionManager);

  Future<void> _validateDepositAddress(
    ValidateDepositAddressParams params,
  ) async {
    final address = params.address;
    final userPubkey = params.userPubkey;
    final verifyCoordinatorProof = params.verifyCoordinatorProof;

    if (!address.hasDepositAddressProof() ||
        address.depositAddressProof.proofOfPossessionSignature.isEmpty ||
        address.depositAddressProof.addressSignatures.isEmpty) {
      throw SparkValidationError(
        "Proof of possession signature or address signatures is null",
        context: {
          'field': "depositAddressProof",
          'value': address.depositAddressProof,
        },
      );
    }

    final operatorPubkey = subtractPublicKeys(
      Uint8List.fromList(address.verifyingKey),
      userPubkey,
    );

    final msg = proofOfPossessionMessageHashForDepositAddress(
      await config.signer.getIdentityPublicKey(),
      operatorPubkey,
      address.address,
    );

    final taprootKey = P2trAddress.fromInternalKey(
      internalKey: operatorPubkey.sublist(1, 33),
    ).toScriptPubKey().toBytes().sublist(2);

    // Assuming a wrapper utility for schnorr.verify
    final isVerified = schnorrVerify(
      Uint8List.fromList(
        address.depositAddressProof.proofOfPossessionSignature,
      ),
      msg,
      Uint8List.fromList(taprootKey),
    );

    if (!isVerified) {
      throw SparkValidationError(
        "Proof of possession signature verification failed",
        context: {
          'field': "proofOfPossessionSignature",
          'value': address.depositAddressProof.proofOfPossessionSignature,
        },
      );
    }

    final addrHash = bsll.sha256.hash(utf8.encode(address.address))!;

    for (final operator in config.getSigningOperators().values) {
      if (operator.identifier == config.getCoordinatorIdentifier() &&
          !verifyCoordinatorProof) {
        continue;
      }

      final opPubkey = hexToBytes(operator.identityPublicKey);
      final operatorSig =
          address.depositAddressProof.addressSignatures[operator.identifier];

      if (operatorSig == null || operatorSig.isEmpty) {
        throw SparkValidationError(
          "Operator signature not found",
          context: {'field': "addressSignatures", 'value': operator.identifier},
        );
      }

      final isOpVerified = secp256k1VerifyDer(
        Uint8List.fromList(operatorSig),
        Uint8List.fromList(addrHash),
        opPubkey,
      );

      if (!isOpVerified) {
        throw SparkValidationError(
          "Operator signature verification failed",
          context: {'field': "operatorSignature", 'value': operatorSig},
        );
      }
    }
  }

  bool secp256k1VerifyDer(
    Uint8List derSig,
    Uint8List msgHash,
    Uint8List pubKeyBytes,
  ) {
    try {
      return secp256k1FFI.ecdsa.verify(pubKeyBytes, msgHash, derSig);
    } catch (e) {
      return false;
    }
  }

  bool schnorrVerify(Uint8List signature, Uint8List msg, Uint8List taprootKey) {
    try {
      // Bip340 is the exact Schnorr standard used by Taproot
      return secp256k1FFI.schnorr.verify(
        taprootKey, // Your 32-byte x-only public key
        msg, // The 32-byte message hash
        signature, // The 64-byte signature
      ) ?? false;
    } catch (e) {
      // Cryptography libraries often throw exceptions for invalid/malformed signatures
      // rather than gracefully returning false, so catching is safer.
      return false;
    }
  }

  Future<GenerateStaticDepositAddressResponse> generateStaticDepositAddress(
    GenerateStaticDepositAddressParams params,
  ) async {
    final signingPubkey = params.signingPubkey;
    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    GenerateStaticDepositAddressResponse depositResp;
    try {
      depositResp = await sparkClient.generate_static_deposit_address(
        GenerateStaticDepositAddressRequest(
          // Map to generated proto class
          signingPublicKey: signingPubkey,
          identityPublicKey: await config.signer.getIdentityPublicKey(),
          network: Network.valueOf(config.getNetworkProto()),
          hashVariant: HashVariant.HASH_VARIANT_V2,
        ),
      );
    } catch (error) {
      throw SparkRequestError(
        "Failed to generate static deposit address",
        context: {
          'operation': "generate_static_deposit_address",
          'error': error,
        },
      );
    }

    if (!depositResp.hasDepositAddress()) {
      throw SparkValidationError(
        "No static deposit address response from coordinator",
        context: {'field': "depositAddress", 'value': depositResp},
      );
    }

    await _validateDepositAddress(
      ValidateDepositAddressParams(
        address: depositResp.depositAddress,
        userPubkey: signingPubkey,
        verifyCoordinatorProof: true,
      ),
    );

    return depositResp;
  }

  Future<GenerateDepositAddressResponse> generateDepositAddress(
    GenerateDepositAddressParams params,
  ) async {
    final signingPubkey = params.signingPubkey;
    final leafId = params.leafId;
    final isStatic = params.isStatic;

    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    GenerateDepositAddressResponse depositResp;
    try {
      depositResp = await sparkClient.generate_deposit_address(
        GenerateDepositAddressRequest(
          // Map to generated proto class
          signingPublicKey: signingPubkey,
          identityPublicKey: await config.signer.getIdentityPublicKey(),
          network: Network.valueOf(config.getNetworkProto()),
          leafId: leafId,
          isStatic: isStatic,
          hashVariant: HashVariant.HASH_VARIANT_V2,
        ),
      );
    } catch (error) {
      throw SparkRequestError(
        "Failed to generate deposit address",
        context: {'operation': "generate_deposit_address", 'error': error},
      );
    }

    if (!depositResp.hasDepositAddress()) {
      throw SparkValidationError(
        "No deposit address response from coordinator",
        context: {'field': "depositAddress", 'value': depositResp},
      );
    }

    await _validateDepositAddress(
      ValidateDepositAddressParams(
        address: depositResp.depositAddress,
        userPubkey: signingPubkey,
      ),
    );

    return depositResp;
  }

  Future<({List<TreeNode> nodes})> createTreeRoot(
    CreateTreeRootParams params,
  ) async {
    final keyDerivation = params.keyDerivation;
    final verifyingKey = params.verifyingKey;
    final depositTx = params.depositTx;
    final vout = params.vout;

    // Create root transactions (CPFP and direct)
    final output = depositTx.outputs.elementAtOrNull(vout);
    if (output == null) {
      throw SparkValidationError(
        "Invalid deposit transaction output",
        context: {
          'field': "vout",
          'value': vout,
          'expected': "Valid output index",
        },
      );
    }

    final rootTxResult = await createRootNodeTx(
      depositTx,
      vout,
      config.getNetwork(),
    );
    final cpfpRootTx = rootTxResult.nodeTx;

    // Create nonce commitments for root transactions
    final cpfpRootNonceCommitment = await config.signer
        .getRandomSigningCommitment();

    // Get sighashes for root transactions
    final cpfpRootTxSighash = getSigHashFromTx(cpfpRootTx, 0, [output]);

    final signingPubKey = await config.signer.getPublicKeyFromDerivation(
      keyDerivation: keyDerivation,
    );

    final refundTxsResult = await createInitialTimelockRefundTxs(
      RefundTxParams(
        nodeTx: cpfpRootTx,
        receivingPubkey: signingPubKey,
        network: config.getNetwork(),
      ),
    );
    final cpfpRefundTx = refundTxsResult.cpfpRefundTx;
    final directFromCpfpRefundTx = refundTxsResult.directFromCpfpRefundTx;

    // Create nonce commitments for refund transactions
    final cpfpRefundNonceCommitment = await config.signer
        .getRandomSigningCommitment();
    final directFromCpfpRefundNonceCommitment = await config.signer
        .getRandomSigningCommitment();

    // Get sighashes for refund transactions
    final cpfpRefundTxSighash = getSigHashFromTx(
      cpfpRefundTx,
      0,
      [cpfpRootTx.outputs.elementAt(0)],
    );

    if (directFromCpfpRefundTx == null) {
      throw SparkValidationError(
        "Expected direct from cpfp refund transaction for tree creation",
        context: {
          'field': "directFromCpfpRefundTx",
          'value': directFromCpfpRefundTx,
        },
      );
    }

    final directFromCpfpRefundTxSighash = getSigHashFromTx(
      directFromCpfpRefundTx,
      0,
      [cpfpRootTx.outputs.elementAt(0)],
    );

    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    GetSigningCommitmentsResponse signingCommittmentResp;

    try {
      signingCommittmentResp = await sparkClient.get_signing_commitments(
        GetSigningCommitmentsRequest(count: 3, nodeIdCount: 1), // Map to proto
      );
    } catch (error) {
      throw SparkRequestError(
        "Failed to start deposit tree creation",
        context: {'operation': "get_signing_commitments", 'error': error},
      );
    }

    if (signingCommittmentResp.signingCommitments.length != 3) {
      throw SparkValidationError(
        "Incorrect number of signing commitments returned",
        context: {
          'field': "signingCommitments",
          'value': signingCommittmentResp.signingCommitments.length,
          'expected': 3,
        },
      );
    }

    final cpfpRootCommitment = signingCommittmentResp.signingCommitments[0];
    final cpfpRefundCommitment = signingCommittmentResp.signingCommitments[1];
    final directFromCpfpRefundCommitment =
        signingCommittmentResp.signingCommitments[2];

    // Sign all three transactions
    final cpfpRootSignature = await config.signer.signFrost(
      SignFrostParams(
        message: cpfpRootTxSighash,
        publicKey: signingPubKey,
        keyDerivation: keyDerivation,
        verifyingKey: verifyingKey,
        selfCommitment: cpfpRootNonceCommitment,
        statechainCommitments: cpfpRootCommitment.signingNonceCommitments
            .mapValues<ISigningCommitment>(
              (v) => ISigningCommitment(
                hiding: Uint8List.fromList(v.hiding),
                binding: Uint8List.fromList(v.binding),
              ),
            ),
        adaptorPubKey: Uint8List(0),
      ),
    );

    final cpfpRefundSignature = await config.signer.signFrost(
      SignFrostParams(
        message: cpfpRefundTxSighash,
        publicKey: signingPubKey,
        keyDerivation: keyDerivation,
        verifyingKey: verifyingKey,
        selfCommitment: cpfpRefundNonceCommitment,
        statechainCommitments: cpfpRefundCommitment.signingNonceCommitments
            .mapValues<ISigningCommitment>(
              (v) => ISigningCommitment(
                hiding: Uint8List.fromList(v.hiding),
                binding: Uint8List.fromList(v.binding),
              ),
            ),
        adaptorPubKey: Uint8List(0),
      ),
    );

    final directFromCpfpRefundSignature = await config.signer.signFrost(
      SignFrostParams(
        message: directFromCpfpRefundTxSighash,
        publicKey: signingPubKey,
        keyDerivation: keyDerivation,
        verifyingKey: verifyingKey,
        selfCommitment: directFromCpfpRefundNonceCommitment,
        statechainCommitments: directFromCpfpRefundCommitment
            .signingNonceCommitments
            .mapValues<ISigningCommitment>(
              (v) => ISigningCommitment(
                hiding: Uint8List.fromList(v.hiding),
                binding: Uint8List.fromList(v.binding),
              ),
            ),
        adaptorPubKey: Uint8List(0),
      ),
    );

    FinalizeDepositTreeCreationResponse finalizeResp;

    try {
      finalizeResp = await sparkClient.finalize_deposit_tree_creation(
        FinalizeDepositTreeCreationRequest(
          // Map to proto
          identityPublicKey: await config.signer.getIdentityPublicKey(),
          onChainUtxo: UTXO(
            vout: vout,
            rawTx: depositTx.toBytes(
              allowWitness: true,
            ), // Map to Dart transaction serialization
            network: Network.valueOf(config.getNetworkProto()),
          ),
          rootTxSigningJob: UserSignedTxSigningJob(
            signingPublicKey: signingPubKey,
            rawTx: cpfpRootTx.toBytes(),
            signingNonceCommitment: cpfpRootNonceCommitment.commitment
                .toProto(),
            userSignature: cpfpRootSignature,
            signingCommitments: SigningCommitments(
              signingCommitments:
                  cpfpRootCommitment.signingNonceCommitments.entries,
            ),
          ),
          refundTxSigningJob: UserSignedTxSigningJob(
            signingPublicKey: signingPubKey,
            rawTx: cpfpRefundTx.toBytes(),
            signingNonceCommitment: cpfpRefundNonceCommitment.commitment
                .toProto(),
            userSignature: cpfpRefundSignature,
            signingCommitments: SigningCommitments(
              signingCommitments:
                  cpfpRefundCommitment.signingNonceCommitments.entries,
            ),
          ),
          directFromCpfpRefundTxSigningJob: UserSignedTxSigningJob(
            signingPublicKey: signingPubKey,
            rawTx: directFromCpfpRefundTx.toBytes(),
            signingNonceCommitment: directFromCpfpRefundNonceCommitment
                .commitment
                .toProto(),
            userSignature: directFromCpfpRefundSignature,
            signingCommitments: SigningCommitments(
              signingCommitments: directFromCpfpRefundCommitment
                  .signingNonceCommitments
                  .entries,
            ),
          ),
        ),
      );
    } catch (error) {
      throw SparkRequestError(
        "Failed to finalize tree creation",
        context: {
          'operation': "finalize_deposit_tree_creation",
          'error': error,
        },
      );
    }

    if (!finalizeResp.hasRootNode()) {
      throw SparkRequestError(
        "root node not returned from finalize tree request",
        context: {'operation': "finalize_deposit_tree_creation"},
      );
    }
    return (nodes: [finalizeResp.rootNode]);
  }

  Future<({List<TreeNode> nodes})> createTreeRootMultiUtxo(
    CreateTreeRootMultiUtxoParams params,
  ) async {
    final keyDerivation = params.keyDerivation;
    final verifyingKey = params.verifyingKey;
    final depositTxs = params.depositTxs;

    if (depositTxs.length < 2) {
      throw SparkValidationError(
        "createTreeRootMultiUtxo requires at least 2 deposit transactions",
        context: {
          'field': "depositTxs",
          'value': depositTxs.length,
          'expected': "At least 2 deposit transactions",
        },
      );
    }

    final cpfpRootTx = createMultiInputRootTx(
      depositTxs
          .map<DepositTx>((v) => DepositTx(tx: v["tx"], vout: v["vout"]))
          .toList(),
    );

    // Build prevOutputs array for multi-input sighash computation
    final prevOutputs = depositTxs.map<TxOutput>((m) {
      final tx = m['tx'] as BtcTransaction;
      final vout = m['vout'] as int;
      return tx.outputs.elementAt(vout);
    }).toList();

    // Compute sighash for each root tx input
    final rootSighashes = List.generate(depositTxs.length, (i) {
      return getSigHashFromMultiInputTx(cpfpRootTx, i, prevOutputs);
    });

    // Generate user nonce commitment for each root tx input
    final rootNoncesFutures = depositTxs.map(
      (_) => config.signer.getRandomSigningCommitment(),
    );
    final rootNonces = await Future.wait(rootNoncesFutures);

    final signingPubKey = await config.signer.getPublicKeyFromDerivation(
      keyDerivation: keyDerivation,
    );

    // Refund txs spend root tx output 0 — same as single-input path
    final refundTxsResult = await createInitialTimelockRefundTxs(
      RefundTxParams(
        nodeTx: cpfpRootTx,
        receivingPubkey: signingPubKey,
        network: config.getNetwork(),
      ),
    );
    final cpfpRefundTx = refundTxsResult.cpfpRefundTx;
    final directFromCpfpRefundTx = refundTxsResult.directFromCpfpRefundTx;

    final cpfpRefundNonceCommitment = await config.signer
        .getRandomSigningCommitment();
    final directFromCpfpRefundNonceCommitment = await config.signer
        .getRandomSigningCommitment();

    final cpfpRefundTxSighash = getSigHashFromTx(
      cpfpRefundTx,
      0,
      [cpfpRootTx.outputs.elementAt(0)],
    );

    if (directFromCpfpRefundTx == null) {
      throw SparkValidationError(
        "Expected direct from cpfp refund transaction for tree creation",
        context: {
          'field': "directFromCpfpRefundTx",
          'value': directFromCpfpRefundTx,
        },
      );
    }

    final directFromCpfpRefundTxSighash = getSigHashFromTx(
      directFromCpfpRefundTx,
      0,
      [cpfpRootTx.outputs.elementAt(0)],
    );

    final sparkClient = await connectionManager.createSparkClient(
      config.getCoordinatorAddress(),
    );

    // Total commitments: N root inputs + 1 cpfpRefund + 1 directFromCpfpRefund
    final totalCommitments = depositTxs.length + 2;

    GetSigningCommitmentsResponse signingCommittmentResp;
    try {
      signingCommittmentResp = await sparkClient.get_signing_commitments(
        GetSigningCommitmentsRequest(
          // Map to proto
          count: totalCommitments,
          nodeIdCount: 1,
        ),
      );
    } catch (error) {
      throw SparkRequestError(
        "Failed to get signing commitments for multi-UTXO deposit",
        context: {'operation': "get_signing_commitments", 'error': error},
      );
    }

    if (signingCommittmentResp.signingCommitments.length != totalCommitments) {
      throw SparkValidationError(
        "Incorrect number of signing commitments returned",
        context: {
          'field': "signingCommitments",
          'value': signingCommittmentResp.signingCommitments.length,
          'expected': totalCommitments,
        },
      );
    }

    // Commitments 0..N-1 are for root tx inputs, N for cpfpRefund, N+1 for directFromCpfpRefund
    final rootCommitments = signingCommittmentResp.signingCommitments.sublist(
      0,
      depositTxs.length,
    );
    final cpfpRefundCommitment =
        signingCommittmentResp.signingCommitments[depositTxs.length];
    final directFromCpfpRefundCommitment =
        signingCommittmentResp.signingCommitments[depositTxs.length + 1];

    // Sign each root tx input
    final rootSignaturesFutures = List.generate(rootSighashes.length, (i) {
      return config.signer.signFrost(
        SignFrostParams(
          message: rootSighashes[i],
          publicKey: signingPubKey,
          keyDerivation: keyDerivation,
          verifyingKey: verifyingKey,
          selfCommitment: rootNonces[i],
          statechainCommitments: rootCommitments[i].signingNonceCommitments
              .mapValues<ISigningCommitment>(
                (v) => ISigningCommitment(
                  hiding: Uint8List.fromList(v.hiding),
                  binding: Uint8List.fromList(v.binding),
                ),
              ),
          adaptorPubKey: Uint8List(0),
        ),
      );
    });
    final rootSignatures = await Future.wait(rootSignaturesFutures);

    final cpfpRefundSignature = await config.signer.signFrost(
      SignFrostParams(
        message: cpfpRefundTxSighash,
        publicKey: signingPubKey,
        keyDerivation: keyDerivation,
        verifyingKey: verifyingKey,
        selfCommitment: cpfpRefundNonceCommitment,
        statechainCommitments: cpfpRefundCommitment.signingNonceCommitments
            .mapValues<ISigningCommitment>(
              (v) => ISigningCommitment(
                hiding: Uint8List.fromList(v.hiding),
                binding: Uint8List.fromList(v.binding),
              ),
            ),
        adaptorPubKey: Uint8List(0),
      ),
    );

    final directFromCpfpRefundSignature = await config.signer.signFrost(
      SignFrostParams(
        message: directFromCpfpRefundTxSighash,
        publicKey: signingPubKey,
        keyDerivation: keyDerivation,
        verifyingKey: verifyingKey,
        selfCommitment: directFromCpfpRefundNonceCommitment,
        statechainCommitments: directFromCpfpRefundCommitment
            .signingNonceCommitments
            .mapValues<ISigningCommitment>(
              (v) => ISigningCommitment(
                hiding: Uint8List.fromList(v.hiding),
                binding: Uint8List.fromList(v.binding),
              ),
            ),
        adaptorPubKey: Uint8List(0),
      ),
    );

    FinalizeDepositTreeCreationResponse finalizeResp;

    try {
      final additionalInputsList = List<InputSigningData>.generate(
        rootSignatures.length - 1,
        (index) {
          final i = index; // Maps to index + 1 logic
          return InputSigningData(
            // Map to proto generated model
            signingNonceCommitment: rootNonces[i + 1].commitment.toProto(),
            userSignature: rootSignatures[i + 1],
            signingCommitments: SigningCommitments(
              signingCommitments:
                  rootCommitments[i + 1].signingNonceCommitments.entries,
            ),
          );
        },
      );

      final additionalOnChainUtxosList = depositTxs.sublist(1).map((m) {
        final tx = m['tx'] as BtcTransaction;
        final vout = m['vout'] as int;
        return UTXO(
          vout: vout,
          rawTx: tx.toBytes(allowWitness: true),
          network: Network.valueOf(config.getNetworkProto()),
        );
      }).toList();

      finalizeResp = await sparkClient.finalize_deposit_tree_creation(
        FinalizeDepositTreeCreationRequest(
          // Map to proto
          identityPublicKey: await config.signer.getIdentityPublicKey(),
          onChainUtxo: UTXO(
            vout: depositTxs[0]['vout'] as int,
            rawTx: (depositTxs[0]['tx'] as BtcTransaction).toBytes(
              allowWitness: true,
            ),
            network: Network.valueOf(config.getNetworkProto()),
          ),
          rootTxSigningJob: UserSignedTxSigningJob(
            signingPublicKey: signingPubKey,
            rawTx: cpfpRootTx.toBytes(),
            signingNonceCommitment: rootNonces[0].commitment.toProto(),
            userSignature: rootSignatures[0],
            signingCommitments: SigningCommitments(
              signingCommitments:
                  rootCommitments[0].signingNonceCommitments.entries,
            ),
            additionalInputs: additionalInputsList,
          ),
          refundTxSigningJob: UserSignedTxSigningJob(
            signingPublicKey: signingPubKey,
            rawTx: cpfpRefundTx.toBytes(),
            signingNonceCommitment: cpfpRefundNonceCommitment.commitment
                .toProto(),
            userSignature: cpfpRefundSignature,
            signingCommitments: SigningCommitments(
              signingCommitments:
                  cpfpRefundCommitment.signingNonceCommitments.entries,
            ),
          ),
          directFromCpfpRefundTxSigningJob: UserSignedTxSigningJob(
            signingPublicKey: signingPubKey,
            rawTx: directFromCpfpRefundTx.toBytes(),
            signingNonceCommitment: directFromCpfpRefundNonceCommitment
                .commitment
                .toProto(),
            userSignature: directFromCpfpRefundSignature,
            signingCommitments: SigningCommitments(
              signingCommitments: directFromCpfpRefundCommitment
                  .signingNonceCommitments
                  .entries,
            ),
          ),
          additionalOnChainUtxos: additionalOnChainUtxosList,
        ),
      );
    } catch (error) {
      throw SparkRequestError(
        "Failed to finalize multi-UTXO tree creation",
        context: {
          'operation': "finalize_deposit_tree_creation",
          'error': error,
        },
      );
    }

    if (!finalizeResp.hasRootNode()) {
      throw SparkRequestError(
        "root node not returned from finalize tree request",
        context: {'operation': "finalize_deposit_tree_creation"},
      );
    }
    return (nodes: [finalizeResp.rootNode]);
  }
}
