// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_registrar.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class CoordsAdapter extends TypeAdapter<Coords> {
  @override
  final typeId = 0;

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
  final typeId = 1;

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

class CampaignModelAdapter extends TypeAdapter<CampaignModel> {
  @override
  final typeId = 2;

  @override
  CampaignModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CampaignModel(
      id: fields[0] as String,
      text: fields[1] as String,
      isEnabled: fields[2] == null ? true : fields[2] as bool,
      type: fields[3] as SMSType,
      contactCount: (fields[4] as num).toInt(),
      creditUsed: (fields[5] as num).toInt(),
      createdAt: fields[6] as DateTime,
      count: fields[7] as CampaignCountModel,
      scheduledDate: fields[8] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, CampaignModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.isEnabled)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.contactCount)
      ..writeByte(5)
      ..write(obj.creditUsed)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.count)
      ..writeByte(8)
      ..write(obj.scheduledDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CampaignModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CampaignCountModelAdapter extends TypeAdapter<CampaignCountModel> {
  @override
  final typeId = 3;

  @override
  CampaignCountModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CampaignCountModel(
      contacts: (fields[0] as num).toInt(),
      groups: (fields[1] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, CampaignCountModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.contacts)
      ..writeByte(1)
      ..write(obj.groups);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CampaignCountModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CampaignRecurringDayModelAdapter
    extends TypeAdapter<CampaignRecurringDayModel> {
  @override
  final typeId = 4;

  @override
  CampaignRecurringDayModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CampaignRecurringDayModel(
      id: fields[0] as String,
      enabled: fields[1] == null ? true : fields[1] as bool,
      monday: fields[2] as DateTime?,
      tuesday: fields[3] as DateTime?,
      wednesday: fields[4] as DateTime?,
      thursday: fields[5] as DateTime?,
      friday: fields[6] as DateTime?,
      saturday: fields[7] as DateTime?,
      sunday: fields[8] as DateTime?,
      campaignId: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CampaignRecurringDayModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.enabled)
      ..writeByte(2)
      ..write(obj.monday)
      ..writeByte(3)
      ..write(obj.tuesday)
      ..writeByte(4)
      ..write(obj.wednesday)
      ..writeByte(5)
      ..write(obj.thursday)
      ..writeByte(6)
      ..write(obj.friday)
      ..writeByte(7)
      ..write(obj.saturday)
      ..writeByte(8)
      ..write(obj.sunday)
      ..writeByte(9)
      ..write(obj.campaignId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CampaignRecurringDayModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ContactModelAdapter extends TypeAdapter<ContactModel> {
  @override
  final typeId = 5;

  @override
  ContactModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContactModel(
      id: fields[1] as String?,
      phone: fields[0] as String,
      name: fields[2] as String?,
      firstName: fields[4] as String?,
      lastName: fields[5] as String?,
      sex: fields[6] as SexType?,
      userId: fields[7] as String?,
      companyId: fields[8] as String?,
      createdAt: fields[3] as DateTime?,
      updatedAt: fields[9] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ContactModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.phone)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.firstName)
      ..writeByte(5)
      ..write(obj.lastName)
      ..writeByte(6)
      ..write(obj.sex)
      ..writeByte(7)
      ..write(obj.userId)
      ..writeByte(8)
      ..write(obj.companyId)
      ..writeByte(9)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImportModelAdapter extends TypeAdapter<ImportModel> {
  @override
  final typeId = 6;

  @override
  ImportModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImportModel(
      id: fields[0] as String?,
      userId: fields[1] as String,
      createdAt: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ImportModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImportModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OfferModelAdapter extends TypeAdapter<OfferModel> {
  @override
  final typeId = 7;

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

class OTPModelAdapter extends TypeAdapter<OTPModel> {
  @override
  final typeId = 8;

  @override
  OTPModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OTPModel(
      id: fields[3] as String?,
      token: fields[0] as String,
      phoneNumber: fields[1] as String,
      status: fields[2] as OTPStatus,
      mode: fields[4] as OTPMode?,
      appName: fields[5] as String?,
      senderId: fields[6] as String?,
      userId: fields[7] as String?,
      createdAt: fields[8] as DateTime?,
      updatedAt: fields[9] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, OTPModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.mode)
      ..writeByte(5)
      ..write(obj.appName)
      ..writeByte(6)
      ..write(obj.senderId)
      ..writeByte(7)
      ..write(obj.userId)
      ..writeByte(8)
      ..write(obj.createdAt)
      ..writeByte(9)
      ..write(obj.updatedAt);
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

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final typeId = 9;

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
      updatedAt: fields[18] as DateTime?,
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
      availableCredit: fields[19] == null ? 0 : (fields[19] as num).toInt(),
      blocked: fields[20] == null ? false : fields[20] as bool,
      isVerified: fields[21] == null ? false : fields[21] as bool,
      codePromo: fields[22] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(23)
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
      ..write(obj.country)
      ..writeByte(18)
      ..write(obj.updatedAt)
      ..writeByte(19)
      ..write(obj.availableCredit)
      ..writeByte(20)
      ..write(obj.blocked)
      ..writeByte(21)
      ..write(obj.isVerified)
      ..writeByte(22)
      ..write(obj.codePromo);
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

class VersionModelAdapter extends TypeAdapter<VersionModel> {
  @override
  final typeId = 10;

  @override
  VersionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VersionModel(
      id: fields[0] as String?,
      name: fields[1] as String,
      description: fields[2] as String,
      isMajorRelease: fields[3] as bool,
      createdAt: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, VersionModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.isMajorRelease)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VersionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GroupModelAdapter extends TypeAdapter<GroupModel> {
  @override
  final typeId = 11;

  @override
  GroupModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupModel(
      id: fields[0] as String?,
      name: fields[1] as String,
      createdAt: fields[2] as DateTime,
      count: fields[3] as GroupCountModel?,
      contacts: (fields[4] as List?)?.cast<ContactModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, GroupModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.count)
      ..writeByte(4)
      ..write(obj.contacts);
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
  final typeId = 12;

  @override
  GroupCountModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupCountModel(
      contacts: (fields[0] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, GroupCountModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.contacts);
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

class CompanyFollowedModelAdapter extends TypeAdapter<CompanyFollowedModel> {
  @override
  final typeId = 13;

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

class CompanyTypeModelAdapter extends TypeAdapter<CompanyTypeModel> {
  @override
  final typeId = 14;

  @override
  CompanyTypeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyTypeModel(
      id: fields[0] as String?,
      name: fields[1] as String,
      createdAt: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyTypeModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyTypeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FollowerModelAdapter extends TypeAdapter<FollowerModel> {
  @override
  final typeId = 15;

  @override
  FollowerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FollowerModel(
      id: fields[0] as String?,
      phoneNumber: fields[1] as String,
      password: fields[2] as String?,
      name: fields[3] as String,
      photo: fields[4] as String?,
      apiKey: fields[5] as String,
      location: fields[6] as Location?,
      notificationToken: fields[7] as String?,
      country: fields[8] as Country?,
      createdAt: fields[9] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, FollowerModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.photo)
      ..writeByte(5)
      ..write(obj.apiKey)
      ..writeByte(6)
      ..write(obj.location)
      ..writeByte(7)
      ..write(obj.notificationToken)
      ..writeByte(8)
      ..write(obj.country)
      ..writeByte(9)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FollowerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SenderModelAdapter extends TypeAdapter<SenderModel> {
  @override
  final typeId = 16;

  @override
  SenderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SenderModel(
      id: fields[0] as String?,
      name: fields[1] as String,
      status: fields[3] as SenderStatus,
      createdAt: fields[5] as DateTime,
      updatedAt: fields[7] as DateTime?,
      description: fields[2] as String?,
      archived: fields[4] == null ? false : fields[4] as bool?,
      userId: fields[6] as String?,
      companyId: fields[8] as String?,
      companyTypeId: fields[9] as String?,
      example: fields[10] as String?,
      types: (fields[11] as List?)?.cast<SmsType>(),
    );
  }

  @override
  void write(BinaryWriter writer, SenderModel obj) {
    writer
      ..writeByte(12)
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
      ..write(obj.userId)
      ..writeByte(7)
      ..write(obj.updatedAt)
      ..writeByte(8)
      ..write(obj.companyId)
      ..writeByte(9)
      ..write(obj.companyTypeId)
      ..writeByte(10)
      ..write(obj.example)
      ..writeByte(11)
      ..write(obj.types);
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

class TemplateModelAdapter extends TypeAdapter<TemplateModel> {
  @override
  final typeId = 17;

  @override
  TemplateModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TemplateModel(
      id: fields[0] as String?,
      text: fields[1] as String,
      createdAt: fields[2] as DateTime,
      userId: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TemplateModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemplateModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransactionModelAdapter extends TypeAdapter<TransactionModel> {
  @override
  final typeId = 18;

  @override
  TransactionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionModel(
      id: fields[0] as String?,
      type: fields[1] as TransactionType,
      status: fields[2] as TransactionStatus,
      paymentMethod: fields[3] as PaymentMethod,
      token: fields[4] as String,
      credit: (fields[5] as num).toInt(),
      price: fields[6] == null ? 0 : (fields[6] as num).toInt(),
      createdAt: fields[7] as DateTime,
      updatedAt: fields[11] as DateTime?,
      userId: fields[8] as String,
      campaignId: fields[12] as String?,
      offerId: fields[10] as String?,
      companyId: fields[13] as String?,
      period: fields[14] as TransactionPeriod?,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.paymentMethod)
      ..writeByte(4)
      ..write(obj.token)
      ..writeByte(5)
      ..write(obj.credit)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.userId)
      ..writeByte(10)
      ..write(obj.offerId)
      ..writeByte(11)
      ..write(obj.updatedAt)
      ..writeByte(12)
      ..write(obj.campaignId)
      ..writeByte(13)
      ..write(obj.companyId)
      ..writeByte(14)
      ..write(obj.period);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CampaignDetailsModelAdapter extends TypeAdapter<CampaignDetailsModel> {
  @override
  final typeId = 29;

  @override
  CampaignDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CampaignDetailsModel(
      id: fields[0] as String,
      name: fields[1] as String,
      text: fields[2] as String,
      isEnabled: fields[3] as bool,
      type: fields[4] as SMSType,
      contactCount: (fields[5] as num).toInt(),
      creditUsed: (fields[6] as num).toInt(),
      coords: (fields[7] as Map?)?.cast<String, dynamic>(),
      recurring: fields[8] as CampaignRecurringDayModel?,
      scheduledDate: fields[9] as DateTime?,
      userId: fields[10] as String,
      createdAt: fields[11] as DateTime,
      updatedAt: fields[12] as DateTime,
      count: fields[13] as CampaignCountModel,
      contacts: (fields[14] as List).cast<ContactModel>(),
      groups: (fields[15] as List).cast<GroupModel>(),
      sender: fields[16] as SenderModel,
    );
  }

  @override
  void write(BinaryWriter writer, CampaignDetailsModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.text)
      ..writeByte(3)
      ..write(obj.isEnabled)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.contactCount)
      ..writeByte(6)
      ..write(obj.creditUsed)
      ..writeByte(7)
      ..write(obj.coords)
      ..writeByte(8)
      ..write(obj.recurring)
      ..writeByte(9)
      ..write(obj.scheduledDate)
      ..writeByte(10)
      ..write(obj.userId)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.updatedAt)
      ..writeByte(13)
      ..write(obj.count)
      ..writeByte(14)
      ..write(obj.contacts)
      ..writeByte(15)
      ..write(obj.groups)
      ..writeByte(16)
      ..write(obj.sender);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CampaignDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SMSTypeAdapter extends TypeAdapter<SMSType> {
  @override
  final typeId = 30;

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
  final typeId = 31;

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
  final typeId = 32;

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
  final typeId = 33;

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
  final typeId = 34;

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
  final typeId = 35;

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
      case 7:
        return PaymentMethod.waveCi;
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
      case PaymentMethod.waveCi:
        writer.writeByte(7);
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
  final typeId = 36;

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

class OTPStatusAdapter extends TypeAdapter<OTPStatus> {
  @override
  final typeId = 37;

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

class SenderStatusAdapter extends TypeAdapter<SenderStatus> {
  @override
  final typeId = 38;

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

class OTPModeAdapter extends TypeAdapter<OTPMode> {
  @override
  final typeId = 39;

  @override
  OTPMode read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return OTPMode.numeric;
      case 1:
        return OTPMode.alphabet;
      case 2:
        return OTPMode.alphaNumeric;
      default:
        return OTPMode.numeric;
    }
  }

  @override
  void write(BinaryWriter writer, OTPMode obj) {
    switch (obj) {
      case OTPMode.numeric:
        writer.writeByte(0);
      case OTPMode.alphabet:
        writer.writeByte(1);
      case OTPMode.alphaNumeric:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OTPModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DeviceTypeAdapter extends TypeAdapter<DeviceType> {
  @override
  final typeId = 40;

  @override
  DeviceType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DeviceType.android;
      case 1:
        return DeviceType.ios;
      case 2:
        return DeviceType.web;
      default:
        return DeviceType.android;
    }
  }

  @override
  void write(BinaryWriter writer, DeviceType obj) {
    switch (obj) {
      case DeviceType.android:
        writer.writeByte(0);
      case DeviceType.ios:
        writer.writeByte(1);
      case DeviceType.web:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SmsTypeAdapter extends TypeAdapter<SmsType> {
  @override
  final typeId = 41;

  @override
  SmsType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SmsType.promotional;
      case 1:
        return SmsType.transactional;
      case 2:
        return SmsType.otp;
      default:
        return SmsType.promotional;
    }
  }

  @override
  void write(BinaryWriter writer, SmsType obj) {
    switch (obj) {
      case SmsType.promotional:
        writer.writeByte(0);
      case SmsType.transactional:
        writer.writeByte(1);
      case SmsType.otp:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SmsTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransactionPeriodAdapter extends TypeAdapter<TransactionPeriod> {
  @override
  final typeId = 42;

  @override
  TransactionPeriod read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TransactionPeriod.year;
      case 1:
        return TransactionPeriod.month;
      case 2:
        return TransactionPeriod.week;
      case 3:
        return TransactionPeriod.day;
      case 4:
        return TransactionPeriod.none;
      default:
        return TransactionPeriod.year;
    }
  }

  @override
  void write(BinaryWriter writer, TransactionPeriod obj) {
    switch (obj) {
      case TransactionPeriod.year:
        writer.writeByte(0);
      case TransactionPeriod.month:
        writer.writeByte(1);
      case TransactionPeriod.week:
        writer.writeByte(2);
      case TransactionPeriod.day:
        writer.writeByte(3);
      case TransactionPeriod.none:
        writer.writeByte(4);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionPeriodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VerifyIdStatusAdapter extends TypeAdapter<VerifyIdStatus> {
  @override
  final typeId = 43;

  @override
  VerifyIdStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return VerifyIdStatus.pending;
      case 1:
        return VerifyIdStatus.verified;
      case 2:
        return VerifyIdStatus.approved;
      case 3:
        return VerifyIdStatus.refused;
      default:
        return VerifyIdStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, VerifyIdStatus obj) {
    switch (obj) {
      case VerifyIdStatus.pending:
        writer.writeByte(0);
      case VerifyIdStatus.verified:
        writer.writeByte(1);
      case VerifyIdStatus.approved:
        writer.writeByte(2);
      case VerifyIdStatus.refused:
        writer.writeByte(3);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VerifyIdStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CompanyVerificationStatusAdapter
    extends TypeAdapter<CompanyVerificationStatus> {
  @override
  final typeId = 44;

  @override
  CompanyVerificationStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CompanyVerificationStatus.pending;
      case 1:
        return CompanyVerificationStatus.approved;
      case 2:
        return CompanyVerificationStatus.refused;
      default:
        return CompanyVerificationStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, CompanyVerificationStatus obj) {
    switch (obj) {
      case CompanyVerificationStatus.pending:
        writer.writeByte(0);
      case CompanyVerificationStatus.approved:
        writer.writeByte(1);
      case CompanyVerificationStatus.refused:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyVerificationStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChallengeTypeAdapter extends TypeAdapter<ChallengeType> {
  @override
  final typeId = 45;

  @override
  ChallengeType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ChallengeType.weekly;
      case 1:
        return ChallengeType.monthly;
      case 2:
        return ChallengeType.special;
      default:
        return ChallengeType.weekly;
    }
  }

  @override
  void write(BinaryWriter writer, ChallengeType obj) {
    switch (obj) {
      case ChallengeType.weekly:
        writer.writeByte(0);
      case ChallengeType.monthly:
        writer.writeByte(1);
      case ChallengeType.special:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChallengeTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChallengeStatusAdapter extends TypeAdapter<ChallengeStatus> {
  @override
  final typeId = 46;

  @override
  ChallengeStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ChallengeStatus.upcoming;
      case 1:
        return ChallengeStatus.active;
      case 2:
        return ChallengeStatus.ended;
      default:
        return ChallengeStatus.upcoming;
    }
  }

  @override
  void write(BinaryWriter writer, ChallengeStatus obj) {
    switch (obj) {
      case ChallengeStatus.upcoming:
        writer.writeByte(0);
      case ChallengeStatus.active:
        writer.writeByte(1);
      case ChallengeStatus.ended:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChallengeStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DailyTaskCriteriaTypeAdapter extends TypeAdapter<DailyTaskCriteriaType> {
  @override
  final typeId = 47;

  @override
  DailyTaskCriteriaType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DailyTaskCriteriaType.smsSent;
      case 1:
        return DailyTaskCriteriaType.smsDelivered;
      case 2:
        return DailyTaskCriteriaType.contactsAdded;
      case 3:
        return DailyTaskCriteriaType.campaignsCreated;
      case 4:
        return DailyTaskCriteriaType.groupsCreated;
      case 5:
        return DailyTaskCriteriaType.appOpened;
      case 6:
        return DailyTaskCriteriaType.creditPurchased;
      default:
        return DailyTaskCriteriaType.smsSent;
    }
  }

  @override
  void write(BinaryWriter writer, DailyTaskCriteriaType obj) {
    switch (obj) {
      case DailyTaskCriteriaType.smsSent:
        writer.writeByte(0);
      case DailyTaskCriteriaType.smsDelivered:
        writer.writeByte(1);
      case DailyTaskCriteriaType.contactsAdded:
        writer.writeByte(2);
      case DailyTaskCriteriaType.campaignsCreated:
        writer.writeByte(3);
      case DailyTaskCriteriaType.groupsCreated:
        writer.writeByte(4);
      case DailyTaskCriteriaType.appOpened:
        writer.writeByte(5);
      case DailyTaskCriteriaType.creditPurchased:
        writer.writeByte(6);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyTaskCriteriaTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DeviceModelAdapter extends TypeAdapter<DeviceModel> {
  @override
  final typeId = 48;

  @override
  DeviceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeviceModel(
      id: fields[0] as String?,
      deviceId: fields[1] as String,
      type: fields[2] as DeviceType,
      notificationToken: fields[3] as String?,
      userId: fields[4] as String,
      companyId: fields[5] as String?,
      createdAt: fields[6] as DateTime,
      updatedAt: fields[7] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, DeviceModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.deviceId)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.notificationToken)
      ..writeByte(4)
      ..write(obj.userId)
      ..writeByte(5)
      ..write(obj.companyId)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CompanyModelAdapter extends TypeAdapter<CompanyModel> {
  @override
  final typeId = 49;

  @override
  CompanyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyModel(
      id: fields[0] as String?,
      name: fields[1] as String,
      description: fields[2] as String?,
      logo: fields[3] as String?,
      address: fields[4] as String?,
      city: fields[5] as String?,
      country: fields[6] as Country?,
      verificationStatus: fields[7] == null
          ? CompanyVerificationStatus.pending
          : fields[7] as CompanyVerificationStatus,
      verificationReason: fields[8] as String?,
      companyTypeId: fields[9] as String?,
      ownerId: fields[10] as String,
      createdAt: fields[11] as DateTime,
      updatedAt: fields[12] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.logo)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.city)
      ..writeByte(6)
      ..write(obj.country)
      ..writeByte(7)
      ..write(obj.verificationStatus)
      ..writeByte(8)
      ..write(obj.verificationReason)
      ..writeByte(9)
      ..write(obj.companyTypeId)
      ..writeByte(10)
      ..write(obj.ownerId)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VerifyIdModelAdapter extends TypeAdapter<VerifyIdModel> {
  @override
  final typeId = 50;

  @override
  VerifyIdModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VerifyIdModel(
      id: fields[0] as String?,
      userId: fields[1] as String,
      frontImage: fields[2] as String?,
      backImage: fields[3] as String?,
      status: fields[4] == null
          ? VerifyIdStatus.pending
          : fields[4] as VerifyIdStatus,
      reason: fields[5] as String?,
      createdAt: fields[6] as DateTime,
      updatedAt: fields[7] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, VerifyIdModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.frontImage)
      ..writeByte(3)
      ..write(obj.backImage)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.reason)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VerifyIdModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChallengeModelAdapter extends TypeAdapter<ChallengeModel> {
  @override
  final typeId = 51;

  @override
  ChallengeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChallengeModel(
      id: fields[0] as String?,
      name: fields[1] as String,
      description: fields[2] as String?,
      type: fields[3] as ChallengeType,
      status: fields[4] as ChallengeStatus,
      startDate: fields[5] as DateTime,
      endDate: fields[6] as DateTime,
      tasks: (fields[7] as List?)?.cast<ChallengeTaskModel>(),
      communityRewards: (fields[8] as List?)?.cast<ChallengeRewardModel>(),
      totalCommunityXp: fields[9] == null ? 0 : (fields[9] as num).toInt(),
      participantCount: fields[10] == null ? 0 : (fields[10] as num).toInt(),
      isJoined: fields[11] == null ? false : fields[11] as bool,
      userXp: fields[12] == null ? 0 : (fields[12] as num).toInt(),
      userRank: fields[13] == null ? 0 : (fields[13] as num).toInt(),
      createdAt: fields[14] as DateTime?,
      updatedAt: fields[15] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ChallengeModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.startDate)
      ..writeByte(6)
      ..write(obj.endDate)
      ..writeByte(7)
      ..write(obj.tasks)
      ..writeByte(8)
      ..write(obj.communityRewards)
      ..writeByte(9)
      ..write(obj.totalCommunityXp)
      ..writeByte(10)
      ..write(obj.participantCount)
      ..writeByte(11)
      ..write(obj.isJoined)
      ..writeByte(12)
      ..write(obj.userXp)
      ..writeByte(13)
      ..write(obj.userRank)
      ..writeByte(14)
      ..write(obj.createdAt)
      ..writeByte(15)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChallengeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChallengeTaskModelAdapter extends TypeAdapter<ChallengeTaskModel> {
  @override
  final typeId = 52;

  @override
  ChallengeTaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChallengeTaskModel(
      taskKey: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String?,
      targetValue: (fields[3] as num).toInt(),
      xpReward: (fields[4] as num).toInt(),
      currentProgress: fields[5] == null ? 0 : (fields[5] as num).toInt(),
      isClaimed: fields[6] == null ? false : fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ChallengeTaskModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.taskKey)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.targetValue)
      ..writeByte(4)
      ..write(obj.xpReward)
      ..writeByte(5)
      ..write(obj.currentProgress)
      ..writeByte(6)
      ..write(obj.isClaimed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChallengeTaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChallengeRewardModelAdapter extends TypeAdapter<ChallengeRewardModel> {
  @override
  final typeId = 53;

  @override
  ChallengeRewardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChallengeRewardModel(
      xpThreshold: (fields[0] as num).toInt(),
      creditReward: (fields[1] as num).toInt(),
      isClaimed: fields[2] == null ? false : fields[2] as bool,
      claimedCount: fields[3] == null ? 0 : (fields[3] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, ChallengeRewardModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.xpThreshold)
      ..writeByte(1)
      ..write(obj.creditReward)
      ..writeByte(2)
      ..write(obj.isClaimed)
      ..writeByte(3)
      ..write(obj.claimedCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChallengeRewardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChallengeLeaderboardEntryModelAdapter
    extends TypeAdapter<ChallengeLeaderboardEntryModel> {
  @override
  final typeId = 54;

  @override
  ChallengeLeaderboardEntryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChallengeLeaderboardEntryModel(
      odellId: fields[0] as String,
      companyName: fields[1] as String?,
      companyLogo: fields[2] as String?,
      totalXp: (fields[3] as num).toInt(),
      rank: (fields[4] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, ChallengeLeaderboardEntryModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.odellId)
      ..writeByte(1)
      ..write(obj.companyName)
      ..writeByte(2)
      ..write(obj.companyLogo)
      ..writeByte(3)
      ..write(obj.totalXp)
      ..writeByte(4)
      ..write(obj.rank);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChallengeLeaderboardEntryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DailyTaskModelAdapter extends TypeAdapter<DailyTaskModel> {
  @override
  final typeId = 55;

  @override
  DailyTaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyTaskModel(
      id: fields[0] as String?,
      taskKey: fields[1] as String,
      name: fields[2] as String,
      description: fields[3] as String?,
      criteriaType: fields[4] as DailyTaskCriteriaType,
      criteriaValue: (fields[5] as num).toInt(),
      xpReward: (fields[6] as num).toInt(),
      isActive: fields[7] == null ? true : fields[7] as bool,
      currentProgress: fields[8] == null ? 0 : (fields[8] as num).toInt(),
      isCompleted: fields[9] == null ? false : fields[9] as bool,
      isClaimed: fields[10] == null ? false : fields[10] as bool,
      completedAt: fields[11] as DateTime?,
      createdAt: fields[12] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, DailyTaskModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.taskKey)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.criteriaType)
      ..writeByte(5)
      ..write(obj.criteriaValue)
      ..writeByte(6)
      ..write(obj.xpReward)
      ..writeByte(7)
      ..write(obj.isActive)
      ..writeByte(8)
      ..write(obj.currentProgress)
      ..writeByte(9)
      ..write(obj.isCompleted)
      ..writeByte(10)
      ..write(obj.isClaimed)
      ..writeByte(11)
      ..write(obj.completedAt)
      ..writeByte(12)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyTaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GameProfileModelAdapter extends TypeAdapter<GameProfileModel> {
  @override
  final typeId = 56;

  @override
  GameProfileModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameProfileModel(
      id: fields[0] as String?,
      userId: fields[1] as String,
      companyId: fields[2] as String?,
      totalXp: fields[3] == null ? 0 : (fields[3] as num).toInt(),
      level: fields[4] == null ? 1 : (fields[4] as num).toInt(),
      currentLevelXp: fields[5] == null ? 0 : (fields[5] as num).toInt(),
      xpToNextLevel: fields[6] == null ? 100 : (fields[6] as num).toInt(),
      streak: fields[7] == null ? 0 : (fields[7] as num).toInt(),
      lastActivityDate: fields[8] as DateTime?,
      createdAt: fields[9] as DateTime?,
      updatedAt: fields[10] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, GameProfileModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.companyId)
      ..writeByte(3)
      ..write(obj.totalXp)
      ..writeByte(4)
      ..write(obj.level)
      ..writeByte(5)
      ..write(obj.currentLevelXp)
      ..writeByte(6)
      ..write(obj.xpToNextLevel)
      ..writeByte(7)
      ..write(obj.streak)
      ..writeByte(8)
      ..write(obj.lastActivityDate)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameProfileModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
