import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wozle/src/modules/settings/presenter/pages/settings_controller.dart';
import 'package:wozle/src/modules/settings/presenter/widgets/settings_app_bar.dart';
import 'package:wozle/src/modules/settings/presenter/widgets/settings_tile.dart';
import 'package:wozle/src/modules/shared/drivers/storage_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final storage = StorageService.to;
  final controller = SettingsController.to;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        );

    return Scaffold(
      appBar: const SettingsAppBar(),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).colorScheme.background,
          padding: const EdgeInsets.symmetric(
            vertical: 24.0,
            horizontal: 18.0,
          ),
          child: Column(
            children: [
              SettingsTile(
                title: Text(
                  "Hard Mode",
                  style: textTheme,
                ),
                tailing: Obx(
                  () => Switch(
                    value: controller.isHardModeOn.value,
                    onChanged: (value) {
                      // controller.changeIsDarkMode(context, value);
                    },
                  ),
                ),
                subTitle: Text(
                  "Turns off the hints of the gussed word",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
              SizedBox(
                height: 25.0,
                child: Center(
                  child: Divider(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              SettingsTile(
                title: Text(
                  "Dark Theme",
                  style: textTheme,
                ),
                tailing: Obx(
                  () => Switch(
                    value: controller.isDarkModeOn.value,
                    onChanged: (value) {
                      controller.changeIsDarkMode(context, value);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
                child: Center(
                  child: Divider(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              SettingsTile(
                title: Text(
                  "Don't show dialog on start",
                  style: textTheme,
                ),
                tailing: Obx(
                  () => Switch(
                    value: controller.isHardModeOn.value,
                    onChanged: (value) {
                      // controller.changeIsDarkMode(context, value);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
                child: Center(
                  child: Divider(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              SettingsTile(
                title: Text(
                  "Feedback",
                  style: textTheme,
                ),
                tailing: TextButton(
                  onPressed: () {},
                  child: Text(
                    "E-mail",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
