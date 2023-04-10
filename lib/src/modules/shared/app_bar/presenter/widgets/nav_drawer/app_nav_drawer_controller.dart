import 'package:get/get.dart';

class NavBarController extends GetxController {
  final route = Rxn<String>(Get.currentRoute);

  void changeIndex(String value) {
    route.value = value;
  }
}
