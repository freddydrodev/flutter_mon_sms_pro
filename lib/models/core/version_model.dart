import 'package:hive_ce/hive.dart';

class VersionModel extends HiveObject {
  final String? id;
  final String name;
  final String description;
  final bool isMajorRelease;
  final DateTime createdAt;

  VersionModel({
    this.id,
    required this.name,
    required this.description,
    required this.isMajorRelease,
    required this.createdAt,
  });

  factory VersionModel.fromJson(Map<String, dynamic> json) {
    return VersionModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      isMajorRelease: json['isMajorRelease'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'isMajorRelease': isMajorRelease,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
