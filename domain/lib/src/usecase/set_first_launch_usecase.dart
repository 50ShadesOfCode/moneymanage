import 'package:domain/domain.dart';

class SetFirstLaunchUseCase extends FutureUseCase<void, NoParams> {
  final LaunchRepository _launchRepository;

  SetFirstLaunchUseCase({
    required LaunchRepository launchRepository,
  }) : _launchRepository = launchRepository;

  @override
  Future<void> execute(NoParams params) {
    return _launchRepository.setFirstLaunch();
  }
}
