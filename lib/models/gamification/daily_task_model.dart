import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/utils.dart';

class DailyTaskModel extends HiveObject {
  final String? id;
  final String taskKey;
  final String name;
  final String? description;
  final DailyTaskCriteriaType criteriaType;
  final int criteriaValue;
  final int xpReward;
  final bool isActive;
  final int currentProgress;
  final bool isCompleted;
  final bool isClaimed;
  final DateTime? completedAt;
  final DateTime? createdAt;

  DailyTaskModel({
    this.id,
    required this.taskKey,
    required this.name,
    this.description,
    required this.criteriaType,
    required this.criteriaValue,
    required this.xpReward,
    this.isActive = true,
    this.currentProgress = 0,
    this.isCompleted = false,
    this.isClaimed = false,
    this.completedAt,
    this.createdAt,
  });

  factory DailyTaskModel.fromJson(Map<String, dynamic> json) {
    return DailyTaskModel(
      id: json['id'],
      taskKey: json['taskKey'],
      name: json['name'],
      description: json['description'],
      criteriaType: DailyTaskCriteriaType.fromValue(json['criteriaType']),
      criteriaValue: json['criteriaValue'] ?? 0,
      xpReward: json['xpReward'] ?? 0,
      isActive: json['isActive'] ?? true,
      currentProgress: json['currentProgress'] ?? 0,
      isCompleted: json['isCompleted'] ?? false,
      isClaimed: json['isClaimed'] ?? false,
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskKey': taskKey,
      'name': name,
      'description': description,
      'criteriaType': criteriaType.value,
      'criteriaValue': criteriaValue,
      'xpReward': xpReward,
      'isActive': isActive,
      'currentProgress': currentProgress,
      'isCompleted': isCompleted,
      'isClaimed': isClaimed,
      'completedAt': completedAt?.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}
