import 'package:flutter/material.dart';
import 'package:flutter_task/model/cart_item.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    int count = 0;
    _items.values.forEach((item) => count += item.quantity);
    return count;
  }

  var totalPrice = 0.0;
  var tVatAmount = 0.0;
 

//  int get itemCount {
//    return _items.length;
//  }
//  int  singleItemCount(String id) {
//    int count=0;
//    if(_items.containsKey(id)){
//      _items.values.forEach((item) => count += item.quantity);
//      return count;
//    }
//
//  }

  double get totalAmount {
    _items.forEach((key, cartItem) {
      totalPrice += cartItem.price * cartItem.quantity;
    });
    return totalPrice;
  }

  double get totalVatAmount {
    _items.forEach((key, cartItem) {
      tVatAmount += cartItem.vatAmount * cartItem.quantity;
    });
    return tVatAmount;
  }

  double get totalGrantAmount {

    return totalPrice+ tVatAmount;
  }

  void addItem(String productId, double price, String title, double vatAmount,String image) {
    if (_items.containsKey(productId)) {
      // change quantity...
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          vatAmount: existingCartItem.vatAmount,
          quantity: existingCartItem.quantity + 1,
          imageurl: existingCartItem.imageurl

        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          vatAmount: vatAmount,
          quantity: 1,
          imageurl: image
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity > 1) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                price: existingCartItem.price,
                vatAmount: existingCartItem.vatAmount,
                quantity: existingCartItem.quantity - 1,
            imageurl: existingCartItem.imageurl
              ));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
