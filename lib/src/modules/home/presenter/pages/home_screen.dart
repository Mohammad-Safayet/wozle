import 'package:flutter/material.dart';

import 'package:wozle/src/core/constants/app_strings.dart';
import 'package:wozle/src/modules/home/presenter/widgets/word_form_list/word_form_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          kAppName,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        child: WordFormList(),
      ),
    );
  }
}
