part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  final int currentIdx;

  const NavigationState({
    required this.currentIdx,
  });

  factory NavigationState.initial() {
    return const NavigationState(currentIdx: 0);
  }

  @override
  List<Object> get props => [currentIdx];

  @override
  String toString() => 'NavigationState(currentIdx: $currentIdx)';

  NavigationState copyWith({
    int? currentIdx,
  }) {
    return NavigationState(
      currentIdx: currentIdx ?? this.currentIdx,
    );
  }
}
