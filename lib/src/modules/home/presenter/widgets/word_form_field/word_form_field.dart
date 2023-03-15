import 'package:flutter/material.dart';

import 'package:wozle/src/modules/home/presenter/widgets/character_field/character_field.dart';

class WordFormField extends StatefulWidget {
  final int size;

  const WordFormField({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  State<WordFormField> createState() => _WordFormFieldState();
}

class _WordFormFieldState extends State<WordFormField>
    with TickerProviderStateMixin {

  final List<AnimationController> _animationController = [];
  AnimationStatus _status = AnimationStatus.dismissed;
  late List<Widget> _children;

  @override
  void initState() {
    super.initState();

    _children = _buildChildren();
  }

  List<Widget> _buildChildren() {
    final List<Widget> children = [];

    for (var index = 0; index < widget.size; index++) {
      final animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 500,
        ),
      );

      animationController.addStatusListener((status) {
        _status = status;
        setState(() {});
      });

      _animationController.add(animationController);

      if (index < widget.size - 1) {
        children.add(
          CharacterField(
            index: index,
            onChanged: (BuildContext context) {
              FocusScope.of(context).nextFocus();
            },
            animation: _animationController[index],
          ),
        );
      } else {
        children.add(
          CharacterField(
            index: index,
            onChanged: (BuildContext context) async {
              FocusScope.of(context).unfocus();
              await _startAnimation();
            },
            animation: _animationController[index],
          ),
        );
      }
    }

    return children;
  }

  Future<void> _startAnimation() async {
    for (var i = 0; i < widget.size; i++) {
      Future.delayed(const Duration(milliseconds: 10000));
      _animationController[i].forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _children,
      ),
    );
  }
}
