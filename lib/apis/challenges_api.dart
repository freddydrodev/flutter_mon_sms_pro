import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mon_sms_pro/models/api_response_model.dart';
import 'package:mon_sms_pro/models/gamification/challenge_model.dart';
import 'package:mon_sms_pro/models/utils.dart';

/// A class to handle API interactions related to challenges (gamification).
class ChallengesApi {
  final Dio _dio;
  final String _baseUrl;
  final String _apiKey;

  /// Constructs a ChallengesApi instance.
  ///
  /// [dio] is the Dio client for making HTTP requests.
  /// [baseUrl] is the base URL of the API.
  /// [apiKey] is the API key used for authentication.
  const ChallengesApi({
    required Dio dio,
    required String baseUrl,
    required String apiKey,
  })  : _dio = dio,
        _apiKey = apiKey,
        _baseUrl = baseUrl;

  /// Lists available challenges.
  ///
  /// [companyId] is the company ID.
  /// [type] is an optional filter by challenge type.
  /// [status] is an optional filter by challenge status.
  /// Returns a list of `ChallengeModel` instances.
  Future<ApiResponseModel<List<ChallengeModel>>> list({
    required String companyId,
    ChallengeType? type,
    ChallengeStatus? status,
  }) async {
    final url = "$_baseUrl/challenges";

    final payload = {
      'apiKey': _apiKey,
      'companyId': companyId,
      if (type != null) 'type': type.value,
      if (status != null) 'status': status.value,
    };

    debugPrint("flutter_mon_sms_pro/challenges/list/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/challenges/list/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => (data as List<dynamic>)
          .map((e) => ChallengeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return response;
  }

  /// Gets details of a specific challenge.
  ///
  /// [id] is the ID of the challenge.
  /// [companyId] is the company ID.
  /// Returns the `ChallengeModel` instance with full details.
  Future<ApiResponseModel<ChallengeModel?>> get({
    required String id,
    required String companyId,
  }) async {
    final url = "$_baseUrl/challenges/$id";

    final payload = {
      'apiKey': _apiKey,
      'companyId': companyId,
    };

    debugPrint("flutter_mon_sms_pro/challenges/get/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/challenges/get/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => ChallengeModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Joins a challenge.
  ///
  /// [id] is the ID of the challenge to join.
  /// [companyId] is the company ID.
  /// Returns success status.
  Future<ApiResponseModel<bool?>> join({
    required String id,
    required String companyId,
  }) async {
    final url = "$_baseUrl/challenges/$id/join";

    final payload = {
      'apiKey': _apiKey,
      'companyId': companyId,
    };

    debugPrint("flutter_mon_sms_pro/challenges/join/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/challenges/join/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => (data as Map<String, dynamic>)['joined'] as bool?,
    );

    return response;
  }

  /// Leaves a challenge.
  ///
  /// [id] is the ID of the challenge to leave.
  /// [companyId] is the company ID.
  /// Returns success status.
  Future<ApiResponseModel<bool?>> leave({
    required String id,
    required String companyId,
  }) async {
    final url = "$_baseUrl/challenges/$id/leave";

    final payload = {
      'apiKey': _apiKey,
      'companyId': companyId,
    };

    debugPrint("flutter_mon_sms_pro/challenges/leave/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/challenges/leave/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => (data as Map<String, dynamic>)['left'] as bool?,
    );

    return response;
  }

  /// Gets the leaderboard for a challenge.
  ///
  /// [id] is the ID of the challenge.
  /// [companyId] is the company ID.
  /// Returns a list of `ChallengeLeaderboardEntryModel` instances.
  Future<ApiResponseModel<List<ChallengeLeaderboardEntryModel>>> leaderboard({
    required String id,
    required String companyId,
  }) async {
    final url = "$_baseUrl/challenges/$id/leaderboard";

    final payload = {
      'apiKey': _apiKey,
      'companyId': companyId,
    };

    debugPrint("flutter_mon_sms_pro/challenges/leaderboard/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/challenges/leaderboard/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => (data as List<dynamic>)
          .map((e) =>
              ChallengeLeaderboardEntryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return response;
  }

  /// Claims XP reward for completing a task.
  ///
  /// [id] is the ID of the challenge.
  /// [taskKey] is the key of the task to claim.
  /// [companyId] is the company ID.
  /// Returns the updated `ChallengeModel` instance.
  Future<ApiResponseModel<ChallengeModel?>> claimTask({
    required String id,
    required String taskKey,
    required String companyId,
  }) async {
    final url = "$_baseUrl/challenges/$id/tasks/$taskKey/claim";

    final payload = {
      'apiKey': _apiKey,
      'companyId': companyId,
    };

    debugPrint("flutter_mon_sms_pro/challenges/claimTask/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/challenges/claimTask/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => ChallengeModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Claims a community reward.
  ///
  /// [id] is the ID of the challenge.
  /// [rewardIndex] is the index of the reward to claim.
  /// [companyId] is the company ID.
  /// Returns success status.
  Future<ApiResponseModel<bool?>> claimReward({
    required String id,
    required int rewardIndex,
    required String companyId,
  }) async {
    final url = "$_baseUrl/challenges/$id/rewards/$rewardIndex/claim";

    final payload = {
      'apiKey': _apiKey,
      'companyId': companyId,
    };

    debugPrint("flutter_mon_sms_pro/challenges/claimReward/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/challenges/claimReward/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => (data as Map<String, dynamic>)['claimed'] as bool?,
    );

    return response;
  }
}
