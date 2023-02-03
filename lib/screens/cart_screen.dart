import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart' as ci;
import '../providers/cart.dart';
import '../widgets/drawer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
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
        child: Container(
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.all(15),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total',
                        style: TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                      Chip(
                        label: Text(
                          '${cartData.totalAmount.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height:300,
                child: ListView.builder(
                  itemCount: cartData.itemCount,
                  itemBuilder: (context, index) => ci.CartItem(
                      id: cartData.items.values.toList()[index].id.toString(),
                      title: cartData.items.values
                          .toList()[index]
                          .title
                          .toString(),
                      productId:
                          cartData.items.values.toList()[index].toString(),
                      quantity: cartData.items.values
                          .toList()[index]
                          .quantity
                          .toInt(),
                      price: cartData.items.values
                          .toList()[index]
                          .price
                          .toDouble()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
