import 'package:get/get.dart';

class WordFormListController extends GetxController {
  final wordList = <String>[].obs;
  final activeIndex = 0.obs;

  void incrementIndex() {
    activeIndex.value++;
  }

  void addWord(String word) {
    wordList.add(word);
  }
}
