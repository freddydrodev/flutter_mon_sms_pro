import 'package:hive_ce/hive.dart';
import 'package:mon_sms_pro/models/utils.dart';

class ChallengeTaskModel extends HiveObject {
  final String taskKey;
  final String name;
  final String? description;
  final int targetValue;
  final int xpReward;
  final int currentProgress;
  final bool isClaimed;

  ChallengeTaskModel({
    required this.taskKey,
    required this.name,
    this.description,
    required this.targetValue,
    required this.xpReward,
    this.currentProgress = 0,
    this.isClaimed = false,
  });

  factory ChallengeTaskModel.fromJson(Map<String, dynamic> json) {
    return ChallengeTaskModel(
      taskKey: json['taskKey'],
      name: json['name'],
      description: json['description'],
      targetValue: json['targetValue'] ?? 0,
      xpReward: json['xpReward'] ?? 0,
      currentProgress: json['currentProgress'] ?? 0,
      isClaimed: json['isClaimed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'taskKey': taskKey,
      'name': name,
      'description': description,
      'targetValue': targetValue,
      'xpReward': xpReward,
      'currentProgress': currentProgress,
      'isClaimed': isClaimed,
    };
  }
}

class ChallengeRewardModel extends HiveObject {
  final int xpThreshold;
  final int creditReward;
  final bool isClaimed;
  final int claimedCount;

  ChallengeRewardModel({
    required this.xpThreshold,
    required this.creditReward,
    this.isClaimed = false,
    this.claimedCount = 0,
  });

  factory ChallengeRewardModel.fromJson(Map<String, dynamic> json) {
    return ChallengeRewardModel(
      xpThreshold: json['xpThreshold'] ?? 0,
      creditReward: json['creditReward'] ?? 0,
      isClaimed: json['isClaimed'] ?? false,
      claimedCount: json['claimedCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'xpThreshold': xpThreshold,
      'creditReward': creditReward,
      'isClaimed': isClaimed,
      'claimedCount': claimedCount,
    };
  }
}

class ChallengeLeaderboardEntryModel extends HiveObject {
  final String odellId;
  final String? companyName;
  final String? companyLogo;
  final int totalXp;
  final int rank;

  ChallengeLeaderboardEntryModel({
    required this.odellId,
    this.companyName,
    this.companyLogo,
    required this.totalXp,
    required this.rank,
  });

  factory ChallengeLeaderboardEntryModel.fromJson(Map<String, dynamic> json) {
    return ChallengeLeaderboardEntryModel(
      odellId: json['companyId'] ?? json['userId'] ?? '',
      companyName: json['companyName'],
      companyLogo: json['companyLogo'],
      totalXp: json['totalXp'] ?? 0,
      rank: json['rank'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'companyId': odellId,
      'companyName': companyName,
      'companyLogo': companyLogo,
      'totalXp': totalXp,
      'rank': rank,
    };
  }
}

class ChallengeModel extends HiveObject {
  final String? id;
  final String name;
  final String? description;
  final ChallengeType type;
  final ChallengeStatus status;
  final DateTime startDate;
  final DateTime endDate;
  final List<ChallengeTaskModel>? tasks;
  final List<ChallengeRewardModel>? communityRewards;
  final int totalCommunityXp;
  final int participantCount;
  final bool isJoined;
  final int userXp;
  final int userRank;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ChallengeModel({
    this.id,
    required this.name,
    this.description,
    required this.type,
    required this.status,
    required this.startDate,
    required this.endDate,
    this.tasks,
    this.communityRewards,
    this.totalCommunityXp = 0,
    this.participantCount = 0,
    this.isJoined = false,
    this.userXp = 0,
    this.userRank = 0,
    this.createdAt,
    this.updatedAt,
  });

  factory ChallengeModel.fromJson(Map<String, dynamic> json) {
    return ChallengeModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      type: ChallengeType.fromValue(json['type']),
      status: ChallengeStatus.fromValue(json['status']),
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      tasks: json['tasks'] != null
          ? (json['tasks'] as List<dynamic>)
              .map((e) => ChallengeTaskModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      communityRewards: json['communityRewards'] != null
          ? (json['communityRewards'] as List<dynamic>)
              .map((e) => ChallengeRewardModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      totalCommunityXp: json['totalCommunityXp'] ?? 0,
      participantCount: json['participantCount'] ?? 0,
      isJoined: json['isJoined'] ?? false,
      userXp: json['userXp'] ?? 0,
      userRank: json['userRank'] ?? 0,
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
      'name': name,
      'description': description,
      'type': type.value,
      'status': status.value,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'tasks': tasks?.map((e) => e.toJson()).toList(),
      'communityRewards': communityRewards?.map((e) => e.toJson()).toList(),
      'totalCommunityXp': totalCommunityXp,
      'participantCount': participantCount,
      'isJoined': isJoined,
      'userXp': userXp,
      'userRank': userRank,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
