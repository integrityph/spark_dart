// lib/graphql/objects/leaves_swap_request.dart

import '../../lightspark_core/lightspark_core.dart';
import '../../types/sdk_types.dart';
import 'bitcoin_network.dart';
import 'currency_amount.dart';
import 'spark_leaves_swap_request_status.dart';
import 'swap_leaf.dart';
import 'transfer.dart';

class LeavesSwapRequest implements UserRequestType {
  /// The unique identifier of this entity across all Lightspark systems.
  @override
  final String id;

  /// The date and time when the entity was first created.
  @override
  final String createdAt;

  /// The date and time when the entity was last updated.
  @override
  final String updatedAt;

  /// The network the lightning send request is on.
  @override
  final BitcoinNetwork network;

  /// The status of the request.
  final SparkLeavesSwapRequestStatus status;

  /// The total amount of leaves user sent for swap.
  final CurrencyAmount totalAmount;

  /// The target amount of leaves user wanted to get from the swap.
  final CurrencyAmount targetAmount;

  /// The fee user needs to pay for swap.
  final CurrencyAmount fee;

  /// The leaves transfer to user.
  final Transfer inboundTransfer;

  /// The swap leaves returned to the user
  final List<SwapLeaf> swapLeaves;

  /// The typename of the object
  @override
  final String typename;

  /// The leaves transfer out from user.
  final Transfer? outboundTransfer;

  /// The time when the leaves swap request expires.
  final String? expiresAt;

  LeavesSwapRequest({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.network,
    required this.status,
    required this.totalAmount,
    required this.targetAmount,
    required this.fee,
    required this.inboundTransfer,
    required this.swapLeaves,
    this.typename = 'LeavesSwapRequest',
    this.outboundTransfer,
    this.expiresAt,
  });

  factory LeavesSwapRequest.fromJson(Map<String, dynamic> json) {
    return LeavesSwapRequest(
      id: json['leaves_swap_request_id'] as String,
      createdAt: json['leaves_swap_request_created_at'] as String,
      updatedAt: json['leaves_swap_request_updated_at'] as String,
      network: BitcoinNetwork.values.firstWhere(
        (e) => e.name == json['leaves_swap_request_network'],
        orElse: () => BitcoinNetwork.futureValue,
      ),
      status: SparkLeavesSwapRequestStatus.values.firstWhere(
        (e) => e.name == json['leaves_swap_request_status'],
        orElse: () => SparkLeavesSwapRequestStatus.futureValue,
      ),
      totalAmount: CurrencyAmount.fromJson(
        json['leaves_swap_request_total_amount'] as Map<String, dynamic>,
      ),
      targetAmount: CurrencyAmount.fromJson(
        json['leaves_swap_request_target_amount'] as Map<String, dynamic>,
      ),
      fee: CurrencyAmount.fromJson(
        json['leaves_swap_request_fee'] as Map<String, dynamic>,
      ),
      inboundTransfer: Transfer.fromJson(
        json['leaves_swap_request_inbound_transfer'] as Map<String, dynamic>,
      ),
      swapLeaves: (json['leaves_swap_request_swap_leaves'] as List<dynamic>)
          .map((e) => SwapLeaf.fromJson(e as Map<String, dynamic>))
          .toList(),
      typename: 'LeavesSwapRequest',
      outboundTransfer: json['leaves_swap_request_outbound_transfer'] != null
          ? Transfer.fromJson(
              json['leaves_swap_request_outbound_transfer']
                  as Map<String, dynamic>,
            )
          : null,
      expiresAt: json['leaves_swap_request_expires_at'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      '__typename': typename,
      'leaves_swap_request_id': id,
      'leaves_swap_request_created_at': createdAt,
      'leaves_swap_request_updated_at': updatedAt,
      'leaves_swap_request_network': network.name,
      'leaves_swap_request_status': status.name,
      'leaves_swap_request_total_amount': totalAmount.toJson(),
      'leaves_swap_request_target_amount': targetAmount.toJson(),
      'leaves_swap_request_fee': fee.toJson(),
      'leaves_swap_request_inbound_transfer': inboundTransfer.toJson(),
      'leaves_swap_request_outbound_transfer': outboundTransfer?.toJson(),
      'leaves_swap_request_expires_at': expiresAt,
      'leaves_swap_request_swap_leaves': swapLeaves
          .map((e) => e.toJson())
          .toList(),
    };
  }
}

const String FRAGMENT = '''
fragment LeavesSwapRequestFragment on LeavesSwapRequest {
    __typename
    leaves_swap_request_id: id
    leaves_swap_request_created_at: created_at
    leaves_swap_request_updated_at: updated_at
    leaves_swap_request_network: network
    leaves_swap_request_status: status
    leaves_swap_request_total_amount: total_amount {
        __typename
        currency_amount_original_value: original_value
        currency_amount_original_unit: original_unit
    }
    leaves_swap_request_target_amount: target_amount {
        __typename
        currency_amount_original_value: original_value
        currency_amount_original_unit: original_unit
    }
    leaves_swap_request_fee: fee {
        __typename
        currency_amount_original_value: original_value
        currency_amount_original_unit: original_unit
    }
    leaves_swap_request_inbound_transfer: inbound_transfer {
        __typename
        transfer_total_amount: total_amount {
            __typename
            currency_amount_original_value: original_value
            currency_amount_original_unit: original_unit
        }
        transfer_spark_id: spark_id
        transfer_user_request: user_request {
            id
        }
    }
    leaves_swap_request_outbound_transfer: outbound_transfer {
        __typename
        transfer_total_amount: total_amount {
            __typename
            currency_amount_original_value: original_value
            currency_amount_original_unit: original_unit
        }
        transfer_spark_id: spark_id
        transfer_user_request: user_request {
            id
        }
    }
    leaves_swap_request_expires_at: expires_at
    leaves_swap_request_swap_leaves: swap_leaves {
        __typename
        swap_leaf_leaf_id: leaf_id
        swap_leaf_raw_unsigned_refund_transaction: raw_unsigned_refund_transaction
        swap_leaf_adaptor_signed_signature: adaptor_signed_signature
        swap_leaf_direct_raw_unsigned_refund_transaction: direct_raw_unsigned_refund_transaction
        swap_leaf_direct_adaptor_signed_signature: direct_adaptor_signed_signature
        swap_leaf_direct_from_cpfp_raw_unsigned_refund_transaction: direct_from_cpfp_raw_unsigned_refund_transaction
        swap_leaf_direct_from_cpfp_adaptor_signed_signature: direct_from_cpfp_adaptor_signed_signature
    }
}
''';

Query<LeavesSwapRequest> getLeavesSwapRequestQuery(String id) {
  return Query<LeavesSwapRequest>(
    queryPayload:
        '''
query GetLeavesSwapRequest(\$id: ID!) {
    entity(id: \$id) {
        ... on LeavesSwapRequest {
            ...LeavesSwapRequestFragment
        }
    }
}

$FRAGMENT    
''',
    variables: {'id': id},
    constructObject: (dynamic data) {
      if (data is Map<String, dynamic> &&
          data.containsKey('entity') &&
          data['entity'] is Map<String, dynamic>) {
        return LeavesSwapRequest.fromJson(
          data['entity'] as Map<String, dynamic>,
        );
      }
      return null;
    },
  );
}
