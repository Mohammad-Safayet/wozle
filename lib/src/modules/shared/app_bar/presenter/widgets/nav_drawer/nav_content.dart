import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:wozle/src/core/config/build_config.dart';

import 'package:wozle/src/core/constants/app_strings.dart';
import 'package:wozle/src/modules/shared/app_bar/presenter/widgets/nav_drawer/app_nav_drawer_controller.dart';
import 'package:wozle/src/modules/shared/dialogs/info_dialog.dart';
import 'package:wozle/src/modules/shared/dialogs/statistics_chart_dialog/statistics_chart_dialog.dart';

class NavBarContent extends StatelessWidget {
  const NavBarContent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final NavBarController controller;

  @override
  Widget build(BuildContext context) {
    final navOptions = <Widget>[
      ListTile(
        onTap: () {
          controller.changeIndex(-1);
          Navigator.pop(context);
        },
        leading: Icon(
          Icons.settings_rounded,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        title: Text(
          kNavMenuItemString1,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      ListTile(
        onTap: () {
          Navigator.pop(context);
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
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      ListTile(
        onTap: () {
          Navigator.pop(context);
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
          style: Theme.of(context).textTheme.titleLarge,
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
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    ];

    final navHomeOptions = <Widget>[
      ListTile(
        onTap: () {
          controller.changeIndex(0);
          Navigator.pop(context);
        },
        //TODO: change the icon
        leading: Icon(
          Icons.abc_outlined,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        title: Text(
          kHomeItemString1,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        style: ListTileStyle.drawer,
        tileColor: controller.index.value == 0
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primary,
      ),
    ];

    Logger().d(controller.index.value);

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

          Text(""),
        ],
      ),
    );
  }
}