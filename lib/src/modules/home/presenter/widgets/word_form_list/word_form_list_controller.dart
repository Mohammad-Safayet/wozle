import 'package:get/get.dart';

class WordFormListController extends GetxController {
  final activeIndex = 0.obs;

  void incrementIndex() => activeIndex.value++;
}