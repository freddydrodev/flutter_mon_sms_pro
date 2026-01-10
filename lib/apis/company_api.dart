import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mon_sms_pro/models/api_response_model.dart';
import 'package:mon_sms_pro/models/company/company_model.dart';
import 'package:mon_sms_pro/models/lerezo/company_type_model.dart';

/// A class to handle API interactions related to companies.
class CompanyApi {
  final Dio _dio;
  final String _baseUrl;
  final String _apiKey;

  /// Constructs a CompanyApi instance.
  ///
  /// [dio] is the Dio client for making HTTP requests.
  /// [baseUrl] is the base URL of the API.
  /// [apiKey] is the API key used for authentication.
  const CompanyApi({
    required Dio dio,
    required String baseUrl,
    required String apiKey,
  })  : _dio = dio,
        _apiKey = apiKey,
        _baseUrl = baseUrl;

  /// Gets company details by ID.
  ///
  /// [id] is the ID of the company.
  /// Returns the `CompanyModel` instance.
  Future<ApiResponseModel<CompanyModel?>> get({
    required String id,
  }) async {
    final url = "$_baseUrl/company/$id";

    final payload = {
      'apiKey': _apiKey,
      'companyId': id,
    };

    debugPrint("flutter_mon_sms_pro/company/get/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/company/get/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => CompanyModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Creates a new company.
  ///
  /// [name] is the name of the company.
  /// [description] is an optional description.
  /// [companyTypeId] is the ID of the company type.
  /// [logo] is an optional logo URL or base64.
  /// [address] is an optional address.
  /// [city] is an optional city.
  /// Returns the created `CompanyModel` instance.
  Future<ApiResponseModel<CompanyModel?>> create({
    required String name,
    String? description,
    required String companyTypeId,
    String? logo,
    String? address,
    String? city,
  }) async {
    final url = "$_baseUrl/company/create";

    final payload = {
      'apiKey': _apiKey,
      'name': name,
      if (description != null) 'description': description,
      'companyTypeId': companyTypeId,
      if (logo != null) 'logo': logo,
      if (address != null) 'address': address,
      if (city != null) 'city': city,
    };

    debugPrint("flutter_mon_sms_pro/company/create/payload: creating company");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/company/create/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => CompanyModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Updates a company.
  ///
  /// [id] is the ID of the company to update.
  /// [name] is an optional new name.
  /// [description] is an optional new description.
  /// [logo] is an optional new logo.
  /// [address] is an optional new address.
  /// [city] is an optional new city.
  /// Returns the updated `CompanyModel` instance.
  Future<ApiResponseModel<CompanyModel?>> update({
    required String id,
    String? name,
    String? description,
    String? logo,
    String? address,
    String? city,
  }) async {
    final url = "$_baseUrl/company/$id/update";

    final payload = {
      'apiKey': _apiKey,
      'companyId': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (logo != null) 'logo': logo,
      if (address != null) 'address': address,
      if (city != null) 'city': city,
    };

    debugPrint("flutter_mon_sms_pro/company/update/payload: updating company");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/company/update/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => CompanyModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Lists all company types.
  ///
  /// Returns a list of `CompanyTypeModel` instances.
  Future<ApiResponseModel<List<CompanyTypeModel>>> listTypes() async {
    final url = "$_baseUrl/company-type/list";

    debugPrint("flutter_mon_sms_pro/company-type/list/url: $url");

    final r = await _dio.post(url, data: {});

    debugPrint("flutter_mon_sms_pro/company-type/list/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => (data as List<dynamic>)
          .map((e) => CompanyTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return response;
  }

  /// Lists all companies for the current user.
  ///
  /// Returns a list of `CompanyModel` instances.
  Future<ApiResponseModel<List<CompanyModel>>> list() async {
    final url = "$_baseUrl/company/list";

    final payload = {
      'apiKey': _apiKey,
    };

    debugPrint("flutter_mon_sms_pro/company/list/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/company/list/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => (data as List<dynamic>)
          .map((e) => CompanyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return response;
  }
}
