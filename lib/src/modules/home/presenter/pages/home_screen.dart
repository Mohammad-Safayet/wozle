import 'package:flutter/material.dart';

import 'package:wozle/src/modules/home/presenter/widgets/word_form_list/word_form_list.dart';
import 'package:wozle/src/modules/shared/app_bar/presenter/widgets/nav_drawer/app_nav_drawer.dart';
import 'package:wozle/src/modules/shared/app_bar/wozle_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WozleAppBar(),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        child: const WordFormList(),
      ),
      drawer: NavDrawer(),
    );
  }
}
