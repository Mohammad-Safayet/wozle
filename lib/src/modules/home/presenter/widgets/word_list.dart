import 'package:flutter/material.dart';

import 'package:wozle/src/modules/home/presenter/widgets/word_form_field/word_form_field.dart';

class WordList extends StatelessWidget {
  const WordList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          WordFormField(size: 5),
          WordFormField(size: 5),
          WordFormField(size: 5),
          WordFormField(size: 5),
          WordFormField(size: 5),
        ],
      ),
    );
  }
}
