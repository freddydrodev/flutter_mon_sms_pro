// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OfferModelAdapter extends TypeAdapter<OfferModel> {
  @override
  final typeId = 19;

  @override
  OfferModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OfferModel(
      id: fields[0] as String?,
      name: fields[1] as OfferName,
      price: (fields[2] as num).toInt(),
      credit: (fields[3] as num).toInt(),
      createdAt: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, OfferModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.credit)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OfferModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
