import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:wozle/src/modules/wozle/domain/repositories/word_repo_impl.dart';
import 'package:wozle/src/modules/wozle/infra/datasources/word_datasource/local/word_local_datasource.dart';
import 'package:wozle/src/modules/wozle/infra/datasources/word_datasource/remote/word_remote_datasource.dart';
import 'package:wozle/src/modules/wozle/infra/models/models.dart';
import 'package:wozle/src/modules/wozle/infra/repositories/word_repo.dart';

import '../infra/word_datasource_test.dart';
import 'word_repo_test.mocks.dart';

@GenerateMocks(
  [
    WordRemoteDataSource,
    WordLocalDataSource,
    DailyWord,
  ],
)
void main() {
  group(
    "Word Repository Test",
    () {
      late final WordRepository wordRepository;

      final WordLocalDataSource localDataSource = MockWordLocalDataSource();
      final WordRemoteDataSource remoteDataSource = MockWordRemoteDataSource();

      setUpAll(() {
        wordRepository = WordRepositoryImpl(
          localDatasource: localDataSource,
          remoteDataSource: remoteDataSource,
        );
      });

      test(
        "throws execption if there is problem in the internet connection",
        () async {
          when(localDataSource.getData()).thenAnswer(
            (_) async => null,
          );

          final testException = Exception("Test exception");
          when(remoteDataSource.getData()).thenThrow(testException);

          expect(
            () => wordRepository.getDailyWord(),
            throwsException,
          );
        },
      );



      tearDownAll(() {
        resetMockitoState();
      });
    },
  );
}
