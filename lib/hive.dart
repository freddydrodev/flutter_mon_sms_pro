import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/models.dart';
import 'package:mon_sms_pro/utils.dart';

Future initHiveAdapters() async {
  // Utility Types and Enums
  if (!Hive.isAdapterRegistered(CoordsAdapter().typeId)) {
    // typeId: 0
    Hive.registerAdapter(CoordsAdapter());
  }

  if (!Hive.isAdapterRegistered(ContactModelAdapter().typeId)) {
    // typeId: 2
    Hive.registerAdapter(ContactModelAdapter());
  }

  if (!Hive.isAdapterRegistered(OTPStatusAdapter().typeId)) {
    // typeId: 3
    Hive.registerAdapter(OTPStatusAdapter());
  }

  if (!Hive.isAdapterRegistered(OTPModelAdapter().typeId)) {
    // typeId: 4
    Hive.registerAdapter(OTPModelAdapter());
  }

  if (!Hive.isAdapterRegistered(SenderModelAdapter().typeId)) {
    // typeId: 5
    Hive.registerAdapter(SenderModelAdapter());
  }

  if (!Hive.isAdapterRegistered(SenderStatusAdapter().typeId)) {
    // typeId: 6
    Hive.registerAdapter(SenderStatusAdapter());
  }

  if (!Hive.isAdapterRegistered(SMSTypeAdapter().typeId)) {
    // typeId: 7
    Hive.registerAdapter(SMSTypeAdapter());
  }

  if (!Hive.isAdapterRegistered(SexTypeAdapter().typeId)) {
    // typeId: 8
    Hive.registerAdapter(SexTypeAdapter());
  }

  if (!Hive.isAdapterRegistered(CountryAdapter().typeId)) {
    // typeId: 9
    Hive.registerAdapter(CountryAdapter());
  }

  if (!Hive.isAdapterRegistered(TransactionTypeAdapter().typeId)) {
    // typeId: 10
    Hive.registerAdapter(TransactionTypeAdapter());
  }

  if (!Hive.isAdapterRegistered(TransactionStatusAdapter().typeId)) {
    // typeId: 11
    Hive.registerAdapter(TransactionStatusAdapter());
  }

  if (!Hive.isAdapterRegistered(PaymentMethodAdapter().typeId)) {
    // typeId: 12
    Hive.registerAdapter(PaymentMethodAdapter());
  }

  if (!Hive.isAdapterRegistered(OfferNameAdapter().typeId)) {
    // typeId: 13
    Hive.registerAdapter(OfferNameAdapter());
  }

  if (!Hive.isAdapterRegistered(LocationAdapter().typeId)) {
    // typeId: 14
    Hive.registerAdapter(LocationAdapter());
  }

  if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
    // typeId: 15
    Hive.registerAdapter(UserModelAdapter());
  }

  if (!Hive.isAdapterRegistered(CompanyTypeModelAdapter().typeId)) {
    // typeId: 16
    Hive.registerAdapter(CompanyTypeModelAdapter());
  }

  if (!Hive.isAdapterRegistered(GroupModelAdapter().typeId)) {
    // typeId: 17
    Hive.registerAdapter(GroupModelAdapter());
  }

  if (!Hive.isAdapterRegistered(GroupCountModelAdapter().typeId)) {
    // typeId: 171
    Hive.registerAdapter(GroupCountModelAdapter());
  }

  if (!Hive.isAdapterRegistered(GroupContactListModelAdapter().typeId)) {
    // typeId: 172
    Hive.registerAdapter(GroupContactListModelAdapter());
  }

  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    // typeId: 18
    Hive.registerAdapter(TransactionModelAdapter());
  }

  if (!Hive.isAdapterRegistered(OfferModelAdapter().typeId)) {
    // typeId: 19
    Hive.registerAdapter(OfferModelAdapter());
  }

  if (!Hive.isAdapterRegistered(TemplateModelAdapter().typeId)) {
    // typeId: 20
    Hive.registerAdapter(TemplateModelAdapter());
  }

  if (!Hive.isAdapterRegistered(VersionModelAdapter().typeId)) {
    // typeId: 21
    Hive.registerAdapter(VersionModelAdapter());
  }

  if (!Hive.isAdapterRegistered(FollowerModelAdapter().typeId)) {
    // typeId: 22
    Hive.registerAdapter(FollowerModelAdapter());
  }

  if (!Hive.isAdapterRegistered(CompanyFollowedModelAdapter().typeId)) {
    // typeId: 23
    Hive.registerAdapter(CompanyFollowedModelAdapter());
  }

  if (!Hive.isAdapterRegistered(ImportModelAdapter().typeId)) {
    // typeId: 24
    Hive.registerAdapter(ImportModelAdapter());
  }

  if (!Hive.isAdapterRegistered(CampaignRecurringDayModelAdapter().typeId)) {
    // typeId: 25
    Hive.registerAdapter(CampaignRecurringDayModelAdapter());
  }

  if (!Hive.isAdapterRegistered(CampaignModelAdapter().typeId)) {
    // typeId: 26
    Hive.registerAdapter(CampaignModelAdapter());
  }
}
