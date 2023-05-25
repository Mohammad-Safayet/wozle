import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:wozle/src/modules/wozle/infra/models/meaning.dart';

part 'word.freezed.dart';

@freezed
class Word with _$Word {
  const factory Word({
    required String word,
    required String origin,
    required List<Meaning>  meanings,
  }) = _Word;
}
