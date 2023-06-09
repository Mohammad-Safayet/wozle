import 'package:get/get.dart';

import 'package:wozle/src/modules/home/home.dart';
import 'package:wozle/src/modules/home/presenter/bindings/home_binding.dart';
import 'package:wozle/src/modules/settings/presenter/bindings/settings_binding.dart';
import 'package:wozle/src/modules/settings/settings.dart';
import 'package:wozle/src/modules/wozle/presenter/bindings/progression_binding.dart';
import 'package:wozle/src/modules/wozle/presenter/bindings/word_datasource_bindings.dart';
import 'package:wozle/src/modules/wozle/presenter/bindings/word_form_bindings.dart';
import 'package:wozle/src/modules/wozle/presenter/bindings/word_form_list_binding.dart';
import 'package:wozle/src/modules/wozle/presenter/bindings/word_repo_bindings.dart';
import 'package:wozle/src/modules/wozle/presenter/bindings/wozle_binding.dart';
import 'package:wozle/src/modules/wozle/wozle.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WOZLE,
      page: () => const WozleView(),
      bindings: [
        WordFormListBinding(),
        WordFormBinding(),
        WordDatasourceBinding(),
        WordRepoBinding(),
        WozleBinding(),
        ProgressionBinding(),
      ],
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}
