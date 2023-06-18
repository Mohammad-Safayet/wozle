import 'package:wozle/src/core/utils/error_handling/error_object.dart';
import 'package:wozle/src/core/utils/error_handling/failure_entity.dart';

extension ErrorObjectExtension on ErrorObject {
  static ErrorObject mapToErrorObject({required FailureEntity failure}) {
    return failure.when(
      serverFailure: () => const ErrorObject(
        title: 'INTERNAL SERVER FAILURE',
        message:
            'It seems that the server is not reachable at the moment, try again later, should the issue persist please reach out to the developer.',
      ),
      noConnectionFailure: () => const ErrorObject(
        title: 'NO CONNECTIVITY',
        message:
            'It seems that your device is not connected to the network, please check your internet connectivity or try again later.',
      ),
      unknownFailure: () => const ErrorObject(
        title: 'UNKNOWN ERROR OCCOURED',
        message:
            'It seems that some unexpected error occoured. Please try again later.',
      ),
    );
  }
}
