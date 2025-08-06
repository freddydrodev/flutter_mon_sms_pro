import 'package:dio/dio.dart';
import 'package:mon_sms_pro/models/api_response_model.dart';
import 'package:mon_sms_pro/models/group_model.dart';
import 'package:mon_sms_pro/payload/group_payload.dart';

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
  /// [payload] contains optional parameters for filtering the list.
  /// Returns a list of `GroupModel` instances.
  Future<ApiResponseModel<List<GroupModel>>> list(
      [GroupListPayload? payload]) async {
    final url = "$_baseUrl/group/list";

    print("flutter_mon_sms_pro/group/list/payload: ${payload?.toJson()}");

    final r = await _dio.post(url, data: {
      if (payload != null) ...payload.toJson(),
      "apiKey": _apiKey,
    });

    print("flutter_mon_sms_pro/group/list/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (json) => (json as List).map((e) => GroupModel.fromJson(e)).toList(),
    );

    return response;
  }

  /// Creates a new group.
  ///
  /// [payload] contains the group creation data.
  /// Returns the created `GroupModel` instance.
  Future<ApiResponseModel<GroupModel?>> create(
      CreateGroupPayload payload) async {
    final url = "$_baseUrl/group/create";

    print("flutter_mon_sms_pro/group/create/payload: ${payload.toJson()}");

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    print("flutter_mon_sms_pro/group/create/data: ${r.data}");

    final response = ApiResponseModel.fromJson(r.data, GroupModel.fromJson);

    return response;
  }

  /// Deletes one or more groups from the group list.
  ///
  /// [payload] contains the IDs of the groups to delete.
  /// Returns `null` if there's an error, or nothing if successful.
  Future<ApiResponseModel<void>> delete(DeleteGroupPayload payload) async {
    final url = "$_baseUrl/group/delete";

    print("flutter_mon_sms_pro/group/delete/payload: ${payload.toJson()}");

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    print("flutter_mon_sms_pro/group/delete/data: ${r.data}");

    final response = ApiResponseModel.fromJson(r.data, (json) => null);

    return response;
  }

  /// Retrieves a group from the group list.
  ///
  /// [payload] contains the ID of the group to retrieve.
  /// Returns a `GroupModel` instance if successful, or `null` if there's an error.
  Future<ApiResponseModel<GroupModel?>> get(GetGroupPayload payload) async {
    final url = "$_baseUrl/group/${payload.id}";

    print("flutter_mon_sms_pro/group/get/payload: ${payload.toJson()}");

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    print("flutter_mon_sms_pro/group/get/data: ${r.data}");

    final response = ApiResponseModel.fromJson(r.data, GroupModel.fromJson);

    return response;
  }

  /// Updates a group in the group list.
  ///
  /// [payload] contains the updated group data.
  /// Returns a `GroupModel` instance if successful, or `null` if there's an error.
  Future<ApiResponseModel<GroupModel?>> update(
      UpdateGroupPayload payload) async {
    final url = "$_baseUrl/group/${payload.id}/update";

    print("flutter_mon_sms_pro/group/update/payload: ${payload.toJson()}");

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    print("flutter_mon_sms_pro/group/update/data: ${r.data}");

    final response = ApiResponseModel.fromJson(r.data, GroupModel.fromJson);

    return response;
  }
}
