library mon_sms_pro;

import 'package:dio/dio.dart';
import 'package:mon_sms_pro/apis/campain_api.dart';
import 'package:mon_sms_pro/apis/otp_api.dart';
import 'package:mon_sms_pro/payload/campain_payload.dart';
import 'package:mon_sms_pro/payload/otp_payload.dart';

class MonSMSPRO {
  String get _baseUrl => "https://rest.monsmspro.freddydro.dev/api";

  Dio get _dio => Dio();

  final String _apiKey;

  const MonSMSPRO({required String apiKey}) : _apiKey = apiKey;

  CampainApi get campain => CampainApi(
        baseUrl: _baseUrl,
        dio: _dio,
        apiKey: _apiKey,
      );

  OtpApi get otp => OtpApi(baseUrl: _baseUrl, dio: _dio, apiKey: _apiKey);
}

void main(List<String> args) async {
  const sms = MonSMSPRO(apiKey: "YOUR_API_KEY");

  final list = await sms.campain.list(CampainListPayload());

  final otp = await sms.otp.get(GetOtpPayload(phoneNumber: "PHONE_NUMBER"));

  print(list);
}
