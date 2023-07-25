import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:wozle/src/core/drivers/http/http_driver_impl.dart';

import 'http_driver_test.mocks.dart';

@GenerateMocks([
  Client,
])
void main() {
  group("HttpDriverTest", () {
    final mockClient = MockClient();

    setUp(() {});

    tearDown(() {
      mockClient.close();
    });

    test(
      "returns a http.Response if the http call completes successfully",
      () async {
        final httpDriver = HttpDriverImpl(client: mockClient);

        when(
          mockClient.get(
            Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
          ),
        ).thenAnswer(
          (_) async => Response('{"userId": 1, "id": 2, "title": "mock"}', 200),
        );

        expect(
          await httpDriver.get(
            Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
          ),
          isA<Response>(),
        );
      },
    );
    
    test(
      "throws an exception if the http call completes with an error",
      () async {
        final httpDriver = HttpDriverImpl(client: mockClient);

        when(
          mockClient.get(
            Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
          ),
        ).thenAnswer(
          (_) async => Response("Error", 400),
        );

        expect(
          httpDriver.get(
            Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
          ),
          throwsException,
        );
      },
    );
  });
}
