import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mon_sms_pro/models/api_response_model.dart';
import 'package:mon_sms_pro/models/models.dart';
import 'package:mon_sms_pro/models/utils.dart';
import 'package:mon_sms_pro/payload/core/list_payload.dart';

/// A class to handle API interactions related to contacts.
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

  /// Fetches a list of contacts.
  ///
  /// [count] is the number of items to return per page.
  /// [page] is the page number to fetch.
  /// [sort] is the sort order (asc or desc).
  /// [orderBy] is the field to order by.
  /// Returns a list of `ContactModel` instances.
  Future<ApiResponseModel<List<ContactModel>>> list({
    int? count,
    int? page,
    SortList? sort,
    String? orderBy,
  }) async {
    final url = "$_baseUrl/contact/list";

    debugPrint("flutter_mon_sms_pro/contact/list/url: $url");

    final payload = {
      if (count != null) 'count': count,
      if (page != null) 'page': page,
      if (sort != null) 'sort': sort.value,
      if (orderBy != null) 'orderBy': orderBy,
    };

    debugPrint("flutter_mon_sms_pro/contact/list/payload: $payload");

    final r = await _dio.post(url, data: {
      ...payload,
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/contact/list/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => (data as List<dynamic>)
          .map((e) => ContactModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return response;
  }

  /// Creates new contacts.
  ///
  /// [contacts] is the list of contacts to create.
  /// Returns the created `ContactModel` instance.
  Future<ApiResponseModel<ContactModel?>> create({
    required List<ContactModel> contacts,
  }) async {
    final url = "$_baseUrl/contact/create";

    final payload = {
      'contacts': contacts.map((e) => e.toJson()).toList(),
    };

    debugPrint("flutter_mon_sms_pro/contact/create/payload: $payload");

    final r = await _dio.post(url, data: {
      ...payload,
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/contact/create/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
        r.data, (data) => ContactModel.fromJson(data as Map<String, dynamic>));

    return response;
  }

  /// Deletes one or more contacts from the contact list.
  ///
  /// [contactIds] is the list of contact IDs to delete.
  /// Returns `null` if there's an error, or nothing if successful.
  Future<ApiResponseModel<void>> delete({
    required List<String> contactIds,
  }) async {
    final url = "$_baseUrl/contact/delete";

    final payload = {
      'contactIds': contactIds,
    };

    debugPrint("flutter_mon_sms_pro/contact/delete/payload: $payload");

    final r = await _dio.post(url, data: {
      ...payload,
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/contact/delete/data: ${r.data}");

    final response = ApiResponseModel.fromJson(r.data, (data) => null);

    return response;
  }

  /// Retrieves a contact from the contact list.
  ///
  /// [id] is the ID of the contact to retrieve.
  /// Returns a `ContactModel` instance if successful, or `null` if there's an error.
  Future<ApiResponseModel<ContactModel?>> get({required String id}) async {
    final url = "$_baseUrl/contact/$id";

    final payload = {
      'id': id,
    };

    debugPrint("flutter_mon_sms_pro/contact/get/payload: $payload");

    final r = await _dio.post(url, data: {
      ...payload,
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/contact/get/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
        r.data, (data) => ContactModel.fromJson(data as Map<String, dynamic>));

    return response;
  }

  /// Updates a contact in the contact list.
  ///
  /// [id] is the ID of the contact to update.
  /// [phone] is the new phone number.
  /// [name] is the new name.
  /// [firstName] is the new first name.
  /// [lastName] is the new last name.
  /// [sex] is the new sex type.
  /// Returns a `ContactModel` instance if successful, or `null` if there's an error.
  Future<ApiResponseModel<ContactModel?>> update({
    required String id,
    String? phone,
    String? name,
    String? firstName,
    String? lastName,
    SexType? sex,
  }) async {
    final url = "$_baseUrl/contact/$id/update";

    final payload = {
      'id': id,
      if (phone != null) 'phone': phone,
      if (name != null) 'name': name,
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (sex != null) 'sex': sex.value,
    };

    debugPrint("flutter_mon_sms_pro/contact/update/payload: $payload");

    final r = await _dio.post(url, data: {
      ...payload,
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/contact/update/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
        r.data, (data) => ContactModel.fromJson(data as Map<String, dynamic>));

    return response;
  }
}
