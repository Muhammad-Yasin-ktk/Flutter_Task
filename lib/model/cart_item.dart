import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final double vatAmount;
  final String imageurl;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
    this.vatAmount,
    this.imageurl
  });
}