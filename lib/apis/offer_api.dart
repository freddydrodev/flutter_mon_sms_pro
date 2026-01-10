import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mon_sms_pro/models/api_response_model.dart';
import 'package:mon_sms_pro/models/core/offer_model.dart';

/// A class to handle API interactions related to offers.
class OfferApi {
  final Dio _dio;
  final String _baseUrl;
  final String _apiKey;

  /// Constructs an OfferApi instance.
  ///
  /// [dio] is the Dio client for making HTTP requests.
  /// [baseUrl] is the base URL of the API.
  /// [apiKey] is the API key used for authentication.
  const OfferApi({
    required Dio dio,
    required String baseUrl,
    required String apiKey,
  })  : _dio = dio,
        _apiKey = apiKey,
        _baseUrl = baseUrl;

  /// Fetches all available offers.
  ///
  /// Returns a list of `OfferModel` instances sorted by credit.
  Future<ApiResponseModel<List<OfferModel>>> list() async {
    final url = "$_baseUrl/offer";

    debugPrint("flutter_mon_sms_pro/offer/list/url: $url");

    final r = await _dio.get(url);

    debugPrint("flutter_mon_sms_pro/offer/list/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => (data as List<dynamic>)
          .map((e) => OfferModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return response;
  }

  /// Gets a specific offer by ID.
  ///
  /// [id] is the ID of the offer.
  /// Returns the `OfferModel` instance.
  Future<ApiResponseModel<OfferModel?>> get({
    required String id,
  }) async {
    final url = "$_baseUrl/offer/$id";

    debugPrint("flutter_mon_sms_pro/offer/get/url: $url");

    final r = await _dio.post(url, data: {
      'apiKey': _apiKey,
    });

    debugPrint("flutter_mon_sms_pro/offer/get/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => OfferModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }
}
