import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mon_sms_pro/models/api_response_model.dart';
import 'package:mon_sms_pro/models/models.dart';

/// A class to handle OTP related API interactions.
class OtpApi {
  final Dio _dio;
  final String _baseUrl;
  final String _apiKey;

  /// Constructs an instance of `OtpApi`.
  ///
  /// [dio] is the Dio instance used for making network requests.
  /// [baseUrl] is the base URL for the API endpoints.
  /// [apiKey] is the API key for authentication.
  const OtpApi({
    required Dio dio,
    required String baseUrl,
    required String apiKey,
  })  : _dio = dio,
        _apiKey = apiKey,
        _baseUrl = baseUrl;

  /// Retrieves an OTP.
  ///
  /// [phoneNumber] is the phone number to receive the OTP.
  /// [senderId] is the optional sender ID of the OTP.
  /// [length] is the optional length of the OTP (default: 4).
  /// [mode] is the optional mode of the OTP (default: numeric).
  /// [appName] is the optional name of the app requesting the OTP.
  /// Returns an `OTPModel` instance if successful, or `null` if there's an error.
  Future<ApiResponseModel<OTPModel?>> get({
    required String phoneNumber,
    String? senderId,
    int? length = 4,
    String? mode = 'NUMERIC',
    String? appName,
  }) async {
    final url = "$_baseUrl/auth/otp/get";

    debugPrint("flutter_mon_sms_pro/otp/get/url: $url");

    final payload = {
      'phoneNumber': phoneNumber,
      if (senderId != null) 'senderId': senderId,
      if (length != null) 'length': length,
      if (mode != null) 'mode': mode,
      if (appName != null) 'appName': appName,
    };

    debugPrint("flutter_mon_sms_pro/otp/get/payload: $payload");

    final r = await _dio.post(url, data: {
      ...payload,
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/otp/get/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
        r.data, (data) => OTPModel.fromJson(data as Map<String, dynamic>));

    return response;
  }

  /// Verifies an OTP.
  ///
  /// [token] is the token of the OTP to verify.
  /// [otp] is the OTP to verify.
  /// [phoneNumber] is the optional phone number of the user to verify the OTP for.
  /// Returns an `OTPModel` instance if successful, or `null` if there's an error.
  Future<ApiResponseModel<OTPModel?>> verify({
    required String token,
    required String otp,
    String? phoneNumber,
  }) async {
    final url = "$_baseUrl/auth/otp/verify";

    final payload = {
      'token': token,
      'otp': otp,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
    };

    debugPrint("flutter_mon_sms_pro/otp/verify/payload: $payload");

    final r = await _dio.post(url, data: {
      ...payload,
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/otp/verify/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
        r.data, (data) => OTPModel.fromJson(data as Map<String, dynamic>));

    return response;
  }
}
