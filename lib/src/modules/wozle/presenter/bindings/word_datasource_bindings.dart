import 'package:get/get.dart';
import 'package:http/http.dart';

import 'package:wozle/src/core/constants/app_strings.dart';
import 'package:wozle/src/core/drivers/http/http_driver_impl.dart';
import 'package:wozle/src/core/drivers/local_storage/local_storage_impl.dart';
import 'package:wozle/src/modules/shared/services/local_storage_service.dart';
import 'package:wozle/src/modules/wozle/infra/datasources/word_datasource/local/word_local_datasource_impl.dart';
import 'package:wozle/src/modules/wozle/infra/datasources/word_datasource/remote/word_remote_datasource_impl.dart';

class WordDatasourceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => Client(),
    );

    Get.lazyPut(
      () => HttpDriverImpl(
        client: Get.find<Client>(),
      ),
    );

    Get.lazyPut(
      () => WordLocalDatasourceImpl(
        localStorage: LocalStorageService.localStorage,
      ),
    );

    Get.lazyPut(
      () => WordRemoteDataSourceImpl(
        baseUrl: kApiWordDictionaryUrl,
        httpDriver: Get.find<HttpDriverImpl>(),
      ),
    );
  }
}
