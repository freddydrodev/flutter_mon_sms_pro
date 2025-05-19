import 'package:hive_ce/hive.dart';

part 'otp_model.g.dart';

@HiveType(typeId: 3)
enum OTPStatus {
  @HiveField(0)
  pending("PENDING"),
  @HiveField(1)
  verified("VERIFIED"),
  @HiveField(2)
  demo("DEMO");

  final String value;

  const OTPStatus(this.value);
}

@HiveType(typeId: 4)
class OTPModel {
  @HiveField(0)
  final String token;

  @HiveField(1)
  final String phoneNumber;

  @HiveField(2)
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
      status: OTPStatus.values.firstWhere((e) => e.value == json['status']),
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
