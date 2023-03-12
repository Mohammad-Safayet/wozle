import 'package:flutter/material.dart';
import 'package:wozle/src/core/constants/app_strings.dart';
import 'package:wozle/src/modules/home/widgets/word_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          APPLICATION_TITLE,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        child: const WordList(),
      ),
    );
  }
}
