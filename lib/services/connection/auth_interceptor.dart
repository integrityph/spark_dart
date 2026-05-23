import 'package:grpc/grpc.dart';

class AuthnInterceptor extends ClientInterceptor {
  // 1. Updated signature to perfectly match your prepareMetadata method
  final CallOptions Function(CallOptions?) prepareMetadata;

  AuthnInterceptor(this.prepareMetadata);

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    // 2. Since your method already takes and returns CallOptions,
    // we just pass it straight through!
    final newOptions = prepareMetadata(options);

    return invoker(method, request, newOptions);
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
    ClientMethod<Q, R> method,
    Stream<Q> requests,
    CallOptions options,
    ClientStreamingInvoker<Q, R> invoker,
  ) {
    final newOptions = prepareMetadata(options);
    return invoker(method, requests, newOptions);
  }
}
