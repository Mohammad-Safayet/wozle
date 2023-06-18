import 'package:wozle/src/modules/wozle/infra/models/models.dart';

abstract class WordRepository {
  Future<DailyWord> getDailyWord();
}