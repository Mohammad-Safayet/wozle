import 'package:flutter/material.dart';

import 'package:wozle/src/core/constants/app_strings.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text(
          kAppName,
          style: TextStyle(
            fontSize: 45,
            letterSpacing: 1.5,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 5
              ..color = Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(
          kAppName,
          style: TextStyle(
            fontSize: 45,
            letterSpacing: 1.5,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ],
    );
  }
}
