import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import 'package:wozle/src/core/utils/error_handling/error_handling.dart';
import 'package:wozle/src/core/drivers/http/http_driver.dart';

class HttpDriverImpl extends HttpDriver {
  final Client client;
  final timeLimit = const Duration(seconds: 10);

  HttpDriverImpl({
    required this.client,
  });

  @override
  Future<Response> get(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    final Response response;

    try {
      response = await client
          .get(
            url,
            headers: headers,
          )
          .timeout(timeLimit);

      if (response.statusCode == HttpStatus.ok) {
        return response;
      } else {
        if (response.statusCode == HttpStatus.requestTimeout) {
          throw NoConnectionException();
        }
        throw ServerException();
      }
    } on SocketException catch(_) {
      throw NoConnectionException();
    } catch (exception) {
      Logger().e(
        "HttpDriverImpl: ${client.toString()} get exception ${exception.toString()}",
      );
      rethrow;
    }
  }

  @override
  Future<Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final Response response;

    try {
      response = await client
          .post(
            url,
            headers: headers,
            body: body,
            encoding: encoding,
          )
          .timeout(timeLimit);
    } catch (exception) {
      Logger().e(
        "HttpDriverImpl: ${client.toString()} post exception ${exception.toString()}",
      );
      rethrow;
    }
    return response;
  }
}
