import 'package:dio/dio.dart';
import 'package:mon_sms_pro/models/campain_model.dart';
import 'package:mon_sms_pro/payload/campain_payload.dart';

/// A class to handle API interactions related to campaigns.
class CampainApi {
  final Dio _dio;
  final String _baseUrl;
  final String _apiKey;

  /// Constructs a CampainApi instance.
  ///
  /// [dio] is the Dio client for making HTTP requests.
  /// [baseUrl] is the base URL of the API.
  /// [apiKey] is the API key used for authentication.
  const CampainApi({
    required Dio dio,
    required String baseUrl,
    required String apiKey,
  })  : _dio = dio,
        _apiKey = apiKey,
        _baseUrl = baseUrl;

  /// Fetches a list of campaigns.
  ///
  /// [payload] contains optional parameters for filtering the list.
  /// Returns a list of `CampainModel` instances.
  Future<List<CampainModel>> list(CampainListPayload payload) async {
    final url = "$_baseUrl/sender/${payload.senderId}/campain";

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    if (r.data['error'] != null) return [];

    final list = r.data['data'] as List;

    return List.generate(
      list.length,
      (i) => CampainModel.fromJson(list[i]),
    );
  }

  /// Creates a new campaign.
  ///
  /// [payload] contains the campaign creation data.
  /// Returns the created `CampainModel` instance.
  Future<CampainModel?> create(CreateCampainPayload payload) async {
    final url = "$_baseUrl/campain/create";

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    if (r.data['error'] != null) return null;

    final data = r.data['data'];

    return CampainModel.fromJson(data);
  }
}
