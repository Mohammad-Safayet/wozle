import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:wozle/src/modules/settings/presenter/widgets/settings_app_bar.dart';
import 'package:wozle/src/modules/settings/presenter/widgets/settings_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isHardMode = false;
  bool _isDarkMode = true;

  void onHardModeTap(bool value) {
    setState(() {
      _isHardMode = value;
    });
  }

  void onDarkThemeTap(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                tailing: Switch(
                  value: _isHardMode,
                  onChanged: (value) {
                    onHardModeTap(value);
                  },
                ),
                subTitle: Text(
                  "Turns off the hints of the gussed word",
                  style: Theme.of(context).textTheme.titleSmall,
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
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                tailing: Switch(
                  value: _isDarkMode,
                  onChanged: (value) {
                    onDarkThemeTap(value);
                  },
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
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                tailing: TextButton(
                  onPressed: () {},
                  child: Text(
                    "E-mail",
                    style: Theme.of(context).textTheme.headlineSmall,
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
