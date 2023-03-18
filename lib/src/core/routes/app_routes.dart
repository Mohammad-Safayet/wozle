part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const MAIN = _Paths.MAIN;
  static const HOME = _Paths.HOME;
}

abstract class _Paths {
  static const MAIN = '/main';
  static const HOME = '/home';
}
