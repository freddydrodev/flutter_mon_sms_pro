import 'package:mon_sms_pro/payload/core/base_payload.dart';
import 'package:mon_sms_pro/payload/core/list_payload.dart';

enum SenderOrderBy {
  createdAt("createdAt"),
  name("name");

  final String value;

  const SenderOrderBy(this.value);
}

class SenderListPayload extends ListPayload {
  final SenderOrderBy? orderBy;

  SenderListPayload({
    super.apiKey,
    super.count,
    super.page,
    super.sort,
    this.orderBy,
  });

  factory SenderListPayload.fromJson(Map<String, dynamic> json) {
    return SenderListPayload(
      apiKey: json['apiKey'],
      count: json['count'],
      page: json['page'],
      sort: SortList.values.firstWhere(
        (e) => e.value == json['sort'],
      ), // == 'desc' ? SortList.desc : SortList.asc,
      orderBy: SenderOrderBy.values.firstWhere((e) =>
          e.value ==
          json[
              'orderBy']), // == 'type' ? SenderOrderBy.type : SenderOrderBy.createdAt,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'apiKey': apiKey,
      'count': count,
      'page': page,
      'sort': sort?.value, // == SortList.desc ? 'desc' : 'asc',
      'orderBy':
          orderBy?.value, // == SenderOrderBy.type ? 'type' : 'createdAt',
    };
  }
}

class CreateSenderPayload extends BasePayload {
  final String name;

  final String description;

  CreateSenderPayload({
    super.apiKey,
    required this.name,
    required this.description,
  });

  factory CreateSenderPayload.fromJson(Map<String, dynamic> json) {
    return CreateSenderPayload(
      apiKey: json['apiKey'],
      name: json['name'],
      description: json['description'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {'apiKey': apiKey, 'name': name, 'description': description};
  }
}

class GetSenderPayload extends BasePayload {
  final String id;

  GetSenderPayload({
    super.apiKey,
    required this.id,
  });

  factory GetSenderPayload.fromJson(Map<String, dynamic> json) {
    return GetSenderPayload(apiKey: json['apiKey'], id: json['id']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {'apiKey': apiKey, 'id': id};
  }
}

class UpdateSenderPayload extends BasePayload {
  final String id;
  final bool archived;

  UpdateSenderPayload({
    super.apiKey,
    required this.id,
    required this.archived,
  });

  factory UpdateSenderPayload.fromJson(Map<String, dynamic> json) {
    return UpdateSenderPayload(
      id: json['id'],
      apiKey: json['apiKey'],
      archived: json['archived'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {'id': id, 'apiKey': apiKey, 'archived': archived};
  }
}
