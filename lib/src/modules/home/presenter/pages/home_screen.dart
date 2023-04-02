import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wozle/src/modules/home/presenter/pages/home_screen_controller.dart';

import 'package:wozle/src/modules/shared/app_bar/app_bar.dart';
import 'package:wozle/src/modules/wozle/wozle.dart';
import 'package:wozle/src/modules/shared/app_bar/presenter/widgets/nav_drawer/app_nav_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeScreenList = [
    const WozleView(),
  ];
  final _controller = Get.find<HomeScreenContoller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ApplicationBar(),
      body: Obx(
        () => homeScreenList[_controller.currentIndex.value],
      ),
      drawer: NavDrawer(
        contoller: _controller,
      ),
    );
  }
}
