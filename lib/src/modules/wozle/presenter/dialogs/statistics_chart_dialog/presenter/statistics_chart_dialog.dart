import 'package:flutter/material.dart';

// import 'package:wozle/src/modules/wozle/presenter/dialogs/statistics_chart_dialog/controllers/statistics_chart_controller.dart';
import 'package:wozle/src/modules/wozle/presenter/dialogs/statistics_chart_dialog/presenter/dialog_heading.dart';
import 'package:wozle/src/modules/wozle/presenter/dialogs/statistics_chart_dialog/presenter/statistics_bar_chart_graph.dart';

class StatisticsChartDialog extends StatelessWidget {
  const StatisticsChartDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = StatisticsChartDialogController.to;

    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      child: SizedBox(
        height: 400,
        width: 300,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
            Container(
              height: 400,
              width: 300,
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 22.0,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Heading
                  StatisticsDialogHeading(),

                  // Statistics bar chart graph
                  StatisticsBarCharGraph(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
