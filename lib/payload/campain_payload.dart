import 'package:mon_sms_pro/models/contact_model.dart';
import 'package:mon_sms_pro/payload/core/base_payload.dart';
import 'package:mon_sms_pro/payload/core/list_payload.dart';
import 'package:mon_sms_pro/utils.dart';

enum OrderBy {
  type("type"),
  createdAt("createdAt");

  final String value;

  const OrderBy(this.value);
}

class CampainListPayload extends ListPayload {
  final OrderBy? orderBy;

  CampainListPayload({
    super.apiKey,
    super.count,
    super.page,
    super.sort,
    this.orderBy,
  });

  factory CampainListPayload.fromJson(Map<String, dynamic> json) {
    return CampainListPayload(
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

class CreateCampainPayload extends BasePayload {
  final String name;
  final List<ContactModel>? contacts;
  final List<String>? groupsIds;
  final String? text;
  final String? senderId;
  final SMSType? type; // "SMS", "FLASH"
  final bool? forceSenderId;

  CreateCampainPayload({
    required this.name,
    super.apiKey,
    this.contacts = const [],
    this.groupsIds = const [],
    this.text,
    this.senderId,
    this.type = SMSType.sms,
    this.forceSenderId = false,
  });

  factory CreateCampainPayload.fromJson(Map<String, dynamic> json) {
    final contacts = json['contacts'] ?? [];

    return CreateCampainPayload(
      apiKey: json['apiKey'],
      name: json['name'],
      contacts: List.generate(
        contacts.length,
        (i) => ContactModel.fromJson(
          contacts[i],
        ),
      ),
      groupsIds: json['groupsIds'] ?? [],
      text: json['text'],
      senderId: json['senderId'],
      type: SMSType.values.firstWhere((e) =>
          e.value == json['type']), // == 'SMS' ? SMSType.sms : SMSType.flash,
      forceSenderId: json['forceSenderId'] ?? false,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final c = contacts ?? [];

    return {
      'apiKey': apiKey,
      'name': name,
      'contacts': List.generate(c.length, (i) => c[i].toJson()),
      'groupsIds': groupsIds,
      'text': text,
      'senderId': senderId,
      'type': type?.value, // == SMSType.sms ? 'SMS' : 'FLASH',
      'forceSenderId': forceSenderId ?? false,
    };
  }
}
