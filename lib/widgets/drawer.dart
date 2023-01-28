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
      child: Column(
        children: [
          AppBar(
            title: Text('My App'),
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
    );
  }
}
