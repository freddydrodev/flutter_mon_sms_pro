import 'package:hive_ce/hive.dart';

enum SMSType {
  sms('SMS'),
  flash('FLASH'),
  scheduled('SCHEDULED'),
  recurring('RECURRING');

  const SMSType(this.value);

  final String value;

  static SMSType fromValue(String value) {
    return SMSType.values.firstWhere(
      (type) => type.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}

enum SexType {
  m('M'),
  f('F');

  const SexType(this.value);

  final String value;

  static SexType fromValue(String value) {
    return SexType.values.firstWhere(
      (sex) => sex.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}

enum Country {
  ci('CI');

  const Country(this.value);

  final String value;

  static Country fromValue(String value) {
    return Country.values.firstWhere(
      (country) => country.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}

enum TransactionType {
  debited('DEBITED'),
  recharged('RECHARGED');

  const TransactionType(this.value);

  final String value;

  static TransactionType fromValue(String value) {
    return TransactionType.values.firstWhere(
      (type) => type.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}

enum TransactionStatus {
  pending('PENDING'),
  failed('FAILED'),
  charged('CHARGED');

  const TransactionStatus(this.value);

  final String value;

  static TransactionStatus fromValue(String value) {
    return TransactionStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}

enum PaymentMethod {
  omCi('OM_CI'),
  mtnCi('MTN_CI'),
  moovCi('MOOV_CI'),
  cash('CASH'),
  iap('IAP'),
  builtIn('BULT_IN'),
  otp('OTP');

  const PaymentMethod(this.value);

  final String value;

  static PaymentMethod fromValue(String value) {
    return PaymentMethod.values.firstWhere(
      (method) => method.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}

enum OfferName {
  starter('STARTER'),
  bronze('BRONZE'),
  fer('FER'),
  or('OR'),
  diamant('DIAMANT'),
  vip('VIP');

  const OfferName(this.value);

  final String value;

  static OfferName fromValue(String value) {
    return OfferName.values.firstWhere(
      (offer) => offer.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}

class Coords extends HiveObject {
  final double lon;
  final double lat;
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

class Location extends HiveObject {
  final double lon;
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
