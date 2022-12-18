import 'package:authorization/authorization_form.dart';
import 'package:authorization/bloc/auth_bloc.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymanage/router/router.dart';

class AuthPage extends Page<void> {
  const AuthPage();

  @override
  Route<dynamic> createRoute(BuildContext context) {
    return MaterialPageRoute<void>(
      settings: this,
      builder: (BuildContext context) => BlocProvider<AuthBloc>(
        create: (BuildContext context) => AuthBloc(
          appRouter: appLocator.get<AppRouter>(),
          signInUseCase: appLocator.get<SignInUseCase>(),
          exceptionMapper: appLocator.get<AppExceptionMapper>(),
        ),
        child: const AuthScreen(),
      ),
    );
  }
}
