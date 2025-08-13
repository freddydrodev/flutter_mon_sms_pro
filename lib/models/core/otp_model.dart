import 'package:hive_ce/hive.dart';

enum OTPStatus {
  pending("PENDING"),
  verified("VERIFIED"),
  demo("DEMO");

  final String value;

  const OTPStatus(this.value);

  static OTPStatus fromValue(String value) {
    return OTPStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () =>
          throw ArgumentError('No enum value with that value: $value'),
    );
  }
}

class OTPModel extends HiveObject {
  final String token;

  final String phoneNumber;

  final OTPStatus status;

  OTPModel({
    required this.token,
    required this.phoneNumber,
    required this.status,
  });

  factory OTPModel.fromJson(Map<String, dynamic> json) {
    return OTPModel(
      token: json['token'],
      phoneNumber: json['phoneNumber'],
      status: OTPStatus.fromValue(json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'phoneNumber': phoneNumber,
      'status': status.value,
    };
  }
}
