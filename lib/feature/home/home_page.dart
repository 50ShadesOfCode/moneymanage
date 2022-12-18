import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymanage/feature/home/home.dart';
import 'package:moneymanage/feature/home/home_bloc/home_bloc.dart';
import 'package:moneymanage/feature/home/home_form.dart';
import 'package:moneymanage/router/router.dart';

class HomePage extends Page<void> {
  @override
  String get name => Home.routeName;

  @override
  LocalKey get key => const ValueKey<String>(Home.routeName);

  @override
  Route<dynamic> createRoute(BuildContext context) {
    return MaterialPageRoute<void>(
      settings: this,
      builder: (BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (BuildContext context) => HomeBloc(
              appRouter: appLocator.get<AppRouter>(),
            ),
          ),
        ],
        child: const HomeForm(),
      ),
    );
  }
}
