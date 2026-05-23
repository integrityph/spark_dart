// import 'package:grpc/grpc.dart';

// class AddressMiddlewareInterceptor extends ClientInterceptor {
//   final String address;

//   // If your interceptor needs access to other variables from your main client,
//   // you can pass them into this constructor too!
//   AddressMiddlewareInterceptor(this.address);

//   @override
//   ResponseFuture<R> interceptUnary<Q, R>(
//     ClientMethod<Q, R> method,
//     Q request,
//     CallOptions options,
//     ClientUnaryInvoker<Q, R> invoker,
//   ) {
//     // 💡 MOVE the contents of your `_handleUnaryInterceptor` right here!
//     // You have access to `this.address` directly.

//     // Example:
//     // final newOptions = options.mergedWith(...);
//     // return invoker(method, request, newOptions);

//     return invoker(method, request, options); // Fallback if no changes are made
//   }

//   @override
//   ResponseStream<R> interceptStreaming<Q, R>(
//     ClientMethod<Q, R> method,
//     Stream<Q> requests,
//     CallOptions options,
//     ClientStreamingInvoker<Q, R> invoker,
//   ) {
//     // 💡 MOVE the contents of your `_handleStreamingInterceptor` right here!

//     return invoker(method, requests, options);
//   }
// }

import 'package:grpc/grpc.dart';

import '../time_sync.dart';
import 'connection.dart';

class AddressMiddlewareInterceptor extends ClientInterceptor {
  final String address;
  final ConnectionManager
  manager; // Pass your manager to access auth/time methods

  AddressMiddlewareInterceptor(this.address, this.manager);

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    final sendTime = getMonotonicTime();

    // 1. The Async Provider: Dart's answer to awaiting auth before the call
    Future<void> injectAuthToken(
      Map<String, String> metadata,
      String uri,
    ) async {
      final authToken = manager.authMode == AuthMode.identity
          ? await manager.authenticate(address)
          : null;

      if (authToken != null) {
        metadata['Authorization'] = 'Bearer $authToken';
      }
    }

    // 2. Attach the provider to the options
    final callOptions = options.mergedWith(
      CallOptions(providers: [injectAuthToken]),
    );

    // 3. Invoke immediately to satisfy Dart's synchronous return rule
    final call = invoker(method, request, callOptions);

    // 4. Listen for the headers asynchronously to run your TimeSync logic
    call.headers
        .then((headers) {
          _processResponseHeaders(headers, sendTime);
        })
        .catchError((_) {
          // Ignore header fetch errors here; the main call will throw the RPC error
        });

    return call;
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
    ClientMethod<Q, R> method,
    Stream<Q> requests,
    CallOptions options,
    ClientStreamingInvoker<Q, R> invoker,
  ) {
    final sendTime = getMonotonicTime();

    Future<void> injectAuthToken(
      Map<String, String> metadata,
      String uri,
    ) async {
      final authToken = manager.authMode == AuthMode.identity
          ? await manager.authenticate(address)
          : null;

      if (authToken != null) {
        metadata['Authorization'] = 'Bearer $authToken';
      }
    }

    final callOptions = options.mergedWith(
      CallOptions(providers: [injectAuthToken]),
    );

    final call = invoker(method, requests, callOptions);

    call.headers
        .then((headers) {
          _processResponseHeaders(headers, sendTime);
        })
        .catchError((_) {});

    return call;
  }

  void _processResponseHeaders(Map<String, String> header, int sendTime) {
    final receiveTimeValue = getMonotonicTime();

    // Make sure your header keys match exactly what the server sends (usually lowercase in HTTP/2)
    final dateHeader = header[ConnectionManager.DATE_HEADER.toLowerCase()];
    final processingTimeHeader =
        header[ConnectionManager.PROCESSING_TIME_HEADER.toLowerCase()];

    if (dateHeader != null && processingTimeHeader != null) {
      final wasSynced = manager.timeSync.isSynced();

      final serverProcessingTimeMs = double.parse(processingTimeHeader).round();
      manager.timeSync.recordSync(
        dateHeader,
        serverProcessingTimeMs,
        sendTime,
        receiveTimeValue,
      );

      if (!wasSynced && manager.timeSync.isSynced()) {
        ConnectionManager.clearAuthTokenCache();
      }
    }
  }
}
