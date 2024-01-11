import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_commerce/models/product_model.dart';

class ProductService {
  String endpoint = 'https://dummyjson.com/products';


  Future<List<ProductElement>> getProducts() async {
    List<ProductElement> products = [];
    try {
      var response = await Dio().get(endpoint);
      var data = response.data["products"];
      data.forEach((json) {
        ProductElement productElement = ProductElement.fromJson(json);
        products.add(productElement);
      });

      print(products);
    } catch (e) {
      print(e);
    }
    return products;
  }
}
