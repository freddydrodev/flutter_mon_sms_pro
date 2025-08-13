import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/utils.dart';

class UserModel extends HiveObject {
  final String? id;
  final String? emailAddress;
  final String phoneNumber;
  final String? password;
  final String fullName;
  final DateTime createdAt;
  final bool isAdmin;
  final bool newUser;
  final String? xoraiaID;
  final String apiKey;
  final String? token;
  final DateTime? tokenExpirationDate;
  final String? companyTypeId;
  final String? logo;
  final String? description;
  final String? address;
  final String? city;
  final Country? country;

  UserModel({
    this.id,
    this.emailAddress,
    required this.phoneNumber,
    this.password,
    required this.fullName,
    required this.createdAt,
    this.isAdmin = false,
    this.newUser = true,
    this.xoraiaID,
    required this.apiKey,
    this.token,
    this.tokenExpirationDate,
    this.companyTypeId,
    this.logo,
    this.description,
    this.address,
    this.city,
    this.country,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      emailAddress: json['emailAddress'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      fullName: json['fullName'],
      createdAt: DateTime.parse(json['createdAt']),
      isAdmin: json['isAdmin'] ?? false,
      newUser: json['newUser'] ?? true,
      xoraiaID: json['xoraiaID'],
      apiKey: json['apiKey'],
      token: json['token'],
      tokenExpirationDate: json['tokenExpirationDate'] != null
          ? DateTime.parse(json['tokenExpirationDate'])
          : null,
      companyTypeId: json['companyTypeId'],
      logo: json['logo'],
      description: json['description'],
      address: json['address'],
      city: json['city'],
      country:
          json['country'] != null ? Country.fromValue(json['country']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'emailAddress': emailAddress,
      'phoneNumber': phoneNumber,
      'password': password,
      'fullName': fullName,
      'createdAt': createdAt.toIso8601String(),
      'isAdmin': isAdmin,
      'newUser': newUser,
      'xoraiaID': xoraiaID,
      'apiKey': apiKey,
      'token': token,
      'tokenExpirationDate': tokenExpirationDate?.toIso8601String(),
      'companyTypeId': companyTypeId,
      'logo': logo,
      'description': description,
      'address': address,
      'city': city,
      'country': country?.value,
    };
  }
}
