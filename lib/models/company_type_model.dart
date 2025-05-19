import 'package:hive_ce/hive.dart';

part 'company_type_model.g.dart';

@HiveType(typeId: 16)
class CompanyTypeModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final DateTime createdAt;

  CompanyTypeModel({
    this.id,
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
