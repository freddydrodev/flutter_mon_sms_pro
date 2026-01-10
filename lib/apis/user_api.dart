import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mon_sms_pro/models/api_response_model.dart';
import 'package:mon_sms_pro/models/core/user_model.dart';

/// A class to handle API interactions related to users.
class UserApi {
  final Dio _dio;
  final String _baseUrl;
  final String _apiKey;

  /// Constructs a UserApi instance.
  ///
  /// [dio] is the Dio client for making HTTP requests.
  /// [baseUrl] is the base URL of the API.
  /// [apiKey] is the API key used for authentication.
  const UserApi({
    required Dio dio,
    required String baseUrl,
    required String apiKey,
  })  : _dio = dio,
        _apiKey = apiKey,
        _baseUrl = baseUrl;

  /// Creates a new user.
  ///
  /// [emailAddress] is the email address of the user.
  /// [phoneNumber] is the phone number of the user.
  /// [fullName] is the full name of the user.
  /// [otpToken] is the OTP token for verification.
  /// [verificationId] is the verification ID.
  /// [codePromo] is an optional promo code.
  /// Returns the created `UserModel` instance.
  Future<ApiResponseModel<UserModel?>> create({
    required String emailAddress,
    required String phoneNumber,
    required String fullName,
    required String otpToken,
    required String verificationId,
    String? codePromo,
  }) async {
    final url = "$_baseUrl/user/create";

    final payload = {
      'emailAddress': emailAddress,
      'phoneNumber': phoneNumber,
      'fullName': fullName,
      'otpToken': otpToken,
      'verificationId': verificationId,
      if (codePromo != null) 'codePromo': codePromo,
    };

    debugPrint("flutter_mon_sms_pro/user/create/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/user/create/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => UserModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Gets the current user details.
  ///
  /// Returns the `UserModel` instance.
  Future<ApiResponseModel<UserModel?>> details() async {
    final url = "$_baseUrl/user/details";

    final payload = {
      'apiKey': _apiKey,
    };

    debugPrint("flutter_mon_sms_pro/user/details/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/user/details/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => UserModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Gets the current user's available credit.
  ///
  /// Returns the available credit as an integer.
  Future<ApiResponseModel<int?>> credit() async {
    final url = "$_baseUrl/user/credit";

    final payload = {
      'apiKey': _apiKey,
    };

    debugPrint("flutter_mon_sms_pro/user/credit/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/user/credit/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => data as int,
    );

    return response;
  }

  /// Gets a user by phone number and OTP token.
  ///
  /// [phoneNumber] is the phone number of the user.
  /// [otpToken] is the OTP token for verification.
  /// Returns the `UserModel` instance.
  Future<ApiResponseModel<UserModel?>> get({
    required String phoneNumber,
    required String otpToken,
  }) async {
    final url = "$_baseUrl/user";

    final payload = {
      'phoneNumber': phoneNumber,
      'otpToken': otpToken,
    };

    debugPrint("flutter_mon_sms_pro/user/get/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/user/get/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => UserModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Updates the user's logo/profile picture.
  ///
  /// [logo] is the base64 encoded image or URL.
  /// Returns the updated `UserModel` instance.
  Future<ApiResponseModel<UserModel?>> updateLogo({
    required String logo,
  }) async {
    final url = "$_baseUrl/user/update/logo";

    final payload = {
      'apiKey': _apiKey,
      'logo': logo,
    };

    debugPrint("flutter_mon_sms_pro/user/update/logo/payload: updating logo");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/user/update/logo/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => UserModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }
}
