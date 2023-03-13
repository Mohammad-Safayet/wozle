import 'package:wozle/src/core/config/env_config.dart';
import 'package:wozle/src/core/config/environment.dart';

class BuildConfig {
  late final EnvConfig envConfig;
  late final Environment environment;
  bool _isInstantiated = false;

  static final BuildConfig instance = BuildConfig._internal();

  BuildConfig._internal();

  factory BuildConfig.instantiate({
    required EnvConfig config,
    required Environment type,
  }) {
    if (instance._isInstantiated) return instance;

    instance.envConfig = config;
    instance.environment = type;
    instance._isInstantiated = true;

    return instance;
  }
}
