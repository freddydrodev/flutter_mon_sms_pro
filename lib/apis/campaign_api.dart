import 'package:dio/dio.dart';
import 'package:mon_sms_pro/models/api_response_model.dart';
import 'package:mon_sms_pro/models/campaign/campaign_model.dart';
import 'package:mon_sms_pro/payload/campaign_payload.dart';

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
  /// [payload] contains optional parameters for filtering the list.
  /// Returns a list of `CampaignModel` instances.
  Future<ApiResponseModel<List<CampaignModel>>> list(
      CampaignListPayload payload) async {
    final url = "$_baseUrl/sender/${payload.senderId}/campaign";

    print("flutter_mon_sms_pro/campaign/list/payload: ${payload.toJson()}");

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    print("flutter_mon_sms_pro/campaign/list/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (json) => (json as List).map((e) => CampaignModel.fromJson(e)).toList(),
    );

    return response;
  }

  /// Creates a new campaign.
  ///
  /// [payload] contains the campaign creation data.
  /// Returns the created `CampaignModel` instance.
  Future<ApiResponseModel<CampaignModel?>> create(
      CreateCampaignPayload payload) async {
    final url = "$_baseUrl/campaign/create";

    print("flutter_mon_sms_pro/campaign/create/payload: ${payload.toJson()}");

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    print("flutter_mon_sms_pro/campaign/create/data: ${r.data}");

    final response = ApiResponseModel.fromJson(r.data, CampaignModel.fromJson);

    return response;
  }
}
