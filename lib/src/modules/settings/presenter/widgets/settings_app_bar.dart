import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      shadowColor: Theme.of(context).colorScheme.primary,
      elevation: 12.0,
      title: Text(
        "Settings",
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
          fontSize: 32.0,
          letterSpacing: 1.15,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
