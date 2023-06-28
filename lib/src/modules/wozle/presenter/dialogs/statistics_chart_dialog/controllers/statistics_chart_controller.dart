import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:wozle/src/core/extensions/extensions.dart';
import 'package:wozle/src/core/utils/error_handling/error_object.dart';
import 'package:wozle/src/modules/wozle/domain/usecases/get_progression.dart';
import 'package:wozle/src/modules/wozle/infra/models/progression.dart';

import 'package:wozle/src/modules/wozle/infra/repositories/progression_repo.dart';

class StatisticsChartDialogController extends GetxController {
  static StatisticsChartDialogController get to => Get.find();

  final ProgressionRepository progressionRepository;
  late Progression progression;
  late ErrorObject errorObject;
  final isTrue = true.obs;

  StatisticsChartDialogController({
    required this.progressionRepository,
  });

  @override
  void onInit() async {
    super.onInit();

    await getProgression();
  }

  Future getProgression() async {
    final getProgressionUsecase = GetProgressionUsecase(
      repository: progressionRepository,
    );

    final result = await getProgressionUsecase.call();

    result.fold(
      (left) {
        errorObject = ErrorObjectExtension.mapToErrorObject(failure: left);
        Logger().e("error: $errorObject");
      },
      (right) {
        Logger().d(right);
        progression = right;
      },
    );
  }
}
