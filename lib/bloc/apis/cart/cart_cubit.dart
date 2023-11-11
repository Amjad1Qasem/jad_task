// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jad/controller/api_controller.dart';
import 'package:jad/model/cart.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  int total = 0;

  void fetch() async {
    emit(CartLoading());
    final response = await ApiController.getCarts();
    final List<dynamic> cartJson = response['cart_myCart'] ?? [];
    final List<dynamic> moreToLoveJson = response['cart_MoreToLove'] ?? [];

    final cartItems =
        cartJson.map((courseJson) => CartModel.fromJson(courseJson)).toList();
    for (var element in cartItems) {
      total += element.price * element.quantity;
    }
    final moreToLoveItems = moreToLoveJson
        .map((moreToLove) => CartModel.fromJson(moreToLove))
        .toList();

    emit(CartSuccessed(
      cartItems: cartItems,
      moreToLoveItems: moreToLoveItems,
    ));
  }

  void changeProductQuantity(CartModel cartModel, int quantity) {
    final currentState = (state as CartSuccessed);
    emit(CartLoading());
    final cartItems = currentState.cartItems
      ..removeWhere((element) => cartModel.id == element.id);
    cartItems.add(cartModel.copyWith(quantity: quantity));
    for (var element in cartItems) {
      total += element.price * element.quantity;
    }
    emit(CartChanged(
        cartItems: cartItems, moreToLoveItems: currentState.moreToLoveItems));
  }
}
