import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

import 'package:wozle/src/modules/shared/drivers/http/http_driver.dart';

class HttpDriverImpl extends HttpDriver {
  final Client client;
  final timeLimit = const Duration(seconds: 30);

  HttpDriverImpl({
    required this.client,
  });

  @override
  Future<Response?> get(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    final Response? response;

    try {
      response = await client
          .get(
            url,
            headers: headers,
          )
          .timeout(timeLimit);

      return response;
    } catch (exception) {
      Logger().e(
        "HttpDriverImpl: ${client.toString()} get exception ${exception.toString()}",
      );
      rethrow;
    }
  }

  @override
  Future<Response?> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final Response? response;

    try {
      response = await client
          .post(
            url,
            headers: headers,
            body: body,
            encoding: encoding,
          )
          .timeout(timeLimit);

      return response;
    } catch (exception) {
      Logger().e(
        "HttpDriverImpl: ${client.toString()} post exception ${exception.toString()}",
      );
      rethrow;
    }
  }
}