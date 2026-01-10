import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/campaign/campaign_count_model.dart';
import 'package:mon_sms_pro/models/campaign/campaign_details_model.dart';
import 'package:mon_sms_pro/models/campaign/campaign_model.dart';
import 'package:mon_sms_pro/models/campaign/campaign_recurring_day_model.dart';
import 'package:mon_sms_pro/models/company/company_model.dart';
import 'package:mon_sms_pro/models/company/verify_id_model.dart';
import 'package:mon_sms_pro/models/contact/contact_model.dart';
import 'package:mon_sms_pro/models/core/import_model.dart';
import 'package:mon_sms_pro/models/core/offer_model.dart';
import 'package:mon_sms_pro/models/core/otp_model.dart';
import 'package:mon_sms_pro/models/core/user_model.dart';
import 'package:mon_sms_pro/models/core/version_model.dart';
import 'package:mon_sms_pro/models/device/device_model.dart';
import 'package:mon_sms_pro/models/gamification/challenge_model.dart';
import 'package:mon_sms_pro/models/gamification/daily_task_model.dart';
import 'package:mon_sms_pro/models/gamification/game_profile_model.dart';
import 'package:mon_sms_pro/models/group/group_count_model.dart';
import 'package:mon_sms_pro/models/group/group_model.dart';
import 'package:mon_sms_pro/models/lerezo/company_followed_model.dart';
import 'package:mon_sms_pro/models/lerezo/company_type_model.dart';
import 'package:mon_sms_pro/models/lerezo/follower_model.dart';
import 'package:mon_sms_pro/models/sender/sender_model.dart';
import 'package:mon_sms_pro/models/template/template_model.dart';
import 'package:mon_sms_pro/models/transaction/transaction_model.dart';
import 'package:mon_sms_pro/models/utils.dart';
part 'hive_registrar.g.dart';

@GenerateAdapters([
  // Existing enums
  AdapterSpec<OTPStatus>(),
  AdapterSpec<SMSType>(),
  AdapterSpec<SexType>(),
  AdapterSpec<Country>(),
  AdapterSpec<TransactionType>(),
  AdapterSpec<TransactionStatus>(),
  AdapterSpec<PaymentMethod>(),
  AdapterSpec<OfferName>(),
  AdapterSpec<SenderStatus>(),
  // New enums
  AdapterSpec<OTPMode>(),
  AdapterSpec<DeviceType>(),
  AdapterSpec<SmsType>(),
  AdapterSpec<TransactionPeriod>(),
  AdapterSpec<VerifyIdStatus>(),
  AdapterSpec<CompanyVerificationStatus>(),
  AdapterSpec<ChallengeType>(),
  AdapterSpec<ChallengeStatus>(),
  AdapterSpec<DailyTaskCriteriaType>(),
  // Existing models
  AdapterSpec<TransactionModel>(),
  AdapterSpec<ContactModel>(),
  AdapterSpec<VersionModel>(),
  AdapterSpec<ImportModel>(),
  AdapterSpec<UserModel>(),
  AdapterSpec<OfferModel>(),
  AdapterSpec<OTPModel>(),
  AdapterSpec<GroupModel>(),
  AdapterSpec<GroupCountModel>(),
  AdapterSpec<Coords>(),
  AdapterSpec<Location>(),
  AdapterSpec<SenderModel>(),
  AdapterSpec<TemplateModel>(),
  AdapterSpec<CompanyTypeModel>(),
  AdapterSpec<CompanyFollowedModel>(),
  AdapterSpec<FollowerModel>(),
  AdapterSpec<CampaignCountModel>(),
  AdapterSpec<CampaignRecurringDayModel>(),
  AdapterSpec<CampaignModel>(),
  AdapterSpec<CampaignDetailsModel>(),
  // New models
  AdapterSpec<DeviceModel>(),
  AdapterSpec<CompanyModel>(),
  AdapterSpec<VerifyIdModel>(),
  AdapterSpec<ChallengeModel>(),
  AdapterSpec<ChallengeTaskModel>(),
  AdapterSpec<ChallengeRewardModel>(),
  AdapterSpec<ChallengeLeaderboardEntryModel>(),
  AdapterSpec<DailyTaskModel>(),
  AdapterSpec<GameProfileModel>(),
])
class HiveRegistrar {}
