import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/utils.dart';

class FollowerModel extends HiveObject {
  final String id;
  final String phoneNumber;
  final String? password;
  final String name;
  final String? photo;
  final String apiKey;
  final Location? location;
  final String? notificationToken;
  final Country? country;
  final DateTime createdAt;

  FollowerModel({
    required this.id,
    required this.phoneNumber,
    this.password,
    required this.name,
    this.photo,
    required this.apiKey,
    this.location,
    this.notificationToken,
    this.country,
    required this.createdAt,
  });

  factory FollowerModel.fromJson(Map<String, dynamic> json) {
    return FollowerModel(
      id: json['id'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      name: json['name'],
      photo: json['photo'],
      apiKey: json['apiKey'],
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
      notificationToken: json['notificationToken'],
      country:
          json['country'] != null ? Country.fromValue(json['country']) : null,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'password': password,
      'name': name,
      'photo': photo,
      'apiKey': apiKey,
      'location': location?.toJson(),
      'notificationToken': notificationToken,
      'country': country?.value,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
