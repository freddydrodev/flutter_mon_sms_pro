enum SenderStatus {
  pending("PENDING"),
  submited("SUBMITED"),
  accepted("ACCEPTED"),
  refused("REFUSED");

  final String value;

  const SenderStatus(this.value);
}

class SenderModel {
  final String? id;
  final String name;
  final String description;
  final SenderStatus status;
  final bool archived;
  final DateTime createdAt;
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
