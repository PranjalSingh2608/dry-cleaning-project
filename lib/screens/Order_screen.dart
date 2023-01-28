import 'package:dry_cleaning/providers/bag.dart';
import 'package:dry_cleaning/providers/shoe.dart';
import 'package:dry_cleaning/providers/steamIron.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../providers/cart.dart';
import '../providers/dry_clean.dart';
import '../providers/jacket.dart';
import '../providers/premium_dry_clean.dart';
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
    final ethnicWearData = Provider.of<DryCleans>(context).ethnicWear;
    final winterWearData = Provider.of<DryCleans>(context).winterWear;
    final miscellaneousData = Provider.of<DryCleans>(context).miscellaneous;
    final bagData = Provider.of<Bags>(context).bag;
    final jacketData = Provider.of<Jackets>(context).jacket;
    final dailyWearPremiumData =
        Provider.of<PremiumDryCleans>(context).dailyWear;
    final ethnicWearPremiumData =
        Provider.of<PremiumDryCleans>(context).ethnicWear;
    final winterWearPremiumData =
        Provider.of<PremiumDryCleans>(context).winterWear;
    final shoeData = Provider.of<Shoes>(context).shoe;
    final dailyWearSteamData = Provider.of<SteamIrons>(context).dailyWear;
    final ethnicWearSteamData = Provider.of<SteamIrons>(context).ethnicWear;
    final winterWearSteamData = Provider.of<SteamIrons>(context).winterWear;
    final miscellaneousSteamData =
        Provider.of<SteamIrons>(context).miscellaneous;
    final cartData = Provider.of<Cart>(context);
    List<DryClean> dryCleanData =
        dailyWearData + ethnicWearData + winterWearData + miscellaneousData;
    List<PremiumDryClean> premiumDryCleanData =
        dailyWearPremiumData + ethnicWearPremiumData + winterWearPremiumData;
    List<SteamIron> steamIronData = dailyWearSteamData +
        ethnicWearSteamData +
        winterWearSteamData +
        miscellaneousSteamData;
    print(dryCleanData.length.toString());
    print(cartData.itemCount);
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
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              Card(
                child: Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(10.0),
                    itemCount: dryCleanData.length,
                    itemBuilder: (context, index) =>
                        ChangeNotifierProvider.value(
                      value: dryCleanData[index],
                      child: Row(
                        children: [
                          Text(dryCleanData[index].name),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              cartData.addItem(
                                  dryCleanData[index].name,
                                  dryCleanData[index].price,
                                  dryCleanData[index].name);
                            },
                            icon: Icon(Icons.add),
                          ),
                          IconButton(
                            onPressed: () {
                              cartData.removeItem(dryCleanData[index].name);
                            },
                            icon: Icon(Icons.anchor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   child: Card(
              //     child: Expanded(
              //       child: ListView.builder(
              //         shrinkWrap: true,
              //         scrollDirection: Axis.vertical,
              //         padding: const EdgeInsets.all(10.0),
              //         itemCount: premiumDryCleanData.length,
              //         itemBuilder: (context, index) =>
              //             ChangeNotifierProvider.value(
              //           value: premiumDryCleanData[index],
              //           child: Row(
              //             children: [
              //               Text(premiumDryCleanData[index].name),
              //               Spacer(),
              //               IconButton(
              //                 onPressed: () {
              //                   cartData.addItem(
              //                       premiumDryCleanData[index].name,
              //                       premiumDryCleanData[index].price,
              //                       premiumDryCleanData[index].name);
              //                 },
              //                 icon: Icon(Icons.add),
              //               ),
              //               IconButton(
              //                 onPressed: () {
              //                   cartData.removeItem(
              //                       premiumDryCleanData[index].name);
              //                 },
              //                 icon: Icon(Icons.anchor),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
