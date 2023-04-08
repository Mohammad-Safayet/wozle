import 'package:flutter/material.dart';

import 'package:wozle/src/modules/shared/app_bar/app_bar.dart';
import 'package:wozle/src/modules/shared/app_bar/presenter/widgets/nav_drawer/app_nav_drawer.dart';
import 'package:wozle/src/modules/wozle/presenter/widgets/word_form_list/word_form_list.dart';

class WozleScreen extends StatelessWidget {
  const WozleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ApplicationBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).colorScheme.background,
        child: const WordFormList(),
      ),
      drawer: NavDrawer(
      ),
    );
  }
}
