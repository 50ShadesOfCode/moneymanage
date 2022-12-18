import 'package:domain/domain.dart';

abstract class AuthRepository {
  const AuthRepository();

  Future<void> signIn(String username, String password);

  Future<void> signOut();

  Future<void> resetSession();

  Stream<AuthorizationEvents> observe();

  bool isAuthorized();
}
