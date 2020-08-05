import 'package:flutter/material.dart';
import 'DescriptionPage.dart';
import 'package:flutter_shop/Product.dart';

class ShoppingBasketData {
  static ShoppingBasketData _instance;
  List<Product> _basketItem;
  ShoppingBasketData() {
    _basketItem = List<Product>();
  }
  static ShoppingBasketData getInstance() {
    if (_instance == null) _instance = ShoppingBasketData();
    return _instance;
  }

  List<Product> get basketItem => _basketItem;

  set basketItem(List<Product> value) {
    _basketItem = value;
  }

  static ShoppingBasketData get instance => _instance;

  static set instance(ShoppingBasketData value) {
    _instance = value;
  }
}
