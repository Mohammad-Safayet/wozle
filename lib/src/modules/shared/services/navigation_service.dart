import 'package:get/get.dart';
import 'package:wozle/src/core/routes/app_pages.dart';

class NavigationSerivce extends GetxService {
  static NavigationSerivce get to => Get.find();

  final route = Rxn<String>(Routes.HOME);

  void changeRoute(String value) {
    route.value = value;
  }
}
