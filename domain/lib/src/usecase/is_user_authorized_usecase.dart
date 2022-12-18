import 'package:domain/domain.dart';

class IsUserAuthorizedUseCase extends UseCase<bool, NoParams> {
  final AuthRepository _authRepository;

  IsUserAuthorizedUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  bool execute(NoParams params) {
    return _authRepository.isAuthorized();
  }
}
