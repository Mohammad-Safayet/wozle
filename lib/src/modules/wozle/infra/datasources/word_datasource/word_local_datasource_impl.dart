import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

import 'package:wozle/src/core/constants/app_strings.dart';
import 'package:wozle/src/modules/wozle/domain/entities/daily_word_entity.dart';
import 'package:wozle/src/modules/wozle/infra/datasources/word_datasource/word_datasource.dart';
import 'package:wozle/src/modules/wozle/infra/models/models.dart';
import 'package:wozle/src/core/extensions/extensions.dart';

class WordLocalDatasourceImpl extends WordDataSource {
  final futureBox = Hive.openBox<List>(kWordHiveBox);


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

      final box = await futureBox;

      await box.delete(kWordHivePropsKey);
      await box.put(kWordHivePropsKey, listEntity);

      return true;
    } catch (e) {
      Logger().e("Eroor on saveData: ${e.toString()}");

      rethrow;
    }
  }

  Future<List<DailyWord>> _getTheDailyWordList() async {
    try {
      final box = await futureBox;
      final list = box.get(kWordHivePropsKey)?.cast<DailyWordEntity>();

      if (list != null) {
        final listModel = list.map(
          (element) {
            return element.toModel();
          },
        ).toList();

        return listModel;
      }

      return [];
    } catch (e) {
      Logger().e("Eroor on _getTheDailyWordList: ${e.toString()}");
      rethrow;
    }
  }
}
