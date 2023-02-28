import 'package:flutter/cupertino.dart';

import '../model/cart_item.dart';

class Cart extends ChangeNotifier {
  List<CartItem> _items = [];
  double totalAmount = 0;
  List<CartItem> get items => _items;

  void addToCart(CartItem item) {
    int existingIndex = _items.indexWhere((cartItem) => cartItem.itemName == item.itemName);

    if (existingIndex != -1) {
      _items[existingIndex].itemQty++;
      totalAmount += _items[existingIndex].itemPrice;
    } else {
      _items.add(item);
      totalAmount += _items[_items.length-1].itemPrice;
    }

    notifyListeners();
  }

  void removeFromCart(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
