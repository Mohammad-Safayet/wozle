import 'package:hive/hive.dart';

import 'package:wozle/src/modules/wozle/infra/datasources/progression_datasource/progression_datasource.dart';
import 'package:wozle/src/core/constants/app_strings.dart';
import 'package:wozle/src/modules/wozle/infra/models/progression.dart';

class ProgressionDatasourceImpl extends ProgressionDatasource {
  final futureBox = Hive.openBox<Progression>(kProgressionHiveBox);

  @override
  Future<Progression?> getProgressionData() async {
    try {
      final box = await futureBox;

      final progression = box.get(kProgressionHivPropsKey);

      return progression;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Progression> init() async {
    try {
      final data = await getProgressionData();

      if (data != null) {
        return data;
      }

      const progression = Progression(
        totalTimePlayed: 0,
        winRatio: 0,
        currentStreak: 0,
        maxStreak: 0,
      );
      updateProgressionData(progression);

      return progression;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future updateProgressionData(Progression updatedProgression) async {
    try {
      final box = await futureBox;

      await box.put(kProgressionHivPropsKey, updatedProgression);

      return true;
    } catch (e) {
      rethrow;
    }
  }
}
