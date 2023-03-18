import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:wozle/src/modules/home/home.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      // binding: HomeBinding(),
    ),
  ];
}
