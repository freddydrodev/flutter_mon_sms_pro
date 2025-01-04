import 'package:mon_sms_pro/payload/core/base_payload.dart';

enum OtpMode {
  numeric('NUMERIC'),
  alphabet('ALPHABET'),
  alphanumeric('ALPHA_NUMERIC');

  const OtpMode(this.value);

  final String value;
}

class GetOtpPayload extends BasePayload {
  final String phoneNumber;
  final String? senderId;
  final int? length;
  final OtpMode? mode;
  final String? appName;

  GetOtpPayload({
    super.apiKey,
    required this.phoneNumber,
    this.senderId,
    this.length = 4,
    this.mode = OtpMode.numeric,
    this.appName,
  });

  factory GetOtpPayload.fromJson(Map<String, dynamic> json) {
    return GetOtpPayload(
      apiKey: json['apiKey'],
      phoneNumber: json['phoneNumber'],
      senderId: json['senderId'],
      length: json['length'],
      mode: json['mode'],
      appName: json['appName'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'apiKey': apiKey,
      'phoneNumber': phoneNumber,
      'senderId': senderId,
      'length': length,
      'mode': mode,
      'appName': appName,
    };
  }
}

class VerifyOtpPayload extends BasePayload {
  final String? phoneNumber;
  final String token;
  final String otp;

  VerifyOtpPayload({
    super.apiKey,
    this.phoneNumber,
    required this.token,
    required this.otp,
  });

  factory VerifyOtpPayload.fromJson(Map<String, dynamic> json) {
    return VerifyOtpPayload(
      apiKey: json['apiKey'],
      phoneNumber: json['phoneNumber'],
      token: json['token'],
      otp: json['otp'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'apiKey': apiKey,
      'phoneNumber': phoneNumber,
      'token': token,
      'otp': otp,
    };
  }
}
