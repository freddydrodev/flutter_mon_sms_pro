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
      createdAt: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ContactModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.phone)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.createdAt);
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
      userId: fields[8] as String,
      campainId: fields[9] as String?,
      offerId: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionModel obj) {
    writer
      ..writeByte(11)
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
      ..writeByte(9)
      ..write(obj.campainId)
      ..writeByte(10)
      ..write(obj.offerId);
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
