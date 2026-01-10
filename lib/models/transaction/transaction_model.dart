import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/utils.dart';

class TransactionModel extends HiveObject {
  final String? id;
  final TransactionType type;
  final TransactionStatus status;
  final PaymentMethod paymentMethod;
  final String token;
  final int credit;
  final int price;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String userId;
  final String? campaignId;
  final String? offerId;
  final String? companyId;
  final TransactionPeriod? period;

  TransactionModel({
    this.id,
    required this.type,
    required this.status,
    required this.paymentMethod,
    required this.token,
    required this.credit,
    this.price = 0,
    required this.createdAt,
    this.updatedAt,
    required this.userId,
    this.campaignId,
    this.offerId,
    this.companyId,
    this.period,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      type: TransactionType.fromValue(json['type']),
      status: TransactionStatus.fromValue(json['status']),
      paymentMethod: PaymentMethod.fromValue(json['paymentMethod']),
      token: json['token'],
      credit: json['credit'],
      price: json['price'] ?? 0,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      userId: json['userId'],
      // Support both old 'campainId' (typo) and correct 'campaignId'
      campaignId: json['campaignId'] ?? json['campainId'],
      offerId: json['offerId'],
      companyId: json['companyId'],
      period: json['period'] != null
          ? TransactionPeriod.fromValue(json['period'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.value,
      'status': status.value,
      'paymentMethod': paymentMethod.value,
      'token': token,
      'credit': credit,
      'price': price,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'userId': userId,
      'campaignId': campaignId,
      'offerId': offerId,
      'companyId': companyId,
      'period': period?.value,
    };
  }
}
