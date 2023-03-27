import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wozle/src/core/constants/theme/color_scheme_dark.dart';
import 'package:wozle/src/core/constants/theme/color_scheme_light.dart';
import 'package:wozle/src/core/constants/theme/text_theme.dart';

import 'package:wozle/src/core/routes/app_pages.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: Theme.of(context).copyWith(
        colorScheme: appColorSchemeLight,
        appBarTheme: const AppBarTheme(
          titleTextStyle: kAppBarTitleTextStyle,
        ),
      ),
      darkTheme: Theme.of(context).copyWith(
        colorScheme: appColorSchemeDark,
        appBarTheme: const AppBarTheme(
          titleTextStyle: kAppBarTitleTextStyle,
        ),
      ),
    );
  }
}
