import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:wozle/src/core/extensions/entity_extension.dart';

import 'package:wozle/src/modules/shared/drivers/http/http_driver.dart';
import 'package:wozle/src/modules/wozle/domain/entities/word_entity.dart';
import 'package:wozle/src/modules/wozle/infra/datasources/word_datasource.dart';

class WordRemoteDataSourceImpl extends WordRemoteDataSource {
  final HttpDriver httpDriver;
  final String baseUrl;

  WordRemoteDataSourceImpl({
    required this.httpDriver,
    required this.baseUrl,
  });

  @override
  Future<dynamic> getData(
    String endPoint, {
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  }) async {
    try {
      final word = await httpDriver.get(
        Uri.https(
          "random-words5.p.rapidapi.com",
          "/getRandom",
          {'wordLength': '5'},
        ),
      );
      final response = await httpDriver.get(
        Uri.https(baseUrl, endPoint + word!.body, queryParams),
        headers: headers,
      );
      final decodedResponse = jsonDecode(utf8.decode(response!.bodyBytes));
      final WordEntity entity = WordEntity.fromJson(decodedResponse[0]);
      Logger().d("word : ${word.body} ${entity.toModel().toString()}");
    } catch (exception) {
      rethrow;
    }
  }

  @override
  Future<dynamic> postData(
    String endPoint, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    // TODO: implement postData
    throw UnimplementedError();
  }
}