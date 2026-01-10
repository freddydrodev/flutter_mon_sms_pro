import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/utils.dart';

class VerifyIdModel extends HiveObject {
  final String? id;
  final String userId;
  final String? frontImage;
  final String? backImage;
  final VerifyIdStatus status;
  final String? reason;
  final DateTime createdAt;
  final DateTime? updatedAt;

  VerifyIdModel({
    this.id,
    required this.userId,
    this.frontImage,
    this.backImage,
    this.status = VerifyIdStatus.pending,
    this.reason,
    required this.createdAt,
    this.updatedAt,
  });

  factory VerifyIdModel.fromJson(Map<String, dynamic> json) {
    return VerifyIdModel(
      id: json['id'],
      userId: json['userId'],
      frontImage: json['frontImage'],
      backImage: json['backImage'],
      status: json['status'] != null
          ? VerifyIdStatus.fromValue(json['status'])
          : VerifyIdStatus.pending,
      reason: json['reason'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'frontImage': frontImage,
      'backImage': backImage,
      'status': status.value,
      'reason': reason,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
