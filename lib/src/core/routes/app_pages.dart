import 'package:get/get.dart';

import 'package:wozle/src/modules/home/home.dart';
import 'package:wozle/src/modules/wozle/presenter/bindings/word_form_bindings.dart';
import 'package:wozle/src/modules/wozle/presenter/bindings/word_form_list_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      bindings: [
        WordFormListBinding(),
        WordFormBinding(),
      ],
    ),
  ];
}
