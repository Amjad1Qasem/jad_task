part of 'localization_cubit.dart';

@immutable
sealed class LocalizationState {}

final class LocalizationInitial extends LocalizationState {}

class LocalizationFetched extends LocalizationState {
  final Locale locale;
  LocalizationFetched(this.locale);
}
