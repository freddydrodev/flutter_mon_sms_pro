import 'package:hive_ce/hive.dart';

part 'campaign_recurring_day_model.g.dart';

@HiveType(typeId: 102)
class CampaignRecurringDayModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final bool enabled;
  @HiveField(2)
  final DateTime? monday;
  @HiveField(3)
  final DateTime? tuesday;
  @HiveField(4)
  final DateTime? wednesday;
  @HiveField(5)
  final DateTime? thursday;
  @HiveField(6)
  final DateTime? friday;
  @HiveField(7)
  final DateTime? saturday;
  @HiveField(8)
  final DateTime? sunday;
  @HiveField(9)
  final String campaignId;

  CampaignRecurringDayModel({
    this.id,
    this.enabled = true,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
    required this.campaignId,
  });

  factory CampaignRecurringDayModel.fromJson(Map<String, dynamic> json) {
    return CampaignRecurringDayModel(
      id: json['id'],
      enabled: json['enabled'] ?? true,
      monday: json['monday'] != null ? DateTime.parse(json['monday']) : null,
      tuesday: json['tuesday'] != null ? DateTime.parse(json['tuesday']) : null,
      wednesday:
          json['wednesday'] != null ? DateTime.parse(json['wednesday']) : null,
      thursday:
          json['thursday'] != null ? DateTime.parse(json['thursday']) : null,
      friday: json['friday'] != null ? DateTime.parse(json['friday']) : null,
      saturday:
          json['saturday'] != null ? DateTime.parse(json['saturday']) : null,
      sunday: json['sunday'] != null ? DateTime.parse(json['sunday']) : null,
      campaignId: json['campaignId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'enabled': enabled,
      'monday': monday?.toIso8601String(),
      'tuesday': tuesday?.toIso8601String(),
      'wednesday': wednesday?.toIso8601String(),
      'thursday': thursday?.toIso8601String(),
      'friday': friday?.toIso8601String(),
      'saturday': saturday?.toIso8601String(),
      'sunday': sunday?.toIso8601String(),
      'campaignId': campaignId,
    };
  }
}
