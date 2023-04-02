import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    Key? key,
    required this.title,
    this.subTitle,
    required this.tailing,
  }) : super(key: key);

  final Widget title;
  final Widget? subTitle;
  final Widget tailing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              title,
              subTitle ?? Container(),
            ],
          ),
          tailing,
        ],
      ),
    );
  }
}
