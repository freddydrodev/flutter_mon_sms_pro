import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/utils.dart';
import 'package:mon_sms_pro/models/transaction/transaction_model.dart';
import 'package:mon_sms_pro/models/contact/contact_model.dart';
import 'package:mon_sms_pro/models/core/version_model.dart';
import 'package:mon_sms_pro/models/core/import_model.dart';
import 'package:mon_sms_pro/models/core/user_model.dart';
import 'package:mon_sms_pro/models/core/offer_model.dart';
import 'package:mon_sms_pro/models/core/otp_model.dart';
import 'package:mon_sms_pro/models/group/group_model.dart';
import 'package:mon_sms_pro/models/group/group_count_model.dart';
import 'package:mon_sms_pro/models/sender/sender_model.dart';
import 'package:mon_sms_pro/models/template/template_model.dart';
import 'package:mon_sms_pro/models/lerezo/company_type_model.dart';
import 'package:mon_sms_pro/models/lerezo/company_followed_model.dart';
import 'package:mon_sms_pro/models/lerezo/follower_model.dart';
import 'package:mon_sms_pro/models/campaign/campaign_count_model.dart';
import 'package:mon_sms_pro/models/campaign/campaign_recurring_day_model.dart';
import 'package:mon_sms_pro/models/campaign/campaign_model.dart';
import 'package:mon_sms_pro/models/campaign/campaign_details_model.dart';
part 'hive_registrar.g.dart';

@GenerateAdapters([
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
])
class HiveRegistrar {}
