import 'package:flutter/material.dart';
import 'package:minimal_eccomerce_app/products_models/products.dart';

class CounterModel extends ChangeNotifier {
  List<ProductInfo> product = [];

  void increment(ProductInfo product) {
    product.number = product.number! + 1;
    notifyListeners();
  }

  void decrement(ProductInfo product) {
    if (product.number! > 1) {
      product.number = product.number! - 1;
    }

    notifyListeners();
  }

  double totalPrice() {
    return favouritesProdusts.fold(
        0,
        (total, product) =>
            total +
            ((product[0] as ProductInfo).number!) *
                (product[0] as ProductInfo).price.toInt());
  }
}
