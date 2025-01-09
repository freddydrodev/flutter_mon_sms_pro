import 'package:hive/hive.dart';
import 'package:mon_sms_pro/utils.dart';

part 'campain_model.g.dart';

@HiveType(typeId: 0)
class Coords {
  @HiveField(0)
  final double lon;
  @HiveField(1)
  final double lat;
  @HiveField(2)
  final double radius; // in meter

  Coords({
    required this.lon,
    required this.lat,
    required this.radius,
  });

  factory Coords.fromJson(Map<String, dynamic> json) {
    return Coords(
      lon: json['lon'],
      lat: json['lat'],
      radius: json['radius'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lon': lon,
      'lat': lat,
      'radius': radius,
    };
  }
}

@HiveType(typeId: 1)
class CampainModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final SMSType type;
  @HiveField(3)
  final String contactList; // List<String> stringified
  @HiveField(4)
  final int contactCount;
  @HiveField(5)
  final String text;
  @HiveField(6)
  final DateTime createdAt;
  @HiveField(7)
  final Coords? coords;

  CampainModel({
    required this.id,
    required this.name,
    required this.type,
    required this.contactList,
    required this.contactCount,
    required this.text,
    required this.createdAt,
    this.coords,
  });

  factory CampainModel.fromJson(Map<String, dynamic> json) {
    return CampainModel(
      id: json['id'],
      name: json['name'],
      type: SMSType.values.firstWhere((e) => e.value == json['type']),
      coords: json['coords'] != null ? Coords.fromJson(json['coords']) : null,
      contactList: json['contactList'],
      contactCount: json['contactCount'],
      text: json['text'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type.value,
      'coords': coords?.toJson(),
      'contactList': contactList,
      'contactCount': contactCount,
      'text': text,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
