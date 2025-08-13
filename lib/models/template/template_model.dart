import 'package:hive_ce/hive.dart';

part 'template_model.g.dart';

@HiveType(typeId: 700)
class TemplateModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final DateTime createdAt;
  @HiveField(3)
  final String userId;

  TemplateModel({
    this.id,
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
