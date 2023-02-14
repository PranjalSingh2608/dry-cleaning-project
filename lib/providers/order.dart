import 'package:dry_cleaning/providers/cart.dart';
import 'package:dry_cleaning/providers/storedata.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class OrderItem {
  final String orderId;
  final String storeId;
  final String userId;
  final String pickupAddress;
  final List<CartItem> items;
  final DateTime pickupTime;
  final DateTime pickupDate;
  final DateTime orderTime;
  bool pending = true;
  OrderItem({
    required this.orderId,
    required this.storeId,
    required this.userId,
    required this.pickupAddress,
    required this.items,
    required this.pickupTime,
    required this.orderTime,
    required this.pickupDate,
  });
  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'storeId': storeId,
      'userId': userId,
      'items': items,
      'pickupTime': pickupTime,
      'orderTime': orderTime,
      'pickupDate': pickupDate.day,
      'pickupAddress': pickupAddress
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

  Future<String> getAddressFromCoordinates() async {
    Position position = await Geolocator.getCurrentPosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemarks[0];
    String address =
        "${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}";

    return address;
  }
}
