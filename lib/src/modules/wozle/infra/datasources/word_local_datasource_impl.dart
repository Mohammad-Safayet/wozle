import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:wozle/src/core/constants/app_strings.dart';
import 'package:wozle/src/modules/wozle/infra/datasources/word_datasource.dart';
import 'package:wozle/src/modules/wozle/infra/models/models.dart';

class WordLocalDatasourceImpl extends WordDataSource {
  final lazyBox = Hive.openLazyBox(kWordHiveBox);

  @override
  Future<DailyWord?> getData() async {
    try {
      final date = DateTime.now();

      final list = await _getTheDailyWordList();
      Logger().d("List = $list");

      DailyWord? word;
      for (var element in list) {
        if (element.dateTime.isAfter(date)) {
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

      final box = await lazyBox;
      box.put(kWordHivePropsKey, list);

      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<DailyWord>> _getTheDailyWordList() async {
    final box = await lazyBox;

    final list = await box.get(kWordHivePropsKey) as List<DailyWord>;
    Logger().d("List = $list");

    return list;
  }
}
