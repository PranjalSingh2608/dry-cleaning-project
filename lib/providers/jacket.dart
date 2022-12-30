import 'package:flutter/cupertino.dart';

class Jacket with ChangeNotifier {
  Jacket(this.name, this.price);
  final String name;
  final int count = 1;
  final double price;
}
class Jackets with ChangeNotifier {
  List<Jacket> jacket = [
    Jacket('LEATHER JACKET(SUEDE)', 739),
    Jacket('LEATHER JACKET', 529),
    Jacket('LEATHER JACKET(REXINE)', 379),
  ];
}
