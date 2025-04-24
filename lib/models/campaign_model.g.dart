// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoordsAdapter extends TypeAdapter<Coords> {
  @override
  final int typeId = 0;

  @override
  Coords read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Coords(
      lon: fields[0] as double,
      lat: fields[1] as double,
      radius: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Coords obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.lon)
      ..writeByte(1)
      ..write(obj.lat)
      ..writeByte(2)
      ..write(obj.radius);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoordsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CampaignModelAdapter extends TypeAdapter<CampaignModel> {
  @override
  final int typeId = 1;

  @override
  CampaignModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CampaignModel(
      id: fields[0] as String,
      name: fields[1] as String,
      type: fields[2] as SMSType,
      contactList: fields[3] as String,
      contactCount: fields[4] as int,
      text: fields[5] as String,
      createdAt: fields[6] as DateTime,
      coords: fields[7] as Coords?,
    );
  }

  @override
  void write(BinaryWriter writer, CampaignModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.contactList)
      ..writeByte(4)
      ..write(obj.contactCount)
      ..writeByte(5)
      ..write(obj.text)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.coords);
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
