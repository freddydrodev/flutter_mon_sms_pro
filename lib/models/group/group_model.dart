import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/group/group_contact_list_model.dart';
import 'package:mon_sms_pro/models/group/group_count_model.dart';

part 'group_model.g.dart';

@HiveType(typeId: 17)
class GroupModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final DateTime createdAt;
  @HiveField(4)
  final String userId;
  @HiveField(5)
  final GroupCountModel? count;
  @HiveField(6)
  final List<GroupContactListModel>? contactInGroups;

  GroupModel({
    this.id,
    required this.name,
    this.description,
    required this.createdAt,
    required this.userId,
    this.count,
    this.contactInGroups,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
      userId: json['userId'],
      count: json['_count'] != null
          ? GroupCountModel.fromJson(json['_count'])
          : null,
      contactInGroups: json['contactInGroups'] != null
          ? json['contactInGroups']
              .map((e) => GroupContactListModel.fromJson(e))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'userId': userId,
      'count': count?.toJson(),
      'contactInGroups': contactInGroups?.map((e) => e.toJson()).toList(),
    };
  }
}
