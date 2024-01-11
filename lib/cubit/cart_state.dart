part of 'cart_cubit.dart';

class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartListState extends CartState {
  List<ProductElement> cart;

  CartListState(this.cart);

  @override
  List<Object?> get props => [this.cart];
}

class CartUpdatingState extends CartState {}

