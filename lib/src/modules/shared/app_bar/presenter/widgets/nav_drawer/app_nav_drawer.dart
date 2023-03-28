import 'package:flutter/material.dart';

import 'package:wozle/src/modules/shared/app_bar/presenter/widgets/nav_drawer/app_nav_drawer_controller.dart';
import 'package:wozle/src/modules/shared/app_bar/presenter/widgets/nav_drawer/nav_content.dart';
import 'package:wozle/src/modules/shared/app_bar/presenter/widgets/nav_drawer/nav_header.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer({super.key});
  final _controller = NavBarController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NavigationDrawer(
        backgroundColor: Theme.of(context).colorScheme.primary,
        children: [
          const NavHeader(),
          NavBarContent(controller: _controller),
        ],
      ),
    );
  }
}
