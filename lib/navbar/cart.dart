import 'package:e_commerce/cubit/cart_cubit.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (BuildContext context, CartState state) {},
        builder: (BuildContext context, CartState state) {
          if (CartCubit.cart.isEmpty) {
            return Center(
            child: Text(
              'Your Cart is empty'
            ),
          );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
