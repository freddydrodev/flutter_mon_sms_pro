import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/utils.dart';

part 'user_model.g.dart';

@HiveType(typeId: 304)
class UserModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? emailAddress;
  @HiveField(2)
  final String phoneNumber;
  @HiveField(3)
  final String? password;
  @HiveField(4)
  final String fullName;
  @HiveField(5)
  final DateTime createdAt;
  @HiveField(6)
  final bool isAdmin;
  @HiveField(7)
  final bool newUser;
  @HiveField(8)
  final String? xoraiaID;
  @HiveField(9)
  final String apiKey;
  @HiveField(10)
  final String? token;
  @HiveField(11)
  final DateTime? tokenExpirationDate;
  @HiveField(12)
  final String? companyTypeId;
  @HiveField(13)
  final String? logo;
  @HiveField(14)
  final String? description;
  @HiveField(15)
  final String? address;
  @HiveField(16)
  final String? city;
  @HiveField(17)
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
