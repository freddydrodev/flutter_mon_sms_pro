import 'package:mon_sms_pro/payload/core/base_payload.dart';
import 'package:mon_sms_pro/payload/core/list_payload.dart';

enum GroupOrderBy {
  name("name"),
  createdAt("createdAt"),
  description("description");

  final String value;

  const GroupOrderBy(this.value);
}

class GroupListPayload extends ListPayload {
  final GroupOrderBy? orderBy;

  GroupListPayload({
    super.apiKey,
    super.count,
    super.page,
    super.sort,
    this.orderBy,
  });

  factory GroupListPayload.fromJson(Map<String, dynamic> json) {
    return GroupListPayload(
      apiKey: json['apiKey'],
      count: json['count'],
      page: json['page'],
      sort: SortList.values.firstWhere(
        (e) => e.value == json['sort'],
      ),
      orderBy: json['orderBy'] != null
          ? GroupOrderBy.values.firstWhere((e) => e.value == json['orderBy'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'apiKey': apiKey,
      'count': count,
      'page': page,
      'sort': sort?.value,
      'orderBy': orderBy?.value,
    };
  }
}

class CreateGroupPayload extends BasePayload {
  final String name;
  final String? description;

  CreateGroupPayload({
    super.apiKey,
    required this.name,
    this.description,
  });

  factory CreateGroupPayload.fromJson(Map<String, dynamic> json) {
    return CreateGroupPayload(
      apiKey: json['apiKey'],
      name: json['name'],
      description: json['description'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'apiKey': apiKey,
      'name': name,
      'description': description,
    };
  }
}

class DeleteGroupPayload extends BasePayload {
  final List<String> groupIds;

  DeleteGroupPayload({
    super.apiKey,
    required this.groupIds,
  });

  factory DeleteGroupPayload.fromJson(Map<String, dynamic> json) {
    return DeleteGroupPayload(
      apiKey: json['apiKey'],
      groupIds: json['groupIds'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'apiKey': apiKey,
      'groupIds': groupIds,
    };
  }
}

class GetGroupPayload extends BasePayload {
  final String id;

  GetGroupPayload({
    super.apiKey,
    required this.id,
  });

  factory GetGroupPayload.fromJson(Map<String, dynamic> json) {
    return GetGroupPayload(apiKey: json['apiKey'], id: json['id']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {'apiKey': apiKey, 'id': id};
  }
}

class UpdateGroupPayload extends BasePayload {
  final String id;
  final String? name;
  final String? description;

  UpdateGroupPayload({
    super.apiKey,
    required this.id,
    this.name,
    this.description,
  });

  factory UpdateGroupPayload.fromJson(Map<String, dynamic> json) {
    return UpdateGroupPayload(
      apiKey: json['apiKey'],
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
