import 'package:flutter/material.dart';

class CartModel {
  String title;
  int currentPrice, previousPrice, total, quantity;

  CartModel({
    this.title,
    this.previousPrice,
    this.total,
    this.currentPrice,
    this.quantity,
  });
}

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
    int totals = 0;
    _items.forEach((key, value) {
      totals = totals + value.currentPrice * value.quantity;
    });
    print('---------total----------$totals}');
    return totals;
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

  String bundleItemsTitle() {
    String finalString = '';
    String titles = '';
    _items.forEach((key, value) {
      titles = '${value.title} X ${value.quantity} /';
      finalString = '$titles$finalString';
    });
    return finalString;
  }
}
