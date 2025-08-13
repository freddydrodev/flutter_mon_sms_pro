// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final typeId = 15;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[0] as String?,
      emailAddress: fields[1] as String?,
      phoneNumber: fields[2] as String,
      password: fields[3] as String?,
      fullName: fields[4] as String,
      createdAt: fields[5] as DateTime,
      isAdmin: fields[6] == null ? false : fields[6] as bool,
      newUser: fields[7] == null ? true : fields[7] as bool,
      xoraiaID: fields[8] as String?,
      apiKey: fields[9] as String,
      token: fields[10] as String?,
      tokenExpirationDate: fields[11] as DateTime?,
      companyTypeId: fields[12] as String?,
      logo: fields[13] as String?,
      description: fields[14] as String?,
      address: fields[15] as String?,
      city: fields[16] as String?,
      country: fields[17] as Country?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.emailAddress)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.fullName)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.isAdmin)
      ..writeByte(7)
      ..write(obj.newUser)
      ..writeByte(8)
      ..write(obj.xoraiaID)
      ..writeByte(9)
      ..write(obj.apiKey)
      ..writeByte(10)
      ..write(obj.token)
      ..writeByte(11)
      ..write(obj.tokenExpirationDate)
      ..writeByte(12)
      ..write(obj.companyTypeId)
      ..writeByte(13)
      ..write(obj.logo)
      ..writeByte(14)
      ..write(obj.description)
      ..writeByte(15)
      ..write(obj.address)
      ..writeByte(16)
      ..write(obj.city)
      ..writeByte(17)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
