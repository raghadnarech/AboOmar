import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gas_manager_mandob/Model/Cart.dart';
import 'package:gas_manager_mandob/Model/Product.dart';

class CartController with ChangeNotifier {
  Cart cart = Cart();

  addproduct(Product? product) {
    log(product!.quan.toString());
    cart.listproduct!.add(product);
    notifyListeners();
  }

  incrementquanproduct(Product? product) {
    if (cart.listproduct!.contains(product)) {
      cart.listproduct!.where((element) => element.id == product!.id).first;
    }
  }
}
