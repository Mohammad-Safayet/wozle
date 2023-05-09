import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:wozle/src/core/constants/theme/color_scheme_dark.dart';
import 'package:wozle/src/core/constants/theme/color_scheme_light.dart';
import 'package:wozle/src/core/constants/theme/text_theme_dark.dart';
import 'package:wozle/src/core/constants/theme/text_theme_light.dart';
import 'package:wozle/src/core/routes/app_pages.dart';
import 'package:wozle/src/modules/shared/services/settings_service.dart';

class Application extends StatefulWidget {
 const Application({
    Key? key,
    required this.applicationName,
  }) : super(key: key);

  final String applicationName;

  // ignore: library_private_types_in_public_api
  static _ApplicationState of(BuildContext context) =>
      context.findAncestorStateOfType<_ApplicationState>()!;

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final settings = SettingsService.to;

  late ThemeMode _themeMode;
  String initialPage = AppPages.INITIAL;

  @override
  void initState() {
    super.initState();

    final isDarkModeOn = settings.isDarkModeOn.value;
    (isDarkModeOn) ? _themeMode = ThemeMode.dark : _themeMode = ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: widget.applicationName,
      initialRoute: initialPage,
      getPages: AppPages.routes,
      theme: Theme.of(context).copyWith(
        useMaterial3: true,
        colorScheme: appColorSchemeLight,
        textTheme: textThemeLight,
      ),
      darkTheme: Theme.of(context).copyWith(
        useMaterial3: true,
        colorScheme: appColorSchemeDark,
        textTheme: textThemeDark,
      ),
      themeMode: _themeMode,
    );
  }

  void changeTheme(ThemeMode themeMode) {
    Logger().d("changeTheme triggered! $_themeMode $themeMode");
    setState(() {
      _themeMode = themeMode;
      initialPage = Routes.SETTINGS;
    });
    Logger().d("changeTheme triggered! $_themeMode $themeMode");
  }
}
