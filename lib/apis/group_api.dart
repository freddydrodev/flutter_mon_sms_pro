import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mon_sms_pro/models/api_response_model.dart';
import 'package:mon_sms_pro/models/models.dart';
import 'package:mon_sms_pro/payload/core/list_payload.dart';

/// A class to handle API interactions related to groups.
class GroupApi {
  final Dio _dio;
  final String _baseUrl;
  final String _apiKey;

  /// Constructs a GroupApi instance.
  ///
  /// [dio] is the Dio client for making HTTP requests.
  /// [baseUrl] is the base URL of the API.
  /// [apiKey] is the API key used for authentication.
  const GroupApi({
    required Dio dio,
    required String baseUrl,
    required String apiKey,
  })  : _dio = dio,
        _apiKey = apiKey,
        _baseUrl = baseUrl;

  /// Fetches a list of groups.
  ///
  /// [count] is the number of items to return per page.
  /// [page] is the page number to fetch.
  /// [sort] is the sort order (asc or desc).
  /// [orderBy] is the field to order by.
  /// Returns a list of `GroupModel` instances.
  Future<ApiResponseModel<List<GroupModel>>> list({
    int? count,
    int? page,
    SortList? sort,
    String? orderBy,
  }) async {
    final url = "$_baseUrl/group/list";

    final payload = {
      if (count != null) 'count': count,
      if (page != null) 'page': page,
      if (sort != null) 'sort': sort.value,
      if (orderBy != null) 'orderBy': orderBy,
    };

    debugPrint("flutter_mon_sms_pro/group/list/payload: $payload");

    final r = await _dio.post(url, data: {
      ...payload,
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/group/list/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => (data as List<dynamic>)
          .map((e) => GroupModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return response;
  }

  /// Creates a new group.
  ///
  /// [name] is the name of the group.
  /// [description] is the optional description of the group.
  /// Returns the created `GroupModel` instance.
  Future<ApiResponseModel<GroupModel?>> create({
    required String name,
    required List<ContactModel> contacts,
  }) async {
    final url = "$_baseUrl/group/create";

    final payload = {
      'name': name,
      'contacts': contacts.map((e) => e.toJson()).toList(),
    };

    debugPrint("flutter_mon_sms_pro/group/create/payload: $payload");

    final r = await _dio.post(url, data: {
      ...payload,
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/group/create/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
        r.data, (data) => GroupModel.fromJson(data as Map<String, dynamic>));

    return response;
  }

  /// Deletes one or more groups from the group list.
  ///
  /// [id] is the ID of the group to delete.
  /// Returns `null` if there's an error, or nothing if successful.
  Future<ApiResponseModel<void>> delete({required String id}) async {
    final url = "$_baseUrl/group/$id/delete";

    debugPrint("flutter_mon_sms_pro/group/delete/payload: $id");

    final r = await _dio.post(url, data: {
      "id": id,
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/group/delete/data: ${r.data}");

    final response = ApiResponseModel.fromJson(r.data, (data) => null);

    return response;
  }

  /// Retrieves a group from the group list.
  ///
  /// [id] is the ID of the group to retrieve.
  /// Returns a `GroupModel` instance if successful, or `null` if there's an error.
  Future<ApiResponseModel<GroupModel?>> get({required String id}) async {
    final url = "$_baseUrl/group/$id";

    debugPrint("flutter_mon_sms_pro/group/get/payload: $id");

    final r = await _dio.post(url, data: {
      "id": id,
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/group/get/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
        r.data, (data) => GroupModel.fromJson(data as Map<String, dynamic>));

    return response;
  }

  /// Updates a group in the group list.
  ///
  /// [id] is the ID of the group to update.
  /// [name] is the new name of the group.
  /// [description] is the new description of the group.
  /// Returns a `GroupModel` instance if successful, or `null` if there's an error.
  Future<ApiResponseModel<GroupModel?>> update({
    required String id,
    required String name,
    required List<ContactModel> contacts,
  }) async {
    final url = "$_baseUrl/group/$id/update";

    final payload = {
      'id': id,
      'name': name,
      'contacts': contacts.map((e) => e.toJson()).toList(),
    };

    debugPrint("flutter_mon_sms_pro/group/update/payload: $payload");

    final r = await _dio.post(url, data: {
      ...payload,
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/group/update/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
        r.data, (data) => GroupModel.fromJson(data as Map<String, dynamic>));

    return response;
  }
}
