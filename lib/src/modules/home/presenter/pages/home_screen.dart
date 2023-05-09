import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:wozle/src/core/constants/app_strings.dart';
import 'package:wozle/src/core/routes/app_pages.dart';
import 'package:wozle/src/modules/home/presenter/pages/home_screen_controller.dart';

import 'package:wozle/src/modules/shared/app_bar/app_bar.dart';
import 'package:wozle/src/modules/shared/app_bar/presenter/widgets/nav_drawer/app_nav_drawer.dart';
import 'package:wozle/src/modules/shared/dialogs/info_dialog.dart';
import 'package:wozle/src/modules/shared/drivers/shared_prefs_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storageService = SharedPrefsService.to;
    final isStartDialogOff = storageService.getBool(kSpOnStartKey) ?? false;
    final controller = HomeScreenController.to;

    if (isStartDialogOff) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Add Your Code here.
        Get.toNamed(Routes.WOZLE);
      });
    } else {
      if (!controller.isDialogShown.value) {
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
        controller.dialogShown();
      }
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
