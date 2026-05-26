import 'dart:typed_data';

import 'package:bitcoin_base/bitcoin_base.dart';

import '../errors/types.dart'; // SparkValidationError
import '../src/proto/spark.pb.dart'
    as spark_pb; // RequestedSigningCommitments, UserSignedTxSigningJob
import '../src/proto/common.pb.dart' as common_pb;
import '../signer/types.dart'; // SigningCommitmentWithOptionalNonce
import '../utils/bitcoin.dart'; // getSigHashFromMultiInputTx, getSigHashFromTx, getTxFromRawTxBytes
import '../utils/htlc_transactions.dart'; // createRefundTxsForLightning
// import '../utils/network.dart'; // getNetwork
import '../utils/transaction.dart'; // createConnectorRefundTxs, createCurrentTimelockRefundTxs, createDecrementedTimelockRefundTxs, getCurrentTimelock, getNextHTLCTransactionSequence
import 'config.dart'; // WalletConfigService
import 'transfer.dart'; // LeafKeyTweak, SigningJobType, SigningJobWithOptionalNonce
import '../spark_bindings/types.dart';

// Assuming you have equivalent Dart classes for the @scure/btc-signer types
// import '../bitcoin/transaction.dart';
// import '../bitcoin/transaction_input.dart';

/// Wraps the generated UserSignedTxSigningJob protobuf with our local selfCommitment
class UserSignedTxSigningJobWithSelfCommitment {
  final spark_pb.UserSignedTxSigningJob job;
  final SigningCommitmentWithOptionalNonce selfCommitment;

  UserSignedTxSigningJobWithSelfCommitment({
    required this.job,
    required this.selfCommitment,
  });
}

class SigningService {
  final WalletConfigService config;

  SigningService(this.config);

  // ===========================================================================
  // CHUNK: Refund Signing core logic
  // (Continuing inside the SigningService class...)
  // ===========================================================================

  Future<List<UserSignedTxSigningJobWithSelfCommitment>> _signRefundsInternal(
    dynamic refundTx, // Assuming Transaction type from btc-signer port
    Uint8List sighash,
    LeafKeyTweak leaf,
    Map<String, SigningCommitment>? signingCommitments, [
    Uint8List? adaptorPubKey,
  ]) async {
    final effectiveAdaptorPubKey = adaptorPubKey ?? Uint8List(0);
    final leafSigningJobs = <UserSignedTxSigningJobWithSelfCommitment>[];

    final signingCommitment = await config.signer.getRandomSigningCommitment();

    if (signingCommitments == null) {
      throw SparkValidationError(
        "Invalid signing commitments",
        context: {
          'field': "signingNonceCommitments",
          'value': signingCommitments,
          'expected': "Non-null signing commitments",
        },
      );
    }

    final publicKey = await config.signer.getPublicKeyFromDerivation(
      keyDerivation: leaf.keyDerivation,
    );

    final signingResult = await config.signer.signFrost(
      SignFrostParams(
        message: sighash,
        keyDerivation: leaf.keyDerivation,
        publicKey: publicKey,
        selfCommitment: signingCommitment,
        statechainCommitments: signingCommitments.mapValues<ISigningCommitment>(
          (v) => ISigningCommitment(hiding: v.hiding, binding: v.binding),
        ),
        adaptorPubKey: effectiveAdaptorPubKey,
        verifyingKey: Uint8List.fromList(leaf.leaf.verifyingPublicKey),
      ),
    );

    final jobProto = spark_pb.UserSignedTxSigningJob(
      leafId: leaf.leaf.id,
      signingPublicKey: publicKey,
      rawTx: refundTx.toBytes(), // Assuming Dart Transaction has toBytes()
      signingNonceCommitment: common_pb.SigningCommitment(
        binding: signingCommitment.commitment.binding,
        hiding: signingCommitment.commitment.hiding,
      ),
      userSignature: signingResult,
      signingCommitments: spark_pb.SigningCommitments(
        signingCommitments: signingCommitments
            .mapValues<common_pb.SigningCommitment>(
              (v) => common_pb.SigningCommitment(
                hiding: v.hiding,
                binding: v.binding,
              ),
            )
            .entries,
      ),
      additionalInputs: [],
    );

    leafSigningJobs.add(
      UserSignedTxSigningJobWithSelfCommitment(
        job: jobProto,
        selfCommitment: signingCommitment,
      ),
    );

    return leafSigningJobs;
  }

  Future<
    ({
      List<UserSignedTxSigningJobWithSelfCommitment> cpfpLeafSigningJobs,
      List<UserSignedTxSigningJobWithSelfCommitment> directLeafSigningJobs,
      List<UserSignedTxSigningJobWithSelfCommitment>
      directFromCpfpLeafSigningJobs,
    })
  >
  _signRefundsCore(
    List<LeafKeyTweak> leaves,
    // Future<({BtcTransaction cpfpRefundTx, BtcTransaction directRefundTx, BtcTransaction directFromCpfpRefundTx})> Function({
    //   required dynamic nodeTx,
    //   dynamic directNodeTx,
    //   required int sequence,
    //   required Uint8List receivingPubkey,
    //   required dynamic network,
    // }) createRefundTxs,
    Future<RefundTxs> Function(RefundTxWithSequenceParams) createRefundTxs,
    List<spark_pb.RequestedSigningCommitments> cpfpSigningCommitments,
    List<spark_pb.RequestedSigningCommitments> directSigningCommitments,
    List<spark_pb.RequestedSigningCommitments>
    directFromCpfpSigningCommitments, [
    Uint8List? adaptorPubKey,
  ]) async {
    final cpfpLeafSigningJobs = <UserSignedTxSigningJobWithSelfCommitment>[];
    final directLeafSigningJobs = <UserSignedTxSigningJobWithSelfCommitment>[];
    final directFromCpfpLeafSigningJobs =
        <UserSignedTxSigningJobWithSelfCommitment>[];

    for (int i = 0; i < leaves.length; i++) {
      final leaf = leaves[i];
      // Due to Dart's sound null safety, we check if the inner leaf object exists
      if (!leaf.leaf.hasId()) {
        // Assuming checking for ID is a good proxy for 'exists' in proto
        throw SparkValidationError(
          "Leaf not found in signRefundsCore",
          context: {
            'field': "leaf",
            'value': leaf,
            'expected': "Non-null leaf",
          },
        );
      }

      final receivingPubkey = leaf.receiverIdentityPublicKey;
      final nodeTx = getTxFromRawTxBytes(Uint8List.fromList(leaf.leaf.nodeTx));
      final currRefundTx = getTxFromRawTxBytes(
        Uint8List.fromList(leaf.leaf.refundTx),
      );

      final amountSats = currRefundTx.outputs.elementAtOrNull(0)?.amount;
      if (amountSats == null) {
        throw SparkValidationError(
          "Invalid refund transaction",
          context: {
            'field': "amount",
            'value': currRefundTx,
            'expected': "Non-null amount",
          },
        );
      }

      BtcTransaction? directNodeTx;
      if (leaf.leaf.directTx.isNotEmpty) {
        directNodeTx = getTxFromRawTxBytes(
          Uint8List.fromList(leaf.leaf.directTx),
        );
      }

      final currentSequence = currRefundTx.inputs.elementAtOrNull(0)?.sequence;
      if (currentSequence == null) {
        throw SparkValidationError(
          "Invalid refund transaction",
          context: {
            'field': "sequence",
            'value': currRefundTx,
            'expected': "Non-null sequence",
          },
        );
      }

      final refundTxs = await createRefundTxs(
        RefundTxWithSequenceParams(
          nodeTx: nodeTx,
          directNodeTx: directNodeTx,
          sequence: Uint8List.fromList(
            currentSequence,
          ).buffer.asByteData(0).getUint32(0, Endian.little),
          receivingPubkey: receivingPubkey,
          network: config.getNetwork(),
        ),
      );

      final cpfpRefundTx = refundTxs.cpfpRefundTx;
      final directRefundTx = refundTxs.directRefundTx;
      final directFromCpfpRefundTx = refundTxs.directFromCpfpRefundTx;

      final refundSighashCpfp = getSigHashFromTx(
        cpfpRefundTx,
        0,
        [nodeTx.outputs[0]],
      );

      final signingJobsCpfp = await _signRefundsInternal(
        cpfpRefundTx,
        refundSighashCpfp,
        leaf,
        cpfpSigningCommitments.length > i
            ? cpfpSigningCommitments[i].signingNonceCommitments
                  .mapValues<SigningCommitment>(
                    (v) => SigningCommitment(
                      binding: Uint8List.fromList(v.binding),
                      hiding: Uint8List.fromList(v.hiding),
                    ),
                  )
            : null,
        adaptorPubKey,
      );
      cpfpLeafSigningJobs.addAll(signingJobsCpfp);

      final sequnceInt = nodeTx.inputs.elementAtOrNull(0) != null
          ? Uint8List.fromList(
              nodeTx.inputs.elementAt(0).sequence,
            ).buffer.asByteData(0).getUint32(0, Endian.little)
          : null;
      final isZeroNode =
          getCurrentTimelock(sequnceInt) ==
          0; // Adjust based on your getCurrentTimelock logic

      if (directRefundTx != null && !isZeroNode) {
        if (directNodeTx == null) {
          throw SparkValidationError(
            "Direct node transaction undefined while direct refund transaction is defined",
            context: {
              'field': "directNodeTx",
              'value': directNodeTx,
              'expected': "Non-null direct node transaction",
            },
          );
        }

        final refundSighashDirect = getSigHashFromTx(
          directRefundTx,
          0,
          [directNodeTx.outputs.elementAt(0)],
        );

        final signingJobsDirect = await _signRefundsInternal(
          directRefundTx,
          refundSighashDirect,
          leaf,
          directSigningCommitments.length > i
              ? directSigningCommitments[i].signingNonceCommitments
                    .mapValues<SigningCommitment>(
                      (v) => SigningCommitment.fromProto(v),
                    )
              : null,
          adaptorPubKey,
        );
        directLeafSigningJobs.addAll(signingJobsDirect);
      }

      if (directFromCpfpRefundTx != null) {
        final refundSighashDirectFromCpfp = getSigHashFromTx(
          directFromCpfpRefundTx,
          0,
          [nodeTx.outputs[0]],
        );

        final signingJobsDirectFromCpfp = await _signRefundsInternal(
          directFromCpfpRefundTx,
          refundSighashDirectFromCpfp,
          leaf,
          directFromCpfpSigningCommitments.length > i
              ? directFromCpfpSigningCommitments[i].signingNonceCommitments
                    .mapValues<SigningCommitment>(
                      (v) => SigningCommitment.fromProto(v),
                    )
              : null,
          adaptorPubKey,
        );
        directFromCpfpLeafSigningJobs.addAll(signingJobsDirectFromCpfp);
      }
    }

    return (
      cpfpLeafSigningJobs: cpfpLeafSigningJobs,
      directLeafSigningJobs: directLeafSigningJobs,
      directFromCpfpLeafSigningJobs: directFromCpfpLeafSigningJobs,
    );
  }

  Future<
    ({
      List<UserSignedTxSigningJobWithSelfCommitment> cpfpLeafSigningJobs,
      List<UserSignedTxSigningJobWithSelfCommitment> directLeafSigningJobs,
      List<UserSignedTxSigningJobWithSelfCommitment>
      directFromCpfpLeafSigningJobs,
    })
  >
  signRefunds(
    List<LeafKeyTweak> leaves,
    List<spark_pb.RequestedSigningCommitments> cpfpSigningCommitments,
    List<spark_pb.RequestedSigningCommitments> directSigningCommitments,
    List<spark_pb.RequestedSigningCommitments>
    directFromCpfpSigningCommitments, [
    Uint8List? adaptorPubKey,
  ]) async {
    return _signRefundsCore(
      leaves,
      createDecrementedTimelockRefundTxs,
      cpfpSigningCommitments,
      directSigningCommitments,
      directFromCpfpSigningCommitments,
      adaptorPubKey,
    );
  }

  Future<
    ({
      List<UserSignedTxSigningJobWithSelfCommitment> cpfpLeafSigningJobs,
      List<UserSignedTxSigningJobWithSelfCommitment> directLeafSigningJobs,
      List<UserSignedTxSigningJobWithSelfCommitment>
      directFromCpfpLeafSigningJobs,
    })
  >
  signRefundsForClaim(
    List<LeafKeyTweak> leaves,
    List<spark_pb.RequestedSigningCommitments> cpfpSigningCommitments,
    List<spark_pb.RequestedSigningCommitments> directSigningCommitments,
    List<spark_pb.RequestedSigningCommitments> directFromCpfpSigningCommitments,
  ) async {
    return _signRefundsCore(
      leaves,
      createCurrentTimelockRefundTxs,
      cpfpSigningCommitments,
      directSigningCommitments,
      directFromCpfpSigningCommitments,
    );
  }

  // ===========================================================================
  // CHUNK: Coop Exit, Lightning, and Job Signing
  // (Completing the SigningService class)
  // ===========================================================================

  Future<
    ({
      List<UserSignedTxSigningJobWithSelfCommitment> cpfpLeafSigningJobs,
      List<UserSignedTxSigningJobWithSelfCommitment> directLeafSigningJobs,
      List<UserSignedTxSigningJobWithSelfCommitment>
      directFromCpfpLeafSigningJobs,
    })
  >
  signRefundsForCoopExit(
    List<LeafKeyTweak> leaves,
    List<TxInput?> connectorOutputs,
    Uint8List connectorTx,
    List<spark_pb.RequestedSigningCommitments> cpfpSigningCommitments,
    List<spark_pb.RequestedSigningCommitments> directSigningCommitments,
    List<spark_pb.RequestedSigningCommitments> directFromCpfpSigningCommitments,
  ) async {
    final cpfpLeafSigningJobs = <UserSignedTxSigningJobWithSelfCommitment>[];
    final directLeafSigningJobs = <UserSignedTxSigningJobWithSelfCommitment>[];
    final directFromCpfpLeafSigningJobs =
        <UserSignedTxSigningJobWithSelfCommitment>[];

    final connectorTxParsed = getTxFromRawTxBytes(connectorTx);

    for (int i = 0; i < leaves.length; i++) {
      final leaf = leaves[i];
      if (!leaf.leaf.hasId()) {
        throw SparkValidationError(
          "Leaf not found in signRefundsForCoopExit",
          context: {
            'field': "leaf",
            'value': leaf,
            'expected': "Non-null leaf",
          },
        );
      }

      final connectorOutput = connectorOutputs[i];
      if (connectorOutput == null) {
        throw SparkValidationError(
          "Missing connector output",
          context: {
            'field': "connectorOutput",
            'value': connectorOutput,
            'expected': "Valid connector output with index",
          },
        );
      }

      final connectorPrevOutput = connectorTxParsed.outputs.elementAtOrNull(i);

      if (connectorPrevOutput == null) {
        throw SparkValidationError(
          "Invalid connector transaction output",
          context: {
            'field': "connectorPrevOutput",
            'value': connectorPrevOutput,
            'expected': "Valid output with script and amount",
          },
        );
      }

      final nodeTx = getTxFromRawTxBytes(Uint8List.fromList(leaf.leaf.nodeTx));
      final nodeTxOutput = nodeTx.outputs.elementAtOrNull(0);

      final currRefundTx = getTxFromRawTxBytes(
        Uint8List.fromList(leaf.leaf.refundTx),
      );
      final currentSequence = currRefundTx.inputs.elementAtOrNull(0)?.sequence;
      if (currentSequence == null) {
        throw SparkValidationError(
          "Invalid refund transaction",
          context: {
            'field': "sequence",
            'value': currRefundTx,
            'expected': "Non-null sequence",
          },
        );
      }

      final sequenceInt = Uint8List.fromList(
        currentSequence,
      ).buffer.asByteData(0).getUint32(0, Endian.little);
      final isZeroNode = getCurrentTimelock(sequenceInt) == 0;

      BtcTransaction? directNodeTx;
      if (leaf.leaf.directTx.isNotEmpty && !isZeroNode) {
        directNodeTx = getTxFromRawTxBytes(
          Uint8List.fromList(leaf.leaf.directTx),
        );
      }

      final refundTxs = await createConnectorRefundTxs(
        RefundTxWithSequenceAndConnectorOutputParams(
          nodeTx: nodeTx,
          directNodeTx: directNodeTx,
          sequence: sequenceInt,
          connectorOutput: connectorOutput,
          receivingPubkey: leaf.receiverIdentityPublicKey,
          network: config.getNetwork(),
        ),
      );

      final cpfpRefundTx = refundTxs.cpfpRefundTx;
      final directRefundTx = refundTxs.directRefundTx;
      final directFromCpfpRefundTx = refundTxs.directFromCpfpRefundTx;

      // CPFP refund: sign input 0 with multi-input sighash
      final cpfpSighash = getSigHashFromMultiInputTx(cpfpRefundTx, 0, [
        nodeTxOutput!,
        connectorPrevOutput,
      ]);

      final cpfpJobs = await _signRefundsInternal(
        cpfpRefundTx,
        cpfpSighash,
        leaf,
        cpfpSigningCommitments.length > i
            ? cpfpSigningCommitments[i].signingNonceCommitments
                  .mapValues<SigningCommitment>(
                    (v) => SigningCommitment.fromProto(v),
                  )
            : null,
      );
      cpfpLeafSigningJobs.addAll(cpfpJobs);

      // Direct refund (spends direct tx output)
      if (directRefundTx != null && !isZeroNode) {
        if (directNodeTx == null) {
          throw SparkValidationError(
            "Direct node transaction undefined while direct refund transaction is defined",
            context: {
              'field': "directNodeTx",
              'value': directNodeTx,
              'expected': "Non-null direct node transaction",
            },
          );
        }
        final directTxOutput = directNodeTx.outputs.elementAt(0);
        final directSighash = getSigHashFromMultiInputTx(directRefundTx, 0, [
          directTxOutput,
          connectorPrevOutput,
        ]);

        final directJobs = await _signRefundsInternal(
          directRefundTx,
          directSighash,
          leaf,
          directSigningCommitments.length > i
              ? directSigningCommitments[i].signingNonceCommitments
                    .mapValues<SigningCommitment>(
                      (v) => SigningCommitment.fromProto(v),
                    )
              : null,
        );
        directLeafSigningJobs.addAll(directJobs);
      }

      // Direct-from-CPFP refund (spends CPFP node tx output)
      if (directFromCpfpRefundTx != null) {
        final directFromCpfpSighash = getSigHashFromMultiInputTx(
          directFromCpfpRefundTx,
          0,
          [nodeTxOutput, connectorPrevOutput],
        );

        final directFromCpfpJobs = await _signRefundsInternal(
          directFromCpfpRefundTx,
          directFromCpfpSighash,
          leaf,
          directFromCpfpSigningCommitments.length > i
              ? directFromCpfpSigningCommitments[i].signingNonceCommitments
                    .mapValues<SigningCommitment>(
                      (v) => SigningCommitment.fromProto(v),
                    )
              : null,
        );
        directFromCpfpLeafSigningJobs.addAll(directFromCpfpJobs);
      }
    }

    return (
      cpfpLeafSigningJobs: cpfpLeafSigningJobs,
      directLeafSigningJobs: directLeafSigningJobs,
      directFromCpfpLeafSigningJobs: directFromCpfpLeafSigningJobs,
    );
  }

  Future<
    ({
      List<spark_pb.UserSignedTxSigningJob> cpfpLeafSigningJobs,
      List<spark_pb.UserSignedTxSigningJob> directLeafSigningJobs,
      List<spark_pb.UserSignedTxSigningJob> directFromCpfpLeafSigningJobs,
    })
  >
  signRefundsForLightning(
    List<LeafKeyTweak> leaves,
    List<spark_pb.RequestedSigningCommitments> cpfpSigningCommitments,
    List<spark_pb.RequestedSigningCommitments> directSigningCommitments,
    List<spark_pb.RequestedSigningCommitments> directFromCpfpSigningCommitments,
    Uint8List hash,
  ) async {
    // final network = getNetwork(config.getNetwork());
    final cpfpLeafSigningJobs = <spark_pb.UserSignedTxSigningJob>[];
    final directLeafSigningJobs = <spark_pb.UserSignedTxSigningJob>[];
    final directFromCpfpLeafSigningJobs = <spark_pb.UserSignedTxSigningJob>[];

    for (int i = 0; i < leaves.length; i++) {
      final leaf = leaves[i];
      if (!leaf.leaf.hasId()) {
        throw SparkValidationError(
          "Leaf not found in signRefunds",
          context: {
            'field': "leaf",
            'value': leaf,
            'expected': "Non-null leaf",
          },
        );
      }

      final nodeTx = getTxFromRawTxBytes(Uint8List.fromList(leaf.leaf.nodeTx));
      final currRefundTx = getTxFromRawTxBytes(
        Uint8List.fromList(leaf.leaf.refundTx),
      );

      final sequence = currRefundTx.inputs.elementAtOrNull(0)?.sequence;
      if (sequence == null) {
        throw SparkValidationError(
          "Invalid refund transaction",
          context: {
            'field': "sequence",
            'value': currRefundTx.inputs.elementAtOrNull(0),
            'expected': "Non-null sequence",
          },
        );
      }

      final amountSats = currRefundTx.outputs.elementAtOrNull(0)?.amount;
      if (amountSats == null) {
        throw SparkValidationError(
          "Invalid refund transaction",
          context: {
            'field': "amount",
            'value': currRefundTx,
            'expected': "Non-null amount",
          },
        );
      }
      final sequenceInt = Uint8List.fromList(
        sequence,
      ).buffer.asByteData(0).getUint32(0, Endian.little);
      final sequences = getNextHTLCTransactionSequence(sequenceInt);
      final nextSequence = sequences.nextSequence;
      final nextDirectSequence = sequences.nextDirectSequence;

      BtcTransaction? directNodeTx;
      if (leaf.leaf.directTx.isNotEmpty) {
        directNodeTx = getTxFromRawTxBytes(
          Uint8List.fromList(leaf.leaf.directTx),
        );
      }

      final identityPublicKey = await config.signer.getIdentityPublicKey();

      final refundTxs = createRefundTxsForLightning(
        CreateLightningRefundTxsInput(
          nodeTx: nodeTx,
          directNodeTx: directNodeTx,
          vout: 0,
          network: config.getNetwork(),
          sequence: nextSequence,
          directSequence: nextDirectSequence,
          hash: hash,
          hashLockDestinationPubkey: leaf.receiverIdentityPublicKey,
          sequenceLockDestinationPubkey: identityPublicKey,
        ),
      );

      final cpfpRefundTx = refundTxs.cpfpRefundTx;
      final directRefundTx = refundTxs.directRefundTx;
      final directFromCpfpRefundTx = refundTxs.directFromCpfpRefundTx;

      final refundSighash = getSigHashFromTx(
        cpfpRefundTx,
        0,
        [nodeTx.outputs.elementAt(0)],
      );

      final signingJobs = await _signRefundsInternal(
        cpfpRefundTx,
        refundSighash,
        leaf,
        cpfpSigningCommitments.length > i
            ? cpfpSigningCommitments[i].signingNonceCommitments
                  .mapValues<SigningCommitment>(
                    (v) => SigningCommitment.fromProto(v),
                  )
            : null,
      );
      // Map wrapper objects to the raw Protobuf jobs
      cpfpLeafSigningJobs.addAll(signingJobs.map((j) => j.job));

      if (directRefundTx != null) {
        if (directNodeTx == null) {
          throw SparkValidationError(
            "Direct node transaction undefined while direct refund transaction is defined",
            context: {
              'field': "directNodeTx",
              'value': directNodeTx,
              'expected': "Non-null direct node transaction",
            },
          );
        }
        final refundSighashDirect = getSigHashFromTx(
          directRefundTx,
          0,
          [directNodeTx.outputs.elementAt(0)],
        );

        final signingJobsDirect = await _signRefundsInternal(
          directRefundTx,
          refundSighashDirect,
          leaf,
          directSigningCommitments.length > i
              ? directSigningCommitments[i].signingNonceCommitments
                    .mapValues<SigningCommitment>(
                      (v) => SigningCommitment.fromProto(v),
                    )
              : null,
        );
        directLeafSigningJobs.addAll(signingJobsDirect.map((j) => j.job));
      }

      if (directFromCpfpRefundTx != null) {
        final refundSighashDirectFromCpfp = getSigHashFromTx(
          directFromCpfpRefundTx,
          0,
          [nodeTx.outputs.elementAt(0)],
        );

        final signingJobsDirectFromCpfp = await _signRefundsInternal(
          directFromCpfpRefundTx,
          refundSighashDirectFromCpfp,
          leaf,
          directFromCpfpSigningCommitments.length > i
              ? directFromCpfpSigningCommitments[i].signingNonceCommitments
                    .mapValues<SigningCommitment>(
                      (v) => SigningCommitment.fromProto(v),
                    )
              : null,
        );
        directFromCpfpLeafSigningJobs.addAll(
          signingJobsDirectFromCpfp.map((j) => j.job),
        );
      }
    }

    return (
      cpfpLeafSigningJobs: cpfpLeafSigningJobs,
      directLeafSigningJobs: directLeafSigningJobs,
      directFromCpfpLeafSigningJobs: directFromCpfpLeafSigningJobs,
    );
  }

  Future<Map<SigningJobType, spark_pb.UserSignedTxSigningJob>> signSigningJobs(
    List<FullSigningJobRequest> signingJobs,
  ) async {
    final userSignedTxSigningJobs =
        <SigningJobType, spark_pb.UserSignedTxSigningJob>{};

    for (final signingJob in signingJobs) {
      final rawTx = getTxFromRawTxBytes(signingJob.rawTx);
      final txOut = signingJob.parentTxOut;
      final rawTxSighash = getSigHashFromTx(rawTx, 0, txOut);

      final userSignature = await config.signer.signFrost(
        SignFrostParams(
          message: rawTxSighash,
          keyDerivation: signingJob.keyDerivation,
          publicKey: signingJob.signingPublicKey,
          verifyingKey: signingJob.verifyingKey,
          selfCommitment: signingJob.signingNonceCommitment,
          statechainCommitments: signingJob.signingNonceCommitments
              .mapValues<ISigningCommitment>(
                (v) => ISigningCommitment(hiding: v.hiding, binding: v.binding),
              ),
          adaptorPubKey: Uint8List(0),
        ),
      );

      final userSignedTxSigningJob = spark_pb.UserSignedTxSigningJob(
        leafId: signingJob.leafId,
        signingPublicKey: signingJob.signingPublicKey,
        rawTx: rawTx.toBytes(), // Assuming Dart Transaction toBytes exists
        signingNonceCommitment: signingJob.signingNonceCommitment.commitment
            .toProto(),
        signingCommitments: spark_pb.SigningCommitments(
          signingCommitments: signingJob.signingNonceCommitments
              .mapValues<common_pb.SigningCommitment>(
                (v) => common_pb.SigningCommitment(
                  hiding: v.hiding,
                  binding: v.binding,
                ),
              )
              .entries,
        ),
        userSignature: userSignature,
        additionalInputs: [],
      );

      userSignedTxSigningJobs[signingJob.type] = userSignedTxSigningJob;
    }

    return userSignedTxSigningJobs;
  }
}

// --- Companion Data Class for TypeScript Intersection Type ---

/// Represents the TypeScript intersection of `SigningJobWithOptionalNonce`
/// and `RequestedSigningCommitments`.
class FullSigningJobRequest {
  final String leafId;
  final SigningJobType type;
  final KeyDerivation keyDerivation;
  final Uint8List signingPublicKey;
  final Uint8List verifyingKey;
  final Uint8List rawTx;
  final dynamic parentTxOut;
  final SigningCommitmentWithOptionalNonce signingNonceCommitment;
  final Map<String, SigningCommitment> signingNonceCommitments;

  FullSigningJobRequest({
    required this.leafId,
    required this.type,
    required this.keyDerivation,
    required this.signingPublicKey,
    required this.verifyingKey,
    required this.rawTx,
    required this.parentTxOut,
    required this.signingNonceCommitment,
    required this.signingNonceCommitments,
  });
}
