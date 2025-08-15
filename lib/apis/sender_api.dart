import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mon_sms_pro/models/api_response_model.dart';
import 'package:mon_sms_pro/models/models.dart';
import 'package:mon_sms_pro/payload/core/list_payload.dart';

/// A class to handle API interactions related to senders.
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

  /// Fetches a list of senders.
  ///
  /// [count] is the number of items to return per page.
  /// [page] is the page number to fetch.
  /// [sort] is the sort order (asc or desc).
  /// [orderBy] is the field to order by.
  /// Returns a list of `SenderModel` instances.
  Future<ApiResponseModel<List<SenderModel>>> list({
    int? count,
    int? page,
    SortList? sort,
    String? orderBy,
  }) async {
    final url = "$_baseUrl/sender/list";

    final payload = {
      if (count != null) 'count': count,
      if (page != null) 'page': page,
      if (sort != null) 'sort': sort.value,
      if (orderBy != null) 'orderBy': orderBy,
    };

    debugPrint("flutter_mon_sms_pro/sender/list/payload: $payload");

    final r = await _dio.post(url, data: {
      ...payload,
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

  /// Creates a new sender.
  ///
  /// [name] is the name of the sender.
  /// [description] is the description of the sender.
  /// Returns the created `SenderModel` instance.
  Future<ApiResponseModel<SenderModel?>> create({
    required String name,
    required String description,
  }) async {
    final url = "$_baseUrl/sender/create";

    final payload = {
      'name': name,
      'description': description,
    };

    debugPrint("flutter_mon_sms_pro/sender/create/payload: $payload");

    final r = await _dio.post(url, data: {
      ...payload,
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/sender/create/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
        r.data, (data) => SenderModel.fromJson(data as Map<String, dynamic>));

    return response;
  }

  /// Retrieves a sender from the sender list.
  ///
  /// [id] is the ID of the sender to retrieve.
  /// Returns a `SenderModel` instance if successful, or `null` if there's an error.
  Future<ApiResponseModel<SenderModel?>> get({required String id}) async {
    final url = "$_baseUrl/sender/$id";

    final payload = {
      'id': id,
    };

    debugPrint("flutter_mon_sms_pro/sender/get/payload: $payload");

    final r = await _dio.post(url, data: {
      ...payload,
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/sender/get/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
        r.data, (data) => SenderModel.fromJson(data as Map<String, dynamic>));

    return response;
  }

  /// Updates a sender in the sender list.
  ///
  /// [id] is the ID of the sender to update.
  /// [archived] is whether the sender should be archived.
  /// Returns a `SenderModel` instance if successful, or `null` if there's an error.
  Future<ApiResponseModel<SenderModel?>> update({
    required String id,
    required bool archived,
  }) async {
    final url = "$_baseUrl/sender/$id/update";

    final payload = {
      'id': id,
      'archived': archived,
    };

    debugPrint("flutter_mon_sms_pro/sender/update/payload: $payload");

    final r = await _dio.post(url, data: {
      ...payload,
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/sender/update/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
        r.data, (data) => SenderModel.fromJson(data as Map<String, dynamic>));

    return response;
  }
}
