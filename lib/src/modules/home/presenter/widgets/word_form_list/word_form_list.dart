import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wozle/src/modules/home/presenter/widgets/word_form/word_form.dart';
import 'package:wozle/src/modules/home/presenter/widgets/word_form_list/word_form_list_controller.dart';

class WordFormList extends StatelessWidget {
  final _controller = WordFormListController();

  WordFormList({super.key});

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
              final isActive = index == _controller.activeIndex.value;
              String word = "";
              if (_controller.wordList.length > index) {
                word = _controller.wordList[index];
              }

              return WordForm(
                index: index,
                isActive: isActive,
                word: word,
                activeNextForm: () {
                  _controller.incrementIndex();
                },
                addWordToList: (String word) {
                  _controller.addWord(word);
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
