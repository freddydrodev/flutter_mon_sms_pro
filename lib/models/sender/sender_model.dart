import 'package:hive_ce/hive.dart';

enum SenderStatus {
  pending("PENDING"),
  submited("SUBMITED"),
  accepted("ACCEPTED"),
  refused("REFUSED");

  final String value;

  const SenderStatus(this.value);

  static SenderStatus fromValue(String value) {
    return SenderStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}

class SenderModel extends HiveObject {
  final String id;
  final String name;
  final String? description;
  final SenderStatus status;
  final bool? archived;
  final DateTime createdAt;
  final String? userId;

  SenderModel({
    required this.id,
    required this.name,
    required this.status,
    required this.createdAt,
    this.description,
    this.archived = false,
    this.userId,
  });

  factory SenderModel.fromJson(Map<String, dynamic> json) {
    return SenderModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      status: SenderStatus.fromValue(json['status']),
      archived: json['archived'],
      createdAt: DateTime.parse(json['createdAt']),
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'status': status.value,
      'archived': archived,
      'createdAt': createdAt.toIso8601String(),
      'userId': userId
    };
  }
}
