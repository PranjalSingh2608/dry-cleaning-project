import 'dart:math';

import 'package:dry_cleaning/providers/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../providers/cart.dart';
import '../providers/order.dart';
import '../providers/order.dart';
import '../widgets/drawer.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({super.key});

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  final _formKey = GlobalKey<FormState>();
  String _storeId = "";
  String _userId = "";
  DateTime _pickupTime = DateTime.utc(1989, 11, 9);
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.withOpacity(0.5),
                Color.fromARGB(255, 34, 7, 237).withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0, 1],
            ),
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Colors.blue.shade500,
                        )),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: cartData.itemCount,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text(cartData.items.values
                                  .toList()[index]
                                  .title
                                  .toString() +
                              'x' +
                              cartData.items.values
                                  .toList()[index]
                                  .quantity
                                  .toString()),
                          trailing: Text(
                            cartData.items.values
                                .toList()[index]
                                .price
                                .toString(),
                          ),
                          dense: true,
                          visualDensity: VisualDensity(vertical: -4),
                        );
                      },
                    ),
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(labelText: 'Store'),
                    items: [
                      // Add stores as DropdownMenuItems
                    ],
                    onChanged: (value) => _storeId = value.toString(),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'User ID'),
                    onSaved: (value) => _userId = value.toString(),
                  ),
                  ElevatedButton(
                    child: Text('Choose Pickup Time'),
                    onPressed: () async {
                      final selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (selectedTime != null) {
                        setState(() {
                          _pickupTime = DateTime(
                              DateTime.now().year,
                              DateTime.now().month,
                              DateTime.now().day,
                              selectedTime.hour,
                              selectedTime.minute);
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
