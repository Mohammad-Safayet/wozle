import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class CharacterTextField extends StatelessWidget {
  final Function onChanged;
  final bool isReadOnly;
  final TextEditingController textEditingController;
  final FocusNode focusNode;

  const CharacterTextField({
    Key? key,
    required this.onChanged,
    required this.isReadOnly,
    required this.textEditingController,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        Logger().d("textfieldvalue: $value");
        onChanged(value);
      },
      decoration: const InputDecoration(
        counterText: "",
        border: InputBorder.none,
      ),
      textInputAction: TextInputAction.done,
      controller: textEditingController,
      focusNode: focusNode,
      enabled: isReadOnly,
      textCapitalization: TextCapitalization.characters,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
      keyboardType: TextInputType.text,
      textAlign: TextAlign.center,
      inputFormatters: [
        LengthLimitingTextInputFormatter(2),
        FilteringTextInputFormatter.singleLineFormatter,
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
    );
  }
}
