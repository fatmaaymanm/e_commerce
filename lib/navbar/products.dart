import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/cubit/cart_cubit.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<ProductElement> product = [];

  getMyProducts() async {
    product = await ProductService().getProducts();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMyProducts();
    print(product);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (BuildContext context, CartState state) {  },
        builder: (BuildContext context, CartState state) {
          return ListView.builder(
              itemCount: product.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 30, 8),
                              child: Text(product[index].id.toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 30, 8),
                              child: Container(
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  child: Image.network(product[index].thumbnail)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    child: Text(product[index].title)),
                                Container(
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    child: Text(product[index].brand)),
                                Text(product[index].category),
                                Text(product[index].rating.toString()),
                                Text(product[index].stock.toString()),
                                Text(product[index].price.toString()),
                                Text(product[index].discountPercentage.toString()),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.35,
                                    child: Text(
                                      product[index].description,
                                      maxLines: 20,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        CarouselSlider.builder(
                          itemCount: product[index].images.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                              Container(
                                child: Image.network(product[index].images[itemIndex]),
                              ),
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 0.9,
                            aspectRatio: 1.0,
                            initialPage: 0,
                          ),
                        ),
                        ElevatedButton(onPressed: () {
                          BlocProvider.of<CartCubit>(context).addItemToCart(product[index]);
                          print('added');
                        }, child: Text('Add to cart',
                          style: TextStyle(
                            color: Colors.white,
                          ),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
