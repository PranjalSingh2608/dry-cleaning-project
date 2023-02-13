import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class StoreData with ChangeNotifier {
  final String? id;
  final String? name;
  final String? phone;
  final double? lat;
  final double? lng;
  final String? address;
  StoreData(
      {required this.id,
      required this.name,
      required this.phone,
      required this.lat,
      required this.address,
      required this.lng});
  StoreData.empty()
      : id = "",
        name = "",
        phone = "",
        lat = 0.0,
        lng = 0.0,
        address = "";
  Future<List<StoreData>> getStores() async {
    String url =
        'https://dry-cleaning-b7a6b-default-rtdb.firebaseio.com/Store.json';
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);
    List<StoreData> stores = [];
    responseData.values.forEach((value) {
      StoreData store = StoreData(
        id: value.toString(),
        name: value['Name'],
        phone: value['Phone'],
        lat: value['Lat'],
        lng: value['Long'],
        address: value['address'],
      );
      stores.add(store);
    });
    return stores;
  }
}
