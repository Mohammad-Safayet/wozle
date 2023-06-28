import 'package:get/get.dart';

import 'package:wozle/src/modules/wozle/domain/repositories/progression_repo_impl.dart';
import 'package:wozle/src/modules/wozle/infra/datasources/progression_datasource/progression_datasource_impl.dart';
import 'package:wozle/src/modules/wozle/presenter/dialogs/statistics_chart_dialog/controllers/statistics_chart_controller.dart';

class ProgressionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProgressionDatasourceImpl(),
    );
    Get.lazyPut(
      () => ProgressionRepositoryImpl(
        datasource: Get.find<ProgressionDatasourceImpl>(),
      ),
    );
    Get.lazyPut(
      () => StatisticsChartDialogController(
        progressionRepository: Get.find<ProgressionRepositoryImpl>()
      ),
    );
  }
}
