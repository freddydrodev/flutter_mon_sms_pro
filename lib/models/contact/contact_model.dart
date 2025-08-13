import 'package:hive_ce/hive.dart';

part 'contact_model.g.dart';

@HiveType(typeId: 200)
class ContactModel {
  @HiveField(0)
  final String phone;
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final DateTime createdAt;

  ContactModel({
    required this.phone,
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      phone: json['phone'],
      name: json['name'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'name': name,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
