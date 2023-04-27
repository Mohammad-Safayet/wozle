import 'package:get/get.dart';

class NavigationSerivce extends GetxService {
  static NavigationSerivce get to => Get.find();

  final route = Rxn<String>(Get.currentRoute);

  void changeRoute(String value) {
    route.value = value;
  }
}
