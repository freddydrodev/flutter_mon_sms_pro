import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/campaign/campaign_count_model.dart';
import 'package:mon_sms_pro/models/campaign/campaign_recurring_day_model.dart';
import 'package:mon_sms_pro/models/contact/contact_model.dart';
import 'package:mon_sms_pro/models/group/group_model.dart';
import 'package:mon_sms_pro/models/sender/sender_model.dart';
import 'package:mon_sms_pro/models/utils.dart';

class CampaignDetailsModel extends HiveObject {
  final String id;
  final String name;
  final String text;
  final bool isEnabled;
  final SMSType type;
  final int contactCount;
  final int creditUsed;
  final Map<String, dynamic>? coords;
  final CampaignRecurringDayModel? recurring;
  final DateTime? scheduledDate;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final CampaignCountModel count;
  final List<ContactModel> contacts;
  final List<GroupModel> groups;
  final SenderModel sender;

  CampaignDetailsModel({
    required this.id,
    required this.name,
    required this.text,
    required this.isEnabled,
    required this.type,
    required this.contactCount,
    required this.creditUsed,
    this.coords,
    this.recurring,
    this.scheduledDate,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.count,
    required this.contacts,
    required this.groups,
    required this.sender,
  });

  factory CampaignDetailsModel.fromJson(Map<String, dynamic> json) {
    return CampaignDetailsModel(
      id: json['id'],
      name: json['name'],
      text: json['text'],
      isEnabled: json['isEnabled'],
      type: SMSType.fromValue(json['type']),
      contactCount: json['contactCount'],
      creditUsed: json['creditUsed'],
      coords: json['coords'],
      recurring: json['recurring'] != null
          ? CampaignRecurringDayModel.fromJson(
              json['recurring'] as Map<String, dynamic>)
          : null,
      scheduledDate: json['scheduledDate'] != null
          ? DateTime.parse(json['scheduledDate'])
          : null,
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      count: CampaignCountModel.fromJson(json['_count']),
      contacts: (json['contacts'] as List<dynamic>)
          .map((e) => ContactModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      groups: (json['groups'] as List<dynamic>)
          .map((e) => GroupModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sender: SenderModel.fromJson(json['sender']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'text': text,
      'isEnabled': isEnabled,
      'type': type.value,
      'contactCount': contactCount,
      'creditUsed': creditUsed,
      'coords': coords,
      'recurring': recurring?.toJson(),
      'scheduledDate': scheduledDate?.toIso8601String(),
      'userId': userId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '_count': count.toJson(),
      'contacts': contacts.map((e) => e.toJson()).toList(),
      'groups': groups.map((e) => e.toJson()).toList(),
      'sender': sender.toJson(),
    };
  }
}
