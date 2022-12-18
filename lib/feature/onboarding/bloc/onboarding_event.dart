import 'package:flutter/material.dart';

@immutable
abstract class OnboardingEvent {}

class SkipEvent extends OnboardingEvent {}

class AddEvent extends OnboardingEvent {}
