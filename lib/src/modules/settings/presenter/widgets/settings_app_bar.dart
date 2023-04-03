import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wozle/src/core/constants/theme/text_theme_dark.dart';

class SettingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      shadowColor: Theme.of(context).colorScheme.primary,
      elevation: 12.0,
      title: const Text(
        "Settings",
        style: kAppBarTitleTextStyle,
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
