import 'package:wozle/src/modules/wozle/infra/models/progression.dart';

abstract class ProgressionRepository {
  Future<Progression> getData();

  Future updateData();
}