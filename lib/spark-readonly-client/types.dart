// lib/spark_readonly_client/types.dart

import '../src/proto/spark.pb.dart'; // Adjust this to wherever your Direction enum is generated

class WalletGetUtxosForIdentityParams {
  final String? identityPublicKey;
  final int? pageSize;
  final String? cursor;
  final Direction? direction;
  final bool? excludeClaimed;
  final bool? includePending;

  const WalletGetUtxosForIdentityParams({
    this.identityPublicKey,
    this.pageSize,
    this.cursor,
    this.direction,
    this.excludeClaimed,
    this.includePending,
  });
}
