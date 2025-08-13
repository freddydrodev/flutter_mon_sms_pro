import 'package:dio/dio.dart';
import 'package:mon_sms_pro/models/api_response_model.dart';
import 'package:mon_sms_pro/models/models.dart';
import 'package:mon_sms_pro/payload/contact_payload.dart';

/// A class to handle API interactions related to campaigns.
class ContactApi {
  final Dio _dio;
  final String _baseUrl;
  final String _apiKey;

  /// Constructs a ContactApi instance.
  ///
  /// [dio] is the Dio client for making HTTP requests.
  /// [baseUrl] is the base URL of the API.
  /// [apiKey] is the API key used for authentication.
  const ContactApi({
    required Dio dio,
    required String baseUrl,
    required String apiKey,
  })  : _dio = dio,
        _apiKey = apiKey,
        _baseUrl = baseUrl;

  /// Fetches a list of campaigns.
  ///
  /// [payload] contains optional parameters for filtering the list.
  /// Returns a list of `ContactModel` instances.
  Future<ApiResponseModel<List<ContactModel>>> list(
      [ContactListPayload? payload]) async {
    final url = "$_baseUrl/contact/list";

    print("flutter_mon_sms_pro/contact/list/payload: ${payload?.toJson()}");

    final r = await _dio.post(url, data: {
      if (payload != null) ...payload.toJson(),
      "apiKey": _apiKey,
    });

    print("flutter_mon_sms_pro/contact/list/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (json) => (json as List).map((e) => ContactModel.fromJson(e)).toList(),
    );

    return response;
  }

  /// Creates a new campaign.
  ///
  /// [payload] contains the campaign creation data.
  /// Returns the created `ContactModel` instance.
  Future<ApiResponseModel<ContactModel?>> create(
      CreateContactPayload payload) async {
    final url = "$_baseUrl/contact/create";

    print("flutter_mon_sms_pro/contact/create/payload: ${payload.toJson()}");

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    print("flutter_mon_sms_pro/contact/create/data: ${r.data}");

    final response = ApiResponseModel.fromJson(r.data, ContactModel.fromJson);

    return response;
  }

  /// Deletes one or more contacts from the contact list.
  ///
  /// [payload] contains the IDs of the contacts to delete.
  /// Returns `null` if there's an error, or nothing if successful.
  Future<ApiResponseModel<void>> delete(DeleteContactPayload payload) async {
    final url = "$_baseUrl/contact/delete";

    print("flutter_mon_sms_pro/contact/delete/payload: ${payload.toJson()}");

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    print("flutter_mon_sms_pro/contact/delete/data: ${r.data}");

    final response = ApiResponseModel.fromJson(r.data, (json) => null);

    return response;
  }

  /// Retrieves a contact from the contact list.
  ///
  /// [payload] contains the ID of the contact to retrieve.
  /// Returns a `ContactModel` instance if successful, or `null` if there's an error.
  Future<ApiResponseModel<ContactModel?>> get(GetContactPayload payload) async {
    final url = "$_baseUrl/contact/${payload.id}";

    print("flutter_mon_sms_pro/contact/get/payload: ${payload.toJson()}");

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    print("flutter_mon_sms_pro/contact/get/data: ${r.data}");

    final response = ApiResponseModel.fromJson(r.data, ContactModel.fromJson);

    return response;
  }

  /// Updates a contact in the contact list.
  ///
  /// [payload] contains the updated contact data.
  /// Returns a `ContactModel` instance if successful, or `null` if there's an error.
  Future<ApiResponseModel<ContactModel?>> update(
      GetContactPayload payload) async {
    final url = "$_baseUrl/contact/${payload.id}/update";

    print("flutter_mon_sms_pro/contact/update/payload: ${payload.toJson()}");

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    print("flutter_mon_sms_pro/contact/update/data: ${r.data}");

    final response = ApiResponseModel.fromJson(r.data, ContactModel.fromJson);

    return response;
  }
}
