part of '../theme/theme_cubit.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}

class ThemeFetched extends ThemeState {
  final ThemeMode themeMode;
  ThemeFetched(this.themeMode);
}
