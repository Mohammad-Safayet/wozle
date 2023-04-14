part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const WOZLE = _Paths.WOZLE;
  static const SETTINGS = _Paths.SETTINGS;
}

abstract class _Paths {
  static const HOME = '/home';
  static const WOZLE = '/wozle';
  static const SETTINGS = '/settings';
}
