import 'package:freezed_annotation/freezed_annotation.dart';

part 'progression.freezed.dart';

@freezed
class Progression with _$Progression{
  const factory Progression({
    required int totalTimePlayed,
    required int winRatio,
    required int currentStreak,
    required int maxStreak,
  }) = _Progression;
}
