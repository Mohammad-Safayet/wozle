import 'package:wozle/src/modules/wozle/infra/models/progression.dart';

abstract class ProgressionDatasource {
  Future<Progression?> getProgressionData();

  Future<Progression> init();

  Future updateProgressionData(Progression updatedProgression);
}