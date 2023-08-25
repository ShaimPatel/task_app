import 'package:flutter/material.dart';

import '../Model/cart_item_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];
  int _selectedColorIndex = 0;
  double _currentPrice = 0.0;
  final double _discountPrice = 0.0;

  int _selectedSizeIndex = 0;
  double _selectedItemPrice = 0.0;
  double _totalSavings = 0.0;

  double get totalSavings => _totalSavings;
  List<CartItem> get cartItems => _cartItems;
  double get selectedItemPrice => _selectedItemPrice;
  int get selectedSizeIndex => _selectedSizeIndex;
  int get selectedColorIndex => _selectedColorIndex;
  double get currentPrice => _currentPrice;

//! Total Price ..

  double get totalPrice {
    return cartItems.fold(
        0, (total, cartItem) => total + cartItem.price * cartItem.quantity);
  }

//! Add To Cart ..

  void addToCart(CartItem cartItem) {
    int existingIndex = cartItems.indexWhere(
      (item) =>
          item.itemId == cartItem.itemId &&
          item.size == cartItem.size &&
          item.image == cartItem.image,
    );

    if (existingIndex != -1) {
      cartItems[existingIndex].quantity += 1;
    } else {
      cartItems.add(cartItem);
    }

    notifyListeners();
  }
  // void addToCart(CartItem cartItem) {
  //   var existingItem = _cartItems.firstWhere(
  //     (item) =>
  //         item.itemId == cartItem.itemId &&
  //         item.size == cartItem.size &&
  //         item.image == cartItem.image,
  //   );

  //   if (existingItem != null) {
  //     existingItem.quantity += cartItem.quantity;
  //   } else {
  //     _cartItems.add(cartItem);
  //   }

  //   notifyListeners();
  // }

//! Remove Item from cartList ..

  void removeFromCart(CartItem cartItem) {
    cartItems.remove(cartItem);
    notifyListeners();
  }

//! Selected Size Index

  set selectedSizeIndex(int index) {
    _selectedSizeIndex = index;
    notifyListeners();
  }

//! Selected Item Price

  set selectedItemPrice(double price) {
    _selectedItemPrice = price;
    notifyListeners();
  }

//! Selected Color Index

  set selectedColorIndex(int index) {
    _selectedColorIndex = index;
    notifyListeners();
  }

//! Current Price
  set currentPrice(double price) {
    _currentPrice = price;
    notifyListeners();
  }

//! Total saving ..

  set totalSavings(double savings) {
    _totalSavings = savings;
    notifyListeners();
  }
}
