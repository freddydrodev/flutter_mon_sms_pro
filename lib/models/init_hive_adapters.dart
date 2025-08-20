import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:mon_sms_pro/models/hive_registrar.dart';

Future<void> initMonSMSProHiveAdapters() async {
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(OTPStatusAdapter().typeId)) {
    Hive.registerAdapter(OTPStatusAdapter());
  }
  if (!Hive.isAdapterRegistered(SMSTypeAdapter().typeId)) {
    Hive.registerAdapter(SMSTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(SexTypeAdapter().typeId)) {
    Hive.registerAdapter(SexTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(CountryAdapter().typeId)) {
    Hive.registerAdapter(CountryAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionTypeAdapter().typeId)) {
    Hive.registerAdapter(TransactionTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionStatusAdapter().typeId)) {
    Hive.registerAdapter(TransactionStatusAdapter());
  }
  if (!Hive.isAdapterRegistered(PaymentMethodAdapter().typeId)) {
    Hive.registerAdapter(PaymentMethodAdapter());
  }
  if (!Hive.isAdapterRegistered(OfferNameAdapter().typeId)) {
    Hive.registerAdapter(OfferNameAdapter());
  }
  if (!Hive.isAdapterRegistered(SenderStatusAdapter().typeId)) {
    Hive.registerAdapter(SenderStatusAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }
  if (!Hive.isAdapterRegistered(ContactModelAdapter().typeId)) {
    Hive.registerAdapter(ContactModelAdapter());
  }
  if (!Hive.isAdapterRegistered(VersionModelAdapter().typeId)) {
    Hive.registerAdapter(VersionModelAdapter());
  }
  if (!Hive.isAdapterRegistered(ImportModelAdapter().typeId)) {
    Hive.registerAdapter(ImportModelAdapter());
  }
  if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
    Hive.registerAdapter(UserModelAdapter());
  }
  if (!Hive.isAdapterRegistered(OfferModelAdapter().typeId)) {
    Hive.registerAdapter(OfferModelAdapter());
  }
  if (!Hive.isAdapterRegistered(OTPModelAdapter().typeId)) {
    Hive.registerAdapter(OTPModelAdapter());
  }
  if (!Hive.isAdapterRegistered(GroupModelAdapter().typeId)) {
    Hive.registerAdapter(GroupModelAdapter());
  }
  if (!Hive.isAdapterRegistered(GroupCountModelAdapter().typeId)) {
    Hive.registerAdapter(GroupCountModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CoordsAdapter().typeId)) {
    Hive.registerAdapter(CoordsAdapter());
  }
  if (!Hive.isAdapterRegistered(LocationAdapter().typeId)) {
    Hive.registerAdapter(LocationAdapter());
  }
  if (!Hive.isAdapterRegistered(SenderModelAdapter().typeId)) {
    Hive.registerAdapter(SenderModelAdapter());
  }
  if (!Hive.isAdapterRegistered(TemplateModelAdapter().typeId)) {
    Hive.registerAdapter(TemplateModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CompanyTypeModelAdapter().typeId)) {
    Hive.registerAdapter(CompanyTypeModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CompanyFollowedModelAdapter().typeId)) {
    Hive.registerAdapter(CompanyFollowedModelAdapter());
  }
  if (!Hive.isAdapterRegistered(FollowerModelAdapter().typeId)) {
    Hive.registerAdapter(FollowerModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CampaignCountModelAdapter().typeId)) {
    Hive.registerAdapter(CampaignCountModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CampaignRecurringDayModelAdapter().typeId)) {
    Hive.registerAdapter(CampaignRecurringDayModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CampaignModelAdapter().typeId)) {
    Hive.registerAdapter(CampaignModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CampaignDetailsModelAdapter().typeId)) {
    Hive.registerAdapter(CampaignDetailsModelAdapter());
  }
}
