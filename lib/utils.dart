import 'package:hive_ce/hive.dart';

part 'utils.g.dart';

@HiveType(typeId: 7)
enum SMSType {
  @HiveField(0)
  sms('SMS'),
  @HiveField(1)
  flash('FLASH'),
  @HiveField(2)
  scheduled('SCHEDULED'),
  @HiveField(3)
  recurring('RECURRING');

  const SMSType(this.value);

  final String value;
}

@HiveType(typeId: 8)
enum SexType {
  @HiveField(0)
  m('M'),
  @HiveField(1)
  f('F');

  const SexType(this.value);

  final String value;
}

@HiveType(typeId: 9)
enum Country {
  @HiveField(0)
  ci('CI');

  const Country(this.value);

  final String value;
}

@HiveType(typeId: 10)
enum TransactionType {
  @HiveField(0)
  debited('DEBITED'),
  @HiveField(1)
  recharged('RECHARGED');

  const TransactionType(this.value);

  final String value;
}

@HiveType(typeId: 11)
enum TransactionStatus {
  @HiveField(0)
  pending('PENDING'),
  @HiveField(1)
  failed('FAILED'),
  @HiveField(2)
  charged('CHARGED');

  const TransactionStatus(this.value);

  final String value;
}

@HiveType(typeId: 12)
enum PaymentMethod {
  @HiveField(0)
  omCi('OM_CI'),
  @HiveField(1)
  mtnCi('MTN_CI'),
  @HiveField(2)
  moovCi('MOOV_CI'),
  @HiveField(3)
  cash('CASH'),
  @HiveField(4)
  iap('IAP'),
  @HiveField(5)
  builtIn('BULT_IN'),
  @HiveField(6)
  otp('OTP');

  const PaymentMethod(this.value);

  final String value;
}

@HiveType(typeId: 13)
enum OfferName {
  @HiveField(0)
  starter('STARTER'),
  @HiveField(1)
  bronze('BRONZE'),
  @HiveField(2)
  fer('FER'),
  @HiveField(3)
  or('OR'),
  @HiveField(4)
  diamant('DIAMANT'),
  @HiveField(5)
  vip('VIP');

  const OfferName(this.value);

  final String value;
}

@HiveType(typeId: 0)
class Coords {
  @HiveField(0)
  final double lon;
  @HiveField(1)
  final double lat;
  @HiveField(2)
  final double? radius; // in meter

  Coords({
    required this.lon,
    required this.lat,
    this.radius,
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

@HiveType(typeId: 14)
class Location {
  @HiveField(0)
  final double lon;
  @HiveField(1)
  final double lat;

  Location({
    required this.lon,
    required this.lat,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lon: json['lon'],
      lat: json['lat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lon': lon,
      'lat': lat,
    };
  }
}
