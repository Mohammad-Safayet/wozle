import 'package:hive/hive.dart';

import 'package:wozle/src/modules/wozle/domain/entities/entities.dart';

part 'daily_word_entity.g.dart';

@HiveType(typeId: 4)
class DailyWordEntity extends HiveObject {
  @HiveField(1)
  DateTime time;

  @HiveField(2)
  WordEntity word;

  DailyWordEntity({
    required this.time,
    required this.word,
  });
}
