import 'package:flutter/material.dart';

class CharacterCardField extends StatelessWidget {
  final Widget child;

  const CharacterCardField({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: child,
    );
  }
}
