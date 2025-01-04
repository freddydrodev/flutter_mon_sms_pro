import 'package:mon_sms_pro/payload/core/base_payload.dart';

enum SortList {
  desc("desc"),
  asc("asc");

  final String value;

  const SortList(this.value);
}

class ListPayload extends BasePayload {
  final int? count;
  final int? page;
  final SortList? sort;

  ListPayload({
    super.apiKey,
    this.count,
    this.page,
    this.sort = SortList.desc,
  });

  factory ListPayload.fromJson(Map<String, dynamic> json) {
    return ListPayload(
      apiKey: json['apiKey'],
      count: json['count'],
      page: json['page'],
      sort: json["sort"],
      // json['sort'] == 'desc' ? SortList.desc : SortList.asc,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'apiKey': apiKey,
      'count': count,
      'page': page,
      'sort': sort,
      //sort == SortList.desc ? 'desc' : 'asc',
    };
  }
}
