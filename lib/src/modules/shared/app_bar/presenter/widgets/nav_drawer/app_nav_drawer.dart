import 'package:flutter/material.dart';

import 'package:wozle/src/modules/home/presenter/pages/home_screen_controller.dart';
import 'package:wozle/src/modules/shared/app_bar/presenter/widgets/nav_drawer/app_nav_drawer_controller.dart';
import 'package:wozle/src/modules/shared/app_bar/presenter/widgets/nav_drawer/nav_content.dart';
import 'package:wozle/src/modules/shared/app_bar/presenter/widgets/nav_drawer/nav_header.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer({
    Key? key,
    required this.contoller,
  }) : super(key: key);

  final HomeScreenContoller contoller;
  final _controller = NavBarController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NavigationDrawer(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        children: [
          const NavHeader(),
          NavBarContent(
            navController: _controller,
            homePageontroller: contoller,
          ),
        ],
      ),
    );
  }
}
