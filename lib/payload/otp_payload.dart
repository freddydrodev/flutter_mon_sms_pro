import 'package:mon_sms_pro/payload/core/base_payload.dart';

enum OtpMode {
  numeric('NUMERIC'),
  alphabet('ALPHABET'),
  alphanumeric('ALPHA_NUMERIC');

  const OtpMode(this.value);

  final String value;
}

/// The payload for getting an OTP.
class GetOtpPayload extends BasePayload {
  /// The phone number of the user to receive the OTP.
  /// add the index eg: +225000000000
  final String phoneNumber;

  /// The sender ID of the OTP.
  final String? senderId;

  /// The length of the OTP.
  final int? length;

  /// The mode of the OTP.
  final OtpMode? mode;

  /// The name of the app requesting the OTP.
  final String? appName;

  /// Creates a new [GetOtpPayload] instance.
  GetOtpPayload({
    super.apiKey,
    required this.phoneNumber,
    this.senderId,
    this.length = 4,
    this.mode = OtpMode.numeric,
    this.appName,
  });

  /// Creates a new [GetOtpPayload] instance from a JSON object.
  factory GetOtpPayload.fromJson(Map<String, dynamic> json) {
    return GetOtpPayload(
      apiKey: json['apiKey'],
      phoneNumber: json['phoneNumber'],
      senderId: json['senderId'],
      length: json['length'],
      mode: OtpMode.values.firstWhere(
        (m) => m.value == json['mode'],
        orElse: () => OtpMode.numeric,
      ), // json['mode'],
      appName: json['appName'],
    );
  }

  /// Converts the payload to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    return {
      'apiKey': apiKey,
      'phoneNumber': phoneNumber,
      'senderId': senderId,
      'length': length,
      'mode': mode?.value,
      'appName': appName,
    };
  }
}

/// The payload for verifying an OTP.
class VerifyOtpPayload extends BasePayload {
  /// The phone number of the user to verify the OTP for.
  final String? phoneNumber;

  /// The token of the OTP to verify.
  final String token;

  /// The OTP to verify.
  final String otp;

  /// Creates a new [VerifyOtpPayload] instance.
  VerifyOtpPayload({
    super.apiKey,
    this.phoneNumber,
    required this.token,
    required this.otp,
  });

  /// Creates a new [VerifyOtpPayload] instance from a JSON object.
  factory VerifyOtpPayload.fromJson(Map<String, dynamic> json) {
    return VerifyOtpPayload(
      apiKey: json['apiKey'],
      phoneNumber: json['phoneNumber'],
      token: json['token'],
      otp: json['otp'],
    );
  }

  /// Converts the payload to a JSON object.
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
