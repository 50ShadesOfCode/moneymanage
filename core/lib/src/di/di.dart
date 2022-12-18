import 'package:core/src/global_context.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:moneymanage/router/app_route_information_parser.dart';
import 'package:moneymanage/router/router.dart';

final AppDI appDI = AppDI();
final GetIt appLocator = GetIt.instance;

class AppDI {
  void initDependencies() {
    appLocator.registerSingleton<AppExceptionMapper>(
      AppExceptionMapper(),
    );
    final AppRouter appRouter = AppRouter();

    appLocator.registerSingleton<AppRouter>(appRouter);
    appLocator.registerSingleton<AppRouteInformationParser>(
      AppRouteInformationParser(),
    );

    appLocator.registerLazySingleton<GlobalContext>(() => GlobalContext(
        getContext: () => appRouter.navigatorKey.currentContext!));
  }
}
