import 'package:flutter/material.dart';
import 'package:wozle/src/core/constants/app_strings.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({super.key});

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

  Widget _exampleWidget(Text example, bool? isRight) {
    final wozleDefaultContainer = Container(
      width: 18,
      height: 18,
      margin: const EdgeInsets.all(2.0),
      color: Colors.blueGrey,
    );

    final wozleRightContainer = Container(
      width: 18,
      height: 18,
      margin: const EdgeInsets.all(2.0),
      color: Colors.green,
    );

    final wozleWrongContainer = Container(
      width: 18,
      height: 18,
      margin: const EdgeInsets.all(2.0),
      color: Colors.yellowAccent,
    );

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              (isRight != null && isRight == true)
                  ? wozleRightContainer
                  : wozleDefaultContainer,
              wozleDefaultContainer,
              wozleDefaultContainer,
              (isRight != null && isRight == false)
                  ? wozleWrongContainer
                  : wozleDefaultContainer,
              wozleDefaultContainer,
              wozleDefaultContainer,
            ],
          ),
          example,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
                  },
                  icon: Icon(Icons.close),
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
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    kPlayInstructionTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Instruction
                  _instructionWidget(
                    Text(
                      kPlayInstruction1,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  _instructionWidget(
                    Text(
                      kPlayInstruction2,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),

                  // Examples
                  _exampleWidget(
                    Text(
                      kPlayExample1,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    true,
                  ),
                  _exampleWidget(
                    Text(
                      kPlayExample2,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    false,
                  ),
                  _exampleWidget(
                    Text(
                      kPlayExample3,
                      style: Theme.of(context).textTheme.titleMedium,
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
