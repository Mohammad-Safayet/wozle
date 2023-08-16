import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wozle/src/core/utils/error_handling/error_handling.dart';
import 'package:wozle/src/core/utils/error_handling/execptions.dart';
import 'package:wozle/src/modules/wozle/domain/usecases/get_daily_word.dart';
import 'package:wozle/src/modules/wozle/infra/models/daily_word.dart';
import 'package:wozle/src/modules/wozle/infra/repositories/word_repo.dart';

import 'get_daily_word_usecase_test.mocks.dart';

@GenerateMocks(
  [
    WordRepository,
    DailyWord,
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
        when(mockWordRepository.getDailyWord()).thenThrow(
          ServerException(),
        );

        final data = (await getDailyWordUsecase.call()).fold(
          (l) => l,
          (r) => r,
        );

        expect(
          data,
          const FailureEntity.serverFailure(),
        );
      },
    );

    test(
      "return NoConnectionFailure on NoConnectionException",
      () async {
        when(mockWordRepository.getDailyWord()).thenThrow(
          NoConnectionException(),
        );

        final data = (await getDailyWordUsecase.call()).fold(
          (l) => l,
          (r) => r,
        );

        expect(
          data,
          const FailureEntity.noConnectionFailure(),
        );
      },
    );

    test(
      "return NoConnectionFailure on TimeoutException",
      () async {
        when(mockWordRepository.getDailyWord()).thenThrow(
          TimeoutException(""),
        );

        final data = (await getDailyWordUsecase.call()).fold(
          (l) => l,
          (r) => r,
        );

        expect(
          data,
          const FailureEntity.noConnectionFailure(),
        );
      },
    );

    test(
      "return DailyWord data on successful call",
      () async {
        when(mockWordRepository.getDailyWord()).thenAnswer(
          (realInvocation) async => MockDailyWord(),
        );

        final data = (await getDailyWordUsecase.call()).fold(
          (l) => null,
          (r) => r,
        );

        expect(
          data,
          isA<DailyWord>(),
        );
      },
    );

    tearDownAll(() {
      resetMockitoState();
    });
  });
}
