import 'package:wozle/src/core/drivers/local_storage/local_storage.dart';
import 'package:wozle/src/core/drivers/local_storage/local_storage_impl.dart';

import 'package:wozle/src/modules/wozle/domain/entities/entities.dart';
import 'package:wozle/src/modules/wozle/domain/entities/progression_entity.dart';

class LocalStorageService {
  static final LocalStorage localStorage = LocalStorageImpl();
  
  static Future init() async {
    localStorage.initialize(adapters: [
      DailyWordEntityAdapter(),
      DailyWordEntityAdapter(),
      WordEntityAdapter(),
      MeaningEntityAdapter(),
      DefinitionEntityAdapter(),
      ProgressionEntityAdapter(),
    ]);
  }
}
