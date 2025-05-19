import 'package:hive_ce/hive.dart';

part 'company_followed_model.g.dart';

@HiveType(typeId: 23)
class CompanyFollowedModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String companyId;
  @HiveField(2)
  final String followerId;
  @HiveField(3)
  final DateTime createdAt;

  CompanyFollowedModel({
    this.id,
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
