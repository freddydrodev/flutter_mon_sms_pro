import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/contact/contact_model.dart';

part 'group_contact_list_model.g.dart';

@HiveType(typeId: 400)
class GroupContactListModel {
  @HiveField(0)
  final ContactModel contact;

  GroupContactListModel({required this.contact});

  factory GroupContactListModel.fromJson(Map<String, dynamic> json) {
    return GroupContactListModel(
      contact: ContactModel.fromJson(json['contact']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contact': contact.toJson(),
    };
  }
}
