import 'package:get/get.dart';

class WordFormController extends GetxController {

  final word = "".obs;

  void addChar(String char) {
    final temp = word.value;
    word.value = temp + char;
  }
}