import 'package:flutter/cupertino.dart';

class StoreData with ChangeNotifier {
  final String? id;
  final String? name;
  final String? phone;
  final double? lat;
  final double? lng;
  StoreData(
      {
      required this.id,
      required this.name,
      required this.phone,
      required this.lat,
      required this.lng});
}
