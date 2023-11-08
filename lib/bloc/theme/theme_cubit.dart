import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jad/helper/local_storage/local_storage_helper.dart';


part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial()) {
    init();
  }

  void init() async {
    final ThemeMode themeMode = await LocaleStorageHelper.getTheme();
    emit(ThemeFetched(themeMode));
  }

  void light() async {
    const ThemeMode lightThemeMode = ThemeMode.light;
    await LocaleStorageHelper.setTheme(lightThemeMode);
    emit(ThemeFetched(lightThemeMode));
  }
}
