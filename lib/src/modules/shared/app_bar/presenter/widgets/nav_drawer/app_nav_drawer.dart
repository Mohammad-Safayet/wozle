import 'package:flutter/material.dart';

import 'package:wozle/src/modules/shared/app_bar/presenter/widgets/nav_drawer/nav_content.dart';
import 'package:wozle/src/modules/shared/app_bar/presenter/widgets/nav_drawer/nav_header.dart';
import 'package:wozle/src/modules/shared/drivers/navigation_service.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer({
    Key? key,
  }) : super(key: key);

  final _controller = NavigationSerivce.to;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NavigationDrawer(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        children: [
          const NavHeader(),
          NavBarContent(
            navController: _controller,
          ),
        ],
      ),
    );
  }
}
