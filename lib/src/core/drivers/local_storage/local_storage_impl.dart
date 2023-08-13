import 'package:hive_flutter/hive_flutter.dart';

import 'package:wozle/src/core/drivers/local_storage/local_storage.dart';

class LocalStorageImpl extends LocalStorage {
  @override
  Future<void> closeBox() async {
    try {
      await Hive.close();
    } catch (exception) {
      rethrow;
    }
  }

  @override
  Future<void> initialize({
    List<TypeAdapter<dynamic>> adapters = const [],
  }) async {
    try {
      await Hive.initFlutter();
      if (adapters.isNotEmpty) {
        for (var adapter in adapters) {
          Hive.registerAdapter(adapter);
        }
      }
    } catch (exception) {
      rethrow;
    }
  }

  @override
  Future<Box<T>> openBox<T>(String name) async {
    final box = await Hive.openBox<T>(name);

    return box;
  }
}
