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
  Future<void> initialize() async {
    try {
      await Hive.initFlutter();
    } catch (exception) {
      rethrow;
    }
  }

  @override
  Future<Box> openBox(String name) async {
    final box = await Hive.openBox(name);

    return box;
  }
}
