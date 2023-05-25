import 'package:json_annotation/json_annotation.dart';

part 'definition_entity.g.dart';

@JsonSerializable()
class DefinitionEntity {
  final String definition;
  final String example;

  DefinitionEntity({
    required this.definition,
    required this.example,
  });

  factory DefinitionEntity.fromJson(Map<String, dynamic> json) => _$DefinitionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DefinitionEntityToJson(this);

}
