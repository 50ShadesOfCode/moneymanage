import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymanage/feature/error_view/error.dart';
import 'package:moneymanage/feature/home/home.dart';
import 'package:moneymanage/router/router.dart';

import 'auth_event.dart';
import 'auth_state.dart';

export 'auth_event.dart';
export 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthorizationState> {
  final AppRouter _appRouter;
  final SignInUseCase _signInUseCase;
  final AppExceptionMapper _exceptionMapper;

  AuthBloc({
    required AppRouter appRouter,
    required SignInUseCase signInUseCase,
    required AppExceptionMapper exceptionMapper,
  })  : _appRouter = appRouter,
        _signInUseCase = signInUseCase,
        _exceptionMapper = exceptionMapper,
        super(const AuthorizationState(
            username: '', password: '', needRegistration: false)) {
    on<SignInEvent>(_onSignInEvent);
    on<RegisterEvent>(_onRegisterEvent);
    on<OnRegisteredEvent>(_onOnRegisteredEvent);
  }

  Future<void> _onSignInEvent(
      SignInEvent event, Emitter<AuthorizationState> emit) async {
    try {
      if (validateCredentials(event.username, event.password)) {
        try {
          _signInUseCase.execute(<String>[event.username, event.password]);
        } catch (e) {
          _appRouter.push(
              ErrorRoute.page(_exceptionMapper.mapExceptionToErrorText(e)));
          emit(state);
          return;
        }
        _appRouter.replace(Home.page);
        emit(state.copyWith(
          username: event.username,
          password: event.password,
          needRegistration: false,
        ));
        return;
      }
    } on AppException catch (e) {
      _appRouter
          .push(ErrorRoute.page(_exceptionMapper.mapExceptionToErrorText(e)));
    }
  }

  Future<void> _onRegisterEvent(
      RegisterEvent event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
        username: state.username,
        password: state.password,
        needRegistration: true));
  }

  Future<void> _onOnRegisteredEvent(
      OnRegisteredEvent event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
        username: state.username,
        password: state.password,
        needRegistration: false));
  }
}

//TODO : Add validation
bool validateCredentials(String username, String password) {
  if (username.isNotEmpty && password.isNotEmpty) {
    return true;
  }
  return false;
}
