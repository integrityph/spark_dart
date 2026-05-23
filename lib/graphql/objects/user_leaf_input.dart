// lib/graphql/objects/user_leaf_input.dart

class UserLeafInput {
  final String leafId;
  final String rawUnsignedRefundTransaction;
  final String directRawUnsignedRefundTransaction;
  final String directFromCpfpRawUnsignedRefundTransaction;
  final String adaptorAddedSignature;
  final String directAdaptorAddedSignature;
  final String directFromCpfpAdaptorAddedSignature;

  UserLeafInput({
    required this.leafId,
    required this.rawUnsignedRefundTransaction,
    required this.directRawUnsignedRefundTransaction,
    required this.directFromCpfpRawUnsignedRefundTransaction,
    required this.adaptorAddedSignature,
    required this.directAdaptorAddedSignature,
    required this.directFromCpfpAdaptorAddedSignature,
  });

  factory UserLeafInput.fromJson(Map<String, dynamic> json) {
    return UserLeafInput(
      leafId: json['leaf_id'] as String,
      rawUnsignedRefundTransaction:
          json['raw_unsigned_refund_transaction'] as String,
      directRawUnsignedRefundTransaction:
          json['direct_raw_unsigned_refund_transaction']
              as String,
      directFromCpfpRawUnsignedRefundTransaction:
          json['direct_from_cpfp_unsigned_refund_transaction']
              as String,
      adaptorAddedSignature:
          json['adaptor_added_signature'] as String,
      directAdaptorAddedSignature:
          json['direct_adaptor_added_signature'] as String,
      directFromCpfpAdaptorAddedSignature:
          json['direct_from_cpfp_adaptor_added_signature']
              as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'leaf_id': leafId,
      'raw_unsigned_refund_transaction':
          rawUnsignedRefundTransaction,
      'direct_raw_unsigned_refund_transaction':
          directRawUnsignedRefundTransaction,
      'direct_from_cpfp_raw_unsigned_refund_transaction':
          directFromCpfpRawUnsignedRefundTransaction,
      'adaptor_added_signature': adaptorAddedSignature,
      'direct_adaptor_added_signature':
          directAdaptorAddedSignature,
      'direct_from_cpfp_adaptor_added_signature':
          directFromCpfpAdaptorAddedSignature,
    };
  }

  // factory UserLeafInput.fromJson(Map<String, dynamic> json) {
  //   return UserLeafInput(
  //     leafId: json['user_leaf_input_leaf_id'] as String,
  //     rawUnsignedRefundTransaction:
  //         json['user_leaf_input_raw_unsigned_refund_transaction'] as String,
  //     directRawUnsignedRefundTransaction:
  //         json['user_leaf_input_direct_raw_unsigned_refund_transaction']
  //             as String,
  //     directFromCpfpRawUnsignedRefundTransaction:
  //         json['user_leaf_input_direct_from_cpfp_unsigned_refund_transaction']
  //             as String,
  //     adaptorAddedSignature:
  //         json['user_leaf_input_adaptor_added_signature'] as String,
  //     directAdaptorAddedSignature:
  //         json['user_leaf_input_direct_adaptor_added_signature'] as String,
  //     directFromCpfpAdaptorAddedSignature:
  //         json['user_leaf_input_direct_from_cpfp_adaptor_added_signature']
  //             as String,
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'user_leaf_input_leaf_id': leafId,
  //     'user_leaf_input_raw_unsigned_refund_transaction':
  //         rawUnsignedRefundTransaction,
  //     'user_leaf_input_direct_raw_unsigned_refund_transaction':
  //         directRawUnsignedRefundTransaction,
  //     'user_leaf_input_direct_from_cpfp_raw_unsigned_refund_transaction':
  //         directFromCpfpRawUnsignedRefundTransaction,
  //     'user_leaf_input_adaptor_added_signature': adaptorAddedSignature,
  //     'user_leaf_input_direct_adaptor_added_signature':
  //         directAdaptorAddedSignature,
  //     'user_leaf_input_direct_from_cpfp_adaptor_added_signature':
  //         directFromCpfpAdaptorAddedSignature,
  //   };
  // }
}
