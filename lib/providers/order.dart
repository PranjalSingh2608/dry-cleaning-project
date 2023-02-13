import 'package:dry_cleaning/providers/cart.dart';
import 'package:dry_cleaning/providers/storedata.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

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

class Order with ChangeNotifier {
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<StoreData> getClosestStore(BuildContext context) async {
    final storeData = await Provider.of<StoreData>(context).getStores();
    final position = await determinePosition();
    late StoreData closestStore;
    double closestDistance = double.infinity;

    for (var store in storeData) {
      final distance = await Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        store.lat!.toDouble(),
        store.lng!.toDouble(),
      );
      if (distance < closestDistance) {
        closestDistance = distance;
        closestStore = store;        
      }
    }
    return closestStore;
  }
}
