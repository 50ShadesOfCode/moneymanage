import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/splash_bloc.dart';

class SplashForm extends StatefulWidget {
  const SplashForm({Key? key}) : super(key: key);

  @override
  State<SplashForm> createState() => _SplashFormState();
}

class _SplashFormState extends State<SplashForm> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2, milliseconds: 500),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn)
      ..addStatusListener(
        (AnimationStatus status) {
          if (status == AnimationStatus.completed) {
            BlocProvider.of<SplashBloc>(context).add(AppStarted());
          }
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: const SizedBox(
            width: 100,
            height: 100,
            child: Image(
              image: AssetImage(AppImages.logoPngKey),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
