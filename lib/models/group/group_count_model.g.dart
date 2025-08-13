// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_count_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

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
