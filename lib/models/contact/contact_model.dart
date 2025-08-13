import 'package:hive_ce/hive.dart';

class ContactModel extends HiveObject {
  final String phone;
  final String id;
  final String name;
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
