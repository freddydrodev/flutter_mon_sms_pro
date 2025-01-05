import 'package:dio/dio.dart';
import 'package:mon_sms_pro/models/sender_model.dart';
import 'package:mon_sms_pro/payload/sender_payload.dart';

/// A class to handle API interactions related to campaigns.
class SenderApi {
  final Dio _dio;
  final String _baseUrl;
  final String _apiKey;

  /// Constructs a SenderApi instance.
  ///
  /// [dio] is the Dio client for making HTTP requests.
  /// [baseUrl] is the base URL of the API.
  /// [apiKey] is the API key used for authentication.
  const SenderApi({
    required Dio dio,
    required String baseUrl,
    required String apiKey,
  })  : _dio = dio,
        _apiKey = apiKey,
        _baseUrl = baseUrl;

  /// Fetches a list of campaigns.
  ///
  /// [payload] contains optional parameters for filtering the list.
  /// Returns a list of `SenderModel` instances.
  Future<List<SenderModel>> list([SenderListPayload? payload]) async {
    final url = "$_baseUrl/sender/list";

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
      (i) => SenderModel.fromJson(list[i]),
    );
  }

  /// Creates a new campaign.
  ///
  /// [payload] contains the campaign creation data.
  /// Returns the created `SenderModel` instance.
  Future<SenderModel?> create(CreateSenderPayload payload) async {
    final url = "$_baseUrl/sender/create";

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    if (r.data['error'] != null) return null;

    final data = r.data['data'];

    return SenderModel.fromJson(data);
  }

  /// Retrieves a sender from the sender list.
  ///
  /// [payload] contains the ID of the sender to retrieve.
  /// Returns a `SenderModel` instance if successful, or `null` if there's an error.
  Future<SenderModel?> get(GetSenderPayload payload) async {
    final url = "$_baseUrl/sender/${payload.id}";

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    if (r.data['error'] != null) return null;

    final data = r.data['data'];

    return SenderModel.fromJson(data);
  }

  /// Updates a sender in the sender list.
  ///
  /// [payload] contains the updated sender data.
  /// Returns a `SenderModel` instance if successful, or `null` if there's an error.
  Future<SenderModel?> update(GetSenderPayload payload) async {
    final url = "$_baseUrl/sender/${payload.id}/update";

    final r = await _dio.post(url, data: {
      ...payload.toJson(),
      "apiKey": _apiKey,
    });

    if (r.data['error'] != null) return null;

    final data = r.data['data'];

    return SenderModel.fromJson(data);
  }
}
