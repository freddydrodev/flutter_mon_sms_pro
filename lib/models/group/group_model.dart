import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/contact/contact_model.dart';
import 'package:mon_sms_pro/models/group/group_count_model.dart';

class GroupModel extends HiveObject {
  final String id;
  final String name;
  final DateTime createdAt;
  final GroupCountModel count;
  final List<ContactModel> contacts;

  GroupModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.count,
    required this.contacts,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['createdAt']),
      count: GroupCountModel.fromJson(json['_count']),
      contacts: (json['contacts'] as List<dynamic>)
          .map((e) => ContactModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt.toIso8601String(),
      'count': count.toJson(),
      'contacts': contacts.map((e) => e.toJson()).toList(),
    };
  }
}
