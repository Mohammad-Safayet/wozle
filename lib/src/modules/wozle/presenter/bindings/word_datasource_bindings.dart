import 'package:get/get.dart';
import 'package:http/http.dart';

import 'package:wozle/src/core/constants/app_strings.dart';
import 'package:wozle/src/modules/shared/drivers/http/http_driver_impl.dart';
import 'package:wozle/src/modules/wozle/infra/datasources/word_datasource/word_local_datasource_impl.dart';
import 'package:wozle/src/modules/wozle/infra/datasources/word_datasource/word_remote_datasource_impl.dart';

class WordDatasourceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => WordLocalDatasourceImpl(),
    );

    Get.lazyPut(
      () => WordRemoteDataSourceImpl(
        baseUrl: kApiWordDictionaryUrl,
        httpDriver: HttpDriverImpl(
          client: Client(),
        ),
      ),
    );
  }
}
