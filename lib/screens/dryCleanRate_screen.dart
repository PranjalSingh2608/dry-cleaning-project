import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../providers/dry_clean.dart';

class DryCleanRate extends StatelessWidget {
  const DryCleanRate({super.key});

  @override
  Widget build(BuildContext context) {
    final dailyWearData = Provider.of<DryCleans>(context).dailyWear;
    final ethnicWearData = Provider.of<DryCleans>(context).ethnicWear;
    final winterWearData = Provider.of<DryCleans>(context).winterWear;
    final miscellaneousData = Provider.of<DryCleans>(context).miscellaneous;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
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
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 30),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Miscelleneous',
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
                    itemCount: miscellaneousData.length,
                    itemBuilder: (context, index) =>
                        ChangeNotifierProvider.value(
                      value: miscellaneousData[index],
                      child: Row(
                        children: [
                          Text(miscellaneousData[index].name),
                          Spacer(),
                          Text(miscellaneousData[index].price.toString()),
                        ],
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
