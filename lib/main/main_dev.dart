import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:wozle/src/app.dart';
import 'package:wozle/src/core/config/build_config.dart';
import 'package:wozle/src/core/config/env_config.dart';
import 'package:wozle/src/core/config/environment.dart';
import 'package:wozle/src/modules/shared/drivers/navigation_service.dart';
import 'package:wozle/src/modules/shared/drivers/settings_service.dart';
import 'package:wozle/src/modules/shared/drivers/storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final envConfig = EnvConfig(
    appName: packageInfo.appName,
    appVersion: packageInfo.version,
  );

  BuildConfig.instantiate(
    config: envConfig,
    type: Environment.DEVELOPMENT,
  );

  await Get.putAsync(
    () => StorageService().init(),
  );
  Get.put(
    NavigationSerivce(),
  );
  Get.put(
    SettingsService(storage: StorageService.to),
  );

  runApp(
    Application(
      applicationName: packageInfo.appName,
    ),
  );
}
