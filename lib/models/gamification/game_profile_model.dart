import 'package:hive_ce/hive.dart';

class GameProfileModel extends HiveObject {
  final String? id;
  final String userId;
  final String? companyId;
  final int totalXp;
  final int level;
  final int currentLevelXp;
  final int xpToNextLevel;
  final int streak;
  final DateTime? lastActivityDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  GameProfileModel({
    this.id,
    required this.userId,
    this.companyId,
    this.totalXp = 0,
    this.level = 1,
    this.currentLevelXp = 0,
    this.xpToNextLevel = 100,
    this.streak = 0,
    this.lastActivityDate,
    this.createdAt,
    this.updatedAt,
  });

  factory GameProfileModel.fromJson(Map<String, dynamic> json) {
    return GameProfileModel(
      id: json['id'],
      userId: json['userId'],
      companyId: json['companyId'],
      totalXp: json['totalXp'] ?? 0,
      level: json['level'] ?? 1,
      currentLevelXp: json['currentLevelXp'] ?? 0,
      xpToNextLevel: json['xpToNextLevel'] ?? 100,
      streak: json['streak'] ?? 0,
      lastActivityDate: json['lastActivityDate'] != null
          ? DateTime.parse(json['lastActivityDate'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'companyId': companyId,
      'totalXp': totalXp,
      'level': level,
      'currentLevelXp': currentLevelXp,
      'xpToNextLevel': xpToNextLevel,
      'streak': streak,
      'lastActivityDate': lastActivityDate?.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
