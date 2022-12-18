import 'package:flutter/material.dart';

@immutable
abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  final String password;
  final String username;

  SignInEvent({
    required this.username,
    required this.password,
  });
}

class RegisterEvent extends AuthEvent {}

class OnRegisteredEvent extends AuthEvent {}
