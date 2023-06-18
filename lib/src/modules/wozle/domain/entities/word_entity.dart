import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:wozle/src/modules/wozle/domain/entities/meaning_entity.dart';

part 'word_entity.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class WordEntity extends HiveObject {
  @HiveField(0)
  final String word;
  @HiveField(1)
  final List<MeaningEntity> meanings;

  WordEntity({
    required this.word,
    required this.meanings,
  });

  factory WordEntity.fromJson(Map<String, dynamic> json) =>
      _$WordEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WordEntityToJson(this);
}
