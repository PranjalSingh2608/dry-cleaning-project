import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SpecialService extends StatelessWidget {
  const SpecialService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Specialized Services Rates',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 22,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Table(
                        defaultColumnWidth: IntrinsicColumnWidth(),
                        border: TableBorder.all(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                        children: [
                          TableRow(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 23, 101, 184)),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Curtain Wash',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Woolen Wash',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '149/Kg',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '145/kg',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Exclusive Curtain Care',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Woolen Care',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 0, 0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Taxes Extra',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Actual Delivery time may vary as per order load',
                    style: TextStyle(color: Colors.grey),
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