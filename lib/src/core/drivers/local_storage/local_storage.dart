import 'package:hive/hive.dart';

abstract class LocalStorage {
  Future<void> initialize({
    List<TypeAdapter<dynamic>> adapters,
  });

  Future<Box> openBox(String name);

  Future<void> closeBox();
}
