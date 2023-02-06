import 'package:dry_cleaning/providers/bag.dart';
import 'package:dry_cleaning/providers/shoe.dart';
import 'package:dry_cleaning/providers/steamIron.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
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
        actions: <Widget>[
          Consumer<Cart>(
              builder: (context, value, child) => WidgetBadge(
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
        physics: ScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Dry Clean',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, top: 10, right: 5, bottom: 15),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 5.0,
                  child: Expanded(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(10.0),
                      itemCount: dryCleanData.length,
                      itemBuilder: (context, index) => Container(
                        color: (index % 2 == 0)
                            ? Colors.blue.shade50
                            : Colors.white,
                        child: ChangeNotifierProvider.value(
                          value: dryCleanData[index],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(dryCleanData[index].name),
                                // Text(
                                //   '  x${dryCleanData[index].count}',
                                //   style: TextStyle(color: Colors.grey),
                                // ),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    cartData.addItem(
                                        dryCleanData[index].id,
                                        dryCleanData[index].price,
                                        dryCleanData[index].name);
                                  },
                                  icon: Icon(CupertinoIcons.add_circled),
                                ),
                                IconButton(
                                  onPressed: () {
                                    cartData.removeItem(dryCleanData[index].id);
                                  },
                                  icon: Icon(CupertinoIcons.minus_circle),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Organic Dry Clean',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, top: 10, right: 5, bottom: 15),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 5.0,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(10.0),
                    itemCount: premiumDryCleanData.length,
                    itemBuilder: (context, index) => Container(
                      color:
                          (index % 2 == 0) ? Colors.blue.shade50 : Colors.white,
                      child: ChangeNotifierProvider.value(
                        value: premiumDryCleanData[index],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(premiumDryCleanData[index].name),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  cartData.addItem(
                                      premiumDryCleanData[index].name,
                                      premiumDryCleanData[index].price,
                                      premiumDryCleanData[index].name);
                                },
                                icon: Icon(CupertinoIcons.add_circled),
                              ),
                              IconButton(
                                onPressed: () {
                                  cartData.removeItem(
                                      premiumDryCleanData[index].name);
                                },
                                icon: Icon(CupertinoIcons.minus_circle),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Steam Iron',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, top: 15, right: 5, bottom: 15),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 5.0,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(10.0),
                    itemCount: steamIronData.length,
                    itemBuilder: (context, index) => Container(
                      color:
                          (index % 2 == 0) ? Colors.blue.shade50 : Colors.white,
                      child: ChangeNotifierProvider.value(
                        value: steamIronData[index],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(steamIronData[index].name),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  cartData.addItem(
                                      steamIronData[index].name,
                                      steamIronData[index].price,
                                      steamIronData[index].name);
                                },
                                icon: Icon(CupertinoIcons.add_circled),
                              ),
                              IconButton(
                                onPressed: () {
                                  cartData.removeItem(
                                      premiumDryCleanData[index].name);
                                },
                                icon: Icon(CupertinoIcons.minus_circle),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Jackets',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, top: 15, right: 5, bottom: 15),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 5.0,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(10.0),
                    itemCount: jacketData.length,
                    itemBuilder: (context, index) => Container(
                      color:
                          (index % 2 == 0) ? Colors.blue.shade50 : Colors.white,
                      child: ChangeNotifierProvider.value(
                        value: jacketData[index],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(jacketData[index].name),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  cartData.addItem(
                                      jacketData[index].name,
                                      jacketData[index].price,
                                      jacketData[index].name);
                                },
                                icon: Icon(CupertinoIcons.add_circled),
                              ),
                              IconButton(
                                onPressed: () {
                                  cartData.removeItem(
                                      premiumDryCleanData[index].name);
                                },
                                icon: Icon(CupertinoIcons.minus_circle),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Bags',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, top: 15, right: 5, bottom: 15),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 5.0,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(10.0),
                    itemCount: bagData.length,
                    itemBuilder: (context, index) => Container(
                      color:
                          (index % 2 == 0) ? Colors.blue.shade50 : Colors.white,
                      child: ChangeNotifierProvider.value(
                        value: bagData[index],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(bagData[index].name),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  cartData.addItem(
                                      bagData[index].name,
                                      bagData[index].price,
                                      bagData[index].name);
                                },
                                icon: Icon(CupertinoIcons.add_circled),
                              ),
                              IconButton(
                                onPressed: () {
                                  cartData.removeItem(
                                      premiumDryCleanData[index].name);
                                },
                                icon: Icon(CupertinoIcons.minus_circle),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Shoes',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, top: 15, right: 5, bottom: 15),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 5.0,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(10.0),
                    itemCount: shoeData.length,
                    itemBuilder: (context, index) => Container(
                      color:
                          (index % 2 == 0) ? Colors.blue.shade50 : Colors.white,
                      child: ChangeNotifierProvider.value(
                        value: shoeData[index],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(shoeData[index].name),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  cartData.addItem(
                                      shoeData[index].name,
                                      shoeData[index].price,
                                      shoeData[index].name);
                                },
                                icon: Icon(CupertinoIcons.add_circled),
                              ),
                              IconButton(
                                onPressed: () {
                                  cartData.removeItem(
                                      premiumDryCleanData[index].name);
                                },
                                icon: Icon(CupertinoIcons.minus_circle),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
