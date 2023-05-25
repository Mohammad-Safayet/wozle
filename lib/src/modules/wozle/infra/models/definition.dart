import 'package:freezed_annotation/freezed_annotation.dart';

part 'definition.freezed.dart';

@freezed
class Definition with _$Definition {
  const factory Definition({
    required String definition,
    required String example,
  }) = _Definition;
}
