import 'package:flutter/material.dart';
import 'package:wozle/src/core/config/build_config.dart';

class CustomAboutDialog extends StatelessWidget {
  const CustomAboutDialog({
    Key? key,
    this.onClose,
    required this.config,
  }) : super(key: key);

  final Function? onClose;
  final BuildConfig config;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        height: 220,
        child: Column(
          children: [
            // Title
            Title(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              child: Text(
                config.envConfig.appName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            // info

            // close button
          ],
        ),
      ),
    );
  }
}
