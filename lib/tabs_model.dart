import 'package:flutter/material.dart';
import 'package:minimal_eccomerce_app/products_models/products.dart';

class TabsModel extends ChangeNotifier {
  final List<ProductInfo> _shopProducts = shopProducts;
  final List<Tab> tabs = [
    const Tab(text: 'Всё'),
    const Tab(text: 'Смартфоны'),
    const Tab(text: 'Ноутбуки'),
    const Tab(text: 'Компьютеры'),
    const Tab(text: 'Мониторы'),
  ];

  List<ProductInfo> products = shopProducts;
  void onTap(int value) {
    List<ProductInfo> result = [];

    if (value == 0) {
      result = _shopProducts;
    } else {
      result = _shopProducts
          .where(
              (element) => element.category == tabs[value].text?.toLowerCase())
          .toList();
    }

    products = result;

    notifyListeners();
  }
}
