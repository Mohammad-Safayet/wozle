import 'package:flutter/material.dart';

import 'package:wozle/src/modules/shared/app_bar/presenter/widgets/app_title.dart';

class ApplicationBar extends StatefulWidget implements PreferredSizeWidget {
  const ApplicationBar({Key? key}) : super(key: key);

  final Size _preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Size get preferredSize => _preferredSize;

  @override
  State<ApplicationBar> createState() => _ApplicationBarState();
}

class _ApplicationBarState extends State<ApplicationBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const AppTitle(),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      shadowColor: Theme.of(context).colorScheme.primary,
      elevation: 12.0,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu_rounded),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
    );
  }
}
