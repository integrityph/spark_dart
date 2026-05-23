import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:grpc/grpc.dart';
import 'package:uuid/uuid.dart';
import 'package:boringssl_ffi/boringssl_ffi.dart' as bsll;

import '../../constants.dart';
import '../../errors/base.dart';
import '../../errors/types.dart';
import '../../src/proto/spark.pbgrpc.dart';
import '../../src/proto/spark_authn.pbgrpc.dart';
import '../../src/proto/spark_token.pbgrpc.dart';
// import '../../types/grpc.dart';
import '../config.dart';
import '../time_sync.dart';
import 'auth_interceptor.dart';
import 'address_middleware_interceptor.dart';
import 'client_cache_entry.dart';

// Module-level types used by shared caches
typedef ChannelKey = String;

// In Dart, ClientChannel is the standard gRPC channel (or GrpcWebClientChannel for web).
typedef BrowserOrNodeJSChannel = ClientChannel;

typedef TokenKey = String;

/// Track both monotonic and wall clock for redundancy
///
/// Monotonic is used to prevent clock skew issues
/// but it does not tick during sleep
///
/// Wall clock is used to handle device sleep/app backgrounding
/// but it is not as precise as monotonic
class CachedToken {
  final String token;
  final int expiresAtMono;
  final int expiresAtWallMs;

  CachedToken({
    required this.token,
    required this.expiresAtMono,
    required this.expiresAtWallMs,
  });
}

/// Safety margin (in seconds) to proactively refresh tokens before server-side
/// expiry. This prevents sending a valid-looking but about-to-expire token to
/// unauthenticated endpoints (like query_nodes) where the server silently drops
/// the session instead of returning UNAUTHENTICATED.
const int TOKEN_EXPIRY_BUFFER_SEC = 60;

// In Dart's grpc package, the clients themselves don't typically have a `close()`
// method directly; instead, you call `shutdown()` on the underlying `ClientChannel`.
// If you are using a custom wrapper, you can modify this.
typedef SparkAuthnServiceClientWithClose = SparkAuthnServiceClient;

// Dart doesn't have literal union types for strings, so we use enums
// and map them to strings when necessary.
enum SparkClientType { spark, stream, tokens }

/// 'none' means that the client will not authenticate with the SOs.
/// 'identity' means that the client will authenticate and sign the challenge with the identity key.
enum AuthMode { none, identity }

/// The address of the server, in the form `protocol://host:port`
typedef Address = String;

class ChannelCacheEntry {
  final BrowserOrNodeJSChannel channel;
  int refCount;

  ChannelCacheEntry({required this.channel, required this.refCount});
}

const int maxMessageSize = 20 * 1024 * 1024; // 20 MB

class ConnectionManager {
  static const String DATE_HEADER = "date";
  static const String PROCESSING_TIME_HEADER = "x-processing-time-ms";
  String? certPath;

  // Static caches shared across all instances
  static final Map<ChannelKey, ChannelCacheEntry> _channelCache = {};
  static final Map<ChannelKey, Future<BrowserOrNodeJSChannel>>
  _channelInflight = {};
  static final Map<TokenKey, CachedToken> _authTokenCache = {};
  static final Map<TokenKey, Future<String>> _authInflight = {};

  String makeChannelKey(Address address, [bool stream = false]) {
    return [address, stream ? "stream" : "unary"].join("|");
  }

  static Future<T> acquireChannel<T extends BrowserOrNodeJSChannel>(
    ChannelKey key,
    Future<T> Function() create,
  ) async {
    final existing = _channelCache[key];
    if (existing != null) {
      existing.refCount++;
      return existing.channel as T;
    }

    var channelPromise = _channelInflight[key];
    if (channelPromise == null) {
      channelPromise = () async {
        final ch = await create();
        _channelCache[key] = ChannelCacheEntry(channel: ch, refCount: 1);
        return ch;
      }();
      _channelInflight[key] = channelPromise;
    }

    try {
      return (await channelPromise) as T;
    } finally {
      _channelInflight.remove(key);
    }
  }

  static void releaseChannel(ChannelKey key) {
    final entry = _channelCache[key];
    if (entry == null) return;

    entry.refCount--;
    if (entry.refCount <= 0) {
      final ch = entry.channel;
      try {
        // Dart's standard ClientChannel uses shutdown() rather than close()
        ch.shutdown();
      } catch (_) {
        // Ignore shutdown errors
      }
      _channelCache.remove(key);
    }
  }

  static TokenKey _makeAuthTokenKey(Address address, String identityHex) {
    return "$address|$identityHex";
  }

  static String? _getCachedAuthToken(Address address, String identityHex) {
    final key = _makeAuthTokenKey(address, identityHex);
    final entry = _authTokenCache[key];
    if (entry == null) return null;

    // Proactively evict tokens that are within the buffer of server-side expiry.
    // Two complementary checks:
    //   - Monotonic: immune to clock skew, but freezes during device sleep
    //   - Wall-clock: survives device sleep, but vulnerable to clock adjustments
    final bufferMs = TOKEN_EXPIRY_BUFFER_SEC * 1000;
    if (getMonotonicTime() >= entry.expiresAtMono - bufferMs ||
        DateTime.now().millisecondsSinceEpoch >=
            entry.expiresAtWallMs - bufferMs) {
      _authTokenCache.remove(key);
      return null;
    }

    return entry.token;
  }

  static void _setCachedAuthToken(
    Address address,
    String identityHex,
    String authToken,
    int expiresAtSec,
    int nowSec,
  ) {
    // Convert server-relative expiry to a monotonic deadline so that all
    // future cache reads are instance-independent and clock-skew-safe.
    final ttlMs = (expiresAtSec - nowSec) * 1000;

    final tokenKey = _makeAuthTokenKey(address, identityHex);

    _authTokenCache[tokenKey] = CachedToken(
      token: authToken,
      expiresAtMono: getMonotonicTime() + ttlMs,
      expiresAtWallMs: DateTime.now().millisecondsSinceEpoch + ttlMs,
    );
    print("token cached for $address $identityHex under key $tokenKey");
  }

  static void _invalidateCachedAuthToken(Address address, String identityHex) {
    _authTokenCache.remove(_makeAuthTokenKey(address, identityHex));
  }

  static void clearAuthTokenCache() {
    _authTokenCache.clear();
  }

  static Future<String> _getOrCreateAuthToken(
    Address address,
    String identityHex,
    int Function() getNowSec,
    // Using a Dart 3 Record to represent { token: string; expiresAtSec: number }
    Future<({String token, int expiresAtSec})> Function() authenticateFunc,
  ) async {
    final cached = _getCachedAuthToken(address, identityHex);
    if (cached != null) {
      print("_getOrCreateAuthToken returned from cache $cached");
      return cached;
    }

    final tokenKey = _makeAuthTokenKey(address, identityHex);
    var authPromise = _authInflight[tokenKey];

    if (authPromise == null) {
      authPromise = () async {
        final result = await authenticateFunc();
        _setCachedAuthToken(
          address,
          identityHex,
          result.token,
          result.expiresAtSec,
          getNowSec(),
        );
        return result.token;
      }();
      _authInflight[tokenKey] = authPromise;
    }

    try {
      return await authPromise;
    } finally {
      _authInflight.remove(tokenKey);
    }
  }

  // Future<BrowserOrNodeJSChannel> createChannelWithTLS(
  //   Address address, [
  //   bool isStreamClientType = false,
  // ]);

  Future<ClientChannel> createChannelWithTLS(
    String address, [
    bool isStreamClientType = false,
  ]) async {
    final uri = Uri.parse(
      address.contains('//') ? address : 'https://$address',
    );
    final host = uri.host;
    final port =
        uri.port; // Automatically returns 443 for https if port is missing

    ChannelCredentials credentials;

    try {
      if (certPath != null) {
        try {
          final certBytes = File(certPath!).readAsBytesSync();
          credentials = ChannelCredentials.secure(certificates: certBytes);
        } catch (error) {
          print("Error reading certificate: $error");
          credentials = ChannelCredentials.secure(
            onBadCertificate: (X509Certificate cert, String host) =>
                true, // rejectUnauthorized: false
          );
        }
      } else {
        credentials = ChannelCredentials.secure(
          onBadCertificate: (X509Certificate cert, String host) =>
              true, // rejectUnauthorized: false
        );
      }

      return ClientChannel(
        host,
        port: port,
        options: ChannelOptions(
          credentials: credentials,
          // Dart gRPC generally manages frame sizes efficiently by default,
          // but you can enforce custom codec registries if you hit the 20MB limit.
        ),
      );
    } catch (error) {
      throw SparkRequestError(
        "Failed to create channel",
        context: {"url": address, "error": error},
      );
    }
  }

  // Abstract method to instantiate the specific Dart gRPC stub (client)
  // In Dart gRPC, middleware is handled via ClientInterceptors.
  // Future<T> createGrpcClient<T>(
  //   dynamic definition, // Type token or enum to identify the service (Spark/Authn/Token)
  //   BrowserOrNodeJSChannel channel,
  //   bool withRetries, {
  //   dynamic middleware, // e.g., ClientInterceptor
  //   ChannelKey? channelKey,
  // });

  // Dart requires the specific client factory (e.g., SparkServiceClient.new)
  // instead of a dynamic definition.
  Future<(T client, void Function() close)> createGrpcClient<T>(
    T Function(ClientChannel, {Iterable<ClientInterceptor>? interceptors})
    clientFactory,
    ClientChannel channel,
    bool withRetries, {
    List<ClientInterceptor>? middleware,
    String? channelKey,
  }) async {
    final List<ClientInterceptor> interceptors = [];

    if (withRetries) {
      // In Dart, nice-grpc retry logic translates to a custom ClientInterceptor.
      // You will map the RetryOptions (3 attempts, delays, UNAVAILABLE/CANCELLED)
      // into your own interceptor implementation here.
      // interceptors.add(RetryInterceptor(...));
    }

    if (middleware != null) {
      interceptors.addAll(middleware);
    }

    final client = clientFactory(channel, interceptors: interceptors);

    return (
      client,
      () {
        if (channelKey != null) {
          ConnectionManager.releaseChannel(channelKey);
        } else {
          channel.shutdown();
        }
      },
    );
  }

  // Note: In Dart, properties initialized in the constructor without `late` must be initialized immediately or in the initializer list.
  late final WalletConfigService config;
  late final ServerTimeSync timeSync;
  late final AuthMode authMode;
  late final String sessionId;

  // Note: clientsByType is a per-instance cache whereas _channelCache is static and shared
  final Map<SparkClientType, Map<Address, ClientCacheEntry>> _clientsByType = {
    SparkClientType.spark: {},
    SparkClientType.stream: {},
    SparkClientType.tokens: {},
  };

  String? _identityPublicKeyHex;

  // Since ConnectionManager is an abstract class, this would be its constructor
  ConnectionManager(this.config, [this.authMode = AuthMode.identity]) {
    timeSync = ServerTimeSync();
    final uuid = Uuid();
    sessionId = uuid.v7();
  }

  String getSessionId() {
    return sessionId;
  }

  DateTime getCurrentServerTime() {
    final serverTime = timeSync.getCurrentServerTime();
    if (serverTime == null) {
      return DateTime.now();
    }
    return serverTime;
  }

  bool isTimeSynced() {
    return timeSync.isSynced();
  }

  // When initializing wallet, go ahead and instantiate all clients
  Future<void> createClients() async {
    final operators = config.getSigningOperators().values;
    await Future.wait(
      operators.map((operator) => createSparkClient(operator.address)),
    );
  }

  Future<void> closeConnections() async {
    final List<Future<void>> closePromises = [];

    for (final clientMap in _clientsByType.values) {
      for (final entry in clientMap.values) {
        if (entry.close != null) {
          closePromises.add(
            Future.sync(() => entry.close!()).catchError((_) {}),
          );
        }
      }
      clientMap.clear();
    }

    await Future.wait(closePromises);
  }

  // Returns a type identifier or proto descriptor used by your createGrpcClient implementation
  dynamic _getDefinitionForClientType(SparkClientType type) {
    return type == SparkClientType.tokens
        ? SparkTokenServiceClient.new
        : SparkServiceClient.new;
  }

  static bool isStreamClientType(SparkClientType type) {
    return type == SparkClientType.stream;
  }

  Map<Address, ClientCacheEntry> _getAddressToClientMap(SparkClientType type) {
    return _clientsByType[type]!;
  }

  Future<T> _getOrCreateClientInternal<T extends Client>(
    SparkClientType type,
    Address address,
  ) async {
    final addressToClientMap = _getAddressToClientMap(type);
    final existing = addressToClientMap[address];

    if (existing != null) {
      return existing.client as T;
    }

    if (authMode == AuthMode.identity) {
      await authenticate(address); // Implemented in next chunk
    }

    final isStreamClient = isStreamClientType(type);
    final key = makeChannelKey(address, isStreamClient);

    final channel = await ConnectionManager.acquireChannel(
      key,
      () => createChannelWithTLS(address, isStreamClient),
    );

    final middleware = createMiddleware(address); // Implemented in next chunk
    final def = _getDefinitionForClientType(type);

    final client = await createGrpcClient<T>(
      def,
      channel,
      true,
      middleware: [middleware],
      channelKey: key,
    );

    // Provide a way to cleanly release the channel associated with this client
    void closeHook() {
      ConnectionManager.releaseChannel(key);
    }

    addressToClientMap[address] = ClientCacheEntry(
      client: client.$1,
      channelKey: key,
      close: closeHook,
    );

    return client.$1;
  }

  // Assume you have imported the crypto package
  // // import 'package:crypto/crypto.dart';

  Future<SparkServiceClient> createSparkStreamClient(String address) async {
    return _getOrCreateClientInternal<SparkServiceClient>(
      SparkClientType.stream,
      address,
    );
  }

  Future<SparkServiceClient> createSparkClient(String address) async {
    return _getOrCreateClientInternal<SparkServiceClient>(
      SparkClientType.spark,
      address,
    );
  }

  Future<SparkTokenServiceClient> createSparkTokenClient(String address) async {
    return _getOrCreateClientInternal<SparkTokenServiceClient>(
      SparkClientType.tokens,
      address,
    );
  }

  Future<BrowserOrNodeJSChannel?> getChannelForClient(
    SparkClientType clientType,
    Address address,
  ) async {
    final key = _getAddressToClientMap(clientType)[address]?.channelKey;
    if (key == null) return null;
    return ConnectionManager._channelCache[key]?.channel;
  }

  Future<String> _getIdentityPublicKeyHex() async {
    if (_identityPublicKeyHex != null) return _identityPublicKeyHex!;

    final identityPublicKey = await config.signer.getIdentityPublicKey();
    final hex = identityPublicKey
        .map((b) => b.toRadixString(16).padLeft(2, '0'))
        .join('');

    _identityPublicKeyHex = hex;
    return hex;
  }

  Future<String> authenticate(String address) async {
    final identityHex = await _getIdentityPublicKeyHex();

    print("authenticate identityHex: $identityHex");

    return await ConnectionManager._getOrCreateAuthToken(
      address,
      identityHex,
      () => (getCurrentServerTime().millisecondsSinceEpoch / 1000).floor(),
      () async {
        const int maxAttempts = 8;
        Exception? lastError;

        final identityPublicKey = await config.signer.getIdentityPublicKey();
        final sparkAuthnClientEntry = await _createSparkAuthnGrpcConnection(
          address,
        );
        final sparkAuthnClient = sparkAuthnClientEntry.client;

        try {
          for (int attempt = 0; attempt < maxAttempts; attempt++) {
            try {
              final challengeResp = await sparkAuthnClient.get_challenge(
                GetChallengeRequest(
                  publicKey: identityPublicKey,
                ), // Map to actual proto generated class
              );

              final protectedChallenge = challengeResp.protectedChallenge;
              final challenge = protectedChallenge.challenge;

              // Check if challenge is effectively empty (depends on your protobuf generation)
              if (!challenge.hasVersion()) {
                throw SparkAuthenticationError(
                  "Invalid challenge response",
                  context: {
                    'endpoint': "get_challenge",
                    'reason': "Missing challenge in response",
                  },
                );
              }

              // Assume Challenge is the protobuf class and writeToBuffer() serializes it
              final challengeBytes = challenge.writeToBuffer();

              // Using package:crypto for SHA256
              final hash = Uint8List.fromList(
                bsll.sha256.hash(challengeBytes)!,
              );

              final derSignatureBytes = await config.signer
                  .signMessageWithIdentityKey(hash);

              final verifyResp = await sparkAuthnClient.verify_challenge(
                VerifyChallengeRequest(
                  // Map to actual proto generated class
                  protectedChallenge: protectedChallenge,
                  signature: derSignatureBytes,
                  publicKey: identityPublicKey,
                ),
              );

              print("verifyResp.sessionToken: ${verifyResp.sessionToken}");

              return (
                token: verifyResp.sessionToken,
                expiresAtSec: verifyResp.expirationTimestamp
                    .toInt(), // Assumes it's an int64 -> int
              );
            } catch (error) {
              if (error is Exception || error is Error) {
                // Assume these boolean functions are available locally or imported
                if (isExpiredChallengeError(error, attempt)) {
                  lastError = error is Exception
                      ? error
                      : Exception(error.toString());
                  continue;
                }

                if (isConnectionError(error, attempt)) {
                  lastError = error is Exception
                      ? error
                      : Exception(error.toString());
                  await Future.delayed(const Duration(milliseconds: 250));
                  continue;
                }

                throw SparkAuthenticationError(
                  "Authentication failed",
                  context: {
                    'endpoint': "authenticate",
                    'reason': error.toString(),
                    'error': error,
                  },
                );
              } else {
                lastError = Exception(
                  "Unknown error during authentication: $error",
                );
              }
            }
          }

          throw SparkAuthenticationError(
            "Authentication failed after retrying expired challenges",
            context: {
              'endpoint': "authenticate",
              'reason': lastError?.toString() ?? "Unknown error",
              'error': lastError,
            },
          );
        } finally {
          // If we mapped this to ClientCacheEntry
          sparkAuthnClientEntry.close?.call();
        }
      },
    );
  }

  Future<ClientCacheEntry<SparkAuthnServiceClient>>
  _createSparkAuthnGrpcConnection(String address) async {
    try {
      final key = makeChannelKey(address, false);
      final channel = await ConnectionManager.acquireChannel(
        key,
        () => createChannelWithTLS(address, false),
      );

      final authnMiddleware = createAuthnMiddleware();

      final client = await createGrpcClient<SparkAuthnServiceClient>(
        SparkAuthnServiceClient.new,
        channel,
        false,
        middleware: [authnMiddleware],
        channelKey: key,
      );

      void closeHook() {
        ConnectionManager.releaseChannel(key);
      }

      return ClientCacheEntry(
        client: client.$1,
        channelKey: key,
        close: closeHook,
      );
    } catch (error) {
      throw SparkError("Failed to create Spark Authn gRPC connection", {
        'error': error,
      });
    }
  }

  // TODO: port this when the mock.proto is added and compiled. This is for unit testing only.
  // Future<(MockServiceClient client, void Function() close)> createMockClient(String address) async {
  //   final key = makeChannelKey(address, false);

  //   // acquireChannel assumed to be handled by your state/connection map
  //   final channel = await ConnectionManager.acquireChannel<ClientChannel>(
  //     key,
  //     () => createChannelWithTLS(address, false),
  //   );

  //   final client = MockServiceClient(channel);

  //   return (
  //     client,
  //     () => ConnectionManager.releaseChannel(key)
  //   );
  // }

  // In Dart gRPC, Metadata is typically handled via CallOptions
  // CallOptions prepareMetadata(CallOptions? options) {
  //   final existingMetadata = Map<String, String>.from(options?.metadata ?? {});
  //   existingMetadata['X-Session-Id'] = sessionId;

  //   return CallOptions(
  //     metadata: existingMetadata,
  //     timeout: options?.timeout,
  //     providers: options?.metadataProviders,
  //   );
  // }

  CallOptions prepareMetadata(CallOptions? options) {
    final existingMetadata = Map<String, String>.from(options?.metadata ?? {});

    // Base class logic
    existingMetadata['X-Session-Id'] = sessionId;

    // NodeJS override logic cleanly appended
    existingMetadata['X-Client-Env'] = getClientEnv();

    return CallOptions(
      metadata: existingMetadata,
      timeout: options?.timeout,
      providers: options?.metadataProviders,
    );
  }

  // In Dart, nice-grpc's middleware maps to a ClientInterceptor.
  // We return an interceptor that applies the metadata.
  ClientInterceptor createAuthnMiddleware() {
    return AuthnInterceptor(prepareMetadata);
  }

  ClientInterceptor createMiddleware(String address) {
    return AddressMiddlewareInterceptor(address, this);
  }

  // Internal helper to process unary calls for createMiddleware
  // ResponseFuture<R> _handleUnaryInterceptor<Q, R>(
  //   String address,
  //   ClientMethod<Q, R> method,
  //   Q request,
  //   CallOptions options,
  //   ClientUnaryInvoker<Q, R> invoker,
  // ) {
  //   // We use a Completer to handle the async authentication and retry logic
  //   // before actually invoking the gRPC call.
  //   final completer = Completer<R>();

  //   () async {
  //     try {
  //       final metadataOptions = prepareMetadata(options);
  //       final authToken = authMode == AuthMode.identity
  //           ? await authenticate(address)
  //           : null;

  //       final sendTime = getMonotonicTime();

  //       final mergedMetadata = Map<String, String>.from(metadataOptions.metadata);
  //       if (authToken != null) {
  //         mergedMetadata['Authorization'] = 'Bearer $authToken';
  //       }

  //       final callOptions = metadataOptions.mergedWith(CallOptions(metadata: mergedMetadata));

  //       final call = invoker(method, request, callOptions);

  //       // Await headers to update TimeSync
  //       final headers = await call.headers;
  //       _processResponseHeaders(headers, sendTime);

  //       final result = await call;
  //       completer.complete(result);
  //     } catch (error) {
  //       try {
  //         // Delegate to the error handler, mimicking TS handleMiddlewareError
  //         final result = await handleMiddlewareError<Q, R>(
  //           error,
  //           address,
  //           // In Dart, we pass the invoker/request combination to allow a retry
  //           () => invoker(method, request, options),
  //           options,
  //         );
  //         completer.complete(await result);
  //       } catch (retryError) {
  //         completer.completeError(retryError);
  //       }
  //     }
  //   }();

  //   return ResponseFuture<R>(completer.future);
  // }

  // Internal helper to process streaming calls for createMiddleware
  // ResponseStream<R> _handleStreamingInterceptor<Q, R>(
  //   String address,
  //   ClientMethod<Q, R> method,
  //   Stream<Q> requests,
  //   CallOptions options,
  //   ClientStreamingInvoker<Q, R> invoker,
  // ) {
  //   late StreamController<R> controller;

  //   controller = StreamController<R>(
  //     onListen: () async {
  //       try {
  //         final metadataOptions = prepareMetadata(options);
  //         final authToken = authMode == AuthMode.identity
  //             ? await authenticate(address)
  //             : null;

  //         final sendTime = getMonotonicTime();

  //         final mergedMetadata = Map<String, String>.from(metadataOptions.metadata ?? {});
  //         if (authToken != null) {
  //           mergedMetadata['Authorization'] = 'Bearer $authToken';
  //         }

  //         final callOptions = metadataOptions.mergedWith(CallOptions(metadata: mergedMetadata));
  //         final call = invoker(method, requests, callOptions);

  //         final headers = await call.headers;
  //         _processResponseHeaders(headers, sendTime);

  //         await controller.addStream(call);
  //         await controller.close();
  //       } catch (error) {
  //         try {
  //           // Streaming retries are complex in Dart if the request stream has already been consumed.
  //           // This is a simplified conceptual mapping.
  //           final resultStream = await handleMiddlewareError<Q, ResponseStream<R>>(
  //             error,
  //             address,
  //             () => invoker(method, requests, options),
  //             options,
  //           );
  //           await controller.addStream(await resultStream);
  //           await controller.close();
  //         } catch (retryError) {
  //           controller.addError(retryError);
  //           await controller.close();
  //         }
  //       }
  //     },
  //   );

  //   return ResponseStream<R>(controller.stream);
  // }

  // void _processResponseHeaders(Map<String, String> header, int sendTime) {
  //   final receiveTimeValue = getMonotonicTime();

  //   final dateHeader = header[ConnectionManager.DATE_HEADER];
  //   final processingTimeHeader = header[ConnectionManager.PROCESSING_TIME_HEADER];

  //   if (dateHeader != null && processingTimeHeader != null) {
  //     final wasSynced = timeSync.isSynced();

  //     final serverProcessingTimeMs = double.parse(processingTimeHeader);
  //     timeSync.recordSync(
  //       dateHeader,
  //       serverProcessingTimeMs,
  //       sendTime,
  //       receiveTimeValue,
  //     );

  //     // Since the server time isn't known at the time,
  //     // the first auth call computes TTL from the client clock (monotonic + wall clock)
  //     // If the client clock is skewed these tokens may expire before the eviction check can catch them
  //     // Invalidate any tokens that were cached before the server time was known.
  //     if (!wasSynced && timeSync.isSynced()) {
  //       ConnectionManager._authTokenCache.clear();
  //     }
  //   }
  // }

  Future<dynamic> handleMiddlewareError<Req, Res>(
    dynamic error,
    String address,
    dynamic Function() retryCall, // Maps to call.next(...) in TS
    CallOptions options,
  ) async {
    final errorMessage = error.toString();

    if (errorMessage.contains("token has expired")) {
      final identityHex = await _getIdentityPublicKeyHex();
      ConnectionManager._invalidateCachedAuthToken(address, identityHex);

      if (authMode == AuthMode.identity) {
        await authenticate(address);
      }

      // In Dart gRPC, you modify options before calling the invoker again
      // We assume the caller handles merging this new auth token into the retry metadata
      return await retryCall();
    } else if (error is GrpcError) {
      // Maps to ClientError in nice-grpc
      if (error.code == StatusCode.resourceExhausted) {
        throw Exception("Server is busy, please try again later.");
      }
    }

    throw error;
  }

  // Future<ResponseStream<SubscribeToEventsResponse>> subscribeToEvents(
  //   String address, [
  //   Future<void>? abortSignal,
  // ]) async {
  //   final sparkStreamClient = await createSparkStreamClient(address);
  //   final identityPublicKey = await config.signer.getIdentityPublicKey();

  //   final request = SubscribeToEventsRequest(
  //     identityPublicKey: identityPublicKey,
  //   );

  //   final stream = sparkStreamClient.subscribe_to_events(request);

  //   // If a cancellation signal is provided, listen for it to complete
  //   if (abortSignal != null) {
  //     // .ignore() prevents unhandled exceptions if the signal future throws an error
  //     abortSignal.then((_) async {
  //       await stream.cancel();
  //     }).ignore();
  //   }

  //   return stream;
  // }

  Future<ResponseStream<SubscribeToEventsResponse>> subscribeToEvents(
    String address, [
    Future<void>? abortSignal,
  ]) async {
    final sparkStreamClient = await createSparkStreamClient(address);
    final identityPublicKey = await config.signer.getIdentityPublicKey();

    final request = SubscribeToEventsRequest(
      identityPublicKey: identityPublicKey,
    );

    final stream = sparkStreamClient.subscribe_to_events(request);

    // If a cancellation signal is provided, listen for it to complete
    if (abortSignal != null) {
      // .ignore() prevents unhandled exceptions if the signal future throws an error
      abortSignal.then((_) async {
        await stream.cancel();
      }).ignore();
    }

    // Note: The Node.js socket unref() polling loop from the TypeScript SDK
    // has been entirely omitted here, as Dart handles socket teardown correctly.

    return stream;
  }
}

// Global helper functions
bool isExpiredChallengeError(dynamic error, int attempt) {
  final isExpired = error.toString().contains("challenge expired");
  if (isExpired) {
    print(
      "Warning: Authentication attempt ${attempt + 1} failed due to expired challenge, retrying...",
    );
  }
  return isExpired;
}

bool isConnectionError(dynamic error, int attempt) {
  final errorMessage = error.toString();
  final isConnError =
      errorMessage.contains("RST_STREAM") ||
      errorMessage.contains("INTERNAL") ||
      errorMessage.contains("Internal server error") ||
      errorMessage.contains("unavailable") ||
      errorMessage.contains("UNAVAILABLE") ||
      errorMessage.contains("UNKNOWN") ||
      errorMessage.contains("Received HTTP status code");

  if (isConnError) {
    print("Warning: Connection error: $errorMessage, retrying...");
  }
  return isConnError;
}
