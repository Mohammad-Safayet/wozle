import 'package:flutter/material.dart';

class StatisticsDialogHeading extends StatelessWidget {
  const StatisticsDialogHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Statistics",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),

          // Statistics
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleStatsItem(context, "21", "Played"),
                _titleStatsItem(context, "36", "Win %"),
                _titleStatsItem(context, "2", "Current Streak"),
                _titleStatsItem(context, "2", "Max Streak"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _titleStatsItem(
    BuildContext context,
    String data,
    String desc,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            data,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            desc,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
