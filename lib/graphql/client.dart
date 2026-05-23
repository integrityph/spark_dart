// lib/graphql/client.dart

import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:boringssl_ffi/boringssl_ffi.dart' as bsll;
import 'package:http/http.dart' as http;
// // import 'package:crypto/crypto.dart';

// Note: Replace with actual lightspark_core imports based on your project setup
import '../lightspark_core/lightspark_core.dart';

import '../errors/spark_error.dart'; // SparkAuthenticationError, SparkRequestError
import '../signer/signer.dart';
import '../types/sdk_types.dart'; // UserRequestType
// Network
// import '../utils/hex.dart'; // bytesToHex

// Note: These imports assume you have corresponding Dart generated files or models
// for your GraphQL schema.
import 'mutations/claim_instant_static_deposit.dart';
import 'mutations/claim_static_deposit.dart';
import 'mutations/complete_coop_exit.dart';
import 'mutations/delete_spark_wallet_webhook.dart';
import 'mutations/get_challenge.dart';
import 'mutations/register_spark_wallet_webhook.dart';
import 'mutations/request_coop_exit.dart';
import 'mutations/request_lightning_receive.dart';
import 'mutations/request_lightning_send.dart';
import 'mutations/request_swap_leaves.dart';
import 'mutations/verify_challenge.dart';
import 'mutations/get_instant_static_deposit_quote.dart';

import 'objects/bitcoin_network.dart';
import 'objects/claim_static_deposit.dart';
import 'objects/instant_static_deposit_claim_output.dart';
import 'objects/instant_static_deposit_quote_output.dart';
import 'objects/claim_static_deposit_output.dart';
import 'objects/claim_static_deposit_request_type.dart';
import 'objects/coop_exit_fee_quote.dart' hide getCoopExitFeeQuoteQuery;
import 'objects/coop_exit_request.dart';
import 'objects/get_challenge_output.dart';
import 'objects/coop_exit_fee_estimates_output.dart';
import 'objects/leaves_swap_fee_estimate_output.dart';
import 'objects/lightning_send_request.dart';
import 'objects/request_coop_exit_input.dart';
import 'objects/spark_user_request_status.dart';
import 'objects/spark_user_request_type.dart';
import 'objects/transfer.dart';
import 'objects/leaves_swap_request.dart';
import 'objects/lightning_receive_request.dart';
import 'objects/lightning_send_fee_estimate_output.dart';
import 'objects/delete_spark_wallet_webhook_input.dart';
import 'objects/delete_spark_wallet_webhook_output.dart';
import 'objects/list_spark_wallet_webhooks_output.dart';
import 'objects/list_spark_wallet_webhooks.dart';
import 'objects/register_spark_wallet_webhook_output.dart';
import 'objects/register_spark_wallet_webhook_input.dart';
import 'objects/spark_wallet_user_to_user_requests_connection.dart';
import 'objects/static_deposit_quote_output.dart';
import 'objects/user_leaf_input.dart';
import 'objects/verify_challenge_output.dart';

import 'queries/coop_exit_fee_estimate.dart';
import 'queries/fetch_current_user_to_user_requests_connection.dart';
import 'queries/get_claim_deposit_quote.dart';
import 'queries/get_coop_exit_fee_quote.dart';
import 'queries/leaves_swap_fee_estimate.dart';
import 'queries/lightning_send_fee_estimate.dart';
import 'queries/transfers.dart';
import 'queries/user_request.dart';

// // Queries
// import 'queries/list_spark_wallet_webhooks.dart';

// // Objects
// import 'objects/claim_static_deposit.dart';

class SspClientOptions {
  final String baseUrl;
  final String identityPublicKey;
  final String? schemaEndpoint;

  SspClientOptions({
    required this.baseUrl,
    required this.identityPublicKey,
    this.schemaEndpoint,
  });
}

abstract class MayHaveSspClientOptions {
  SspClientOptions? get sspClientOptions;
}

abstract class HasSspClientOptions {
  SspClientOptions get sspClientOptions;
}

class GetUserRequestsParams {
  final int? first;
  final String? after;
  final List<SparkUserRequestType>? types;
  final List<SparkUserRequestStatus>? statuses;
  final List<BitcoinNetwork>? networks;

  GetUserRequestsParams({
    this.first,
    this.after,
    this.types,
    this.statuses,
    this.networks,
  });
}

// In Dart, if Transfer is generated, it's often easier to use composition
// or implement it depending on your GraphQL generator (Artemis/Ferry etc.)
// Here we extend it assuming it's an extendable class.
class TransferWithUserRequest extends Transfer {
  UserRequestType? userRequest;

  TransferWithUserRequest({required Transfer original, this.userRequest})
    : super(
        // Pass original properties to super constructor
        totalAmount: original.totalAmount,
        sparkId: original.sparkId,
        userRequestId: original.userRequestId,
      );
}

// ============================================================================
// HTTP Interceptor for Retries and Auth (Translates createRetryFetch)
// ============================================================================

const _retryableStatusCodes = {502, 503, 504};

class AuthAndRetryClient extends http.BaseClient {
  final http.Client _inner;
  final int maxRetries;
  final int baseDelayMs;

  AuthAndRetryClient(
    this._inner, {
    this.maxRetries = 5,
    this.baseDelayMs = 1000,
  });

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    Object? lastError;

    for (int attempt = 0; attempt <= maxRetries; attempt++) {
      http.StreamedResponse? response;
      try {
        // We need to recreate the request for retries if the stream was consumed.
        // http.Request can be cloned safely.
        final retryRequest = _copyRequest(request);
        response = await _inner.send(retryRequest);
      } catch (error) {
        if (error is TimeoutException ||
            error.toString().contains('AbortError')) {
          rethrow;
        }

        if (attempt < maxRetries) {
          lastError = error;
          final delay = min(baseDelayMs * pow(2, attempt).toInt(), 10000);
          print(
            '[SspClient] fetch error (attempt ${attempt + 1}/${maxRetries + 1}): $error, retrying in ${delay}ms',
          );
          await Future.delayed(Duration(milliseconds: delay));
          continue;
        }
        rethrow;
      }

      if (_retryableStatusCodes.contains(response.statusCode) &&
          attempt < maxRetries) {
        final delay = min(baseDelayMs * pow(2, attempt).toInt(), 10000);
        print(
          '[SspClient] HTTP ${response.statusCode} (attempt ${attempt + 1}/${maxRetries + 1}), retrying in ${delay}ms',
        );
        await Future.delayed(Duration(milliseconds: delay));
        continue;
      }

      if (response.statusCode == 401) {
        throw Exception('Request unauthorized');
      }

      return response;
    }

    throw lastError ?? Exception('Retry loop exited unexpectedly');
  }

  http.BaseRequest _copyRequest(http.BaseRequest request) {
    if (request is http.Request) {
      final copy = http.Request(request.method, request.url)
        ..headers.addAll(request.headers)
        ..bodyBytes = request.bodyBytes
        ..encoding = request.encoding;
      return copy;
    }
    // For MultipartRequest or others, you would implement appropriate cloning
    return request;
  }
}

// ============================================================================
// Authentication Provider
// ============================================================================

class SparkAuthProvider implements AuthProvider {
  String? _sessionToken;
  DateTime? _validUntil;

  @override
  Future<Map<String, String>> addAuthHeaders(
    Map<String, String> headers,
  ) async {
    final newHeaders = {'Content-Type': 'application/json', ...headers};

    if (_sessionToken != null) {
      newHeaders['Authorization'] = 'Bearer $_sessionToken';
    }

    return newHeaders;
  }

  @override
  Future<bool> isAuthorized() async {
    return _sessionToken != null &&
        _validUntil != null &&
        _validUntil!.isAfter(DateTime.now());
  }

  @override
  Future<Map<String, dynamic>> addWsConnectionParams(
    Map<String, dynamic> params,
  ) async {
    final newParams = Map<String, dynamic>.from(params);

    if (_sessionToken != null) {
      newParams['Authorization'] = 'Bearer $_sessionToken';
    }

    return newParams;
  }

  void setAuth(String sessionToken, DateTime validUntil) {
    _sessionToken = sessionToken;
    _validUntil = validUntil;
  }

  void removeAuth() {
    _sessionToken = null;
    _validUntil = null;
  }
}

// ============================================================================
// SSP Client
// ============================================================================

class SspClient {
  late final Requester requester;
  final SparkSigner signer;
  final SparkAuthProvider authProvider;

  Future<void>? _authPromise;

  SspClient({required HasSspClientOptions config, required this.signer})
    : authProvider = SparkAuthProvider() {
    final options = config.sspClientOptions;

    // Equivalent to getFetch() and createRetryFetch() in TS
    final baseClient = http.Client();
    final authAwareClient = AuthAndRetryClient(baseClient);

    requester = Requester(
      nodeKeyCache: NodeKeyCache(DefaultCrypto()),
      schemaEndpoint: options.schemaEndpoint ?? 'graphql/spark/2025-03-19',
      sdkUserAgent: 'spark-sdk/0.0.0', // Update version dynamically if needed
      authProvider: authProvider,
      baseUrl: options.baseUrl,
      cryptoImpl: DefaultCrypto(),
      httpClient: authAwareClient,
    );
  }

  Future<T?> executeRawQuery<T>(Query<T> query, {bool needsAuth = true}) async {
    if (needsAuth && !(await authProvider.isAuthorized())) {
      await authenticate();
    }

    try {
      return await requester.executeQuery(query);
    } catch (error) {
      if (error.toString().toLowerCase().contains('unauthorized')) {
        try {
          await authenticate();
          return await requester.executeQuery(query);
        } catch (authError) {
          throw SparkAuthenticationError(
            "Failed to authenticate after unauthorized response",
            context: {
              'endpoint': "graphql",
              'reason': error.toString(),
              'error': authError.toString(),
            },
          );
        }
      }
      throw SparkRequestError(
        "Failed to execute GraphQL query",
        context: {'method': "POST", 'error': error.toString()},
      );
    }
  }

  Future<LeavesSwapFeeEstimateOutput?> getSwapFeeEstimate(
    int amountSats,
  ) async {
    return await executeRawQuery(
      Query<LeavesSwapFeeEstimateOutput>(
        queryPayload: leavesSwapFeeEstimateQuery, // From your queries/index
        variables: {'total_amount_sats': amountSats},
        constructObject: (response) => LeavesSwapFeeEstimateOutput.fromJson(
          response['leaves_swap_fee_estimate'],
        ),
      ),
    );
  }

  Future<LightningSendFeeEstimateOutput?> getLightningSendFeeEstimate(
    String encodedInvoice, [
    BigInt? amountSats,
  ]) async {
    return await executeRawQuery(
      Query<LightningSendFeeEstimateOutput>(
        queryPayload: lightningSendFeeEstimateQuery,
        variables: {
          'encoded_invoice': encodedInvoice,
          'amount_sats': amountSats,
        },
        constructObject: (response) => LightningSendFeeEstimateOutput.fromJson(
          response['lightning_send_fee_estimate'],
        ),
      ),
    );
  }

  Future<CoopExitFeeEstimatesOutput?> getCoopExitFeeEstimate({
    required List<String> leafExternalIds,
    required String withdrawalAddress,
  }) async {
    return await executeRawQuery(
      Query<CoopExitFeeEstimatesOutput>(
        queryPayload: coopExitFeeEstimateQuery,
        variables: {
          'leaf_external_ids': leafExternalIds,
          'withdrawal_address': withdrawalAddress,
        },
        constructObject: (response) => CoopExitFeeEstimatesOutput.fromJson(
          response['coop_exit_fee_estimates'],
        ),
      ),
    );
  }

  Future<CoopExitRequest?> completeCoopExit({
    required String userOutboundTransferExternalId,
  }) async {
    return await executeRawQuery(
      Query<CoopExitRequest>(
        queryPayload: completeCoopExitMutation,
        variables: {
          'user_outbound_transfer_external_id': userOutboundTransferExternalId,
        },
        constructObject: (response) =>
            CoopExitRequest.fromJson(response['complete_coop_exit']['request']),
      ),
    );
  }

  Future<CoopExitRequest?> requestCoopExit(RequestCoopExitInput param) async {
    return await executeRawQuery(
      Query<CoopExitRequest>(
        queryPayload: requestCoopExitMutation,
        variables: {
          'leaf_external_ids': param.leafExternalIds,
          'withdrawal_address': param.withdrawalAddress,
          'exit_speed': param.exitSpeed,
          'fee_leaf_external_ids': param.feeLeafExternalIds,
          'fee_quote_id': param.feeQuoteId,
          'withdraw_all': param.withdrawAll,
          'user_outbound_transfer_external_id':
              param.userOutboundTransferExternalId,
        },
        constructObject: (response) =>
            CoopExitRequest.fromJson(response['request_coop_exit']['request']),
      ),
    );
  }

  Future<LightningReceiveRequest?> requestLightningReceive({
    required int amountSats,
    required BitcoinNetwork network,
    required String paymentHash,
    int? expirySecs,
    String? memo,
    bool? includeSparkAddress,
    String? receiverIdentityPubkey,
    String? descriptionHash,
    String? sparkInvoice,
  }) async {
    return await executeRawQuery(
      Query<LightningReceiveRequest>(
        queryPayload: requestLightningReceiveMutation,
        variables: {
          'amount_sats': amountSats,
          'network': network.value, // Pass string value of enum
          'payment_hash': paymentHash,
          'expiry_secs': expirySecs,
          'memo': memo,
          'include_spark_address': includeSparkAddress,
          'receiver_identity_pubkey': receiverIdentityPubkey,
          'description_hash': descriptionHash,
          'spark_invoice': sparkInvoice,
        },
        constructObject: (response) => LightningReceiveRequest.fromJson(
          response['request_lightning_receive']['request'],
        ),
      ),
    );
  }

  Future<LightningSendRequest?> requestLightningSend({
    required String encodedInvoice,
    BigInt? amountSats,
    String? userOutboundTransferExternalId,
  }) async {
    return await executeRawQuery(
      Query<LightningSendRequest>(
        queryPayload: requestLightningSendMutation,
        variables: {
          'encoded_invoice': encodedInvoice,
          'amount_sats': amountSats,
          'user_outbound_transfer_external_id': userOutboundTransferExternalId,
        },
        constructObject: (response) => LightningSendRequest.fromJson(
          response['request_lightning_send']['request'],
        ),
      ),
    );
  }

  Future<LeavesSwapRequest?> requestLeavesSwap({
    required String adaptorPubkey,
    required BigInt totalAmountSats,
    required List<BigInt> targetAmountSats,
    required int feeSats,
    required List<UserLeafInput> userLeaves,
    String? userOutboundTransferExternalId,
  }) async {
    return await executeRawQuery(
      Query<LeavesSwapRequest>(
        queryPayload: requestSwapLeavesMutation,
        variables: {
          'adaptor_pubkey': adaptorPubkey,
          'total_amount_sats': totalAmountSats,
          'target_amount_sats': targetAmountSats,
          'fee_sats': feeSats,
          'user_leaves': userLeaves,
          'user_outbound_transfer_external_id': userOutboundTransferExternalId,
        },
        constructObject: (response) {
          if (response['request_swap'] == null) return null;
          return LeavesSwapRequest.fromJson(
            response['request_swap']['request'],
          );
        },
      ),
    );
  }

  Future<LightningReceiveRequest?> getLightningReceiveRequest(String id) async {
    return await executeRawQuery(
      Query<LightningReceiveRequest>(
        queryPayload: userRequestQuery,
        variables: {'request_id': id},
        constructObject: (response) {
          if (response['user_request'] == null) return null;
          return LightningReceiveRequest.fromJson(response['user_request']);
        },
      ),
    );
  }

  Future<LightningSendRequest?> getLightningSendRequest(String id) async {
    return await executeRawQuery(
      Query<LightningSendRequest>(
        queryPayload: userRequestQuery,
        variables: {'request_id': id},
        constructObject: (response) {
          if (response['user_request'] == null) return null;
          return LightningSendRequest.fromJson(response['user_request']);
        },
      ),
    );
  }

  Future<LeavesSwapRequest?> getLeaveSwapRequest(String id) async {
    return await executeRawQuery(
      Query<LeavesSwapRequest>(
        queryPayload: userRequestQuery,
        variables: {'request_id': id},
        constructObject: (response) {
          if (response['user_request'] == null) return null;
          return LeavesSwapRequest.fromJson(response['user_request']);
        },
      ),
    );
  }

  Future<CoopExitRequest?> getCoopExitRequest(String id) async {
    return await executeRawQuery(
      Query<CoopExitRequest>(
        queryPayload: userRequestQuery,
        variables: {'request_id': id},
        constructObject: (response) {
          if (response['user_request'] == null) return null;
          return CoopExitRequest.fromJson(response['user_request']);
        },
      ),
    );
  }

  Future<StaticDepositQuoteOutput?> getClaimDepositQuote({
    required String transactionId,
    required int outputIndex,
    required BitcoinNetwork network,
  }) async {
    return await executeRawQuery(
      Query<StaticDepositQuoteOutput>(
        queryPayload: getClaimDepositQuoteQuery,
        variables: {
          'transaction_id': transactionId,
          'output_index': outputIndex,
          'network': network.value,
        },
        constructObject: (response) =>
            StaticDepositQuoteOutput.fromJson(response['static_deposit_quote']),
      ),
    );
  }

  Future<ClaimStaticDepositOutput?> claimStaticDeposit({
    required String transactionId,
    required int outputIndex,
    required BitcoinNetwork network,
    required int creditAmountSats,
    required String depositSecretKey,
    required String signature,
    required String sspSignature,
  }) async {
    return await executeRawQuery(
      Query<ClaimStaticDepositOutput>(
        queryPayload: claimStaticDepositMutation,
        variables: {
          'transaction_id': transactionId,
          'output_index': outputIndex,
          'network': network.value,
          'request_type': ClaimStaticDepositRequestType.fixedAmount,
          'credit_amount_sats': creditAmountSats,
          'deposit_secret_key': depositSecretKey,
          'signature': signature,
          'quote_signature': sspSignature,
        },
        constructObject: (response) =>
            ClaimStaticDepositOutput.fromJson(response['claim_static_deposit']),
      ),
    );
  }

  Future<InstantStaticDepositQuoteOutput?> getInstantStaticDepositQuote({
    required String transactionId,
    required int outputIndex,
    required BitcoinNetwork network,
    required String partnerId,
  }) async {
    return await executeRawQuery(
      Query<InstantStaticDepositQuoteOutput>(
        queryPayload: getInstantStaticDepositQuoteMutation,
        variables: {
          'transaction_id': transactionId,
          'output_index': outputIndex,
          'network': network.value,
          'partner_id': partnerId,
        },
        constructObject: (response) => InstantStaticDepositQuoteOutput.fromJson(
          response['create_instant_static_deposit_quote'],
        ),
      ),
    );
  }

  Future<InstantStaticDepositClaimOutput?> claimInstantStaticDeposit({
    required String quoteId,
    required String depositSecretKey,
    required String signature,
  }) async {
    return await executeRawQuery(
      Query<InstantStaticDepositClaimOutput>(
        queryPayload: claimInstantStaticDepositMutation,
        variables: {
          'static_deposit_quote_id': quoteId,
          'static_deposit_address_private_key_share': depositSecretKey,
          'signature': signature,
        },
        constructObject: (response) => InstantStaticDepositClaimOutput.fromJson(
          response['create_claim_instant_static_deposit'],
        ),
      ),
    );
  }

  Future<List<TransferWithUserRequest>> getTransfers(List<String> ids) async {
    return (await executeRawQuery(
          Query<List<TransferWithUserRequest>>(
            queryPayload: getTransfersQuery,
            variables: {'transfer_spark_ids': ids},
            constructObject: (response) {
              final List<dynamic> transfersList = response['transfers'];
              return transfersList.map((transferMap) {
                final transfer = Transfer.fromJson(transferMap);
                final transferWithReq = TransferWithUserRequest(
                  original: transfer,
                );

                final userRequestMap = transferMap['transfer_user_request'];
                if (userRequestMap != null) {
                  final typeName = userRequestMap['__typename'];
                  switch (typeName) {
                    case 'ClaimStaticDeposit':
                      transferWithReq.userRequest = ClaimStaticDeposit.fromJson(
                        userRequestMap,
                      );
                      break;
                    case 'CoopExitRequest':
                      transferWithReq.userRequest = CoopExitRequest.fromJson(
                        userRequestMap,
                      );
                      break;
                    case 'LeavesSwapRequest':
                      transferWithReq.userRequest = LeavesSwapRequest.fromJson(
                        userRequestMap,
                      );
                      break;
                    case 'LightningReceiveRequest':
                      transferWithReq.userRequest =
                          LightningReceiveRequest.fromJson(userRequestMap);
                      break;
                    case 'LightningSendRequest':
                      transferWithReq.userRequest =
                          LightningSendRequest.fromJson(userRequestMap);
                      break;
                  }
                }
                return transferWithReq;
              }).toList();
            },
          ),
        )) ??
        [];
  }

  Future<GetChallengeOutput?> getChallenge() async {
    final pubKeyBytes = await signer.getIdentityPublicKey();
    return await executeRawQuery(
      Query<GetChallengeOutput>(
        queryPayload: getChallengeMutation,
        variables: {'public_key': bytesToHex(pubKeyBytes)},
        constructObject: (response) =>
            GetChallengeOutput.fromJson(response['get_challenge']),
      ),
      needsAuth: false,
    );
  }

  Future<VerifyChallengeOutput?> verifyChallenge(
    String signature,
    String protectedChallenge,
  ) async {
    final pubKeyBytes = await signer.getIdentityPublicKey();
    return await executeRawQuery(
      Query<VerifyChallengeOutput>(
        queryPayload: verifyChallengeMutation,
        variables: {
          'protected_challenge': protectedChallenge,
          'signature': signature,
          'identity_public_key': bytesToHex(pubKeyBytes),
        },
        constructObject: (response) =>
            VerifyChallengeOutput.fromJson(response['verify_challenge']),
      ),
      needsAuth: false,
    );
  }

  Future<void> authenticate() async {
    if (_authPromise != null) {
      return _authPromise;
    }

    _authPromise = _performAuthentication();
    try {
      await _authPromise;
    } finally {
      _authPromise = null;
    }
  }

  Future<void> _performAuthentication() async {
    const maxAttempts = 3;
    Exception? lastErr;

    for (int attempt = 0; attempt < maxAttempts; attempt++) {
      try {
        authProvider.removeAuth();

        final challenge = await getChallenge();
        if (challenge == null) {
          throw Exception("Failed to get challenge");
        }

        // Decode base64 challenge to bytes
        final challengeBytes = base64.decode(base64.normalize(challenge.protectedChallenge));
        // SHA256 Hash the bytes
        final hashedBytes = Uint8List.fromList(
          bsll.sha256.hash(challengeBytes)!,
        );

        // Sign the hashed bytes
        final signatureBytes = await signer.signMessageWithIdentityKey(
          hashedBytes,
        );
        final signatureBase64 = base64.normalize(base64.encode(signatureBytes));

        final verify = await verifyChallenge(
          signatureBase64,
          challenge.protectedChallenge,
        );

        if (verify == null) {
          throw Exception("Failed to verify challenge");
        }

        authProvider.setAuth(
          verify.sessionToken,
          DateTime.parse(
            verify.validUntil,
          ), // Ensure your API returns standard ISO8601
        );
        return;
      } catch (err) {
        if (err.toString().toLowerCase().contains("challenge expired")) {
          lastErr = err is Exception ? err : Exception(err.toString());
          continue;
        }
        rethrow;
      }
    }

    throw lastErr ?? Exception("Failed to authenticate after retries");
  }

  Future<CoopExitFeeQuote?> getCoopExitFeeQuote({
    required List<String> leafExternalIds,
    required String withdrawalAddress,
  }) async {
    return await executeRawQuery(
      Query<CoopExitFeeQuote>(
        queryPayload: getCoopExitFeeQuoteQuery,
        variables: {
          'leaf_external_ids': leafExternalIds,
          'withdrawal_address': withdrawalAddress,
        },
        constructObject: (response) =>
            CoopExitFeeQuote.fromJson(response['coop_exit_fee_quote']['quote']),
      ),
    );
  }

  Future<SparkWalletUserToUserRequestsConnection?> getUserRequests(
    GetUserRequestsParams params,
  ) async {
    return await executeRawQuery(
      Query<SparkWalletUserToUserRequestsConnection>(
        queryPayload: fetchCurrentUserToUserRequestsConnectionQuery,
        variables: {
          'first': params.first,
          'after': params.after,
          'types': params.types?.map((e) => e.value).toList(),
          'statuses': params.statuses?.map((e) => e.value).toList(),
          'networks': params.networks?.map((e) => e.value).toList(),
        },
        constructObject: (response) {
          final requests = response['current_user']?['user_requests'];
          if (requests == null) return null;
          return SparkWalletUserToUserRequestsConnection.fromJson(requests);
        },
      ),
    );
  }

  Future<RegisterSparkWalletWebhookOutput?> registerSparkWalletWebhook(
    RegisterSparkWalletWebhookInput input,
  ) async {
    return await executeRawQuery(
      Query<RegisterSparkWalletWebhookOutput>(
        queryPayload: registerSparkWalletWebhookMutation,
        variables: {
          'input': {
            'secret': input.secret,
            'url': input.url,
            'event_types':
                input.eventTypes, // map appropriately based on JSON key
          },
        },
        constructObject: (response) =>
            RegisterSparkWalletWebhookOutput.fromJson(
              response['register_wallet_webhook'],
            ),
      ),
    );
  }

  Future<DeleteSparkWalletWebhookOutput?> deleteSparkWalletWebhook(
    DeleteSparkWalletWebhookInput input,
  ) async {
    return await executeRawQuery(
      Query<DeleteSparkWalletWebhookOutput>(
        queryPayload: deleteSparkWalletWebhookMutation,
        variables: {
          'input': {'webhook_id': input.webhookId},
        },
        constructObject: (response) => DeleteSparkWalletWebhookOutput.fromJson(
          response['delete_wallet_webhook'],
        ),
      ),
    );
  }

  Future<ListSparkWalletWebhooksOutput?> listSparkWalletWebhooks() async {
    return await executeRawQuery(
      Query<ListSparkWalletWebhooksOutput>(
        queryPayload: listSparkWalletWebhooksQuery,
        variables: {},
        constructObject: (response) =>
            ListSparkWalletWebhooksOutput.fromJson(response['wallet_webhooks']),
      ),
    );
  }
}
