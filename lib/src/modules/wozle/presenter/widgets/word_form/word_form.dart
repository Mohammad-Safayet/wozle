import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:wozle/src/modules/wozle/presenter/widgets/character_field/character_field.dart';
import 'package:wozle/src/modules/wozle/presenter/widgets/character_field/character_field_controller.dart';
import 'package:wozle/src/modules/wozle/presenter/widgets/word_form/word_form_controller.dart';

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
  late final List<AnimationController> _animationController;
  late List<Widget> _children;
  late List<TextEditingController> _textEditingController;
  late List<FocusNode> _focusNodes;

  final zwspEditingValue = const TextEditingValue(
    text: '\u200b',
    selection: TextSelection(baseOffset: 1, extentOffset: 1),
  );

  @override
  void initState() {
    super.initState();

    _animationController = List.generate(
      5,
      (index) => _getAnimationController(index),
    );
    _focusNodes = List.generate(5, (index) => FocusNode());
    _textEditingController = List.generate(5, (index) {
      final ctrl = TextEditingController();
      ctrl.value = zwspEditingValue;
      return ctrl;
    });
    _children = _buildChildren();
  }

  @override
  void didUpdateWidget(covariant WordForm oldWidget) {
    Logger()
        .d("WordFormList: ${widget.index} ${widget.isActive} ${widget.word}");

    _children = _buildChildren();

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    for (var element in _animationController) {
      element.dispose();
    }

    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }

    for (var controller in _textEditingController) {
      controller.dispose();
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
      children.add(
        CharacterField(
          index: index,
          isReadOnly: widget.isActive,
          letter: (widget.word != "") ? widget.word[index] : "",
          animation: _animationController[index],
          characterFieldController: CharacterFieldController(),
          textEditingController: _textEditingController[index],
          focusNode: _focusNodes[index],
          onChanged: _textFieldOnChange,
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

  void _textFieldOnChange(int index, String value) async {
    widget._controller.addChar(value.replaceAll('\u200b', ''));

    if (value.length > 1) {
      if (index + 1 == _focusNodes.length) {
        widget.addWordToList(widget._controller.word.value);
        FocusScope.of(context).unfocus();
        await _startAnimation();
        widget.activeNextForm();
        widget._controller.reset();
      } else {
        _focusNodes[index + 1].requestFocus();
      }
    } else {
      widget._controller.deleteChar(index);
      _textEditingController[index].value = zwspEditingValue;
      if (index == 0) {
        FocusScope.of(context).unfocus();
      } else {
        _textEditingController[index - 1].value = zwspEditingValue;
        _focusNodes[index - 1].requestFocus();
      }
    }

    // widget._controller.addChar(index, value.replaceAll('\u200b', ''));
  }
}
