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
              Card(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(10.0),
                  itemCount: dailyWearData.length,
                  itemBuilder: (context, index) => ChangeNotifierProvider.value(
                    value: dailyWearData[index],
                    child: ListTile(
                      tileColor: Colors.grey,
                      title: Text(dailyWearData[index].name),
                      trailing: Text(dailyWearData[index].price.toString()),
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
