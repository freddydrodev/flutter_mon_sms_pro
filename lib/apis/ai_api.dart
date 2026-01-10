import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mon_sms_pro/models/api_response_model.dart';

/// Response model for AI URL shortening.
class AIUrlResponse {
  final String original;
  final String processed;

  AIUrlResponse({
    required this.original,
    required this.processed,
  });

  factory AIUrlResponse.fromJson(Map<String, dynamic> json) {
    return AIUrlResponse(
      original: json['original'],
      processed: json['processed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'original': original,
      'processed': processed,
    };
  }
}

/// A class to handle API interactions related to AI features.
/// Note: AI endpoints do not require API key authentication.
class AIApi {
  final Dio _dio;
  final String _baseUrl;

  /// Constructs an AIApi instance.
  ///
  /// [dio] is the Dio client for making HTTP requests.
  /// [baseUrl] is the base URL of the API.
  /// [apiKey] is kept for API consistency but not used by AI endpoints.
  const AIApi({
    required Dio dio,
    required String baseUrl,
    required String apiKey,
  })  : _dio = dio,
        _baseUrl = baseUrl;

  /// Shortens URLs in a message.
  ///
  /// [message] is the message containing URLs to shorten.
  /// Returns an `AIUrlResponse` with original and processed message.
  Future<ApiResponseModel<AIUrlResponse?>> shortenUrl({
    required String message,
  }) async {
    final url = "$_baseUrl/ai/url";

    final payload = {
      'message': message,
    };

    debugPrint("flutter_mon_sms_pro/ai/url/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/ai/url/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => AIUrlResponse.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Optimizes an SMS message using AI.
  ///
  /// [message] is the message to optimize.
  /// [language] is the target language (e.g., 'fr', 'en').
  /// [abbreviation] whether to use abbreviations to shorten the message.
  /// [latinize] whether to remove accents/special characters.
  /// Returns the optimized message string.
  Future<ApiResponseModel<String?>> optimizeMessage({
    required String message,
    required String language,
    bool? abbreviation,
    bool? latinize,
  }) async {
    final url = "$_baseUrl/ai/msg";

    final payload = {
      'message': message,
      'language': language,
      if (abbreviation != null) 'abbreviation': abbreviation,
      if (latinize != null) 'latinize': latinize,
    };

    debugPrint("flutter_mon_sms_pro/ai/msg/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/ai/msg/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => data as String,
    );

    return response;
  }

  /// Shortens URLs in a message (legacy endpoint).
  ///
  /// [message] is the message containing URLs to shorten.
  /// Returns an `AIUrlResponse` with original and processed message.
  Future<ApiResponseModel<AIUrlResponse?>> processMessage({
    required String message,
  }) async {
    final url = "$_baseUrl/ai";

    final payload = {
      'message': message,
    };

    debugPrint("flutter_mon_sms_pro/ai/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/ai/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => AIUrlResponse.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }
}
