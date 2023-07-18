import 'package:hive_flutter/hive_flutter.dart';

import 'package:wozle/src/core/drivers/local_storage/local_storage.dart';

class LocalStorageImpl extends LocalStorage {
  @override
  Future<void> closeBox() async {
    await Hive.close();
  }

  @override
  Future<void> initialize() async {
    await Hive.initFlutter();
  }

  @override
  Future<Box> openBox(String name) async {
    final box = await Hive.openBox(name);

    return box;
  }
  
}