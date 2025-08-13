import 'package:hive_ce/hive.dart';

class CampaignCountModel extends HiveObject {
  final int contacts;
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
