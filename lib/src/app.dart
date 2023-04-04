import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wozle/src/core/constants/theme/color_scheme_dark.dart';
import 'package:wozle/src/core/constants/theme/color_scheme_light.dart';
import 'package:wozle/src/core/constants/theme/text_theme_dark.dart';
import 'package:wozle/src/core/constants/theme/text_theme_light.dart';
import 'package:wozle/src/core/routes/app_pages.dart';

class Application extends StatelessWidget {
  const Application({
    Key? key,
    required this.applicationName,
  }) : super(key: key);

  final String applicationName;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: applicationName,
      initialRoute: AppPages.INITIAL,
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
    );
  }
}
