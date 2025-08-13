import 'package:hive_ce/hive.dart';

part 'group_count_model.g.dart';

@HiveType(typeId: 171)
class GroupCountModel {
  @HiveField(0)
  final int contactInGroups;

  GroupCountModel({required this.contactInGroups});

  factory GroupCountModel.fromJson(Map<String, dynamic> json) {
    return GroupCountModel(
      contactInGroups: json['contactInGroups'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contactInGroups': contactInGroups,
    };
  }
}
