import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  elevation: 0.5,
                  child: ListTile(
                    tileColor: Colors.white,
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Profile",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                  child: Text(
                    "My account",
                    textScaleFactor: 1.6,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8, bottom: 8, top: 30),
                child: Container(
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Card(
                            color: Color.fromARGB(255, 221, 226, 249),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Column(
                                      children: [
                                        Icon(Icons.wallet),
                                        Text('Wallet'),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Column(
                                      children: [
                                        Icon(Icons.chat),
                                        Text('Support'),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Column(
                                      children: [
                                        Icon(Icons.payment),
                                        Text('Payments'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, left: 8, right: 8, bottom: 8),
                            child: Text(
                              "Your Information",
                              textScaleFactor: 1.4,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Icon(Icons.shopping_bag),
                            trailing: IconButton(
                              icon: Icon(Icons.navigate_next),
                              onPressed: () {},
                            ),
                            tileColor: Colors.white,
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Your Orders",
                                textScaleFactor: 1.2,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Icon(Icons.book),
                            trailing: IconButton(
                              icon: Icon(Icons.navigate_next),
                              onPressed: () {},
                            ),
                            tileColor: Colors.white,
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Address Book",
                                textScaleFactor: 1.2,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, left: 8, right: 8, bottom: 8),
                            child: Text(
                              "Other Information",
                              textScaleFactor: 1.4,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Icon(Icons.share),
                            trailing: IconButton(
                              icon: Icon(Icons.navigate_next),
                              onPressed: () {},
                            ),
                            tileColor: Colors.white,
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Share the app",
                                textScaleFactor: 1.2,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Icon(Icons.info),
                            trailing: IconButton(
                              icon: Icon(Icons.navigate_next),
                              onPressed: () {},
                            ),
                            tileColor: Colors.white,
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "About us",
                                textScaleFactor: 1.2,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Icon(Icons.star),
                            trailing: IconButton(
                              icon: Icon(Icons.navigate_next),
                              onPressed: () {},
                            ),
                            tileColor: Colors.white,
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Rate us",
                                textScaleFactor: 1.2,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Icon(Icons.logout),
                            trailing: IconButton(
                              icon: Icon(Icons.navigate_next),
                              onPressed: () {},
                            ),
                            tileColor: Colors.white,
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Log Out",
                                textScaleFactor: 1.2,
                              ),
                            ),
                          ),
                        ),
                      ],
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
