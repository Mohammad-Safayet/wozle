import 'package:get/get.dart';

import 'package:wozle/src/core/constants/app_strings.dart';
import 'package:wozle/src/modules/shared/drivers/shared_prefs_service.dart';

class SettingsService extends GetxService {
  final isDarkModeOn = true.obs;
  final isHardMode = false.obs;
  final isDialogOnStartOn = true.obs;

  final SharedPrefsService storage;

  static SettingsService get to => Get.find();

  SettingsService({
    required this.storage,
  }) {
    init();
  }

  void init() {
    isDarkModeOn.value = storage.getBool(kSpIsDarkModeKey) ?? true;
    isHardMode.value = storage.getBool(kSpIsHardModeKey) ?? false;
    isDialogOnStartOn.value = storage.getBool(kSpOnStartKey) ?? false;
  }

  Future<bool> changeIsDarkMode(bool value) async {
    final result = await storage.setBool(kSpIsDarkModeKey, value);
    isDarkModeOn.value = value;

    return result;
  }

  Future<bool> changeIsHardMode(bool value) async {
    final result = await storage.setBool(kSpIsHardModeKey, value);
    isHardMode.value = value;

    return result;
  }

  Future<bool> changeIsDialogOnStartOn(bool value) async {
    final result = await storage.setBool(kSpOnStartKey, value);
    isHardMode.value = value;

    return result;
  }
}
