import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/contact/contact_model.dart';
import 'package:mon_sms_pro/models/group/group_count_model.dart';

part 'group_model.g.dart';

@HiveType(typeId: 400)
class GroupModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String name;
  @HiveField(3)
  final DateTime createdAt;
  @HiveField(5)
  final GroupCountModel? count;
  @HiveField(6)
  final List<ContactModel>? contacts;

  GroupModel({
    this.id,
    required this.name,
    required this.createdAt,
    this.count,
    this.contacts,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['createdAt']),
      count: json['_count'] != null
          ? GroupCountModel.fromJson(json['_count'])
          : null,
      contacts: json['contacts'] != null
          ? (json['contacts'] as List<dynamic>)
              .map((e) => ContactModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt.toIso8601String(),
      'count': count?.toJson(),
      'contacts': contacts?.map((e) => e.toJson()).toList(),
    };
  }
}
