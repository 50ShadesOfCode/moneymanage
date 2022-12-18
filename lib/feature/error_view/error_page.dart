import 'package:flutter/material.dart';
import 'package:moneymanage/router/page_with_scaffold_key.dart';

class ErrorPage extends PageWithScaffoldKey<dynamic> {
  final String message;

  ErrorPage({required this.message});

  @override
  Route<dynamic> createRoute(BuildContext context) =>
      MaterialPageRoute<dynamic>(
        settings: this,
        builder: (BuildContext context) => SafeArea(
          child: ScaffoldMessenger(
            key: scaffoldKey,
            child: Scaffold(
              body: Center(
                child: Text(message),
              ),
            ),
          ),
        ),
      );
}
