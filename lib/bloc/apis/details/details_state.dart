part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class DetailsLoading extends DetailsState {}

final class DetailsSuccessed extends DetailsState {
  final ProductModel details;

  DetailsSuccessed({
    required this.details,
  });
}
