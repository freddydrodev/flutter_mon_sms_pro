import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/utils.dart';

class DeviceModel extends HiveObject {
  final String? id;
  final String deviceId;
  final DeviceType type;
  final String? notificationToken;
  final String userId;
  final String? companyId;
  final DateTime createdAt;
  final DateTime? updatedAt;

  DeviceModel({
    this.id,
    required this.deviceId,
    required this.type,
    this.notificationToken,
    required this.userId,
    this.companyId,
    required this.createdAt,
    this.updatedAt,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      id: json['id'],
      deviceId: json['deviceId'],
      type: DeviceType.fromValue(json['type']),
      notificationToken: json['notificationToken'],
      userId: json['userId'],
      companyId: json['companyId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'deviceId': deviceId,
      'type': type.value,
      'notificationToken': notificationToken,
      'userId': userId,
      'companyId': companyId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
