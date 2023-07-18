import 'package:hive/hive.dart';

abstract class LocalStorage {
  Future<void> initialize();

  Future<Box> openBox(String name);

  Future<void> closeBox();
}
