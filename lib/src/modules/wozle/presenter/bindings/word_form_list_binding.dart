import 'package:get/get.dart';

import 'package:wozle/src/modules/wozle/presenter/widgets/word_form_list/word_form_list_controller.dart';

class WordFormListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => WordFormListController(),
    );
  }
}
