import 'package:flutter/material.dart';

import '../utils/products.dart';

class ProductModel extends ChangeNotifier {
  List<int> items = [];

  List<int> get allItems => items;

  double get totalPrice {
    double price = 0;

    for (int i = 0; i < PRODUCTS.length; i++) {
      if (items.contains(PRODUCTS[i]['id'])) price += PRODUCTS[i]['price'];
    }

    return price;
  }

  void add(int item) {
    items.add(item);
    notifyListeners();
  }

  void remove(int value) {
    items = items.where((item) => item != value).toList();
    notifyListeners();
  }
}
