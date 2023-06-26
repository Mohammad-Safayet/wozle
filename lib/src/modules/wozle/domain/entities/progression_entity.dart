import 'package:hive/hive.dart';

part 'progression_entity.g.dart';

@HiveType(typeId: 5)
class ProgressionEntity extends HiveObject {
  @HiveField(1)
  int totalTimePlayed;

  @HiveField(2)
  int winRatio;

  @HiveField(3)
  int currentStreak;

  @HiveField(4)
  int maxStreak;

  ProgressionEntity({
    required this.totalTimePlayed,
    required this.winRatio,
    required this.currentStreak,
    required this.maxStreak,
  });
}
