import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:wozle/src/modules/shared/dialogs/statistics_chart_dialog/models/guess_distribution.dart';

class StatisticsBarCharGraph extends StatefulWidget {
  const StatisticsBarCharGraph({Key? key}) : super(key: key);

  @override
  State<StatisticsBarCharGraph> createState() => _StatisticsBarCharGraphState();
}

class _StatisticsBarCharGraphState extends State<StatisticsBarCharGraph> {
  @override
  Widget build(BuildContext context) {
    final data = [
      GuessDistribution(
        guessNo: "1",
        successNo: 3,
      ),
      GuessDistribution(
        guessNo: "2",
        successNo: 17,
      ),
      GuessDistribution(
        guessNo: "3",
        successNo: 8,
      ),
      GuessDistribution(
        guessNo: "4",
        successNo: 0,
      ),
      GuessDistribution(
        guessNo: "5",
        successNo: 3,
      ),
      GuessDistribution(
        guessNo: "6",
        successNo: 1,
      ),
    ];

    return Container(
      height: 250,
      width: 300,
      padding: const EdgeInsets.all(16.0),
      child: FittedBox(
        fit: BoxFit.cover,
        child: SfCartesianChart(
          title: ChartTitle(
            text: "Guess Distribution".toUpperCase(),
            textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
            alignment: ChartAlignment.near,
          ),
          plotAreaBorderWidth: 0,
          series: <ChartSeries>[
            BarSeries<GuessDistribution, String>(
              dataSource: data,
              xValueMapper: (GuessDistribution gd, _) => gd.guessNo,
              yValueMapper: (GuessDistribution gd, _) => gd.successNo,
              width: 0.6,
              spacing: 0.2,
              color: Theme.of(context).colorScheme.primary,
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                labelPosition: ChartDataLabelPosition.inside,
                labelAlignment: ChartDataLabelAlignment.top,
              ),
            ),
          ],
          primaryXAxis: CategoryAxis(
            majorGridLines: const MajorGridLines(width: 0),
            isVisible: false,
          ),
          primaryYAxis: NumericAxis(
            majorGridLines: const MajorGridLines(width: 0),
            isVisible: false,
          ),
        ),
      ),
    );
  }
}
