import 'package:get/get.dart';
import 'package:wozle/src/modules/home/presenter/pages/home_screen_controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeScreenController(),
    );
  }
}
