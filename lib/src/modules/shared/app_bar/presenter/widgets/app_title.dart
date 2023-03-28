import 'package:flutter/material.dart';

import 'package:wozle/src/core/constants/app_strings.dart';
import 'package:wozle/src/core/constants/theme/text_theme.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      kAppName,
      style: kAppBarTitleTextStyle,
    );
  }
}
