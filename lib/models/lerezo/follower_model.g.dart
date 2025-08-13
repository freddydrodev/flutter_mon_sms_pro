// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follower_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FollowerModelAdapter extends TypeAdapter<FollowerModel> {
  @override
  final typeId = 502;

  @override
  FollowerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FollowerModel(
      id: fields[0] as String?,
      phoneNumber: fields[1] as String,
      password: fields[2] as String?,
      name: fields[3] as String,
      photo: fields[4] as String?,
      apiKey: fields[5] as String,
      location: fields[6] as Location?,
      notificationToken: fields[7] as String?,
      country: fields[8] as Country?,
      createdAt: fields[9] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, FollowerModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.photo)
      ..writeByte(5)
      ..write(obj.apiKey)
      ..writeByte(6)
      ..write(obj.location)
      ..writeByte(7)
      ..write(obj.notificationToken)
      ..writeByte(8)
      ..write(obj.country)
      ..writeByte(9)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FollowerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
