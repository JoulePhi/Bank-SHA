import 'package:bank_sha/models/payment_method_moder.dart';
import 'package:bank_sha/models/transaction_type_model.dart';

class LatestTransactionModel {
  final int? id;
  final int? amount;
  final DateTime? createdAt;
  final PaymentMethodModel? paymentMethodModel;
  final TransactionTypeModel? transactionTypeModel;

  LatestTransactionModel({
    this.id,
    this.amount,
    this.createdAt,
    this.paymentMethodModel,
    this.transactionTypeModel,
  });

  factory LatestTransactionModel.fromJson(Map<String, dynamic> json) {
    return LatestTransactionModel(
      id: json['id'],
      amount: json['amount'],
      createdAt: DateTime.tryParse(json['created_at']),
      paymentMethodModel: json['payment_method'] == null
          ? null
          : PaymentMethodModel.fromJson(json['payment_method']),
      transactionTypeModel: json['transaction_type'] == null
          ? null
          : TransactionTypeModel.fromJson(json['transaction_type']),
    );
  }
}
