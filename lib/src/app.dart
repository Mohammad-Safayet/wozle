import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wozle/src/modules/home/presenter/pages/home_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}
