// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_recurring_day_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CampaignRecurringDayModelAdapter
    extends TypeAdapter<CampaignRecurringDayModel> {
  @override
  final typeId = 25;

  @override
  CampaignRecurringDayModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CampaignRecurringDayModel(
      id: fields[0] as String?,
      enabled: fields[1] == null ? true : fields[1] as bool,
      monday: fields[2] as DateTime?,
      tuesday: fields[3] as DateTime?,
      wednesday: fields[4] as DateTime?,
      thursday: fields[5] as DateTime?,
      friday: fields[6] as DateTime?,
      saturday: fields[7] as DateTime?,
      sunday: fields[8] as DateTime?,
      campaignId: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CampaignRecurringDayModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.enabled)
      ..writeByte(2)
      ..write(obj.monday)
      ..writeByte(3)
      ..write(obj.tuesday)
      ..writeByte(4)
      ..write(obj.wednesday)
      ..writeByte(5)
      ..write(obj.thursday)
      ..writeByte(6)
      ..write(obj.friday)
      ..writeByte(7)
      ..write(obj.saturday)
      ..writeByte(8)
      ..write(obj.sunday)
      ..writeByte(9)
      ..write(obj.campaignId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CampaignRecurringDayModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
