import 'dart:math';

import 'package:dry_cleaning/providers/order.dart' as ord;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vibration/vibration.dart';
import '../providers/cart.dart';
import '../providers/order.dart';
import '../providers/order.dart';
import '../providers/storedata.dart';
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
  DateTime _pickupDate = DateTime.utc(1989, 11, 9);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
    final orderData = Provider.of<ord.Order>(context);
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
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Cart Items',
                      textScaleFactor: 1.2,
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppinsTextTheme()
                            .titleLarge
                            .toString(),
                      ),
                    ),
                  ),
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FutureBuilder(
                        future: Provider.of<ord.Order>(context, listen: false)
                            .getClosestStore(context),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final storeData = snapshot.data as StoreData;
                            print(storeData.fcmToken);
                            return Column(
                              children: [
                                SizedBox(
                                  height: 100,
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Pickup Store:-',
                                          textScaleFactor: 1.2,
                                          style: TextStyle(
                                            fontFamily:
                                                GoogleFonts.poppinsTextTheme()
                                                    .titleLarge
                                                    .toString(),
                                          ),
                                        ),
                                      ),
                                      Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            side: BorderSide(
                                              color: Colors.blue.shade500,
                                            )),
                                        child: ListTile(
                                          title:
                                              Text(storeData.name.toString()),
                                          subtitle: Row(
                                            children: [
                                              Text(
                                                  storeData.address.toString()),
                                              Spacer(),
                                              Text(storeData.phone.toString()),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Text("Error: ${snapshot.error}");
                          }
                          return Center(child: CircularProgressIndicator());
                        }),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Pickup Time:-',
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppinsTextTheme()
                              .titleLarge
                              .toString(),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
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
                      Spacer(),
                      Text(
                        _pickupTime.hour.toString() +
                            ':' +
                            _pickupTime.minute.toString(),
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppinsTextTheme()
                              .bodySmall
                              .toString(),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Pickup Date:-',
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppinsTextTheme()
                              .titleLarge
                              .toString(),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        child: Text('Choose Pickup Date'),
                        onPressed: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2015, 8),
                            lastDate: DateTime(2101),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              _pickupDate = DateTime(selectedDate.year,
                                  selectedDate.month, selectedDate.day);
                            });
                          }
                        },
                      ),
                      Spacer(),
                      Text(
                        _pickupDate.day.toString() +
                            '/' +
                            _pickupDate.month.toString() +
                            '/' +
                            _pickupDate.year.toString(),
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppinsTextTheme()
                              .bodySmall
                              .toString(),
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder(
                      future: Provider.of<ord.Order>(context, listen: false)
                          .getAddressFromCoordinates(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          print(snapshot.data);
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Address:-',
                                    textScaleFactor: 1.2,
                                    style: TextStyle(
                                      fontFamily: GoogleFonts.poppinsTextTheme()
                                          .titleLarge
                                          .toString(),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    snapshot.data.toString(),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text("Error: ${snapshot.error}");
                        }
                        return Center(child: CircularProgressIndicator());
                      }),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () async {
                        final data =
                            Provider.of<ord.Order>(context, listen: false)
                                .getClosestStore(context);
                        final token = data.then((value) => value.fcmToken);
                        if (await Vibrate.canVibrate) {
                          Vibration.vibrate(duration: 100);
                        }
                        orderData.placeOrder(_pickupTime, _pickupDate, context);
                        
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "Place Order",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue.withOpacity(0.5),
                                Color.fromARGB(255, 34, 7, 237)
                                    .withOpacity(0.9),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0, 1],
                            ),
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ),
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
