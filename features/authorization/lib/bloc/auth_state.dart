import 'package:equatable/equatable.dart';

class AuthorizationState extends Equatable {
  final String username;
  final String password;
  final bool needRegistration;
  const AuthorizationState({
    required this.username,
    required this.password,
    required this.needRegistration,
  });

  AuthorizationState copyWith({
    required String username,
    required String password,
    required bool needRegistration,
  }) {
    return AuthorizationState(
      username: username,
      password: password,
      needRegistration: needRegistration,
    );
  }

  @override
  List<Object> get props => <Object>[username, password, needRegistration];
}
