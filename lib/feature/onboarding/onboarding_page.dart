import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymanage/feature/onboarding/bloc/onboarding_bloc.dart';
import 'package:moneymanage/feature/onboarding/onboarding_form.dart';
import 'package:moneymanage/router/page_with_scaffold_key.dart';
import 'package:moneymanage/router/router.dart';

class OnboardingPage extends PageWithScaffoldKey<dynamic> {
  @override
  Route<dynamic> createRoute(BuildContext context) =>
      MaterialPageRoute<dynamic>(
        settings: this,
        builder: (BuildContext context) => BlocProvider<OnboardingBloc>(
          create: (_) => OnboardingBloc(
            appRouter: appLocator.get<AppRouter>(),
            setFirstLaunchUseCase: appLocator.get<SetFirstLaunchUseCase>(),
          ),
          child: SafeArea(
            child: ScaffoldMessenger(
              key: scaffoldKey,
              child: const OnboardingForm(),
            ),
          ),
        ),
      );
}
