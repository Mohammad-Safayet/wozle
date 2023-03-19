import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:wozle/src/modules/home/presenter/widgets/word_form/word_form.dart';
import 'package:wozle/src/modules/home/presenter/widgets/word_form_list/word_form_list_controller.dart';

class WordFormList extends GetWidget<WordFormListController> {

  const WordFormList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...[for (var i = 0; i < 6; i++) i].map((index) {
              final isActive = index == controller.activeIndex.value;
              String word = "";
              if (controller.wordList.length > index) {
                word = controller.wordList[index];
              }

              return WordForm(
                index: index,
                isActive: isActive,
                word: word,
                activeNextForm: () {
                  controller.incrementIndex();
                },
                addWordToList: (String word) {
                  controller.addWord(word);
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
