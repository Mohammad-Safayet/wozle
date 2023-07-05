import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:wozle/src/core/utils/error_handling/error_handling.dart';
import 'package:wozle/src/modules/wozle/infra/models/progression.dart';
import 'package:wozle/src/modules/wozle/infra/repositories/progression_repo.dart';

class GetProgressionUsecase {
  final ProgressionRepository repository;

  GetProgressionUsecase({
    required this.repository,
  });

  Future<Either<FailureEntity, Progression>> call() async {
    try {
      final progression = await repository.getData();

      return Right(progression);
    } on ServerException {
      return const Left(ServerFailure());
    } on NoConnectionException {
      return const Left(NoConnectionFailure());
    } catch (e) {
      Logger().e("error: $e");
      return const Left(UnknownFailure());
    }
  }
}
