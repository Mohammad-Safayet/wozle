import 'package:get/get.dart';
import 'package:wozle/src/modules/shared/app_bar/presenter/widgets/nav_drawer/app_nav_drawer_controller.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => NavBarController(),
    );
  }
}
