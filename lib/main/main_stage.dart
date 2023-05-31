import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:wozle/src/app.dart';
import 'package:wozle/src/core/config/config.dart';
import 'package:wozle/src/modules/shared/services/navigation_service.dart';
import 'package:wozle/src/modules/shared/services/settings_service.dart';
import 'package:wozle/src/modules/shared/services/shared_prefs_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final envConfig = EnvConfig(
    appName: packageInfo.appName,
    appVersion: packageInfo.version,
  );

  BuildConfig.instantiate(
    config: envConfig,
    type: Environment.STAGING,
  );

  await Get.putAsync(
    () => SharedPrefsService().init(),
  );
  Get.put(
    NavigationSerivce(),
  );
  Get.put(
    SettingsService(storage: SharedPrefsService.to),
  );

  runApp(
    Application(
      applicationName: packageInfo.appName,
    ),
  );
}
