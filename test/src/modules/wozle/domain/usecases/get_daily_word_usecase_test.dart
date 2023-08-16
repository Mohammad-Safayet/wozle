import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wozle/src/core/utils/error_handling/error_handling.dart';
import 'package:wozle/src/core/utils/error_handling/execptions.dart';
import 'package:wozle/src/modules/wozle/domain/usecases/get_daily_word.dart';
import 'package:wozle/src/modules/wozle/infra/repositories/word_repo.dart';

import 'get_daily_word_usecase_test.mocks.dart';

@GenerateMocks(
  [
    WordRepository,
  ],
)
void main() {
  group("Get Daily Word Usecase Test", () {
    late final GetDailyWordUsecase getDailyWordUsecase;

    final MockWordRepository mockWordRepository = MockWordRepository();

    setUpAll(() {
      getDailyWordUsecase = GetDailyWordUsecase(
        wordRepository: mockWordRepository,
      );
    });

    test(
      "returns ServerFailure on ServerException",
      () async {
        when(getDailyWordUsecase.call()).thenThrow(
          ServerException(),
        );

        final data = await getDailyWordUsecase.call();
        
        expect(
          data,
          const Left(
            FailureEntity.serverFailure(),
          ),
        );
      },
    );

    tearDownAll(() {
      resetMockitoState();
    });
  });
}
