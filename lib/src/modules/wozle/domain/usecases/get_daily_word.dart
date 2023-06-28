import 'package:dartz/dartz.dart';
import 'package:wozle/src/core/utils/error_handling/error_handling.dart';
import 'package:wozle/src/modules/wozle/infra/models/models.dart';
import 'package:wozle/src/modules/wozle/infra/repositories/word_repo.dart';

class GetDailyWordUsecase {
  final WordRepository wordRepository;

  GetDailyWordUsecase({
    required this.wordRepository,
  });

  Future<Either<FailureEntity, DailyWord>> call() async {
    try {
      final word = await wordRepository.getDailyWord();

      return Right(word);
    } on ServerException {
      return const Left(ServerFailure());
    } on NoConnectionException {
      return const Left(NoConnectionFailure());
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }
}
