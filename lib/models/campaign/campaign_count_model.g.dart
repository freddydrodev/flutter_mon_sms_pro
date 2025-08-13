// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_count_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CampaignCountModelAdapter extends TypeAdapter<CampaignCountModel> {
  @override
  final typeId = 100;

  @override
  CampaignCountModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CampaignCountModel(
      contacts: (fields[0] as num).toInt(),
      groups: (fields[1] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, CampaignCountModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.contacts)
      ..writeByte(1)
      ..write(obj.groups);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CampaignCountModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
