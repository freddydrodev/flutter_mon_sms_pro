import 'package:mon_sms_pro/models/contact_model.dart';
import 'package:mon_sms_pro/payload/core/base_payload.dart';
import 'package:mon_sms_pro/payload/core/list_payload.dart';
import 'package:mon_sms_pro/utils.dart';

enum OrderBy {
  type("type"),
  createdAt("createdAt"),
  firstName("firstName"),
  lastName("lastName"),
  name("name"),
  phone("phone"),
  sex("sex");

  final String value;

  const OrderBy(this.value);
}

class ContactListPayload extends ListPayload {
  final OrderBy? orderBy;

  ContactListPayload({
    super.apiKey,
    super.count,
    super.page,
    super.sort,
    this.orderBy,
  });

  factory ContactListPayload.fromJson(Map<String, dynamic> json) {
    return ContactListPayload(
      apiKey: json['apiKey'],
      count: json['count'],
      page: json['page'],
      sort: SortList.values.firstWhere(
        (e) => e.value == json['sort'],
      ), // == 'desc' ? SortList.desc : SortList.asc,
      orderBy: OrderBy.values.firstWhere((e) =>
          e.value ==
          json['orderBy']), // == 'type' ? OrderBy.type : OrderBy.createdAt,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'apiKey': apiKey,
      'count': count,
      'page': page,
      'sort': sort?.value, // == SortList.desc ? 'desc' : 'asc',
      'orderBy': orderBy?.value, // == OrderBy.type ? 'type' : 'createdAt',
    };
  }
}

class CreateContactPayload extends BasePayload {
  final List<ContactModel> contacts;

  CreateContactPayload({
    super.apiKey,
    required this.contacts,
  });

  factory CreateContactPayload.fromJson(Map<String, dynamic> json) {
    final contacts = json['contacts'] ?? [];

    return CreateContactPayload(
      apiKey: json['apiKey'],
      contacts: List.generate(
        contacts.length,
        (i) => ContactModel.fromJson(
          contacts[i],
        ),
      ),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'apiKey': apiKey,
      'contacts': List.generate(contacts.length, (i) => contacts[i].toJson()),
    };
  }
}

class DeleteContactPayload extends BasePayload {
  final List<String> contactIds;

  DeleteContactPayload({
    super.apiKey,
    required this.contactIds,
  });

  factory DeleteContactPayload.fromJson(Map<String, dynamic> json) {
    return DeleteContactPayload(
      apiKey: json['apiKey'],
      contactIds: json['contactIds'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'apiKey': apiKey,
      'contactIds': contactIds,
    };
  }
}

class GetContactPayload extends BasePayload {
  final String id;

  GetContactPayload({
    super.apiKey,
    required this.id,
  });

  factory GetContactPayload.fromJson(Map<String, dynamic> json) {
    return GetContactPayload(apiKey: json['apiKey'], id: json['id']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {'apiKey': apiKey, 'id': id};
  }
}

class UpdateContactPayload extends BasePayload {
  final String id;
  final String? phone;
  final String? name;
  final String? firstName;
  final String? lastName;
  final SexType? sex; // M | F

  UpdateContactPayload({
    super.apiKey,
    required this.id,
    this.phone,
    this.name,
    this.firstName,
    this.lastName,
    this.sex,
  });

  factory UpdateContactPayload.fromJson(Map<String, dynamic> json) {
    return UpdateContactPayload(
      id: json['id'],
      phone: json['phone'],
      name: json['name'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      sex: json['sex'] != null
          ? SexType.values.firstWhere((e) => e.value == json['sex'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'name': name,
      'firstName': firstName,
      'lastName': lastName,
      'sex': sex?.value,
    };
  }
}
