import 'package:flutter/cupertino.dart';

class Jacket with ChangeNotifier {
  Jacket(this.id,this.name, this.price);
  final String id;
  final String name;
  final int count = 0;
  final double price;
}

class Jackets with ChangeNotifier {
  List<Jacket> jacket = [
    Jacket('j1','LEATHER JACKET(SUEDE)', 739),
    Jacket('j2','LEATHER JACKET', 529),
    Jacket('j3','LEATHER JACKET(REXINE)', 379),
  ];
}
