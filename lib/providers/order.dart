import 'package:dry_cleaning/providers/cart.dart';
import 'package:flutter/material.dart';

class OrderItem {
  final String orderId;
  final String storeId;
  final String userId;
  final List<CartItem> items;
  final DateTime pickupTime;
  final DateTime orderTime;
  final String status;
             
  OrderItem({
    required this.orderId,
    required this.storeId,
    required this.userId,
    required this.items,
    required this.pickupTime,
    required this.orderTime,
    required this.status,
  });
   Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'storeId': storeId,
      'userId': userId,
      'items': items,
      'pickupTime': pickupTime,
      'orderTime': orderTime,
      'status': status,
    };
  }
}
class Order with ChangeNotifier{
 
}
