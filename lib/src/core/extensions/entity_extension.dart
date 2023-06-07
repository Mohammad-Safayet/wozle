import 'package:wozle/src/modules/wozle/domain/entities/entities.dart';
import 'package:wozle/src/modules/wozle/infra/models/models.dart';

extension DefinitionExtension on DefinitionEntity {
  Definition toModel() {
    return Definition(
      definition: definition,
      example: example,
    );
  }
}

extension MeaningExtension on MeaningEntity {
  Meaning toModel() {
    return Meaning(
      partOfSpeech: partOfSpeech,
      definitions: definitions.map(
        (definition) {
          return definition.toModel();
        },
      ).toList(),
    );
  }
}

extension WordExtension on WordEntity {
  Word toModel() {
    return Word(
      word: word,
      meanings: meanings.map((meaning) => meaning.toModel()).toList(),
    );
  }
}

extension DailyWordExtension on DailyWordEntity {
  DailyWord toModel() {
    return DailyWord(
      dateTime: time,
      word: word,
    );
  }
}
