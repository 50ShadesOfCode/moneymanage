import 'package:domain/domain.dart';

class SignInUseCase extends FutureUseCase<void, List<String>> {
  final AuthRepository _authRepository;

  SignInUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<void> execute(List<String> params) {
    return _authRepository.signIn(params[0], params[1]);
  }
}
