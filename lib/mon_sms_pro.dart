library mon_sms_pro;

import 'package:dio/dio.dart';
import 'package:mon_sms_pro/apis/ai_api.dart';
import 'package:mon_sms_pro/apis/campaign_api.dart';
import 'package:mon_sms_pro/apis/challenges_api.dart';
import 'package:mon_sms_pro/apis/company_api.dart';
import 'package:mon_sms_pro/apis/contact_api.dart';
import 'package:mon_sms_pro/apis/daily_tasks_api.dart';
import 'package:mon_sms_pro/apis/device_api.dart';
import 'package:mon_sms_pro/apis/follower_api.dart';
import 'package:mon_sms_pro/apis/group_api.dart';
import 'package:mon_sms_pro/apis/offer_api.dart';
import 'package:mon_sms_pro/apis/otp_api.dart';
import 'package:mon_sms_pro/apis/sender_api.dart';
import 'package:mon_sms_pro/apis/transaction_api.dart';
import 'package:mon_sms_pro/apis/user_api.dart';

export 'package:mon_sms_pro/models/init_hive_adapters.dart';
export 'package:mon_sms_pro/models/models.dart';

class MonSMSPRO {
  Dio get _dio => Dio();

  final String _apiKey;
  final String _baseUrl;

  const MonSMSPRO({required String apiKey, String? baseUrl})
      : _apiKey = apiKey,
        _baseUrl = baseUrl ?? "https://rest.monsms.pro/v1";

  /// Campaign management API
  CampaignApi get campaign => CampaignApi(
        baseUrl: _baseUrl,
        dio: _dio,
        apiKey: _apiKey,
      );

  /// OTP authentication API
  OtpApi get otp => OtpApi(
        baseUrl: _baseUrl,
        dio: _dio,
        apiKey: _apiKey,
      );

  /// Contact management API
  ContactApi get contact => ContactApi(
        baseUrl: _baseUrl,
        dio: _dio,
        apiKey: _apiKey,
      );

  /// Contact group management API
  GroupApi get group => GroupApi(
        baseUrl: _baseUrl,
        dio: _dio,
        apiKey: _apiKey,
      );

  /// Sender ID management API
  SenderApi get sender => SenderApi(
        baseUrl: _baseUrl,
        dio: _dio,
        apiKey: _apiKey,
      );

  /// User management API
  UserApi get user => UserApi(
        baseUrl: _baseUrl,
        dio: _dio,
        apiKey: _apiKey,
      );

  /// Transaction and payment API
  TransactionApi get transaction => TransactionApi(
        baseUrl: _baseUrl,
        dio: _dio,
        apiKey: _apiKey,
      );

  /// Credit offers API
  OfferApi get offer => OfferApi(
        baseUrl: _baseUrl,
        dio: _dio,
        apiKey: _apiKey,
      );

  /// Device management API
  DeviceApi get device => DeviceApi(
        baseUrl: _baseUrl,
        dio: _dio,
        apiKey: _apiKey,
      );

  /// Company management API
  CompanyApi get company => CompanyApi(
        baseUrl: _baseUrl,
        dio: _dio,
        apiKey: _apiKey,
      );

  /// AI message optimization API
  AIApi get ai => AIApi(
        baseUrl: _baseUrl,
        dio: _dio,
        apiKey: _apiKey,
      );

  /// Challenges (gamification) API
  ChallengesApi get challenges => ChallengesApi(
        baseUrl: _baseUrl,
        dio: _dio,
        apiKey: _apiKey,
      );

  /// Daily tasks (gamification) API
  DailyTasksApi get dailyTasks => DailyTasksApi(
        baseUrl: _baseUrl,
        dio: _dio,
        apiKey: _apiKey,
      );

  /// Follower/subscription (Le Rezo) API
  FollowerApi get follower => FollowerApi(
        baseUrl: _baseUrl,
        dio: _dio,
        apiKey: _apiKey,
      );
}
