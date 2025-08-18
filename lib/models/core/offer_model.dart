import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/utils.dart';

class OfferModel extends HiveObject {
  final String? id;
  final OfferName name;
  final int price;
  final int credit;
  final DateTime createdAt;

  OfferModel({
    this.id,
    required this.name,
    required this.price,
    required this.credit,
    required this.createdAt,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'],
      name: OfferName.fromValue(json['name']),
      price: json['price'],
      credit: json['credit'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name.value,
      'price': price,
      'credit': credit,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
