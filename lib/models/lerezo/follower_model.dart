import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/utils.dart';

part 'follower_model.g.dart';

@HiveType(typeId: 502)
class FollowerModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String phoneNumber;
  @HiveField(2)
  final String? password;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final String? photo;
  @HiveField(5)
  final String apiKey;
  @HiveField(6)
  final Location? location;
  @HiveField(7)
  final String? notificationToken;
  @HiveField(8)
  final Country? country;
  @HiveField(9)
  final DateTime createdAt;

  FollowerModel({
    this.id,
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
      country: json['country'] != null
          ? Country.fromValue(json['country'])
          : null,
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
