import 'package:get/get.dart';

import 'package:wozle/src/modules/wozle/domain/repositories/word_repo_impl.dart';
import 'package:wozle/src/modules/wozle/presenter/pages/wozle_screen_controller.dart';

class WozleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => WozleScreenController(
        wordRepository: Get.find<WordRepositoryImpl>(),
      ),
    );
  }
}
