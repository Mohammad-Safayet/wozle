import 'package:flutter/material.dart';

import 'package:wozle/src/core/constants/app_strings.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({
    Key? key,
    this.onClose,
  }) : super(key: key);

  final Function? onClose;

  Widget _instructionWidget(Text instruction) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 4.0),
          child: Text(
            "\u2022",
            style: TextStyle(fontSize: 30),
          ),
        ),
        Expanded(
          child: instruction, //text
        ),
      ],
    );
  }

  Widget _exampleField(Color color) {
    return Container(
      width: 18,
      height: 18,
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(2.0),
        ),
      ),
    );
  }

  Widget _exampleWidget(
    BuildContext context,
    Text example,
    bool? isRight,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              (isRight != null && isRight == true)
                  ? _exampleField(Colors.green)
                  : _exampleField(
                      Theme.of(context).colorScheme.background,
                    ),
              _exampleField(
                Theme.of(context).colorScheme.background,
              ),
              _exampleField(
                Theme.of(context).colorScheme.background,
              ),
              (isRight != null && isRight == false)
                  ? _exampleField(Colors.yellowAccent)
                  : _exampleField(
                      Theme.of(context).colorScheme.background,
                    ),
              _exampleField(
                Theme.of(context).colorScheme.background,
              ),
              _exampleField(
                Theme.of(context).colorScheme.background,
              ),
            ],
          ),
          const SizedBox(
            height: 2.0,
          ),
          example,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: SizedBox(
        height: 400,
        width: 400,
        child: Stack(
          children: [
            // close icon button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (onClose != null) {
                      onClose!();
                    }
                  },
                  icon: Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
            ),

            // Info content
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    kPlayInstructionHeading,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                  ),
                  Text(
                    kPlayInstructionTitle,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Instruction
                  _instructionWidget(
                    Text(
                      kPlayInstruction1,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                    ),
                  ),
                  _instructionWidget(
                    Text(
                      kPlayInstruction2,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                    ),
                  ),

                  // Examples
                  _exampleWidget(
                    context,
                    Text(
                      kPlayExample1,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                    ),
                    true,
                  ),
                  _exampleWidget(
                    context,
                    Text(
                      kPlayExample2,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                    ),
                    false,
                  ),
                  _exampleWidget(
                    context,
                    Text(
                      kPlayExample3,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                    ),
                    null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
