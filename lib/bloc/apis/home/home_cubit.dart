// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:jad/controller/api_controller.dart';
import 'package:jad/model/home_banner.dart';
import 'package:jad/model/home_category_calss.dart';
import 'package:jad/model/product_item.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  void fetch() async {
    emit(HomeLoading());
    final banners = await ApiController.getHomeBanners();
    final categories = await ApiController.getCategories();
    final productes = await ApiController.getAllProducts();
    emit(HomeSuccessed(
        banners: banners, categories: categories, 
        products: productes
        ));
  }
}
