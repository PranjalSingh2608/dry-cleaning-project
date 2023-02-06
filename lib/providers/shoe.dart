import 'package:flutter/cupertino.dart';

class Shoe with ChangeNotifier {
  Shoe(this.id, this.name, this.price);
  final String id;
  final String name;
  final int count = 0;
  final double price;
}

class Shoes with ChangeNotifier {
  List<Shoe> shoe = [
    Shoe('s1','CHAPPAL', 119),
    Shoe('s2','BELLE', 299),
    Shoe('s3','SPORTS', 379),
    Shoe('s4','BELLE DESIGNER', 359),
    Shoe('s5','LEATHER', 439),
    Shoe('s6','SUEDE', 620),
    Shoe('s7','ANKLE', 879),
  ];
}
