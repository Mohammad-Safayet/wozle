import 'package:get/get.dart';
import 'package:logger/logger.dart';

class WordFormController extends GetxController {

  final word = "".obs;

  void addChar(int index, String char) {
    String temp = word.value;
    // if (temp.length > index) {
    //   temp.replaceRange(index, index +1, char);
    // } else {
    // }
      temp += char;
    word.value = temp;
    Logger().d("editing: $index ${temp.length} $word");
  }
}