// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utils.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SMSTypeAdapter extends TypeAdapter<SMSType> {
  @override
  final int typeId = 7;

  @override
  SMSType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SMSType.sms;
      case 1:
        return SMSType.flash;
      default:
        return SMSType.sms;
    }
  }

  @override
  void write(BinaryWriter writer, SMSType obj) {
    switch (obj) {
      case SMSType.sms:
        writer.writeByte(0);
        break;
      case SMSType.flash:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SMSTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SexTypeAdapter extends TypeAdapter<SexType> {
  @override
  final int typeId = 8;

  @override
  SexType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SexType.m;
      case 1:
        return SexType.f;
      default:
        return SexType.m;
    }
  }

  @override
  void write(BinaryWriter writer, SexType obj) {
    switch (obj) {
      case SexType.m:
        writer.writeByte(0);
        break;
      case SexType.f:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SexTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
