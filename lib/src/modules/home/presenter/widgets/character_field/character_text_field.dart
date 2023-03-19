import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CharacterTextField extends StatefulWidget {
  final Function onChanged;
  final bool isReadOnly;

  const CharacterTextField({
    Key? key,
    required this.onChanged,
    required this.isReadOnly,
  }) : super(key: key);

  @override
  State<CharacterTextField> createState() => _CharacterTextFieldState();
}

class _CharacterTextFieldState extends State<CharacterTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        if (value.length == 1) {
          widget.onChanged(context, value);
        } 
      },
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      enabled: widget.isReadOnly,
      style: Theme.of(context).textTheme.headlineMedium,
      keyboardType: TextInputType.text,
      textAlign: TextAlign.center,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.singleLineFormatter,
      ],
    );
  }
}
