import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wozle/src/app.dart';

import 'package:wozle/src/modules/shared/drivers/settings_service.dart';

class SettingsController extends GetxController {
  static SettingsController get to => Get.find();

  final isDarkModeOn = true.obs;
  final isHardModeOn = false.obs;
  final isDialogOnStartOn = true.obs;

  final SettingsService settingsService;

  SettingsController({
    required this.settingsService,
  }) {
    isDarkModeOn.value = settingsService.isDarkModeOn.value;
    isHardModeOn.value = settingsService.isHardMode.value;
    isDialogOnStartOn.value = settingsService.isDialogOnStartOn.value;
  }

  Future<bool> changeIsDarkMode( BuildContext context,bool value) async {
    isDarkModeOn.value = value;
    if (value == true) {
      Application.of(context).changeTheme(ThemeMode.dark);
    } else {
      Application.of(context).changeTheme(ThemeMode.light);
    }
    return settingsService.changeIsDarkMode(value);
  }
}
