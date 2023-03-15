import 'package:flutter/material.dart';

import 'package:wozle/src/modules/home/presenter/widgets/word_form/word_form.dart';

class WordFormList extends StatelessWidget {
  const WordFormList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          WordForm(size: 5, isActive: true,),
          WordForm(size: 5, isActive: true,),
          WordForm(size: 5, isActive: true,),
          WordForm(size: 5, isActive: true,),
          WordForm(size: 5, isActive: true,),
        ],
      ),
    );
  }
}
