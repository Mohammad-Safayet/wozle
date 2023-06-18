import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wozle/src/modules/shared/app_bar/app_bar.dart';
import 'package:wozle/src/modules/shared/app_bar/presenter/widgets/nav_drawer/app_nav_drawer.dart';
import 'package:wozle/src/modules/shared/error_page/error_page.dart';
import 'package:wozle/src/modules/wozle/presenter/pages/wozle_screen_controller.dart';
import 'package:wozle/src/modules/wozle/presenter/widgets/word_form_list/word_form_list.dart';

class WozleScreen extends StatelessWidget {
  const WozleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final controller = WozleScreenController.to;

        return Scaffold(
          appBar: const ApplicationBar(),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).colorScheme.background,
            child: (controller.status.value == AppStatus.loading)
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  )
                : (controller.status.value == AppStatus.success)
                    ? const WordFormList()
                    : ErrorPage(
                        errorObject: controller.errorObject,
                      ),
          ),
          drawer: NavDrawer(),
        );
      },
    );
  }
}
