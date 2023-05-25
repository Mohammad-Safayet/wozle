import 'package:json_annotation/json_annotation.dart';

import 'package:wozle/src/modules/wozle/domain/entities/definition_entity.dart';

part 'meaning_entity.g.dart';

@JsonSerializable()
class MeaningEntity {
  final String partOfSpeech;
  final List<DefinitionEntity> definitions;

  MeaningEntity({
    required this.partOfSpeech,
    required this.definitions,
  });

  factory MeaningEntity.fromJson(Map<String, dynamic> json) => _$MeaningEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MeaningEntityToJson(this);

}
