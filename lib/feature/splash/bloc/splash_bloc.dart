import 'dart:async';

import 'package:authorization/authorization.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:moneymanage/feature/home/home.dart';
import 'package:moneymanage/feature/onboarding/onboarding.dart';
import 'package:moneymanage/router/router.dart';

import 'splash_event.dart';
import 'splash_state.dart';

export 'splash_event.dart';
export 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc({
    required AppRouter appRouter,
    required IsFirstLaunchUseCase isFirstLaunchUseCase,
    required IsUserAuthorizedUseCase isUserAuthorizedUseCase,
  })  : _appRouter = appRouter,
        _isFirstLaunchUseCase = isFirstLaunchUseCase,
        _isUserAuthorizedUseCase = isUserAuthorizedUseCase,
        super(SplashInitial()) {
    on<InitEvent>(_onInitEvent);
    on<AppStarted>(_onStartedEvent);
  }
  final AppRouter _appRouter;
  final IsFirstLaunchUseCase _isFirstLaunchUseCase;
  final IsUserAuthorizedUseCase _isUserAuthorizedUseCase;

  Future<void> _onInitEvent(InitEvent event, Emitter<SplashState> emit) async {}

  Future<void> _onStartedEvent(
      AppStarted event, Emitter<SplashState> emit) async {
    if (_isFirstLaunchUseCase.execute(NoParams())) {
      _appRouter.replace(Onboarding.page());
      emit(state);
      return;
    }
    _appRouter.replace(Home.page);
    if (_isUserAuthorizedUseCase.execute(NoParams())) {
      _appRouter.replace(Home.page);
      emit(state);
      return;
    }
    if (!_isUserAuthorizedUseCase.execute(NoParams())) {
      _appRouter.replace(AuthFeature.page());
      emit(state);
    }
  }
}
