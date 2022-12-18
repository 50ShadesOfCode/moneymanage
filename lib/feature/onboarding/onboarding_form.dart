import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymanage/feature/onboarding/bloc/onboarding_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'ui/onboarding_pages.dart';

class OnboardingForm extends StatefulWidget {
  const OnboardingForm({super.key});

  @override
  OnboardingFormState createState() => OnboardingFormState();
}

class OnboardingFormState extends State<OnboardingForm> {
  final GlobalKey<IntroductionScreenState> introKey =
      GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (BuildContext context, OnboardingState state) {
        return IntroductionScreen(
          key: introKey,
          pages: pages,
          showBackButton: false,
          showNextButton: false,
          showDoneButton: false,
          isProgress: false,
          freeze: true,
          globalHeader: Align(
            alignment: Alignment.topRight,
            child: Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(
                right: 20,
                top: 15,
              ),
              child: TextButton(
                onPressed: () {
                  BlocProvider.of<OnboardingBloc>(context).add(SkipEvent());
                },
                child: Text(
                  AppLocalizations.ofGlobalContext('skip'),
                  textAlign: TextAlign.center,
                  style: AppFonts.sfUi14Medium
                      .copyWith(color: AppTheme.activeColor),
                ),
              ),
            ),
          ),
          globalFooter: Container(
            padding: const EdgeInsets.only(
              bottom: 60,
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  AppTheme.accentColor,
                ),
                fixedSize: MaterialStateProperty.all<Size>(const Size(130, 50)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: AppTheme.accentColor),
                  ),
                ),
              ),
              onPressed: () {
                if (introKey.currentState!.controller.page!.toInt() < 2) {
                  introKey.currentState!.animateScroll(
                      introKey.currentState!.controller.page!.toInt() + 1);
                }
                BlocProvider.of<OnboardingBloc>(context).add(AddEvent());
              },
              child: Text(
                AppLocalizations.ofGlobalContext('next'),
                style:
                    AppFonts.sfUi14Medium.copyWith(color: AppTheme.activeColor),
              ),
            ),
          ),
        );
      },
    );
  }
}
