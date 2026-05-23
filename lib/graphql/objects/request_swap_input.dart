// // lib/graphql/objects/request_swap_input.dart

// import 'user_leaf_input.dart';

// class RequestSwapInput {
//   final String adaptorPubkey;
//   final int totalAmountSats;
//   final List<int> targetAmountSats;
//   final int feeSats;
//   final List<UserLeafInput> userLeaves;
//   final String userOutboundTransferExternalId;

//   RequestSwapInput({
//     required this.adaptorPubkey,
//     required this.totalAmountSats,
//     required this.targetAmountSats,
//     required this.feeSats,
//     required this.userLeaves,
//     required this.userOutboundTransferExternalId,
//   });

//   factory RequestSwapInput.fromJson(Map<String, dynamic> json) {
//     return RequestSwapInput(
//       adaptorPubkey: json['request_swap_input_adaptor_pubkey'] as String,
//       totalAmountSats: json['request_swap_input_total_amount_sats'] as int,
//       targetAmountSats:
//           (json['request_swap_input_target_amount_sats'] as List<dynamic>)
//               .map((e) => e as int)
//               .toList(),
//       feeSats: json['request_swap_input_fee_sats'] as int,
//       userLeaves: (json['request_swap_input_user_leaves'] as List<dynamic>)
//           .map((e) => UserLeafInput.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       userOutboundTransferExternalId:
//           json['request_swap_input_user_outbound_transfer_external_id']
//               as String,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'request_swap_input_adaptor_pubkey': adaptorPubkey,
//       'request_swap_input_total_amount_sats': totalAmountSats,
//       'request_swap_input_target_amount_sats': targetAmountSats,
//       'request_swap_input_fee_sats': feeSats,
//       'request_swap_input_user_leaves': userLeaves
//           .map((e) => e.toJson())
//           .toList(),
//       'request_swap_input_user_outbound_transfer_external_id':
//           userOutboundTransferExternalId,
//     };
//   }
// }
