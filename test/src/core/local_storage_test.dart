import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:wozle/src/core/drivers/local_storage/local_storage_impl.dart';
import 'package:wozle/src/core/drivers/local_storage/local_storage.dart';

import 'local_storage_test.mocks.dart';

@GenerateMocks([
  HiveInterface,
  Box,
  LocalStorage,
  LocalStorageImpl,
])
void main() {
  group("Local Storage Test", () {
    final localStorage = MockLocalStorageImpl();
    const String boxName = "temp";

    setUp(() async {
      await localStorage.initialize();
    });

    tearDown(() {});

    test("Local Storage Open Box", () async {
      when(
        localStorage.openBox(boxName),
      ).thenAnswer(
        (_) async => MockBox(),
      );

      expect(
        await localStorage.openBox(boxName),
        isA<MockBox>(),
      );
    });
  });
}
