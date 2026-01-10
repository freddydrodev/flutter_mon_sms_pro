import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/utils.dart';

class CompanyModel extends HiveObject {
  final String? id;
  final String name;
  final String? description;
  final String? logo;
  final String? address;
  final String? city;
  final Country? country;
  final CompanyVerificationStatus verificationStatus;
  final String? verificationReason;
  final String? companyTypeId;
  final String ownerId;
  final DateTime createdAt;
  final DateTime? updatedAt;

  CompanyModel({
    this.id,
    required this.name,
    this.description,
    this.logo,
    this.address,
    this.city,
    this.country,
    this.verificationStatus = CompanyVerificationStatus.pending,
    this.verificationReason,
    this.companyTypeId,
    required this.ownerId,
    required this.createdAt,
    this.updatedAt,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      logo: json['logo'],
      address: json['address'],
      city: json['city'],
      country: json['country'] != null
          ? Country.fromValue(json['country'])
          : null,
      verificationStatus: json['verificationStatus'] != null
          ? CompanyVerificationStatus.fromValue(json['verificationStatus'])
          : CompanyVerificationStatus.pending,
      verificationReason: json['verificationReason'],
      companyTypeId: json['companyTypeId'],
      ownerId: json['ownerId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'logo': logo,
      'address': address,
      'city': city,
      'country': country?.value,
      'verificationStatus': verificationStatus.value,
      'verificationReason': verificationReason,
      'companyTypeId': companyTypeId,
      'ownerId': ownerId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
