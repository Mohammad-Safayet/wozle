import 'package:flutter/material.dart';

import 'package:wozle/src/core/utils/error_handling/error_handling.dart';

class ErrorPage extends StatelessWidget {
  final ErrorObject errorObject;

  const ErrorPage({
    Key? key,
    required this.errorObject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.center,
        color: Theme.of(context).colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image
            const Image(
              height: 150,
              image: AssetImage(
                // <a href="https://www.flaticon.com/free-icons/error" title="error icons">Error icons created by Freepik - Flaticon</a>
                "assets/imgs/warning.png",
              ),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                errorObject.title.toUpperCase(),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              ),
            ),

            // Message
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                errorObject.message,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
