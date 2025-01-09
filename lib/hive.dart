import 'package:hive/hive.dart';
import 'package:mon_sms_pro/models/campain_model.dart';
import 'package:mon_sms_pro/models/contact_model.dart';
import 'package:mon_sms_pro/models/otp_model.dart';
import 'package:mon_sms_pro/models/sender_model.dart';
import 'package:mon_sms_pro/utils.dart';

Future initHiveAdapters() async {
  if (!Hive.isAdapterRegistered(CampainModelAdapter().typeId)) {
    Hive.registerAdapter(CampainModelAdapter());
  }

  if (!Hive.isAdapterRegistered(ContactModelAdapter().typeId)) {
    Hive.registerAdapter(ContactModelAdapter());
  }

  if (!Hive.isAdapterRegistered(OTPModelAdapter().typeId)) {
    Hive.registerAdapter(OTPModelAdapter());
  }

  if (!Hive.isAdapterRegistered(SenderModelAdapter().typeId)) {
    Hive.registerAdapter(SenderModelAdapter());
  }

  if (!Hive.isAdapterRegistered(OTPStatusAdapter().typeId)) {
    Hive.registerAdapter(OTPStatusAdapter());
  }

  if (!Hive.isAdapterRegistered(SenderStatusAdapter().typeId)) {
    Hive.registerAdapter(SenderStatusAdapter());
  }

  if (!Hive.isAdapterRegistered(SMSTypeAdapter().typeId)) {
    Hive.registerAdapter(SMSTypeAdapter());
  }

  if (!Hive.isAdapterRegistered(SexTypeAdapter().typeId)) {
    Hive.registerAdapter(SexTypeAdapter());
  }
}
