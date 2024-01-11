import 'package:bloc/bloc.dart';
import 'package:e_commerce/services/product_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {



  CartCubit() : super(initialState);
  static List<ProductElement> cart = [];

  static get initialState => CartListState(CartCubit.cart);




  addItemToCart(ProductElement item) async {
    emit(CartUpdatingState());
    cart.add(item);
    emit(CartListState(cart));
  }

  removeItemFromCart(ProductElement item) async {
    emit(CartUpdatingState());
    cart.remove(item);
    emit(CartListState(cart));
  }
}
