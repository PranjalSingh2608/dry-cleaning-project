import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class Bag with ChangeNotifier {
  Bag(this.id,this.name, this.price);
  final String id;
  final String name;
  final int count = 0;
  final double price;
}
  class Bags with ChangeNotifier {
  List<Bag> bag = [
    Bag('b1','LADIES PURSE LARGE', 789),
    Bag('b2','LADIES HAND PURSE', 529),
    Bag('b3','KIDS SCHOOL BAG',249),
    Bag('b4','LADIES PURSE MEDIUM',699),
    Bag('b5','MENS WALLET', 199),
    Bag('b6','BACKPACK',439),
    Bag('b7','LAPTOP BAG', 260),
  ];
}
