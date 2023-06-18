import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_object.freezed.dart';

@freezed
class ErrorObject with _$ErrorObject {
  const factory ErrorObject({
    required String title,
    required String message,
  }) = _ErrorObject;
}