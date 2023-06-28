import 'package:hive_flutter/hive_flutter.dart';

import 'package:wozle/src/modules/wozle/domain/entities/entities.dart';
import 'package:wozle/src/modules/wozle/domain/entities/progression_entity.dart';

class HiveService {
  static Future init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(DailyWordEntityAdapter());
    Hive.registerAdapter(WordEntityAdapter());
    Hive.registerAdapter(MeaningEntityAdapter());
    Hive.registerAdapter(DefinitionEntityAdapter());
    Hive.registerAdapter(ProgressionEntityAdapter());
  }
}