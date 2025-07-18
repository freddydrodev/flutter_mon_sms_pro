import 'package:dio/dio.dart';
import 'package:mon_sms_pro/models/api_response_model.dart';
import 'package:mon_sms_pro/models/otp_model.dart';
import 'package:mon_sms_pro/payload/otp_payload.dart';

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
  /// [payload] contains the data required to request an OTP.
  /// Returns an `OTPModel` instance if successful, or `null` if there's an error.
  Future<ApiResponseModel<OTPModel?>> get(GetOtpPayload payload) async {
    final url = "$_baseUrl/auth/otp/get";

    print("flutter_mon_sms_pro/otp/get/payload: ${payload.toJson()}");

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    print("flutter_mon_sms_pro/otp/get/data: ${r.data}");

    final response = ApiResponseModel.fromJson(r.data, OTPModel.fromJson);

    return response;
  }

  /// Verifies an OTP.
  ///
  /// [payload] contains the data required to verify an OTP.
  /// Returns an `OTPModel` instance if successful, or `null` if there's an error.
  Future<ApiResponseModel<OTPModel?>> verify(VerifyOtpPayload payload) async {
    final url = "$_baseUrl/auth/otp/verify";

    print("flutter_mon_sms_pro/otp/verify/payload: ${payload.toJson()}");

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    print("flutter_mon_sms_pro/otp/verify/data: ${r.data}");

    final response = ApiResponseModel.fromJson(r.data, OTPModel.fromJson);

    return response;
  }
}
