import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
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
              automaticallyImplyLeading: false,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.man),
              title: Text('Account'),
              onTap: () {
                Navigator.of(context).pushNamed('/profile');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Rate Card'),
              onTap: () {
                Navigator.of(context).pushNamed('/rate');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('Stores'),
              onTap: () {
                Navigator.of(context).pushNamed('/map');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text('Place an order'),
              onTap: () {
                Navigator.of(context).pushNamed('/order');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                Navigator.of(context).pop();
                Provider.of<Auth>(context).logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
