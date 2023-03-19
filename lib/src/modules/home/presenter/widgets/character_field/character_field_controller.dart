import 'package:get/get.dart';

class CharacterFieldController extends GetxController {
  final char = "".obs;

  void setChar(String ch) => char.value = ch;
}