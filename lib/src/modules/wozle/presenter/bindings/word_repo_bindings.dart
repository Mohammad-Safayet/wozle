import 'package:get/get.dart';

import 'package:wozle/src/modules/wozle/domain/repositories/word_repo_impl.dart';
import 'package:wozle/src/modules/wozle/infra/datasources/word_datasource/local/word_local_datasource_impl.dart';
import 'package:wozle/src/modules/wozle/infra/datasources/word_datasource/remote/word_remote_datasource_impl.dart';
class WordRepoBinding extends Bindings {
  @override
  void dependencies() {
    final localDatasource = Get.find<WordLocalDatasourceImpl>();
    final remoteDatasource = Get.find<WordRemoteDataSourceImpl>();

    Get.lazyPut(
      () => WordRepositoryImpl(
        localDatasource: localDatasource,
        remoteDataSource: remoteDatasource,
      ),
    );
  }
}
