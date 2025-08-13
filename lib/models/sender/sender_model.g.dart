// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sender_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SenderModelAdapter extends TypeAdapter<SenderModel> {
  @override
  final typeId = 601;

  @override
  SenderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SenderModel(
      id: fields[0] as String,
      name: fields[1] as String,
      status: fields[3] as SenderStatus,
      createdAt: fields[5] as DateTime,
      description: fields[2] as String?,
      archived: fields[4] == null ? false : fields[4] as bool?,
      userId: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SenderModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.archived)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SenderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SenderStatusAdapter extends TypeAdapter<SenderStatus> {
  @override
  final typeId = 600;

  @override
  SenderStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SenderStatus.pending;
      case 1:
        return SenderStatus.submited;
      case 2:
        return SenderStatus.accepted;
      case 3:
        return SenderStatus.refused;
      default:
        return SenderStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, SenderStatus obj) {
    switch (obj) {
      case SenderStatus.pending:
        writer.writeByte(0);
      case SenderStatus.submited:
        writer.writeByte(1);
      case SenderStatus.accepted:
        writer.writeByte(2);
      case SenderStatus.refused:
        writer.writeByte(3);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SenderStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
