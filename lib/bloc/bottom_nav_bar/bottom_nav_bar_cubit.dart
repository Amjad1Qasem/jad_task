// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(const HomeState());

  void homeScreen() {
    emit(const HomeState());
  }
  void saleScreen() {
    emit(const SaleState());
  }
  void categoryScreen() {
    emit(const CategoryState());
  }
  void cartScreen() {
    emit(const CartState());
  }
  void profileScreen() {
    emit(const ProfileState());
  }
}
