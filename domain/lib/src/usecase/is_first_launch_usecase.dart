import 'package:domain/domain.dart';

class IsFirstLaunchUseCase extends UseCase<bool, NoParams> {
  final LaunchRepository _launchRepository;

  IsFirstLaunchUseCase({
    required LaunchRepository launchRepository,
  }) : _launchRepository = launchRepository;

  @override
  bool execute(NoParams params) {
    return _launchRepository.isFirstLaunch();
  }
}
