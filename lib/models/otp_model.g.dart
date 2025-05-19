// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OTPModelAdapter extends TypeAdapter<OTPModel> {
  @override
  final typeId = 4;

  @override
  OTPModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OTPModel(
      token: fields[0] as String,
      phoneNumber: fields[1] as String,
      status: fields[2] as OTPStatus,
    );
  }

  @override
  void write(BinaryWriter writer, OTPModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OTPModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OTPStatusAdapter extends TypeAdapter<OTPStatus> {
  @override
  final typeId = 3;

  @override
  OTPStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return OTPStatus.pending;
      case 1:
        return OTPStatus.verified;
      case 2:
        return OTPStatus.demo;
      default:
        return OTPStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, OTPStatus obj) {
    switch (obj) {
      case OTPStatus.pending:
        writer.writeByte(0);
      case OTPStatus.verified:
        writer.writeByte(1);
      case OTPStatus.demo:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OTPStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
