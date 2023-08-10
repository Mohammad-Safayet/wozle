import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

import 'package:wozle/src/core/constants/app_strings.dart';
import 'package:wozle/src/core/extensions/entity_extension.dart';
import 'package:wozle/src/core/drivers/http/http_driver.dart';
import 'package:wozle/src/core/utils/error_handling/execptions.dart';
import 'package:wozle/src/modules/wozle/domain/entities/entities.dart';
import 'package:wozle/src/modules/wozle/domain/entities/word_entity.dart';
import 'package:wozle/src/modules/wozle/infra/datasources/word_datasource/remote/word_remote_datasource.dart';
import 'package:wozle/src/modules/wozle/infra/models/models.dart';

class WordRemoteDataSourceImpl extends WordRemoteDataSource {
  final HttpDriver httpDriver;
  final String baseUrl;

  WordRemoteDataSourceImpl({
    required this.httpDriver,
    required this.baseUrl,
  });

  @override
  Future<DailyWord> getData() async {
    try {
      final word = await _getRandomWord("5");

      final response = await httpDriver.get(
        Uri.https(
          baseUrl,
          "$kApiWordDictionaryEndpoint/$word",
        ),
      );

      if (response.statusCode == HttpStatus.ok) {
        final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
        final entity = WordEntity.fromJson(decodedResponse[0]);

        final dailyWord = DailyWord(
          dateTime: DateTime.now(),
          word: entity.toModel(),
        );
        Logger().d(dailyWord.toString());

        return dailyWord;
      } else {
        if (response.statusCode == HttpStatus.requestTimeout) {
          throw NoConnectionException();
        }
        throw ServerException();
      }
    } on SocketException catch (_) {
      throw NoConnectionException();
    } catch (exception) {
      Logger().e(
        "HttpDriverImpl: got exception ${exception.toString()}",
      );
      rethrow;
    }
  }

  Future<String> _getRandomWord(String wordLength) async {
    try {
      final headers = {
        dotenv.get(kEnvRapidApiKey): dotenv.get(kEnvRapidApiValue),
        dotenv.get(kEnvRapidApiHostKey): dotenv.get(kEnvRapidApiHostValue),
      };

      final response = await httpDriver.get(
        Uri.https(
          kApiRandomWordUrl,
          kApiRandomWordEndpoint,
          {'wordLength': wordLength},
        ),
        headers: headers,
      );

      if (response.statusCode == HttpStatus.ok) {
        final word = response.body;

        return word;
      } else {
        if (response.statusCode == HttpStatus.requestTimeout) {
          throw NoConnectionException();
        }
        throw ServerException();
      }
    } on SocketException catch (_) {
      throw NoConnectionException();
    } catch (exception) {
      Logger().e(
        "HttpDriverImpl: got exception ${exception.toString()}",
      );
      rethrow;
    }
  }
}
