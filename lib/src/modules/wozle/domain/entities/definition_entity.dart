import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'definition_entity.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class DefinitionEntity extends HiveObject {
  @HiveField(0)
  final String definition;
  @HiveField(1)
  final String? example;

  DefinitionEntity({
    required this.definition,
    this.example,
  });

  factory DefinitionEntity.fromJson(Map<String, dynamic> json) =>
      _$DefinitionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DefinitionEntityToJson(this);
}
