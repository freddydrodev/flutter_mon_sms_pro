import 'package:dio/dio.dart';
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
  Future<List<CampaignModel>> list(CampaignListPayload payload) async {
    final url = "$_baseUrl/sender/${payload.senderId}/campaign";

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    if (r.data['error'] != null) return [];

    final list = r.data['data'] as List;

    return List.generate(
      list.length,
      (i) => CampaignModel.fromJson(list[i]),
    );
  }

  /// Creates a new campaign.
  ///
  /// [payload] contains the campaign creation data.
  /// Returns the created `CampaignModel` instance.
  Future<CampaignModel?> create(CreateCampaignPayload payload) async {
    final url = "$_baseUrl/campaign/create";

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    if (r.data['error'] != null) return null;

    final data = r.data['data'];

    return CampaignModel.fromJson(data);
  }
}
