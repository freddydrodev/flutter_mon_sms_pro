import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mon_sms_pro/mon_sms_pro.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

final sms = MonSMSPRO(
  apiKey: dotenv.env['SMS_API_KEY'] ?? "",
  baseUrl: dotenv.env['BASE_URL'] ?? "",
);

final localDB = Hive.box('SMS_EXAMPLE');
