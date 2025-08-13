import 'package:hive_ce/hive.dart';

class GroupCountModel extends HiveObject {
  final int contacts;

  GroupCountModel({required this.contacts});

  factory GroupCountModel.fromJson(Map<String, dynamic> json) {
    return GroupCountModel(
      contacts: json['contacts'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contacts': contacts,
    };
  }
}
