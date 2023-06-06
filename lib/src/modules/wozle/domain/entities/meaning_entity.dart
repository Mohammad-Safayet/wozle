import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:wozle/src/modules/wozle/domain/entities/definition_entity.dart';

part 'meaning_entity.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class MeaningEntity extends HiveObject {
  @HiveField(0)
  final String partOfSpeech;
  @HiveField(1)
  final List<DefinitionEntity> definitions;

  MeaningEntity({
    required this.partOfSpeech,
    required this.definitions,
  });

  factory MeaningEntity.fromJson(Map<String, dynamic> json) =>
      _$MeaningEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MeaningEntityToJson(this);
}
