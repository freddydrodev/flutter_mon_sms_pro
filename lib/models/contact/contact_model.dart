import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/utils.dart';

class ContactModel extends HiveObject {
  final String? id;
  final String phone;
  final String? name;
  final String? firstName;
  final String? lastName;
  final SexType? sex;
  final String? userId;
  final String? companyId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ContactModel({
    this.id,
    required this.phone,
    this.name,
    this.firstName,
    this.lastName,
    this.sex,
    this.userId,
    this.companyId,
    this.createdAt,
    this.updatedAt,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      phone: json['phone'],
      name: json['name'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      sex: json['sex'] != null ? SexType.fromValue(json['sex']) : null,
      userId: json['userId'],
      companyId: json['companyId'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
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
      'userId': userId,
      'companyId': companyId,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
