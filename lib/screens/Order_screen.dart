import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../providers/cart.dart';
import '../providers/dry_clean.dart';
import '../widgets/badge.dart';
import '../widgets/drawer.dart';
import 'cart_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final dailyWearData = Provider.of<DryCleans>(context).dailyWear;
    final cartData = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Consumer<Cart>(
              builder: (context, value, child) => Badge(
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/cart');
                    },
                  ),
                  value: value.itemCount.toString())),
        ],
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(10.0),
                itemCount: dailyWearData.length,
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: dailyWearData[index],
                  child: Row(
                    children: [
                      Text(dailyWearData[index].name),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          cartData.addItem(
                              dailyWearData[index].name,
                              dailyWearData[index].price,
                              dailyWearData[index].name);
                        },
                        icon: Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () {
                          cartData.removeItem(dailyWearData[index].name);
                        },
                        icon: Icon(Icons.anchor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
