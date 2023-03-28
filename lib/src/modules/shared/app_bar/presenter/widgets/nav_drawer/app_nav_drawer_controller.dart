import 'package:get/get.dart';

class NavBarController extends GetxController {
  final index = 0.obs;

  void changeIndex(int value) {
    index.value = value;
  }
}
