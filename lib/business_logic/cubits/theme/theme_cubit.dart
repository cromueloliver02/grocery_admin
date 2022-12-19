import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  void toggleTheme() {
    final isDark = state.themeMode == ThemeMode.dark;

    emit(state.copyWith(themeMode: isDark ? ThemeMode.light : ThemeMode.dark));
  }
}
