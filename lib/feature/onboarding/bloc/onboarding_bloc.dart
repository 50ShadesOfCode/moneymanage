import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymanage/feature/home/home.dart';
import 'package:moneymanage/router/router.dart';

import 'onboarding_event.dart';
import 'onboarding_state.dart';

export 'onboarding_event.dart';
export 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final AppRouter _appRouter;
  final SetFirstLaunchUseCase _setFirstLaunchUseCase;

  OnboardingBloc({
    required AppRouter appRouter,
    required SetFirstLaunchUseCase setFirstLaunchUseCase,
  })  : _appRouter = appRouter,
        _setFirstLaunchUseCase = setFirstLaunchUseCase,
        super(const OnboardingState(index: 0)) {
    on<AddEvent>(_onAddEvent);
    on<SkipEvent>(_onSkipEvent);
  }

  Future<void> _onAddEvent(
      AddEvent event, Emitter<OnboardingState> emit) async {
    if (state.index == 2) {
      _setFirstLaunchUseCase.execute(NoParams());
      _appRouter.replace(Home.page);
      emit(state);
    } else {
      emit(state.copyWith(index: state.index + 1));
    }
  }

  Future<void> _onSkipEvent(
      SkipEvent event, Emitter<OnboardingState> emit) async {
    _appRouter.replace(Home.page);
    emit(state);
  }
}
