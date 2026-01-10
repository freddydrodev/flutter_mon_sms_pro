import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mon_sms_pro/models/api_response_model.dart';
import 'package:mon_sms_pro/models/gamification/daily_task_model.dart';
import 'package:mon_sms_pro/models/gamification/game_profile_model.dart';

/// A class to handle API interactions related to daily tasks (gamification).
class DailyTasksApi {
  final Dio _dio;
  final String _baseUrl;
  final String _apiKey;

  /// Constructs a DailyTasksApi instance.
  ///
  /// [dio] is the Dio client for making HTTP requests.
  /// [baseUrl] is the base URL of the API.
  /// [apiKey] is the API key used for authentication.
  const DailyTasksApi({
    required Dio dio,
    required String baseUrl,
    required String apiKey,
  })  : _dio = dio,
        _apiKey = apiKey,
        _baseUrl = baseUrl;

  /// Lists today's daily tasks for the user.
  ///
  /// [companyId] is the company ID.
  /// Returns a list of `DailyTaskModel` instances.
  Future<ApiResponseModel<List<DailyTaskModel>>> list({
    required String companyId,
  }) async {
    final url = "$_baseUrl/daily-tasks";

    final payload = {
      'apiKey': _apiKey,
      'companyId': companyId,
    };

    debugPrint("flutter_mon_sms_pro/daily-tasks/list/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/daily-tasks/list/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => (data as List<dynamic>)
          .map((e) => DailyTaskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return response;
  }

  /// Claims XP reward for completing a daily task.
  ///
  /// [taskKey] is the key of the task to claim.
  /// [companyId] is the company ID.
  /// Returns the claimed XP amount.
  Future<ApiResponseModel<int?>> claim({
    required String taskKey,
    required String companyId,
  }) async {
    final url = "$_baseUrl/daily-tasks/$taskKey/claim";

    final payload = {
      'apiKey': _apiKey,
      'companyId': companyId,
    };

    debugPrint("flutter_mon_sms_pro/daily-tasks/claim/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/daily-tasks/claim/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => (data as Map<String, dynamic>)['xpClaimed'] as int?,
    );

    return response;
  }

  /// Gets the user's game profile (XP, level, streak).
  ///
  /// [companyId] is the company ID.
  /// Returns the `GameProfileModel` instance.
  Future<ApiResponseModel<GameProfileModel?>> getProfile({
    required String companyId,
  }) async {
    final url = "$_baseUrl/daily-tasks/profile";

    final payload = {
      'apiKey': _apiKey,
      'companyId': companyId,
    };

    debugPrint("flutter_mon_sms_pro/daily-tasks/profile/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/daily-tasks/profile/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => GameProfileModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Claims the all-tasks-completed bonus.
  ///
  /// [companyId] is the company ID.
  /// Returns the bonus XP amount.
  Future<ApiResponseModel<int?>> claimBonus({
    required String companyId,
  }) async {
    final url = "$_baseUrl/daily-tasks/bonus/claim";

    final payload = {
      'apiKey': _apiKey,
      'companyId': companyId,
    };

    debugPrint("flutter_mon_sms_pro/daily-tasks/bonus/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/daily-tasks/bonus/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => (data as Map<String, dynamic>)['bonusXp'] as int?,
    );

    return response;
  }
}
