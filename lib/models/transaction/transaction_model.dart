import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/utils.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 800)
class TransactionModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final TransactionType type;
  @HiveField(2)
  final TransactionStatus status;
  @HiveField(3)
  final PaymentMethod paymentMethod;
  @HiveField(4)
  final String token;
  @HiveField(5)
  final int credit;
  @HiveField(6)
  final int price;
  @HiveField(7)
  final DateTime createdAt;
  @HiveField(8)
  final String userId;
  @HiveField(9)
  final String? campainId;
  @HiveField(10)
  final String? offerId;

  TransactionModel({
    this.id,
    required this.type,
    required this.status,
    required this.paymentMethod,
    required this.token,
    required this.credit,
    this.price = 0,
    required this.createdAt,
    required this.userId,
    this.campainId,
    this.offerId,
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
      userId: json['userId'],
      campainId: json['campainId'],
      offerId: json['offerId'],
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
      'userId': userId,
      'campainId': campainId,
      'offerId': offerId,
    };
  }
}
