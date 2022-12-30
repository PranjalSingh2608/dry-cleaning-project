import 'package:dry_cleaning/providers/premium_dry_clean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../providers/dry_clean.dart';

class OrganicDryCleanRate extends StatelessWidget {
  const OrganicDryCleanRate({super.key});

  @override
  Widget build(BuildContext context) {
    final dailyWearData = Provider.of<PremiumDryCleans>(context).dailyWear;
    final ethnicWearData = Provider.of<PremiumDryCleans>(context).ethnicWear;
    final winterWearData = Provider.of<PremiumDryCleans>(context).winterWear;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 30),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Organic Dry Cleaning Service',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 30),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Daily Wear',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.teal,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 5,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(10.0),
                      itemCount: dailyWearData.length,
                      itemBuilder: (context, index) =>
                          ChangeNotifierProvider.value(
                        value: dailyWearData[index],
                        child: Row(
                          children: [
                            Text(dailyWearData[index].name),
                            Spacer(),
                            Text(dailyWearData[index].price.toString()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 30),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Ethnic Wear',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.teal,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 5,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(10.0),
                      itemCount: ethnicWearData.length,
                      itemBuilder: (context, index) =>
                          ChangeNotifierProvider.value(
                        value: ethnicWearData[index],
                        child: Row(
                          children: [
                            Text(ethnicWearData[index].name),
                            Spacer(),
                            Text(ethnicWearData[index].price.toString()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 30),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Winter Wear',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.teal,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 5,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(10.0),
                      itemCount: winterWearData.length,
                      itemBuilder: (context, index) =>
                          ChangeNotifierProvider.value(
                        value: winterWearData[index],
                        child: Row(
                          children: [
                            Text(winterWearData[index].name),
                            Spacer(),
                            Text(winterWearData[index].price.toString()),
                          ],
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
