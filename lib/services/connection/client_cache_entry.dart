import 'package:grpc/grpc.dart';

class ClientCacheEntry<T extends Client> {
  final T client;

  /// The key used to acquire/release the underlying gRPC channel.
  final String channelKey;

  /// Optional hook to cleanly release the channel associated with this client.
  final void Function()? close;

  ClientCacheEntry({
    required this.client,
    required this.channelKey,
    this.close,
  });
}
