import 'dart:async';

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
      "return ServerFailure on ServerException",
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
    
    test(
      "return NoConnectionFailure on NoConnectionException",
      () async {
        when(getDailyWordUsecase.call()).thenThrow(
          NoConnectionException(),
        );

        final data = await getDailyWordUsecase.call();
        
        expect(
          data,
          const Left(
            FailureEntity.noConnectionFailure(),
          ),
        );
      },
    );
    
    test(
      "return NoConnectionFailure on TimeoutException",
      () async {
        when(getDailyWordUsecase.call()).thenThrow(
          TimeoutException(""),
        );

        final data = await getDailyWordUsecase.call();
        
        expect(
          data,
          const Left(
            FailureEntity.noConnectionFailure(),
          ),
        );
      },
    );

    tearDownAll(() {
      resetMockitoState();
    });
  });
}
