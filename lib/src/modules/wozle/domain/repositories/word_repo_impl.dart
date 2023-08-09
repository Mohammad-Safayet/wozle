import 'package:wozle/src/modules/wozle/infra/datasources/word_datasource/local/word_local_datasource.dart';
import 'package:wozle/src/modules/wozle/infra/datasources/word_datasource/remote/word_remote_datasource.dart';
import 'package:wozle/src/modules/wozle/infra/models/models.dart';
import 'package:wozle/src/modules/wozle/infra/repositories/word_repo.dart';

class WordRepositoryImpl extends WordRepository {
  final WordLocalDataSource localDatasource;
  final WordRemoteDataSource remoteDataSource;

  WordRepositoryImpl({
    required this.localDatasource,
    required this.remoteDataSource,
  });


  @override
  Future<DailyWord> getDailyWord() async {
    DailyWord? word = await localDatasource.getData();
    word ??= await remoteDataSource.getData();

    await localDatasource.saveData(word);

    return word;
  }
  
}
