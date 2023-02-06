import 'package:dry_cleaning/screens/WashIronRate_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../widgets/drawer.dart';

class RateScreen extends StatelessWidget {
  const RateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate Card'),
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 250,
                  width: double.infinity,
                  child: Lottie.asset(
                      'assets/animations/ratecard_animation.json',
                      alignment: Alignment.center,
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 45),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Dry Cleaning Services',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily:
                          GoogleFonts.poppinsTextTheme().titleLarge.toString(),
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 5.0,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          "DryClean",
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.navigate_next),
                          onPressed: () {
                            Navigator.pushNamed(context, '/dryCleanRate');
                          },
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Organic DryClean",
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.navigate_next),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/organicdryCleanRate');
                          },
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Jacket/Shoe/Bag",
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.navigate_next),
                          onPressed: () {
                            Navigator.pushNamed(context, '/miscRate');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Washing Services',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily:
                          GoogleFonts.poppinsTextTheme().titleLarge.toString(),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 5.0,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          "Wash & Iron",
                          style: TextStyle(color: Colors.grey),
                        ),
                        subtitle: Text(
                          "Normal,Organic & Premium",
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.navigate_next),
                          onPressed: () {
                            Navigator.pushNamed(context, '/washIronRate');
                          },
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Wash & Fold",
                          style: TextStyle(color: Colors.grey),
                        ),
                        subtitle: Text(
                          "Normal & Organic",
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.navigate_next),
                          onPressed: () {
                            Navigator.pushNamed(context, '/washFoldRate');
                          },
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Specialized",
                          style: TextStyle(color: Colors.grey),
                        ),
                        subtitle: Text(
                          "Curtain,Woolen & UG",
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.navigate_next),
                          onPressed: () {
                            Navigator.pushNamed(context, '/specialServiceRate');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Steam Iron Services',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily:
                          GoogleFonts.poppinsTextTheme().titleLarge.toString(),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 5.0,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          "Steam Iron",
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.navigate_next),
                          onPressed: () {
                            Navigator.pushNamed(context, '/steamIronRate');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'On Site Services',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily:
                          GoogleFonts.poppinsTextTheme().titleLarge.toString(),
                          fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 5.0,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          "Carpet Cleaning",
                          style: TextStyle(color: Colors.grey),
                        ),
                        subtitle: Text(
                          "For Details click here:",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Sofa, Cushion & Mattress Cleaning",
                          style: TextStyle(color: Colors.grey),
                        ),
                        subtitle: Text(
                          "For Details click here:",
                          style: TextStyle(color: Colors.grey),
                        ),
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
