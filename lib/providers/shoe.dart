import 'package:flutter/cupertino.dart';

class Shoe with ChangeNotifier {
  final String name;
  final int count = 1;
  final double price;

  Shoe(this.name, this.price);
  List<Shoe> dailyWear = [
    Shoe('CHAPPAL', 119),
    Shoe('BELLE', 299),
    Shoe('SPORTS',379),
    Shoe('BELLE DESIGNER', 359),
    Shoe('LEATHER', 439),
    Shoe('SUEDE',620),
    Shoe('ANKLE', 879),
  ];
}