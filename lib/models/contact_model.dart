import 'package:hive/hive.dart';
import 'package:mon_sms_pro/utils.dart';

part 'contact_model.g.dart';

@HiveType(typeId: 2)
class ContactModel {
  @HiveField(0)
  final String phone;
  @HiveField(1)
  final String? id;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? firstName;
  @HiveField(4)
  final String? lastName;
  @HiveField(5)
  final SexType? sex; // M | F
  @HiveField(6)
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
