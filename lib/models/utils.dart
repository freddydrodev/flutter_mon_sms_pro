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
  waveCi('WAVE_CI'),
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

// New enums for API integration

enum OTPMode {
  numeric('NUMERIC'),
  alphabet('ALPHABET'),
  alphaNumeric('ALPHA_NUMERIC');

  const OTPMode(this.value);

  final String value;

  static OTPMode fromValue(String value) {
    return OTPMode.values.firstWhere(
      (mode) => mode.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}

enum DeviceType {
  android('ANDROID'),
  ios('IOS'),
  web('WEB');

  const DeviceType(this.value);

  final String value;

  static DeviceType fromValue(String value) {
    return DeviceType.values.firstWhere(
      (type) => type.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}

/// SmsType for sender types (different from SMSType for campaigns)
enum SmsType {
  promotional('PROMOTIONAL'),
  transactional('TRANSACTIONAL'),
  otp('OTP');

  const SmsType(this.value);

  final String value;

  static SmsType fromValue(String value) {
    return SmsType.values.firstWhere(
      (type) => type.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}

enum TransactionPeriod {
  year('YEAR'),
  month('MONTH'),
  week('WEEK'),
  day('DAY'),
  none('NONE');

  const TransactionPeriod(this.value);

  final String value;

  static TransactionPeriod fromValue(String value) {
    return TransactionPeriod.values.firstWhere(
      (period) => period.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}

enum VerifyIdStatus {
  pending('PENDING'),
  verified('VERIFIED'),
  approved('APPROVED'),
  refused('REFUSED');

  const VerifyIdStatus(this.value);

  final String value;

  static VerifyIdStatus fromValue(String value) {
    return VerifyIdStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}

enum CompanyVerificationStatus {
  pending('PENDING'),
  approved('APPROVED'),
  refused('REFUSED');

  const CompanyVerificationStatus(this.value);

  final String value;

  static CompanyVerificationStatus fromValue(String value) {
    return CompanyVerificationStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}

enum ChallengeType {
  weekly('WEEKLY'),
  monthly('MONTHLY'),
  special('SPECIAL');

  const ChallengeType(this.value);

  final String value;

  static ChallengeType fromValue(String value) {
    return ChallengeType.values.firstWhere(
      (type) => type.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}

enum ChallengeStatus {
  upcoming('UPCOMING'),
  active('ACTIVE'),
  ended('ENDED');

  const ChallengeStatus(this.value);

  final String value;

  static ChallengeStatus fromValue(String value) {
    return ChallengeStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}

enum DailyTaskCriteriaType {
  smsSent('SMS_SENT'),
  smsDelivered('SMS_DELIVERED'),
  contactsAdded('CONTACTS_ADDED'),
  campaignsCreated('CAMPAIGNS_CREATED'),
  groupsCreated('GROUPS_CREATED'),
  appOpened('APP_OPENED'),
  creditPurchased('CREDIT_PURCHASED');

  const DailyTaskCriteriaType(this.value);

  final String value;

  static DailyTaskCriteriaType fromValue(String value) {
    return DailyTaskCriteriaType.values.firstWhere(
      (type) => type.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}
