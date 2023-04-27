import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  static HomeScreenController get to => Get.find();

  final isDialogShown = false.obs;
  
  void dialogShown() {
    isDialogShown.value = true;
  }
}