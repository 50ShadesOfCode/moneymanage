import 'package:domain/domain.dart';

class SignInResult{
  final User user;
  final Duration sessionLifeTime;

  SignInResult({
    required this.user,
    required this.sessionLifeTime,
  });
}