import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get items => _cartItems;

  void addItem(Map<String, dynamic> item) {
    // Check if item already exists in cart
    int index = _cartItems.indexWhere((e) => e["name"] == item["name"]);
    if (index != -1) {
      _cartItems[index]["quantity"] += 1;
    } else {
      _cartItems.add({
        "name": item["name"],
        "price": item["price"],
        "image": item["image"],
        "quantity": 1,
      });
    }
    notifyListeners();
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void increaseQuantity(int index) {
    _cartItems[index]["quantity"]++;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (_cartItems[index]["quantity"] > 1) {
      _cartItems[index]["quantity"]--;
    } else {
      _cartItems.removeAt(index);
    }
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;
    for (var item in _cartItems) {
      final price = double.tryParse(
          item["price"].toString().replaceAll(RegExp(r'[^0-9.]'), ''));
      total += (price ?? 0) * (item["quantity"] ?? 1);
    }
    return total;
  }

  void clear() {
    _cartItems.clear();
    notifyListeners();
  }
}
