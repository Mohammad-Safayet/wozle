import 'package:hive/hive.dart';

abstract class LocalStorage {
  Future<void> initialize({
    List<TypeAdapter<dynamic>> adapters,
  });

  Future<Box<T>> openBox<T>(String name);

  Future<void> closeBox();
}
