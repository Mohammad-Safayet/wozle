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
  final bool isReadOnly;
  final String letter;
  final CharacterFieldController characterFieldController;
  final TextEditingController textEditingController;
  final FocusNode focusNode;

  const CharacterField({
    Key? key,
    required this.index,
    required this.onChanged,
    required this.animation,
    required this.isReadOnly,
    required this.letter,
    required this.characterFieldController,
    required this.textEditingController,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    characterFieldController.setChar(letter);

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
            color: isAnimationFirstHalf
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
            child: isAnimationFirstHalf
                ? CharacterTextField(
                    isReadOnly: isReadOnly,
                    textEditingController: textEditingController,
                    focusNode: focusNode,
                    onChanged: onCharChanged,
                  )
                : Center(
                    child: Text(
                      characterFieldController.char.value,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
          ),
        );
      },
    );
  }

  void onCharChanged(String value) {
    Logger().d("textfieldvalue: $value");

    onChanged(index, value);
    characterFieldController.setChar(value);
  }
}
