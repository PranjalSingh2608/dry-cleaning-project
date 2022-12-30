import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class RateScreen extends StatelessWidget {
  const RateScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    'Rate Card',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.teal,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  child: Lottie.asset('assets/animations/rate_animation.json',
                      alignment: Alignment.center, fit: BoxFit.cover),
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
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
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
                        "Premium DryClean",
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.navigate_next),
                        onPressed: () {
                          
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
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
