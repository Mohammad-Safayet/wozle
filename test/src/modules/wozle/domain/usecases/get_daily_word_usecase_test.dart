import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wozle/src/modules/wozle/infra/repositories/word_repo.dart';

@GenerateMocks([
  WordRepository
],)
void main() {
  group("Get Daily Word Usecase Test", () {
    setUpAll(() {});

    tearDownAll(() {
      resetMockitoState();
    });
  });
}
