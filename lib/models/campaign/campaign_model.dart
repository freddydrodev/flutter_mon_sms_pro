import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/campaign/campaign_count_model.dart';
import 'package:mon_sms_pro/models/utils.dart';

class CampaignModel extends HiveObject {
  final String id;
  final String text;
  final bool isEnabled;
  final SMSType type;
  final DateTime? scheduledDate;
  final int contactCount;
  final int creditUsed;
  final DateTime createdAt;
  final CampaignCountModel count;

  CampaignModel({
    required this.id,
    required this.text,
    this.isEnabled = true,
    required this.type,
    required this.contactCount,
    required this.creditUsed,
    required this.createdAt,
    required this.count,
    this.scheduledDate,
  });

  factory CampaignModel.fromJson(Map<String, dynamic> json) {
    return CampaignModel(
      id: json['id'],
      text: json['text'],
      type: SMSType.fromValue(json['type']),
      count: CampaignCountModel.fromJson(json['_count']),
      createdAt: DateTime.parse(json['createdAt']),
      contactCount: json['contactCount'],
      creditUsed: json['creditUsed'],
      scheduledDate: json['scheduledDate'] != null
          ? DateTime.parse(json['scheduledDate'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'type': type.value,
      '_count': count.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'contactCount': contactCount,
      'creditUsed': creditUsed,
      'scheduledDate': scheduledDate?.toIso8601String(),
    };
  }
}
