import 'package:hive_ce/hive.dart';

part 'group_count_model.g.dart';

@HiveType(typeId: 401)
class GroupCountModel {
  @HiveField(0)
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
