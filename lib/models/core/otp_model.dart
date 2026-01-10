import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/utils.dart';

enum OTPStatus {
  pending("PENDING"),
  verified("VERIFIED"),
  demo("DEMO");

  final String value;

  const OTPStatus(this.value);

  static OTPStatus fromValue(String value) {
    return OTPStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}

class OTPModel extends HiveObject {
  final String? id;
  final String token;
  final String phoneNumber;
  final OTPStatus status;
  final OTPMode? mode;
  final String? appName;
  final String? senderId;
  final String? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  OTPModel({
    this.id,
    required this.token,
    required this.phoneNumber,
    required this.status,
    this.mode,
    this.appName,
    this.senderId,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory OTPModel.fromJson(Map<String, dynamic> json) {
    return OTPModel(
      id: json['id'],
      token: json['token'],
      phoneNumber: json['phoneNumber'],
      status: OTPStatus.fromValue(json['status']),
      mode: json['mode'] != null ? OTPMode.fromValue(json['mode']) : null,
      appName: json['appName'],
      senderId: json['senderId'],
      userId: json['userId'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'token': token,
      'phoneNumber': phoneNumber,
      'status': status.value,
      'mode': mode?.value,
      'appName': appName,
      'senderId': senderId,
      'userId': userId,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
