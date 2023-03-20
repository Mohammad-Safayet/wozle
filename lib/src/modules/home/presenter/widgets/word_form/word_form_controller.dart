import 'package:get/get.dart';
import 'package:logger/logger.dart';

class WordFormController extends GetxController {
  final word = "".obs;

  void addChar(String char) {
    String temp = word.value;
    temp += char;
    word.value = temp;
    Logger().d("editing: ${temp.length} $word");
  }

  void deleteChar(int index) {
    String temp = word.value.substring(0, index-1);
    word.value = temp;
    Logger().d("editing: $index ${temp.length} $word");
  }

  void reset() => word.value = "";
}
