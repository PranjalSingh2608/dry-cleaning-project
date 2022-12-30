import 'package:flutter/cupertino.dart';

class Bag with ChangeNotifier {
  Bag(this.name, this.price);
  final String name;
  final int count = 1;
  final double price;
}
  class Bags with ChangeNotifier {
  List<Bag> bag = [
    Bag('LADIES PURSE LARGE', 789),
    Bag('LADIES HAND PURSE', 529),
    Bag('KIDS SCHOOL BAG',249),
    Bag('LADIES PURSE MEDIUM',699),
    Bag('MENS WALLET', 199),
    Bag('BACKPACK',439),
    Bag('LAPTOP BAG', 260),
  ];
}