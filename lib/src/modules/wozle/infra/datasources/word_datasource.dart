import 'dart:convert';

import 'package:wozle/src/modules/wozle/infra/models/word.dart';

abstract class WordRemoteDataSource {
  Future<Word> getData(
    String endPoint, {
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  });

  Future<dynamic> postData(
    String endPoint, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  });
}
