import 'package:wozle/src/modules/wozle/infra/models/progression.dart';

abstract class ProgressionDatasource {
  Future<Progression> init();

  Future<Progression?> getProgressionData();

  Future updateProgressionData(Progression updatedProgression);
}