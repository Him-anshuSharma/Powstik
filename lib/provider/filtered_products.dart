import 'package:flutter/cupertino.dart';
import 'package:powstik/model/product.dart';

class FilteredProducts extends ChangeNotifier {
  List<Product> filteredProducts = [];
  double totalAmount = 0;
  List<Product> get products => filteredProducts;

  void addToCart(Product item) {
    filteredProducts.add(item);
    notifyListeners();
  }
  void clearCart() {
    filteredProducts = [];
    notifyListeners();
  }
}
