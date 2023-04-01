import 'package:get/get.dart';

class HomeScreenContoller extends GetxController {
  final currentIndex = 0.obs;

  void changeScreend(int index) {
    currentIndex.value = index;
  }
}
