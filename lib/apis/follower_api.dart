import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mon_sms_pro/models/api_response_model.dart';
import 'package:mon_sms_pro/models/lerezo/follower_model.dart';
import 'package:mon_sms_pro/models/lerezo/company_followed_model.dart';
import 'package:mon_sms_pro/models/company/company_model.dart';
import 'package:mon_sms_pro/models/campaign/campaign_model.dart';

/// A class to handle API interactions related to followers (Le Rezo).
/// Note: Follower endpoints use follower-specific authentication, not user API key.
class FollowerApi {
  final Dio _dio;
  final String _baseUrl;

  /// Constructs a FollowerApi instance.
  ///
  /// [dio] is the Dio client for making HTTP requests.
  /// [baseUrl] is the base URL of the API.
  /// [apiKey] is kept for API consistency but not used by follower endpoints.
  const FollowerApi({
    required Dio dio,
    required String baseUrl,
    required String apiKey,
  })  : _dio = dio,
        _baseUrl = baseUrl;

  /// Gets follower details by ID.
  ///
  /// [id] is the ID of the follower.
  /// Returns the `FollowerModel` instance.
  Future<ApiResponseModel<FollowerModel?>> get({
    required String id,
  }) async {
    final url = "$_baseUrl/follower/$id";

    final payload = {};

    debugPrint("flutter_mon_sms_pro/follower/get/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/follower/get/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => FollowerModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Gets a follower by phone number.
  ///
  /// [phoneNumber] is the phone number to search for.
  /// Returns the `FollowerModel` instance.
  Future<ApiResponseModel<FollowerModel?>> getByPhone({
    required String phoneNumber,
  }) async {
    final url = "$_baseUrl/follower/get-by-phone";

    final payload = {
      'phoneNumber': phoneNumber,
    };

    debugPrint("flutter_mon_sms_pro/follower/getByPhone/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/follower/getByPhone/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => FollowerModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Updates follower details.
  ///
  /// [id] is the ID of the follower.
  /// [name] is an optional new name.
  /// Returns the updated `FollowerModel` instance.
  Future<ApiResponseModel<FollowerModel?>> update({
    required String id,
    String? name,
  }) async {
    final url = "$_baseUrl/follower/$id/update";

    final payload = {
      if (name != null) 'name': name,
    };

    debugPrint("flutter_mon_sms_pro/follower/update/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/follower/update/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => FollowerModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Updates follower logo/photo.
  ///
  /// [id] is the ID of the follower.
  /// [logo] is the base64 encoded image or URL.
  /// Returns the updated `FollowerModel` instance.
  Future<ApiResponseModel<FollowerModel?>> updateLogo({
    required String id,
    required String logo,
  }) async {
    final url = "$_baseUrl/follower/$id/update/logo";

    final payload = {
      'logo': logo,
    };

    debugPrint("flutter_mon_sms_pro/follower/updateLogo/payload: updating logo");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/follower/updateLogo/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => FollowerModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Gets the list of companies a follower is following.
  ///
  /// [id] is the ID of the follower.
  /// Returns a list of `CompanyFollowedModel` instances.
  Future<ApiResponseModel<List<CompanyFollowedModel>>> following({
    required String id,
  }) async {
    final url = "$_baseUrl/follower/$id/following";

    final payload = {};

    debugPrint("flutter_mon_sms_pro/follower/following/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/follower/following/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => (data as List<dynamic>)
          .map((e) => CompanyFollowedModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return response;
  }

  /// Gets details of a specific company being followed.
  ///
  /// [id] is the ID of the follower.
  /// [companyId] is the ID of the company.
  /// Returns the `CompanyModel` instance.
  Future<ApiResponseModel<CompanyModel?>> getFollowedCompany({
    required String id,
    required String companyId,
  }) async {
    final url = "$_baseUrl/follower/$id/following/$companyId";

    final payload = {};

    debugPrint("flutter_mon_sms_pro/follower/getFollowedCompany/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/follower/getFollowedCompany/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => CompanyModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Subscribes to a company.
  ///
  /// [id] is the ID of the follower.
  /// [companyId] is the ID of the company to subscribe to.
  /// Returns the `CompanyFollowedModel` instance.
  Future<ApiResponseModel<CompanyFollowedModel?>> subscribe({
    required String id,
    required String companyId,
  }) async {
    final url = "$_baseUrl/follower/$id/following/$companyId/subscribe";

    final payload = {};

    debugPrint("flutter_mon_sms_pro/follower/subscribe/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/follower/subscribe/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => CompanyFollowedModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Unsubscribes from a company.
  ///
  /// [id] is the ID of the follower.
  /// [companyId] is the ID of the company to unsubscribe from.
  /// Returns success status.
  Future<ApiResponseModel<bool?>> unsubscribe({
    required String id,
    required String companyId,
  }) async {
    final url = "$_baseUrl/follower/$id/following/$companyId/unsubscribe";

    final payload = {};

    debugPrint("flutter_mon_sms_pro/follower/unsubscribe/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/follower/unsubscribe/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => (data as Map<String, dynamic>)['unsubscribed'] as bool?,
    );

    return response;
  }

  /// Gets campaigns from a followed company.
  ///
  /// [id] is the ID of the follower.
  /// [companyId] is the ID of the company.
  /// Returns a list of `CampaignModel` instances.
  Future<ApiResponseModel<List<CampaignModel>>> getCompanyCampaigns({
    required String id,
    required String companyId,
  }) async {
    final url = "$_baseUrl/follower/$id/following/$companyId/campaign";

    final payload = {};

    debugPrint("flutter_mon_sms_pro/follower/getCompanyCampaigns/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/follower/getCompanyCampaigns/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => (data as List<dynamic>)
          .map((e) => CampaignModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return response;
  }

  /// Checks if a phone number already exists (avoid duplicate).
  ///
  /// [phoneNumber] is the phone number to check.
  /// Returns true if the follower exists.
  Future<ApiResponseModel<bool?>> avoidDuplicate({
    required String phoneNumber,
  }) async {
    final url = "$_baseUrl/follower/avoid-duplicate";

    final payload = {
      'phoneNumber': phoneNumber,
    };

    debugPrint("flutter_mon_sms_pro/follower/avoidDuplicate/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/follower/avoidDuplicate/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => (data as Map<String, dynamic>)['exists'] as bool?,
    );

    return response;
  }
}
