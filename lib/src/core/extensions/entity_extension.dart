import 'package:wozle/src/modules/wozle/domain/entities/entities.dart';
import 'package:wozle/src/modules/wozle/infra/models/models.dart';

extension DefinitionEntityExtension on DefinitionEntity {
  Definition toModel() {
    return Definition(
      definition: definition,
      example: example,
    );
  }
}

extension MeaningEntityExtension on MeaningEntity {
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

extension WordEntityExtension on WordEntity {
  Word toModel() {
    return Word(
      word: word,
      meanings: meanings.map((meaning) => meaning.toModel()).toList(),
    );
  }
}

extension DailyWordEntityExtension on DailyWordEntity {
  DailyWord toModel() {
    return DailyWord(
      dateTime: time,
      word: word.toModel(),
    );
  }
}
