import 'package:mon_sms_pro/utils.dart';

class Coords {
  final double lon;
  final double lat;
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

class CampainModel {
  final String id;
  final String name;
  final SMSType type;
  final String contactList; // List<String> stringified
  final int contactCount;
  final String text;
  final DateTime createdAt;
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
      type: json['type'], // == 'SMS' ? SMSType.sms : SMSType.flash,
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
      'type': type, // == SMSType.sms ? 'SMS' : 'FLASH',
      'coords': coords?.toJson(),
      'contactList': contactList,
      'contactCount': contactCount,
      'text': text,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
