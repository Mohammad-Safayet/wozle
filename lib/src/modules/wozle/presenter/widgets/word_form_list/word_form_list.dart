import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wozle/src/modules/wozle/presenter/widgets/word_form/word_form.dart';
import 'package:wozle/src/modules/wozle/presenter/widgets/word_form_list/word_form_list_controller.dart';

class WordFormList extends GetWidget<WordFormListController> {
  const WordFormList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15.0,
            ),
            ...[for (var i = 0; i < 6; i++) i].map((index) {
              final isActive = index == controller.activeIndex.value;
              String word = "";
              if (controller.wordList.length > index) {
                word = controller.wordList[index];
              }

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: WordForm(
                  index: index,
                  isActive: isActive,
                  word: word,
                  activeNextForm: () {
                    controller.incrementIndex();
                  },
                  addWordToList: (String word) {
                    controller.addWord(word);
                  },
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
