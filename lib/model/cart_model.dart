import 'package:flutter/material.dart';

class CartModel {
  String title, id;
  int currentPrice, previousPrice, total, quantity;

  CartModel({
    this.id,
    this.title,
    this.previousPrice,
    this.total,
    this.currentPrice,
    this.quantity,
  });
}

// List<CartModel> cart = [
//   CartModel(
//     title: 'Wax Delight',
//     previousPrice: 899,
//     time: 60,
//     currentPrice: 400,
//   ),
// ];

class CartItem with ChangeNotifier {
  Map<String, CartModel> _items = {};

  Map<String, CartModel> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(
    String title,
    int currentPrice,
    int previousPrice,
    int time,
  ) {
    if (_items.containsKey(title)) {
      _items.update(
          (title),
          (existingItem) => CartModel(
                id: DateTime.now().toString(),
                title: existingItem.title,
                currentPrice: existingItem.currentPrice,
                previousPrice: existingItem.previousPrice,
                total: existingItem.total,
                quantity: existingItem.quantity + 1,
              ));
    } else {
      _items.putIfAbsent(
        title,
        () => CartModel(
          title: title,
          id: DateTime.now().toString(),
          quantity: 1,
          previousPrice: previousPrice,
          currentPrice: currentPrice,
          total: time,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String title) {
    _items.remove(title);
    notifyListeners();
  }

  void removeSingleItem(String title) {
    if (_items[title].quantity > 1) {
      print('inside the delete item button inside cart !');
      _items.update(
          title,
          (existingItem) => CartModel(
                id: DateTime.now().toString(),
                title: existingItem.title,
                currentPrice: existingItem.currentPrice,
                previousPrice: existingItem.previousPrice,
                total: existingItem.total,
                quantity: existingItem.quantity - 1,
              ));
    }
    notifyListeners();
  }

  void addSingleItem(String title) {
    if (_items[title].quantity < 5) {
      print('inside the add item button inside cart !');
      _items.update(
          title,
          (existingItem) => CartModel(
                id: DateTime.now().toString(),
                title: existingItem.title,
                currentPrice: existingItem.currentPrice,
                previousPrice: existingItem.previousPrice,
                total: existingItem.total,
                quantity: existingItem.quantity + 1,
              ));
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  int totalAmount() {
    int total = 0;
    _items.forEach((key, value) {
      total = total + value.currentPrice * value.quantity;
    });
    return total;
  }

  int totalOrder() {
    int total = 0;
    _items.forEach((key, value) {
      total = total + value.previousPrice * value.quantity;
    });
    return total;
  }

  int totalDiscount() {
    int discount = 0;
    _items.forEach((key, value) {
      discount = totalOrder() - totalAmount();
    });
    return discount;
  }
}
