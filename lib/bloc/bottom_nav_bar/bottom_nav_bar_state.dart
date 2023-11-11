part of 'bottom_nav_bar_cubit.dart';

@immutable
sealed class BottomNavBarState {
  final int index;
  const  BottomNavBarState(this.index);
}

final class HomeState extends BottomNavBarState {
  const HomeState() : super(0);
}

final class SaleState extends BottomNavBarState {
  const SaleState() : super(1);
}

final class CategoryState extends BottomNavBarState {
  const CategoryState() : super(2);
}

final class CartState extends BottomNavBarState {
  const CartState() : super(3);
}

final class ProfileState extends BottomNavBarState {
  const ProfileState() : super(4);
}
