import 'package:flutter/cupertino.dart';

class Jacket with ChangeNotifier {
  final String name;
  final int count = 1;
  final double price;

  Jacket(this.name, this.price);
  List<Jacket> dailyWear = [
    Jacket('LEATHER JACKET(SUEDE)', 739),
    Jacket('LEATHER JACKET', 529),
    Jacket('LEATHER JACKET(REXINE)',379),
  ];
}