import 'dart:convert';

import 'package:http/http.dart';

abstract class HttpDriver {
  Future<Response> get(
    Uri url, {
    Map<String, String>? headers,
  });

  Future<Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  });
}
