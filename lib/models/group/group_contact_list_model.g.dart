// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_contact_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupContactListModelAdapter extends TypeAdapter<GroupContactListModel> {
  @override
  final typeId = 172;

  @override
  GroupContactListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupContactListModel(
      contact: fields[0] as ContactModel,
    );
  }

  @override
  void write(BinaryWriter writer, GroupContactListModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.contact);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupContactListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
