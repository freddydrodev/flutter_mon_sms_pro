import 'package:hive_ce/hive.dart';

part 'utils.g.dart';

@HiveType(typeId: 1)
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

  static SMSType fromValue(String value) {
    return SMSType.values.firstWhere(
      (type) => type.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}

@HiveType(typeId: 2)
enum SexType {
  @HiveField(0)
  m('M'),
  @HiveField(1)
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

@HiveType(typeId: 3)
enum Country {
  @HiveField(0)
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

@HiveType(typeId: 4)
enum TransactionType {
  @HiveField(0)
  debited('DEBITED'),
  @HiveField(1)
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

@HiveType(typeId: 5)
enum TransactionStatus {
  @HiveField(0)
  pending('PENDING'),
  @HiveField(1)
  failed('FAILED'),
  @HiveField(2)
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

@HiveType(typeId: 6)
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

  static PaymentMethod fromValue(String value) {
    return PaymentMethod.values.firstWhere(
      (method) => method.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}

@HiveType(typeId: 7)
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

  static OfferName fromValue(String value) {
    return OfferName.values.firstWhere(
      (offer) => offer.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}

@HiveType(typeId: 8)
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

@HiveType(typeId: 9)
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
