import 'dart:math';

import 'package:flutter/material.dart';

import 'package:wozle/src/modules/home/presenter/widgets/character_field/character_card_field.dart';
import 'package:wozle/src/modules/home/presenter/widgets/character_field/character_text_field.dart';

class CharacterField extends StatefulWidget {
  final int index;
  final Function onChanged;
  final Animation animation;

  const CharacterField({
    Key? key,
    required this.index,
    required this.onChanged,
    required this.animation,
  }) : super(key: key);

  @override
  State<CharacterField> createState() => _CharacterFieldState();
}

class _CharacterFieldState extends State<CharacterField>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: 54,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        border: Border.all(
          width: 1.5,
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: _buildFlipAnim(),
    );
  }

  Widget _buildFlipAnim() {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (child, animation) {
        // this boolean tells us if we're on the first or second half of the animation
        final isAnimationFirstHalf = widget.animation.value.abs() < 0.5;
        // map values between [0, 1] to values between [0, pi]
        final rotationValue = widget.animation.value * pi;
        // calculate the correct rotation angle depening on which page we need to show
        final rotationAngle =
            widget.animation.value > 0.5 ? pi - rotationValue : rotationValue;
        // calculate tilt
        var tilt = (widget.animation.value - 0.5).abs() - 0.5;
        // make this a small value (positive or negative as needed)
        tilt *= isAnimationFirstHalf ? -0.003 : 0.003;
        return Transform(
          transform: Matrix4.rotationY(rotationAngle),
          alignment: Alignment.center,
          child: isAnimationFirstHalf
              ? CharacterTextField(onChanged: onChanged)
              : CharacterCardField(
                  child: Text(
                    "L",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
        );
      },
    );
  }

  void onChanged(BuildContext context) async {
    await widget.onChanged(context);
    // _animationController.forward();
    // setState(() {
    //   _displayFront = !_displayFront;
    // });
  }
}
