part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccessed extends HomeState {
  final List<HomeBannerModel> banners;
  final List<HomeCategoryModel> categories;
  final List<ProductModel> products;

  HomeSuccessed(
      {required this.banners,
      required this.categories,
      required this.products
      });
}
