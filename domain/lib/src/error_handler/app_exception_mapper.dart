import 'package:core/core.dart';
import 'package:domain/domain.dart';

class AppExceptionMapper {
  String mapExceptionToErrorText(dynamic exception) {
    switch (exception.runtimeType) {
      case NoInternetError:
        return AppLocalizations.ofGlobalContext('errorsNoInternet');
      case AppException:
        return AppLocalizations.ofGlobalContext('errorsServer');
      default:
        return exception.toString();
    }
  }
}
