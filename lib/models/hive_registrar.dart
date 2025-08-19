import 'package:hive_ce/hive.dart';

// Import all model files to ensure they are included in the build
import 'package:mon_sms_pro/models/utils.dart';
import 'package:mon_sms_pro/models/campaign/campaign_model.dart';
import 'package:mon_sms_pro/models/campaign/campaign_count_model.dart';
import 'package:mon_sms_pro/models/campaign/campaign_details_model.dart';
import 'package:mon_sms_pro/models/campaign/campaign_recurring_day_model.dart';
import 'package:mon_sms_pro/models/contact/contact_model.dart';
import 'package:mon_sms_pro/models/core/import_model.dart';
import 'package:mon_sms_pro/models/core/offer_model.dart';
import 'package:mon_sms_pro/models/core/otp_model.dart';
import 'package:mon_sms_pro/models/core/user_model.dart';
import 'package:mon_sms_pro/models/core/version_model.dart';
import 'package:mon_sms_pro/models/group/group_model.dart';
import 'package:mon_sms_pro/models/group/group_count_model.dart';
import 'package:mon_sms_pro/models/lerezo/company_followed_model.dart';
import 'package:mon_sms_pro/models/lerezo/company_type_model.dart';
import 'package:mon_sms_pro/models/lerezo/follower_model.dart';
import 'package:mon_sms_pro/models/sender/sender_model.dart';
import 'package:mon_sms_pro/models/template/template_model.dart';
import 'package:mon_sms_pro/models/transaction/transaction_model.dart';

part 'hive_registrar.g.dart';

@GenerateAdapters([
  // Enums
  AdapterSpec<SMSType>(),
  AdapterSpec<SexType>(),
  AdapterSpec<Country>(),
  AdapterSpec<TransactionType>(),
  AdapterSpec<TransactionStatus>(),
  AdapterSpec<PaymentMethod>(),
  AdapterSpec<OfferName>(),
  AdapterSpec<OTPStatus>(),
  AdapterSpec<SenderStatus>(),

  // Classes
  AdapterSpec<Coords>(),
  AdapterSpec<Location>(),
  AdapterSpec<CampaignModel>(),
  AdapterSpec<CampaignCountModel>(),
  AdapterSpec<CampaignDetailsModel>(),
  AdapterSpec<CampaignRecurringDayModel>(),
  AdapterSpec<ContactModel>(),
  AdapterSpec<ImportModel>(),
  AdapterSpec<OfferModel>(),
  AdapterSpec<OTPModel>(),
  AdapterSpec<UserModel>(),
  AdapterSpec<VersionModel>(),
  AdapterSpec<GroupModel>(),
  AdapterSpec<GroupCountModel>(),
  AdapterSpec<CompanyFollowedModel>(),
  AdapterSpec<CompanyTypeModel>(),
  AdapterSpec<FollowerModel>(),
  AdapterSpec<SenderModel>(),
  AdapterSpec<TemplateModel>(),
  AdapterSpec<TransactionModel>(),
])
class HiveRegistrar {}
