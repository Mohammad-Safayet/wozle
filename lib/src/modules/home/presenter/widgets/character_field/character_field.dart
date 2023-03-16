import 'dart:math';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:wozle/src/modules/home/presenter/widgets/character_field/character_field_controller.dart';

import 'package:wozle/src/modules/home/presenter/widgets/character_field/character_field_layout.dart';
import 'package:wozle/src/modules/home/presenter/widgets/character_field/character_text_field.dart';

class CharacterField extends StatelessWidget {
  final int index;
  final Function onChanged;
  final Animation animation;

  final _controller = CharacterFieldController();

  CharacterField({
    Key? key,
    required this.index,
    required this.onChanged,
    required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (child, _) {
        // this boolean tells us if we're on the first or second half of the animation
        final isAnimationFirstHalf = animation.value.abs() < 0.5;
        // map values between [0, 1] to values between [0, pi]
        final rotationValue = animation.value * pi;
        // calculate the correct rotation angle depening on which page we need to show
        final rotationAngle =
            animation.value > 0.5 ? pi - rotationValue : rotationValue;
        // calculate tilt
        var tilt = (animation.value - 0.5).abs() - 0.5;
        // make this a small value (positive or negative as needed)
        tilt *= isAnimationFirstHalf ? -0.003 : 0.003;
        return Transform(
          transform: Matrix4.rotationY(rotationAngle),
          alignment: Alignment.center,
          child: CharacterFieldLayout(
            borderColor: Colors.black,
            color: isAnimationFirstHalf ? Colors.blueAccent : Colors.lightGreen,
            child: isAnimationFirstHalf
                ? CharacterTextField(onChanged: onCharChanged)
                : Center(
                    child: Text(
                      _controller.char.value,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
          ),
        );
      },
    );
  }

  void onCharChanged(BuildContext context, String value) {
    onChanged(context);
    _controller.setChar(value);
  }
}
