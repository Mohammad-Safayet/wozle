import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:wozle/src/core/extensions/error_object_extension.dart';
import 'package:wozle/src/core/utils/error_handling/error_handling.dart';
import 'package:wozle/src/modules/wozle/domain/usecases/get_daily_word.dart';
import 'package:wozle/src/modules/wozle/infra/models/daily_word.dart';
import 'package:wozle/src/modules/wozle/infra/repositories/word_repo.dart';

enum AppStatus {
  loading,
  success,
  error,
}

class WozleScreenController extends GetxController {
  static WozleScreenController get to => Get.find();

  late DailyWord word;
  late ErrorObject errorObject;
  final status = AppStatus.loading.obs;
  final WordRepository wordRepository;

  WozleScreenController({
    required this.wordRepository,
  });

  @override
  void onInit() async {
    await getDailyWord();

    super.onInit();
  }

  Future getDailyWord() async {
    status.value = AppStatus.loading;

    final getDailyWordUsecase =
        GetDailyWordUsecase(wordRepository: wordRepository);

    final result = await getDailyWordUsecase.call();

    result.fold(
      (left) {
        errorObject = ErrorObjectExtension.mapToErrorObject(failure: left);
        status.value = AppStatus.error;
      },
      (right) {
        Logger().d(right);
        word = right;
        status.value = AppStatus.success;
      },
    );
  }
}
