import 'package:wozle/src/modules/wozle/domain/entities/definition_entity.dart';
import 'package:wozle/src/modules/wozle/domain/entities/meaning_entity.dart';
import 'package:wozle/src/modules/wozle/domain/entities/word_entity.dart';
import 'package:wozle/src/modules/wozle/infra/models/definition.dart';
import 'package:wozle/src/modules/wozle/infra/models/meaning.dart';
import 'package:wozle/src/modules/wozle/infra/models/word.dart';

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
