enum OTPStatus {
  pending("PENDING"),
  verified("VERIFIED"),
  demo("DEMO");

  final String value;

  const OTPStatus(this.value);
}

class OTPModel {
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
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'phoneNumber': phoneNumber,
      'status': status,
    };
  }
}
