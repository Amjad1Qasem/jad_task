// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jad/helper/local_storage/local_storage_helper.dart';
import 'package:jad/translation/app_translations.dart';
part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial()) {
    init();
  }

  void init() async {
    final Locale locale = await LocaleStorageHelper.getLocale();
    emit(LocalizationFetched(locale));
  }

  void english() async {
    const Locale englishLocale = AppTranslation.english;
    await LocaleStorageHelper.setLocale(englishLocale);
    emit(LocalizationFetched(englishLocale));
  }
}
