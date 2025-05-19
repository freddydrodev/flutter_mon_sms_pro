// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_followed_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyFollowedModelAdapter extends TypeAdapter<CompanyFollowedModel> {
  @override
  final typeId = 23;

  @override
  CompanyFollowedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyFollowedModel(
      id: fields[0] as String?,
      companyId: fields[1] as String,
      followerId: fields[2] as String,
      createdAt: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyFollowedModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.companyId)
      ..writeByte(2)
      ..write(obj.followerId)
      ..writeByte(3)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyFollowedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
