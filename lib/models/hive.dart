import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/models.dart';
import 'package:mon_sms_pro/models/utils.dart';
import 'package:flutter/foundation.dart';

Future initHiveAdapters() async {
  debugPrint("flutter_mon_sms_pro/hive/initHiveAdapters");

  // Utility Types and Enums from utils.dart
  if (!Hive.isAdapterRegistered(SMSTypeAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/sms_type/register");
    // typeId: 1
    Hive.registerAdapter(SMSTypeAdapter());
  }

  if (!Hive.isAdapterRegistered(SexTypeAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/sex_type/register");
    // typeId: 2
    Hive.registerAdapter(SexTypeAdapter());
  }

  if (!Hive.isAdapterRegistered(CountryAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/country/register");
    // typeId: 3
    Hive.registerAdapter(CountryAdapter());
  }

  if (!Hive.isAdapterRegistered(TransactionTypeAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/transaction_type/register");
    // typeId: 4
    Hive.registerAdapter(TransactionTypeAdapter());
  }

  if (!Hive.isAdapterRegistered(TransactionStatusAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/transaction_status/register");
    // typeId: 5
    Hive.registerAdapter(TransactionStatusAdapter());
  }

  if (!Hive.isAdapterRegistered(PaymentMethodAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/payment_method/register");
    // typeId: 6
    Hive.registerAdapter(PaymentMethodAdapter());
  }

  if (!Hive.isAdapterRegistered(OfferNameAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/offer_name/register");
    // typeId: 7
    Hive.registerAdapter(OfferNameAdapter());
  }

  if (!Hive.isAdapterRegistered(CoordsAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/coords/register");
    // typeId: 8
    Hive.registerAdapter(CoordsAdapter());
  }

  if (!Hive.isAdapterRegistered(LocationAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/location/register");
    // typeId: 9
    Hive.registerAdapter(LocationAdapter());
  }

  // Campaign Models
  if (!Hive.isAdapterRegistered(CampaignCountModelAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/campaign_count/register");
    // typeId: 100
    Hive.registerAdapter(CampaignCountModelAdapter());
  }

  if (!Hive.isAdapterRegistered(CampaignModelAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/campaign/register");
    // typeId: 101
    Hive.registerAdapter(CampaignModelAdapter());
  }

  if (!Hive.isAdapterRegistered(CampaignRecurringDayModelAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/campaign_recurring_day/register");
    // typeId: 102
    Hive.registerAdapter(CampaignRecurringDayModelAdapter());
  }

  // Contact Models
  if (!Hive.isAdapterRegistered(ContactModelAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/contact/register");
    // typeId: 200
    Hive.registerAdapter(ContactModelAdapter());
  }

  // Core Models
  if (!Hive.isAdapterRegistered(ImportModelAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/import/register");
    // typeId: 300
    Hive.registerAdapter(ImportModelAdapter());
  }

  if (!Hive.isAdapterRegistered(OfferModelAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/offer/register");
    // typeId: 301
    Hive.registerAdapter(OfferModelAdapter());
  }

  if (!Hive.isAdapterRegistered(OTPStatusAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/otp_status/register");
    // typeId: 302
    Hive.registerAdapter(OTPStatusAdapter());
  }

  if (!Hive.isAdapterRegistered(OTPModelAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/otp/register");
    // typeId: 303
    Hive.registerAdapter(OTPModelAdapter());
  }

  if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/user/register");
    // typeId: 304
    Hive.registerAdapter(UserModelAdapter());
  }

  if (!Hive.isAdapterRegistered(VersionModelAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/version/register");
    // typeId: 305
    Hive.registerAdapter(VersionModelAdapter());
  }

  if (!Hive.isAdapterRegistered(GroupCountModelAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/group_count/register");
    // typeId: 401
    Hive.registerAdapter(GroupCountModelAdapter());
  }

  if (!Hive.isAdapterRegistered(GroupModelAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/group/register");
    // typeId: 402
    Hive.registerAdapter(GroupModelAdapter());
  }

  // Lerezo Models
  if (!Hive.isAdapterRegistered(CompanyFollowedModelAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/company_followed/register");
    // typeId: 500
    Hive.registerAdapter(CompanyFollowedModelAdapter());
  }

  if (!Hive.isAdapterRegistered(CompanyTypeModelAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/company_type/register");
    // typeId: 501
    Hive.registerAdapter(CompanyTypeModelAdapter());
  }

  if (!Hive.isAdapterRegistered(FollowerModelAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/follower/register");
    // typeId: 502
    Hive.registerAdapter(FollowerModelAdapter());
  }

  // Sender Models
  if (!Hive.isAdapterRegistered(SenderStatusAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/sender_status/register");
    // typeId: 600
    Hive.registerAdapter(SenderStatusAdapter());
  }

  if (!Hive.isAdapterRegistered(SenderModelAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/sender/register");
    // typeId: 601
    Hive.registerAdapter(SenderModelAdapter());
  }

  // Template Models
  if (!Hive.isAdapterRegistered(TemplateModelAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/template/register");
    // typeId: 700
    Hive.registerAdapter(TemplateModelAdapter());
  }

  // Transaction Models
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    debugPrint("flutter_mon_sms_pro/hive/transaction/register");
    // typeId: 800
    Hive.registerAdapter(TransactionModelAdapter());
  }
}
