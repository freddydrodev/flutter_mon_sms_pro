library mon_sms_pro;

import 'package:dio/dio.dart';
import 'package:mon_sms_pro/apis/campain_api.dart';
import 'package:mon_sms_pro/apis/contact_api.dart';
import 'package:mon_sms_pro/apis/otp_api.dart';
import 'package:mon_sms_pro/apis/sender_api.dart';

export 'package:mon_sms_pro/payload/payload.dart';

class MonSMSPRO {
  String get _baseUrl => "https://rest.monsms.pro/api";
  //"https://rest.monsmspro.freddydro.dev/api"; // "https://rest.monsms.pro/api"

  Dio get _dio => Dio();

  final String _apiKey;

  const MonSMSPRO({required String apiKey}) : _apiKey = apiKey;

  CampainApi get campain => CampainApi(
        baseUrl: _baseUrl,
        dio: _dio,
        apiKey: _apiKey,
      );

  OtpApi get otp => OtpApi(
        baseUrl: _baseUrl,
        dio: _dio,
        apiKey: _apiKey,
      );

  ContactApi get contact => ContactApi(
        baseUrl: _baseUrl,
        dio: _dio,
        apiKey: _apiKey,
      );

  SenderApi get sender => SenderApi(
        baseUrl: _baseUrl,
        dio: _dio,
        apiKey: _apiKey,
      );
}
