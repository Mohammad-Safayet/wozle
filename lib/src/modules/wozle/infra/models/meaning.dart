import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:wozle/src/modules/wozle/infra/models/definition.dart';

part 'meaning.freezed.dart';

@freezed
class Meaning with _$Meaning {
  const factory Meaning({
    required String partOfSpeech,
    required List<Definition>  definitions,
  }) = _Meaning;
}
