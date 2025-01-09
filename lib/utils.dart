import 'package:hive/hive.dart';

part 'utils.g.dart';

@HiveType(typeId: 7)
enum SMSType {
  @HiveField(0)
  sms('SMS'),
  @HiveField(1)
  flash('FLASH');

  const SMSType(this.value);

  final String value;
}

@HiveType(typeId: 8)
enum SexType {
  @HiveField(0)
  m('M'),
  @HiveField(1)
  f('F');

  const SexType(this.value);

  final String value;
}
