import 'package:hive_ce/hive.dart';

class ImportModel extends HiveObject {
  final String? id;
  final String userId;
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
