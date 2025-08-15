import 'package:hive_ce/hive.dart';

class TemplateModel extends HiveObject {
  final String id;
  final String text;
  final DateTime createdAt;
  final String userId;

  TemplateModel({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.userId,
  });

  factory TemplateModel.fromJson(Map<String, dynamic> json) {
    return TemplateModel(
      id: json['id'],
      text: json['text'],
      createdAt: DateTime.parse(json['createdAt']),
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'createdAt': createdAt.toIso8601String(),
      'userId': userId,
    };
  }
}
