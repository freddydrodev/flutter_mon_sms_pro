import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/campaign/campaign_count_model.dart';
import 'package:mon_sms_pro/models/utils.dart';

part 'campaign_model.g.dart';

@HiveType(typeId: 101)
class CampaignModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final bool? isEnabled;
  @HiveField(3)
  final SMSType type;
  @HiveField(4)
  final int contactCount;
  @HiveField(5)
  final int creditUsed;
  @HiveField(6)
  final DateTime createdAt;
  @HiveField(7)
  final CampaignCountModel count;

  CampaignModel({
    required this.id,
    required this.text,
    this.isEnabled = false,
    required this.type,
    required this.contactCount,
    required this.creditUsed,
    required this.createdAt,
    required this.count,
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
    };
  }
}
