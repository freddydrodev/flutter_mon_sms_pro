import 'package:dio/dio.dart';
import 'package:mon_sms_pro/models/contact_model.dart';
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
  Future<List<ContactModel>> list([ContactListPayload? payload]) async {
    final url = "$_baseUrl/contact/list";

    final r = await _dio.post(url, data: {
      if (payload != null) ...payload.toJson(),
      "apiKey": _apiKey,
    });

    print(r.data);

    if (r.data['error'] != null) {
      print(r.data['error']);

      return [];
    }

    final list = r.data['data'] as List;

    return List.generate(
      list.length,
      (i) => ContactModel.fromJson(list[i]),
    );
  }

  /// Creates a new campaign.
  ///
  /// [payload] contains the campaign creation data.
  /// Returns the created `ContactModel` instance.
  Future<ContactModel?> create(CreateContactPayload payload) async {
    final url = "$_baseUrl/contact/create";

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    if (r.data['error'] != null) return null;

    final data = r.data['data'];

    return ContactModel.fromJson(data);
  }

  /// Deletes one or more contacts from the contact list.
  ///
  /// [payload] contains the IDs of the contacts to delete.
  /// Returns `null` if there's an error, or nothing if successful.
  Future delete(DeleteContactPayload payload) async {
    final url = "$_baseUrl/contact/delete";

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    if (r.data['error'] != null) return null;
  }

  /// Retrieves a contact from the contact list.
  ///
  /// [payload] contains the ID of the contact to retrieve.
  /// Returns a `ContactModel` instance if successful, or `null` if there's an error.
  Future<ContactModel?> get(GetContactPayload payload) async {
    final url = "$_baseUrl/contact/${payload.id}";

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    if (r.data['error'] != null) return null;

    final data = r.data['data'];

    return ContactModel.fromJson(data);
  }

  /// Updates a contact in the contact list.
  ///
  /// [payload] contains the updated contact data.
  /// Returns a `ContactModel` instance if successful, or `null` if there's an error.
  Future<ContactModel?> update(GetContactPayload payload) async {
    final url = "$_baseUrl/contact/${payload.id}/update";

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    if (r.data['error'] != null) return null;

    final data = r.data['data'];

    return ContactModel.fromJson(data);
  }
}
