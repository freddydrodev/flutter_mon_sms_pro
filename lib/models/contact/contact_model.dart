import 'package:hive_ce/hive.dart';

class ContactModel extends HiveObject {
  final String? id;
  final String phone;
  final String? name;
  final DateTime? createdAt;

  ContactModel({
    this.id,
    required this.phone,
    this.name,
    this.createdAt,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      phone: json['phone'],
      name: json['name'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'name': name,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}
