import 'dart:convert';

abstract class WordRemoteDataSource {
  Future<dynamic> getData(
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
