abstract class LaunchRepository {
  const LaunchRepository();

  bool isFirstLaunch();

  Future<void> setFirstLaunch();
}
