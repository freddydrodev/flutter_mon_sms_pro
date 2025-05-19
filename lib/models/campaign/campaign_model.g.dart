// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CampaignModelAdapter extends TypeAdapter<CampaignModel> {
  @override
  final typeId = 26;

  @override
  CampaignModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CampaignModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      text: fields[2] as String,
      type: fields[3] as SMSType,
      scheduledDate: fields[4] as DateTime?,
      recurring: fields[5] as CampaignRecurringDayModel?,
      coords: fields[6] as Coords?,
      createdAt: fields[7] as DateTime,
      contactCount: (fields[8] as num).toInt(),
      contactList: fields[9] as String?,
      senderIdId: fields[10] as String?,
      userId: fields[11] as String,
      contactIds:
          fields[12] == null ? const [] : (fields[12] as List).cast<String>(),
      groupIds:
          fields[13] == null ? const [] : (fields[13] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, CampaignModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.text)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.scheduledDate)
      ..writeByte(5)
      ..write(obj.recurring)
      ..writeByte(6)
      ..write(obj.coords)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.contactCount)
      ..writeByte(9)
      ..write(obj.contactList)
      ..writeByte(10)
      ..write(obj.senderIdId)
      ..writeByte(11)
      ..write(obj.userId)
      ..writeByte(12)
      ..write(obj.contactIds)
      ..writeByte(13)
      ..write(obj.groupIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CampaignModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
