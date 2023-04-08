import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wozle/src/core/routes/app_pages.dart';
import 'package:wozle/src/modules/shared/app_bar/app_bar.dart';
import 'package:wozle/src/modules/shared/app_bar/presenter/widgets/nav_drawer/app_nav_drawer.dart';

import 'package:wozle/src/modules/shared/dialogs/info_dialog.dart';
import 'package:wozle/src/modules/wozle/wozle.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeScreenList = [
    const WozleView(),
  ];

  @override
  Widget build(BuildContext context) {
    bool isTrue = false;
    if (isTrue) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Add Your Code here.
    Get.toNamed(Routes.WOZLE);
    });
    } else {
      Future.delayed(
        Duration.zero,
        () => showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => InfoDialog(
            onClose: () {
              Get.toNamed(Routes.WOZLE);
            },
          ),
        ),
      );
    }

    return Scaffold(
      appBar: const ApplicationBar(),
      body: Container(
        color: Theme.of(context).colorScheme.background,
      ),
      drawer: NavDrawer(),
    );
  }
}
