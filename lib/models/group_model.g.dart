// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupModelAdapter extends TypeAdapter<GroupModel> {
  @override
  final typeId = 17;

  @override
  GroupModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupModel(
      id: fields[0] as String?,
      name: fields[1] as String,
      description: fields[2] as String?,
      createdAt: fields[3] as DateTime,
      userId: fields[4] as String,
      count: fields[5] as GroupCountModel?,
      contactInGroups: (fields[6] as List?)?.cast<GroupContactListModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, GroupModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.userId)
      ..writeByte(5)
      ..write(obj.count)
      ..writeByte(6)
      ..write(obj.contactInGroups);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GroupCountModelAdapter extends TypeAdapter<GroupCountModel> {
  @override
  final typeId = 171;

  @override
  GroupCountModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupCountModel(
      contactInGroups: (fields[0] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, GroupCountModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.contactInGroups);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupCountModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
