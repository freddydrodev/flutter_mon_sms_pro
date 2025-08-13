import 'package:hive_ce/hive.dart';

part 'campaign_count_model.g.dart';

@HiveType(typeId: 100)
class CampaignCountModel {
  @HiveField(0)
  final int contacts;
  @HiveField(1)
  final int groups;

  CampaignCountModel({
    required this.contacts,
    required this.groups,
  });

  factory CampaignCountModel.fromJson(Map<String, dynamic> json) {
    return CampaignCountModel(
      contacts: json['contacts'],
      groups: json['groups'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contacts': contacts,
      'groups': groups,
    };
  }
}
