import 'package:esilv_shop/model/product.dart';
import 'package:flutter/foundation.dart';

class Cart extends ChangeNotifier {
  final List<Product> _products = [];
  List<Product> get products => _products;

  String get priceInEuros =>
      "${(_products.fold<int>(0, (total, product) => total + (product.price * 100).round()) / 100).toStringAsFixed(2)}€";

  void add(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void remove(Product product) {
    _products.remove(product);
    notifyListeners();
  }
}
