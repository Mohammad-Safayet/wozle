import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:wozle/src/modules/shared/services/settings_service.dart';
import 'package:wozle/src/modules/shared/services/shared_prefs_service.dart';

@GenerateMocks([])
void main() {
  group(
    "isDarkModeOn value test",
    () {
      test(
        "Default value true if not set",
        () async {
          SharedPrefsService.setMockValues({});
          final SharedPrefsService sharedPrefsService = SharedPrefsService();
          await sharedPrefsService.init();

          final SettingsService settingsService = SettingsService(
            storage: sharedPrefsService,
          );

          const expectedValue = true;
          final actualValue = settingsService.isDarkModeOn.value;

          expect(actualValue, expectedValue);
        },
      );

      test(
        "Set value to false",
        () async {
          SharedPrefsService.setMockValues({});
          final SharedPrefsService sharedPrefsService = SharedPrefsService();
          await sharedPrefsService.init();

          final SettingsService settingsService = SettingsService(
            storage: sharedPrefsService,
          );

          const expectedValue = false;

          await settingsService.changeIsDarkMode(false);
          final actualValue = settingsService.isDarkModeOn.value;

          expect(actualValue, expectedValue);
        },
      );
    },
  );
  
  group(
    "isHardMode value test",
    () {
      test(
        "Default value false if not set",
        () async {
          SharedPrefsService.setMockValues({});
          final SharedPrefsService sharedPrefsService = SharedPrefsService();
          await sharedPrefsService.init();

          final SettingsService settingsService = SettingsService(
            storage: sharedPrefsService,
          );

          const expectedValue = false;
          final actualValue = settingsService.isHardMode.value;

          expect(actualValue, expectedValue);
        },
      );

      test(
        "Set value to true",
        () async {
          SharedPrefsService.setMockValues({});
          final SharedPrefsService sharedPrefsService = SharedPrefsService();
          await sharedPrefsService.init();

          final SettingsService settingsService = SettingsService(
            storage: sharedPrefsService,
          );

          const expectedValue = true;

          await settingsService.changeIsHardMode(true);
          final actualValue = settingsService.isHardMode.value;

          expect(actualValue, expectedValue);
        },
      );
    },
  );
  
  group(
    "isDialogOnStartOn value test",
    () {
      test(
        "Default value false if not set",
        () async {
          SharedPrefsService.setMockValues({});
          final SharedPrefsService sharedPrefsService = SharedPrefsService();
          await sharedPrefsService.init();

          final SettingsService settingsService = SettingsService(
            storage: sharedPrefsService,
          );

          const expectedValue = false;
          final actualValue = settingsService.isDialogOnStartOn.value;

          expect(actualValue, expectedValue);
        },
      );

      test(
        "Set value to true",
        () async {
          SharedPrefsService.setMockValues({});
          final SharedPrefsService sharedPrefsService = SharedPrefsService();
          await sharedPrefsService.init();

          final SettingsService settingsService = SettingsService(
            storage: sharedPrefsService,
          );

          const expectedValue = true;

          await settingsService.changeIsDialogOnStartOn(true);
          final actualValue = settingsService.isDialogOnStartOn.value;

          expect(actualValue, expectedValue);
        },
      );
    },
  );
}
