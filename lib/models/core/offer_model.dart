import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/utils.dart';

part 'offer_model.g.dart';

@HiveType(typeId: 19)
class OfferModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final OfferName name;
  @HiveField(2)
  final int price;
  @HiveField(3)
  final int credit;
  @HiveField(4)
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
      name: OfferName.values.firstWhere((e) => e.value == json['name']),
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
