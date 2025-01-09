import 'package:mon_sms_pro/models/contact_model.dart';
import 'package:mon_sms_pro/payload/core/base_payload.dart';
import 'package:mon_sms_pro/payload/core/list_payload.dart';
import 'package:mon_sms_pro/utils.dart';

enum CampainOrderBy {
  type("type"),
  createdAt("createdAt");

  final String value;

  const CampainOrderBy(this.value);
}

class CampainListPayload extends ListPayload {
  final CampainOrderBy? orderBy;
  final String senderId;

  CampainListPayload({
    super.apiKey,
    super.count,
    super.page,
    super.sort,
    this.orderBy,
    required this.senderId,
  });

  factory CampainListPayload.fromJson(Map<String, dynamic> json) {
    return CampainListPayload(
      senderId: json['senderId'],
      apiKey: json['apiKey'],
      count: json['count'],
      page: json['page'],
      sort: SortList.values.firstWhere(
        (e) => e.value == json['sort'],
      ), // == 'desc' ? SortList.desc : SortList.asc,
      orderBy: CampainOrderBy.values.firstWhere(
        (e) => e.value == json['orderBy'],
      ), // == 'type' ? CampainOrderBy.type : CampainOrderBy.createdAt,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'apiKey': apiKey,
      'count': count,
      'page': page,
      'sort': sort?.value, // == SortList.desc ? 'desc' : 'asc',
      'orderBy':
          orderBy?.value, // == CampainOrderBy.type ? 'type' : 'createdAt',
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
