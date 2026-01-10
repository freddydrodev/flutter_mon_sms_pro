import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mon_sms_pro/models/api_response_model.dart';
import 'package:mon_sms_pro/models/device/device_model.dart';
import 'package:mon_sms_pro/models/utils.dart';

/// A class to handle API interactions related to devices.
class DeviceApi {
  final Dio _dio;
  final String _baseUrl;
  final String _apiKey;

  /// Constructs a DeviceApi instance.
  ///
  /// [dio] is the Dio client for making HTTP requests.
  /// [baseUrl] is the base URL of the API.
  /// [apiKey] is the API key used for authentication.
  const DeviceApi({
    required Dio dio,
    required String baseUrl,
    required String apiKey,
  })  : _dio = dio,
        _apiKey = apiKey,
        _baseUrl = baseUrl;

  /// Gets device information by device ID.
  ///
  /// [deviceId] is the unique device identifier.
  /// Returns the `DeviceModel` instance.
  Future<ApiResponseModel<DeviceModel?>> get({
    required String deviceId,
  }) async {
    final url = "$_baseUrl/device";

    final payload = {
      'apiKey': _apiKey,
      'deviceId': deviceId,
    };

    debugPrint("flutter_mon_sms_pro/device/get/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/device/get/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => DeviceModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Registers a new device.
  ///
  /// [deviceId] is the unique device identifier.
  /// [type] is the device type (ANDROID, IOS, WEB).
  /// [notificationToken] is an optional push notification token.
  /// [companyId] is an optional company ID.
  /// Returns the created `DeviceModel` instance.
  Future<ApiResponseModel<DeviceModel?>> register({
    required String deviceId,
    required DeviceType type,
    String? notificationToken,
    String? companyId,
  }) async {
    final url = "$_baseUrl/device/register";

    final payload = {
      'apiKey': _apiKey,
      'deviceId': deviceId,
      'type': type.value,
      if (notificationToken != null) 'notificationToken': notificationToken,
      if (companyId != null) 'companyId': companyId,
    };

    debugPrint("flutter_mon_sms_pro/device/register/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/device/register/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => DeviceModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Updates the notification token for a device.
  ///
  /// [deviceId] is the unique device identifier.
  /// [notificationToken] is the new push notification token.
  /// Returns the updated `DeviceModel` instance.
  Future<ApiResponseModel<DeviceModel?>> updateToken({
    required String deviceId,
    required String notificationToken,
  }) async {
    final url = "$_baseUrl/device/update-token";

    final payload = {
      'apiKey': _apiKey,
      'deviceId': deviceId,
      'notificationToken': notificationToken,
    };

    debugPrint("flutter_mon_sms_pro/device/updateToken/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/device/updateToken/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => DeviceModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Deletes a device.
  ///
  /// [id] is the ID of the device to delete.
  /// Returns success status.
  Future<ApiResponseModel<bool?>> delete({
    required String id,
  }) async {
    final url = "$_baseUrl/device/$id/delete";

    final payload = {
      'apiKey': _apiKey,
    };

    debugPrint("flutter_mon_sms_pro/device/delete/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/device/delete/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => data as bool?,
    );

    return response;
  }
}
