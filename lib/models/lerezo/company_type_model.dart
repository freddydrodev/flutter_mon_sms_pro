import 'package:hive_ce/hive.dart';

class CompanyTypeModel extends HiveObject {
  final String id;
  final String name;
  final DateTime createdAt;

  CompanyTypeModel({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory CompanyTypeModel.fromJson(Map<String, dynamic> json) {
    return CompanyTypeModel(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
