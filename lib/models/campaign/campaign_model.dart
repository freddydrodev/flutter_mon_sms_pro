import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/utils.dart';
import 'package:mon_sms_pro/models/campaign/campaign_recurring_day_model.dart';

part 'campaign_model.g.dart';

@HiveType(typeId: 26)
class CampaignModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String text;
  @HiveField(3)
  final SMSType type;
  @HiveField(4)
  final DateTime? scheduledDate;
  @HiveField(5)
  final CampaignRecurringDayModel? recurring;
  @HiveField(6)
  final Coords? coords;
  @HiveField(7)
  final DateTime createdAt;
  @HiveField(8)
  final int contactCount;
  @HiveField(9)
  final String? contactList;
  @HiveField(10)
  final String? senderIdId;
  @HiveField(11)
  final String userId;
  @HiveField(12)
  final List<String> contactIds;
  @HiveField(13)
  final List<String> groupIds;

  CampaignModel({
    this.id,
    this.name,
    required this.text,
    required this.type,
    this.scheduledDate,
    this.recurring,
    this.coords,
    required this.createdAt,
    required this.contactCount,
    this.contactList,
    this.senderIdId,
    required this.userId,
    this.contactIds = const [],
    this.groupIds = const [],
  });

  factory CampaignModel.fromJson(Map<String, dynamic> json) {
    return CampaignModel(
      id: json['id'],
      name: json['name'],
      text: json['text'],
      type: SMSType.values.firstWhere((e) => e.value == json['type']),
      scheduledDate: json['scheduledDate'] != null
          ? DateTime.parse(json['scheduledDate'])
          : null,
      recurring: json['recurring'] != null
          ? CampaignRecurringDayModel.fromJson(json['recurring'])
          : null,
      coords: json['coords'] != null ? Coords.fromJson(json['coords']) : null,
      createdAt: DateTime.parse(json['createdAt']),
      contactCount: json['contactCount'],
      contactList: json['contactList'],
      senderIdId: json['senderIdId'],
      userId: json['userId'],
      contactIds: List<String>.from(json['contactIds'] ?? []),
      groupIds: List<String>.from(json['groupIds'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'text': text,
      'type': type.value,
      'scheduledDate': scheduledDate?.toIso8601String(),
      'recurring': recurring?.toJson(),
      'coords': coords?.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'contactCount': contactCount,
      'contactList': contactList,
      'senderIdId': senderIdId,
      'userId': userId,
      'contactIds': contactIds,
      'groupIds': groupIds,
    };
  }
}
