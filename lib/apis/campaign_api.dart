import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mon_sms_pro/models/api_response_model.dart';
import 'package:mon_sms_pro/models/campaign/campaign_details_model.dart';
import 'package:mon_sms_pro/models/campaign/campaign_model.dart';
import 'package:mon_sms_pro/models/contact/contact_model.dart';
import 'package:mon_sms_pro/models/utils.dart';

/// A class to handle API interactions related to campaigns.
class CampaignApi {
  final Dio _dio;
  final String _baseUrl;
  final String _apiKey;

  /// Constructs a CampaignApi instance.
  ///
  /// [dio] is the Dio client for making HTTP requests.
  /// [baseUrl] is the base URL of the API.
  /// [apiKey] is the API key used for authentication.
  const CampaignApi({
    required Dio dio,
    required String baseUrl,
    required String apiKey,
  })  : _dio = dio,
        _apiKey = apiKey,
        _baseUrl = baseUrl;

  /// Fetches a list of campaigns.
  ///
  /// [senderId] is the ID of the sender to get campaigns for.
  /// Returns a list of `CampaignModel` instances.
  Future<ApiResponseModel<List<CampaignModel>>> list({
    required String senderId,
  }) async {
    final url = "$_baseUrl/sender/$senderId/campaign";

    final payload = {
      'senderId': senderId,
    };

    debugPrint("flutter_mon_sms_pro/campaign/list/payload: $payload");

    final r = await _dio.post(url, data: {
      ...payload,
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/campaign/list/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => (data as List<dynamic>)
          .map((e) => CampaignModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return response;
  }

  /// Fetches a list of campaigns.
  ///
  /// [campaignId] is the ID of the campaign to get details for.
  /// Returns a list of `CampaignModel` instances.
  Future<ApiResponseModel<CampaignDetailsModel>> get({
    required String id,
  }) async {
    final url = "$_baseUrl/campaign/$id";

    final payload = {
      'id': id,
    };

    debugPrint("flutter_mon_sms_pro/campaign/list/payload: $payload");

    final r = await _dio.post(url, data: {
      ...payload,
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/campaign/list/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => CampaignDetailsModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Creates a new campaign.
  ///
  /// [name] is the name of the campaign.
  /// [contacts] is the optional list of contacts for the campaign.
  /// [groupsIds] is the optional list of group IDs for the campaign.
  /// [text] is the optional text content of the campaign.
  /// [senderId] is the optional sender ID for the campaign.
  /// [type] is the optional SMS type (default: sms).
  /// [forceSenderId] is whether to force the sender ID (default: false).
  /// Returns the created `CampaignModel` instance.
  Future<ApiResponseModel<CampaignModel?>> create({
    required String name,
    List<ContactModel>? contacts = const [],
    List<String>? groupsIds = const [],
    String? text,
    String? senderId,
    SMSType? type = SMSType.sms,
    bool? forceSenderId = false,
  }) async {
    final url = "$_baseUrl/campaign/create";

    final payload = {
      'name': name,
      'contacts': contacts?.map((e) => e.toJson()).toList() ?? [],
      'groupsIds': groupsIds ?? [],
      if (text != null) 'text': text,
      if (senderId != null) 'senderId': senderId,
      if (type != null) 'type': type.value,
      'forceSenderId': forceSenderId ?? false,
    };

    debugPrint("flutter_mon_sms_pro/campaign/create/payload: $payload");

    final r = await _dio.post(url, data: {
      ...payload,
      "apiKey": _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/campaign/create/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
        r.data, (data) => CampaignModel.fromJson(data as Map<String, dynamic>));

    return response;
  }
}
