// lib/graphql/objects/swap_leaf.dart

class SwapLeaf {
  final String leafId;
  final String rawUnsignedRefundTransaction;
  final String adaptorSignedSignature;
  final String? directRawUnsignedRefundTransaction;
  final String? directAdaptorSignedSignature;
  final String? directFromCpfpRawUnsignedRefundTransaction;
  final String? directFromCpfpAdaptorSignedSignature;

  SwapLeaf({
    required this.leafId,
    required this.rawUnsignedRefundTransaction,
    required this.adaptorSignedSignature,
    this.directRawUnsignedRefundTransaction,
    this.directAdaptorSignedSignature,
    this.directFromCpfpRawUnsignedRefundTransaction,
    this.directFromCpfpAdaptorSignedSignature,
  });

  factory SwapLeaf.fromJson(Map<String, dynamic> json) {
    return SwapLeaf(
      leafId: json['swap_leaf_leaf_id'] as String,
      rawUnsignedRefundTransaction:
          json['swap_leaf_raw_unsigned_refund_transaction'] as String,
      adaptorSignedSignature:
          json['swap_leaf_adaptor_signed_signature'] as String,
      directRawUnsignedRefundTransaction:
          json['swap_leaf_direct_raw_unsigned_refund_transaction'] as String?,
      directAdaptorSignedSignature:
          json['swap_leaf_direct_adaptor_signed_signature'] as String?,
      directFromCpfpRawUnsignedRefundTransaction:
          json['swap_leaf_direct_from_cpfp_raw_unsigned_refund_transaction']
              as String?,
      directFromCpfpAdaptorSignedSignature:
          json['swap_leaf_direct_from_cpfp_adaptor_signed_signature']
              as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'swap_leaf_leaf_id': leafId,
      'swap_leaf_raw_unsigned_refund_transaction': rawUnsignedRefundTransaction,
      'swap_leaf_adaptor_signed_signature': adaptorSignedSignature,
      'swap_leaf_direct_raw_unsigned_refund_transaction':
          directRawUnsignedRefundTransaction,
      'swap_leaf_direct_adaptor_signed_signature': directAdaptorSignedSignature,
      'swap_leaf_direct_from_cpfp_raw_unsigned_refund_transaction':
          directFromCpfpRawUnsignedRefundTransaction,
      'swap_leaf_direct_from_cpfp_adaptor_signed_signature':
          directFromCpfpAdaptorSignedSignature,
    };
  }
}

const String FRAGMENT = '''
fragment SwapLeafFragment on SwapLeaf {
    __typename
    swap_leaf_leaf_id: leaf_id
    swap_leaf_raw_unsigned_refund_transaction: raw_unsigned_refund_transaction
    swap_leaf_adaptor_signed_signature: adaptor_signed_signature
    swap_leaf_direct_raw_unsigned_refund_transaction: direct_raw_unsigned_refund_transaction
    swap_leaf_direct_adaptor_signed_signature: direct_adaptor_signed_signature
    swap_leaf_direct_from_cpfp_raw_unsigned_refund_transaction: direct_from_cpfp_raw_unsigned_refund_transaction
    swap_leaf_direct_from_cpfp_adaptor_signed_signature: direct_from_cpfp_adaptor_signed_signature
}
''';
