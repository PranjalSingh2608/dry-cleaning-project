import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:vibration/vibration.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'quantity': quantity,
        'price': price,
      };
}

class Cart with ChangeNotifier {
  Map<String, CartItem>? _items = {};
  Map<String, CartItem> get items {
    return {...?_items};
  }

  int get itemCount {
    return _items == null ? 0 : _items!.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items!.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  Future<void> saveTotalAmount() async {
    final prefs = await SharedPreferences.getInstance();
    var total = 0.0;
    _items!.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    prefs.setDouble('totalAmount', total);
  }

  Future<double> loadTotalAmount() async {
    final prefs = await SharedPreferences.getInstance();
    final total = prefs.getDouble('totalAmount') ?? 0.0;
    return total;
  }

  void removeItem(String productId) async {
    if (_items!.containsKey(productId)) {
      if (_items![productId]!.quantity > 1) {
        _items!.update(
            productId,
            (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                quantity: existingCartItem.quantity - 1,
                price: existingCartItem.price));
      } else {
        _items!.remove(productId);
      }
      if (await Vibrate.canVibrate) {
        Vibration.vibrate(duration: 100);
      }
      saveTotalAmount();
      notifyListeners();
    }
  }

  void addItem(String productId, double price, String title) async {
    if (_items!.containsKey(productId)) {
      _items!.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
    } else {
      _items![productId] = CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1);
    }
    if (await Vibrate.canVibrate) {
      Vibration.vibrate(duration: 100);
    }
    saveTotalAmount();
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
