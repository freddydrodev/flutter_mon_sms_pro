import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mon_sms_pro/models/api_response_model.dart';
import 'package:mon_sms_pro/models/models.dart';
import 'package:mon_sms_pro/payload/sender_payload.dart';

/// A class to handle API interactions related to campaigns.
class SenderApi {
  final Dio _dio;
  final String _baseUrl;
  final String _apiKey;

  /// Constructs a SenderApi instance.
  ///
  /// [dio] is the Dio client for making HTTP requests.
  /// [baseUrl] is the base URL of the API.
  /// [apiKey] is the API key used for authentication.
  const SenderApi({
    required Dio dio,
    required String baseUrl,
    required String apiKey,
  })  : _dio = dio,
        _apiKey = apiKey,
        _baseUrl = baseUrl;

  /// Fetches a list of campaigns.
  ///
  /// [payload] contains optional parameters for filtering the list.
  /// Returns a list of `SenderModel` instances.
  Future<ApiResponseModel<List<SenderModel>>> list(
      [SenderListPayload? payload]) async {
    final url = "$_baseUrl/sender/list";

    debugPrint("flutter_mon_sms_pro/sender/list/payload: ${payload?.toJson()}");

    final r = await _dio.post(url, data: {
      if (payload != null) ...payload.toJson(),
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/sender/list/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => (data as List<dynamic>)
          .map((e) => SenderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return response;
  }

  /// Creates a new campaign.
  ///
  /// [payload] contains the campaign creation data.
  /// Returns the created `SenderModel` instance.
  Future<ApiResponseModel<SenderModel?>> create(
      CreateSenderPayload payload) async {
    final url = "$_baseUrl/sender/create";

    debugPrint(
        "flutter_mon_sms_pro/sender/create/payload: ${payload.toJson()}");

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/sender/create/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
        r.data, (data) => SenderModel.fromJson(data as Map<String, dynamic>));

    return response;
  }

  /// Retrieves a sender from the sender list.
  ///
  /// [payload] contains the ID of the sender to retrieve.
  /// Returns a `SenderModel` instance if successful, or `null` if there's an error.
  Future<ApiResponseModel<SenderModel?>> get(GetSenderPayload payload) async {
    final url = "$_baseUrl/sender/${payload.id}";

    debugPrint("flutter_mon_sms_pro/sender/get/payload: ${payload.toJson()}");

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/sender/get/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
        r.data, (data) => SenderModel.fromJson(data as Map<String, dynamic>));

    return response;
  }

  /// Updates a sender in the sender list.
  ///
  /// [payload] contains the updated sender data.
  /// Returns a `SenderModel` instance if successful, or `null` if there's an error.
  Future<ApiResponseModel<SenderModel?>> update(
      GetSenderPayload payload) async {
    final url = "$_baseUrl/sender/${payload.id}/update";

    debugPrint(
        "flutter_mon_sms_pro/sender/update/payload: ${payload.toJson()}");

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/sender/update/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
        r.data, (data) => SenderModel.fromJson(data as Map<String, dynamic>));

    return response;
  }
}
