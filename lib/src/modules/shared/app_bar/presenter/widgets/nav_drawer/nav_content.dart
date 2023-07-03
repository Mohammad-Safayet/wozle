import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:wozle/src/core/config/build_config.dart';
import 'package:wozle/src/core/constants/app_strings.dart';
import 'package:wozle/src/core/routes/app_pages.dart';
import 'package:wozle/src/modules/shared/app_bar/presenter/widgets/nav_drawer/nav_tile.dart';
import 'package:wozle/src/modules/shared/dialogs/about_dialog.dart';
import 'package:wozle/src/modules/shared/services/navigation_service.dart';

class NavBarContent extends StatelessWidget {
  const NavBarContent({
    Key? key,
    required this.navController,
    required this.list,
  }) : super(key: key);

  final NavigationSerivce navController;
  final List<Widget> list;
  @override
  Widget build(BuildContext context) {
    final defaultList = <Widget>[
      NavListTile(
        onTap: () {
          Navigator.pop(context);

          navController.changeRoute(Routes.WOZLE);
          Get.toNamed(Routes.SETTINGS);
        },
        icon: Icon(
          Icons.settings_rounded,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        title: kNavMenuItemString1,
      ),
      NavListTile(
        onTap: () {
          Navigator.pop(context);
          BuildConfig config = BuildConfig.instance;
          showDialog(
            context: context,
            builder: (context) => CustomAboutDialog(
              config: config,
              onClose: () {},
            ),
          );
        },
        icon: Icon(
          Icons.info_outline_rounded,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        title: kNavMenuItemString2,
      ),
    ];

    final navHomeOptions = <Widget>[
      ListTile(
        onTap: () {
          Navigator.pop(context);
          navController.changeRoute(Routes.WOZLE);
          Get.toNamed(Routes.WOZLE);
        },
        //TODO: change the icon
        leading: Icon(
          Icons.abc_outlined,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        title: Text(
          kHomeItemString1,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: navController.route.value == Get.currentRoute
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSecondary,
              ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        style: ListTileStyle.drawer,
        tileColor: navController.route.value == Get.currentRoute
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.secondary,
      ),
    ];

    Logger().d(navController.route.value);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          // Navigation home option
          ...navHomeOptions,

          // Padding
          const SizedBox(
            height: 16.0,
            child: Divider(),
          ),

          // Feature specific list
          ...list,

          // Navigation option application
          ...defaultList,
        ],
      ),
    );
  }
}
