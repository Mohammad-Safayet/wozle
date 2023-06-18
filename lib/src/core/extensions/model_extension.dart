import 'package:wozle/src/modules/wozle/domain/entities/entities.dart';
import 'package:wozle/src/modules/wozle/infra/models/models.dart';

extension DefinitionExtension on Definition {
  DefinitionEntity toEntity() {
    return DefinitionEntity(
      definition: definition,
      example: example,
    );
  }
}

extension MeaningExtension on Meaning {
  MeaningEntity toEntity() {
    return MeaningEntity(
      partOfSpeech: partOfSpeech,
      definitions: definitions.map(
        (definition) {
          return definition.toEntity();
        },
      ).toList(),
    );
  }
}

extension WordExtension on Word {
  WordEntity toEntity() {
    return WordEntity(
      word: word,
      meanings: meanings.map((meaning) => meaning.toEntity()).toList(),
    );
  }
}

extension DailyWordExtension on DailyWord {
  DailyWordEntity toEntity() {
    return DailyWordEntity(
      time: dateTime,
      word: word.toEntity(),
    );
  }
}
