import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:wozle/src/app.dart';
import 'package:wozle/src/core/config/build_config.dart';
import 'package:wozle/src/core/config/env_config.dart';
import 'package:wozle/src/core/config/environment.dart';

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

  runApp(
    Application(
      applicationName: packageInfo.appName,
    ),
  );
}
