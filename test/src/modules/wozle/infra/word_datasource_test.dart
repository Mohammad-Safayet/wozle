import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:wozle/src/core/drivers/http/http_driver.dart';
import 'package:wozle/src/modules/wozle/domain/entities/entities.dart';
import 'package:wozle/src/modules/wozle/infra/datasources/word_datasource/remote/word_remote_datasource.dart';
import 'package:wozle/src/modules/wozle/infra/datasources/word_datasource/remote/word_remote_datasource_impl.dart';
import 'package:wozle/src/modules/wozle/infra/models/models.dart';

import 'word_datasource_test.mocks.dart';

@GenerateMocks(
  [
    HttpDriver,
    WordEntity,
  ],
)
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  group(
    "WordRemoteDatasource Test",
    () async {
      await dotenv.load(fileName: "env/dev.env");
      late MockHttpDriver mockHttpDriver;

      setUpAll(() {
        mockHttpDriver = MockHttpDriver();
      });

      test(
        "returns a DailyWord if the getData completes successfully",
        () async {
          /// Mocking random words get
          when(
            mockHttpDriver.get(
              Uri.parse(
                "https://random-words5.p.rapidapi.com/getRandom?wordLength=5",
              ),
              headers: {
                "X-RapidAPI-Key":
                    "6f0fcf397bmsh133e8fa7b417a82p15ca75jsnf91462dce8bd",
                "X-RapidAPI-Host": "random-words5.p.rapidapi.com",
              },
            ),
          ).thenAnswer(
            (realInvocation) async => Response("licit", 200),
          );

          /// Mocking dictionaryapi get
          when(mockHttpDriver.get(
            Uri.parse("https://api.dictionaryapi.dev/api/v2/entries/en/licit"),
          )).thenAnswer(
            (realInvocation) async => Response(
              """
[{"word":"licit","meanings":[{"partOfSpeech":"adjective","definitions":[{"definition":"Not forbidden by formal or informal rules.","synonyms":[],"antonyms":[]},{"definition":"Explicitly established or constituted by law.","synonyms":[],"antonyms":[]}],"synonyms":["established","lawful","legal","appropriate","lawful","legit","legitimate"],"antonyms":["illicit"]}],"license":{"name":"CC BY-SA 3.0","url":"https://creativecommons.org/licenses/by-sa/3.0"},"sourceUrls":["https://en.wiktionary.org/wiki/licit"]}]
""",
              200,
            ),
          );

          final WordRemoteDataSource wordRemoteDataSource =
              WordRemoteDataSourceImpl(
            httpDriver: mockHttpDriver,
            baseUrl: "api.dictionaryapi.dev",
          );

          expect(
            await wordRemoteDataSource.getData(),
            isA<DailyWord>(),
          );
        },
      );

      test(
        "throws execption if the dictionaryapi api completes with an error",
        () async {
          /// Mocking random words get
          when(
            mockHttpDriver.get(
              Uri.parse(
                "https://random-words5.p.rapidapi.com/getRandom?wordLength=5",
              ),
              headers: {
                "X-RapidAPI-Key":
                    "6f0fcf397bmsh133e8fa7b417a82p15ca75jsnf91462dce8bd",
                "X-RapidAPI-Host": "random-words5.p.rapidapi.com",
              },
            ),
          ).thenAnswer(
            (realInvocation) async => Response("", 404),
          );

          final WordRemoteDataSource wordRemoteDataSource =
              WordRemoteDataSourceImpl(
            httpDriver: mockHttpDriver,
            baseUrl: "api.dictionaryapi.dev",
          );

          expect(
            wordRemoteDataSource.getData(),
            throwsException,
          );
        },
      );

      test(
        "throws execption if the random-words api completes with an error",
        () async {
          /// Mocking random words get
          when(
            mockHttpDriver.get(
              Uri.parse(
                "https://random-words5.p.rapidapi.com/getRandom?wordLength=5",
              ),
              headers: {
                "X-RapidAPI-Key":
                    "6f0fcf397bmsh133e8fa7b417a82p15ca75jsnf91462dce8bd",
                "X-RapidAPI-Host": "random-words5.p.rapidapi.com",
              },
            ),
          ).thenAnswer(
            (realInvocation) async => Response("licit", 200),
          );

          /// Mocking dictionaryapi get
          when(mockHttpDriver.get(
            Uri.parse("https://api.dictionaryapi.dev/api/v2/entries/en/licit"),
          )).thenAnswer(
            (realInvocation) async => Response(
              "",
              500,
            ),
          );

          final WordRemoteDataSource wordRemoteDataSource =
              WordRemoteDataSourceImpl(
            httpDriver: mockHttpDriver,
            baseUrl: "api.dictionaryapi.dev",
          );

          expect(
            wordRemoteDataSource.getData(),
            throwsException,
          );
        },
      );
    },
  );
}
