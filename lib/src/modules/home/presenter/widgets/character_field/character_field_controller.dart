import 'package:get/get.dart';

class CharacterFieldController extends GetxController {

  static CharacterFieldController get to => Get.find();

  final char = "".obs;

  void setChar(String ch) => char.value = ch;
}