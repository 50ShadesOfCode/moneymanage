import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final int index;

  const OnboardingState({required this.index});

  OnboardingState copyWith({
    required int index,
  }) {
    return OnboardingState(index: index);
  }

  @override
  String toString() {
    return 'OnboardingState { index: $index }';
  }

  @override
  List<Object> get props => <int>[index];
}
