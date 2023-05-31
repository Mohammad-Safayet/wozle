import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure_entity.freezed.dart';

@freezed
class FailureEntity with _$FailureEntity {
  const FailureEntity._();

  const factory FailureEntity.serverFailure() = ServerFailure;

  const factory FailureEntity.noConnectionFailure() = NoConnectionFailure;
}