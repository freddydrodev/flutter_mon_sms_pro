import 'package:hive_ce/hive.dart';

part 'sender_model.g.dart';

@HiveType(typeId: 5)
enum SenderStatus {
  @HiveField(0)
  pending("PENDING"),
  @HiveField(1)
  submited("SUBMITED"),
  @HiveField(2)
  accepted("ACCEPTED"),
  @HiveField(3)
  refused("REFUSED");

  final String value;

  const SenderStatus(this.value);
}

@HiveType(typeId: 6)
class SenderModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final SenderStatus status;
  @HiveField(4)
  final bool archived;
  @HiveField(5)
  final DateTime createdAt;
  @HiveField(6)
  final String userId;

  SenderModel({
    this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.archived,
    required this.createdAt,
    required this.userId,
  });

  factory SenderModel.fromJson(Map<String, dynamic> json) {
    return SenderModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      status: SenderStatus.values.byName(json['status']),
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
