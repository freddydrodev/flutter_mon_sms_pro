// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utils.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoordsAdapter extends TypeAdapter<Coords> {
  @override
  final typeId = 8;

  @override
  Coords read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Coords(
      lon: (fields[0] as num).toDouble(),
      lat: (fields[1] as num).toDouble(),
      radius: (fields[2] as num?)?.toDouble(),
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

class LocationAdapter extends TypeAdapter<Location> {
  @override
  final typeId = 9;

  @override
  Location read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Location(
      lon: (fields[0] as num).toDouble(),
      lat: (fields[1] as num).toDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, Location obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lon)
      ..writeByte(1)
      ..write(obj.lat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SMSTypeAdapter extends TypeAdapter<SMSType> {
  @override
  final typeId = 1;

  @override
  SMSType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SMSType.sms;
      case 1:
        return SMSType.flash;
      case 2:
        return SMSType.scheduled;
      case 3:
        return SMSType.recurring;
      default:
        return SMSType.sms;
    }
  }

  @override
  void write(BinaryWriter writer, SMSType obj) {
    switch (obj) {
      case SMSType.sms:
        writer.writeByte(0);
      case SMSType.flash:
        writer.writeByte(1);
      case SMSType.scheduled:
        writer.writeByte(2);
      case SMSType.recurring:
        writer.writeByte(3);
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
  final typeId = 2;

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
      case SexType.f:
        writer.writeByte(1);
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

class CountryAdapter extends TypeAdapter<Country> {
  @override
  final typeId = 3;

  @override
  Country read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Country.ci;
      default:
        return Country.ci;
    }
  }

  @override
  void write(BinaryWriter writer, Country obj) {
    switch (obj) {
      case Country.ci:
        writer.writeByte(0);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransactionTypeAdapter extends TypeAdapter<TransactionType> {
  @override
  final typeId = 4;

  @override
  TransactionType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TransactionType.debited;
      case 1:
        return TransactionType.recharged;
      default:
        return TransactionType.debited;
    }
  }

  @override
  void write(BinaryWriter writer, TransactionType obj) {
    switch (obj) {
      case TransactionType.debited:
        writer.writeByte(0);
      case TransactionType.recharged:
        writer.writeByte(1);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransactionStatusAdapter extends TypeAdapter<TransactionStatus> {
  @override
  final typeId = 5;

  @override
  TransactionStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TransactionStatus.pending;
      case 1:
        return TransactionStatus.failed;
      case 2:
        return TransactionStatus.charged;
      default:
        return TransactionStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, TransactionStatus obj) {
    switch (obj) {
      case TransactionStatus.pending:
        writer.writeByte(0);
      case TransactionStatus.failed:
        writer.writeByte(1);
      case TransactionStatus.charged:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PaymentMethodAdapter extends TypeAdapter<PaymentMethod> {
  @override
  final typeId = 6;

  @override
  PaymentMethod read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PaymentMethod.omCi;
      case 1:
        return PaymentMethod.mtnCi;
      case 2:
        return PaymentMethod.moovCi;
      case 3:
        return PaymentMethod.cash;
      case 4:
        return PaymentMethod.iap;
      case 5:
        return PaymentMethod.builtIn;
      case 6:
        return PaymentMethod.otp;
      default:
        return PaymentMethod.omCi;
    }
  }

  @override
  void write(BinaryWriter writer, PaymentMethod obj) {
    switch (obj) {
      case PaymentMethod.omCi:
        writer.writeByte(0);
      case PaymentMethod.mtnCi:
        writer.writeByte(1);
      case PaymentMethod.moovCi:
        writer.writeByte(2);
      case PaymentMethod.cash:
        writer.writeByte(3);
      case PaymentMethod.iap:
        writer.writeByte(4);
      case PaymentMethod.builtIn:
        writer.writeByte(5);
      case PaymentMethod.otp:
        writer.writeByte(6);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentMethodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OfferNameAdapter extends TypeAdapter<OfferName> {
  @override
  final typeId = 7;

  @override
  OfferName read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return OfferName.starter;
      case 1:
        return OfferName.bronze;
      case 2:
        return OfferName.fer;
      case 3:
        return OfferName.or;
      case 4:
        return OfferName.diamant;
      case 5:
        return OfferName.vip;
      default:
        return OfferName.starter;
    }
  }

  @override
  void write(BinaryWriter writer, OfferName obj) {
    switch (obj) {
      case OfferName.starter:
        writer.writeByte(0);
      case OfferName.bronze:
        writer.writeByte(1);
      case OfferName.fer:
        writer.writeByte(2);
      case OfferName.or:
        writer.writeByte(3);
      case OfferName.diamant:
        writer.writeByte(4);
      case OfferName.vip:
        writer.writeByte(5);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OfferNameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
