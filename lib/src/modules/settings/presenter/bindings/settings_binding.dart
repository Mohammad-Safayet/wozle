import 'package:get/get.dart';
import 'package:wozle/src/modules/settings/presenter/pages/settings_controller.dart';
import 'package:wozle/src/modules/shared/drivers/settings_service.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SettingsController(settingsService: SettingsService.to),
    );
  }
}
