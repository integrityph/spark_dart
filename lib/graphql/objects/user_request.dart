// lib/graphql/objects/user_request.dart

import '../../lightspark_core/lightspark_core.dart';
import 'bitcoin_network.dart';
import 'claim_static_deposit.dart';
import 'claim_static_deposit_status.dart';
import 'coop_exit_request.dart';
import 'currency_amount.dart';
import 'exit_speed.dart';
import 'invoice.dart';
import 'leaves_swap_request.dart';
import 'lightning_receive_request.dart';
import 'lightning_receive_request_status.dart';
import 'lightning_send_request.dart';
import 'lightning_send_request_status.dart';
import 'spark_coop_exit_request_status.dart';
import 'spark_leaves_swap_request_status.dart';
import 'swap_leaf.dart';
import 'transfer.dart';

abstract class UserRequest {
  final String id;
  final String createdAt;
  final String updatedAt;
  final BitcoinNetwork network;
  final String typename;

  UserRequest({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.network,
    required this.typename,
  });

  factory UserRequest.fromJson(Map<String, dynamic> json) {
    final typename = json['__typename'];

    switch (typename) {
      case 'ClaimStaticDeposit':
        return ClaimStaticDeposit(
          id: json['claim_static_deposit_id'] as String,
          createdAt: json['claim_static_deposit_created_at'] as String,
          updatedAt: json['claim_static_deposit_updated_at'] as String,
          network: BitcoinNetwork.values.firstWhere(
            (e) => e.name == json['claim_static_deposit_network'],
            orElse: () => BitcoinNetwork.futureValue,
          ),
          creditAmount: CurrencyAmount.fromJson(
            json['claim_static_deposit_credit_amount'] as Map<String, dynamic>,
          ),
          maxFee: CurrencyAmount.fromJson(
            json['claim_static_deposit_max_fee'] as Map<String, dynamic>,
          ),
          status: ClaimStaticDepositStatus.values.firstWhere(
            (e) => e.name == json['claim_static_deposit_status'],
            orElse: () => ClaimStaticDepositStatus.futureValue,
          ),
          transactionId: json['claim_static_deposit_transaction_id'] as String,
          outputIndex: json['claim_static_deposit_output_index'] as int,
          bitcoinNetwork: BitcoinNetwork.values.firstWhere(
            (e) => e.name == json['claim_static_deposit_bitcoin_network'],
            orElse: () => BitcoinNetwork.futureValue,
          ),
          transferSparkId:
              json['claim_static_deposit_transfer_spark_id'] as String,
        );

      case 'CoopExitRequest':
        return CoopExitRequest(
          id: json['coop_exit_request_id'] as String,
          createdAt: json['coop_exit_request_created_at'] as String,
          updatedAt: json['coop_exit_request_updated_at'] as String,
          network: BitcoinNetwork.values.firstWhere(
            (e) => e.name == json['coop_exit_request_network'],
            orElse: () => BitcoinNetwork.futureValue,
          ),
          fee: CurrencyAmount.fromJson(
            json['coop_exit_request_fee'] as Map<String, dynamic>,
          ),
          l1BroadcastFee: CurrencyAmount.fromJson(
            json['coop_exit_request_l1_broadcast_fee'] as Map<String, dynamic>,
          ),
          status: SparkCoopExitRequestStatus.values.firstWhere(
            (e) => e.name == json['coop_exit_request_status'],
            orElse: () => SparkCoopExitRequestStatus.futureValue,
          ),
          expiresAt: json['coop_exit_request_expires_at'] as String,
          rawConnectorTransaction:
              json['coop_exit_request_raw_connector_transaction'] as String,
          rawCoopExitTransaction:
              json['coop_exit_request_raw_coop_exit_transaction'] as String,
          coopExitTxid: json['coop_exit_request_coop_exit_txid'] as String,
          feeQuoteId: json['coop_exit_request_fee_quote']?['id'] as String?,
          exitSpeed: json['coop_exit_request_exit_speed'] != null
              ? ExitSpeed.values.firstWhere(
                  (e) => e.name == json['coop_exit_request_exit_speed'],
                  orElse: () => ExitSpeed.futureValue,
                )
              : null,
          transfer: json['coop_exit_request_transfer'] != null
              ? Transfer.fromJson(
                  json['coop_exit_request_transfer'] as Map<String, dynamic>,
                )
              : null,
        );

      case 'LeavesSwapRequest':
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
            json['leaves_swap_request_inbound_transfer']
                as Map<String, dynamic>,
          ),
          swapLeaves: (json['leaves_swap_request_swap_leaves'] as List<dynamic>)
              .map((e) => SwapLeaf.fromJson(e as Map<String, dynamic>))
              .toList(),
          outboundTransfer:
              json['leaves_swap_request_outbound_transfer'] != null
              ? Transfer.fromJson(
                  json['leaves_swap_request_outbound_transfer']
                      as Map<String, dynamic>,
                )
              : null,
          expiresAt: json['leaves_swap_request_expires_at'] as String,
        );

      case 'LightningReceiveRequest':
        return LightningReceiveRequest(
          id: json['lightning_receive_request_id'] as String,
          createdAt: json['lightning_receive_request_created_at'] as String,
          updatedAt: json['lightning_receive_request_updated_at'] as String,
          network: BitcoinNetwork.values.firstWhere(
            (e) => e.name == json['lightning_receive_request_network'],
            orElse: () => BitcoinNetwork.futureValue,
          ),
          invoice: Invoice.fromJson(
            json['lightning_receive_request_invoice'] as Map<String, dynamic>,
          ),
          status: LightningReceiveRequestStatus.values.firstWhere(
            (e) => e.name == json['lightning_receive_request_status'],
            orElse: () => LightningReceiveRequestStatus.futureValue,
          ),
          transfer: json['lightning_receive_request_transfer'] != null
              ? Transfer.fromJson(
                  json['lightning_receive_request_transfer']
                      as Map<String, dynamic>,
                )
              : null,
          paymentPreimage:
              json['lightning_receive_request_payment_preimage'] as String?,
          receiverIdentityPublicKey:
              json['lightning_receive_request_receiver_identity_public_key']
                  as String?,
        );

      case 'LightningSendRequest':
        return LightningSendRequest(
          id: json['lightning_send_request_id'] as String,
          createdAt: json['lightning_send_request_created_at'] as String,
          updatedAt: json['lightning_send_request_updated_at'] as String,
          network: BitcoinNetwork.values.firstWhere(
            (e) => e.name == json['lightning_send_request_network'],
            orElse: () => BitcoinNetwork.futureValue,
          ),
          encodedInvoice:
              json['lightning_send_request_encoded_invoice'] as String,
          fee: CurrencyAmount.fromJson(
            json['lightning_send_request_fee'] as Map<String, dynamic>,
          ),
          idempotencyKey:
              json['lightning_send_request_idempotency_key'] as String,
          status: LightningSendRequestStatus.values.firstWhere(
            (e) => e.name == json['lightning_send_request_status'],
            orElse: () => LightningSendRequestStatus.futureValue,
          ),
          transfer: json['lightning_send_request_transfer'] != null
              ? Transfer.fromJson(
                  json['lightning_send_request_transfer']
                      as Map<String, dynamic>,
                )
              : null,
          paymentPreimage:
              json['lightning_send_request_payment_preimage'] as String?,
        );

      default:
        throw LightsparkException(
          'DeserializationError',
          "Couldn't find a concrete type for interface UserRequest corresponding to the typename=$typename",
        );
    }
  }

  /// Centralized mapping for serialization.
  /// Alternatively, you can declare this as `abstract Map<String, dynamic> toJson();`
  /// and let each concrete class handle its own implementation.
  Map<String, dynamic> toJson() {
    if (this is ClaimStaticDeposit) {
      final req = this as ClaimStaticDeposit;
      return {
        '__typename': 'ClaimStaticDeposit',
        'claim_static_deposit_id': req.id,
        'claim_static_deposit_created_at': req.createdAt,
        'claim_static_deposit_updated_at': req.updatedAt,
        'claim_static_deposit_network': req.network.name,
        'claim_static_deposit_credit_amount': req.creditAmount.toJson(),
        'claim_static_deposit_max_fee': req.maxFee.toJson(),
        'claim_static_deposit_status': req.status.name,
        'claim_static_deposit_transaction_id': req.transactionId,
        'claim_static_deposit_output_index': req.outputIndex,
        'claim_static_deposit_bitcoin_network': req.bitcoinNetwork.name,
        'claim_static_deposit_transfer_spark_id': req.transferSparkId,
      };
    } else if (this is CoopExitRequest) {
      final req = this as CoopExitRequest;
      return {
        '__typename': 'CoopExitRequest',
        'coop_exit_request_id': req.id,
        'coop_exit_request_created_at': req.createdAt,
        'coop_exit_request_updated_at': req.updatedAt,
        'coop_exit_request_network': req.network.name,
        'coop_exit_request_fee': req.fee.toJson(),
        'coop_exit_request_l1_broadcast_fee': req.l1BroadcastFee.toJson(),
        'coop_exit_request_fee_quote': {'id': req.feeQuoteId},
        'coop_exit_request_exit_speed': req.exitSpeed?.name,
        'coop_exit_request_status': req.status.name,
        'coop_exit_request_expires_at': req.expiresAt,
        'coop_exit_request_raw_connector_transaction':
            req.rawConnectorTransaction,
        'coop_exit_request_raw_coop_exit_transaction':
            req.rawCoopExitTransaction,
        'coop_exit_request_coop_exit_txid': req.coopExitTxid,
        'coop_exit_request_transfer': req.transfer?.toJson(),
      };
    } else if (this is LeavesSwapRequest) {
      final req = this as LeavesSwapRequest;
      return {
        '__typename': 'LeavesSwapRequest',
        'leaves_swap_request_id': req.id,
        'leaves_swap_request_created_at': req.createdAt,
        'leaves_swap_request_updated_at': req.updatedAt,
        'leaves_swap_request_network': req.network.name,
        'leaves_swap_request_status': req.status.name,
        'leaves_swap_request_total_amount': req.totalAmount.toJson(),
        'leaves_swap_request_target_amount': req.targetAmount.toJson(),
        'leaves_swap_request_fee': req.fee.toJson(),
        'leaves_swap_request_inbound_transfer': req.inboundTransfer.toJson(),
        'leaves_swap_request_outbound_transfer': req.outboundTransfer?.toJson(),
        'leaves_swap_request_expires_at': req.expiresAt,
        'leaves_swap_request_swap_leaves': req.swapLeaves
            .map((e) => e.toJson())
            .toList(),
      };
    } else if (this is LightningReceiveRequest) {
      final req = this as LightningReceiveRequest;
      return {
        '__typename': 'LightningReceiveRequest',
        'lightning_receive_request_id': req.id,
        'lightning_receive_request_created_at': req.createdAt,
        'lightning_receive_request_updated_at': req.updatedAt,
        'lightning_receive_request_network': req.network.name,
        'lightning_receive_request_invoice': req.invoice.toJson(),
        'lightning_receive_request_status': req.status.name,
        'lightning_receive_request_transfer': req.transfer?.toJson(),
        'lightning_receive_request_payment_preimage': req.paymentPreimage,
        'lightning_receive_request_receiver_identity_public_key':
            req.receiverIdentityPublicKey,
      };
    } else if (this is LightningSendRequest) {
      final req = this as LightningSendRequest;
      return {
        '__typename': 'LightningSendRequest',
        'lightning_send_request_id': req.id,
        'lightning_send_request_created_at': req.createdAt,
        'lightning_send_request_updated_at': req.updatedAt,
        'lightning_send_request_network': req.network.name,
        'lightning_send_request_encoded_invoice': req.encodedInvoice,
        'lightning_send_request_fee': req.fee.toJson(),
        'lightning_send_request_idempotency_key': req.idempotencyKey,
        'lightning_send_request_status': req.status.name,
        'lightning_send_request_transfer': req.transfer?.toJson(),
        'lightning_send_request_payment_preimage': req.paymentPreimage,
      };
    }

    throw LightsparkException(
      'SerializationError',
      "Couldn't find a concrete type for interface UserRequest corresponding to the typename=$typename",
    );
  }
}

const String FRAGMENT = '''
fragment UserRequestFragment on UserRequest {
    __typename
    ... on ClaimStaticDeposit {
        __typename
        claim_static_deposit_id: id
        claim_static_deposit_created_at: created_at
        claim_static_deposit_updated_at: updated_at
        claim_static_deposit_network: network
        claim_static_deposit_credit_amount: credit_amount {
            __typename
            currency_amount_original_value: original_value
            currency_amount_original_unit: original_unit
        }
        claim_static_deposit_max_fee: max_fee {
            __typename
            currency_amount_original_value: original_value
            currency_amount_original_unit: original_unit
        }
        claim_static_deposit_status: status
        claim_static_deposit_transaction_id: transaction_id
        claim_static_deposit_output_index: output_index
        claim_static_deposit_bitcoin_network: bitcoin_network
        claim_static_deposit_transfer_spark_id: transfer_spark_id
    }
    ... on CoopExitRequest {
        __typename
        coop_exit_request_id: id
        coop_exit_request_created_at: created_at
        coop_exit_request_updated_at: updated_at
        coop_exit_request_network: network
        coop_exit_request_fee: fee {
            __typename
            currency_amount_original_value: original_value
            currency_amount_original_unit: original_unit
        }
        coop_exit_request_l1_broadcast_fee: l1_broadcast_fee {
            __typename
            currency_amount_original_value: original_value
            currency_amount_original_unit: original_unit
        }
        coop_exit_request_fee_quote: fee_quote {
            id
        }
        coop_exit_request_exit_speed: exit_speed
        coop_exit_request_status: status
        coop_exit_request_expires_at: expires_at
        coop_exit_request_raw_connector_transaction: raw_connector_transaction
        coop_exit_request_raw_coop_exit_transaction: raw_coop_exit_transaction
        coop_exit_request_coop_exit_txid: coop_exit_txid
        coop_exit_request_transfer: transfer {
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
    }
    ... on LeavesSwapRequest {
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
    ... on LightningReceiveRequest {
        __typename
        lightning_receive_request_id: id
        lightning_receive_request_created_at: created_at
        lightning_receive_request_updated_at: updated_at
        lightning_receive_request_network: network
        lightning_receive_request_invoice: invoice {
            __typename
            invoice_encoded_invoice: encoded_invoice
            invoice_bitcoin_network: bitcoin_network
            invoice_payment_hash: payment_hash
            invoice_amount: amount {
                __typename
                currency_amount_original_value: original_value
                currency_amount_original_unit: original_unit
            }
            invoice_created_at: created_at
            invoice_expires_at: expires_at
            invoice_memo: memo
        }
        lightning_receive_request_status: status
        lightning_receive_request_transfer: transfer {
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
        lightning_receive_request_payment_preimage: payment_preimage
        lightning_receive_request_receiver_identity_public_key: receiver_identity_public_key
    }
    ... on LightningSendRequest {
        __typename
        lightning_send_request_id: id
        lightning_send_request_created_at: created_at
        lightning_send_request_updated_at: updated_at
        lightning_send_request_network: network
        lightning_send_request_encoded_invoice: encoded_invoice
        lightning_send_request_fee: fee {
            __typename
            currency_amount_original_value: original_value
            currency_amount_original_unit: original_unit
        }
        lightning_send_request_idempotency_key: idempotency_key
        lightning_send_request_status: status
        lightning_send_request_transfer: transfer {
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
        lightning_send_request_payment_preimage: payment_preimage
    }
}
''';

Query<UserRequest> getUserRequestQuery(String id) {
  return Query<UserRequest>(
    queryPayload:
        '''
query GetUserRequest(\$id: ID!) {
    entity(id: \$id) {
        ... on UserRequest {
            ...UserRequestFragment
        }
    }
}

$FRAGMENT    
''',
    variables: {'id': id},
    constructObject: (data) {
      if (data is Map<String, dynamic> &&
          data.containsKey('entity') &&
          data['entity'] is Map<String, dynamic>) {
        return UserRequest.fromJson(data['entity'] as Map<String, dynamic>);
      }
      return null;
    },
  );
}
