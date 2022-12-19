part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final ThemeMode themeMode;

  const ThemeState({
    required this.themeMode,
  });

  factory ThemeState.initial() {
    return const ThemeState(themeMode: ThemeMode.light);
  }

  @override
  List<Object> get props => [themeMode];

  @override
  String toString() => 'ThemeState(themeMode: $themeMode)';

  ThemeState copyWith({
    ThemeMode? themeMode,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
