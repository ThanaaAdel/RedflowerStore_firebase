import 'package:flutter/material.dart';
import 'package:flower/model/item.dart';

class Cart with ChangeNotifier {
  double price = 0 ;

  List selectedProducts = [];

  add(Item product) {
    price += product.price.round();
    selectedProducts.add(product);
    notifyListeners();
  }
  delete(Item product) {
    selectedProducts.remove(product);
    price -= product.price.round();

    notifyListeners();
  }
}