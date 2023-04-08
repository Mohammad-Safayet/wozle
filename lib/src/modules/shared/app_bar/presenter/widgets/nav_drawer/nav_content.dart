import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:wozle/src/core/config/build_config.dart';
import 'package:wozle/src/core/constants/app_strings.dart';
import 'package:wozle/src/core/routes/app_pages.dart';
import 'package:wozle/src/modules/shared/app_bar/presenter/widgets/nav_drawer/app_nav_drawer_controller.dart';
import 'package:wozle/src/modules/shared/dialogs/info_dialog.dart';
import 'package:wozle/src/modules/shared/dialogs/statistics_chart_dialog/statistics_chart_dialog.dart';

class NavBarContent extends StatelessWidget {
  const NavBarContent({
    Key? key,
    required this.navController,
  }) : super(key: key);

  final NavBarController navController;

  @override
  Widget build(BuildContext context) {
    final navOptions = <Widget>[
      ListTile(
        onTap: () {
          Navigator.pop(context);

          navController.changeIndex(Routes.WOZLE);
          Get.toNamed(Routes.SETTINGS);
        },
        leading: Icon(
          Icons.settings_rounded,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        title: Text(
          kNavMenuItemString1,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
        ),
      ),
      ListTile(
        onTap: () {
          Navigator.pop(context);

          navController.changeIndex(Routes.WOZLE);
          showDialog(
            context: context,
            builder: (context) => const StatisticsChartDialog(),
          );
        },
        leading: Icon(
          Icons.bar_chart_outlined,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        title: Text(
          kNavMenuItemString2,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
        ),
      ),
      ListTile(
        onTap: () {
          Navigator.pop(context);

          navController.changeIndex(Routes.WOZLE);
          showDialog(
            context: context,
            builder: (context) => const InfoDialog(),
          );
        },
        leading: Icon(
          Icons.help_outline_rounded,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        title: Text(
          kNavMenuItemString3,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
        ),
      ),
      ListTile(
        onTap: () {
          Navigator.pop(context);
          BuildConfig config = BuildConfig.instance;
          showAboutDialog(
            context: context,
            applicationName: config.envConfig.appName,
            applicationVersion: config.envConfig.appVersion,
            applicationIcon: Image.asset(
              "assets/icons/wozle_icon.png",
              height: 50,
              width: 50,
            ),
          );
        },
        leading: Icon(
          Icons.info_outline_rounded,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        title: Text(
          kNavMenuItemString4,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
        ),
      ),
    ];

    final navHomeOptions = <Widget>[
      ListTile(
        onTap: () {
          Navigator.pop(context);
          navController.changeIndex(Routes.WOZLE);
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

          // Navigation option application
          ...navOptions,
        ],
      ),
    );
  }
}
