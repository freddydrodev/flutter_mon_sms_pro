import 'package:hive_ce/hive.dart';

part 'import_model.g.dart';

@HiveType(typeId: 300)
class ImportModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String userId;
  @HiveField(2)
  final DateTime createdAt;

  ImportModel({
    this.id,
    required this.userId,
    required this.createdAt,
  });

  factory ImportModel.fromJson(Map<String, dynamic> json) {
    return ImportModel(
      id: json['id'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
