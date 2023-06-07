import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:wozle/src/modules/wozle/infra/models/word.dart';

part 'daily_word.freezed.dart';

@freezed
class DailyWord with _$DailyWord {
  const factory DailyWord({
    required DateTime dateTime,
    required Word word,
  }) = _DailyWord;
}
