import 'package:mon_sms_pro/utils.dart';

class ContactModel {
  final String phone;
  final String? id;
  final String? name;
  final String? firstName;
  final String? lastName;
  final SexType? sex; // M | F
  final List<String> groupIds;

  ContactModel({
    required this.phone,
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.sex,
    this.groupIds = const [],
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      phone: json['phone'],
      name: json['name'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      sex: json['sex'] != null
          ? SexType.values.firstWhere((e) => e.value == json['sex'])
          : null,
      groupIds: List<String>.from(json['groupIds']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'name': name,
      'firstName': firstName,
      'lastName': lastName,
      'sex': sex?.value,
      'groupIds': groupIds
    };
  }
}
