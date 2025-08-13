// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CampaignModelAdapter extends TypeAdapter<CampaignModel> {
  @override
  final typeId = 101;

  @override
  CampaignModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CampaignModel(
      id: fields[0] as String,
      text: fields[1] as String,
      isEnabled: fields[2] == null ? false : fields[2] as bool?,
      type: fields[3] as SMSType,
      contactCount: (fields[4] as num).toInt(),
      creditUsed: (fields[5] as num).toInt(),
      createdAt: fields[6] as DateTime,
      count: fields[7] as CampaignCountModel,
    );
  }

  @override
  void write(BinaryWriter writer, CampaignModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.isEnabled)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.contactCount)
      ..writeByte(5)
      ..write(obj.creditUsed)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.count);
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
