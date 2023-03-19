import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:wozle/src/modules/home/presenter/widgets/character_field/character_field.dart';
import 'package:wozle/src/modules/home/presenter/widgets/character_field/character_field_controller.dart';
import 'package:wozle/src/modules/home/presenter/widgets/word_form/word_form_controller.dart';

class WordForm extends StatefulWidget {
  final int index;
  final bool isActive;
  final String word;
  final Function activeNextForm;
  final Function addWordToList;
  final _controller = Get.find<WordFormController>();

  WordForm({
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


  @override
  void initState() {
    super.initState();

    _children = _buildChildren();
  }

  @override
  void didUpdateWidget(covariant WordForm oldWidget) {
    Logger().d("WordFormList: ${widget.index} ${widget.isActive} ${widget.word}");
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
          onChanged: (index < 4       )
              ? (BuildContext context, String value) {
                  FocusScope.of(context).nextFocus();
                  widget._controller.addChar(index, value);
                }
              : (BuildContext context, String value) async {
                  FocusScope.of(context).unfocus();
                  widget._controller.addChar(index, value);
                  await _startAnimation();
                  widget.activeNextForm();
                  Logger().d("WordForm ${widget._controller.word.value}");
                  widget.addWordToList(widget._controller.word.value);
                },
          animation: _animationController[index],
          characterFieldController: CharacterFieldController(),
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
