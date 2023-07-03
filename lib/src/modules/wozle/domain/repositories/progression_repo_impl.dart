import 'package:wozle/src/modules/wozle/infra/datasources/progression_datasource/progression_datasource.dart';
import 'package:wozle/src/modules/wozle/infra/models/progression.dart';
import 'package:wozle/src/modules/wozle/infra/repositories/progression_repo.dart';

class ProgressionRepositoryImpl extends ProgressionRepository {
  final ProgressionDatasource datasource;

  ProgressionRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Progression> getData() async {
    try {
      Progression? progression = await datasource.getProgressionData();
      progression ??= await datasource.init();

      return progression; 
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future updateData() {
    // TODO: implement updateData
    throw UnimplementedError();
  }
}
