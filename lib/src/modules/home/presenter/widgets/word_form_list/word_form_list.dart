import 'package:flutter/material.dart';

import 'package:wozle/src/modules/home/presenter/widgets/word_form/word_form.dart';
import 'package:wozle/src/modules/home/presenter/widgets/word_form_list/word_form_list_controller.dart';

class WordFormList extends StatelessWidget {
  final _controller = WordFormListController();

  WordFormList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...[for (var i = 0; i < 6; i++) i]
              .map(
                (index) => WordForm(
                  index: index,
                  isActive: index == _controller.activeIndex.value,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
