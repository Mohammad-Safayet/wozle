import 'package:flutter/material.dart';

import 'package:wozle/src/modules/shared/app_bar/presenter/widgets/app_title.dart';

class WozleAppBar extends StatefulWidget implements PreferredSizeWidget {
  const WozleAppBar({Key? key}) : super(key: key);

  final Size _preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Size get preferredSize => _preferredSize;

  @override
  State<WozleAppBar> createState() => _WozleAppBarState();
}

class _WozleAppBarState extends State<WozleAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const AppTitle(),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      shadowColor: Theme.of(context).colorScheme.primary,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu_rounded),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
    );
  }
}
