import 'package:hive_ce/hive.dart';

class CompanyFollowedModel extends HiveObject {
  final String id;
  final String companyId;
  final String followerId;
  final DateTime createdAt;

  CompanyFollowedModel({
    required this.id,
    required this.companyId,
    required this.followerId,
    required this.createdAt,
  });

  factory CompanyFollowedModel.fromJson(Map<String, dynamic> json) {
    return CompanyFollowedModel(
      id: json['id'],
      companyId: json['companyId'],
      followerId: json['followerId'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'companyId': companyId,
      'followerId': followerId,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
