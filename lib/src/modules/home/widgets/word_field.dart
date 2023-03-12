import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WordField extends StatelessWidget {
  final Function onChanged;

  const WordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: 54,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        border: Border.all(
          width: 1.5,
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) onChanged(context);
        },
        onSaved: (newValue) {
          debugPrint("debug: HomeScreen TextField onSaved $newValue");
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        style: Theme.of(context).textTheme.headlineMedium,
        keyboardType: TextInputType.text,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.singleLineFormatter,
        ],
      ),
    );
  }
}
