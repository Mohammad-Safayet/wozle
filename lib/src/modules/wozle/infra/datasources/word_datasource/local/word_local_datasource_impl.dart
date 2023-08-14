import 'package:logger/logger.dart';

import 'package:wozle/src/core/constants/app_strings.dart';
import 'package:wozle/src/core/drivers/local_storage/local_storage.dart';
import 'package:wozle/src/core/extensions/extensions.dart';
import 'package:wozle/src/modules/wozle/domain/entities/daily_word_entity.dart';
import 'package:wozle/src/modules/wozle/infra/datasources/word_datasource/local/word_local_datasource.dart';
import 'package:wozle/src/modules/wozle/infra/models/models.dart';

class WordLocalDatasourceImpl extends WordLocalDataSource {
  final LocalStorage localStorage;

  WordLocalDatasourceImpl({
    required this.localStorage,
  });

  @override
  Future<DailyWord?> getData() async {
    try {
      final now = DateTime.now();

      final list = await _getTheDailyWordList();

      DailyWord? word;
      for (var element in list) {
        if (element.dateTime.compareOnlyDate(now)) {
          word = element;
          break;
        }
      }

      return word;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future saveData(DailyWord dailyWord) async {
    try {
      final list = await _getTheDailyWordList();
      list.add(dailyWord);

      final listEntity = list.map((e) => e.toEntity()).toList();
      final box = await localStorage.openBox<List>(kWordHiveBox);

      await box.delete(kWordHivePropsKey);
      await box.put(kWordHivePropsKey, listEntity);
      Logger().d(listEntity);

      await box.close();
      return true;
    } catch (e, stacktrace) {
      Logger().e("Eroor on saveData: ${e.toString()} ${stacktrace.toString()}");
      rethrow;
    }
  }

  Future<List<DailyWord>> _getTheDailyWordList() async {
    try {
      final box = await localStorage.openBox<List>(kWordHiveBox);
      final list = box.get(kWordHivePropsKey)?.cast<DailyWordEntity>();
      
      if (list != null) {
        final List<DailyWord> models = [];

        for (DailyWordEntity element in list) {
          models.add(element.toModel());
        }

        await box.close();
        return models;
      }

      await box.close();
      return [];
    } catch (e) {
      Logger().e("Eroor on _getTheDailyWordList: ${e.toString()}");
      rethrow;
    }
  }
}
