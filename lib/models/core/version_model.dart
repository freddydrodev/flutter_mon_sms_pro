import 'package:hive_ce/hive.dart';

part 'version_model.g.dart';

@HiveType(typeId: 305)
class VersionModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final bool isMajorRelease;
  @HiveField(4)
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
