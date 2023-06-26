import 'package:wozle/src/modules/wozle/infra/models/daily_word.dart';

abstract class WordDataSource {
  Future<DailyWord?> getData();

  Future<dynamic> saveData(DailyWord dailyWord);
}
