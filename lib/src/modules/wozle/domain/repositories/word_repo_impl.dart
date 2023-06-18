import 'package:wozle/src/modules/wozle/infra/datasources/word_local_datasource_impl.dart';
import 'package:wozle/src/modules/wozle/infra/datasources/word_remote_datasource_impl.dart';
import 'package:wozle/src/modules/wozle/infra/models/models.dart';
import 'package:wozle/src/modules/wozle/infra/repositories/word_repo.dart';

class WordRepositoryImpl extends WordRepository {
  final WordLocalDatasourceImpl localDatasourceImpl;
  final WordRemoteDataSourceImpl remoteDataSourceImpl;

  WordRepositoryImpl({
    required this.localDatasourceImpl,
    required this.remoteDataSourceImpl,
  });


  @override
  Future<DailyWord> getDailyWord() async {
    DailyWord? word = await localDatasourceImpl.getData();
    word ??= await remoteDataSourceImpl.getData();

    await localDatasourceImpl.saveData(word!);

    return word;
  }
  
}
