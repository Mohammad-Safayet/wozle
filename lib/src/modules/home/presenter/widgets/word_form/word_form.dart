import 'package:flutter/material.dart';

import 'package:wozle/src/modules/home/presenter/widgets/character_field/character_field.dart';

class WordForm extends StatefulWidget {
  final int size;
  final bool isActive;

  const WordForm({
    Key? key,
    required this.size,
    required this.isActive,
  }) : super(key: key);

  @override
  State<WordForm> createState() => _WordFormState();
}

class _WordFormState extends State<WordForm> with TickerProviderStateMixin {
  final List<AnimationController> _animationController = [];
  late List<Widget> _children;

  // final WordFormController _controller = WordFormController();

  @override
  void initState() {
    super.initState();

    _children = _buildChildren();
  }

  @override
  void dispose() {
    for (var element in _animationController) {
      element.dispose();
    }

    super.dispose();
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

  List<Widget> _buildChildren() {
    final List<Widget> children = [];

    for (var index = 0; index < widget.size; index++) {
      _animationController.add(_getAnimationController(index));

      children.add(
        CharacterField(
          index: index,
          onChanged: (index < widget.size - 1)
              ? (BuildContext context) {
                  FocusScope.of(context).nextFocus();
                }
              : (BuildContext context) async {
                  FocusScope.of(context).unfocus();
                  await _startAnimation();
                },
          animation: _animationController[index],
        ),
      );
    }

    return children;
  }

  AnimationController _getAnimationController(int index) {
    final animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: (800 * (index + 1)),
      ),
    );

    animationController.addStatusListener((_) {
      setState(() {});
    });

    return animationController;
  }

  Future<void> _startAnimation() async {
    for (var i = 0; i < widget.size; i++) {
      _animationController[i].forward();
    }
  }
}
