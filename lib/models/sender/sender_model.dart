import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/utils.dart';

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
  final String? id;
  final String name;
  final String? description;
  final SenderStatus status;
  final bool? archived;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String? userId;
  final String? companyId;
  final String? companyTypeId;
  final String? example;
  final List<SmsType>? types;

  SenderModel({
    this.id,
    required this.name,
    required this.status,
    required this.createdAt,
    this.updatedAt,
    this.description,
    this.archived = false,
    this.userId,
    this.companyId,
    this.companyTypeId,
    this.example,
    this.types,
  });

  factory SenderModel.fromJson(Map<String, dynamic> json) {
    return SenderModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      status: SenderStatus.fromValue(json['status']),
      archived: json['archived'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      userId: json['userId'],
      companyId: json['companyId'],
      companyTypeId: json['companyTypeId'],
      example: json['example'],
      types: json['types'] != null
          ? (json['types'] as List<dynamic>)
              .map((e) => SmsType.fromValue(e as String))
              .toList()
          : null,
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
      'updatedAt': updatedAt?.toIso8601String(),
      'userId': userId,
      'companyId': companyId,
      'companyTypeId': companyTypeId,
      'example': example,
      'types': types?.map((e) => e.value).toList(),
    };
  }
}
