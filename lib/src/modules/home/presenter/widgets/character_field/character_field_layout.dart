import 'package:flutter/material.dart';

class CharacterFieldLayout extends StatelessWidget {

  final Widget child;
  final Color color;
  final Color borderColor;

  const CharacterFieldLayout({
    Key? key,
    required this.child,
    required this.color,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: 54,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          width: 1.5,
          color: borderColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: child,
    );
  }
}
