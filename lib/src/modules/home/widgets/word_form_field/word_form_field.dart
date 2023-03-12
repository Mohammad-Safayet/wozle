import 'package:flutter/material.dart';
import 'package:wozle/src/modules/home/widgets/word_field.dart';

class WordFormField extends StatelessWidget {
  final int size;

  const WordFormField({
    Key? key,
    required this.size,
  }) : super(key: key);

  List<Widget> _buildChildren() {
    final List<Widget> children = [];

    for (var index = 0; index < size; index++) {
      if (index < size - 1) {
        
      children.add(
        WordField(
          onChanged: (BuildContext context) =>
              FocusScope.of(context).nextFocus(),
        ),
      );
      } else {
        
      children.add(
        WordField(
          onChanged: (BuildContext context) =>
              FocusScope.of(context).unfocus(),
        ),
      );
      }
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    final children = _buildChildren();

    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }
}
