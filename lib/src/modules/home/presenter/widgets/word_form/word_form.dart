import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:wozle/src/modules/home/presenter/widgets/character_field/character_field.dart';
import 'package:wozle/src/modules/home/presenter/widgets/word_form/word_form_controller.dart';

class WordForm extends StatefulWidget {
  final int index;
  final bool isActive;
  final String word;
  final Function activeNextForm;
  final Function addWordToList;

  const WordForm({
    Key? key,
    required this.index,
    required this.isActive,
    required this.word,
    required this.activeNextForm,
    required this.addWordToList,
  }) : super(key: key);

  @override
  State<WordForm> createState() => _WordFormState();
}

class _WordFormState extends State<WordForm> with TickerProviderStateMixin {
  final List<AnimationController> _animationController = [];
  late List<Widget> _children;

  final _controller = WordFormController();

  @override
  void initState() {
    super.initState();

    _children = _buildChildren();
  }

  @override
  void didUpdateWidget(covariant WordForm oldWidget) {
    _children = _buildChildren();

    super.didUpdateWidget(oldWidget);
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
    Logger().d("WordFormList: ${widget.index} ${widget.isActive}");

    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _children,
      ),
    );
  }

  List<Widget> _buildChildren() {
    final List<Widget> children = [];

    for (var index = 0; index < 5; index++) {
      _animationController.add(_getAnimationController(index));

      children.add(
        CharacterField(
          index: index,
          isReadOnly: widget.isActive,
          letter: (widget.word != "") ? widget.word[index] : "",
          onChanged: (index < 5 - 1)
              ? (BuildContext context, String value) {
                  FocusScope.of(context).nextFocus();
                  _controller.addChar(value);
                }
              : (BuildContext context, String value) async {
                  FocusScope.of(context).unfocus();
                  _controller.addChar(value);
                  await _startAnimation();
                  widget.activeNextForm();
                  widget.addWordToList(_controller.word.value);
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

    return animationController;
  }

  Future<void> _startAnimation() async {
    for (var i = 0; i < 5; i++) {
      _animationController[i].forward();
    }
  }
}
