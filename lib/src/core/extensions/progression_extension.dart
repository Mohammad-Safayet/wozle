import 'package:wozle/src/modules/wozle/domain/entities/progression_entity.dart';
import 'package:wozle/src/modules/wozle/infra/models/progression.dart';

extension ProgressionEntityExtension on ProgressionEntity {
  Progression toModel() {
    return Progression(
      totalTimePlayed: totalTimePlayed,
      winRatio: winRatio,
      currentStreak: currentStreak,
      maxStreak: maxStreak,
    );
  }
}

extension ProgressionExtension on Progression {
  ProgressionEntity toEntity() {
    return ProgressionEntity(
      totalTimePlayed: totalTimePlayed,
      winRatio: winRatio,
      currentStreak: currentStreak,
      maxStreak: maxStreak,
    );
  }
}
