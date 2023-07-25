import 'package:wozle/src/modules/wozle/infra/models/daily_word.dart';

abstract class WordRemoteDataSource {
  Future<DailyWord?> getData();
}
