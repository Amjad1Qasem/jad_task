// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_cubit.dart';

class DDD {
  final int count;

  DDD({required this.count});
}

@immutable
sealed class CartState extends Equatable {}

final class CartInitial extends CartState {
  @override
  List<Object?> get props => [];
}

final class CartLoading extends CartState {
  @override
  List<Object?> get props => [];
}

final class CartSuccessed extends CartState {
  final List<CartModel> cartItems;
  final List<CartModel> moreToLoveItems;

  CartSuccessed({
    required this.cartItems,
    required this.moreToLoveItems,
  });

  CartSuccessed copyWith({
    List<CartModel>? cartItems,
    List<CartModel>? moreToLoveItems,
  }) {
    return CartSuccessed(
      cartItems: cartItems ?? this.cartItems,
      moreToLoveItems: moreToLoveItems ?? this.moreToLoveItems,
    );
  }

  @override
  List<Object?> get props => [];
}

final class CartChanged extends CartSuccessed {
  CartChanged({required super.cartItems, required super.moreToLoveItems});

  @override
  List<Object?> get props =>
      [super.cartItems.map((e) => e.price), super.moreToLoveItems];
}
