import 'package:json_annotation/json_annotation.dart';

import 'package:wozle/src/modules/wozle/domain/entities/meaning_entity.dart';

part 'word_entity.g.dart';

@JsonSerializable()
class WordEntity {
  final String word;
  final String origin;
  final List<MeaningEntity> meanings;

  WordEntity({
    required this.word,
    required this.origin,
    required this.meanings,
  });

  factory WordEntity.fromJson(Map<String, dynamic> json) => _$WordEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WordEntityToJson(this);
  
}
