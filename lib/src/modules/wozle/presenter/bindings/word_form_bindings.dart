import 'package:get/get.dart';

import 'package:wozle/src/modules/wozle/presenter/widgets/word_form/word_form_controller.dart';

class WordFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => WordFormController(),
    );
  }
}
